package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CommDAO {
	
	// �������� ����
	PreparedStatement psmt = null;
	Connection conn = null;
	ResultSet rs = null;
	int cnt = 0;
	String sql = null;
	
	// DB ���� �޼ҵ�
	public void dbConn() {
		try {
			// 1. DB����(ojdbc6.jar �־��ֱ�)
			// 1-1. Classã�� : DB�� ��Ŭ������ �������ִ� Class
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 1-2. DB�� �����ϱ� ���� �ּ�, ���̵�, �н����� ����
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String db_id = "hr";
			String db_pw = "hr";
			
			// 1-3. Connection ��ü ����ؼ� DB����!
			conn = DriverManager.getConnection(url, db_id, db_pw);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
		
	// DB close �޼ҵ�
	public void dbClose() {
		try {
			if(rs != null) rs.close();
			if(psmt != null) psmt.close();
			if(conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	// ��� �ۼ� �޼ҵ� 
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
	
	// �� ��� �� ��ȸ �޼ҵ�
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
