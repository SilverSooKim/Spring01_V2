package com.human.cafe;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;



//@ContextConfiguration(classes=ServletContext.class) 자바로 작성했을 경우
//@RunWith(SpringJUnit4ClassRunner.class)
@RunWith(SpringRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class Test2 {

	
//	@Resource(name="uploadPath")
//	private String uploadPath;
	
	@Autowired
	private ApplicationContext context;
	
	@Test
	public void test() {
		DriverManagerDataSource ds = (DriverManagerDataSource)context.getBean("dataSource");
			
	
	//	assertNull(uploadPath);
	//	assertNotNull(ds);
	}

}
