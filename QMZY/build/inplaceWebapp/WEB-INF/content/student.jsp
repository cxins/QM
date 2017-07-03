<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/a.css" rel='stylesheet' type='text/css' />
<script src="https://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
<title>学生页面</title>
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

	$(function() {
		$.ajax({
			url : '${pageContext.request.contextPath}/sectionAction_getBySsn',
			type : 'POST',
			dataType : 'json',
			data : {ssn:cc},
			success : function(data) {
				$("#hasSection").empty();
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
						+ s.professor
						+ '</td><td>'
						+ s.course
						+ '</td><td>'
						+ s.grade
						+ '</td><td><a href="javascript:void(0);"  onclick="addTranscript('+ se +')">退选</a></td></tr>';
						$("#hasSection").append(html);
				}	
			}
		});
	})
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
						+ s.professor
						+ '</td><td>'
						+ s.course
						+ '</td><td><a href="javascript:void(0);"  onclick="addTranscript('+ se +')">选课</a></td></tr>';
						$("#allSection").append(html);
				}	
			}
		});
	})
	function addTranscript(val){
		$.ajax({
			url:'${pageContext.request.contextPath}/sectionAction_addTranscript',
			type:'POST',
			dataType : 'json',
			data:{ssn:cc,sectionNo:val},
			success:function(data){
				if(data.status=="ok"){
					alert("成功");
					window.location.reload();
				}
			}
		});
	}

</script>
</head>
<body><center>
	<div id="div1"><img src="images/blue.jpg" /></div> 
	<div class="container">
		<div id="show"></div>
		<hr/>
		<h2>课程计划</h2>
		<table width="640" border="1">
			<thead>
				<tr>
					<td>课程码</td>
					<td>课程</td>
					<td>学分</td>
				</tr>
			</thead>
			<tbody id="planCourse">

			</tbody>
		</table>
		<h2>已选课程</h2>
		<table width="640" border="1">
			<thead>
				<tr>
					<td>节次</td>
					<td>日期</td>
					<td>时间</td>
					<td>地点</td>
					<td>教师</td>
					<td>课程</td>
					<td>成绩</td>
					<td>退选</td>
				</tr>
			</thead>
			<tbody id="hasSection">
				
			</tbody>
		</table>
		<h2>全部课程</h2>
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
					<td>选课</td>
				</tr>
			</thead>
			<tbody id="allSection">
				
			</tbody>
		</table>
	</div></center>
</body>
</html>