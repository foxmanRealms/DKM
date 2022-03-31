<%@page import="Model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>제품 설명</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>

<body class="is-preload">
	
	<%
   		UserDTO udto = (UserDTO) session.getAttribute("udto");
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
					<li><a href="select_handi.jsp">정보 등록 및
							조회&nbsp;&nbsp;&nbsp;<i class='icon solid fa fa-angle-down'></i>
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

							<%
							if (udto != null) {
							%>
							<li><a
								href="edit_pw_next.jsp?user_id=<%=udto.getUser_id()%>">비밀번호
									재설정</a></li>
							<%
							} else {
							%>
							<li><a href="edit_pw.jsp">비밀번호 변경</a></li>
							<%
							}
							%>
							<li><a href="select_user0.jsp">담당 복지사 조회</a></li>
							<li><a href="select_user1.jsp">보호자 조회</a></li>
						</ul></li>

					<%
					if (udto != null) {
					%>
					<li><a href="LogoutServiceCon.do" class="button">로그아웃</a></li>
					<%
					} else {
					%>
					<li><a href="Login.jsp" class="button">로그인</a></li>
					<%
					}
					%>

				</ul>
			</nav>
		</header>


		<!-- Main -->
		<section id="main" class="container">
			<header>
				<h2>복순이</h2>
				<p>음성 API를 활용한 스마트 약 보관함</p>
			</header>
			
			<div class="box">
				<span class="image featured"><img src="images/pic01.jpg"
					alt="" /></span>
				<i class="fa-solid fa-door-open fa-2x"></i>
				<h3>제품 소개</h3>
				<p>약 이름을 제대로 확인하지 못하여 잘못된 사용을 할 수 있는 시각장애인, 시력이 악화되어 생활이 불편한
					고객님들을 위한 음성으로 약 이름과 정보를 알려주는 스마트 약 보관함</p>
				<div class="row">
					<div class="row-6 row-12-mobilep">
						<i class="fa-solid fa-door-open fa-2x"></i>
						<h3>이용 방법</h3>
						
						
						<h4><i class="fa-solid fa-window-maximize"></i>&nbsp;&nbsp;웹 사이트</h4>
						<p>
							1.회원 가입<br> - 복지사 또는 보호자를 선택하고 양식에 맞게 입력 후 가입해주세요.
						</p>
						<p>
							2.  정보 등록 및 조회<br> - 실사용자의 정보를 등록하고 복용하거나 사용하는 약 정보를 등록해주세요<br>
							- 약 정보를 등록할 때, 해당 페이지 상단의 제품 사진을 참고하여 입력해주세요.
						</p>
						<p>
							3.  마이페이지<br> - 비밀번호 변경을 통하여 비밀번호 변경을 할 수 있습니다. - 복지사일 경우
							관리하는 보호자 일부 정보를 확인 할 수 있습니다. - 보호자일 경우 담당하는 복지사 일부 정보를 확인 할 수
							있습니다.
						</p>
					</div>
					
					<div class="row-6 row-12-mobilep">
						<h4><i class="fa-solid fa-prescription-bottle-medical"></i></i>&nbsp;&nbsp;약 보관함</h4>
						<p>
							1. 쉽게 약 위치를 찾을 수 있는 곳에 제품을 설치해주세요.<br> 2. WI-FI와 복순이를
							연결해주세요.<br> 3. 보관함 앞에 버튼을 누르면 웹페이지에 등록한 약 정보를 음성으로 알려줍니다.<br>
						</p>

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