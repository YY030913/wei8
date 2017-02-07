<?php
/**
 * [WeEngine System] Copyright (c) 2014 WE7.CC
 * WeEngine is NOT a free software, it under the license terms, visited http://www.we7.cc/ for more details.
 */

define('IN_GW', true);
if($_W['account']['level'] != ACCOUNT_SERVICE_VERIFY && $_W['account']['level'] != ACCOUNT_SUBSCRIPTION_VERIFY) {
	define('COUPON_TYPE', SYSTEM_COUPON);
} else {
	define('COUPON_TYPE', WECHAT_COUPON);
}
