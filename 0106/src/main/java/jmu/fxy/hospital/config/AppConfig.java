package jmu.fxy.hospital.config;

import jmu.fxy.hospital.Service.Impl.UserServiceImpl;
import jmu.fxy.hospital.Service.UserService;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {"jmu.fxy.hospital.Service", "jmu.fxy.hospital.Controller", "jmu.fxy.hospital.Mapper", "jmu.fxy.hospital.login"})
@PropertySource("classpath:/db.properties")
@MapperScan("jmu.fxy.hospital.Mapper")
public class AppConfig {
    @Value("${mysql.driver}")
    private String driverClassName;

    @Value("${mysql.url}")
    private String url;

    @Value("${mysql.userName}")
    private String username;

    @Value("${mysql.password}")
    private String password;

    @Bean
    public DriverManagerDataSource dataSource(){
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName(driverClassName);
        dataSource.setUrl(url);
        dataSource.setUsername(username);
        dataSource.setPassword(password);
        return dataSource;
    }

    //配置业务层的服务Bean
    @Bean
    public UserService userService(){
        return new UserServiceImpl();
    }

    @Bean
    public InternalResourceViewResolver viewResolver(){
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/");
        resolver.setSuffix(".jsp");
        return  resolver;
    }

    @Bean
    public SqlSessionFactory sqlSessionFactory() throws Exception{
        SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
        factoryBean.setDataSource(dataSource());

        factoryBean.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath:/UserMapper.xml"));
        factoryBean.setConfigLocation(new ClassPathResource("mybatis-config.xml"));

        return factoryBean.getObject();
    }


}


