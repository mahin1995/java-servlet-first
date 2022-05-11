package com.mavenProject;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class registerAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stu
		PrintWriter out=response.getWriter();
		 try {
			  var firstName=request.getParameter("firstName");
			  var lastName =request.getParameter("lastName");
			  var password =request.getParameter("password");
			  var email =request.getParameter("email");
			  Part part=request.getPart("img");
			  String filename=part.getSubmittedFileName();
			 out.println(filename);
			  Class.forName("org.postgresql.Driver");
			 Connection con = DriverManager
			            .getConnection("jdbc:postgresql://localhost:5432/jsp_temp",
			            "mahin", "2580");
			 String q ="insert into users(lastName,firstName,email,password,image) values(?,?,?,?,?)";
			 PreparedStatement pstmt=con.prepareStatement(q);
			 pstmt.setString(1, lastName);
			 pstmt.setString(2, firstName);
			 pstmt.setString(3, email);
			 pstmt.setString(4, password);
			 pstmt.setString(5, filename);
			 pstmt.executeUpdate();
			 
			 
			 InputStream is = part.getInputStream();
			 byte []data = new byte[is.available()];
			 is.read(data);
			 Path dir = FileSystems.getDefault().getPath("//home//pikachu//eclipse-workspace//maven//src//");
			 out.print(dir);
			String path = dir+"//img"+File.separator+filename;
			 FileOutputStream fos=new FileOutputStream(path);
			 fos.write(data);
			 fos.close();
			   out.print("done....");
		 }catch(Exception e) {
			 out.print(e.toString());
		 }
	}

}
