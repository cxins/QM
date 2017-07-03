<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="https://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
<title>学生中心</title>
<style type="text/css">
	
		/* ---------- CSS3 Animated Vignette Buttons by MightyMeta ---------- */	
	
		/* ---------- General Demo Styling - You Can Ignore This Bit ---------- */
	
		body {
		
			position: relative;
			text-align: center;
			background-color: #212322;
		
		}
		
		h1 {
			color: #1A897A;
			font-family: Palatino,serif;
			font-size: 60px;
			margin: 40px;
			text-shadow: 2px 2px 0 #184E2B;
		}
		
		#demo-box {
		
			width: 550px;
			margin: 40px auto;
			padding: 40px 40px 20px;
			background-color: #C7E1D5;
			-moz-border-radius: 12px;
			-webkit-border-radius: 12px;
			-o-border-radius: 12px;
			border-radius: 12px;		
			overflow: hidden;
		}
	
		.button {
		
			float: left;
			margin-bottom: 30px;
		
		}
		
		#info-box {

			clear: left;	
			padding: 20px 20px 10px;		
			background-color: #ABD5C1;
			-moz-border-radius: 10px 10px 10px 10px;
			-webkit-border-radius: 10px 10px 10px 10px;
			-o-border-radius: 10px 10px 10px 10px;
			border-radius: 10px 10px 10px 10px;			
		
		}
		
		p {
			margin: 0 0 1.2em;
			color: #333333;
			font-family: Arial,sans-serif;
			font-size: 13px;
			line-height: 1.3em;			
		}		
		
		.article-link {
			color: #198975;
		}
		
		.article-link:hover {
			text-decoration: none;
		}
		
		#whodunnit {
		
			position: fixed;
			right: 0;
			bottom: 0;
			width: 200px;
			height: 25px;
			padding-top: 5px;
			font-family: Arial, sans-serif;
			font-weight: bold;
			font-size: 16px;
			text-decoration: none;
			color: #fff;
			background-color: #2C2C2C;
		}
		
		#whodunnit:hover {
			text-shadow: 0 0 10px #fff;
		}
		
		span {
		
			color: #198975;		
		
		}

		#eg1 {
			
			
			display: block;
			width: 5em;
			padding: 30px 40px;
			text-align: center;
			font-family: Arial, sans-serif;
			font-size: 18px;
			color: #fff;
			text-decoration: none;
			text-shadow: 1px 1px 0px #000;
			-moz-border-radius: 25px;
			-webkit-border-radius: 25px;
			-o-border-radius: 25px;		
			border-radius: 25px;
			background: url(images/linear-gradient.png) no-repeat 0px -400px, url(images/background.png) no-repeat center -8px;
			-moz-box-shadow: 2px 2px 10px #000;
			-webkit-box-shadow: 2px 2px 10px #000;
			-o-box-shadow: 2px 2px 10px #000;
			box-shadow: 2px 2px 10px #000;		
			-moz-transition: all 1s ease;
			-webkit-transition: all 1s ease;
			-o-transition: all 1s ease;
			transition: all 1s ease;
		
		}
		
		#eg1:hover {
		
			
			background: url(images/linear-gradient.png) no-repeat 0px 0px, url(images/background.png) no-repeat center -8px;
			-moz-transition: all 1s ease;
			-webkit-transition: all 1s ease;
			-o-transition: all 1s ease;
			transition: all 1s ease;
		
		}

		/* ---------- Example Two ---------- */
		
		#eg2 {
	
			
			display: block;
			width: 5em;
			margin: 0px 20px;
			padding: 30px 40px;
			text-align: center;
			font-family: Arial, sans-serif;
			font-size: 18px;
			color: #fff;
			text-decoration: none;
			text-shadow: 1px 1px 0px #000;
			-moz-border-radius: 25px;
			-webkit-border-radius: 25px;
			-o-border-radius: 25px;		
			border-radius: 25px;
			background: url(images/stripes.png) no-repeat 0px 0px, url(images/background.png) no-repeat center -8px;
			-moz-box-shadow: 2px 2px 10px #000;
			-webkit-box-shadow: 2px 2px 10px #000;
			-o-box-shadow: 2px 2px 10px #000;
			box-shadow: 2px 2px 10px #000;		
			-moz-transition: all 1s ease-out;
			-webkit-transition: all 1s ease-out;
			-o-transition: all 1s ease-out;
			transition: all 1s ease-out;
		
		}
		
		#eg2:hover {
		
			
			background: url(images/stripes.png) no-repeat 0px -200px, url(images/background.png) no-repeat center -8px;
			-moz-transition: all 0.5s ease;
			-webkit-transition: all 0.5s ease;
			-o-transition: all 0.5s ease;
			transition: all 0.5s ease;		
		
		}

		/* ---------- Example Three ---------- */
		
		#eg3 {
		
			
			display: block;
			width: 5em;
			padding: 30px 40px;
			text-align: center;
			font-family: Arial, sans-serif;
			font-size: 18px;
			color: #fff;
			text-decoration: none;
			text-shadow: 1px 1px 0px #000;
			-moz-border-radius: 25px;
			-webkit-border-radius: 25px;
			-o-border-radius: 25px;		
			border-radius: 25px;
			background: url(images/radial-gradient.png) no-repeat center center, url(images/background.png) no-repeat center -8px;
			-moz-box-shadow: 2px 2px 10px #000;
			-webkit-box-shadow: 2px 2px 10px #000;
			-o-box-shadow: 2px 2px 10px #000;
			box-shadow: 2px 2px 10px #000;		
			-moz-background-size: 200px 200px, 180px 200px;
			-webkit-background-size: 200px 200px, 180px 200px;
			-o-background-size: 200px 200px, 180px 200px;
			background-size: 200px 200px, 180px 200px;		
			-moz-transition: all 0.75s ease;
			-webkit-transition: all 0.75s ease;
			-o-transition: all 0.75s ease;
			transition: all 0.75s ease;
		
		}
		
		#eg3:hover {
		
			
			background: url(images/radial-gradient.png) no-repeat center center, url(images/background.png) no-repeat center -8px;
			-moz-background-size: 1000px 1000px, 180px 200px;
			-webkit-background-size: 1000px 1000px, 180px 200px;
			-o-background-size: 1000px 1000px, 180px 200px;
			background-size: 1000px 1000px, 180px 200px;		
			-moz-transition: all 1s ease;
			-webkit-transition: all 1s ease;
			-o-transition: all 1s ease;
			transition: all 1s ease;
		
		}
	
	</style>
	
	</head>
<body>
 <div class="main">
	
		<h1>管理中心</h1>
	
		<div id="demo-box">
		
			<a id="eg1" class="button" href="planofstudy">课程计划</a>
			<a id="eg2" class="button" href="choose">选课</a>		
			<a id="eg3" class="button" href="allsection">查看已选课</a>
	    	
			
		
			
</div>		
	</body>

	</body>
	</html>