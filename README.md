# 学生笔记管理系统 - SSM项目

## 项目简介
这是一个基于Spring + SpringMVC + MyBatis（SSM）框架开发的学生笔记管理系统，目前主要实现了用户信息的增删改查（CRUD）功能。该项目旨在作为学习SSM框架的实践案例，展示了如何使用这些技术构建一个完整的Web应用。

## 技术栈
- **后端框架**：
  - Spring 5.3.20
  - SpringMVC 5.3.20
  - MyBatis 3.5.16
- **数据库**：MySQL 8.0.33
- **数据库连接池**：Druid 1.2.23
- **日志框架**：Log4j2 2.19.0
- **前端技术**：JSP、jQuery
- **构建工具**：Maven
- **Java版本**：Java 16/17

## 项目结构

```
src/
├── main/
│   ├── java/com/example/
│   │   ├── controller/    # 控制器层，处理HTTP请求
│   │   │   ├── TestController.java
│   │   │   └── UserController.java
│   │   ├── dao/          # 数据访问层，定义数据库操作接口
│   │   │   ├── UserDao.java
│   │   │   └── UserDao.xml
│   │   ├── pojo/         # 实体类，对应数据库表
│   │   │   └── Userdb.java
│   │   └── servcie/      # 业务逻辑层
│   │       ├── UserService.java
│   │       └── impl/
│   │           └── UserServiceImpl.java
│   ├── resources/        # 配置文件
│   │   ├── applicationContext-dao.xml    # DAO层Spring配置
│   │   ├── applicationContext-service.xml # Service层Spring配置
│   │   ├── db.properties                 # 数据库配置
│   │   ├── mybatis-config.xml            # MyBatis配置
│   │   └── spring-mvc.xml                # SpringMVC配置
│   └── webapp/           # Web资源文件
└── test/                 # 测试代码
```

## 功能模块

### 用户管理模块
- **查询所有用户**：查看系统中所有用户的信息
- **根据ID查询用户**：查看特定用户的详细信息
- **添加用户**：创建新的用户账户
- **更新用户信息**：修改现有用户的信息
- **删除用户**：从系统中移除用户

## 数据库设计

### user表
| 字段名 | 类型 | 描述 |
|-------|------|------|
| id | INT | 主键ID |
| username | VARCHAR | 用户名 |
| password | VARCHAR | 密码 |

## 核心功能实现

### 实体类 (Userdb.java)
```java
public class Userdb {
    private Integer id;      // 主键
    private String username; // 用户名
    private String password; // 密码
    // getter和setter方法...
}
```

### DAO接口 (UserDao.java)
```java
public interface UserDao {
    // 查看所有用户
    List<Userdb> findAll();
    // 根据ID查询用户
    Userdb findById(Integer id);
    // 根据ID更新用户信息
    void updateById(Userdb userdb);
    // 根据ID删除用户信息
    void deleteById(Integer id);
    // 添加用户
    void add(Userdb userdb);
}
```

### Service接口及实现 (UserService.java / UserServiceImpl.java)
```java
@Service
public class UserServiceImpl implements UserService {
    // 注入UserDao
    @Autowired
    private UserDao userDao;
    
    @Override
    @Transactional
    public List<Userdb> findAll() {
        return userDao.findAll();
    }
    
    // 其他方法实现...
}
```

### 控制器 (UserController.java)
```java
@Controller
@RequestMapping("/user")
public class UserController {
    // 注入UserService
    @Autowired
    private UserService userService;
    
    // 查询所有用户
    @RequestMapping("/findAll.do")
    public String findAll(Model model) {
        List<Userdb> userdbList = userService.findAll();
        model.addAttribute("userdbList", userdbList);
        return "user/list";
    }
    
    // 其他请求处理方法...
}
```

## 配置说明

### 数据库配置 (db.properties)
```properties
jdbc.driver = com.mysql.cj.jdbc.Driver
jdbc.url = jdbc:mysql://localhost:3306/user?useSSL=true&useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Shanghai
jdbc.username = root
jdbc.password = root
```

### Spring配置 (applicationContext-dao.xml)
配置了数据源、事务管理器、MyBatis SqlSessionFactory和Mapper扫描器。

### SpringMVC配置 (spring-mvc.xml)
配置了Controller扫描、注解驱动、视图解析器和静态资源处理。

## 部署与运行

### 环境要求
- JDK 16或17
- Maven 3.6+ 
- MySQL 8.0
- Tomcat 9.0+（或其他兼容的Servlet容器）

### 数据库准备
1. 创建名为`user`的数据库
2. 创建user表：
```sql
CREATE TABLE user (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL
);
```

### 项目部署
1. 克隆项目到本地
2. 修改`db.properties`中的数据库连接信息
3. 执行`mvn clean package`打包项目
4. 将生成的war包部署到Tomcat的webapps目录
5. 启动Tomcat服务器
6. 访问`http://localhost:8080/studyssm/user/index.do`查看项目

## 项目扩展建议
1. 添加用户登录和权限控制功能
2. 完善笔记管理功能
3. 优化前端界面设计
4. 添加分页功能和搜索功能
5. 实现密码加密存储

## 注意事项
- 项目使用了事务管理，确保数据操作的原子性
- 本项目仅作为学习参考，生产环境中需进行安全加固
- 日志级别配置在MyBatis中设置为STDOUT_LOGGING，可根据需要调整

## License
本项目仅供学习使用。
