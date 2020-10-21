package com.bitcamp.home.register;

import java.util.ArrayList;
import java.util.List;

import com.bitcamp.home.DBConnection;

public class RegisterDAO extends DBConnection implements RegisterInterface {

	@Override
	public RegisterVO loginCheck(RegisterVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int registerInsert(RegisterVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void registerSelect(RegisterVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public int idSearch(String userid) {
		int cnt = 0;
		try {
			getConn();
			String sql = "select count(userid) from register where userid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		}catch(Exception e) {
			System.out.println("아이디 중복검사 에러발생."+e.getMessage());
		}finally {
			getClose();
		}
		return cnt;
	}

	//우편번호 검색
	public List<ZipcodeVO> getZipcodeList(String doro) {
		List<ZipcodeVO> list = new ArrayList<ZipcodeVO>();
		try {
			getConn();
			String sql = "select zipcode, sido, sigungu, um, doro, b_num1, b_num2, building, dong "
					+ " from zipcodetbl where doro like ?";
			//					 					'%백범로%'
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+doro+"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ZipcodeVO vo = new ZipcodeVO();
				vo.setZipcode(rs.getString(1));
				vo.setSido(rs.getString(2));
				vo.setSigungu(rs.getString(3));
				vo.setUm(rs.getString(4));
				vo.setDoro(rs.getString(5));
				vo.setB_num1(rs.getInt(6));
				vo.setB_num2(rs.getInt(7));
				vo.setBuilding(rs.getString(8));
				vo.setDong(rs.getString(9));
				list.add(vo);
			}
		}catch(Exception e) {
			System.out.println("우편번호 검색 에러..(Ajax)..."+e.getMessage());
		}finally {
			getClose();
		}
		return list;
	}
	
}
