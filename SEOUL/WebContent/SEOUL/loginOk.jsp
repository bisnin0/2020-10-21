<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement"%> 
<%@ page import="java.sql.ResultSet"%>
<%!
	public Connection getConnection(){
		Connection conn=null;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@192.168.0.214:1521:xe";
			conn = DriverManager.getConnection(url, "scott", "tiger");
		}catch(Exception e){
			System.out.println("BD연결에러 --->" + e.getMessage());
		}
		return conn;
	}
%>

<%
	String userid = request.getParameter("userid");
	String userpwd = request.getParameter("userpwd");

	Connection conn = getConnection(); 
	
	String sql = "select userid, username from register where userid=? and userpwd=?"; //게시판 만들기용 sql
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, userid);
	pstmt.setString(2, userpwd);
	
	ResultSet rs = pstmt.executeQuery();
	if(!rs.next()){
	
%>
		<script>
			alert("로그인 실패하였습니다. 다시 시도 하세요.");
			//location.href="<%=request.getContextPath()%>/index.jsp";
			history.back(); 
			
		</script>


<%
	}else{
		 session.setAttribute("logStatus","Y");
	 	 session.setAttribute("userid", rs.getString(1)); 
	 	 session.setAttribute("username", rs.getString(2));
%>
		<script>
		
			alert("로그인 성공하였습니다. \n홈페이지로 이동합니다.");
			location.href="<%=request.getContextPath()%>/index.jsp";
		</script>
<%
	}
%>