package com.human.cafe;

import java.util.List;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LoginController {
	
	@RequestMapping(value = "/idcheck", method = RequestMethod.POST)
	public String idchk(@RequestParam String userid, @RequestParam String pwd) {// jsp에서 JSON.stringify 없어야 함.
		
		
		if(userid.equals("111")) {
			return "2";
		}
		System.out.println("kkkk >  " + userid +"/" +pwd );
		return "0";
	}
//
/*	
	public int idchk(@RequestBody String userid) {
		System.out.println("kkkk >  " + userid  );
		if(userid.equals("111")) {
			return 2;
		}
		return 0;
	} 
*/		
	
// Map으로 받기
/*	
	@RequestMapping(value = "/idcheck", method = RequestMethod.POST)
	@ResponseBody
	public int idchk1(@RequestBody Map<String, Object> a) {   // jsp에서 JSON.stringify 해 줘야 함...
		String userid=(String)a.get("userid");
		System.out.println("kkkk >  " + userid +"/"  );
		if(userid.equals("111")) {
			return 2;
		}
		return 0;
	}*/
	
	//----------------------------------------
/*	
	@ResponseBody
	public int idCheck(@RequestParam("userid") String id) {
		
		System.out.println(id);
		return cnt;
		
	}*/


	//REST 동작 정의
	// 삭제
/*
		@DeleteMapping("/users/{id}")
		public int deleteUser(@PathVariable int id) {
			return dao.deleteUser(id);
		}
		
		// 수정
		@PutMapping("/users")
		public int updateUser(@RequestBody UserVO user) {
			return dao.updateUser(user);
		}
		
		
		// 등록
		@PostMapping("/users")
		public int insertUser(@RequestBody UserVO user) {
			return dao.insertUser(user);
		}
		
		
		
		// 1명 조회
		@GetMapping("/users/{userid}")
		public UserVO user(@PathVariable String userid) {
			return dao.getUser(userid);
		}
		
		
		// 목록조회
		@GetMapping("/users")
		public List<UserVO> users(){
			return dao.getUsers();
		}
	*/	

}
