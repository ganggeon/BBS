<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />
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
     } // 섹션값이 null값이 아니면(이미 로그인된 아이디면) userID에 세션값을 부여 
     if(userID == null){ 
    	 PrintWriter script = response.getWriter();
    	 script.println("<script>");
    	 script.println("alert('로그인을 하세요')");
    	 script.println("location.href = 'login.jsp'");
    	 script.println("</script>");
     }
     else {
     if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null){
    	PrintWriter script = response.getWriter();
    	script.println("<script>");
    	script.println("alert('입력이 안 된 사항이 있습니다. 다시 입력하여 주십시오')");
    	script.println("history.back()");
    	script.println("</script>");
    	} else {
    	BbsDAO bbsDAO = new BbsDAO();
    	int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
    	if (result == -1) {
    	PrintWriter script = response.getWriter();
    	script.println("<script>");
    	script.println("alert('글쓰기에 실패했습니다.')");
    	script.println("</script>");
    	}
    	else{
    	PrintWriter script = response.getWriter();
    	script.println("<script>");
    	script.println("location.href = 'bbs.jsp'");
    	script.println("</script>");
    		  }
    	}     	 
     }
   %>
</body>
</html>