<%@page import="Model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원 등록</title>
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
				<h2>회원 정보 등록</h2>
				<p>
					<i class="fa-solid fa-bell"></i></i>&nbsp;&nbsp;여기는 약통 사용자의 정보를 등록하는
					곳입니다.
				</p>
			</header>
			<div class="box">
				<span class="image featured"><img src="images/pic01.jpg"
					alt="" /></span>

				<div class="table-wrapper" >
					<div class="row-6 row-12-mobilep">
						<table>
							<tr>
								<td colspan="2" bgcolor="white" align="center">※ 약통 사용자의
									정보를 등록해 주세요.</td>
							</tr>
							
							<tr>
								<td bgcolor="white" align="right">사용자와의 관계</td>
								<td bgcolor="white">
								<!-- 사용자와의 관계 출력할 공간 -->
								
								</td>
							</tr>

							<tr>
								<td bgcolor="white" align="right">이름</td>
								<td bgcolor="white"><input type="text" name="h_name"></td>
							</tr>

							<tr>
								<td bgcolor="white" align="right">생년월일</td>
								<td bgcolor="white"><input type="date" name="h_birthdate"></td>
							</tr>

							<tr>
								<td bgcolor="white" align="right">성별</td>
								<td>
									<div class="col-4 col-12-narrower">
										<input type="radio" id="user_gender0" name="h_gender"
														value="male" checked>
										<label for="user_gender0">남자</label>
										<input type="radio" id="user_gender1" name="h_gender"
														value="female">
										<label for="user_gender1">여자</label>
									</div>
								<td>
							</tr>

							<tr>
								<td bgcolor="white" align="right">연락처</td>
								<td bgcolor="white"><input type="text" name="h_phone"
									placeholder="'-'표시를 제외하고 입력해주세요."></td>
							</tr>

							<tr>
								<td bgcolor="white" align="right">비상연락망</td>
								<td bgcolor="white"><input type="text" name="h_phone_emg"
									placeholder="'-'표시를 제외하고 입력해주세요."></td>
							</tr>


							<tr>
								<td bgcolor="white" align="right">주소</td>
								<td><input type="text" name="h_addr_zip" placeholder="우편번호">
									<input type="submit" value="검색하기"><br> 
									<input type="text"
									name="h_addr" placeholder="상세 주소를 입력해주세요."></td>
								</td>
								</td>
							</tr>

							<tr bgcolor="white" colspan="2">
								<td colspan="2" align="center"><input type="submit"
									value="등록"> <input type="reset" value="취소"></td>
							</tr>
							</form>
						</table>


					</div>
				</div>
			</div>
		</section>



		<!-- Footer -->




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
		<script src="https://kit.fontawesome.com/8b21a455c5.js"
			crossorigin="anonymous"></script>

</body>
</html>
