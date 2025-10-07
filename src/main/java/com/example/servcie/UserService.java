package com.example.servcie;
import com.example.pojo.Userdb;
import java.util.List;
// UserService接口


public interface UserService {
    List<Userdb> findAll();
    Userdb findById(Integer id);
    void updateById(Userdb userdb);
    void deleteById(Integer id);
    void add(Userdb userdb);
}
