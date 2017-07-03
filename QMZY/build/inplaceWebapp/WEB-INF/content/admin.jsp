<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>管理员登陆</title>
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
<body><center>
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
		<tr>
			<td><h2>全部课程</h2></td>
		</tr>
		<tr>
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
		<tr>
			<td><h2>全部排课</h2></td>
		</tr>
		<tr>
			<td>
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
			</td>
		</tr>
	</table>
	</div></center>
</body>
</html>