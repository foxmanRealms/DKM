<%@page import="Model.StoryDAO"%>
<%@page import="Model.StoryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Story</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<script src="assets/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/style.css" />
<style>
table, th, tr, td{
	text-align: center !important;
}
</style>
</head>
<body class="is-preload">
	
	<%
		// 회원
		UserDTO udto = (UserDTO)session.getAttribute("udto");
		
		// 게시글 리스트
		ArrayList<StoryDTO> list = new StoryDAO().selectBoardAll();
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
				<p>정보 공유 게시판</p>
			</header>
			<div class="box">
				<div class="row-6 row-12-mobilep">
					<table>
						<thead>
							<th></th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th><i class="fa-solid fa-eye"></i></th>
							<th><i class="fa-solid fa-heart"></i></th>
						</thead>
						
						<tbody>
						<!-- 게시글 번호 -->
						<% int num = 1;%>
						<% for(StoryDTO s : list){ %>
							<tr>
								<td><%= num %></td>
								<td><a href="storySelect.jsp?story_seq=<%= s.getStory_seq() %>">
								<%= s.getStory_title() %></a></td>
								<td><%= s.getUser_id() %></td>
								<td><%= s.getStory_joindate().split(" ")[0] %></td>
								<td><%= s.getStory_cnt() %></td>
								<td><%= s.getStory_like() %></td>
							</tr>
						<% num++; } %>
						</tbody>
					</table>

					<div>
						
						<% if(udto != null){ %>
							<a href="storyWrite.jsp" class="button special" style="float:right">글쓰기</a>
						<%} %>
						
						<div class="task-tabs">
						<input type="text" id="search" placeholder="제목만"/>
						<input type="submit" id="btn" value="검색" class="small" style="float:right;" onclick="search()"/>
						</div>
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

	</div>



	<!-- Scripts -->
	<script type="text/javascript">
	isShow= true;
	function search(){
		if(isShow){
			isShow = false;
			$('tbody').hide();
			$('input#btn').val('전체')
		} else{
			isShow = true;
			$('tbody').show();
			$('input#btn').val('검색')
		}
	}
	</script>
	
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