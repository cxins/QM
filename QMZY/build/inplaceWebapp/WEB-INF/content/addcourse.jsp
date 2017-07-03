<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/a.css" rel='stylesheet' type='text/css' />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>添加课程</title>
<script type="text/javascript">
	
	function addCourse(){
		$.ajax({
			url:'${pageContext.request.contextPath}/courseAction_addCourse',
			type:'POST',
			dataType : 'json',
			data:{courseNo:$("#courseNo").val(),courseName:$("#courseName").val(),credits:$("#credits").val(),prerequisite:$("#prerequisite").val()},
			success:function(data){
				if(data.status=="ok"){
					alert("添加成功");
					window.location.reload();
				}
			}
		});
	}
	
</script>
</head>
<body>
<div id="div1"><img src="images/pink.jpg" /></div><center>
	<div class="container">
		<table width="640" border="1">
		<tr>
			<td><h2>添加课程</h2></td>
		</tr>
		<tr>
			<td>
				<div class="container">
					<div class="row">
						<div class="col-md-4">
						</div>
						<div class="form-group col-md-4">
							<label>课程号</label> 
							<input  type="text" id="courseNo" />
							<label>课程名称</label> 
							<input  type="text" id="courseName" /> 
							<label>学分</label>
							<input  type="text" id="credits" /> 
							<label>先修课程</label> 
							<input  type="text" id="prerequisite" /><br />
							<button onclick="addCourse()" class="btn btn-default btn-lg btn-block">添加课程</button>
						</div>
					</div>
				</div>
			</td>
		</tr>
	
	</table>
	</div></center>
</body>
</html>