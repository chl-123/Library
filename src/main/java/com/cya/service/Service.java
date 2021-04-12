package com.cya.service;

import com.cya.pojo.Book;
import com.cya.pojo.PageInfo;

public interface Service {

    PageInfo<Book> getPage(int pageNo, int pageSize);
}
