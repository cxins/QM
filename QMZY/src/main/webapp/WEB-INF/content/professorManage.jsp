<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/a.css" rel='stylesheet' type='text/css' />
<script src="https://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>  
<title>addSection</title>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : '${pageContext.request.contextPath}/personAction_findAllProfessor',
			type : 'POST',
			dataType : 'json',
			data : {},
			success : function(data) {
				$("#allProfessor").empty();
				for (var i = 0; i < data.length; i++) {
					var p = data[i];
					var ps ="'" + p.ssn + "'";
					var html = '<tr><td>'
						+ p.ssn
						+ '</td><td>'
						+ p.name
						+ '</td><td>'
						+ p.title
						+ '</td><td>'
						+ p.department
						//+ '</td><td><a href="javascript:void(0);"  onclick="updateProfessor('+ ps +')">更新教师</a>'
						+ '</td><td><a href="javascript:void(0);"  onclick="delectProfessor('+ ps +')">删除教师</a></td></tr>';
						$("#allProfessor").append(html);
				}	
			}
		});
	})
	function delectProfessor(val){   
		$.ajax({
			url:'${pageContext.request.contextPath}/personAction_deleteProfessor',
			type:'POST',
			dataType : 'json',
			data:{ssn:val},
			success:function(data){
				if(data.status=="ok"){
					alert("删除成功！");
					window.location.reload();
				}
			}
		}) 
	}
</script>
</head>
<body>
<div id="div1"><img src="images/green.jpg" /></div>
		<div class="row">
			
		<h2>所有教师</h2>
		<table width="640" border="1">
			<thead>
				<tr>
					<td>编号</td>
					<td>姓名</td>
					<td>头衔</td>
					<td>学院</td>
					<td>删除</td>
				</tr>
			</thead>
			<tbody id="allProfessor">
			
			</tbody>
			
		</table>
	</div>
</body>
</html>