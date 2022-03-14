<template>
	<!-- 注册 -->
  <div class="reContainer">
  	<div class="register">
  		<form @submit.prevent='save'>
  			<div class="reHead">
  				<h2>Register</h2>
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
  				<input type="submit" value="注册">
  			</div>
  			<p class="myforget">
  				已有账号？<a href="#" @click="$router.push('/login')">点击这里</a>
  			</p>
  		</form>
  	</div>
  
		<div class="reBanner">
			<el-carousel height="500px">
				<el-carousel-item v-for="item in banners" :key="item.bid">
					<img :src="item.url" alt="">
				</el-carousel-item>
			</el-carousel>
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
		//注册
		async save(){
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
				//请求注册接口
				let res = await this.$http.post('/register', this.user)
				//判断异常，用户名是否存在，如果存在，用弹窗提示
				if(res.data.message){
					this.$message({
						showClose: true,
						message: '用户名已存在',
						type: 'error'
					});
				//判断用户名是否存在，如果不存在，跳转到登录界面
				}else{
					this.$router.push('/login')//跳转到登录界面
					this.$message({
						type: 'success',
						message: '注册成功'
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
	/* 注册页面 */
	.reContainer{
		width: 100vw;
		height: 100vh;
		display: flex;
		background-color: rgba(1, 1, 1, 0.2);
		/* 水平垂直居中 */
		justify-content: center;
		align-items: center;
	}
	
	.reBanner{
		height: 500px;
		width: 700px;
		border-top: 1px solid rgba(255, 255, 255);
		box-shadow: 25px 25px 45px rgba(0, 0, 0, 0.7);/* 阴影，向右偏移25px，向下偏移25px，阴影宽度45px */
		flex-shrink: 0;/* 不允许缩小 */
	}
	.reBanner img{
		height: 500px;
		width: 700px;
	}
	
	/* 注册框 */
	.register{
		width: 400px;
		min-height: 500px;
		background: rgba(255, 255, 255, 0.3);
		display: flex;
		justify-content: center;
		align-items: center;
		backdrop-filter: blur(5px);/* 模糊玻璃效果滤镜 */
		box-shadow: 0 25px 45px rgba(0, 0, 0, 0.7);/* 阴影，左右不偏移，向下偏移25px，阴影宽度45px */
		border-top: 1px solid rgba(255, 255, 255);
		border-left: 1px solid rgba(255, 255, 255);
		flex-shrink: 0;/* 不允许缩小 */
	}
	
	/* 注册标题 */
	.reHead{
		height: 100px;
		position: relative;
	}
	.register h2{
		text-align: center;
		color: #fff;
		font-size: 30px;
		font-weight: 600;
		letter-spacing: 2px;/* 文字间距 */
	}
	
	
	/* 输入框和注册按钮 */
	.register .myinputBox{
		width: 280px;
		margin-bottom: 30px;
	}
	.register .myinputBox input{
		width: 100%;
		color: #fff;
	}
	/* 输入框内文字颜色 */
	.register .myinputBox input::placeholder{
		color: #FFFFFF;
	}
	/* 输入框样式 */
	.register input{
		padding: 10px 20px;
		box-sizing: border-box;/* 避免input宽度溢出 */
		outline:none;/* 取消选中后的高亮 */
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
	.register input[type='text']:focus,.register input[type='password']:focus {
		border: 1px solid #ffffff;/* 边框 */
		box-shadow: 0 0 10px #ffffff;/* 阴影 */
	}
	/* 注册按钮样式 */
	.register input[type='submit']{
		background: #FFFFFF;
		color: #666;
		cursor: pointer;/* 改变光标样式 */
	}
	/* 注册按钮被点击时的状态 */
	.register input[type='submit']:active{
		background: rgba(255, 255, 255, 0.3);
		box-shadow: 3px 3px 3px rgba(0, 0, 0, 0.1) inset;/* inset内阴影 */
		border: 1px solid rgba(0, 0, 0, 0.1);
	}
	/* 注册按钮样式 */
	.register .myinputBox input[type='submit']{
		background: #FFFFFF;
		color: #666;
		cursor: pointer;/* 改变光标样式 */
	}
	.register .myinputBox input[type='submit']:active{
		background: rgba(255, 255, 255, 0.3);
		box-shadow: 3px 3px 3px rgba(0, 0, 0, 0.1) inset;
		border: 1px solid rgba(0, 0, 0, 0.1);
	}
	
	/* 忘记密码 */
	.register .myforget{
		color: #FFFFFF;
		letter-spacing: 1px;
		font-size: 15px;
		font-family: "宋体";
		text-align: right;
	}
	.register .myforget a{
		color: #bcffff;
		font-weight: 600;
	}
	
	
	/* 注册提示 */
	.register .tips{
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
	.register .notshow{
		display: none;
	}
</style>
