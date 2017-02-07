<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 0) ? (include $this->template('common/header', TEMPLATE_INCLUDEPATH)) : (include template('common/header', TEMPLATE_INCLUDEPATH));?>
<style>
	.panel{clear: both;margin-bottom: 20px; position: relative;}
	.panel .btn-group{width:100%}
	.panel .btn-group .btn{width:33.3334%}
	.panel .no{position: absolute; background: #3071a9;width:85px; color:#fff; text-align:center; border-radius:3px; height:25px; line-height:25px; top:-15px; left:-10px}
	.panel .info{position: absolute; background: #fb6a59;width:70px; color:#fff; text-align:center; border-radius:100%; height:70px; line-height:70px; top:20%; left:40%}
	.panel .success{position: absolute; background: #449d44;width:70px; color:#fff; text-align:center; border-radius:100%; height:70px; line-height:70px; top:20%; left:40%}
	.panel .type{position: absolute; background: #CCC; padding:0 5px; color:#fff; text-align:center; border-radius:3px; height:25px; line-height:25px; top:-15px; left:80px}
	.panel .type.image{background: #449d44;}
	.panel .type.news{background: #fb6a59;}
	.panel .type.voice{background: #46b8da;}
	.panel .type.video{background: #eea236;}

	.reply .panel-group .panel:last-child{margin-bottom: 0;}
	.panel-group img{position:absolute; left:0; top:0; display:inline-block; width:100%; height:100%;}
	.panel-group{position:relative; cursor:pointer;}
	.panel-group .mask{position:absolute; width:100%; height:100%; left:0; top:0; z-index:10; background-color:rgba(0,0,0,0.6 ) !important; text-align:center; display:none; border-radius:4px;}
	.panel-group:hover .mask,.panel-group.selected .mask{display:block;}
	.panel-group>i{display:none; width:46px; height:46px; color:#fff; text-align:center; line-height:46px; z-index:20; position:absolute; top:50%; left:50%; margin-top:-23px; margin-left:-23px; font-size:46px; font-weight:200;}
	.panel-group.selected>i{display:inline-block}

	.panel .panel-body .audio-msg{position:relative; padding-left:65px; height:70px;}
	.panel .panel-body .audio-msg .icon span{position:absolute; left:0; top:0; background:#ccc; width:60px; height:60px; line-height:60px; vertical-align:middle; display:inline-block; cursor:pointer; font-size: 25px; text-align: center;}
	.panel .panel-body .audio-msg .audio-content .audio-title{ width:100%; margin-bottom:10px; overflow:hidden; white-space:nowrap; text-overflow:ellipsis;}

	.panel .panel-body .video-content{margin-bottom:10px;}
	.panel .panel-body .video-content .title,.panel .panel-body .video-content .abstract{word-break:break-all; overflow:hidden; text-overflow:ellipsis;}
	.panel .panel-body .video-content img{max-width:100%; height:140px;}
	.panel .panel-body .video-content .video{position:relative; margin:10px 0;}
	.panel .panel-body .video-content .video .video-length{display:block; width:100%; padding-right:10px; position:absolute; bottom:0; left:0; line-height:25px; background:rgba(0,0,0,0.5); color:#fff; text-align:right;}

	.panel .panel-body .panel-wxcard {position:relative;}
	.panel .panel-body .panel-wxcard .wxcard-content{width:100%; height:90px; border-radius:5px; border-bottom-left-radius:0; border-bottom-right-radius:0; border:1px solid #e7e7eb; border-bottom:0; position:relative; background-color:#A9D92C; color:#fff; font-size:16px; white-space:nowrap; overflow:hidden; text-overflow:ellipsis;}
	.panel .panel-body .panel-wxcard .wxcard-content img{width:60px; height:60px; position:absolute; top:15px; left:15px;}
	.panel .panel-body .panel-wxcard .wxcard-content .title{position:absolute; left:90px; top:30px; font-size:19px}
	.panel .panel-body .panel-wxcard .wxcard-footer{background-color:#fff; height:35px; line-height:35px; border:1px solid #e7e7eb; padding:0 10px; border-bottom-left-radius:5px; border-bottom-right-radius:5px;}
	.init-hide{display: none}
</style>
<ul class="nav nav-tabs">
	<li <?php  if($_GPC['a'] == 'mass'  && $do == 'list') { ?>class="active"<?php  } ?>><a href="<?php  echo url('material/mass/')?>">定时群发</a></li>
	<li <?php  if($_GPC['a'] == 'mass' && $do == 'send') { ?>class="active"<?php  } ?>><a href="<?php  echo url('material/mass/send')?>">发送记录</a></li>
</ul>
<div class="alert alert-info">
	<strong class="text-danger"><i class="fa fa-info-circle"></i> 该功能是定时群发,如果你需要立即群发,请在素材列表里找到对用的素材直接群发</strong><br>
	<i class="fa fa-info-circle"></i> 使用定时群发功能可设置未来7天的群发,使用该功能前请先确保您的云服务可用<br>
	<i class="fa fa-info-circle"></i> <strong>如果在提交定时群发提示:某天的群发同步到云服务失败,请手动同步到云服务</strong><br>
	<i class="fa fa-info-circle"></i> <strong>使用该功能前,请将微信公众平台的素材同步到本系统</strong><br>
</div>
<?php  if($cloud_error == 1) { ?>
<div class="alert alert-danger">
	<h4><i class="fa fa-info-circle"></i> <?php  echo $cloud['message'];?></h4>
</div>
<?php  } ?>
<form action="" class="form form-horizontal" id="mass-container" ng-controller="mass">
	<div class="panel panel-default">
		<div class="panel-heading">设置未来7天的群发</div>
		<div class="panel-body">
			<div class="row clearfix reply">
				<div class="col-xs-6 col-sm-3 col-md-3">
					<div ng-repeat="item in mass.groups">
						<!-- 图文 -->
						<div class="panel-group init-hide" ng-if="item.msgtype == 'news'" id="group-{{ $index }}">
							<div class="panel panel-default" ng-repeat="media in item.media.items">
								<div class="panel-body" ng-if="$index == 0">
									<div class="img">
										<i class="default">封面图片</i>
										<a ng-href="{{media.url}}" target="_blank"><img src="" ng-src="{{media.thumb_url}}"></a>
										<span class="text-left" ng-bind="media.title"></span>
									</div>
								</div>
								<div class="panel-body" ng-if="$index != 0">
									<a ng-href="{{media.url}}" target="_blank">
										<div class="text">
											<h4 ng-bind="media.title"></h4>
										</div>
										<div class="img">
											<img src="" ng-src="{{media.thumb_url}}">
											<i class="default">缩略图</i>
										</div>
									</a>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-body" style="height:20px; padding-bottom:40px; padding-top:7px; padding-right:15px;">
									<div class="btn-group">
										<a href="javascript:;" ng-click="mass.purview(item)" class="btn btn-default btn-sm">预览</a>
										<a href="javascript:;" ng-click="mass.emptyGroup(item)" ng-disabled="item.status == 0" class="btn btn-default btn-sm">清空</a>
										<a href="javascript:;" ng-click="mass.editGroup(item)" ng-disabled="item.status == 0" class="btn btn-default btn-sm">编辑</a>
									</div>
								</div>
							</div>
							<div class="no" ng-bind="item.time"></div>
							<div class="type news">图文</div>
							<div class="info init_hide" ng-show="!item.media_id">未设置</div>
							<div class="success init_hide" ng-show="item.status == 0">已发送</div>
						</div>

						<!-- 图片 -->
						<div class="panel-group init-hide" ng-if="item.msgtype == 'image'" id="group-{{ $index }}">
							<div class="panel panel-default">
								<div class="panel-body">
									<div class="img">
										<i class="default">封面图片</i>
										<img src="" ng-src="{{item.media.attach}}">
									</div>
								</div>
								<div class="no" ng-bind="item.time"></div>
								<div class="type image">图片</div>
								<div class="info init_hide" ng-show="!item.media_id">未设置</div>
								<div class="success init_hide" ng-show="item.status == 0">已发送</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-body" style="height:20px; padding-bottom:40px; padding-top:7px">
									<div class="btn-group">
										<a href="javascript:;" ng-click="mass.purview(item)" class="btn btn-default btn-sm">预览</a>
										<a href="javascript:;" ng-click="mass.emptyGroup(item)" ng-disabled="item.status == 0" class="btn btn-default btn-sm">清空</a>
										<a href="javascript:;" ng-click="mass.editGroup(item)" ng-disabled="item.status == 0" class="btn btn-default btn-sm">编辑</a>
									</div>
								</div>
							</div>
						</div>

						<!-- 微信卡券 -->
						<div class="panel-group init-hide" ng-if="item.msgtype == 'wxcard'" id="group-{{ $index }}">
							<div class="panel panel-default">
								<div class="panel-body">
									<div class="panel-wxcard">
										<div class="wxcard-content" ng-style="{'background-color' : item.media.color}">
											<img src="" ng-src="{{item.media.logo_url}}" class="img-circle">
											<div class="title">{{item.media.title}}</div>
										</div>
										<div class="wxcard-footer clearfix">
											<div class="pull-right text-muted hide">2015-12-5</div>
											<div>{{item.media.brand_name}}</div>
										</div>
									</div>
								</div>
								<div class="no" ng-bind="item.time"></div>
								<div class="type wxcard">微信卡券</div>
								<div class="info init_hide" ng-show="!item.media_id">未设置</div>
								<div class="success init_hide" ng-show="item.status == 0">已发送</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-body" style="height:20px; padding-bottom:40px; padding-top:7px">
									<div class="btn-group">
										<a href="javascript:;" ng-click="mass.purview(item)" class="btn btn-default btn-sm">预览</a>
										<a href="javascript:;" ng-click="mass.emptyGroup(item)" ng-disabled="item.status == 0" class="btn btn-default btn-sm">清空</a>
										<a href="javascript:;" ng-click="mass.editGroup(item)" ng-disabled="item.status == 0" class="btn btn-default btn-sm">编辑</a>
									</div>
								</div>
							</div>
						</div>

						<!-- 语音 -->
						<div class="init-hide" ng-if="item.msgtype == 'voice'" id="group-{{ $index }}">
							<div class="panel panel-default panel-voice">
								<div class="panel-body">
									<div class="audio-msg">
										<div class="icon audio-player-play" data-attach="{{item.media.attach}}"><span><i class="fa fa-play"></i></span></div>
										<div class="audio-content">
											<div class="audio-title" ng-bind="item.media.filename"></div>
											<div class="audio-date text-muted" ng-bind="'创建于：' + item.media.createtime_cn"></div>
										</div>
									</div>
									<div class="btn-group">
										<a href="javascript:;" ng-click="mass.purview(item)" class="btn btn-default btn-sm">预览</a>
										<a href="javascript:;" ng-click="mass.emptyGroup(item)" ng-disabled="item.status == 0" class="btn btn-default btn-sm">清空</a>
										<a href="javascript:;" ng-click="mass.editGroup(item)" ng-disabled="item.status == 0" class="btn btn-default btn-sm">编辑</a>
									</div>
								</div>
								<div class="no" ng-bind="item.time"></div>
								<div class="type voice">语音</div>
								<div class="info init_hide" ng-show="!item.media_id">未设置</div>
								<div class="success init_hide" ng-show="item.status == 0">已发送</div>
							</div>
						</div>

						<!-- 视频 -->
						<div class="init-hide" ng-if="item.msgtype == 'video'" id="group-{{ $index }}">
							<div class="panel panel-default panel-video">
								<div class="panel-body">
									<div class="video-content">
										<h4 class="title text-muted" ng-bind="item.media.tag.title">{{}}</h4>
										<div class="date text-muted" ng-bind="'创建于:' + item.media.createtime_cn"></div>
										<div class="video">
											<img src="../web/resource/images/banner-bg.png" alt="" />
										</div>
										<div class="abstract text-muted" ng-bind="item.media.tag.description"></div>
									</div>
									<div class="btn-group">
										<a href="javascript:;" ng-click="mass.purview(item)" class="btn btn-default btn-sm">预览</a>
										<a href="javascript:;" ng-click="mass.emptyGroup(item)" ng-disabled="item.status == 0" class="btn btn-default btn-sm">清空</a>
										<a href="javascript:;" ng-click="mass.editGroup(item)" ng-disabled="item.status == 0" class="btn btn-default btn-sm">编辑</a>
									</div>
								</div>
								<div class="no" ng-bind="item.time"></div>
								<div class="type video">视频</div>
								<div class="info init_hide" ng-show="!item.media_id">未设置</div>
								<div class="success init_hide" ng-show="item.status == 0">已发送</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-xs-6 col-sm-9 col-md-9 aside" id="edit-container">
					<div style="margin-bottom: 20px"></div>
					<div class="card">
						<div class="arrow-left"></div>
						<div class="inner">
							<div class="panel panel-default">
								<div class="panel-body">
									<div class="form-group">
										<label class="col-xs-12 col-sm-3 col-md-2 control-label">接收粉丝</label>
										<div class="col-sm-9 col-xs-12">
											<label class="radio-inline"><input type="radio" name="group" value="-1" ng-model="mass.activeGroup.group"/> 全部粉丝</label>
											<?php  if(is_array($groups)) { foreach($groups as $group) { ?>
											<label class="radio-inline"><input type="radio" name="group" value="<?php  echo $group['id'];?>" ng-model="mass.activeGroup.group"/> <?php  echo $group['name'];?>【<?php  echo $group['count'];?>】</label>
											<?php  } } ?>
										</div>
									</div>
									<div class="form-group">
										<label class="col-xs-12 col-sm-3 col-md-2 control-label">消息内容</label>
										<div class="col-sm-9 col-xs-12">
											<div class="col-xs-3 img init-hide" ng-if="!mass.activeGroup.media_id">
												<span ng-click="mass.changeMedia()"><i class="fa fa-plus-circle green"></i>&nbsp;选择素材</span>
											</div>
											<div class="col-xs-3 img init-hide" ng-if="mass.activeGroup.media_id">
												<div class="init-hide" ng-if="mass.activeGroup.msgtype == 'image'">
													<h3 ng-click="mass.changeMedia()">重新选择</h3>
													<span><i class="fa fa-image-o"></i>图片素材</span>
												</div>
												<div class="init-hide" ng-if="mass.activeGroup.msgtype == 'voice'">
													<h3 ng-click="mass.changeMedia()">重新选择</h3>
													<span><i class="fa file-audio-o"></i>语音素材</span>
												</div>
												<div class="init-hide" ng-if="mass.activeGroup.msgtype == 'video'">
													<h3 ng-click="mass.changeMedia()">重新选择</h3>
													<span><i class="fa fa-movie-o"></i>视频素材</span>
												</div>
												<div class="init-hide" ng-if="mass.activeGroup.msgtype == 'news'">
													<h3 ng-click="mass.changeMedia()">重新选择</h3>
													<span><i class="fa fa-word-o"></i>图文素材</span>
												</div>
												<div class="init-hide" ng-if="mass.activeGroup.msgtype == 'wxcard'">
													<h3 ng-click="mass.changeMedia()">重新选择</h3>
													<span><i class="fa fa-word-o"></i>微信卡券</span>
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-xs-12 col-sm-3 col-md-2 control-label">发送时间</label>
										<div class="col-sm-3">
											<div class="input-group clockpicker">
												<span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
												<input type="text" readonly name="clock" ng-model="mass.activeGroup.clock" class="form-control">
											</div>
											<span class="help-block text-danger">特别注意:发送时间不能小于当前时间.不要超过晚上11点</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<?php  if(!$cloud_error) { ?>
		<div class="btn btn-primary" ng-click="mass.submit()" id="submit">提交</div>
	<?php  } else { ?>
		<div class="btn btn-danger" disabled>云服务错误</div>
	<?php  } ?>
</form>
<!-- 群发预览 -->
<div class="modal fade" id="modal-view" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<form action="">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">请输入接受人的微信号</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="wxname">微信号</label>
						<input type="text" class="form-control" id="wxname" name="wxname">
						<span class="help-block">微信号不能为空</span>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary btn-view">发送</button>
				</div>
			</div>
		</div>
	</form>
</div>

<script>
	require(['angular.sanitize', 'bootstrap', 'underscore', 'jquery.wookmark', 'jquery.jplayer', 'clockpicker'], function(angular, $, _){
		$('.init-hide').show();
		$('.clockpicker').clockpicker({autoclose: true});

		angular.module('app', ['ngSanitize']).controller('mass', function($scope, $http){
			$scope.mass = {};
			$scope.mass.groups = <?php  echo json_encode($mass);?>;
			$scope.mass.activeType = 'news';
			$scope.mass.activeIndex = 0;
			$scope.mass.activeGroup = $scope.mass.groups[$scope.mass.activeIndex];
			$scope.mass.submit = function(){
				var error = {errno: 1, message: ''};
				$('#submit').addClass('disabled');
				$http.post("<?php  echo url('material/mass/post');?>", {data: $scope.mass.groups}).success(function(dat, status){
					if(!dat.message.errno) {
						util.message('设置群发成功', "<?php  echo url('material/mass/send');?>", 'success');
					} else if(dat.message.errno == -1000) {
						util.message('存在没有同步到云服务的群发,现在跳转到手动同步页面:<br>' + dat.message.message, "<?php  echo url('material/mass/send');?>", 'error');
					} else {
						$('#submit').removeClass('disabled');
						util.message('设置群发失败:<br>' + dat.message.message, "", 'error');
					}
					return false;
				});
			};

			$scope.mass.emptyGroup = function(item){
				$scope.mass.editGroup(item);
				if($scope.mass.activeGroup.id > 0) {
					if(!confirm('确认清空这条群发吗?')) {
						return false;
					}
					$http.post("<?php  echo url('material/mass/del');?>", {id: $scope.mass.activeGroup.id}).success(function(dat, status){
						if(!dat.message.errno) {
							$scope.mass.activeGroup.msgtype = 'news';
							$scope.mass.activeGroup.group = '-1';
							$scope.mass.activeGroup.media_id = '';
							$scope.mass.activeGroup.media.items = [{title: '请选择素材'}];
						} else {
							util.message('清空群发失败:<br>' + dat.message.message, "", 'error');
						}
					});
				} else {
					$scope.mass.activeGroup.msgtype = 'news';
					$scope.mass.activeGroup.group = '-1';
					$scope.mass.activeGroup.media_id = '';
					$scope.mass.activeGroup.media.items = [{title: '请选择素材'}];
				}
				return false;
			}

			$scope.mass.purview = function(item){
				$scope.mass.editGroup(item);
				if(!$scope.mass.activeGroup.media_id) {
					util.message('请先设置素材', '', 'error');
					return false;
				}

				var media_id = $scope.mass.activeGroup.media_id;
				var type = $scope.mass.activeGroup.msgtype;
				$('#modal-view').modal('show');

				$('#modal-view .btn-view').unbind().click(function(){
					var wxname = $.trim($('#modal-view #wxname').val());
					if(!wxname) {
						util.message('微信号不能为空', '', 'error');
						return false;
					}
					$('#modal-view').modal('hide');
					$.post("<?php  echo url('material/display/purview/');?>", {media_id: media_id, wxname: wxname, type: type}, function(data){
						if(data != 'success') {
							util.message(data, '', 'error');
						} else {
							util.message('发送成功', '', 'success');
						}
					});
					return false;
				});
			}

			$scope.mass.editGroup = function(item){
				var index = $.inArray(item, $scope.mass.groups);
				if(index == -1) return false;
				var top = $('#group-' + index).offset().top;
				$('#edit-container').css('marginTop', top - 220);
				$("html,body").animate({scrollTop: top-80}, 500);
				$scope.mass.activeIndex = index;
				$scope.mass.activeGroup = $scope.mass.groups[$scope.mass.activeIndex];
			}

			$scope.mass.changeMedia = function(){
				if($scope.mass.activeGroup.status == 0) {
					util.message($scope.mass.activeGroup.time + '群发已经发送,不能编辑');
					return false;
				}
				util.material(function(material){
					if(!material.media_id) {
						util.message('素材media_id为空,请选择其他素材');
						return false;
					}
					$scope.mass.activeGroup.msgtype = material.type;
					$scope.mass.activeGroup.media_id = material.media_id;
					$scope.mass.activeGroup.media = material;
					$scope.mass.activeGroup.attach_id = material.id;
					$scope.$apply();
				});
			}

			$scope.mass.playaudio = function(){
				$("#voice, .panel").on('click', '.audio-player-play', function(){
					var src = $(this).data("attach");
					if(!src) {
						return;
					}
					if ($("#player")[0]) {
						var player = $("#player");
					} else {
						var player = $('<div id="player"></div>');
						$(document.body).append(player);
					}
					player.data('control', $(this));
					player.jPlayer({
						playing: function() {
							$(this).data('control').find("i").removeClass("fa-play").addClass("fa-stop");
						},
						pause: function (event) {
							$(this).data('control').find("i").removeClass("fa-stop").addClass("fa-play");
						},
						swfPath: "resource/components/jplayer",
						supplied: "mp3,wma,wav,amr",
						solution: "html, flash"
					});
					player.jPlayer("setMedia", {mp3: $(this).data("attach")}).jPlayer("play");
					if($(this).find("i").hasClass("fa-stop")) {
						player.jPlayer("stop");
					} else {
						$('.audio-msg').find('.fa-stop').removeClass("fa-stop").addClass("fa-play");
						player.jPlayer("setMedia", {mp3: $(this).data("attach")}).jPlayer("play");
					}
				});
			}

			$scope.mass.playaudio();
		});
		angular.bootstrap($('#mass-container')[0], ['app']);
	});
</script>
<?php (!empty($this) && $this instanceof WeModuleSite || 0) ? (include $this->template('common/footer', TEMPLATE_INCLUDEPATH)) : (include template('common/footer', TEMPLATE_INCLUDEPATH));?>
