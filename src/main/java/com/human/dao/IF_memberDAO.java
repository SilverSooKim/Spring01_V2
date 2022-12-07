package com.human.dao;

import com.human.vo.MemberVO;

public interface IF_memberDAO {
	
	public MemberVO SelectOne(String id) throws Exception;

}
