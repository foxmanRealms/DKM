<%@page import="Model.QnaReplyDAO"%>
<%@page import="Model.QnaReplyDTO"%>
<%@page import="Model.QnaDAO"%>
<%@page import="Model.QnaDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>문의하기 글조회</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<script src="assets/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/style.css" />
</head>
<body class="is-preload">
	
	<%
		// 회원 
		UserDTO udto = (UserDTO)session.getAttribute("udto");
		String uid = udto.getUser_id();
	
		// 문의글
		int qna_seq = Integer.parseInt(request.getParameter("qna_seq"));
		QnaDTO qdto = new QnaDAO().selectQnaOne(qna_seq); 
		
		// 문의 답변 리스트
		ArrayList<QnaReplyDTO> qRelist = new QnaReplyDAO().selectQnaReply(qna_seq);
		
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
					<li class='sub-menu'><a href="#">커뮤니티&nbsp;&nbsp;&nbsp;<i
							class='fa fa-angle-down'></i></a>
						<ul>
							<li><a href="qnaMain.jsp">문의하기</a></li>
							<li><a href="storyMain.jsp">정보 공유</a></li>
						</ul></li>
					<li class='sub-menu'><a href="Mypage.jsp">마이페이지&nbsp;&nbsp;&nbsp;<i
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
				<h2>커뮤니티</h2>
				<p>Q & A</p>
			</header>
			
			<div class="box">
				<blockquote><h3>문의하기</h3></blockquote>
			
				<!-- 문의글 제목 -->
				<div class="col-12">
				<% if(qdto.getQna_title().contains("secret")){ %>
					<h3><%= qdto.getQna_title().substring(6) %></h3>
				<%} else{ %>
					<h3><%= qdto.getQna_title() %></h3>
				<%} %>
				
					<div>
						작성자 <%= qdto.getQna_id() %><br>
						작성일 <%= qdto.getQna_joindate().substring(0,16) %><br>
						조회  <%= qdto.getQna_cnt() %>
						<hr/>
					</div>
					
					<!-- 문의글 내용 -->
					<div class="col-12">
						<img src="fileQna/<%= qdto.getQna_file() %>" width="300">
						<span><%= qdto.getQna_content() %></span>
						<hr/>
					</div>


					<!-- 문의글 답변 조회 -->
					<form action="DeleteQnaReplyServiceCon.do" method="post">
					<% if(!qRelist.isEmpty()){ %>
						<% for(QnaReplyDTO qRe : qRelist){ %>
						<div>
							<span>답변자 : 관리자</span><br>
							<span>제목 : <%= qRe.getRep_title() %></span><br>
							<span>답변일 : <%= qRe.getRep_joindate() %></span><br>
							<span><%= qRe.getRep_content() %></span><br>
							<input type="submit" value="삭제" class="button alt small" style="margin-bottom:20px;"/>
							
							<span>
							<input type="hidden" name="rep_seq" value="<%= qRe.getRep_seq()%>"/>
							<input type="hidden" name="qna_seq" value="<%= qRe.getQna_seq()%>"/>
							</span>
						</div>
						<%} %>
					<%} else {%>
						<div class="reply">
						<span>아직 관리자의 답변이 달리지 않았습니다.</span>
						</div>
					<%} %>
					</form>
	
	 				<!-- 문의글 답변 작성 :
	 					 로그인한 아이디가 admin일 경우(관리자), 답변 창 보이도록 제어 -->
	 				<div class="comm-div">
	 					<% if(uid.equals("admin")) {%>
	 						<form action="WriteQnaReplyServiceCon.do" method="post">
	 							<h4>&nbsp;&nbsp;<%= udto.getUser_name() %></h4>
	 							<input type="text" name="rep_title" class="rep_title" placeholder="제목">
								<textarea name="rep_content" cols="8" rows="4" placeholder="관리자 답변" style="resize:none" ></textarea>
								
  								<input type="submit" value="등록" class="button alt small" style="float:right; margin-top:15px;"> 
								<br><br><br>
								
								<!-- 컨트롤러로 넘겨줄 값 -->
								<input type="hidden" name="qna_seq" value="<%= qdto.getQna_seq() %>">
								<input type="hidden" name="user_id" value="<%= udto.getUser_id() %>">
	 							
	 						</form>
	 				</div>
	 				
				
					<div>
						<a href="qnaMain.jsp" class="button">목록</a>
						
						<!-- 글 수정 버튼 제어 -->
						<% if(uid.equals(qdto.getQna_id())) { %>
							<a href="qnaUpdate.jsp?qna_seq=<%= qdto.getQna_seq() %>" class="button" style="float:right;">글 수정</a>
						<% }}%>
					</div>
					
				</div>
			</div>
		</section>


		<!-- Footer -->
		<footer id="footer">
			<ul class="icons">
				<li><a href="#" class="icon brands fa-twitter"><span
						class="label">Twitter</span></a></li>
				<li><a href="#" class="icon brands fa-facebook-f"><span
						class="label">Facebook</span></a></li>
				<li><a href="#" class="icon brands fa-instagram"><span
						class="label">Instagram</span></a></li>
				<li><a href="#" class="icon brands fa-github"><span
						class="label">Github</span></a></li>
				<li><a href="#" class="icon brands fa-dribbble"><span
						class="label">Dribbble</span></a></li>
				<li><a href="#" class="icon brands fa-google-plus"><span
						class="label">Google+</span></a></li>
			</ul>
			<ul class="copyright">
				<li>&copy; Untitled. All rights reserved.</li>
				<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
			</ul>
		</footer>


	<!-- Scripts -->
	
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script src="assets/js/bootstrap.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>

	<!-- awesome font -->
	<script src="https://kit.fontawesome.com/8b21a455c5.js" crossorigin="anonymous"></script>

</body>
</html>