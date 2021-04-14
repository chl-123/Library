package com.cya.controller;

import com.cya.dao.AdminDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UserServlet extends BaseServlet{
    public void addUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置编码类型
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //获取要添加的读者的信息
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        int lend_num = Integer.parseInt(request.getParameter("lend_num"));
        int max_num = Integer.parseInt(request.getParameter("max_num"));

        AdminDao userdao = new AdminDao();
        //调用函数添加读者信息
        userdao.Register(username, password, name, email, phone, lend_num, max_num);
        response.sendRedirect("/manage_books/books/admin/admin_users.jsp");
    }
    public void removeUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
        //删除读者信息
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        int aid = Integer.parseInt(request.getParameter("aid"));
        AdminDao admindao = new AdminDao();
        admindao.deleteUser(aid);
        response.sendRedirect("/manage_books/books/admin/admin_users.jsp");
    }
    public void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //修改读者的信息
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        int lend_num = Integer.parseInt(request.getParameter("lend_num"));
        int max_num = Integer.parseInt(request.getParameter("max_num"));
        int aid = Integer.parseInt(request.getParameter("aid"));
        AdminDao userdao = new AdminDao();
        userdao.updateUser(aid, username, password, name, email, phone, lend_num, max_num);
        response.sendRedirect("/manage_books/books/admin/admin_users.jsp");
    }
}
