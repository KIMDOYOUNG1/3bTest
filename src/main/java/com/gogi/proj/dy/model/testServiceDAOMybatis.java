package com.gogi.proj.dy.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.gogi.proj.configurations.model.ConfigurationDAO;
import com.gogi.proj.dy.vo.testVO;
import com.gogi.proj.dy.vo.testVO2;
import com.gogi.proj.dy.vo.testVO3;
import com.gogi.proj.dy.vo.testVO4;
import com.gogi.proj.dy.vo.testVO5;
@Repository
public class testServiceDAOMybatis extends SqlSessionDaoSupport implements testServiceDAO{
	private String namespace = "test.dy";
	@Override
	public int insMM(testVO test) {

		return getSqlSession().insert(namespace+".insMM", test); 
	}
	public List<testVO> seMM() {
		
		return getSqlSession().selectList(namespace+".seMM");
	}
	
	public int insBoard(testVO test) {

		return getSqlSession().insert(namespace+".insBoard", test); 
	}
	
	public List<testVO2> boardview(testVO2 test) {
		
		return getSqlSession().selectList(namespace+".boardview");
	}

	public List<testVO2> boardviewOne(testVO2 test) {
	
	return getSqlSession().selectList(namespace+".boardviewOne", test);
}
	public int insac(testVO3 test) {

		return getSqlSession().insert(namespace+".insac", test); 
	}

	public List<testVO4> spsal(testVO4 test) {
		
	return getSqlSession().selectList(namespace+".spsal");
}
	
	public List<testVO4> spsalOne(testVO4 test) {
		
	return getSqlSession().selectList(namespace+".spsalOne",test);
}
	public int insspsal(testVO4 test) {

		return getSqlSession().insert(namespace+".insspsal", test); 
	}
	
	public int totalsp(testVO4 test) {

		return getSqlSession().selectOne(namespace+".totalsp", test); 
	}
		
	public int isMM(testVO test2) {

		return getSqlSession().selectOne(namespace+".isMM", test2); 
	}
	
	public int spdelete(testVO4 test) {

		return getSqlSession().delete(namespace+".spdelete", test); 
	}
	
	public int spupdate(testVO4 test) {

		return getSqlSession().delete(namespace+".spupdate", test); 
	}
	
	public int spfalse(testVO4 test) {

		return getSqlSession().delete(namespace+".spfalse", test); 
	}

	public List<testVO5> nationList(testVO5 test) {
		
		return getSqlSession().selectList(namespace+".nationList",test);
	}
	
	public int insnation(testVO5 test) {

		return getSqlSession().delete(namespace+".insnation", test); 
	}

}
