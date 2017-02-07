<?php
/**
 * [WeEngine System] Copyright (c) 2014 WE7.CC
 * WeEngine is NOT a free software, it under the license terms, visited http://www.we7.cc/ for more details.
 */
if ($do == 'oauth' || in_array($action, array('credit1', 'passport', 'uc', 'fields', 'tplnotice'))) {
	define('FRAME', 'setting');
} else {
	define('FRAME', 'mc');
}

if($action == 'stat') {
	define('ACTIVE_FRAME_URL', url('mc/trade'));
} elseif($action == 'card') {
	if(in_array($do, array('notice', 'credit', 'recommend', 'sign'))) {
		define('ACTIVE_FRAME_URL', url('mc/card/other'));
	}
}
if($_W['account']['level'] != ACCOUNT_SERVICE_VERIFY && $_W['account']['level'] != ACCOUNT_SUBSCRIPTION_VERIFY) {
	define('COUPON_TYPE', SYSTEM_COUPON);
} else {
	define('COUPON_TYPE', WECHAT_COUPON);
}
$frames = buildframes(array(FRAME));
$frames = $frames[FRAME];
