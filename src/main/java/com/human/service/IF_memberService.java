package com.human.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.human.vo.MemberVO;

public interface IF_memberService {
	
	public MemberVO selectOne(String id) throws Exception;
	public int deleteUser(String id) throws Exception;
	
}
