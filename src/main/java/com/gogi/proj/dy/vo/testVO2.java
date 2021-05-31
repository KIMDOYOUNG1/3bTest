package com.gogi.proj.dy.vo;

import java.sql.Timestamp;

public class testVO2 {

	private String tbnumber;
	private String tbname;
	private String tbtitle;
	private String tbcomment;
	private String tbct;
	private String tbregdate;

	
	public testVO2() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public testVO2(String tbnumber, String tbname,String tbtitle,String tbcomment,String tbct,String tbregdate) {
		super();
		this.tbnumber = tbnumber;
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

	public String getTbnumber() {
		return tbnumber;
	}

	public void setTbnumber(String tbnumber) {
		this.tbnumber = tbnumber;
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

	@Override
	public String toString() {
		return "testVO2 [tbnumber=" + tbnumber + ", tbname=" + tbname + ", tbtitle=" + tbtitle + ", tbcomment="
				+ tbcomment + ", tbct=" + tbct + ", tbregdate=" + tbregdate + "]";
	}
	
	
}

