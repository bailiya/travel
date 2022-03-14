<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<style>
	html,body{
		margin: 0;
		padding: 0;
	}
	body{
		background-image: url(../public/images/背景.jpg);
	}
	a{
		text-decoration: none;/* 取消a标签的下划线 */
	}
	ul{
		margin: 0;
		padding: 0;
	}
	li{
		list-style-type: none;/* 取消li标签的小圆点 */
	}
	img{
		display: block;/* 去掉img自带间距 */
	}
</style>
