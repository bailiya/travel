<template>
	<!-- 推荐 -->
	<div>
		<div class="myREcommend">
			<div class="reTitle">
				推荐玩法
			</div>
			<div class="reShuxian"></div>
			<div class="reJieshao">为您规划最适合的玩法</div>
		</div>
		

		<div class="reShow">
			<!-- 每一个元素 -->
			<div class="reItem" v-for="item in tuijian">
				<img :src="item.timg" alt="">
				<h4>{{item.ttitle}}</h4>
				<div class="luxian" v-html="item.tnr">
				</div>
			</div>
			
			<div class="reFoot">-------------我是有底线的-------------</div>
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
				tuijian: []
			}
		},
		methods:{
			//获取推荐路线
			async fetchTuijian(){
				const res = await this.$http.get('/tuijian')
				this.tuijian = res.data
				console.log(this.tuijian)
			}
		},
		created() {
			this.fetchTuijian()
		}
	}
</script>

<style>
	/* 顶部标题 */
	.myREcommend{
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
	.reTitle{
		color: #fff;
		font-size: 25px;
		line-height: 40px;
		font-weight: 600;
		letter-spacing: 2px;/* 文字间距 */
		margin-left: 15px;
	}
	/* 短竖线 */
	.reShuxian{
		height: 20px;
		width: 2px;
		background-color: #fff;
		margin: 4px 20px 0;
	}
	/* 小字介绍 */
	.reJieshao{
		color: #d6d6d6;
		font-size: 12px;
		letter-spacing: 1px;/* 文字间距 */
	}
	
	
	/* 旅游路线展示 */
	.reShow{
		box-sizing: border-box;
		width: 100%;
		backdrop-filter: blur(5px);/* 模糊玻璃效果滤镜 */
		background: rgba(255, 255, 255, 0.3);/* 白色半透明背景色 */
		display: flex;
		flex-wrap: wrap;
		padding: 20px;
	}
	/* 每一个路线 */
	.reShow .reItem{
		height: 620px;
		background: rgba(255, 255, 255, 0.5);/* 白色半透明背景色 */
		margin-bottom: 20px;
		border-top: 1px solid rgba(255, 255, 255);
		border-left: 1px solid rgba(255, 255, 255);
		box-shadow: 10px 10px 20px rgba(0, 0, 0, 0.5);/* 阴影，向右偏移10px，向下偏移10px，阴影宽度20px */
		display: flex;
		flex-direction: column;
		box-sizing: border-box;
		padding: 1.3%;
		justify-content: center;
		align-items: center;
	}
	/* 图片 */
	.reItem img{
		width: 100%;
	}
	.reItem h4{
		margin: 10px 0;
		color: #435894;
	}
	/* 介绍 */
	.reItem .luxian{
		font-size: 13px;
		line-height: 21px;
		height: 50%;
	}
	/* 底部 */
	.reFoot{
		width: 100%;
		text-align: center;
		margin-top: 20px;
		font-size: 25px;
		font-weight: 600;
		color: #fff;
	}
	
	
	/* 媒体查询 */
	@media screen and (min-width: 1130px){/* 窗口大于1130px时 */
		.reShow .reItem{
			width: 46%;
			margin: 2%;
		}
	}
	@media screen and (min-width: 920px) and (max-width: 1129px){/* 窗口大于920px,小于1129px时 */
		.reShow .reItem{
			width: 100%;
		}
		.reItem img{
			width: 75%;
		}
	}
	@media screen and (max-width: 919px){/* 窗口小于919px时 */
		.reShow .reItem{
			width: 100%;
		}
		.reItem img{
			width: 85%;
		}
	}
</style>
