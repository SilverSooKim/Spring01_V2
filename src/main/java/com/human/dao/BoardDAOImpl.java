package com.human.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.human.vo.BoardVO;
import com.human.vo.PageVO;;

@Repository   // dao 단임을 알려 준다..
public class BoardDAOImpl implements IF_boardDAO{
	// spring의 dao 와  Mybatis sqlsession을 연결하는 객체
	private static String mapperQuery = "com.human.dao.IF_boardDAO";  //매핑 인터페이스 경로설정
	//Mybatis의 sqlSession객체가 필요합니다.
	@Inject    // 컨테이너에서 가져와야한다. 컨테이너에서 자료형과 맞는 객체의 주소를 주입해 준다.
	private SqlSession sqlSession;  // SqlSession 타입의 객체는 스프링 컨테이너에 있다. 
	                                  // 여기서 이 객체가 필요하다. 그런데 컨테이너에서 가져와야한다. 스프링은 DI개념
	@Override
	public void insertOne(BoardVO boardvo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(mapperQuery+".insertOne", boardvo); // 쿼리를 매핑및 실행한다...
		       //  <insert //매핑정보   // id       // parameter
	}
	@Override
	public List<BoardVO> selectAll(PageVO pageVO) throws Exception {
		// TODO Auto-generated method stub	
		return sqlSession.selectList(mapperQuery+".selectAll",pageVO);
		
	}
	@Override
	public int countBoard() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery+".countBoard");
	}
	@Override
	public void insertAttach(String filename) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(mapperQuery+".board_attach",filename);
	}
	@Override
	public BoardVO selectOne(String vno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery+".selectOne",vno);
	}
	@Override
	public List<String> selectAttach(String vno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".selectAttach", vno);
	}
	@Override
	public void updateCnt(String vno) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(mapperQuery+".cntplus",vno);
	}
	@Override
	public void boardDel(String vno) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(mapperQuery+".boardDel",vno);
		
	}
	@Override
	public void updateBoard(BoardVO boardvo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(mapperQuery+".boardUpdate", boardvo);
	}

}
