import java.io.IOException;  
import java.io.PrintWriter;  
  
import javax.servlet.ServletException;  
import javax.servlet.annotation.WebServlet;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  

public class login extends HttpServlet {  
    private static final long serialVersionUID = 1L;  
  
    @Override  
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
	br.close();
	fr.close();
        if (flag == 0 || flag == 2) {
          request.setAttribute("inf", "error");
          request.getRequestDispatcher("index.jsp").forward(request, response);
       }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGet(request, response);
    }
}
