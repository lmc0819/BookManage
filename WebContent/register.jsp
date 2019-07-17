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
	</head>
<body>


<div class="container">
	        <br /><br /><br />
			<br /><br /><br />
			<h2 style="text-align:center">读者注册</h2>
    <div class="col-md-10 col-md-offset-3" ">
        <form onsubmit="return checkAll()"  role="form" autocomplete="off" action="readerServlet?act=register" method="POST">	       
        	<div class="row">
                <div class="col-md-8">
                    <div id="usernameDiv" class="form-group has-feedback">
                        <label for="username">用户名</label>
                        <div class="input-group">
                           <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>                         
                            <input name="username" type="text" class="form-control" id="username" required="required"  autocomplete="off"  placeholder="请输入用户名" onblur="checkUsername()">                         
                            <span id="usernameSuccess" style="display: none;" class="glyphicon glyphicon-ok form-control-feedback"></span>
               		        <span id="usernameError" style="display: none;" class="glyphicon glyphicon-remove form-control-feedback"></span>
                        </div>              
                    </div>
                </div>
                <div class="col-md-4" style="padding-top: 30px" >
                	 <span id="usernameMsg" style="color:red;" class="tips"></span>                  
                </div>
            </div>
        	
        	
        	<div class="row">
                <div class="col-md-8">
                    <div id="passwordDiv" class="form-group has-feedback">
                        <label for="password">密码</label>
                        <div class="input-group">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>                         
                            <input type="password" class="form-control" id="password" required="required"  placeholder="请输入密码" onblur="checkPassword()" />                         
                            <span id="passwordSuccess" style="display: none;" class="glyphicon glyphicon-ok form-control-feedback"></span>
               		        <span id="passwordError" style="display: none;" class="glyphicon glyphicon-remove form-control-feedback"></span>
                        </div>              
                    </div>
                </div>
                <div class="col-md-4" style="padding-top: 25px" >
                	 <span id="passwordMsg" style="color:blue;" class="tips">提示：密码长度6~18位，必须包含字母,数字或下划线</span>                  
                </div>
            </div>
            
            
            <div class="row">
                <div class="col-md-8">
                    <div id="repasswordDiv" class="form-group has-feedback">
                        <label for="password">确认密码</label>
                        <div class="input-group">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>                         
                            <input name="password" type="password" class="form-control" id="repassword" required="required" placeholder="请再次输入密码" onblur="checkRepassword()"/>                         
                            <span id="repasswordSuccess" style="display: none;" class="glyphicon glyphicon-ok form-control-feedback"></span>
               		        <span id="repasswordError" style="display: none;" class="glyphicon glyphicon-remove form-control-feedback"></span>
                        </div>              
                    </div>
                </div>
                <div class="col-md-4" style="padding-top: 30px" >
                	 <span id="repasswordMsg" style="color:red;" class="tips"></span>                  
                </div>
            </div>
            
            
             <div class="row">
                <div class="col-md-8">
                    <div id="phoneDiv" class="form-group has-feedback">
                        <label for="phone">手机号码</label>
                        <div class="input-group">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-phone"></span></span>                        
                            <input name="mobile" type="tel" id="phone" class="form-control"  required="required" autocomplete="off"  placeholder="请如实填写手机号码，可以通过手机号找回密码" onblur="checkPhone()"/>                        
                            <span id="phoneSuccess" style="display: none;" class="glyphicon glyphicon-ok form-control-feedback"></span>
               		        <span id="phoneError" style="display: none;" class="glyphicon glyphicon-remove form-control-feedback"></span>
                        </div>              
                    </div>
                </div>
                <div class="col-md-4" style="padding-top: 30px" >
                	 <span id="phoneMsg" style="color:red;" class="tips"></span>                  
                </div>
            </div>
        	
        	 <div class="row">
                <div class="col-md-8">
                    <div id="phoneDiv" class="form-group has-feedback">
                        <label for="username">性别</label>
                        <div class="input-group">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>                       
                            &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
							<input type="radio" name="sex" value="男" checked="checked">  &nbsp;&nbsp;男
							&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
							<input type="radio" name="sex" value="女">  &nbsp;&nbsp;女
                        </div>              
                    </div>
                </div>              
            </div>
        	
        	 <div class="row">
                <div class="col-md-8">
                    <div id="phoneDiv" class="form-group has-feedback">
                        <label for="phone">院系</label>
                        <div class="input-group">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-phone"></span></span>                        
                            <select name="department" style="height: 40px;width:560px;border-radius: 3px;">
								<option value="经济学院">经济学院</option>
								<option value="航空工程学院">航空工程学院</option>
								<option value="商学院">商学院</option>
								<option value="智能工程学院">智能工程学院</option>
								<option value="土木建筑学院">土木建筑学院</option>
								<option value="6">文法学院</option>
								<option value="文法学院">数学学院</option>
								<option value="体育与公共艺术部">体育与公共艺术部</option>
								<option value="国际教育学院">国际教育学院</option>
								<option value="管理工程学院">管理工程学院</option>
								<option value="信息管理学院">信息管理学院</option>
								<option value="民航学院">民航学院</option>
								<option value="材料学院">材料学院</option>
								<option value="艺术设计学院">艺术设计学院</option>
								<option value="外国语学院">外国语学院</option>
								<option value="马克思主义学院">马克思主义学院</option>
								<option value="继续教育学院">继续教育学院</option>
								<option value="蓝天书院">蓝天书院</option>
	                        </select>                         
                        </div>              
                    </div>
                </div>               
            </div>
        	
        	 <div class="row">
                <div class="col-md-8">
                    <div id="phoneDiv" class="form-group has-feedback">
                        <label for="username">备注</label>
                        <div class="input-group">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>                       
                            <textarea cols="76" rows="3" name="remarks" placeholder="备注信息，选填" ></textarea>
                        </div>              
                    </div>
                </div>              
            </div>
        	
   
   
   			 <div class="row">
                <div class="col-md-8">
                    <div  class="form-group has-feedback">
                          <input class="form-control btn btn-primary" id="submit" value="立&nbsp;&nbsp;即&nbsp;&nbsp;注&nbsp;&nbsp;册" type="submit">          
                    </div>
                </div>              
            </div>
   			
   			 <div class="row">
                <div class="col-md-8">
                    <div  class="form-group has-feedback">
                         <input value="返回登录界面"  class="form-control btn btn-danger" type="button" onclick="window.location.href='login.jsp'" >         
                    </div>
                </div>              
            </div>
   
             
        </form>
    </div>
</div>
</body>

<script>
	
var xmlhttp;
	 function checkUsername(){	 
		var username = $("#username").val().trim();
		//写ajax判断用户名
		if(username.length==0){
			$("#usernameMsg").html("用户名不能为空！");
			$("#usernameDiv").attr("class","form-group has-error has-feedback")
			$("#usernameError").css("display","block")
			return false;
		}
		
		$.ajax({
			url:"${pageContext.request.contextPath }/readerServlet?act=validateUsername",
		    data:{"username":username},
		    type:"post",
		    dataType:"text",
		    success:function(result){	
		    	 //alert(result);
		    	 console.log(result)
		    	 if(result=="用户名已存在，换个用户名吧！"){
		    		 $("#usernameMsg").html(result);
		    		 $("#usernameDiv").attr("class","form-group has-error has-feedback")
			         $("#usernameError").css("display","block")
		    		 return false;
		    	 }else{
		    		 $("#usernameError").css("display","none")
	    			 $("#usernameMsg").html("");
	    			 $("#usernameDiv").attr("class","form-group has-success has-feedback")		 
	    			 $("#usernameSuccess").css("display","block") 
	    			 return true;
		    	 }
		    		    	
		    },
		    error:function(){
		    	$("#usernameMsg").html("请求失败！");
		    	$("#usernameDiv").attr("class","form-group has-error has-feedback")
			    $("#usernameError").css("display","block")
		    	return false;
		    }
		})
		     $("#usernameError").css("display","none")
 			 $("#usernameMsg").html("");
 			 $("#usernameDiv").attr("class","form-group has-success has-feedback")		 
 			 $("#usernameSuccess").css("display","block") 
		return true;
	} 


	
	 function checkPassword(){
		var password = $("#password").val().trim();
    	 if(password.length>18 || password.length<6 ){   		
    		 $("#passwordMsg").html("<font style='color:red'>密码长度不合法,请换个密码！</font>");
    		 $("#passwordDiv").attr("class","form-group has-error has-feedback")
			 $("#passwordError").css("display","block")
    		 return false;
    	 }
    	  var reg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,18}$/;
    	  if(!reg.test(password)){   		 
    		  $("#passwordMsg").html("<font style='color:red'>必须包含字母,数字或下划线</font>");
    		  $("#passwordDiv").attr("class","form-group has-error has-feedback")
			  $("#passwordError").css("display","block")
    		  return false;
    	  }
    	      $("#passwordMsg").html("");
			  $("#passwordDiv").attr("class","form-group has-success has-feedback")
			  $("#passwordError").css("display","none")
			  $("#passwordSuccess").css("display","block")
    	  return true;  
	 }
   


   function checkRepassword(){
	   if(checkPassword()){   		 
    		 var repassword = $("#repassword").val().trim();
    		  if(repassword.length!=0){
    			    var password = $("#password").val().trim();			    	
			    	 if(password != repassword){
			    		 $("#repasswordMsg").html("两次密码输入不一致,请检查！")
			    		 $("#repasswordDiv").attr("class","form-group has-error has-feedback")
			             $("#repasswordError").css("display","block")
			    		 return false;
			    	 }else{
			    	 	 $("#repasswordMsg").html("")
			    		 $("#repasswordDiv").attr("class","form-group has-success has-feedback")
						 $("#repasswordError").css("display","none")
						 $("#repasswordSuccess").css("display","block")
			   		  return true;
			    	 }
			    	  return true; 
    		  }else{
    			  $("#repasswordMsg").html("请再次输入密码！")
    			   $("#repasswordDiv").attr("class","form-group has-error has-feedback")
			       $("#repasswordError").css("display","block")
    			  return false;
    		  }
			    	 
    	 }else{
    	 	  $("#passwordDiv").attr("class","form-group has-error has-feedback")
			  $("#passwordError").css("display","block")
    		 return false;
    	 } 	 
   }

   function checkPhone(){
	   var phone =$("#phone").val().trim();
	   if(phone.length==0){
		   $("#phoneMsg").html("请输入手机号码！")
		   $("#phoneDiv").attr("class","form-group has-error has-feedback")
		   $("#phoneError").css("display","block")
		   return false;
	   }
	   var reg=/^1(3|4|5|6|7|8|9)\d{9}$/;
	   if(!reg.test(phone)){
			$("#phoneMsg").html("手机号码有误，请检查！") 
			$("#phoneDiv").attr("class","form-group has-error has-feedback")
		    $("#phoneError").css("display","block")
			return false;
	   }else{
		    $("#phoneMsg").html("")
			 $("#phoneDiv").attr("class","form-group has-success has-feedback")
			 $("#phoneError").css("display","none")
			 $("#phoneSuccess").css("display","block")
			return true
	   }
   }

   function checkAll(){
	   if(checkUsername()&&checkRepassword()&&checkPhone()){
		   return true;
	   }else{
		   return false;
	   }
   }

</script>


</html>
