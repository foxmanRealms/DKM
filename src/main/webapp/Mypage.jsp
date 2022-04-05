<%@page import="Model.StoryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.StoryDAO"%>
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

   <%
   		// 회원
      	UserDTO udto = (UserDTO)session.getAttribute("udto");
   		String user_id = udto.getUser_id();
   		
   		// 정보 공유
   		ArrayList<StoryDTO> mystories = new StoryDAO().myBoardAll(user_id);
   		
   		// 문의하기 
   		
   		// 문의하기 답변
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
               <li class='sub-menu'><a href="Mypage.jsp">마이페이지&nbsp;&nbsp;&nbsp;<i
                     class='fa fa-angle-down'></i></a>
                  <ul>
                     <li><a href="update_info.jsp">내 정보 수정</a></li>
                     
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
      <section id="main" class="container" >
         <header>
            <h2>마이 페이지</h2>
            <p>내 정보 관리</p>
         </header>
         <div class="box">
            
            
            <h4>내가 쓴 게시글</h4>
            <% if(!mystories.isEmpty()){ %>
            	<ul>
            	<% for (StoryDTO st : mystories){ %>
            		<li><a href="storySelect.jsp?story_seq=<%= st.getStory_seq() %>"><%= st.getStory_title() %></a></li>
            	<%} %>
            <%} else {%>
            		<li>게시물이 없습니다.</li>
            <%} %>
            	</ul>
            
            
            <!-- 답변 달렸을 경우, -->
            <h4>문의글 답변 확인하기</h4>
            	<ul>
            		<li></li>
            		<li></li>
            		<li></li>
            	</ul>

			
			<!-- 회원 정보 수정 : 페이지 이동-->
            <h4><input type="button" class="button alt" value="내 정보 수정" onclick="updateInfo()"></h4>
               


   </div>


   <!-- Scripts -->
   
   <script type="text/javascript">

   <!-- 회원 정보 수정 페이지 이동 -->
   	function updateInfo() {
   		location.href="update_info.jsp?user_id=<%= udto.getUser_id() %>";
   	};
   	
   	document.addEventListener("DOMContentLoaded", function() {
   		let succ = <%= request.getParameter("status") %>
   		if(succ == 1){
   			alert("회원 정보가 수정되었습니다.")
   		}
   	});

   
   </script>
   
   <script src="assets/js/jquery.min.js"></script>
   <script src="assets/js/jquery.dropotron.min.js"></script>
   <script src="assets/js/jquery.scrollex.min.js"></script>
   <script src="assets/js/browser.min.js"></script>
   <script src="assets/js/breakpoints.min.js"></script>
   <script src="assets/js/util.js"></script>
   <script src="assets/js/main.js"></script>

</body>
</html>