<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="bootstrap-3.3.7/css/bootstrap.min.css" />
		<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
		<script type="text/javascript" src="bootstrap-3.3.7/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js" "></script>
		<%
		String mess = (String) session.getAttribute("msg");
		if (mess == null|| mess.equals("")){		
		}		
		else {
		%>
		<script type="text/javascript ">
		        alert("<%=mess%>");
			
		</script>
		<%
		  session.setAttribute("msg", "");
		%>
		<%
			}
		%>
		
		<%
		String mess1 = (String)request.getAttribute("errorMsg");
		if (mess1 == null|| mess1.equals("")){		
		}		
		else {
		%>
		<script type="text/javascript ">
		        alert("<%=mess1%>");
			
		</script>
		<%
		  session.setAttribute("errorMsg", "");
		%>
		<%
			}
		%>
	</head>

	<body>

		<div class="container">
			<br /><br /><br />
			<br /><br /><br />
			<h2 style="text-align:center">请登录</h2>
			<div class="col-md-6 col-md-offset-3">
				<form action="loginServlet" method="post">
					<div id="usernameDiv" class="form-group has-feedback">
						<label for="username">用户名</label>
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
							<input id="username" class="form-control" type="text" name="username" required autocomplete="off" maxlength="20" placeholder="请输入您的用户名">						    
						    <span id="usernameSuccess" style="display: none;" class="glyphicon glyphicon-ok form-control-feedback"></span>
               		        <span id="usernameError" style="display: none;" class="glyphicon glyphicon-remove form-control-feedback"></span>
						</div>
						   <span id="usernameMsg" style="color:red;" class="tips"></span>						

					</div>

					<div id="passwordDiv" class="form-group has-feedback">
						<label for="password">密码</label>
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
							<input id="password" class="form-control" name="password" required placeholder="请输入密码" maxlength="20" type="password">
						    <span id="passwordSuccess" style="display: none;" class="glyphicon glyphicon-ok form-control-feedback"></span>
               		        <span id="passwordError" style="display: none;" class="glyphicon glyphicon-remove form-control-feedback"></span>
						</div>
						<span id="passwordMsg" style="color:red;" class="tips"></span>
						
						<br />
						<span>忘记密码？<a href="forgetpassword.jsp">找回密码</a></span>
					</div>

					<div class="row">
						<div class="col-xs-7">
							<div id="codeDiv" class="form-group has-feedback">
								<label for="idcode-btn">验证码</label>
								<div class="input-group">
									<span class="input-group-addon"><span class="glyphicon glyphicon-qrcode"></span></span>
									<input id="checkCode" name="checkCode" type="text"  class="form-control" placeholder="请输入验证码" maxlength="6" type="text">
									<span id="codeSuccess" style="display: none;" class="glyphicon glyphicon-ok form-control-feedback"></span>
               		                <span id="codeError" style="display: none;" class="glyphicon glyphicon-remove form-control-feedback"></span>
								</div>
								<span id="codeMsg" style="color:red;" class="tips"></span>								
							</div>
						</div>
						<div class="col-xs-5" style="padding-top: 25px">
							<img src="pictureCheckCode" id="CreateCheckCode">
							<a href="javascript:void(0)" onclick="myReload()" style="font-size:12px;color:blue">看不清,换一个</a>
						</div>
					</div>
					<div class="form-group">
						<input type="radio" name="type" value="用户" checked>用户&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="type" value="管理员">管理员
					</div>
					<div class="form-group">
						<input id="remember" name="remember" value="true" type="checkbox" checked="checked" />记住密码
					</div>
					<div class="form-group">
						<input disabled="true" style="color: #000000;" type="submit" class="form-control btn btn-primary" id="submit" value="登&nbsp;&nbsp;&nbsp;&nbsp;录">
					</div>

					<div class="form-group">
						<input type="button" value="立&nbsp;&nbsp;即&nbsp;&nbsp;注&nbsp;&nbsp;册" class="form-control btn btn-warning" onclick="window.location.href='register.jsp'"  >
            </div>
        </form>
    </div>
</div>



</body>
<script type="text/javascript ">
	 function myReload() {
	    document.getElementById("CreateCheckCode ").src = 
	    	document.getElementById("CreateCheckCode ").src+ "?nocache=" + new Date().getTime();
	  }
	  	
	$(" input[name='username' ] ").bind("blur ",function(){
		var username = $(this).val().trim();
		if(username.length==0){
		   $("#usernameMsg").html("用户名不能为空");
     	   $("#usernameDiv").attr("class","form-group has-error has-feedback")
		   $("#usernameError").css("display","block")	
		   $('#submit').prop('disabled', true);			   
		}else{
		   $("#usernameMsg").html("");
		   $("#usernameDiv").attr("class","form-group has-success has-feedback")
		   $("#usernameError").css("display","none")
		   $("#usernameSuccess").css("display","block")
		  
		}
	})
	
	
	
	$(" input[name='password' ] ").bind("blur ",function(){
		var password = $(this).val().trim();
		if(password.length==0){
		   $("#passwordMsg").html("密码不能为空");
		   $("#passwordDiv").attr("class","form-group has-error has-feedback")
		   $("#passwordError").css("display","block")
		   $('#submit').prop('disabled', true);	
		 
		}else{
		   $("#passwordMsg").html("");
  		   $("#passwordError").css("display","none")
		   $("#passwordeDiv").attr("class","form-group has-success has-feedback")		   
		   $("#passwordSuccess").css("display","block")
		   
		}
	})
	
	$(" input[name='checkCode' ] ").bind("blur ",function(){
		var code = $(this).val().trim();
		if(code.length==0){
		   $("#codeMsg").html("请输入验证码");
		   $("#codeDiv").attr("class","form-group has-error has-feedback")
		   $("#codeError").css("display","block")
		   $('#submit').prop('disabled', true);	
		   
		}else{
		   $("#codeMsg").html("");
           $("#codeDiv").attr("class","form-group has-success has-feedback")
		   $("#codeError").css("display","none")
		   $("#codeSuccess").css("display","block")
		   $('#submit').prop('disabled', false);		   
		}
	})
	
	 if($.cookie("remember")=="true"){
		 var password = $.cookie("password");		 
		 var username = $.cookie("username");		 	
		 $("#username").val(username);
		 $("#password").val(password);
		 $("#remember").prop("checked ",true); 
	 }
</script>
</html>