package com.gogi.proj.dy.vo;

import java.sql.Timestamp;

public class testVO4 {

	private String spName;
	private int spSal;
	private String spAge;
	private String spName2;
	private String spNation;

	
	public testVO4() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public testVO4(String spName, int spSal, String spNation, String spAge,String spName2) {
		super();
		this.spName = spName;
		this.spSal = spSal;
		this.spNation = spNation;
		this.spAge = spAge;
		this.spName2 = spName2;
	}
	
	public String getSpNation() {
		return spNation;
	}

	public void setSpNation(String spNation) {
		this.spNation = spNation;
	}

	public String getSpAge() {
		return spAge;
	}

	public void setSpAge(String spAge) {
		this.spAge = spAge;
	}

	public String getSpName() {
		return spName;
	}

	public void setSpName(String spName) {
		this.spName = spName;
	}

	public int getSpSal() {
		return spSal;
	}

	public void setSpSal(int spSal) {
		this.spSal = spSal;
	}

	public String getSpName2() {
		return spName2;
	}

	public void setSpName2(String spName2) {
		this.spName2 = spName2;
	}

	@Override
	public String toString() {
		return "testVO4 [spName=" + spName + ", spSal=" + spSal + ", spNation=" + spNation + ", spAge=" + spAge
				+ ", spName2=" + spName2 + "]";
	}


	

}

