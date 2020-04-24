<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="user" class="user.User" scope="page" /> <!-- 한명의 회원정보를 담는 user클래스를 자바 빈즈로 사용 / scope:현재의 페이지에서만 사용-->
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
   <% 
     String userID = null;
     if(session.getAttribute("userID") != null){
    	 userID = (String) session.getAttribute("userID");
     } // 섹션값이 null값이 아니면(이미 로그인된 아이디면) userID에 세션값을 부여 = 로그인 된 사람은 회원가입페이지에 들어갈 수 없다
     if(userID != null){ //로그인 중복 방지
    	 PrintWriter script = response.getWriter();
    	 script.println("<script>");
    	 script.println("alert('이미 로그인이 되어있습니다')");
    	 script.println("location.href = 'main.jsp'");
    	 script.println("</script>");
     }
   
     UserDAO userDAO = new UserDAO();
     int result = userDAO.login(user.getUserID(), user.getUserPassword());
     if (result == 1) {
    	 session.setAttribute("userID", user.getUserID()); //섹션 부여. 세션값으로 getUserID, 해당회원의 아이디값을 준다.
    	 PrintWriter script = response.getWriter(); //하나의 스크립트 문장을 넣는다
    	 script.println("<script>");
    	 script.println("location.href = 'main.jsp'");
    	 script.println("</script>");
     }
     else if (result == 0) {
    	 PrintWriter script = response.getWriter();
    	 script.println("<script>");
    	 script.println("alert('비밀번호가 틀립니다.')");
    	 script.println("history.back()"); //이전 페이지로 사용자를 이동
    	 script.println("</script>");
     }
     else if (result == -1) {
    	 PrintWriter script = response.getWriter();
    	 script.println("<script>");
    	 script.println("alert('존재하지 않는 아이디입니다.')");
    	 script.println("history.back()");
    	 script.println("</script>");
     }
     else if (result == -2) {
    	 PrintWriter script = response.getWriter();
    	 script.println("<script>");
    	 script.println("alert('데이터베이스 오류가 발생했습니다.')");
    	 script.println("history.back()");
    	 script.println("</script>");
     }
   %>
</body>
</html>