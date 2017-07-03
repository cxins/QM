<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/a.css" rel='stylesheet' type='text/css' />
<script src="https://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>  
<title>教师页面</title>
<script type="text/javascript">
	var str=location.href;
	var cc = str.substr(str.indexOf("?")+1);
	$(function() {
		$.ajax({
			url : '${pageContext.request.contextPath}/sectionAction_getProfessorSection',
			type : 'POST',
			dataType : 'json',
			data : {ssn:cc},
			success : function(data) {
				$("#allSection").empty();
				for (var i = 0; i < data.length; i++) {
					var s = data[i];
					var se ="'" + s.sectionNo + "'";
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
						+ s.course
						+ '</td><td><a href="javascript:void(0);"  onclick="getDetail('+ se +')">查看</a></td></tr>';
						$("#allSection").append(html);
				}	
			}
		});
	})
	
	function getDetail(val) {
		document.getElementById("detail").style.display="";
		 $.ajax({
			url : '${pageContext.request.contextPath}/sectionAction_getDetial',
			type : 'POST',
			dataType : 'json',
			data : {sectionNo:val},
			success : function(data) {
				$("#detailTable").empty();
				for (var i = 0; i < data.length; i++) {
					var s = data[i];
					var html = '<tr><td>'
						+ s.name
						+ '</td><td>'
						+ s.grade
						+ '</td></tr>';
						$("#detailTable").append(html);
				}	
			}
		}); 
	}
</script>
</head>
<body>
<center>
<div id="div1"><img src="images/pink.jpg" /></div>
	<div class="container">
		<div id="show"></div>
		<hr/>
		<h2>所教课程</h2>
		<table width="640" border="1">
			<thead>
				<tr>
					<td>节次</td>
					<td>日期</td>
					<td>时间</td>
					<td>地点</td>
					<td>容量</td>
					<td>课程</td>
					<td>详情</td>
				</tr>
			</thead>
			<tbody id="allSection">
				
			</tbody>
		</table>
		<div id="detail" style="display:none;">
			<h2>选课情况</h2>
			<table width="640" border="1">
			<thead>
				<tr>
					<td>学生姓名</td>
					<td>成绩</td>
				</tr>
			</thead>
			<tbody id="detailTable">
				
			</tbody>
		</table>
		</div>
	</div></center>
</body>
</html>