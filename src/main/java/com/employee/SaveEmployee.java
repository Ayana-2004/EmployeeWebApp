package com.employee;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/SaveEmployee")
public class SaveEmployee extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String dept = request.getParameter("dept");
        String desig = request.getParameter("desig");
        String salary = request.getParameter("salary");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/company", "root", "root");

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO employee(emp_name, dept_id, desig_id, salary) VALUES (?, ?, ?, ?)"
            );
            ps.setString(1, name);
            ps.setInt(2, Integer.parseInt(dept));
            ps.setInt(3, Integer.parseInt(desig));
            ps.setInt(4, Integer.parseInt(salary)); // FIXED

            int result = ps.executeUpdate();

            if (result > 0) {
                out.println("<h2>Employee Saved Successfully</h2>");
            } else {
                out.println("<h2>Insert Failed</h2>");
            }

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace(out); // Show full error in browser
        }
    }
}
