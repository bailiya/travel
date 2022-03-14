<template>
	<!-- 登录 -->
  <div id="mycontainer">
		<div class="banner">
			<el-carousel height="500px">
				<el-carousel-item v-for="item in banners" :key="item.bid">
					<img :src="item.url" alt="">
				</el-carousel-item>
			</el-carousel>
		</div>
		
		
  	<div id="mylogin">
  		<form @submit.prevent='login'>
  			<div class="loginhead">
  				<h2>Login</h2>
  				<p class="tips" :class="{notshow: notshow}">
						{{msg}}
  				</p>
  			</div>
  			<div class="myinputBox">
  				<input v-model="user.username" type="text" placeholder="账号">
  			</div>
  			<div class="myinputBox">
  				<input v-model="user.password" type="password" placeholder="密码">
  			</div>
  			<div class="myinputBox">
  				<input type="submit" value="登录">
  			</div>
  			<p class="myforget">
  				没有账号？<a href="#" @click="$router.push('/register')">点击这里</a>
  			</p>
  		</form>
  	</div>
  </div>
</template>

<script>
export default {
  data() {
		return {
			user: {
				username: '',
				password: ''
			},
			notshow: true,
			msg:'',
			banners: []
		}
	},
	methods: {
		//保存
		async login(){
			//判断用户名
			if(this.user.username.length < 3){
				this.msg = '请输入3个字符或以上的用户名'
				this.notshow = false
			//判断密码
			}else if(this.user.password.length < 6){
				this.msg = '请输入6个字符或以上的密码'
				this.notshow = false
			}else{
				this.notshow = true
				//请求登录接口
				let res = await this.$http.post('/login', this.user)
				if(res.data.message){
					this.$message({
						showClose: true,
						message: '用户名或密码错误',
						type: 'error'
					});
				//判断用户名是否存在，如果不存在，跳转到登录界面
				}else{
					this.$router.push(`/index/${res.data[0].uid}`)//跳转到首页
					this.$message({
						showClose: true,
						type: 'success',
						message: '登录成功'
					})
				}
			}
		},
		//获取banner图
		async fetchBanner(){
			let res = await this.$http.get('/banner')
			this.banners = res.data
		}
	},
	created(){
		this.fetchBanner()
	}
}
</script>

<style>
	/* 登录页面 */
	#mycontainer{
		width: 100vw;
		height: 100vh;
		display: flex;
		background-color: rgba(1, 1, 1, 0.2);
		/* 水平垂直居中 */
		justify-content: center;
		align-items: center;
	}
	
	.banner{
		height: 500px;
		width: 700px;
		border-top: 1px solid rgba(255, 255, 255);
		border-left: 1px solid rgba(255, 255, 255);
		box-shadow: 0 25px 45px rgba(0, 0, 0, 0.7);/* 阴影，左右不偏移，向下偏移25px，阴影宽度45px */
		flex-shrink: 0;/* 不允许缩小 */
	}
	.banner img{
		height: 500px;
		width: 700px;
	}
	
	/* 登录框 */
	#mylogin{
		width: 400px;
		min-height: 500px;
		background: rgba(255, 255, 255, 0.3);
		display: flex;
		justify-content: center;
		align-items: center;
		backdrop-filter: blur(5px);/* 模糊玻璃效果滤镜 */
		box-shadow: 25px 25px 45px rgba(0, 0, 0, 0.7);/* 阴影，向右偏移25px，向下偏移25px，阴影宽度45px */
		border-top: 1px solid rgba(255, 255, 255);
		flex-shrink: 0;/* 不允许缩小 */
	}
	
	/* 登录标题 */
	.loginhead{
		height: 100px;
		position: relative;
	}
	#mylogin h2{
		text-align: center;
		color: #fff;
		font-size: 30px;
		font-weight: 600;
		letter-spacing: 2px;/* 文字间距 */
	}
	
	
	/* 输入框和登录按钮 */
	#mylogin .myinputBox{
		width: 280px;
		margin-bottom: 30px;
	}
	#mylogin .myinputBox input{
		width: 100%;
		color: #fff;
	}
	/* 输入框内文字颜色 */
	#mylogin .myinputBox input::placeholder{
		color: #FFFFFF;
	}
	/* 输入框样式 */
	#mylogin input{
		padding: 10px 20px;
		box-sizing: border-box;/* 避免input宽度溢出 */
		outline: none;/* 取消选中后的高亮 */
		border-radius: 30px;/* 圆角 */
		background: rgba(255, 255, 255, 0.3);/* 背景颜色 */
		border: 1px solid rgba(255, 255, 255, 0.3);/* 边框 */
		border-right: 1px solid rgba(255, 255, 255, 0.1);/* 右边框 */
		border-bottom: 1px solid rgba(255, 255, 255, 0.1);/* 下边框 */
		font-size: 16px;
		letter-spacing: 1px;/* 文字间距 */
		box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);/* 阴影 */
	}
	/* 输入框被点击时的状态 */
	#mylogin input[type='text']:focus,#mylogin input[type='password']:focus {
		border: 1px solid #ffffff;/* 边框 */
		box-shadow: 0 0 10px #ffffff;/* 阴影 */
	}
	/* 登录按钮样式 */
	input[type='submit']{
		background: #FFFFFF;
		color: #666;
		cursor: pointer;/* 改变光标样式 */
	}
	/* 登录按钮被点击时的状态 */
	input[type='submit']:active{
		background: rgba(255, 255, 255, 0.3);
		box-shadow: 3px 3px 3px rgba(0, 0, 0, 0.1) inset;/* inset内阴影 */
		border: 1px solid rgba(0, 0, 0, 0.1);
	}
	/* 登录按钮样式 */
	#mylogin .myinputBox input[type='submit']{
		background: #FFFFFF;
		color: #666;
		cursor: pointer;/* 改变光标样式 */
	}
	#mylogin .myinputBox input[type='submit']:active{
		background: rgba(255, 255, 255, 0.3);
		box-shadow: 3px 3px 3px rgba(0, 0, 0, 0.1) inset;
		border: 1px solid rgba(0, 0, 0, 0.1);
	}
	
	/* 忘记密码 */
	#mylogin .myforget{
		color: #FFFFFF;
		letter-spacing: 1px;
		font-size: 15px;
		font-family: "宋体";
		text-align: right;
	}
	#mylogin .myforget a{
		color: #bcffff;
		font-weight: 600;
	}
	
	
	/* 登录提示 */
	#mylogin .tips{
		position: absolute;
		text-align: center;
		left: 0;
		bottom: 0;
		width: 277px;
		padding: 2px 0;
		font-size: 12px;
		font-weight: 300;
		letter-spacing: 2px;
		color: #FFFFFF;
		border-radius: 10px;
		background-color: rgba(255, 123, 130, 0.5);
	}
	#mylogin .notshow{
		display: none;
	}
</style>
