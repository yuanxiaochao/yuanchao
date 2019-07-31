package com.github.zuihou;

import java.net.InetAddress;

import com.github.zuihou.auth.server.EnableAuthServer;
import com.github.zuihou.user.annotation.EnableLoginArgResolver;
import com.github.zuihou.validator.config.EnableFormValidator;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * @author zuihou
 * @createTime 2018-01-13 1:34
 */
@SpringBootApplication
@EnableDiscoveryClient
@EnableTransactionManagement
@EnableAuthServer
@Configuration
@EnableFeignClients(value = {
        "com.github.zuihou",
})
@Slf4j
@EnableLoginArgResolver
@EnableFormValidator
public class AuthorityApplication {
    public static void main(String[] args) throws Exception {
        ConfigurableApplicationContext application = SpringApplication.run(AuthorityApplication.class, args);
        Environment env = application.getEnvironment();
        log.info("\n----------------------------------------------------------\n\t" +
                        "应用 '{}' 运行成功! 访问连接:\n\t" +
                        "Swagger文档: \t\thttp://{}:{}/doc.html\n" +
                        "----------------------------------------------------------",
                env.getProperty("spring.application.name"),
                InetAddress.getLocalHost().getHostAddress(),
                env.getProperty("server.port"));
    }
}
