<?php
/**
 * [WDL] Copyright (c) 2013 www.goodziyuan.com
 * 好资源微赞一键更新程序
 */
load()->func('file');
defined('IN_IA') or exit('Access Denied');
	global $_W,$_GPC;  
	if(empty($_GPC['op'])) {
		$_GPC['op'] = 'display';
	}
    $ver = include('010xr.php');
    $ver = $ver['ver'];
    $ver = substr($ver,-4);
	$hosturl = urlencode('http://' . $_SERVER['HTTP_HOST']);
	$updatehost = 'http://wqup.goodziyuan.com/update.php';
    $lastver = file_get_contents($updatehost . '?a=check&v='.$ver);//Now Version
	if($_GPC['op'] == 'display'){
		$op = $_GPC['op'];	
		#time
		$gettimeurl = $updatehost . '?a=client_check_time&v=' . $ver . '&u=' . $hosturl;
		$domain_time = file_get_contents($gettimeurl);	
	}
	elseif($_GPC['op'] == 'chanage'){
		$op = $_GPC['op'];
		$ver = $ver+0.1;
		$chosturl = $updatehost . '?a=chanage&v=' . $ver. '&u=' . $hosturl;
		$cinfo = file_get_contents($chosturl);
	}
	elseif($_GPC['op'] == 'update'){
		$op = $_GPC['op'];
		$updatehost = 'http://wqup.goodziyuan.com/update.php';
		$updatehosturl = $updatehost . '?a=update&v=' . $ver . '&u=' . $hosturl;
		$updatenowinfo = file_get_contents($updatehosturl);
		if (strstr($updatenowinfo, 'zip')){			
				$pathurl = $updatehost . '?a=down&f=' . $updatenowinfo;

				$updatedir = IA_ROOT.'/Temp/update';

				if(!is_dir($updatedir)) {
					mkdirs($updatedir);
				}	

				#下载文件
				$isgot = get_file($pathurl, $updatenowinfo, $updatedir);
				
				if($isgot){				
					$updatezip = $updatedir . '/' . $updatenowinfo;
					require 'pclzip.lib.php';  
					$thisfolder = new PclZip($updatezip);
					$isextract = $thisfolder->extract(PCLZIP_OPT_PATH, $updatedir);
					if ($isextract == 0) {  
						message('解压更新包失败！',referer(),'error'); 
					} 
					
					$archive = new PclZip($updatezip);
					$list = $archive->extract(PCLZIP_OPT_PATH, IA_ROOT, PCLZIP_OPT_REPLACE_NEWER); 
					
					if ($list == 0) {  
						message('远程升级文件不存在或站点没有修改权限。升级失败！',referer(),'error'); 
					} 
					
					if(file_exists($updatedir . '/update.sql')) {						
						$sqlfile = $updatedir . '/update.sql';

						runquery($sqlfile);               
					}
					$newver = "<?php return array ('ver' => '$lastver');?>";
					$f = fopen('010xr.php','w+');
					fwrite($f,$newver);
					fclose($f);
					@unlink(IA_ROOT . '/update.sql');
					deldir($updatedir);
					
					message('已将系统更新到最新版本！',create_url('cloud/010xr',array('op'=>'display')),'success');
				}
				else{
					message('查找不到更新包！',referer(),'error');
				}
		}
		else{
				message('好资源提醒您:请检查授权状态，或者联系好资源授权！',referer(),'error');
		}
	}

	
	function get_file($url,$name,$folder = './')
	{
		set_time_limit((24 * 60) * 60);
		// 设置超时时间
		$destination_folder = $folder . '/';
		// 文件下载保存目录，默认为当前文件目录

		$newfname = $destination_folder.$name;
		// 取得文件的名称
		$file = fopen($url, 'rb');
		// 远程下载文件，二进制模式
		if ($file) {
			// 如果下载成功
			$newf = fopen($newfname, 'wb');
			// 远在文件文件
			if ($newf) {
				// 如果文件保存成功
				while (!feof($file)) {
					// 判断附件写入是否完整
					fwrite($newf, fread($file, 1024 * 8), 1024 * 8);
				}
			}
		}
		if ($file) {
			fclose($file);
		}
		if ($newf) {
			fclose($newf);
		}
		return true;
	}

function runquery($sql) {
	
		$file_path = $sql;  
		if(file_exists($file_path)){ 
			if($fp=fopen($file_path,"a+")){ 
				$buffer=1024; 
				$str=""; 
				while(!feof($fp)){ 
					$str.=fread($fp,$buffer); 
				}
			}
		}
		$query = $str;
		pdo_run($query);
}	
	
	function deldir($dir) {
	  //先删除目录下的文件：
	  $dh=opendir($dir);
	  while ($file=readdir($dh)) {
		if($file!="." && $file!="..") {
		  $fullpath=$dir."/".$file;
		  if(!is_dir($fullpath)) {
			  unlink($fullpath);
		  } else {
			  deldir($fullpath);
		  }
		}
	  }
	 
	  closedir($dh);
	  //删除当前文件夹：
	  if(rmdir($dir)) {
		return true;
	  } else {
		return false;
	  }
	}
template('cloud/010xr');
