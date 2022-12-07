package com.human.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.human.vo.MemberVO;

public interface IF_memberService {
	
	public MemberVO selectOne(String id) throws Exception;
	public MemberVO deleteUser(String id) throws Exception;
	
}
