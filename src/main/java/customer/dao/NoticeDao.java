package customer.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import customer.vo.Notice;

public class NoticeDao {
	public Notice getOneNotice(String seq) throws ClassNotFoundException, SQLException {
		Notice tmp = new Notice();
		String sql = null;

		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String pw = "123456";

		Connection con = DriverManager.getConnection(url, user, pw);
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		sql = "select * from notices where seq = ?";

		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, seq);

		rs = pstmt.executeQuery();

		rs.next();

		tmp.setSeq(rs.getString("seq"));
		tmp.setTitle(rs.getString("title"));
		tmp.setWriter(rs.getString("writer"));
		tmp.setContent(rs.getString("content"));
		tmp.setRegdate(rs.getDate("regdate"));
		tmp.setHit(rs.getInt("hit"));
		
		System.out.println("title: "+tmp.getTitle());
		System.out.println("content: "+tmp.getContent());

		return tmp;
	}

	public void delete(String seq) throws ClassNotFoundException, SQLException {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String pw = "123456";

		Connection con = DriverManager.getConnection(url, user, pw);
		PreparedStatement pstmt = null;

		String sql = "delete from notices where seq = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, seq);
		System.out.println("개수: " + pstmt.executeUpdate());
	}

	public void update(Notice n) throws ClassNotFoundException, SQLException {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String pw = "123456";

		Connection con = DriverManager.getConnection(url, user, pw);
		PreparedStatement pstmt = null;

		String sql = "update notices set title = ?, content = ? where seq = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, n.getTitle());
		pstmt.setString(2, n.getContent());
		pstmt.setString(3, n.getSeq());

		System.out.println("udpate횟수: " + pstmt.executeUpdate());
	}
}