<%@page import="Model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원 정보 조회</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="is-preload">
	<div id="page-wrapper">

		<% 
			UserDTO udto = (UserDTO)session.getAttribute("udto");

			// handicaped
			
		%>


		<!-- Header -->
		<header id="header">
			<h1>
				<a href="Index.jsp">복순이&nbsp;&nbsp;</a>by dr.boksun
			</h1>
			<nav id="nav">
				<ul>
					<li><a href="Index.jsp">홈</a></li>
					<li>
					<a href="select_handi.jsp">정보 등록 및 조회&nbsp;&nbsp;&nbsp;<i
							class='icon solid fa fa-angle-down'></i>
					</a>
						<ul>
							<li><a href="reg_handi.jsp">회원 정보 등록</a></li>
							<li><a href="reg_box.jsp">보관함 등록 및 조회</a></li>
						</ul></li>
					<li class='sub-menu'><a href="commMain.jsp">커뮤니티&nbsp;&nbsp;&nbsp;<i
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
				<h2>회원 정보 조회</h2>
				<p>회원 정보 조회 페이지입니다.</p>
			</header>
			<div class="box">
				<span class="image featured"><img src="images/pic01.jpg"
					alt="" /></span>
				<input type="hidden" name="user_id" id = "user_id" value="<%= udto.getUser_id() %>"/>  <!-- 다른방법물어볼것 -->
				<h3>회원 전체 리스트</h3>
				<p></p>
				<a href="#" class="button">회원 삭제</a>
				<div class="row">
				<table style="text-align:center">
					<thead>
						<tr>
						<td>선 택</td>
						<td>순 번</td>
						<td>관 계</td>
						<td>성 명</td>
						<td>성 별 </td>
						<td>생년월일</td>
						<td>주 소</td>
						<td>전화번호</td>
						<%if(udto.getUser_type()=='0'){ %>
							<td>복지사 성명</td>
							<%} else{%>
								<td>보호자 성명</td>
							<%} %>
						</tr>
					</thead>
 					<tbody id = "tbody">
					</tbody>
				</table>	
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
	<script>
	
	document.addEventListener("DOMContentLoaded", function() {
		$.ajax({
	        url : 'SelectHandiServiceCon.do',
	        type : 'post',
	        data : {
	        	"user_id" : $('input[name=user_id]').val()
	        },
	        dataType: 'json',
	        success : function(res) {
	            $('#tbody').html('');
	            if(res.length == 0){
	            	alert('등록된 환자정보가 없습니다.\n회원정보등록 창으로 이동합니다.');
	            	document.location.href="reg_handi.jsp";
	            }
	            else{
	            	let table ="";
	            	for (let i = 0; i < res.length; i++) {
						table = '<tr>';
						table +='<td><div style = "margin-left: 1.3em"><input type="radio" id="'+res[i].h_seq+'" name="chk"><label for="'+res[i].h_seq+'"></label></div></td>'
						table += '<td>'+ (i+1) +'</td>';
						table += '<td>'+ res[i].h_relationship +'</td>';
						table += '<td>'+ res[i].h_name +'</td>';
						if(res[i].h_gender === "M"){
							table += '<td>남</td>';
						}else{
							table += '<td>여</td>';
						}
						table += '<td>'+ res[i].h_birthdate.slice(0, 10) +'</td>';
						table += '<td>'+ res[i].h_addr +'</td>';
						table += '<td>'+ res[i].h_phone +'</td>';
						table += '<td>'+ res[i].user_id +'</td>';
						table += '</tr>';
						$('#tbody').append(table);
					}
	            }
	        },
	        error : function() {
	            alert('조회실패!')
	        }
	    })
	});
	
	</script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>