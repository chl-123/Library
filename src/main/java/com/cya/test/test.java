package com.cya.test;

import com.cya.pojo.Book;
import com.cya.pojo.PageInfo;
import com.cya.service.Service;
import com.cya.service.impl.ServiceImpl;

import java.util.List;

public class test {
    public static void main(String[] args) {
   /*     BookDao bookDao=new BookDao();
        *//*Integer pageTotalCount = bookDao.queryForPageTotalCount();
        System.out.println(pageTotalCount);*//*
        List<Book> books = bookDao.queryForPageItems(1, 6);
        for (Book o :books) {
            System.out.println(o.toString());
        }*/
        Service service=new ServiceImpl();
        PageInfo<Book> pageInfo = service.getPage(4,5);
        List<Book> books = pageInfo.getItems();
        for (Book o :books) {
            System.out.println(o.toString());
        }
    }
}
