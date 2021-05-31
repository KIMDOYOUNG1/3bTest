package com.gogi.proj.dy.model;

import java.util.List;

import com.gogi.proj.dy.vo.testVO;
import com.gogi.proj.dy.vo.testVO2;
import com.gogi.proj.dy.vo.testVO3;
import com.gogi.proj.dy.vo.testVO4;
import com.gogi.proj.dy.vo.testVO5;

public interface testService {

	public int insMM(testVO test);
	
	public List<testVO> seMM();
	
	public int insBoard(testVO test);
	
	public List<testVO2> boardview(testVO2 test);
	
	public List<testVO2> boardviewOne(testVO2 test);
	
	public int insac(testVO3 test);
	
	public List<testVO4> spsal(testVO4 test);
	
	public List<testVO4> spsalOne(testVO4 test);
	
	public int insspsal(testVO4 test);
	
	public int totalsp(testVO4 test);

	public int isMM(testVO test2);
	
	public int spdelete(testVO4 test);
	
	public int spupdate(testVO4 test);
	
	public int spfalse(testVO4 test);
	
	public List<testVO5> nationList(testVO5 test);
	
	public int insnation(testVO5 test);

}
