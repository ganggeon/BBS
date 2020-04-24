<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
   <% 
     if (user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null 
     || user.getUserGender() == null || user.getUserEmail() == null){
    	 PrintWriter script = response.getWriter(); //하나의 스크립트 문장을 넣을 수 있도록한다
    	 script.println("<script>");
    	 script.println("alert('입력이 안 된 사항이 있습니다. 다시 입력하여 주십시오')");
    	 script.println("history.back()");
    	 script.println("</script>");
     } else {
         UserDAO userDAO = new UserDAO();
         int result = userDAO.join(user); //아이디 중복 여부 확인
         if (result == -1) {
        	 PrintWriter script = response.getWriter();
        	 script.println("<script>");
        	 script.println("alert('이미 존재하는 아이디입니다.')");
        	 script.println("</script>");
         }
         else if (result == 1) {
        	 session.setAttribute("userID", user.getUserID());
        	 PrintWriter script = response.getWriter();
        	 script.println("<script>");
        	 script.println("location.href = 'main.jsp'");
        	 script.println("</script>");
         }
     }
   %>
</body>
</html>