package com.example.dao;

import com.example.pojo.Userdb;

import java.util.List;

public interface UserDao {
    //查看所有用户
    List<Userdb> findAll();
    //根据ID查询用户
    Userdb findById(Integer id);
    //根据ID更新用户信息
    void updateById(Userdb userdb);
    //根据ID删除用户信息
    void deleteById(Integer id);
    //添加用户
    void add(Userdb userdb);
}
