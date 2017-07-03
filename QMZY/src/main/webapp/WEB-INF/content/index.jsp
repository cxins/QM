<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/style.css" rel='stylesheet' type='text/css' />
<script src="https://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>

<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<title>中国矿业大学教务部</title>
<script type="text/javascript">
	function login(){
		var ssn = $("#ssn").val();
		$.ajax({
			url:'${pageContext.request.contextPath}/userAction_login',
			type:'POST',
			dataType:'json',
			data:{ssn:ssn,password:$("#password").val(),type:$("select").val()},
			success:function(data){
				if(data.status=="ok"){
					if($("#select").val()=="Student"){
						window.location.href='${pageContext.request.contextPath}/student?'+ ssn +'';
					}else if($("#select").val()=="Professor"){
						window.location.href='${pageContext.request.contextPath}/professor?'+ ssn +''
					}else{
						window.location.href='${pageContext.request.contextPath}/adminlogin';
					}
				}else{
					alert("错啦");
				}
			}
		}); 
		
	}
</script>
</head>
<body>
 <div class="main">
		<div class="login-form">
		  <h1>登录</h1>
		<div class="head">
						<img src="images/user.png" alt=""/>
					</div>
<center>
    <form action="login.php" method="post">
       <div>
        <div>
              
            <div >
             <div>用户名</div>   <input type="text" class="form-control" id="ssn"  required autofocus/>
            </div>
            <div >
                <div>密码</div>   <input type="password" class="form-control" id="password"  required autofocus/>
            </div>
            <div class="col-lg-10 mycheckbox checkbox">
               <div>身份</div>  <select id="select">
                	<option>Student</option>
                	<option>Professor</option>
                	<option>admin</option>
                </select>
            </div>
            <div ></div>
            <div >
                <button type="button"  onclick="login()">登录</button>
            </div>
        </div>
    </div>
   </form></center>
</body>
</html>