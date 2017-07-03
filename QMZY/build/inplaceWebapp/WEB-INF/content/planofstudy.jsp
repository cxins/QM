<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/a.css" rel='stylesheet' type='text/css' />
<script src="https://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
<title>课程计划</title>
<script type="text/javascript">
	var str=location.href;
	var cc = str.substr(str.indexOf("?")+1);
	
	$(function() {
		$.ajax({
			url : '${pageContext.request.contextPath}/planOfStudyAction_findAllPlan',
			type : 'POST',
			dataType : 'json',
			data : {ssn:cc},
			success : function(data) {
				$("#planCourse").empty();
				for (var i = 0; i < data.length; i++) {
					var c = data[i];
					var html = '<tr><td>'
						+ c.courseNo
						+ '</td><td>'
						+ c.courseName
						+ '</td><td>'
						+ c.credits
						+ '</td></tr>';
						$("#planCourse").append(html);
				}	
			}
		});
	})
</script>
</head>
<body>
	<div id="div1"><img src="images/blue.jpg" /></div> 
	<center>
	<div class="container">
		<div id="show"></div>
		<hr/>
		<h2>课程计划</h2>
		<table width="640" border="1">
			<thead>
				<tr>
					<td>课程号</td>
					<td>课程</td>
					<td>学分</td>
				</tr>
			</thead>
			<tbody id="planCourse">

			</tbody>
		</table>
		
	</div></center>
</body>
</html>