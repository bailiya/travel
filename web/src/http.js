//放axios请求

//引入axios
import axios from 'axios'

const http = axios.create({
	baseURL: 'http://localhost:3000'
})

export default http