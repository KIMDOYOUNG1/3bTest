package com.gogi.proj.dy.vo;

import java.sql.Timestamp;

public class testVO5 {

	private String ntCode;
	private String ntName;
	
	
	public testVO5() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public testVO5(String ntCode, String ntName) {
		super();

		
	}

	public String getNtCode() {
		return ntCode;
	}

	public void setNtCode(String ntCode) {
		this.ntCode = ntCode;
	}

	public String getNtName() {
		return ntName;
	}

	public void setNtName(String ntName) {
		this.ntName = ntName;
	}

	@Override
	public String toString() {
		return "testVO5 [ntCode=" + ntCode + ", ntName=" + ntName + "]";
	}
	
		
}

