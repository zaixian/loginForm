<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.io.*,java.util.*" %>

<!DOCTYPE html>
<html lang="ch" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>登录框</title>
  </head>
  <body>
    <div>
      <form class="LoginForm" action="login" method="post">
        用户名: <input type="text" name="userName" value="">
        <br>
        密码: <input type="text" name="userPassword" value="">
        <br>
        <input type="submit" name="submitInfo" value="登录">
      </form>
    </div>
    <div>
	<%
	String info = String.valueOf(request.getAttribute("inf"));
	if (info != null) {
          if (info.equals("error")) { 
	%>
	  <p> <font color="redi"> 用户名或密码错误 </font> </p>
	<%
	   }
	} 
	%>
    </div>
  </body>

  <style>
  body{TEXT-ALIGN: center;}
  </style>
</html>


