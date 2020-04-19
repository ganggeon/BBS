# JSP 게시판 프로젝트
- **수행기간**  
2020.02 ~ 2020.03   
- **기여도**  
100%   
- **개발목표**  
회원가입, 글쓰기, 글수정, 글삭제 기능이 있는 게시판 개발   
- **개발환경**   
JDK, Eclipse, tomcat, MySQL   
- **사용기술**   
Front : HTML, CSS, JavaScript   
Back : Java, Jsp   
 
# ERD
![erd](/readmeImages/erd.JPG)   

# 구현기능   
#### 메인    
![main](/readmeImages/bbs메인.jpg)   
프론트엔드 웹개발은 부트스트랩을 사용   
부트스트랩은 html5기반으로 css와 javascript을 만들어놓은 프레임워크로 기본적인 레이아웃과 다양한 형태의 엘리먼트를 제공해 쉽게 반응형 웹을 개발할 수 있게 도와준다   

#### 글 목록   
![bbs](/readmeImages/bbs게시판.jpg)   
글 번호(bbsID)가 10개 이상이면 다음 페이지로 넘어가는 페이징 처리 구현   
크로스 사이트 스크립팅 방어 구현   
본인 아이디가 아니면 글수정,삭제 불가   

#### 회원가입    
![join](/readmeImages/bbs회원가입.jpg)   
사용자에게 입력받은 정보를 DB의 user table에 저장한다   
보안을 위해 정보를 POST방식으로 전송한다   

#### 로그인    
![login](/readmeImages/bbs로그인.jpg)   
입력한 정보와 DB의 user table에 저장된 정보를 비교하여 아이디가 존재하지 않거나 비밀번호가 틀릴시 접속불가    
