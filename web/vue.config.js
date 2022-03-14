module.exports = {
	// 需要打包的文件过大会报错，解决方法：
	// 1.修改下面配置，把maxAssetSize，maxEntrypointSize的值改大
	// 2.用路由懒加载的模式来导入，分别打包成一个个小文件，参考src/router.js里面的配置
	// configureWebpack: (config) => {
	// 	if(process.env.NODE_ENV === 'production'){//为生产环境修改配置
	// 		config.mode = 'production';
	// 		config["performance"] = { //打包文件大小配置
	// 			"maxAssetSize": 3000000000, 
	// 			"maxEntrypointSize": 1000000000, 
	// 		}
	// 	}
	// },
	publicPath: "./" //打包的js和css的路径
}