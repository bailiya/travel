import Vue from 'vue'
import VueRouter from 'vue-router'

//普通导入
// import Main from './views/Main.vue'
// import Login from './views/Login.vue'
// import Register from './views/Register.vue'
// import Index from './views/Index.vue'
// import Recommend from './views/Recommend.vue'
// import Order from './views/Order.vue'
// import Personage from './views/Personage.vue'
// import Jiudian from './views/Jiudian.vue'

//路由懒加载的方式导入
const Main = () => import('./views/Main.vue')
const Login = () => import('./views/Login.vue')
const Register = () => import('./views/Register.vue')
const Index = () => import('./views/Index.vue')
const Recommend = () => import('./views/Recommend.vue')
const Order = () => import('./views/Order.vue')
const Personage = () => import('./views/Personage.vue')
const Jiudian = () => import('./views/Jiudian.vue')

Vue.use(VueRouter)

const routes = [
	{
		path: '/',
		name: 'main',
		component: Main,
		props: true,
		children: [{
				path: '/index/:uid',
				component: Index,
				props: true,
				meta: {
					title: "首页"
				}
			},
			{
				path: '/recommend/:uid',
				component: Recommend,
				props: true,
				meta: {
					title: "推荐"
				}
			},
			{
				path: '/order/:uid',
				component: Order,
				props: true,
				meta: {
					title: "订购"
				}
			},
			{
				path: '/personage/:uid',
				component: Personage,
				props: true,
				meta: {
					title: "我的"
				}
			},
			{
				path: '/jiudian/:uid/:jid',
				component: Jiudian,
				props: true,
				meta: {
					title: "酒店"
				}
			}
		]
	},
	{
		path: '/login',
		name: 'login',
		component: Login,
		meta: {
			title: "登录"
		}
	},
	{
		path: '/register',
		name: 'register',
		component: Register,
		meta: {
			title: "注册"
		}
	}
]

const router = new VueRouter({
	routes 
})

//导航守卫，监听路由的跳转，从from页面跳转到to页面
router.beforeEach((to, from, next) => {
	document.title = to.meta.title
	next()
})

export default router
