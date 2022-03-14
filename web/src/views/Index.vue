<template>
	<!-- 首页 -->
	<div>
		<div class="myCity">
			<el-form>
				<el-form-item label-width='15%' label='城市:'>
					<el-select v-model="provincial.pid" @change="selectProvincial()">
						<el-option v-for="item of provincials" :key="item.pid"
						:label="item.provincial"
						:value="item.pid"
						></el-option>
					</el-select>
					<el-select v-model="city.cid" @change="selectCity()">
						<el-option v-for="item of citys" :key="item.cid"
						:label="item.city"
						:value="item.cid"
						></el-option>
					</el-select>
				</el-form-item>
			</el-form>
		</div>
		
		
		<div class="cityShow">
			<!-- 每一个元素 -->
			<div class="cityItem" v-for="item in scenics" :key="item.sid">
				<img :src="item.image" alt="">
				<h4>{{item.title}}</h4>
				<div class="introduce">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					{{item.introduce}}
				</div>
			</div>
			
			<div class="myFoot">{{myFoot}}</div>
		</div>
	</div>
</template>

<script>
	export default{
		props: {
			uid: {}
		},
		data() {
			return {
				provincials: [],
				citys: [],
				scenics: [],
				provincial: {},
				city: {},
				myFoot: '-------------我是有底线的-------------'
			}
		},
		methods:{
			//获取省
			async fetchProvincial(){
				let res = await this.$http.get('/provincial')
				this.provincials = res.data
			},
			//根据省的id获取市
			async fetchCity(){
				let res = await this.$http.post('/city', this.provincial)
				this.citys = res.data
			},
			//获取景点信息
			async fetchScenic(){
				//如果选择了市
				if(this.city.cid != undefined){
					let res = await this.$http.post('/scenic', this.city)
					this.scenics = res.data
				//如果选择了省
				}else if(this.provincial.pid != undefined){
					let res = await this.$http.post('/scenic', this.provincial)
					this.scenics = res.data
				//都没选
				}else{
					let res = await this.$http.get('/scenic')
					this.scenics = res.data
				}
				this.ifScenics()
			},
			//判断是否有景点
			ifScenics(){
				if(this.scenics.length < 1){
					this.myFoot = '-----------该城市暂无景点呢-----------'
				}else{
					this.myFoot = '-------------我是有底线的-------------'
				}
			},
			//当选择了省之后，执行获取市的函数，并且重新获取景点
			selectProvincial(){
				this.city = {}
				this.fetchCity()
				this.fetchScenic()
			},
			//当选择了市之后，重新获取景点
			selectCity(){
				this.fetchScenic()
			}
		},
		created() {
			this.fetchProvincial()
			this.fetchScenic()
		}
	}
</script>

<style>
	/* 选择城市部分 */
	.myCity{
		width: 100%;
		margin: 20px 0;
		background-color: rgba(0, 0, 0, 0.5);
		box-sizing: border-box;
		padding: 5px 10px;
		border-bottom: 2px solid #fff;
	}
	.el-form-item{
		margin: 0;
	}
	/* input框排列 */
	.el-form-item__content{
		display: flex;
		justify-content: space-around;
	}
	.el-form-item__content .el-select{
		width: 40%;
		text-align: center;
	}
	/* label字体 */
	.el-form-item__label{
		color: #fff;
		font-size: 25px;
		font-weight: 600;
		letter-spacing: 2px;/* 文字间距 */
	}
	/* input框样式 */
	.el-form-item__content input{
		padding: 5px 20px;
		box-sizing: border-box;/* 避免input宽度溢出 */
		outline:none;/* 取消选中后的高亮 */
		border-radius: 10px;/* 圆角 */
		background: rgba(255, 255, 255, 0.3);/* 背景颜色 */
		border: 1px solid rgba(255, 255, 255, 0.3);/* 边框 */
		border-right: 1px solid rgba(255, 255, 255, 0.1);/* 右边框 */
		border-bottom: 1px solid rgba(255, 255, 255, 0.1);/* 下边框 */
		font-size: 16px;
		letter-spacing: 1px;/* 文字间距 */
		box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);/* 阴影 */
		width: 100%;
		height: 30px;
	}
	/* 输入框内文字颜色 */
	.el-form-item__content input::placeholder, .el-input__inner{
		color: #FFFFFF;
	}
	
	
	/* 旅游城市展示 */
	.cityShow{
		box-sizing: border-box;
		width: 100%;
		backdrop-filter: blur(5px);/* 模糊玻璃效果滤镜 */
		background: rgba(255, 255, 255, 0.3);/* 白色半透明背景色 */
		display: flex;
		flex-wrap: wrap;
		padding: 20px;
	}
	/* 每一个景点 */
	.cityShow .cityItem{
		height: 300px;
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
	.cityItem img{
		width: 100%;
	}
	/* 标题 */
	.cityItem h4{
		margin: 10px 0;
		color: #435894;
	}
	/* 介绍 */
	.cityItem .introduce{
		font-size: 13px;
		line-height: 21px;
		height: 30%;
		width: 100%;
		overflow: hidden;/* 文字超出部分隐藏 */
		-webkit-line-clamp: 4;/* 只显示四行 */
	}
	
	/* 底部 */
	.myFoot{
		width: 100%;
		text-align: center;
		margin-top: 20px;
		font-size: 25px;
		font-weight: 600;
		color: #fff;
	}
	
	
	/* 媒体查询 */
	@media screen and (min-width: 1299px){/* 窗口大于1299px时 */
		.cityShow .cityItem{
			width: 23%;
			margin: 1%;
		}
	}
	@media screen and (min-width: 937px) and (max-width: 1299px){/* 窗口大于937px,小于1299px时 */
		.cityShow .cityItem{
			width: 30%;
			margin: 1.66%;
		}
	}
	@media screen and (max-width: 936px){/* 窗口小于936px时 */
		.cityShow .cityItem{
			width: 44%;
			margin: 3%;
		}
	}
</style>
