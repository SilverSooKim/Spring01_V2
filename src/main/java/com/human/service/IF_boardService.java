package com.human.service;

import java.util.List;

import com.human.vo.BoardVO;
import com.human.vo.PageVO;

public interface IF_boardService {
	public void insertOne(BoardVO boardvo) throws Exception; // 컨트롤러에서 호출할 메서드...
	public List<BoardVO> selectAll(PageVO pageVO) throws Exception; 
	public int countBoard() throws Exception;
	public BoardVO selectOne(String vno) throws Exception;
	public List<String> selectAttach(String vno) throws Exception;
	public void updatecnt(String vno) throws Exception;
	public void boardDel(String vno) throws Exception;
	public void udpateBoard(BoardVO boardvo) throws Exception;
}
