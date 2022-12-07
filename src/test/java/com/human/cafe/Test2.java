package com.human.cafe;

import java.sql.SQLException;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;



//@ContextConfiguration(classes=ServletContext.class) 자바로 작성했을 경우
//@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@RunWith(SpringRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class Test2 {

	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Autowired
	private ApplicationContext context;
	
	@Test
	public void test() {
		DriverManagerDataSource ds = (DriverManagerDataSource)context.getBean("dataSource");
		try {
			ds.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	//	assertNotNull(uploadPath);
	//	System.out.println(uploadPath);
	}

}
