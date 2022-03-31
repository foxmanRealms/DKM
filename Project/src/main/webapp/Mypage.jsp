<%@page import="Model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="is-preload">
   <style>
   		.row {
			margin-top: 0;
			margin-left: 15em;
		}
		</style>
   <%
      UserDTO udto = (UserDTO)session.getAttribute("udto");
   %>

   <div id="page-wrapper">

      <!-- Header -->
      <header id="header">
         <h1>
            <a href="Index.jsp">복순이&nbsp;&nbsp;</a>by dr.boksun
         </h1>
         <nav id="nav">
            <ul>
               <li><a href="Index.jsp">홈</a></li>
               <li><a href="select_handi.jsp">정보 등록 및 조회&nbsp;&nbsp;&nbsp;<i
                     class='icon solid fa fa-angle-down'></i>
               </a>
                  <ul>
                     <li><a href="reg_handi.jsp">회원 정보 등록</a></li>
                     <li><a href="reg_box.jsp">보관함 등록 및 조회</a></li>
                  </ul></li>
               <li class='sub-menu'><a href="communityMain.jsp">커뮤니티&nbsp;&nbsp;&nbsp;<i
                     class='fa fa-angle-down'></i></a>
                  <ul>
                     <li><a href="qnaMain.jsp">문의하기</a></li>
                     <li><a href="storyMain.jsp">정보 공유</a></li>
                  </ul></li>
               <li class='sub-menu'><a href="#">마이페이지&nbsp;&nbsp;&nbsp;<i
                     class='fa fa-angle-down'></i></a>
                  <ul>
                     <li><a href="edit_info.jsp">내 정보 수정</a></li>
                     
                     <% if(udto != null){ %>
                        <li><a href="edit_pw_next.jsp?user_id=<%= udto.getUser_id()%>">비밀번호 재설정</a></li>
                     <%} else{ %>
                        <li><a href="edit_pw.jsp">비밀번호 변경</a></li>
                     <%} %>
                     <li><a href="select_user0.jsp">담당 복지사 조회</a></li>
                     <li><a href="select_user1.jsp">보호자 조회</a></li>
                  </ul></li>

               <% if(udto != null){ %>
                  <li><a href="LogoutServiceCon.do" class="button">로그아웃</a></li>
               <%} else{%>
                  <li><a href="Login.jsp" class="button">로그인</a></li>
               <%} %>

            </ul>
         </nav>
      </header>



      <!-- Main -->
      <section id="main" class="container">
         <header>
            <h2>마이 페이지</h2>
            <p>개인정보를 수정할 수 있습니다.</p>
         </header>
         <div class="box">
            <span class="image featured"><img src="images/pic01.jpg"
               alt="" /></span>
            <h3></h3>
            <p></p>
            <div class="row">
               <div class="row-6 row-12-mobilep">
                  
<!--     내용 시작
   <table align="center">
            <thead>
            <h3>내 정보</h3>
            </thead>
            
            <tbody>
           
            <tr>
            	<td>아이디</td>
            	<td>siyoon2</td>
            </tr>
            
            <tr>
            	<td>새 비밀번호</td>
            	<td><input type="password" name="pw"></td>
            </tr>
            
            <tr>
            	<td>새 비밀번호 확인</td>
            	<td><input type="password" name="pw_check"></td>
            </tr>
            
            <tr>
            	<td>회사명</td>
            	<td>스마트인재개발원</td>
            </tr>
            
            <tr>
            	<td>회사 연락처</td>
            	<td>062-355-5298</td>
            </tr>
            
            <tr>
            	<td>면허번호</td>
            	<td>3609798</td>
            </tr>
            
            <tr>
            	<td>이름</td>
            	<td>김시윤</td>
            </tr>
            
            <tr>
            	<td>생년월일</td>
            	<td>1994-09-04</td>
            </tr>
            
           <tr>
			<td>성별</td>
				<td>
					<div class="col-4 col-12-narrower" >
						<input type="radio" id="user_gender0" name="user_gender" value="male" checked>
						<label for="user_gender0">남자</label>
						<input type="radio" id="user_gender1" name="user_gender" value="female">
						<label for="user_gender1">여자</label>
					</div>
				</td>		
			</tr>
            
            <tr>
            	<td>연락처</td>
            	<td>010-1234-5678</td>
            </tr>
            
            
            <tr>
            	<td>지역</td>
            	<td>광주광역시 서구</td>
            </tr>
            
            <tr>
            	<td>가입일자</td>
            	<td>2022-03-29</td>
            </tr>
            
			<tr height="50"></tr>
			            
            <tr>
               <td> 
                <input type="checkbox" name="" value="">
               </td>
            </tr>
            
            <tr>
               <td style="left:150px;position:relative;"> 
               		<input type="submit" value="정보수정">
               </td>
            </tr>
               </tbody>
   </div>

   </section>
-->
<!-- Main 끝-->

<!-- 풋터 자리 였던곳 -->

   </div>

   <!-- Scripts -->
   <script src="assets/js/jquery.min.js"></script>
   <script src="assets/js/jquery.dropotron.min.js"></script>
   <script src="assets/js/jquery.scrollex.min.js"></script>
   <script src="assets/js/browser.min.js"></script>
   <script src="assets/js/breakpoints.min.js"></script>
   <script src="assets/js/util.js"></script>
   <script src="assets/js/main.js"></script>

</body>
</html>