package com.example.servcie.impl;

import com.example.dao.UserDao;
import com.example.pojo.Userdb;
import com.example.servcie.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    //注入UserDao <MyBatis自动生成的代理对象>
    @Autowired
    private UserDao userDao;

    @Override
    @Transactional
    public List<Userdb> findAll() {
        return userDao.findAll();
    }

    @Override
    @Transactional
    public Userdb findById(Integer id) {
        return userDao.findById(id);
    }

    @Override
    @Transactional
    public void updateById(Userdb userdb) {
        userDao.updateById(userdb);
    }

    @Override
    @Transactional
    public void deleteById(Integer id) {
        userDao.deleteById(id);
    }

    @Override
    @Transactional
    public void add(Userdb userdb) {
        userDao.add(userdb);
    }


}
