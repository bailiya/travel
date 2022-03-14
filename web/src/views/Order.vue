<template>
	<!-- 订购 -->
	<div>
		<div class="myOrder">
			<div class="orTitle">
				酒店预订
			</div>
			<div class="orShuxian"></div>
			<div class="orJieshao">提供最优良的住所</div>
		</div>
		
		
		<div class="orShow">
			<!-- 每一个元素 -->
			<div class="orItem" v-for="item in jiudian"
			@mouseenter="item.isShow = 1"
			@mouseleave="item.isShow = 0">
				<img :src="item.jimg" alt="">
				<div class="wenzi">
					<h4>{{item.jtitle}}</h4>
					<span>{{item.address}}</span>
					<div class="price">价格：<span>￥{{item.price}}</span></div>
					<p class="jieshao">酒店介绍：{{item.jieshao}}</p>
				</div>
				
				<!-- 遮罩层 -->
				<div class="zhezhao" v-if = "item.isShow">
					<div class="chakan" @click="getXiangqing(item.jid)">详情</div>
					<div class="dinggou" @click="getDinggou(item.jid)">订购</div>
				</div>
			</div>
			
			<div class="orFoot">-------------我是有底线的-------------</div>
		</div>
	</div>
</template>

<script>
	export default {
	  props: {
	  	uid: {}
	  },
		data() {
			return {
				jiudian: []
			}
		},
		methods:{
			async fetchJiudian(){
				const res = await this.$http.get('/jiudian')
				this.jiudian = res.data
			},
			//查看酒店详情
			getXiangqing(jid){
				this.$router.push(`/jiudian/${this.uid}/${jid}`)//跳转到酒店详情
			},
			//预订酒店
			async getDinggou(jid){
				const res = await this.$http.post('/dinggou', {uid: this.uid, jid: jid})
				//判断数据库是否有这条数据
				if(res.data.message){
					this.$message({
						showClose: true,
						message: '不允许重复预订哦',
						type: 'error'
					});
				}else{
					this.$message({
						showClose: true,
						type: 'success',
						message: '预订成功!'
					});
				}
			}
		},
		created() {
			this.fetchJiudian()
		}
	}
</script>

<style>
	/* 顶部标题 */
	.myOrder{
		width: 100%;
		margin: 20px 0;
		background-color: rgba(0, 0, 0, 0.5);
		box-sizing: border-box;
		padding: 5px;
		border-bottom: 2px solid #fff;
		display: flex;
		align-items: center;
	}
	/* 标题文字 */
	.orTitle{
		color: #fff;
		font-size: 25px;
		line-height: 40px;
		font-weight: 600;
		letter-spacing: 2px;/* 文字间距 */
		margin-left: 15px;
	}
	/* 短竖线 */
	.orShuxian{
		height: 20px;
		width: 2px;
		background-color: #fff;
		margin: 4px 20px 0;
	}
	/* 小字介绍 */
	.orJieshao{
		color: #d6d6d6;
		font-size: 12px;
		letter-spacing: 1px;/* 文字间距 */
	}
	
	
	/* 旅游路线展示 */
	.orShow{
		box-sizing: border-box;
		width: 100%;
		backdrop-filter: blur(5px);/* 模糊玻璃效果滤镜 */
		background: rgba(255, 255, 255, 0.3);/* 白色半透明背景色 */
		padding: 20px;
	}
	/* 每一个酒店 */
	.orShow .orItem{
		height: 200px;
		background: rgba(255, 255, 255, 0.5);/* 白色半透明背景色 */
		margin-bottom: 20px;
		border-top: 1px solid rgba(255, 255, 255);
		border-left: 1px solid rgba(255, 255, 255);
		box-shadow: 10px 10px 20px rgba(0, 0, 0, 0.5);/* 阴影，向右偏移10px，向下偏移10px，阴影宽度20px */
		display: flex;
		padding: 1.3%;
		box-sizing: border-box;
		width: 100%;
		position: relative;
	}
	/* 图片 */
	.orItem img{
		height: 100%;
	}
	/* 文字 */
	.orItem .wenzi{
		margin-left: 15px;
		width: 100%;
	}
	/* 标题 */
	.orItem .wenzi h4{
		font-size: 18px;
		margin: 0 0 5px;
	}
	/* 地址 */
	.orItem .wenzi span{
		font-size: 13px;
		color: #616161;
	}
	/* 价格 */
	.orItem .wenzi .price{
		margin: 20px 0;
	}
	.orItem .wenzi .price span{
		font-size: 20px;
		color: #ff0004;
	}
	.orItem .wenzi .jieshao{
		color: #616161;
		width: 100%;
		font-size: 14px;
		line-height: 20px;
		height: 40px;
		overflow: hidden;
	}
	/* 底部 */
	.orFoot{
		width: 100%;
		text-align: center;
		margin-top: 20px;
		font-size: 25px;
		font-weight: 600;
		color: #fff;
	}
	
	
	/* 遮罩层 */
	.orItem .zhezhao{
		width: 100%;
		height: 100%;
		background-color: rgba(0, 0, 0, 0.6);
		position: absolute;
		top: -1px;
		left: -1px;
		display: flex;
		align-items: center;
		justify-content: center;
	}
	.orItem .zhezhao div{
		color: #fff;
		background-color: rgba(255, 255, 255, 0.3);
		height: 80px;
		width: 80px;
		border-radius: 50%;
		border: 1px solid #fff;
		margin: 10px;
		text-align: center;
		line-height: 80px;
		font-size: 20px;
		font-weight: 600;
	}
	/* 鼠标移入外发光 */
	.orItem .zhezhao div:hover{
		box-shadow:0 0 37px #ffffff;
		cursor: pointer;/* 改变光标样式 */
	}
</style>
