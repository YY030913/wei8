<?php
/**
 * [WeEngine System] Copyright (c) 2014 WE7.CC
 * WeEngine is NOT a free software, it under the license terms, visited http://www.we7.cc/ for more details.
 */

if($controller == 'activity') {
	if($action == 'coupon') {
		define('ACTIVE_FRAME_URL', url('activity/coupon/display'));
	}
	if($action  == 'exchange') {
		if ($_GPC['type'] == 'coupon' &&  $_GPC['a'] == 'exchange') {
			define('ACTIVE_FRAME_URL', url('activity/exchange/display', array('type' => 'coupon')));
		}
		if ($_GPC['type'] == 'goods' && $_GPC['a'] == 'exchange') {
			define('ACTIVE_FRAME_URL', url('activity/exchange/display', array('type' => 'goods')));
		}
	}
}
if($_W['account']['level'] != ACCOUNT_SERVICE_VERIFY && $_W['account']['level'] != ACCOUNT_SUBSCRIPTION_VERIFY) {
	define('COUPON_TYPE', SYSTEM_COUPON);
} else {
	define('COUPON_TYPE', WECHAT_COUPON);
}
define('FRAME', 'mc');
$frames = buildframes(array('mc'));
$frames = $frames['mc'];
