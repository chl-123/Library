package com.cya.controller;

import com.cya.dao.AdminDao;
import com.cya.pojo.Admin;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class Login_Register_LoginOutServlet extends BaseServlet{
    private String url="";
    public void doLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //登录的判断
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //获取账号和密码
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        AdminDao userdao = new AdminDao();
        //对账号和密码进行判断
        boolean result = userdao.Login_verify(username, password);
        HttpSession session = request.getSession();
        //判断输入正确
        if (result) {
            Admin adminbean = new Admin();
            AdminDao admindao = new AdminDao();
            //更加账号和密码查找出读者的信息
            adminbean = admindao.getAdminInfo(username, password);
            if(adminbean.getStatus()==1) {
                //将uid存入session中
                session.setAttribute("uid", "" + adminbean.getAid());
            }
            else {
                //将aid存入session中
                session.setAttribute("aid", "" + adminbean.getAid());
            }

            //设置session的失效时间
            session.setMaxInactiveInterval(6000);
            //根据status的值来判断是管理员，还是读者，status=1为读者
            if (adminbean.getStatus() == 1) {
                response.sendRedirect("/manage_books/books/user/index.jsp");
            } else {
                response.sendRedirect("/manage_books/books/admin/index.jsp");
            }
        } else {
            //没有找到对应的账号和密码，返回重新登录
            session.setAttribute("state", "账号或密码错误");
            response.sendRedirect("/manage_books/books/login.jsp");
        }
    }
    public void doRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //获取注册信息
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        int lend_num = 30;
        int max_num = 5;
        AdminDao userdao = new AdminDao();
        //将注册信息存入数据库，再返回登录
        userdao.Register(username, password, name, email, phone, lend_num, max_num);
        response.sendRedirect("/manage_books/books/login.jsp");
    }
    public void doLoginOut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id=request.getParameter("id");
        String status=request.getParameter("status");
        HttpSession session=request.getSession();
        if(status.equals("uid")) {
            //用户退出
            session.removeAttribute("uid");
            url="./index.jsp";
        }
        else {
            //管理员退出
            session.removeAttribute("aid");
            url="./index.jsp";
        }
        response.sendRedirect(url);
    }
}
