// 데이터베이스 접근 클래스(데이터를 가져오거나 데이터를 삽입)
package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection conn; //connection: DB에접근하게 해주는 객체
	private PreparedStatement pstmt; // prepared statement: 정해진 sql문장을 db에 삽입하는 형식으로 인스턴스를 가져온다
	private ResultSet rs; //ResultSet: DB data를 담을 수 있는 객체
	//DB에 접속 가능하게 해준다
	public UserDAO() { // 생성자 실행될때마다 자동으로 DB연결이 이루어 질 수 있도록 한다
		try {
			String dbURL = "jdbc:mysql://localhost:3306/gun5752?characterEncoding=UTF-8&serverTimezone=UTC"; 
			String dbID = "gun5752";
			String dbPassword = "Gun1863123";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) { //로그인 함수
		
      String SQL = "SELECT userPassword FROM USER WHERE userID = ?"; //user테이블에서 데이터를 가져오는 쿼리문
      try {
    	  pstmt = conn.prepareStatement(SQL); // DB에 접근해서 sql문을 삽입한다
    	  pstmt.setString(1, userID); // 첫번째 인덱스의 파라미터 값(쿼리문의 ?)을 userID로 지정한다.
    	  rs = pstmt.executeQuery(); // rs에 결과값 보관
    	  
    	  if (rs.next()) {
    		  if(rs.getString(1).equals(userPassword)) {
    			  return 1; // 로그인 성공
    		  }
    		  else
    			  return 0; // 비밀번호 불일치
    	  }
    	  return -1; // 아이디가 없다
    	  
      } catch (Exception e) {
    	  e.printStackTrace();
      }
      return -2; //데이터베이스 오류
	}
	
	public int join(User user) {
		
	 String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?)"; //DB에 데이터 입력
	try {
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, user.getUserID());
		pstmt.setString(2, user.getUserPassword());
		pstmt.setString(3, user.getUserName());
		pstmt.setString(4, user.getUserGender());
		pstmt.setString(5, user.getUserEmail());
		return pstmt.executeUpdate();
	} catch(Exception e) {
		e.printStackTrace();
	}
	return -1; // 데이터베이스 오류
	}
	
}
