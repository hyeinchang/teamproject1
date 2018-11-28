package com.spring.client.member.vo;

import java.sql.Timestamp;

import com.spring.client.login.vo.LoginVO;

public class MemberVO extends LoginVO {
	private String oldUserPw;
	private String pinno;
	private String email;
	private String phone;
	private Timestamp joinDate;
	
	
	@Override
	public String getUserId() {
		// TODO Auto-generated method stub
		return super.getUserId();
	}
	@Override
	public void setUserId(String userId) {
		// TODO Auto-generated method stub
		super.setUserId(userId);
	}
	@Override
	public String getUserPw() {
		// TODO Auto-generated method stub
		return super.getUserPw();
	}
	@Override
	public void setUserPw(String userPw) {
		// TODO Auto-generated method stub
		super.setUserPw(userPw);
	}
	@Override
	public String getUserName() {
		// TODO Auto-generated method stub
		return super.getUserName();
	}
	@Override
	public void setUserName(String userName) {
		// TODO Auto-generated method stub
		super.setUserName(userName);
	}
	@Override
	public String toString() {
		return "MemberVO [oldUserPw=" + oldUserPw + ", pinno=" + pinno + ", email=" + email + ", phone=" + phone
				+ ", joinDate=" + joinDate + ", getUserId()=" + getUserId() + ", getUserPw()=" + getUserPw()
				+ ", getUserName()=" + getUserName() + ", getIdx()=" + getIdx() + ", getRetry()=" + getRetry()
				+ ", getLastFailedLogin()=" + getLastFailedLogin() + ", getLastSuccessedLogin()="
				+ getLastSuccessedLogin() + ", getClientIP()=" + getClientIP() + ", toString()=" + super.toString()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}
	@Override
	public int getIdx() {
		// TODO Auto-generated method stub
		return super.getIdx();
	}
	@Override
	public void setIdx(int idx) {
		// TODO Auto-generated method stub
		super.setIdx(idx);
	}
	@Override
	public int getRetry() {
		// TODO Auto-generated method stub
		return super.getRetry();
	}
	@Override
	public void setRetry(int retry) {
		// TODO Auto-generated method stub
		super.setRetry(retry);
	}
	@Override
	public long getLastFailedLogin() {
		// TODO Auto-generated method stub
		return super.getLastFailedLogin();
	}
	@Override
	public void setLastFailedLogin(long lastFailedLogin) {
		// TODO Auto-generated method stub
		super.setLastFailedLogin(lastFailedLogin);
	}
	@Override
	public long getLastSuccessedLogin() {
		// TODO Auto-generated method stub
		return super.getLastSuccessedLogin();
	}
	@Override
	public void setLastSuccessedLogin(long lastSuccessedLogin) {
		// TODO Auto-generated method stub
		super.setLastSuccessedLogin(lastSuccessedLogin);
	}
	@Override
	public String getClientIP() {
		// TODO Auto-generated method stub
		return super.getClientIP();
	}
	@Override
	public void setClientIP(String clientIP) {
		// TODO Auto-generated method stub
		super.setClientIP(clientIP);
	}
	public String getOldUserPw() {
		return oldUserPw;
	}
	public void setOldUserPw(String oldUserPw) {
		this.oldUserPw = oldUserPw;
	}
	public String getPinno() {
		return pinno;
	}
	public void setPinno(String pinno) {
		this.pinno = pinno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Timestamp getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Timestamp joinDate) {
		this.joinDate = joinDate;
	}
}
