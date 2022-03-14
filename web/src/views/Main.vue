<template>
	<!-- 通用顶部导航 -->
  <div class="container">
		<div class="myMain">
			<!-- 顶部导航栏 -->
			<div class="myHeader">
				<!-- router允许使用路由，:default-active="$route.path"点开的那个高亮 -->
				<el-menu
				  :default-active = "$route.path"
					router
				  class="el-menu-demo myUser"
				  mode="horizontal"
				  background-color="#2f426a"
				  text-color="#9dbcff"
				  active-text-color="#ffffff">
				  <el-menu-item :index="'/index/' + uid"><i class="el-icon-menu"></i>首页</el-menu-item>
				  <el-menu-item :index="'/recommend/' + uid"><i class="el-icon-reading"></i>推荐</el-menu-item>
				  <el-menu-item :index="'/order/' + uid"><i class="el-icon-goods"></i>订购</el-menu-item>
				  <el-menu-item :index="'/personage/' + uid"><i class="el-icon-user"></i>我的</el-menu-item>
					<el-menu-item class="tuichu" index="/login">
						<el-button type="danger" round @click="$router.push('/login')">退出登录</el-button>
					</el-menu-item>
				</el-menu>
			</div>
			
			<!-- 下面内容部分 -->
			<div>
				<router-view :key="$route.path"></router-view>
				
				<div class="footer">
					<div class="diyipai">
						<span><i class="el-icon-s-help"></i>出境游</span>
						<span><i class="el-icon-help"></i>国内游</span>
						<span><i class="el-icon-s-promotion"></i>周边游</span>
					</div>
					<div class="diyipai">
						<span><i class="el-icon-s-flag"></i>目的地大全&nbsp;</span>
						<span><i class="el-icon-s-claim"></i>特卖精选&nbsp;&nbsp;</span>
						<span><i class="el-icon-video-camera-solid"></i>视频攻略&nbsp;</span>
					</div>
					<div class="dierpai">
						<span @click="$router.push('/login')">登录</span>
						<div></div>
						<span @click="$router.push('/register')">注册</span>
					</div>
					<div class="disanpai">
						<span>2021&nbsp;xx大学.xx班&nbsp;&copy;&nbsp;版权所有</span>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</template>

<script>
export default {
  props: {
  	uid: {}
  },
	created() {
		//判断是否登录
		if(this.uid == undefined){
			this.$router.push('/login')//跳转到登录页面
		}
	}
}
</script>

<style>
	@media screen and (min-width: 880px){/* 窗口大于900px时 */
		.myMain{
			width: 60%;
		}
	}
	@media screen and (max-width: 879px){/* 窗口小于899px时 */
		.myMain{
			width: 560px;
		}
	}
	.container{
		width: 100vw;
		height: 100vh;
		background-color: rgba(1, 1, 1, 0.1);
	}
	.myMain{
		margin: auto;/* 居中 */
		height: 100vh;
		position: relative;
	}
	.myUser .tuichu{
		position: absolute;
		right: 0;
	}
	.myUser .tuichu .el-button{
		font-size: 12px;
		width: 70px;
		text-align: center;
		padding: 8px 5px;
	}
	.footer{
		width: 100%;
		height: 180px;
		box-sizing: border-box;
		background-color: rgba(255, 255, 255, 0.8);
		padding: 30px 50px;
		color: #555555;
	}
	.diyipai{
		display: flex;
		margin-bottom: 10px;
		justify-content: space-around;
	}
	.dierpai{
		display: flex;
		width: 100px;
		margin: auto;
		margin-top: 20px;
		justify-content: space-between;
		align-items: center;
	}
	.dierpai div{
		width: 1px;
		height: 15px;
		background-color: #555555;
		margin-top: 1px;
	}
	.dierpai span{
		cursor: pointer;/* 改变光标样式 */
	}
	.disanpai{
		font-size: 13px;
		text-align: center;
		margin-top: 10px;
	}
</style>
