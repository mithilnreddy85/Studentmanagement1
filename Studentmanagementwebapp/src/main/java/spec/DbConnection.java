package spec;
import java.sql.*;
public class DbConnection {
	 private String url,username,pwd;
	 Connection conn;
	 Statement stmt;
	 
	 public DbConnection()
	 {
		 this.url="jdbc:mysql://localhost/spec";
		 this.pwd="root";
		 this.username="root";
		 conn=null;
		 stmt=null;
		 
	 }
	 public Statement establishConn() {
		 try {
		 conn=DriverManager.getConnection(this.url,this.pwd,this.username);
		 stmt=conn.createStatement();
	 }
		 catch(Exception e)
		 {
			 e.getMessage();
		 }
		 finally {
			return stmt;
		}

}}
