<?php

class Finance_EweiShopV2Model
{
	public function pay($openid = '', $paytype = 0, $money = 0, $trade_no = '', $desc = '', $return = true)
	{
		global $_W;
		global $_GPC;

		if (empty($openid)) {
			return error(-1, 'openid不能为空');
		}

		$member = m('member')->getMember($openid);

		if (empty($member)) {
			return error(-1, '未找到用户');
		}

		if (empty($paytype)) {
			m('member')->setCredit($openid, 'credit2', $money, array(0, $desc));
			return true;
		}

		$setting = uni_setting($_W['uniacid'], array('payment'));

		if (!is_array($setting['payment'])) {
			return error(1, '没有设定支付参数');
		}

		$pay = m('common')->getSysset('pay');
		$wechat = $setting['payment']['wechat'];
		$sql = 'SELECT `key`,`secret` FROM ' . tablename('account_wechats') . ' WHERE `uniacid`=:uniacid limit 1';
		$row = pdo_fetch($sql, array(':uniacid' => $_W['uniacid']));
		$url = 'https://api.mch.weixin.qq.com/mmpaymkttransfers/promotion/transfers';
		$pars = array();
		$pars['mch_appid'] = $row['key'];
		$pars['mchid'] = $wechat['mchid'];
		$pars['nonce_str'] = random(32);
		$pars['partner_trade_no'] = empty($trade_no) ? time() . random(4, true) : $trade_no;
		$pars['openid'] = $openid;
		$pars['check_name'] = 'NO_CHECK';
		$pars['amount'] = $money;
		$pars['desc'] = empty($desc) ? '佣金提现' : $desc;
		$pars['spbill_create_ip'] = gethostbyname($_SERVER['HTTP_HOST']);
		ksort($pars, SORT_STRING);
		$string1 = '';

		foreach ($pars as $k => $v) {
			$string1 .= $k . '=' . $v . '&';
		}

		$string1 .= 'key=' . $wechat['apikey'];
		$pars['sign'] = strtoupper(md5($string1));
		$xml = array2xml($pars);
		$extras = array();
		$sec = m('common')->getSec();
		$certs = iunserializer($sec['sec']);
		$errmsg = '未上传完整的微信支付证书，请到【系统设置】->【支付方式】中上传!';

		if (is_array($certs)) {
			if (empty($certs['cert']) || empty($certs['key']) || empty($certs['root'])) {
				if ($return) {
					if ($_W['ispost']) {
						show_json(0, array('message' => $errmsg));
					}

					show_message($errmsg, '', 'error');
				}
				else {
					return error(-1, $errmsg);
				}
			}

			$certfile = IA_ROOT . '/addons/ewei_shopv2/cert/' . random(128);
			file_put_contents($certfile, $certs['cert']);
			$keyfile = IA_ROOT . '/addons/ewei_shopv2/cert/' . random(128);
			file_put_contents($keyfile, $certs['key']);
			$rootfile = IA_ROOT . '/addons/ewei_shopv2/cert/' . random(128);
			file_put_contents($rootfile, $certs['root']);
			$extras['CURLOPT_SSLCERT'] = $certfile;
			$extras['CURLOPT_SSLKEY'] = $keyfile;
			$extras['CURLOPT_CAINFO'] = $rootfile;
		}
		else if ($return) {
			if ($_W['ispost']) {
				show_json(0, array('message' => $errmsg));
			}

			show_message($errmsg, '', 'error');
		}
		else {
			return error(-1, $errmsg);
		}

		load()->func('communication');
		$resp = ihttp_request($url, $xml, $extras);
		@unlink($certfile);
		@unlink($keyfile);
		@unlink($rootfile);

		if (is_error($resp)) {
			return error(-2, $resp['message']);
		}

		if (empty($resp['content'])) {
			return error(-2, '网络错误');
		}

		$arr = json_decode(json_encode((array) simplexml_load_string($resp['content'])), true);
		$xml = '<?xml version="1.0" encoding="utf-8"?>' . $resp['content'];
		$dom = new DOMDocument();

		if ($dom->loadXML($xml)) {
			$xpath = new DOMXPath($dom);
			$code = $xpath->evaluate('string(//xml/return_code)');
			$ret = $xpath->evaluate('string(//xml/result_code)');
			if ((strtolower($code) == 'success') && (strtolower($ret) == 'success')) {
				return true;
			}

			if ($xpath->evaluate('string(//xml/return_msg)') == $xpath->evaluate('string(//xml/err_code_des)')) {
				$error = $xpath->evaluate('string(//xml/return_msg)');
			}
			else {
				$error = $xpath->evaluate('string(//xml/return_msg)') . '<br/>' . $xpath->evaluate('string(//xml/err_code_des)');
			}

			return error(-2, $error);
		}

		return error(-1, '未知错误');
	}

	public function refund($openid, $out_trade_no, $out_refund_no, $totalmoney, $refundmoney = 0)
	{
		global $_W;
		global $_GPC;

		if (empty($openid)) {
			return error(-1, 'openid不能为空');
		}

		$member = m('member')->getMember($openid);

		if (empty($member)) {
			return error(-1, '未找到用户');
		}

		$setting = uni_setting($_W['uniacid'], array('payment'));

		if (!is_array($setting['payment'])) {
			return error(1, '没有设定支付参数');
		}

		$pay = m('common')->getSysset('pay');
		$wechat = $setting['payment']['wechat'];
		$sql = 'SELECT `key`,`secret` FROM ' . tablename('account_wechats') . ' WHERE `uniacid`=:uniacid limit 1';
		$row = pdo_fetch($sql, array(':uniacid' => $_W['uniacid']));
		$url = 'https://api.mch.weixin.qq.com/secapi/pay/refund';
		$pars = array();
		$pars['appid'] = $row['key'];
		$pars['mch_id'] = $wechat['mchid'];
		$pars['nonce_str'] = random(8);
		$pars['out_trade_no'] = $out_trade_no;
		$pars['out_refund_no'] = $out_refund_no;
		$pars['total_fee'] = $totalmoney;
		$pars['refund_fee'] = $refundmoney;
		$pars['op_user_id'] = $wechat['mchid'];
		ksort($pars, SORT_STRING);
		$string1 = '';

		foreach ($pars as $k => $v) {
			$string1 .= $k . '=' . $v . '&';
		}

		$string1 .= 'key=' . $wechat['apikey'];
		$pars['sign'] = strtoupper(md5($string1));
		$xml = array2xml($pars);
		$extras = array();
		$sec = m('common')->getSec();
		$certs = iunserializer($sec['sec']);
		$errmsg = '未上传完整的微信支付证书，请到【系统设置】->【支付方式】中上传!';

		if (is_array($certs)) {
			if (empty($certs['cert']) || empty($certs['key']) || empty($certs['root'])) {
				if ($_W['ispost']) {
					show_json(0, array('message' => $errmsg));
				}

				show_message($errmsg, '', 'error');
			}

			$certfile = IA_ROOT . '/addons/ewei_shopv2/cert/' . random(128);
			file_put_contents($certfile, $certs['cert']);
			$keyfile = IA_ROOT . '/addons/ewei_shopv2/cert/' . random(128);
			file_put_contents($keyfile, $certs['key']);
			$rootfile = IA_ROOT . '/addons/ewei_shopv2/cert/' . random(128);
			file_put_contents($rootfile, $certs['root']);
			$extras['CURLOPT_SSLCERT'] = $certfile;
			$extras['CURLOPT_SSLKEY'] = $keyfile;
			$extras['CURLOPT_CAINFO'] = $rootfile;
		}
		else {
			if ($_W['ispost']) {
				show_json(0, array('message' => $errmsg));
			}

			show_message($errmsg, '', 'error');
		}

		load()->func('communication');
		$resp = ihttp_request($url, $xml, $extras);
		@unlink($certfile);
		@unlink($keyfile);
		@unlink($rootfile);

		if (is_error($resp)) {
			return error(-2, $resp['message']);
		}

		if (empty($resp['content'])) {
			return error(-2, '网络错误');
		}

		$arr = json_decode(json_encode((array) simplexml_load_string($resp['content'])), true);
		$xml = '<?xml version="1.0" encoding="utf-8"?>' . $resp['content'];
		$dom = new DOMDocument();

		if ($dom->loadXML($xml)) {
			$xpath = new DOMXPath($dom);
			$code = $xpath->evaluate('string(//xml/return_code)');
			$ret = $xpath->evaluate('string(//xml/result_code)');
			if ((strtolower($code) == 'success') && (strtolower($ret) == 'success')) {
				return true;
			}

			if ($xpath->evaluate('string(//xml/return_msg)') == $xpath->evaluate('string(//xml/err_code_des)')) {
				$error = $xpath->evaluate('string(//xml/return_msg)');
			}
			else {
				$error = $xpath->evaluate('string(//xml/return_msg)') . '<br/>' . $xpath->evaluate('string(//xml/err_code_des)');
			}

			return error(-2, $error);
		}

		return error(-1, '未知错误');
	}

	public function downloadbill($starttime, $endtime, $type = 'ALL')
	{
		global $_W;
		global $_GPC;
		$dates = array();
		$startdate = date('Ymd', $starttime);
		$enddate = date('Ymd', $endtime);

		if ($startdate == $enddate) {
			$dates = array($startdate);
		}
		else {
			$days = (double) ($endtime - $starttime) / 86400;
			$d = 0;

			while ($d < $days) {
				$dates[] = date('Ymd', strtotime($startdate . '+' . $d . ' day'));
				++$d;
			}
		}

		if (empty($dates)) {
			show_message('对账单日期选择错误!', '', 'error');
		}

		$setting = uni_setting($_W['uniacid'], array('payment'));

		if (!is_array($setting['payment'])) {
			return error(1, '没有设定支付参数');
		}

		$wechat = $setting['payment']['wechat'];
		$sql = 'SELECT `key`,`secret` FROM ' . tablename('account_wechats') . ' WHERE `uniacid`=:uniacid limit 1';
		$row = pdo_fetch($sql, array(':uniacid' => $_W['uniacid']));
		$content = '';

		foreach ($dates as $date) {
			$dc = $this->downloadday($date, $row, $wechat, $type);
			if (is_error($dc) || strexists($dc, 'CDATA[FAIL]')) {
				continue;
			}

			$content .= $date . " 账单\r\n\r\n";
			$content .= $dc . "\r\n\r\n";
		}

		$content = "\xef\xbb\xbf" . $content;
		$file = time() . '.csv';
		header('Content-type: application/octet-stream ');
		header('Accept-Ranges: bytes ');
		header('Content-Disposition: attachment; filename=' . $file);
		header('Expires: 0 ');
		header('Content-Encoding: UTF8');
		header('Cache-Control: must-revalidate, post-check=0, pre-check=0 ');
		header('Pragma: public ');
		exit($content);
	}

	private function downloadday($date, $row, $wechat, $type)
	{
		$url = 'https://api.mch.weixin.qq.com/pay/downloadbill';
		$pars = array();
		$pars['appid'] = $row['key'];
		$pars['mch_id'] = $wechat['mchid'];
		$pars['nonce_str'] = random(8);
		$pars['device_info'] = 'ewei_shopv2';
		$pars['bill_date'] = $date;
		$pars['bill_type'] = $type;
		ksort($pars, SORT_STRING);
		$string1 = '';

		foreach ($pars as $k => $v) {
			$string1 .= $k . '=' . $v . '&';
		}

		$string1 .= 'key=' . $wechat['apikey'];
		$pars['sign'] = strtoupper(md5($string1));
		$xml = array2xml($pars);
		$extras = array();
		load()->func('communication');
		$resp = ihttp_request($url, $xml, $extras);

		if (strexists($resp['content'], 'No Bill Exist')) {
			return error(-2, '未搜索到任何账单');
		}

		if (is_error($resp)) {
			return error(-2, $resp['message']);
		}

		if (empty($resp['content'])) {
			return error(-2, '网络错误');
		}

		return $resp['content'];
	}

	public function closeOrder($out_trade_no = '')
	{
		global $_W;
		global $_GPC;
		$setting = uni_setting($_W['uniacid'], array('payment'));

		if (!is_array($setting['payment'])) {
			return error(1, '没有设定支付参数');
		}

		$wechat = $setting['payment']['wechat'];
		$sql = 'SELECT `key`,`secret` FROM ' . tablename('account_wechats') . ' WHERE `uniacid`=:uniacid limit 1';
		$row = pdo_fetch($sql, array(':uniacid' => $_W['uniacid']));
		$url = 'https://api.mch.weixin.qq.com/pay/closeorder';
		$pars = array();
		$pars['appid'] = $row['key'];
		$pars['mch_id'] = $wechat['mchid'];
		$pars['nonce_str'] = random(8);
		$pars['out_trade_no'] = $out_trade_no;
		ksort($pars, SORT_STRING);
		$string1 = '';

		foreach ($pars as $k => $v) {
			$string1 .= $k . '=' . $v . '&';
		}

		$string1 .= 'key=' . $wechat['apikey'];
		$pars['sign'] = strtoupper(md5($string1));
		$xml = array2xml($pars);
		load()->func('communication');
		$resp = ihttp_post($url, $xml);

		if (is_error($resp)) {
			return error(-2, $resp['message']);
		}

		if (empty($resp['content'])) {
			return error(-2, '网络错误');
		}

		$arr = json_decode(json_encode((array) simplexml_load_string($resp['content'])), true);
		$xml = '<?xml version="1.0" encoding="utf-8"?>' . $resp['content'];
		$dom = new DOMDocument();

		if ($dom->loadXML($xml)) {
			$xpath = new DOMXPath($dom);
			$code = $xpath->evaluate('string(//xml/return_code)');
			$ret = $xpath->evaluate('string(//xml/result_code)');
			$trade_state = $xpath->evaluate('string(//xml/trade_state)');
			if ((strtolower($code) == 'success') && (strtolower($ret) == 'success') && (strtolower($trade_state) == 'success')) {
				return true;
			}

			if ($xpath->evaluate('string(//xml/return_msg)') == $xpath->evaluate('string(//xml/err_code_des)')) {
				$error = $xpath->evaluate('string(//xml/return_msg)');
			}
			else {
				$error = $xpath->evaluate('string(//xml/return_msg)') . '<br/>' . $xpath->evaluate('string(//xml/err_code_des)');
			}

			return error(-2, $error);
		}

		return error(-1, '未知错误');
	}

	public function isWeixinPay($out_trade_no, $money = 0)
	{
		global $_W;
		global $_GPC;
		$setting = uni_setting($_W['uniacid'], array('payment'));

		if (!is_array($setting['payment'])) {
			return error(1, '没有设定支付参数');
		}

		$wechat = $setting['payment']['wechat'];
		$sql = 'SELECT `key`,`secret` FROM ' . tablename('account_wechats') . ' WHERE `uniacid`=:uniacid limit 1';
		$row = pdo_fetch($sql, array(':uniacid' => $_W['uniacid']));
		$url = 'https://api.mch.weixin.qq.com/pay/orderquery';
		$pars = array();
		$pars['appid'] = $row['key'];
		$pars['mch_id'] = $wechat['mchid'];
		$pars['nonce_str'] = random(8);
		$pars['out_trade_no'] = $out_trade_no;
		ksort($pars, SORT_STRING);
		$string1 = '';

		foreach ($pars as $k => $v) {
			$string1 .= $k . '=' . $v . '&';
		}

		$string1 .= 'key=' . $wechat['apikey'];
		$pars['sign'] = strtoupper(md5($string1));
		$xml = array2xml($pars);
		load()->func('communication');
		$resp = ihttp_post($url, $xml);

		if (is_error($resp)) {
			return error(-2, $resp['message']);
		}

		if (empty($resp['content'])) {
			return error(-2, '网络错误');
		}

		$arr = json_decode(json_encode((array) simplexml_load_string($resp['content'])), true);
		$xml = '<?xml version="1.0" encoding="utf-8"?>' . $resp['content'];
		$dom = new DOMDocument();

		if ($dom->loadXML($xml)) {
			$xpath = new DOMXPath($dom);
			$code = $xpath->evaluate('string(//xml/return_code)');
			$ret = $xpath->evaluate('string(//xml/result_code)');
			$trade_state = $xpath->evaluate('string(//xml/trade_state)');
			if ((strtolower($code) == 'success') && (strtolower($ret) == 'success') && (strtolower($trade_state) == 'success')) {
				$total_fee = intval($xpath->evaluate('string(//xml/total_fee)')) / 100;

				if ($total_fee != $money) {
					return error(-1, '金额出错');
				}

				return true;
			}

			if ($xpath->evaluate('string(//xml/return_msg)') == $xpath->evaluate('string(//xml/err_code_des)')) {
				$error = $xpath->evaluate('string(//xml/return_msg)');
			}
			else {
				$error = $xpath->evaluate('string(//xml/return_msg)') . '<br/>' . $xpath->evaluate('string(//xml/err_code_des)');
			}

			return error(-2, $error);
		}

		return error(-1, '未知错误');
	}

	public function isAlipayNotify($gpc)
	{
		global $_W;
		$notify_id = trim($gpc['notify_id']);
		$notify_sign = trim($gpc['sign']);
		if (empty($notify_id) || empty($notify_sign)) {
			return false;
		}

		$setting = uni_setting($_W['uniacid'], array('payment'));

		if (!is_array($setting['payment'])) {
			return false;
		}

		$alipay = $setting['payment']['alipay'];
		$params = array('body' => $gpc['body'], 'is_success' => $gpc['is_success'], 'notify_id' => $gpc['notify_id'], 'notify_time' => $gpc['notify_time'], 'notify_type' => $gpc['notify_type'], 'out_trade_no' => $gpc['out_trade_no'], 'payment_type' => $gpc['payment_type'], 'seller_id' => $gpc['seller_id'], 'service' => $gpc['service'], 'subject' => $gpc['subject'], 'total_fee' => $gpc['total_fee'], 'trade_no' => $gpc['trade_no'], 'trade_status' => $gpc['trade_status']);
		ksort($params, SORT_STRING);
		$string1 = '';

		foreach ($params as $k => $v) {
			$string1 .= $k . '=' . $v . '&';
		}

		$string1 = rtrim($string1, '&') . $alipay['secret'];
		$sign = strtolower(md5($string1));

		if ($notify_sign != $sign) {
			return false;
		}

		$url = 'https://mapi.alipay.com/gateway.do?service=notify_verify&partner=' . $alipay['partner'] . '&notify_id=' . $notify_id;
		$resp = @file_get_contents($url);
		return preg_match('/true$/i', $resp);
	}
}

if (!defined('IN_IA')) {
	exit('Access Denied');
}

?>
