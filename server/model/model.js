const mysql = require('mysql')


/* 
 *	数据库模型的基类
 *	封装了数据库操作
 */
module.exports = class Model{
	//数据库连接对象
	static conn = null
	
	//数据库连接方法
	static connection(){
		Model.conn = mysql.createConnection({
			host: '127.0.0.1',
			user: 'root', //数据库用户名
			password: '123456', //数据库密码
			database: 'travel' //数据库名
		})
		//开始连接
		Model.conn.connect(err => {
			//如果连接出错
			if(err){
				console.log(`数据库连接失败：${err.message}`)
			}
		})
	}
	
	
	//关闭数据库连接
	static end(){
		//如果非空，关闭数据库连接
		if(null != Model.conn){
			Model.conn.end()
		}
	}
	
	
	/* 
	 * 通用查询
	 * @param {String} sql 要执行的SQL语句
	 * @param {Array} params 给SQL语句占位符进行赋值的参数数组
	 */
	static query(sql, params){
		return new Promise((resolve, reject) => {
			this.connection()//数据库连接
			
			//通用查询
			Model.conn.query(sql, params, (err,results) => {
				if(err){
					reject(err)
				}else{
					resolve(results)
				}
			})
			
			this.end()//数据库关闭
		})
	}
}