<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/a.css" rel='stylesheet' type='text/css' />
<script src="https://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>  
<title>加入排课</title>
<script type="text/javascript">
	var str=location.href;
	var cc = str.substr(str.indexOf("?")+1);
	function addSection(){
		$.ajax({
			url:'${pageContext.request.contextPath}/sectionAction_addSection',
			type:'POST',
			dataType : 'json',
			data:{courseNo:cc,sectionNo:$("#sectionNo").val(),dayOfWeek:$("#dayOfWeek").val(),timeOfDay:$("#timeOfDay").val(),room:$("#room").val(),seatingCapacity:$("#seatingCapacity").val(),professorSsn:$("#professor").val(),semester:$("#semester").val()},
			success:function(data){
				if(data.status=="ok"){
					alert("添加成功！");
					window.location.href='${pageContext.request.contextPath}/allcourse';
				}
			}
		});
	}
</script>
</head>
<body>
<div id="div1"><img src="images/green.jpg" /></div> 
	<div class="container">
		<div class="row">
			<div class="col-md-4">
			</div>
			<div class="form-group col-md-4">
				<h1>加入排课</h1>
				<label>节次</label> 
				<input class="form-control" type="text" id="sectionNo" />
				<label>日期</label> 
				<input class="form-control" type="text" id="dayOfWeek" /> 
				<label>时间</label>
				<input class="form-control" type="text" id="timeOfDay" />
				<label>地点</label>
				<input class="form-control" type="text" id="room" />
				<label>容量</label>
				<input class="form-control" type="text" id="seatingCapacity" />
				<label>教师</label>
				<input class="form-control" type="text" id="professor" /> 
				<label>学期</label> 
				<input class="form-control" type="text" id="semester" /><br />
				<button onclick="addSection()" class="btn btn-default btn-lg btn-block">添加</button>
			</div>
			<div class="col-md-4">
			</div>
		</div>
	</div>
</body>
</html>