package com.bitcamp.dbconn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBConnection {
	//1. 드라이브로딩
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
		}catch(Exception e) {
			System.out.println("드라이브 로딩 에러 발생.."+e.getMessage());
		}
		
	}
	protected Connection conn = null;
	protected PreparedStatement pstmt = null;
	protected ResultSet rs= null;
	
	String url = "jdbc:oracle:thin:@192.168.0.214:1521:xe";
	String userid = "scott";
	String userpwd = "tiger";
	
			
	//2. DB연결
	public void getConn() {
		try {
			conn = DriverManager.getConnection(url,userid,userpwd);
		}catch(Exception e) {
			System.out.println("DB연결에러 발생.."+e.getMessage());
		}
	}
	//3. DB연결 끊기
	public void getClose() {
		try {
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		}catch(Exception e) {
			System.out.println("DB연결 종료 에러 발생.."+e.getMessage());
		}
	}
	
	//4. pstmt 만들기
	public void getPstmt(String sql) {
		try {
		pstmt = conn.prepareStatement(sql);
		}catch(Exception e) {
			System.out.println("Pstmt생성 에러"+e.getMessage());
		}
	}
}
