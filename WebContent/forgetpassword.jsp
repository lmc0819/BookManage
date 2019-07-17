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
	</head>
<body>

<div class="container">
	<br /><br /><br />
	<br /><br /><br />
	<h2 style="text-align:center">重置密码</h2>
    <div class="col-md-6 col-md-offset-3">
        <form action="fortgetPwdServlet" method="post">                
            <div id="phoneDiv" class="form-group has-feedback ">
                <label for="phoneNum">手机号码</label>
                <div class="input-group">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-phone"></span></span>                 
               		<input id="phone" name="phonenumber" class="form-control" type="text"  required  autocomplete="off" placeholder="请输入手机号码"  onblur="checkPhone()">	
               		<span id="phoneError" style="display: none;" class="glyphicon glyphicon-remove form-control-feedback"></span>
               		<span id="phoneSuccess" style="display: none;" class="glyphicon glyphicon-ok form-control-feedback"></span>
                </div>            
            </div>

            <div class="row">
                <div class="col-xs-9">
                    <div id="codeDiv" class="form-group has-feedback">
                        <label for="idcode-btn">校验码</label>
                        <div class="input-group">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-qrcode"></span></span>                          
                            <input id="checkCode" name="checkCode" type="text"  required  autocomplete="off" placeholder="请输入验证码" maxlength="6" class="form-control" onblur="checkPhoneCode()" >                         
                            <span id="codeSuccess" style="display: none;" class="glyphicon glyphicon-ok form-control-feedback"></span>
               		        <span id="codeError" style="display: none;" class="glyphicon glyphicon-remove form-control-feedback"></span>
                        </div>              
                    </div>
                </div>
                <div class="col-xs-3 text-center" style="padding-top: 26px">
                	  <input disabled="disabled" id="getCode" name="getCode" class="btn btn-primary"  type="button" value="发送验证码"/>  
                    <!--<button type="button" id="loadingButton" class="btn btn-primary" autocomplete="off">获取短信校验码</button>-->
                </div>
            </div>
			
			  <div id="newPwdDiv" class="form-group has-feedback">
                <label for="password">新密码</label>
                <div class="input-group">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>                  
               		<input name="newPwd" type="password"  required  autocomplete="off" placeholder="请输入新密码" maxlength="20" class="form-control" onblur="checkNewPwd()">
               		<span id="newPwdSuccess" style="display: none;" class="glyphicon glyphicon-ok form-control-feedback"></span>
               		<span id="newPwdError" style="display: none;" class="glyphicon glyphicon-remove form-control-feedback"></span>
                </div>              
            </div>

            <div id="rePwdDiv" class="form-group has-feedback">
                <label for="passwordConfirm">确认密码</label>
                <div class="input-group">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                    <!--<input id="passwordConfirm" class="form-control" placeholder="请再次输入密码" maxlength="20" type="password">-->
                	<input name="rePwd" type="password" class="form-control"  required   autocomplete="off" placeholder="请再次输入新密码"  onblur="checkRePwd()" >
                	<span id="rePwdSuccess" style="display: none;" class="glyphicon glyphicon-ok form-control-feedback"></span>
               		<span id="rePwdError" style="display: none;" class="glyphicon glyphicon-remove form-control-feedback"></span>
                </div>
                
            </div>

			
            <div class="form-group">
                <input disabled="disabled" style="color: #000000;" class="form-control btn btn-primary" id="submit" value="重&nbsp;&nbsp;置&nbsp;&nbsp;密&nbsp;&nbsp;码" type="submit">
            </div>

            <div class="form-group">
                <input  value="返回登录界面"  class="form-control btn btn-danger" type="button" onclick="window.location.href='login.jsp'" >
            </div>
        </form>
    </div>
</div>



</body>
	<script type="text/javascript">			
			
		     function checkPhone(){
		    	 var phonenumber = $("#phone").val().trim();
					if(phonenumber.length==0){												
						alert("手机号码不能为空")
						$("#phoneDiv").attr("class","form-group has-error has-feedback")
						$("#phoneError").css("display","block")
						return false;
					}
					
					var reg= /^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$/;
					if(!reg.test(phonenumber)){																	 
						 alert("手机号码不合法，请重新输入！");
						 $("#phoneDiv").attr("class","form-group has-error has-feedback")
						 $("#phoneError").css("display","block")
						 $("#getCode").attr("disabled","disabled")
						 return false;
					}
					     $("#phoneDiv").attr("class","form-group has-success has-feedback")
						 $("#phoneError").css("display","none")
						 $("#phoneSuccess").css("display","block")
					     $("#getCode").removeAttr("disabled");
					return true;
		     }		
		
		     
		     
		     function checkPhoneCode(){
		    	 var code = $("#checkCode").val().trim();
		    	 if(code.length==0){						
					alert("验证码不能为空！")
					$("#codeDiv").attr("class","form-group has-error has-feedback")
					$("#codeError").css("display","block")
					return false;
				 }
		    	 var reg = /^\d{6}$/;
		    	 if(!reg.test(code)){
		    		 alert("验证码必须是六位数字");
		    		 $("#codeDiv").attr("class","form-group has-error has-feedback")
					 $("#codeError").css("display","block")
		    		 return false;
		    	 }
		    	 $("#codeDiv").attr("class","form-group has-success has-feedback")
				 $("#codeError").css("display","none")
				 $("#codeSuccess").css("display","block")
		    	 return true;
		     }
			  
			function checkNewPwd(){
				var newPwd = $("input[name='newPwd']").val().trim();
				if(newPwd.length==0){
					alert("请输入密码！");
					$("#newPwdDiv").attr("class","form-group has-error has-feedback")
					$("#newPwdError").css("display","block")
					return false;
				}
				var reg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,18}$/;
				if(!reg.test(newPwd)){
					alert("密码不合法(6-18位数字字母组合)");
					$("#newPwdDiv").attr("class","form-group has-error has-feedback")
					$("#newPwdError").css("display","block")
					return false;
				}
				 $("#newPwdDiv").attr("class","form-group has-success has-feedback")
				 $("#newPwdError").css("display","none")
				 $("#newPwdSuccess").css("display","block")
				return true;
			}
		     
		     
			function checkRePwd(){
				if(checkPhone()&&checkPhoneCode()&&checkNewPwd()){
					var rePwd = $("input[name='rePwd']").val().trim();
					var newPwd = $("input[name='newPwd']").val().trim();
					if(rePwd.length==0){
						alert("请输入密码！");
						$("#rePwdDiv").attr("class","form-group has-error has-feedback")
					    $("#rePwdError").css("display","block")
					    $("#submit").attr("disabled","disabled");
						return false;
						
					}				
					if(rePwd!=newPwd){
						alert("两次密码输入不一致，请检查！");
						$("#rePwdDiv").attr("class","form-group has-error has-feedback")
					    $("#rePwdError").css("display","block")
					    $("#submit").attr("disabled","disabled");
						return false;
					}	
					 $("#rePwdDiv").attr("class","form-group has-success has-feedback")
					 $("#rePwdError").css("display","none")
					 $("#rePwdSuccess").css("display","block")	
					 $("#submit").removeAttr("disabled")
					  return true;
					  
										
				}else{
					$("#submit").attr("disabled","disabled");
					return false;
				}
			    
				
			}
			
		 
			
			
			
			
		 $(function(){
								 
//		    $("#getCode").removeAttr("disabled");//记得括号里，对应的是id		    
		    //发送验证码
		    $("#getCode").click(function(){			    			    	
			        $.ajax({
			        url:"phoneVerifyServlet",//ajax提交表单
			        data:{"phone":$("#phone").val()},
			        type:"post",
			        async:true,
			        dataType:"text",
			        success:function(data){
			           if(data!=null){
			             alert("验证码已发送");
			             time(this);
			           }else
			              alert("发送失败");
			        },
			        error:function(){
			            alert("error");
			       }		        
		         
		   });
		   
		   });
		   
		   
		 });
			  
		  //倒计时
		  var wait=60;
		  function time(obj){
		    if(wait==0){
		      $("#getCode").removeAttr("disabled");
		      $("#getCode").val("重新获取");
		      wait=60;
		    }else{
		        $("#getCode").attr("disabled","disabled");
		        $("#getCode").val(wait+"s后重新获取");
		        wait--;
		        setTimeout(function(){//倒计时的方法
		            time(obj);
		        },1000);        //1s
		     }
		  }
		   
			
		</script>




</html>
