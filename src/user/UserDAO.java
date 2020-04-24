// �����ͺ��̽� ���� Ŭ����(�����͸� �������ų� �����͸� ����)
package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection conn; //connection: DB�������ϰ� ���ִ� ��ü
	private PreparedStatement pstmt; // prepared statement: ������ sql������ db�� �����ϴ� �������� �ν��Ͻ��� �����´�
	private ResultSet rs; //ResultSet: DB data�� ���� �� �ִ� ��ü
	//DB�� ���� �����ϰ� ���ش�
	public UserDAO() { // ������ ����ɶ����� �ڵ����� DB������ �̷�� �� �� �ֵ��� �Ѵ�
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
	
	public int login(String userID, String userPassword) { //�α��� �Լ�
		
      String SQL = "SELECT userPassword FROM USER WHERE userID = ?"; //user���̺��� �����͸� �������� ������
      try {
    	  pstmt = conn.prepareStatement(SQL); // DB�� �����ؼ� sql���� �����Ѵ�
    	  pstmt.setString(1, userID); // ù��° �ε����� �Ķ���� ��(�������� ?)�� userID�� �����Ѵ�.
    	  rs = pstmt.executeQuery(); // rs�� ����� ����
    	  
    	  if (rs.next()) {
    		  if(rs.getString(1).equals(userPassword)) {
    			  return 1; // �α��� ����
    		  }
    		  else
    			  return 0; // ��й�ȣ ����ġ
    	  }
    	  return -1; // ���̵� ����
    	  
      } catch (Exception e) {
    	  e.printStackTrace();
      }
      return -2; //�����ͺ��̽� ����
	}
	
	public int join(User user) {
		
	 String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?)"; //DB�� ������ �Է�
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
	return -1; // �����ͺ��̽� ����
	}
	
}
