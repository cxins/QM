<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/a.css" rel='stylesheet' type='text/css' />
<script src="https://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>  
<title>添加教师</title>
<script type="text/javascript">
	function addProfessor(){
		$.ajax({
			url:'${pageContext.request.contextPath}/personAction_addProfessor',
			type:'POST',
			dataType : 'json',
			data:{ssn:$("#ssn").val(),name:$("#name").val(),title:$("#title").val(),department:$("#department").val()},
			success:function(data){
				if(data.status=="ok"){
					alert("添加成功！");
					window.location.reload();
				}
			}
		});
	}
</script>
</head>
<body>
<div id="div1"><img src="images/blue.jpg" /></div> 
	<div class="container">
		<div class="row">
			<div class="col-md-4">
			</div>
			<div class="form-group col-md-4">
				<h1>添加教师</h1>
				<label>编号:</label> 
				<input class="form-control" type="text" id="ssn" />
				<label>姓名:</label> 
				<input class="form-control" type="text" id="name" /> 
				<label>头衔:</label>
				<input class="form-control" type="text" id="title" />
				<label>学院:</label>
				<input class="form-control" type="text" id="department" /><br />
				<button onclick="addProfessor()" class="btn btn-default btn-lg btn-block">添加</button>
			</div>
			<div class="col-md-4">
			</div>
		</div>
	</div>
</body>
</html>