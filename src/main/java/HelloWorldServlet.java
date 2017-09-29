
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class HelloWorldServlet extends HttpServlet {

	public HelloWorldServlet(){
		System.out.println("from Constructor...");	
	}


	public void init() throws ServletException {
		System.out.println("from INIT...");
	}

    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
        throws IOException, ServletException
    {

        response.setContentType("text/html");
	    PrintWriter out = response.getWriter();
		String title="Hello World Servlet";

        out.println("<html>");
        out.println("<head>");
	    out.println("<title>" + title + "</title>");
        out.println("</head>");
        out.println("<body bgcolor=\"white\">");
        out.println("<h1>" + title + "</h1>");
        out.println("</body>");
        out.println("</html>");

    }
}
