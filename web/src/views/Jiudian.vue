<template>
	<!-- 酒店单页 -->
	<div>
		<div class="myJiudian">
			<!-- 标题 -->
			<div class="jdHeader">{{xiangqing.jtitle}}</div>
			
			<!-- 轮播图 -->
			<div class="xqBanner">
				<el-carousel>
					<el-carousel-item v-for="item in jnum" :key="item">
						<img :src="'http://localhost:3000/jiudian/0'+jid+item+'.jpg'" alt="">
					</el-carousel-item>
				</el-carousel>
			</div>
			
			<div class="qita">
				<div class="jianjie">
					<div>酒店简介</div>
					<div class="lijizhifu">
						<span class="jiage">￥{{xiangqing.price}}</span>
						<el-button type="danger" @click="zhifu">立即支付</el-button>
					</div>
				</div>
				<div class="fgzian"></div>
				
				<!-- 地址 -->
				<div class="address">
					<i class="el-icon-location-outline"></i>
					{{xiangqing.address}}
				</div>
				<!-- 内容 -->
				<div class="neirong" v-html="xiangqing.jnr">
				</div>
				
				<div class="fgzian"></div>
			</div>
		</div>
	</div>
	
</template>

<script>
	export default {
	  props: {
	  	uid: {},
			jid: {}
	  },
		data() {
			return {
				xiangqing: {},
				jnum: 0
			}
		},
		methods: {
			async fetchXiangqing(){
				const res = await this.$http.post('/xiangqing', {jid: this.jid})
				this.xiangqing = res.data[0]
				this.jnum = this.xiangqing.jnum
			},
			zhifu() {
				this.$alert(`<div>扫描下面二维码支付${this.xiangqing.price}元</div><img src="http://localhost:3000/erweima/1.jpg" alt="">`, '立即支付', {
					dangerouslyUseHTMLString: true,
					confirmButtonText: '支付完成'
				});
			}
		},
		created() {
			this.fetchXiangqing()
		}
	}
</script>

<style>
	/* 顶部标题 */
	.myJiudian{
		box-sizing: border-box;
		width: 100%;
		backdrop-filter: blur(5px);/* 模糊玻璃效果滤镜 */
		background: rgba(255, 255, 255, 0.9);/* 白色半透明背景色 */
		margin: 20px 0;
	}
	.jdHeader{
		background-color: rgba(0, 0, 0, 0.5);
		box-sizing: border-box;
		padding: 10px;
		text-align: center;
		font-size: 25px;
		color: #fff;
		font-weight: 600;
		border-bottom: 2px solid #fff;
	}
	/* 轮播图图片 */
	.xqBanner img{
		width: 100%;
	}
	/* 内容介绍 */
	.qita{
		padding: 20px;
	}
	.jianjie{
		font-size: 25px;
		font-weight: 600;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	.lijizhifu{
		display: flex;
		align-items: center;
	}
	.lijizhifu .jiage{
		color: #FF0004;
		margin-right: 10px;
	}
	
	/* 分割线 */
	.fgzian{
		margin: 20px 0;
		width: 100%;
		border-top: 2px dashed #9a9a9a ;
	}
	.neirong {
		font-size: 14px;
		line-height: 25px;
	}
	.neirong img {
		width: 100%;
	}
	
	
	/* 媒体查询 */
	@media screen and (min-width: 900px){/* 窗口大于900px时 */
		.el-carousel__container{
			height: 30vw;
		}
	}
	@media screen and (max-width: 899px){/* 窗口小于899px时 */
		.el-carousel__container{
			height: 270px;
		}
	}
</style>