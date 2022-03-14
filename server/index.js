const express = require("express")
const Model = require('./model/model') //引入数据库文件

const app = express()

app.use(require('cors')()) //允许跨域
app.use(express.json()) //可以使用req.body
app.use(express.static('static')) //允许访问静态资源


//注册路由
app.post('/register', async (req, res) => {
	//获取输入的用户名
	let {username,password} = req.body
	//根据输入的用户名在数据库查询
	let sql = 'SELECT * FROM user WHERE username = ?'
	const user = await Model.query(sql, username)
	//如果数据库有这个用户名，抛出错误
	if(user.length >= 1){
		res.send({message: true})
	//如果数据库没有这个用户名，执行插入操作
	}else{
		sql = `INSERT INTO USER ( username, password ) VALUES ("${username}", "${password}")`
		await Model.query(sql)
		res.send()
	}
})

//登录路由
app.post('/login', async (req, res) => {
	//获取输入的用户名
	let {username,password} = req.body
	//根据输入的用户名在数据库查询
	let sql = 'SELECT * FROM user WHERE username = ?'
	const user = await Model.query(sql, username)
	//如果数据库有这个用户名
	if(user.length >= 1){
		//再判断密码是否相等
		if(password != user[0].password){
			res.send({message: true})
		}else{
			res.send(user)
		}
	//如果数据库没有这个用户名，抛出错误
	}else{
		res.send({message: true})
	}
})

//获取banner图
app.get('/banner', async (req, res) => {
	//在数据库查询banner图表
	let sql = 'SELECT * FROM banner '
	const banner = await Model.query(sql)
	res.send(banner)
})

//获取省
app.get('/provincial', async (req, res) => {
	//在数据库查询省
	let sql = 'SELECT * FROM provincial'
	const provincial = await Model.query(sql)
	res.send(provincial)
})

//在数据库根据pid获取市
app.post('/city', async (req, res) => {
	const {pid} = req.body
	let sql = 'SELECT * FROM city WHERE pid = ?'
	const city = await Model.query(sql, pid)
	res.send(city)
})

//在数据库根据省市获取景点
app.post('/scenic', async (req, res) => {
	let id = ''
	let sql = ''
	//如果传过来的是市
	if(req.body.cid != undefined){
		id = req.body.cid
		sql = 'SELECT * FROM scenic WHERE cid = ?'
	//如果传过来的是省
	}else{
		id = req.body.pid
		sql = 'SELECT * FROM scenic WHERE pid = ?'
	}
	const scenic = await Model.query(sql, id)
	res.send(scenic)
})

//获取全部景点
app.get('/scenic', async (req, res) => {
	let sql = 'SELECT * FROM scenic'
	const scenic = await Model.query(sql)
	res.send(scenic)
})

//获取推荐
app.get('/tuijian', async (req, res) => {
	const sql = 'SELECT * FROM tuijian'
	const tuijian = await Model.query(sql)
	res.send(tuijian)
})

//获取酒店
app.get('/jiudian', async (req, res) => {
	const sql = "SELECT * FROM jiudian"
	const jiudian = await Model.query(sql)
	res.send(jiudian)
})

//获取酒店详情
app.post('/xiangqing', async (req, res) => {
	const {jid} = req.body
	const sql = 'SELECT * FROM jiudian WHERE jid = ?'
	const xiangqing = await Model.query(sql, jid)
	res.send(xiangqing)
})

//订购酒店
app.post('/dinggou', async (req, res) => {
	const { uid, jid } = req.body
	//根据传入的酒店信息在数据库查询
	let sql = `SELECT * FROM user_jd WHERE uid = ${uid} and jid = ${jid}`
	const dinggou = await Model.query(sql)
	//如果数据库已经有这条数据
	if(dinggou.length >= 1){
		res.send({message: true})
	//如果数据库没有这条数据，执行插入操作
	}else{
		sql = `INSERT INTO user_jd (uid, jid) VALUES ("${uid}", "${jid}")`
		await Model.query(sql)
		res.send()
	}
})

//获取当前账号订购的酒店
app.post('/myjiudian', async (req, res) => {
	const {uid} = req.body
	const sql = 'SELECT jiudian.jid,jtitle,jimg,price,address,jieshao,isShow FROM jiudian,user_jd WHERE user_jd.`uid` = ? AND jiudian.`jid` = user_jd.`jid`'
	const myJiudian = await Model.query(sql, uid)
	res.send(myJiudian)
})

//删除当前账号订购的酒店
app.post('/deletejd', async (req, res) => {
	const {uid ,jid} = req.body
	const sql = `DELETE FROM user_jd WHERE uid = ${uid} AND jid = ${jid}`
	await Model.query(sql)
	res.send()
})


app.listen(3000, () => {
	console.log("http://localhost:3000")
})