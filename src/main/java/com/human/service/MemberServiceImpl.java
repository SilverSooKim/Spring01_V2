package com.human.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.human.dao.IF_memberDAO;
import com.human.vo.MemberVO;
@Service
public class MemberServiceImpl implements IF_memberService{
	@Inject
	private IF_memberDAO memberdao;
	@Override
	public MemberVO selectOne(String id) throws Exception {
		// TODO Auto-generated method stub
		return memberdao.SelectOne(id);
	}
	@Override
	public MemberVO deleteUser(String id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
