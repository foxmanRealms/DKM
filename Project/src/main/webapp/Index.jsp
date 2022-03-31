<%@page import="Model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>당신 곁에, 복순이</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/style.css" />



</head>

<body class="landing is-preload">

	<%
		
		// 인코딩
	   request.setCharacterEncoding("utf-8");

	   // 쿼리스트링으로 넘어오는 check값 qr_check
	   System.out.println("--[스트링 확인]");

	   String check = request.getParameter("check");
	   String status = request.getParameter("status");

	   System.out.println("체크 " + check);

	   System.out.println("스탯 " + status);

	   String mo_title = "";
	   String mo_content = "";
	
		UserDTO udto = (UserDTO)session.getAttribute("udto");
		
	%>

	<div id="page-wrapper">

		<!-- Header -->
		<header id="header" class="alt">
			<h1>
				<a href="Index.jsp">복순이&nbsp;&nbsp;</a>by dr.boksun
			</h1>
			
			<nav id="nav" style="text-align:right;">
			<!-- 유저 아이콘 -->
			<!-- 봉투 아이콘 -->
			<i class="fa-regular fa-envelope" style="color:white;margin-top:20px;"></i> 
			<!-- 하트 아이콘 -->
			<i class="fa-solid fa-heart" style="color:white;margin-left:20px;"></i> 
			<!-- 연필 아이콘 -->
			<i class="fa-regular fa-pen-to-square" style="color:white;margin-left:20px;"></i> 
			
			<i class="fa-solid fa-user" style="color:white;margin-left:20px;"></i>
			<sup style="color:yellow;font-weight:500;font-size:small; vertical-align:sub;">User님 환영합니다!</sup>
			
			
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
		

		<!-- Banner -->
		<section id="banner">
			<h2>당신 곁에, 복순이</h2>
			<p>
				버튼만 누르면 먹을 약을 알려주는<br>스마트한 약 보관함
			</p>

			<% if(udto != null){ %>
			<h3 style="color: black"><%= udto.getUser_name() %>님 반갑습니다.
			</h3>
			<a href="Explain.jsp" class="button">제품 설명 및 사용 방법</a>
			</li>
			<%} else{%>
			<a href="Join.jsp" class="button primary">가입하기</a>
			</li> <a href="Explain.jsp" class="button">제품 설명 및 사용 방법</a>
			</li>
			<%} %>


		</section>

		<!-- Main -->
		
		<!--모달 본문  -->
      <div>
         <btn id="btn-modal">모달 켜기</btn>
      </div>

      <div id="modal" class="modal-overlay">
         <%
         System.out.println("--[모달 진입]");

         // 초기 모달값 
         System.out.println("스탯 " + status);
         //System.out.println("st qr " + qr_status);

         // 초기페이지 로딩시에 오류 방지
         if (status == null) {

            // 상황별 모달 출력문   
         } else if (check.equals("1") && status.equals("1")) {
            System.out.println("[가입진입] " + status);
            mo_title = "가입 성공";
            mo_content = "가입을 환영합니다";
         } else if (check.equals("1") && status.equals("2")) {
            System.out.println("[2진입] " + status);
            mo_title = "2 성공";
            mo_content = "2 환영합니다";
         } else if (check.equals("1") && status.equals("3")) {
            System.out.println("[3진입] " + status);
            mo_title = "3 성공";
            mo_content = "3 환영합니다";

         } else {

         }
         %>


         <div class="modal-window">
            <div class="title">
               <h2><%=mo_title%>
               </h2>
            </div>
            <div class="close-area">X</div>
            <div class="content">
               <p><%=mo_content%>
               </p>


            </div>
         </div>
      </div>




      <!-- 모달 로직 -->
      <script>
		const modal = document.getElementById("modal")
		function modalOn() {
		    modal.style.display = "flex"
		}
		function isModalOn() {
		    return modal.style.display === "flex"
		}
		function modalOff() {
		    modal.style.display = "none"
		}
		// 모달 켜기버튼
		const btnModal = document.getElementById("btn-modal")
		btnModal.addEventListener("click", e => {
		    modalOn()
		})
		// 모달 끄기 구간
		const closeBtn = modal.querySelector(".close-area")
		closeBtn.addEventListener("click", e => {
		    modalOff()
		})
		 // 모달 오버레이를 클릭하면 모달 끄기
		modal.addEventListener("click", e => {
		    const evTarget = e.target
		    if(evTarget.classList.contains("modal-overlay")) {
		        modalOff()
		    }
		})
		// esc키를 누르면 모달 끄기 
		window.addEventListener("keyup", e => {
		    if(isModalOn() && e.key === "Escape") {
		        modalOff()
		    }
		})
		
		//  쿼리체크가 1이면 모달이 켜진다 
		window.onload = function () { // window가 load될 때 function 부분이 실행됨. load여부는 브라우저가 알려줌.
		   let qr_check="1"
		   if(qr_check==<%=check%>){
		      modalOn()
		   }
		   
		   
		};
		</script>
		
		
	
	


		<!-- CTA -->
		<section id="cta">

			<h2>복순이</h2>
			<p>복순이 서비스를 이용하세요!</p>

			<form>
				<div class="row gtr-50 gtr-uniform">
					<div class="col-8 col-12-mobilep">
						<input type="email" name="email" id="email"
							placeholder="Email Address" />
					</div>
					<div class="col-4 col-12-mobilep">
						<input type="submit" value="Sign Up" class="fit" />
					</div>
				</div>
			</form>

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