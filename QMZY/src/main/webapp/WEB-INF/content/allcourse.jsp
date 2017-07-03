<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/a.css" rel='stylesheet' type='text/css' />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>全部课程</title>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : '${pageContext.request.contextPath}/courseAction_findAllCourse',
			type : 'POST',
			dataType : 'json',
			data : {},
			success : function(data) {
				$("#allCourse").empty();
				for (var i = 0; i < data.length; i++) {
					var c = data[i];
					var ca ="'" + c.courseNo + "'";
					var prerequisite = [];
					if(c.prerequisite.length!=0){
						prerequisite = c.prerequisite[0].courseNo;
					}
					var html = '<tr><td>'
						+ c.courseNo
						+ '</td><td>'
						+ c.courseName
						+ '</td><td>'
						+ c.credits
						+ '</td><td>'
						+ prerequisite
						+ '</td><td><a href="javascript:void(0);"  onclick="addSection('+ ca +')">加入课表</a>'
						+ '</td><td><a href="javascript:void(0);"  onclick="delectCourse('+ ca +')">删除课程</a></td></tr>';
						$("#allCourse").append(html);
				}	
			}
		});
	})

	function delectCourse(val){   
		$.ajax({
			url:'${pageContext.request.contextPath}/courseAction_deleteCourse',
			type:'POST',
			dataType : 'json',
			data:{courseNo:val},
			success:function(data){
				if(data.status=="ok"){
					alert("删除成功");
					window.location.reload();
				}
			}
		}) 
	}
	function addSection(val){
		window.location.href='${pageContext.request.contextPath}/addSection?' + val + '';
	}
</script>

</head>
<body>
	<div id="div1"><img src="images/blue.jpg" /></div> 
<center>
	
			<td><h2>全部课程</h2></td>
			<td>
				<table width="640" border="1">
					<thead>
						<tr>
							<td>课程号</td>
							<td>课程名称</td>
							<td>学分</td>
							<td>先修课程</td>
							<td>加入课表</td>
							<td>删除课程</td>
						</tr>
					</thead>
					<tbody id="allCourse">
					</tbody>
				</table>
			</td>
		</tr>
	
	</center>
</body>
</html>