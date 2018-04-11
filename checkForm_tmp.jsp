<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.* " %>
<jsp:useBean id='oMD5' scope='request' class='beartool.MD5'/>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>登录结果</title>
  </head>

  <body>
       <%
       public class LoginServlet extends HttpServlet {
         private static final long serialVersionUID = 1L; 
       protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String fileName = request.getRealPath("userInfo.txt");
       File f = new File(fileName);
       FileReader fr = new FileReader(f);
       BufferedReader br = new BufferedReader(fr);
       String firstLine = "";
       String secondLine = "";
       String name = new String((request.getParameter("userName")).getBytes("ISO-8859-1"),"UTF-8");
       int flag = 0;
       while((firstLine = br.readLine()) != null) { 
	 if (name.equals(firstLine)) {
	   flag = 1;
           if ((secondLine = br.readLine()) != null ) {
             String password = request.getParameter("userPassword");
             String pwMD5 = oMD5.getMD5ofStr(password);
             if (pwMD5.equals(secondLine)) {
		String site = new String("success.html");
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", site);
             } else {
		 flag = 2;	
	       }
           }
         }
	}
	if (flag == 0 || flag == 2) {
	  request.setAttribute("inf", "error");
	  request.getRequestDispatcher("index.jsp").forward(request, response);
       }
       br.close();
       fr.close();
      }
      
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          doGet(request, response);
        }
      }
      %>
 </body>
</html>

