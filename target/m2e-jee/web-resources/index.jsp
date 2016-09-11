<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>用户管理系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%= path %>/css/style.css">
	<!-- 新 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="<%= path %>/js/bootstrap/css/bootstrap.min.css">
	<!-- 可选的Bootstrap主题文件（一般不用引入） -->
	<link rel="stylesheet" href="<%= path %>/js/bootstrap/css/bootstrap-theme.min.css">
	<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
	<script src="<%= path %>/js/jquery/jquery-1.11.3.min.js"></script>
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="<%= path %>/js/bootstrap/js/bootstrap.min.js"></script>
	<script src="<%=path %>/js/page.js"></script> 
	
		<!-- bootstrap date picker 样式表 -->
	<link href="<%= path %>/js/bootstrap/datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet" />
	<!-- bootstrap date picker JavaScript 文件及语言包 -->
	<script src="<%= path %>/js/bootstrap/datepicker/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
	<script src="<%= path %>/js/bootstrap/datepicker/locales/bootstrap-datepicker.zh-CN.min.js" type="text/javascript"></script>
	<script src="<%= path %>/js/jquery/jquery.validate.js"></script>
	<script src="<%= path %>/js/jquery/jquery.metadata.js"></script>
		<script type="text/javascript">
		$(function(){
			$(".datepicker").datepicker({
				language: "zh-CN",
				format: "yyyy-mm-dd",
			    weekStart: 1,
			    clearBtn: true,//清除按钮
				autoclose: 1,//选中关闭
				forceParse: true//当用户在输入框中输入了不正确的日期，选择器将会尽量解析输入的值，并将解析后的正确值按照给定的格式format设置到输入框中当用户在输入框中输入了不正确的日期，选择器将会尽量解析输入的值，并将解析后的正确值按照给定的格式format设置到输入框中
			    
			});
		});
	</script>
  </head>
  <body>
       <div class="panel panel-primary">
	   <div class="panel-heading">
	      <h3 class="panel-title">账户管理</h3>
	   </div>
	   <div class="panel-body">
	   		<div class="row">
	   			<div class="col-md-6 col-left">
	   				<a href="javascript:void(0);"  class="btn btn-default" data-toggle="modal" data-target="#myModal" onclick="openAdd()">
			   			<span class="glyphicon glyphicon-add"></span>添加账户
			   		</a> 
	   			</div>
	   		</div>
	   </div>
	   <div class="panel-body">
   			<div class="form-group">
	   			<form class="form-inline" role="form" id="searchForm" action="" method="post">
	   				<input id="startTime" name="startTime" value=""  style="display:none"/>
	   				<input id="endTime" name="endTime" value=""  style="display:none"/>
			  		<label for="lastname">编码:&nbsp;</label>
			  		<input class="form-control" type="text" id="s_coding" name="coding" value=""/>
			  		<label for="lastname">注册时段:&nbsp;</label>
	              	<input type="text" class="form-control datepicker" id="sTime" name="sTime" value=""  readonly/>
	              	到
	              	<input type="text" class="form-control datepicker" id="eTime" name="eTime" value=""  readonly/>
				  	&nbsp;&nbsp;
				  	<label for="lastname">账户类型:&nbsp;</label>
				  	<select id="s_type" name="type" class="form-control">
				  		<option value="0" selected="selected">全部</option>
				  		<option value="2" >普通账户</option>
				  		<option value="1">管理员</option>
		      		</select>
				  	<button type="button" class="btn btn-default" onclick="doSearch()">搜索</button>
			  	</form>
			</div>
	   		<table class="table">
		      <thead>
		         <tr>
		            <th>编码</th>
		            <th>名称</th>
		            <th>账号类型</th>
		            <th>注册时间</th>
		            <th>登录时间</th>    
		            <th>状态</th>    
		            <th>操作</th>    
		         </tr>
		      </thead>
		      <tbody id="tbody_data">
		      	
		      </tbody>
		   </table>  
	   </div>
	</div>
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    	<div class="modal-dialog">
        	<div class="modal-content">
	        	<div class="modal-header">
		            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times; </button>
		            <h4 class="modal-title" id="menuModalTitile">
		              	账户信息修改
		            </h4>
	        	</div>
	            <div class="modal-body">
	            	<form class="form-horizontal" role="form" id="menuform" method="post" action="">
	            		<input type="hidden" id="id" name="id" value=""/>
	            		<div class="form-group">
		            		<label for="lastname" class="col-sm-3 control-label">编码：</label>
		            		<div class="col-sm-9">
		            			<input class="form-control" type="text" id="coding" name="coding" value="" readonly="readonly"/>
		            		</div>
		            	</div>
	            		<div class="form-group">
		            		<label for="lastname" class="col-sm-3 control-label">名称：</label>
		            		<div class="col-sm-9">
		            			<input class="form-control" type="text" id="name" name="name" value=""/>
		            		</div>
		            	</div>
	            		<div class="form-group">
		            		<label for="lastname" class="col-sm-3 control-label">名称：</label>
		            		<div class="col-sm-9 btn-group">
								<label class="checkbox-inline">
									<input type="radio" name="state" id="state2"  value="0"> 锁定
								</label>
		            			<label class="checkbox-inline">
									<input type="radio" name="state" id="state1" value="1" checked> 正常
								</label>
		            		</div>
		            	</div>
	            		<div class="form-group">
		            		<label for="lastname" class="col-sm-3 control-label">类型：</label>
		            		<div class="col-sm-9">
								<select id="type" name="type" class="form-control">
							  		<option value="2" selected="selected">普通账户</option>
							  		<option value="1">管理员</option>
					      		</select>
							</div>
						</div>
	            		<div class="form-group">
		            		<label for="lastname" class="col-sm-3 control-label">备注：</label>
		            		<div class="col-sm-9">
		            			<textarea class="form-control" rows="3" id="remarks" name="remarks"></textarea>
		            		</div>
	            		</div>
            		</form>
	         	</div>
	         	<div class="modal-footer">
		            <button type="button" class="btn btn-primary" onclick="edit()">
		               	提交更改
		            </button>
	           	</div>
	      	</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
  </body>  
<script type="text/javascript">

	$(function(){
		$("#startTime").val();
		$("#endTime").val();
		doSearch();
	});
	
	function doSearch(){
		var sTime = $("#sTime").val();
		var eTime = $("#eTime").val();
		if(sTime != ''){
			var startTime = new Date(sTime + " 00:00:00");
			$("#startTime").val(startTime.getTime());
		}else{
			$("#startTime").val(0);
		}
		if(eTime != ''){
			var endTime = new Date(eTime + " 00:00:00");
			$("#endTime").val(endTime.getTime() + 24 * 60 * 60 * 1000);
		}else{
			$("#endTime").val(0);
		}
				
		$.ajax({
			type : 'post',
			url :'<%=path%>/account/findAll',
			cache : false,
			data : $('#searchForm').serialize(),
			dataType : 'json',
			success : function(data) {
				if(data.state == 1){
					var html = "";
					for(var i=0; i<data.objs.length; i++){
						html += "<tr>"
							  +	"	<td>"  + data.objs[i].coding + "</td>"
							  +	"	<td>"  + data.objs[i].name + "</td>"
							  +	"	<td>"  + (data.objs[i].type==1? '管理员': '普通用户') + "</td>"
							  +	"	<td>"  + formatDate(data.objs[i].created) + "</td>"
							  +	"	<td>"  + formatDate(data.objs[i].lastLogin) + "</td>"
							  +	"	<td id=\"state_" + data.objs[i].id　+　"\">"  + (data.objs[i].state == 0? '锁定' : '正常') + "</td>"
							  +	"	<td id=\"operate_" +　data.objs[i].id +"\">";
					  	if(data.objs[i].state == 0){
						  	html += "<button class=\"btn btn-default btn-xs\" onclick=\"updateState('" + data.objs[i].id + "', 1)\">"
							 		+ "		<span class=\"glyphicon glyphicon-eye-open\"></span>正常"
							 		+ "</button>";
					  	}else{
						  	html += "<button class=\"btn btn-default btn-xs\" onclick=\"updateState('" + data.objs[i].id + "', 0)\">"
							 		+ "		<span class=\"glyphicon glyphicon-lock\"></span>锁定"
							 		+ "</button>";
					  	}
						html += "&nbsp;&nbsp;"
						      + "		<button class=\"btn btn-default btn-xs\" data-toggle=\"modal\" data-target=\"#myModal\" onclick=\"openEdit('" + data.objs[i].id + "')\">"
							  + " 			<span class=\"glyphicon glyphicon-edit\"></span>编辑"
							  + "		</button>"
							  + "&nbsp;&nbsp;"
							  + "		<button class=\"btn btn-default btn-xs\" onclick=\"deleteAccount('" + data.objs[i].id + "')\">"
							  + " 			<span class=\"glyphicon glyphicon-remove\"></span>删除"
							  + "		</button>"
							  + "	</td>";
							  + "</tr>";	  
					}
					$("#tbody_data").html(html);
				}else{
					alert("网络错误！");
				}
			}
		}); 
	}
	
	function openAdd(){
		$("#menuModalTitile").html('账户信息添加');
		$("#menuform")[0].reset();
		$("#id").val('0');
		$("#coding").attr("readonly", false);
	}
	function openEdit(id){
		$("#menuModalTitile").html('账户信息修改');
		$('#menuform')[0].reset();
		$("#coding").attr("readonly", true);
		$.ajax({
			type : 'post',
			url :'<%=path%>/account/findById?id=' + id,
			cache : false,
			dataType : 'json',
			success : function(data) {
				if(data.state == 1){
					$("#id").val(data.obj.id);
					$("#coding").val(data.obj.coding);
					$("#name").val(data.obj.name);
					$("input[name=state]:eq(" + data.obj.state + ")").attr("checked", "checked");
					$("#type").val(data.obj.type);
					$("#remarks").val(data.obj.remarks);
				}else{
					alert("网络错误");
				}
			}
		});
	}
	function edit(){
		if($("#name").val() == ''){
			alert("请输入名称");
			return false;
		}
		var id = $("#id").val();
		$.ajax({
			type : 'post',
			url :'<%=path%>/account/' + (id == '' || id == 0? 'save': 'update'),
			cache : false,
			data : $('#menuform').serialize(),
			dataType : 'json',
			success : function(data) {
				if(data.state == 1){
					alert("操作成功");
					window.location.reload();
				}else if(data.state == -1){
					alert(data.errormessage);
				}else{
					alert("操作失败");
				}
			}
		});
	}
	function deleteAccount(id){
		$.ajax({
			type : 'post',
			url :'<%=path%>/account/delete?id=' + id,
			cache : false,
			dataType : 'json',
			success : function(data) {
				if(data.state == 1){
					alert("删除成功");
					window.location.reload();
				}else{
					alert("删除失败");
				}
			}
		});
	}
	function updateState(id, state){
		$.ajax({
			type : 'post',
			url :'<%=path%>/account/updateState?id=' + id + '&state=' + state,
			cache : false,
			dataType : 'json',
			success : function(data) {
				if(data.state == 1){
					$("#state_" + id).html(state == 0? '锁定' : '正常');
					var html = ""; 	
					if(state == 0){
					  	html += "<button class=\"btn btn-default btn-xs\" onclick=\"updateState('" + id + "', 1)\">"
				 		+ "		<span class=\"glyphicon glyphicon-eye-open\"></span>正常"
				 		+ "</button>";
				  	}else{
					  	html += "<button class=\"btn btn-default btn-xs\" onclick=\"updateState('" + id + "', 0)\">"
						 		+ "		<span class=\"glyphicon glyphicon-lock\"></span>锁定"
						 		+ "</button>";
				  	}
					html += "&nbsp;&nbsp;&nbsp;"
				     	  + "<button class=\"btn btn-default btn-xs\" data-toggle=\"modal\" data-target=\"#myModal\" onclick=\"openEdit('" + id + "')\">"
						  + " 	<span class=\"glyphicon glyphicon-edit\"></span>编辑"
						  + "</button>"
						  + "&nbsp;&nbsp;&nbsp;"
						  + "<button class=\"btn btn-default btn-xs\" onclick=\"deleteAccount('" + id + "')\">"
						  + " 	<span class=\"glyphicon glyphicon-remove\"></span>删除"
						  + "</button>";
					$("#operate_" + id).html(html);
				}else{
					alert("修改失败");
				}
			}
		});
	}
	
	function formatDate(time){
		if(time == 0){
			return "";
		}
		var date = new Date(time);
		return date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
		
	}
	
</script>
</html>
