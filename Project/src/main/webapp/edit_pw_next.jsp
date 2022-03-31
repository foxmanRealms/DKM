<%@page import="Model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>비밀번호 재설정</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="is-preload">
	
	<%
		UserDTO udto = (UserDTO)session.getAttribute("udto");
		String user_id = request.getParameter("user_id");
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
				<h2>비밀번호 재설정</h2>
			</header>
			<div class="box">
				<form action="EditPwServiceCon.do?user_id=<%=user_id%>" method="post">
				<table>
					<thead>
						<h4>※ 비밀번호를 변경해주세요.</h4>
						<h4>※ 다른 아이디나 사이트에서 사용한 적 없는 안전한 비밀번호로 변경해 주세요.</h4>
					</thead>

					<tbody>
						<tr>
							<td align="center" padding="50px">아이디</td>
							<td><%=user_id%></td>
						</tr>

						<tr>
							<td><h4>새 비밀번호</h4></td>
							<td><input type="password" id="pwd1" name="user_pw"
								placeholder="새 비밀번호를 입력해 주세요."></td>
						</tr>

						<tr>
							<td><h4>새 비밀번호 확인</h4></td>
							<td><input type="password" id="pwd2" name="check_user_pw"
								placeholder="새 비밀번호를 다시 입력해 주세요."></td>
						</tr>
						<tr>
							<td><p>* 영문, 숫자, 특수문자를 함께 사용하면 안전합니다.</p></td>
						</tr>
					</tbody>	
				</table>
				</form>			
					<div class="alert alert-success" id="alert-success">비밀번호가
						일치합니다.</div>
					<div class="alert alert-danger" id="alert-danger" style="color:red">비밀번호가 일치하지
						않습니다.</div>
							
					<tr>
						<td colspan="2">
						<input type="submit" id="submit" class="button" value="확인">
						<input type="reset" class="button alt" value="취소">
						</td>
					</tr>
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


	<!-- 버튼 기능 제어 -->
	<script type="text/javascript">
      $(function() {
         $("#alert-success").hide();
         $("#alert-danger").hide();
         $("input").keyup(function() {
            let pwd1 = $("#pwd1").val();
            let pwd2 = $("#pwd2").val();
            if (pwd1 != "" || pwd2 != "") {
               if (pwd1 == pwd2) {
                  $("#alert-success").show();
                  $("#alert-danger").hide();
                  $("#submit").removeAttr("disabled");
               } else {
                  $("#alert-success").hide();
                  $("#alert-danger").show();
                  $("#submit").attr("disabled", "disabled");
               }
            }
         });
      });
   </script>

</body>
</html>