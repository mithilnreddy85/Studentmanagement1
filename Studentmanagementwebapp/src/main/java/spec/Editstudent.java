package spec;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

/**
 * Servlet implementation class Editstudent
 */
public class Editstudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Editstudent() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String rno = request.getParameter("edit_rno");
			String nm = request.getParameter("edit_name");
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/spec",
					user = "root", password = "root";
			Connection conn = DriverManager.getConnection(url,user,password);
			Statement stmt = conn.createStatement();
			String sql = "UPDATE student_data SET name = '" + nm + "' WHERE roll_number = '" + rno + "'";
			int res = stmt.executeUpdate(sql);
			response.sendRedirect("default.jsp");
			//response.getWriter().println("<br /><br /><a href=\"index.html\"> Go Back </a> ");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			response.getWriter().println(e);
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
