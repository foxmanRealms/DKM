<%@page import="Model.CommDAO"%>
<%@page import="Model.CommDTO"%>
<%@page import="Model.StoryDAO"%>
<%@page import="Model.StoryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>정보 공유 글조회</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<script src="assets/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/style.css" />
</head>
<body class="is-preload">
	
	<%
		UserDTO udto = (UserDTO)session.getAttribute("udto");
	
		int story_seq = Integer.parseInt(request.getParameter("story_seq"));
		StoryDTO stdto = new StoryDAO().selectBoardOne(story_seq);
		
		
		// 댓글 가져오기
		CommDAO commdao = new CommDAO();
		ArrayList<CommDTO> commlist = commdao.selectComm(story_seq);
		int totalComm = commdao.totalComm(story_seq);
		
		
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
				<p>정보 공유</p>
			</header>
			
			<div class="box">
				<blockquote><h3>글 조회</h3></blockquote>
			
				<div class="col-12">
					<h3><%= stdto.getStory_title() %></h3>
					
					<div align="right">
						작성자 <%= stdto.getUser_id() %><br>
						작성일 <%= stdto.getStory_joindate().substring(0,16) %><br>
						조회  <%= stdto.getStory_cnt() %>
						<hr/>
					</div>
					
					<div class="col-12">
						<img src="file/<%=stdto.getStory_file()%>" width="300">
						<span><%= stdto.getStory_content() %></span>
						<hr/>
					</div>
					
					<span id="like" class="story-select">
						<i class="fa-regular fa-heart" onclick="like()"></i> 
						&nbsp;
						좋아요
						&nbsp;&nbsp;<%= stdto.getStory_like() %>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</span>
					
					<span id="comm" class="story-select">
						<i class="fa-regular fa-comment-dots" onclick="#writeComm"></i>
						&nbsp;
						댓글
						&nbsp;&nbsp;<%= totalComm %><br><br>
					</span>
					
					
					<!-- Comment -->
					<section>
						<h3>댓글</h3>
						<!-- 댓글 출력 -->
						<form action="DeleteCommServiceCon.do" method="post">
						<div id="selectCmt">
							 <% for(CommDTO l : commlist){ %>
							 <div>
					 			<h4><%= l.getUser_id() %></h4> 
			            		<%= l.getCmt_content() %><br> 
			            		<%= l.getCmt_joindate() %> 
			            		<input type="submit" value="삭제" class="button small removeCmt"/>
			            		<input type="hidden" name="cmt_seq" value="<%= l.getCmt_seq()%>"/>
			            		<input type="hidden" name="story_seq" value="<%= l.getStory_seq()%>"/>
			            	</div>
							<%} %>
						</div> 
						</form>

						<!-- 댓글 달기 -->
						<div class="comm-div">
							<% if(udto != null){ %>
							<form action="CommServiceCon.do" method="post">
								
								<h4>&nbsp;&nbsp;&nbsp;<%= udto.getUser_id() %></h4>
								<textarea id="cmt" name="cmt_content" cols="8" rows="4" placeholder="댓글을 남겨보세요 :)" style="resize:none" ></textarea>
								
  								<input id="writeCmt" type="submit" value="등록" class="button alt small"  style="float:right"> 
								<br><br><br>
								
								<!-- 컨트롤러로 넘겨줄 값 -->
								<input type="hidden" name="story_seq" value="<%= stdto.getStory_seq()%>">
								<input type="hidden" name="user_id" value="<%= udto.getUser_id() %>">
							</form>
							<%} else {%>
								<p>로그인이 필요합니다.</p>
							<%} %>
						</div>
						
						<script>
						<%-- 새로고침하기 때문에 이벤트 필요 x
						
						$(document).ready(function(){
								
							$('.removeCmt').on('click', function(){
								console.log('test')
					            // 여러 개의 댓글 중, 내가 원하는 댓글만 삭제-!
					            $(this).parent().remove() // p태그 삭제
					        })
	
						})
						--%>
						
						<%-- // openAPI 쓸 경우에 제이쿼리 OR 일반 자바스크립트 문법 선택
						function save(){
							// data 쓰기 위해 작성
							let putData = []; // 배열
							putData.push({
								'story_seq' : <%= stdto.getStory_seq() %>,
								'cmt_content' : $('#commCon').val(),
								'user_id' : <%= udto.getUser_id() %>
							});
							console.log(putData);

							$.ajax({
								url : "CommServiceCon.do",
								type : "post",
								data : {
									// json 타입을 String 타입으로 보내줌.
									'json' : JSON.stringify(putData) // <- 배열
								},
							
								// 서버가 요청 URL을 통해서 응답하는 내용의 타입
								dataType : "json",
												// res : 서버에 요청된 결과가 담김
								success : function(res){
									console.log(res);
					
								},
								error : function(){
									alert("실패!");
								}
								
							});
							
						} 
						--%>
		
						</script>
						

					</section>

					<div>
						<a href="storyMain.jsp" class="button">목록</a>
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