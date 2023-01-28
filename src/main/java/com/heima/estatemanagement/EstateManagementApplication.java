package com.heima.estatemanagement;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import tk.mybatis.spring.annotation.MapperScan;

@SpringBootApplication
//注意：@MapperScan注解要导入TK包下的
@MapperScan(basePackages = "com.heima.estatemanagement.dao")
public class EstateManagementApplication {

    public static void main(String[] args) {
        SpringApplication.run(EstateManagementApplication.class, args);
    }

}
