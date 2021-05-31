package com.gogi.proj.dy.vo;

import java.sql.Timestamp;

public class testVO3 {

	private String acname;
	private String actype;
	private String acsysdate;
	
	public testVO3() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public testVO3(String acname) {
		super();
		this.acname= acname;
		
	}

	public String getActype() {
		return actype;
	}

	public void setActype(String actype) {
		this.actype = actype;
	}

	public String getAcsysdate() {
		return acsysdate;
	}

	public void setAcsysdate(String acsysdate) {
		this.acsysdate = acsysdate;
	}

	public String getAcname() {
		return acname;
	}

	public void setAcname(String acname) {
		this.acname = acname;
	}

	@Override
	public String toString() {
		return "testVO3 [acname=" + acname + ", actype=" + actype + ", acsysdate=" + acsysdate + "]";
	}
		
}

