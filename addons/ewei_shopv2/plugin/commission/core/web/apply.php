<?php

if (!defined('IN_IA')) {
	exit('Access Denied');
}

class Apply_EweiShopV2Page extends PluginWebPage
{
	public function main()
	{
		global $_W;
		global $_GPC;
		$status = intval($_GPC['status']);
		empty($status) && ($status = 1);

		if ($status == -1) {
			if (!cv('commission.apply.view_1')) {
				$this->message('你没有相应的权限查看');
			}
		}
		else {
			if (!cv('commission.apply.view' . $status)) {
				$this->message('你没有相应的权限查看');
			}
		}

		$agentlevels = $this->model->getLevels();
		$level = $this->set['level'];
		$pindex = max(1, intval($_GPC['page']));
		$psize = 20;
		$condition = ' and a.uniacid=:uniacid and a.status=:status';
		$params = array(':uniacid' => $_W['uniacid'], ':status' => $status);
		$searchfield = strtolower(trim($_GPC['searchfield']));
		$keyword = trim($_GPC['keyword']);
		if (!empty($searchfield) && !empty($keyword)) {
			if ($searchfield == 'applyno') {
				$condition .= ' and a.applyno like :keyword';
			}
			else {
				if ($searchfield == 'member') {
					$condition .= ' and (m.realname like :keyword or m.nickname like :keyword or m.mobile like :keyword)';
				}
			}

			$params[':keyword'] = '%' . $keyword . '%';
		}

		if (empty($starttime) || empty($endtime)) {
			$starttime = strtotime('-1 month');
			$endtime = time();
		}

		$timetype = $_GPC['timetype'];

		if (!empty($_GPC['timetype'])) {
			$starttime = strtotime($_GPC['time']['start']);
			$endtime = strtotime($_GPC['time']['end']);

			if (!empty($timetype)) {
				$condition .= ' AND a.' . $timetype . ' >= :starttime AND a.' . $timetype . '  <= :endtime ';
				$params[':starttime'] = $starttime;
				$params[':endtime'] = $endtime;
			}
		}

		if (!empty($_GPC['agentlevel'])) {
			$condition .= ' and m.agentlevel=' . intval($_GPC['agentlevel']);
		}

		if (3 <= $status) {
			$orderby = 'paytime';
		}
		else if (2 <= $status) {
			$orderby = ' checktime';
		}
		else {
			$orderby = 'applytime';
		}

		$applytitle = '';

		if ($status == 1) {
			$applytitle = '待审核';
		}
		else if ($status == 2) {
			$applytitle = '待打款';
		}
		else if ($status == 3) {
			$applytitle = '已打款';
		}
		else {
			if ($status == -1) {
				$applytitle = '已无效';
			}
		}

		$sql = 'select a.*, m.nickname,m.avatar,m.realname,m.mobile,l.levelname from ' . tablename('ewei_shop_commission_apply') . ' a ' . ' left join ' . tablename('ewei_shop_member') . ' m on m.id = a.mid' . ' left join ' . tablename('ewei_shop_commission_level') . ' l on l.id = m.agentlevel' . ' where 1 ' . $condition . ' ORDER BY ' . $orderby . ' desc ';

		if (empty($_GPC['export'])) {
			$sql .= '  limit ' . (($pindex - 1) * $psize) . ',' . $psize;
		}

		$list = pdo_fetchall($sql, $params);

		foreach ($list as &$row) {
			$row['levelname'] = empty($row['levelname']) ? (empty($this->set['levelname']) ? '普通等级' : $this->set['levelname']) : $row['levelname'];
			$row['typestr'] = empty($row['type']) ? '余额' : '微信';
		}

		unset($row);

		if ($_GPC['export'] == '1') {
			ca('commission.apply.export' . $status);
			plog('commission.apply.export' . $status, '导出数据');

			foreach ($list as &$row) {
				$row['applytime'] = (1 <= $status) || ($status == -1) ? date('Y-m-d H:i', $row['applytime']) : '--';
				$row['checktime'] = 2 <= $status ? date('Y-m-d H:i', $row['checktime']) : '--';
				$row['paytime'] = 3 <= $status ? date('Y-m-d H:i', $row['paytime']) : '--';
				$row['invalidtime'] = $status == -1 ? date('Y-m-d H:i', $row['invalidtime']) : '--';
			}

			unset($row);
			$totalcommission = 0;
			$totalpay = 0;
			$rowcount = 0;
			$ordercount = 0;
			$goodscount = 0;
			$lastgoodscount = 0;

			foreach ($list as &$row) {
				$orderids = iunserializer($row['orderids']);
				if (!is_array($orderids) || (count($orderids) <= 0)) {
					continue;
				}

				$ids = array();

				foreach ($orderids as $o) {
					$ids[] = $o['orderid'];
				}

				$orders = pdo_fetchall('select id,agentid, ordersn,price,goodsprice,dispatchprice,createtime, paytype from ' . tablename('ewei_shop_order') . ' where  id in ( ' . implode(',', $ids) . ' );');
				$totalcommission = 0;
				$totalpay = 0;
				$ordergoodscount = 0;

				foreach ($orders as &$order) {
					foreach ($orderids as $o) {
						if ($o['orderid'] == $order['id']) {
							$order['level'] = $o['level'];
							break;
						}
					}

					$order['levelstr'] = '一级';

					if ($order['level'] == 2) {
						$order['levelstr'] = '二级';
					}
					else {
						if ($order['level'] == 3) {
							$order['levelstr'] = '三级';
						}
					}

					$goods = pdo_fetchall('SELECT og.id,g.thumb,og.price,og.realprice, og.total,g.title,o.paytype,og.optionname,og.commission1,og.commission2,og.commission3,og.commissions,og.status1,og.status2,og.status3,og.content1,og.content2,og.content3 from ' . tablename('ewei_shop_order_goods') . ' og' . ' left join ' . tablename('ewei_shop_goods') . ' g on g.id=og.goodsid  ' . ' left join ' . tablename('ewei_shop_order') . ' o on o.id=og.orderid  ' . ' where og.uniacid = :uniacid and og.orderid=:orderid and og.nocommission=0 order by og.createtime  desc ', array(':uniacid' => $_W['uniacid'], ':orderid' => $order['id']));

					foreach ($goods as $gindex => &$g) {
						$commissions = iunserializer($g['commissions']);

						if (1 <= $this->set['level']) {
							$commission = iunserializer($g['commission1']);

							if (empty($commissions)) {
								$g['commission1'] = isset($commission['level' . $agentLevel['id']]) ? $commission['level' . $agentLevel['id']] : $commission['default'];
							}
							else {
								$g['commission1'] = isset($commissions['level1']) ? floatval($commissions['level1']) : 0;
							}

							if ($order['level'] == 1) {
								$totalcommission += $g['commission1'];

								if ($g['status1'] == 3) {
									$totalpay += $g['commission1'];
									$g['cstatus'] = '已打款';
								}
								else if ($g['status1'] == 2) {
									$g['cstatus'] = '待打款';
								}
								else if ($g['status1'] == 0) {
									$g['cstatus'] = '未审核';
								}
								else {
									if ($g['status1'] == -1) {
										$g['cstatus'] = '未通过';
									}
								}

								$g['ccontent'] = $g['content1'];
								$g['ccommission'] = $g['commission1'];
							}
						}

						if (2 <= $this->set['level']) {
							$commission = iunserializer($g['commission2']);

							if (empty($commissions)) {
								$g['commission2'] = isset($commission['level' . $agentLevel['id']]) ? $commission['level' . $agentLevel['id']] : $commission['default'];
							}
							else {
								$g['commission2'] = isset($commissions['level2']) ? floatval($commissions['level2']) : 0;
							}

							if ($order['level'] == 2) {
								$totalcommission += $g['commission2'];

								if ($g['status2'] == 3) {
									$totalpay += $g['commission2'];
									$g['cstatus'] = '已打款';
								}
								else if ($g['status2'] == 2) {
									$g['cstatus'] = '待打款';
								}
								else if ($g['status2'] == 0) {
									$g['cstatus'] = '未审核';
								}
								else {
									if ($g['status2'] == -1) {
										$g['cstatus'] = '未通过';
									}
								}

								$g['ccontent'] = $g['content2'];
								$g['ccommission'] = $g['commission2'];
							}
						}

						if (3 <= $this->set['level']) {
							$commission = iunserializer($g['commission3']);

							if (empty($commissions)) {
								$g['commission3'] = isset($commission['level' . $agentLevel['id']]) ? $commission['level' . $agentLevel['id']] : $commission['default'];
							}
							else {
								$g['commission3'] = isset($commissions['level3']) ? floatval($commissions['level3']) : 0;
							}

							if ($order['level'] == 3) {
								$totalcommission += $g['commission3'];

								if ($g['status3'] == 3) {
									$totalpay += $g['commission3'];
									$g['cstatus'] = '已打款';
								}
								else if ($g['status3'] == 2) {
									$g['cstatus'] = '待打款';
								}
								else if ($g['status3'] == 0) {
									$g['cstatus'] = '未审核';
								}
								else {
									if ($g['status3'] == -1) {
										$g['cstatus'] = '未通过';
									}
								}

								$g['ccontent'] = $g['content3'];
								$g['ccommission'] = $g['commission3'];
							}
						}

						$g['level'] = $row['level'];
					}

					unset($g);
					$order['goods'] = $goods;
					$order['goodscount'] = count($goods);
					$ordergoodscount += $order['goodscount'];
					$goodscount += $order['goodscount'];
					$rowcount += $order['goodscount'];
				}

				unset($order);
				$row['orders'] = $orders;
				$row['goodscount'] = $ordergoodscount;
				$lastgoodscount += $ordergoodscount;
				$row['lastgoodscount'] = $lastgoodscount;
			}

			unset($row);
			$exportlist = array();
			$i = 0;

			while ($i < $rowcount) {
				$exportlist['row' . $i] = array();
				++$i;
			}

			$rowindex = 0;
			$len = count($list);

			foreach ($list as $index => $row) {
				$exportlist['row' . $rowindex] = $row;
				$orderindex = $rowindex;

				foreach ($row['orders'] as $order) {
					$exportlist['row' . $orderindex]['ordersn'] = $order['ordersn'];
					$exportlist['row' . $orderindex]['price'] = $order['price'];
					$exportlist['row' . $orderindex]['level'] = $order['levelstr'];
					$goodsindex = $orderindex;

					foreach ($order['goods'] as $g) {
						$exportlist['row' . $goodsindex]['title'] = $g['title'];
						$exportlist['row' . $goodsindex]['total'] = $g['total'];
						$exportlist['row' . $goodsindex]['realprice'] = $g['realprice'];
						$exportlist['row' . $goodsindex]['cstatus'] = $g['cstatus'];
						$exportlist['row' . $goodsindex]['ccommission'] = $g['ccommission'];
						++$goodsindex;
					}

					$orderindex += $order['goodscount'];
				}

				$nextindex = 0;
				$i = 0;

				while ($i <= $index) {
					$nextindex += $list[$i]['goodscount'];
					++$i;
				}

				$rowindex = $nextindex;
			}

			m('excel')->export($exportlist, array(
	'title'   => $title . '佣金申请数据-' . date('Y-m-d-H-i', time()),
	'columns' => array(
		array('title' => 'ID', 'field' => 'id', 'width' => 12),
		array('title' => '提现单号', 'field' => 'applyno', 'width' => 24),
		array('title' => '粉丝', 'field' => 'nickname', 'width' => 12),
		array('title' => '姓名', 'field' => 'realname', 'width' => 12),
		array('title' => '手机号码', 'field' => 'mobile', 'width' => 12),
		array('title' => '订单号', 'field' => 'ordersn', 'width' => 24),
		array('title' => '订单金额', 'field' => 'price', 'width' => 12),
		array('title' => '订单级别', 'field' => 'level', 'width' => 12),
		array('title' => '商品', 'field' => 'title', 'width' => 24),
		array('title' => '数量', 'field' => 'total', 'width' => 12),
		array('title' => '价格', 'field' => 'realprice', 'width' => 12),
		array('title' => '状态', 'field' => 'cstatus', 'width' => 12),
		array('title' => '商品佣金', 'field' => 'ccommission', 'width' => 12),
		array('title' => '提现方式', 'field' => 'typestr', 'width' => 12),
		array('title' => '申请时间', 'field' => 'applytime', 'width' => 24),
		array('title' => '审核时间', 'field' => 'checktime', 'width' => 24),
		array('title' => '打款时间', 'field' => 'paytime', 'width' => 24),
		array('title' => '设置无效时间', 'field' => 'invalidtime', 'width' => 24)
		)
	));
		}

		$total = pdo_fetchcolumn('select count(a.id) from' . tablename('ewei_shop_commission_apply') . ' a ' . ' left join ' . tablename('ewei_shop_member') . ' m on m.uid = a.mid' . ' left join ' . tablename('ewei_shop_commission_level') . ' l on l.id = m.agentlevel' . ' where 1 ' . $condition, $params);
		$pager = pagination($total, $pindex, $psize);
		include $this->template();
	}

	protected function applyData()
	{
		global $_W;
		global $_GPC;
		$id = intval($_GPC['id']);
		$apply = pdo_fetch('select * from ' . tablename('ewei_shop_commission_apply') . ' where uniacid=:uniacid and id=:id limit 1', array(':uniacid' => $_W['uniacid'], ':id' => $id));

		if (empty($apply)) {
			if ($_W['isajax']) {
				show_json(0, '提现申请不存在!');
			}

			$this->message('提现申请不存在!', '', 'error');
		}

		$status = intval($_GPC['status']);
		empty($status) && ($status = 1);

		if ($apply['status'] == -1) {
			ca('commission.apply.view_1');
		}
		else {
			ca('commission.apply.view' . $apply['status']);
		}

		$agentid = $apply['mid'];
		$member = $this->model->getInfo($agentid, array('total', 'ok', 'apply', 'lock', 'check'));
		$hasagent = 0 < $member['agentcount'];
		$agentLevel = $this->model->getLevel($apply['mid']);

		if (empty($agentLevel['id'])) {
			$agentLevel = array('levelname' => empty($this->set['levelname']) ? '普通等级' : $this->set['levelname'], 'commission1' => $this->set['commission1'], 'commission2' => $this->set['commission2'], 'commission3' => $this->set['commission3']);
		}

		$orderids = iunserializer($apply['orderids']);
		if (!is_array($orderids) || (count($orderids) <= 0)) {
			$this->message('无任何订单，无法查看!', '', 'error');
		}

		$ids = array();

		foreach ($orderids as $o) {
			$ids[] = $o['orderid'];
		}

		$list = pdo_fetchall('select id,agentid, ordersn,price,goodsprice, dispatchprice,createtime, paytype from ' . tablename('ewei_shop_order') . ' where  id in ( ' . implode(',', $ids) . ' );');
		$totalcommission = 0;
		$totalpay = 0;

		foreach ($list as &$row) {
			foreach ($orderids as $o) {
				if ($o['orderid'] == $row['id']) {
					$row['level'] = $o['level'];
					break;
				}
			}

			$goods = pdo_fetchall('SELECT og.id,g.thumb,og.price,og.realprice, og.total,g.title,o.paytype,og.optionname,og.commission1,og.commission2,og.commission3,og.commissions,og.status1,og.status2,og.status3,og.content1,og.content2,og.content3 from ' . tablename('ewei_shop_order_goods') . ' og' . ' left join ' . tablename('ewei_shop_goods') . ' g on g.id=og.goodsid  ' . ' left join ' . tablename('ewei_shop_order') . ' o on o.id=og.orderid  ' . ' where og.uniacid = :uniacid and og.orderid=:orderid and og.nocommission=0 order by og.createtime  desc ', array(':uniacid' => $_W['uniacid'], ':orderid' => $row['id']));

			foreach ($goods as &$g) {
				$commissions = iunserializer($g['commissions']);

				if (1 <= $this->set['level']) {
					$commission = iunserializer($g['commission1']);

					if (empty($commissions)) {
						$g['commission1'] = isset($commission['level' . $agentLevel['id']]) ? $commission['level' . $agentLevel['id']] : $commission['default'];
					}
					else {
						$g['commission1'] = isset($commissions['level1']) ? floatval($commissions['level1']) : 0;
					}

					if ($row['level'] == 1) {
						$totalcommission += $g['commission1'];

						if (2 <= $g['status1']) {
							$totalpay += $g['commission1'];
						}
					}
				}

				if (2 <= $this->set['level']) {
					$commission = iunserializer($g['commission2']);

					if (empty($commissions)) {
						$g['commission2'] = isset($commission['level' . $agentLevel['id']]) ? $commission['level' . $agentLevel['id']] : $commission['default'];
					}
					else {
						$g['commission2'] = isset($commissions['level2']) ? floatval($commissions['level2']) : 0;
					}

					if ($row['level'] == 2) {
						$totalcommission += $g['commission2'];

						if (2 <= $g['status2']) {
							$totalpay += $g['commission2'];
						}
					}
				}

				if (3 <= $this->set['level']) {
					$commission = iunserializer($g['commission3']);

					if (empty($commissions)) {
						$g['commission3'] = isset($commission['level' . $agentLevel['id']]) ? $commission['level' . $agentLevel['id']] : $commission['default'];
					}
					else {
						$g['commission3'] = isset($commissions['level3']) ? floatval($commissions['level3']) : 0;
					}

					if ($row['level'] == 3) {
						$totalcommission += $g['commission3'];

						if (2 <= $g['status3']) {
							$totalpay += $g['commission3'];
						}
					}
				}

				$g['level'] = $row['level'];
			}

			unset($g);
			$row['goods'] = $goods;
			$totalmoney += $row['price'];
		}

		unset($row);
		$totalcount = $total = pdo_fetchcolumn('select count(*) from ' . tablename('ewei_shop_order') . ' o ' . ' left join ' . tablename('ewei_shop_member') . ' m on o.openid = m.openid ' . ' left join ' . tablename('ewei_shop_member_address') . ' a on a.id = o.addressid ' . ' where o.id in ( ' . implode(',', $ids) . ' );');
		$set_array = array();
		$set_array['charge'] = $apply['charge'];
		$set_array['begin'] = $apply['beginmoney'];
		$set_array['end'] = $apply['endmoney'];
		$realmoney = $totalpay;
		$deductionmoney = 0;

		if (!empty($set_array['charge'])) {
			$money_array = m('member')->getCalculateMoney($totalpay, $set_array);

			if ($money_array['flag']) {
				$realmoney = $money_array['realmoney'];
				$deductionmoney = $money_array['deductionmoney'];
			}
		}

		return array('id' => $id, 'status' => $status, 'apply' => $apply, 'list' => $list, 'totalcount' => $totalcount, 'totalmoney' => $totalmoney, 'member' => $member, 'totalpay' => $totalpay, 'totalcommission' => $totalcommission, 'realmoney' => $realmoney, 'deductionmoney' => $deductionmoney, 'charge' => $set_array['charge'], 'agentLevel' => $agentLevel, 'set_array' => $set_array);
	}

	public function detail()
	{
		global $_W;
		global $_GPC;
		$applyData = $this->applyData();
		extract($applyData);
		include $this->template();
	}

	public function check()
	{
		global $_W;
		global $_GPC;
		$applyData = $this->applyData();
		extract($applyData);
		$paycommission = 0;
		$ogids = array();

		foreach ($list as $row) {
			$goods = pdo_fetchall('SELECT id from ' . tablename('ewei_shop_order_goods') . ' where uniacid = :uniacid and orderid=:orderid and nocommission=0', array(':uniacid' => $_W['uniacid'], ':orderid' => $row['id']));

			foreach ($goods as $g) {
				$ogids[] = $g['id'];
			}
		}

		if (!is_array($ogids)) {
			show_json(0, '数据出错，请重新设置!');
		}

		$time = time();
		$isAllUncheck = true;

		foreach ($ogids as $ogid) {
			$g = pdo_fetch('SELECT total, commission1,commission2,commission3,commissions from ' . tablename('ewei_shop_order_goods') . '  ' . 'where id=:id and uniacid = :uniacid limit 1', array(':uniacid' => $_W['uniacid'], ':id' => $ogid));

			if (empty($g)) {
				continue;
			}

			$commissions = iunserializer($g['commissions']);

			if (1 <= $this->set['level']) {
				$commission = iunserializer($g['commission1']);

				if (empty($commissions)) {
					$g['commission1'] = isset($commission['level' . $agentLevel['id']]) ? $commission['level' . $agentLevel['id']] : $commission['default'];
				}
				else {
					$g['commission1'] = isset($commissions['level1']) ? floatval($commissions['level1']) : 0;
				}
			}

			if (2 <= $this->set['level']) {
				$commission = iunserializer($g['commission2']);

				if (empty($commissions)) {
					$g['commission2'] = isset($commission['level' . $agentLevel['id']]) ? $commission['level' . $agentLevel['id']] : $commission['default'];
				}
				else {
					$g['commission2'] = isset($commissions['level2']) ? floatval($commissions['level2']) : 0;
				}
			}

			if (3 <= $this->set['level']) {
				$commission = iunserializer($g['commission3']);

				if (empty($commissions)) {
					$g['commission3'] = isset($commission['level' . $agentLevel['id']]) ? $commission['level' . $agentLevel['id']] : $commission['default'];
				}
				else {
					$g['commission3'] = isset($commissions['level3']) ? floatval($commissions['level3']) : 0;
				}
			}

			$update = array();

			if (isset($_GPC['status1'][$ogid])) {
				if (intval($_GPC['status1'][$ogid]) == 2) {
					$paycommission += $g['commission1'];
					$isAllUncheck = false;
				}

				$update = array('checktime1' => $time, 'status1' => intval($_GPC['status1'][$ogid]), 'content1' => $_GPC['content1'][$ogid]);
			}
			else if (isset($_GPC['status2'][$ogid])) {
				if (intval($_GPC['status2'][$ogid]) == 2) {
					$paycommission += $g['commission2'];
					$isAllUncheck = false;
				}

				$update = array('checktime2' => $time, 'status2' => intval($_GPC['status2'][$ogid]), 'content2' => $_GPC['content2'][$ogid]);
			}
			else {
				if (isset($_GPC['status3'][$ogid])) {
					if (intval($_GPC['status3'][$ogid]) == 2) {
						$paycommission += $g['commission3'];
						$isAllUncheck = false;
					}

					$update = array('checktime3' => $time, 'status3' => intval($_GPC['status3'][$ogid]), 'content3' => $_GPC['content3'][$ogid]);
				}
			}

			if (!empty($update)) {
				pdo_update('ewei_shop_order_goods', $update, array('id' => $ogid));
			}
		}

		if ($isAllUncheck) {
			pdo_update('ewei_shop_commission_apply', array('status' => -1, 'invalidtime' => $time), array('id' => $id, 'uniacid' => $_W['uniacid']));
		}
		else {
			pdo_update('ewei_shop_commission_apply', array('status' => 2, 'checktime' => $time), array('id' => $id, 'uniacid' => $_W['uniacid']));
			$rmoney = $paycommission;
			$dmoney = 0;

			if (!empty($set_array['charge'])) {
				$m_array = m('member')->getCalculateMoney($paycommission, $set_array);

				if ($m_array['flag']) {
					$rmoney = $m_array['realmoney'];
					$dmoney = $m_array['deductionmoney'];
				}
			}

			$mcommission = $paycommission;

			if (!empty($dmoney)) {
				$mcommission .= ',实际到账金额:' . $rmoney . ',个人所得税金额:' . $dmoney;
			}

			$this->model->sendMessage($member['openid'], array('commission' => $mcommission, 'type' => $apply['type'] == 1 ? '微信' : '余额'), TM_COMMISSION_CHECK);
		}

		plog('commission.apply.check', '佣金审核 ID: ' . $id . ' 申请编号: ' . $apply['applyno'] . ' 总佣金: ' . $totalmoney . ' 审核通过佣金: ' . $paycommission . ' ');
		show_json(1, array('url' => webUrl('commission/apply', array('status' => $apply['status']))));
	}

	public function cancel()
	{
		global $_W;
		global $_GPC;
		$applyData = $this->applyData();
		extract($applyData);
		$time = time();

		foreach ($list as $row) {
			$update = array();

			foreach ($row['goods'] as $g) {
				$update = array();

				if ($row['level'] == 1) {
					$update = array('checktime1' => 0, 'status1' => 1);
				}
				else if ($row['level'] == 2) {
					$update = array('checktime2' => 0, 'status2' => 1);
				}
				else {
					if ($row['level'] == 3) {
						$update = array('checktime3' => 0, 'status3' => 1);
					}
				}

				if (!empty($update)) {
					pdo_update('ewei_shop_order_goods', $update, array('id' => $g['id']));
				}
			}
		}

		pdo_update('ewei_shop_commission_apply', array('status' => 1, 'checktime' => 0, 'invalidtime' => 0), array('id' => $id, 'uniacid' => $_W['uniacid']));
		plog('commission.apply.cancel', '重新审核申请 ID: ' . $id . ' 申请编号: ' . $apply['applyno'] . ' ');
		show_json(1, array('url' => webUrl('commission/apply', array('status' => 1))));
	}

	public function refuse()
	{
		global $_W;
		global $_GPC;
		$applyData = $this->applyData();
		extract($applyData);
		$time = time();

		foreach ($list as $row) {
			$update = array();

			foreach ($row['goods'] as $g) {
				$update = array();

				if ($row['level'] == 1) {
					$update = array('checktime1' => 0, 'status1' => 0);
				}
				else if ($row['level'] == 2) {
					$update = array('checktime2' => 0, 'status2' => 0);
				}
				else {
					if ($row['level'] == 3) {
						$update = array('checktime3' => 0, 'status3' => 0);
					}
				}

				if (!empty($update)) {
					pdo_update('ewei_shop_order_goods', $update, array('id' => $g['id']));
				}
			}
		}

		pdo_update('ewei_shop_commission_apply', array('status' => -2, 'checktime' => 0, 'invalidtime' => 0, 'refusetime' => time()), array('id' => $id, 'uniacid' => $_W['uniacid']));
		plog('commission.apply.refuse', '驳回申请 ID: ' . $id . ' 申请编号: ' . $apply['applyno'] . ' ');
		show_json(1, array('url' => webUrl('commission/apply', array('status' => 0))));
	}

	public function pay($params = array(), $mine = array())
	{
		global $_W;
		global $_GPC;
		$applyData = $this->applyData();
		extract($applyData);
		$time = time();
		$pay = $realmoney;

		if ($apply['type'] == 1) {
			$pay *= 100;
		}

		$updateno['applyno'] = $apply['applyno'] = m('common')->createNO('commission_apply', 'applyno', 'CA');
		pdo_update('ewei_shop_commission_apply', $updateno, array('id' => $apply['id']));
		$result = m('finance')->pay($member['openid'], $apply['type'], $pay, $apply['applyno']);

		if (is_error($result)) {
			show_json(0, $result['message']);
		}

		foreach ($list as $row) {
			$update = array();

			foreach ($row['goods'] as $g) {
				$update = array();
				if (($row['level'] == 1) && ($g['status1'] == 2)) {
					$update = array('paytime1' => $time, 'status1' => 3);
				}
				else {
					if (($row['level'] == 2) && ($g['status2'] == 2)) {
						$update = array('paytime2' => $time, 'status2' => 3);
					}
					else {
						if (($row['level'] == 3) && ($g['status3'] == 2)) {
							$update = array('paytime3' => $time, 'status3' => 3);
						}
					}
				}

				if (!empty($update)) {
					pdo_update('ewei_shop_order_goods', $update, array('id' => $g['id']));
				}
			}
		}

		pdo_update('ewei_shop_commission_apply', array('status' => 3, 'paytime' => $time, 'commission_pay' => $totalpay, 'realmoney' => $realmoney, 'deductionmoney' => $deductionmoney), array('id' => $id, 'uniacid' => $_W['uniacid']));
		$log = array('uniacid' => $_W['uniacid'], 'applyid' => $apply['id'], 'mid' => $member['id'], 'commission' => $totalcommission, 'commission_pay' => $totalpay, 'realmoney' => $realmoney, 'deductionmoney' => $deductionmoney, 'charge' => $charge, 'createtime' => $time);
		pdo_insert('ewei_shop_commission_log', $log);
		$mcommission = $totalpay;

		if (!empty($deductionmoney)) {
			$mcommission .= ',实际到账金额:' . $realmoney . ',个人所得税金额:' . $deductionmoney;
		}

		$this->model->sendMessage($member['openid'], array('commission' => $mcommission, 'type' => $apply['type'] == 1 ? '微信' : '余额'), TM_COMMISSION_PAY);
		$this->model->upgradeLevelByCommissionOK($member['openid']);
		plog('commission.apply.pay', '佣金打款 ID: ' . $id . ' 申请编号: ' . $apply['applyno'] . ' 总佣金: ' . $totalcommission . ' 审核通过佣金: ' . $totalpay . ' 实际到账金额: ' . $realmoney . ' 个人所得税金额: ' . $deductionmoney . ' 个人所得税税率: ' . $charge . '%');
		show_json(1, array('url' => webUrl('commission/apply', array('status' => $apply['status']))));
	}

	public function changecommission()
	{
		global $_W;
		global $_GPC;
		$id = intval($_GPC['id']);
		$set = $this->set;
		$order = pdo_fetch('select * from ' . tablename('ewei_shop_order') . ' where id=:id and uniacid=:uniacid limit 1', array(':id' => $id, ':uniacid' => $_W['uniacid']));

		if (empty($order)) {
			if ($_W['ispost']) {
				show_json(0, array('message' => '未找到订单!'));
			}

			exit('fail');
		}

		$member = m('member')->getMember($order['openid']);
		$agentid = $order['agentid'];
		$agentLevel = $this->model->getLevel($agentid);
		$ogid = intval($_GPC['ogid']);
		$order_goods_change = pdo_fetchall('select og.id,g.title,g.thumb,g.goodssn,og.goodssn as option_goodssn, g.productsn,og.productsn as option_productsn, og.total,og.price,og.optionname as optiontitle, og.realprice,og.oldprice,og.commission1,og.commission2,og.commission3,og.commissions,og.status1,og.status2,og.status3 from ' . tablename('ewei_shop_order_goods') . ' og ' . ' left join ' . tablename('ewei_shop_goods') . ' g on g.id=og.goodsid ' . ' where og.uniacid=:uniacid and og.orderid=:orderid ', array(':uniacid' => $_W['uniacid'], ':orderid' => $id));

		if (empty($order_goods_change)) {
			if ($_W['ispost']) {
				show_json(0, array('message' => '未找到订单商品，无法修改佣金!'));
			}

			exit('fail');
		}

		if ($_W['ispost']) {
			$cm1 = $_GPC['cm1'];
			$cm2 = $_GPC['cm2'];
			$cm3 = $_GPC['cm3'];
			if (!is_array($cm1) && !is_array($cm2) && !is_array($cm3)) {
				show_json(0, array('message' => '未找到修改数据!'));
			}

			foreach ($order_goods_change as $og) {
				$commissions = iunserializer($og['commissions']);
				$commissions['level1'] = isset($cm1[$og['id']]) ? round($cm1[$og['id']], 2) : $commissions['level1'];
				$commissions['level2'] = isset($cm2[$og['id']]) ? round($cm2[$og['id']], 2) : $commissions['level3'];
				$commissions['level3'] = isset($cm3[$og['id']]) ? round($cm3[$og['id']], 2) : $commissions['level2'];
				pdo_update('ewei_shop_order_goods', array('commissions' => iserializer($commissions)), array('id' => $og['id']));
			}

			plog('commission.changecommission', '修改佣金 订单号: ' . $order['ordersn']);
			show_json(1, array('url' => referer()));
		}

		$cm1 = m('member')->getMember($agentid);

		if (!empty($cm1['agentid'])) {
			$cm2 = m('member')->getMember($cm1['agentid']);

			if (!empty($cm2['agentid'])) {
				$cm3 = m('member')->getMember($cm2['agentid']);
			}
		}

		foreach ($order_goods_change as &$og) {
			$commissions = iunserializer($og['commissions']);

			if (1 <= $set['level']) {
				$commission = iunserializer($og['commission1']);

				if (empty($commissions)) {
					$og['c1'] = isset($commission['level' . $agentLevel['id']]) ? $commission['level' . $agentLevel['id']] : $commission['default'];
				}
				else {
					$og['c1'] = isset($commissions['level1']) ? floatval($commissions['level1']) : 0;
				}
			}

			if (2 <= $set['level']) {
				$commission = iunserializer($og['commission2']);

				if (empty($commissions)) {
					$og['c2'] = isset($commission['level' . $agentLevel['id']]) ? $commission['level' . $agentLevel['id']] : $commission['default'];
				}
				else {
					$og['c2'] = isset($commissions['level2']) ? floatval($commissions['level2']) : 0;
				}
			}

			if (3 <= $set['level']) {
				$commission = iunserializer($og['commission3']);

				if (empty($commissions)) {
					$og['c3'] = isset($commission['level' . $agentLevel['id']]) ? $commission['level' . $agentLevel['id']] : $commission['default'];
				}
				else {
					$og['c3'] = isset($commissions['level3']) ? floatval($commissions['level3']) : 0;
				}
			}

			$og['co'] = $this->model->getOrderCommissions($id, $og['id']);
		}

		unset($og);
		include $this->template();
	}
}

?>
