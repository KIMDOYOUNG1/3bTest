package com.gogi.proj.dy.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gogi.proj.dy.vo.testVO;
import com.gogi.proj.dy.vo.testVO2;
import com.gogi.proj.dy.vo.testVO3;
import com.gogi.proj.dy.vo.testVO4;
import com.gogi.proj.dy.vo.testVO5;

@Service
public class testServiceImpl implements testService{

	@Autowired
	private testServiceDAO testServiceDAO;
	@Override
	public int insMM(testVO test) {

		return testServiceDAO.insMM(test);
	}
	
	public List<testVO>seMM() {
		
		return testServiceDAO.seMM();
	}

	public int insBoard(testVO test) {

		return testServiceDAO.insBoard(test);
	}

	public List<testVO2>boardview(testVO2 test) {
		
		return testServiceDAO.boardview(test);
	}

	public List<testVO2>boardviewOne(testVO2 test) {
	
	return testServiceDAO.boardviewOne(test);
}
	public int insac(testVO3 test) {

		return testServiceDAO.insac(test);
	}

	public List<testVO4>spsal(testVO4 test) {
		
	return testServiceDAO.spsal(test);
}
	
	public List<testVO4>spsalOne(testVO4 test) {
		
	return testServiceDAO.spsalOne(test);
}
	public int insspsal(testVO4 test) {

		return testServiceDAO.insspsal(test);
	}
	
	public int totalsp(testVO4 test) {

		return testServiceDAO.totalsp(test);
	}
	
	public int isMM(testVO test2) {

		return testServiceDAO.isMM(test2);
	}
	
	public int spdelete(testVO4 test) {

		return testServiceDAO.spdelete(test);
	}
	
	public int spupdate(testVO4 test) {

		return testServiceDAO.spupdate(test);
	}
	
	public int spfalse(testVO4 test) {

		return testServiceDAO.spfalse(test);
	}
	
	public List<testVO5>nationList(testVO5 test) {
		
		return testServiceDAO.nationList(test);
	}
	
	public int insnation(testVO5 test) {

		return testServiceDAO.insnation(test);
	}
}
