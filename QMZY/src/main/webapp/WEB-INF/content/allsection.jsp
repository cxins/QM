<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/a.css" rel='stylesheet' type='text/css' />
<script src="https://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>全部排课</title>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : '${pageContext.request.contextPath}/sectionAction_findAllSection',
			type : 'POST',
			dataType : 'json',
			data : {},
			success : function(data) {
				$("#allSection").empty();
				for (var i = 0; i < data.length; i++) {
					var s = data[i];
					var html = '<tr><td>'
						+ s.sectionNo
						+ '</td><td>'
						+ s.dayOfWeek
						+ '</td><td>'
						+ s.timeOfDay
						+ '</td><td>'
						+ s.room
						+ '</td><td>'
						+ s.seatingCapacity
						+ '</td><td>'
						+ s.professor
						+ '</td><td>'
						+ s.course
						+ '</td><td><a href="#">删除排课</a></td></tr>';
						$("#allSection").append(html);
				}	
			}
		});
	})
</script>
</head>
<body>
<div id="div1"><img src="images/green.jpg" /></div><center>
	<div class="container">
				<table width="640" border="1">
					<thead>
						<tr>
							<td>节次</td>
							<td>日期</td>
							<td>时间</td>
							<td>地点</td>
							<td>容量</td>
							<td>教师</td>
							<td>课程</td>
							<td>删除排课</td>
						</tr>
					</thead>
					<tbody id="allSection">
						
					</tbody>
				</table>
			

	</div></center>
</body>
</html>