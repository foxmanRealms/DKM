package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CommDAO {
	
	// 전역변수 선언
	PreparedStatement psmt = null;
	Connection conn = null;
	ResultSet rs = null;
	int cnt = 0;
	String sql = null;
	
	// DB 연결 메소드
	public void dbConn() {
		try {
			// 1. DB연결(ojdbc6.jar 넣어주기)
			// 1-1. Class찾기 : DB와 이클립스를 연결해주는 Class
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 1-2. DB에 접속하기 위한 주소, 아이디, 패스워드 지정
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String db_id = "hr";
			String db_pw = "hr";
			
			// 1-3. Connection 객체 사용해서 DB연결!
			conn = DriverManager.getConnection(url, db_id, db_pw);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
		
	// DB close 메소드
	public void dbClose() {
		try {
			if(rs != null) rs.close();
			if(psmt != null) psmt.close();
			if(conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	// 댓글 작성 메소드 
	public int insertComm() {
		dbConn();
		try {
			sql = "insert into";
			psmt = conn.prepareStatement(sql);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} return cnt;
	}
	
	// 총 댓글 수 조회 메소드
	public int totalComm() {
		dbConn();
		try {
			sql = "select count(*) from t_comment";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} return cnt;
	}

}
