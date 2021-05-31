package com.gogi.proj.dy.vo;

import java.sql.Timestamp;

public class testVO {

	private String testname;
	private String testpw;
	private String testbd;
	private String testct;
	
	private String tbname;
	private String tbtitle;
	private String tbcomment;
	private String tbct;
	private String tbregdate;

	
	public testVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public testVO(String testname,String testpw,String testbd,String testct,String tbname,String tbtitle,String tbcomment,String tbct,String tbregdate) {
		super();
		this.testname = testname;
		this.testpw = testpw;
		this.testbd = testbd;
		this.testct = testct;
		this.tbname = tbname;
		this.tbtitle = tbtitle;
		this.tbcomment = tbcomment;
		this.tbct = tbct;
		this.tbregdate = tbregdate;
	}
	
	public String getTbname() {
		return tbname;
	}

	public void setTbname(String tbname) {
		this.tbname = tbname;
	}

	public String getTbtitle() {
		return tbtitle;
	}

	public void setTbtitle(String tbtitle) {
		this.tbtitle = tbtitle;
	}

	public String getTbcomment() {
		return tbcomment;
	}

	public void setTbcomment(String tbcomment) {
		this.tbcomment = tbcomment;
	}

	public String getTbct() {
		return tbct;
	}

	public void setTbct(String tbct) {
		this.tbct = tbct;
	}

	public String getTbregdate() {
		return tbregdate;
	}

	public void setTbregdate(String tbregdate) {
		this.tbregdate = tbregdate;
	}
	
	
	public String gettestname() {
		return testname;
	}

	public void settestname(String testname) {
		this.testname = testname;
	}

	public String gettestpw() {
		return testpw;
	}

	public void settestpw(String testpw) {
		this.testpw = testpw;
	}

	public String gettestbd() {
		return testbd;
	}

	public void settestbd(String testbd) {
		this.testbd = testbd;
	}

	public String gettestct() {
		return testct;
	}

	public void settestct(String testct) {
		this.testct = testct;
	}

	@Override
	public String toString() {
		return "testVO [testname=" + testname + ", testpw=" + testpw + ", testbd=" + testbd + ", testct=" + testct
				+ ", tbname=" + tbname + ", tbtitle=" + tbtitle + ", tbcomment=" + tbcomment + ", tbct=" + tbct
				+ ", tbregdate=" + tbregdate + "]";
	}

	
}

