package com.cya.util;

import java.sql.*;

public class DBUtil {
    /**
     * 连接数据库的操作，用户名，密码，使用jdbc连接
     */
    public static String username = "root";
    public static String password = "password";
    public static String url = "jdbc:mysql://localhost:3306/books?useUnicode=true&amp&characterEncoding=utf8&amp&serverTimezone=GMT%2B8";

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnectDb() {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(url, username, password);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }

    public static void CloseDB(ResultSet rs, PreparedStatement stm, Connection conn) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        if (stm != null) {
            try {
                stm.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }
}
