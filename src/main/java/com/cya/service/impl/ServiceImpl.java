package com.cya.service.impl;

import com.cya.dao.BookDao;
import com.cya.pojo.Book;
import com.cya.pojo.PageInfo;
import com.cya.service.Service;

import java.util.List;

public class ServiceImpl implements Service {
    private BookDao bookDao=new BookDao();
    @Override
    public PageInfo<Book> getPage(int pageNum, int pageSize) {
        PageInfo<Book> pageInfo = new PageInfo<>();

        // 设置每页显示的数量
        pageInfo.setPageSize(pageSize);
        // 求总记录数
        Integer pageTotalCount = bookDao.queryForPageTotalCount();
        // 设置总记录数
        pageInfo.setPageTotalCount(pageTotalCount);
        // 求总页码
        Integer pageTotal = pageTotalCount / pageSize;
        if (pageTotalCount % pageSize > 0) {
            pageTotal+=1;
        }
        // 设置总页码
        pageInfo.setPageTotal(pageTotal);

        // 设置当前页码
        pageInfo.setPageNum(pageNum);

        // 求当前页数据的开始索引
        int begin = (pageInfo.getPageNum() - 1) * pageSize;
        // 求当前页数据
        List<Book> items = bookDao.queryForPageItems(begin,pageSize);
        // 设置当前页数据
        pageInfo.setItems(items);

        return pageInfo;
    }
}
