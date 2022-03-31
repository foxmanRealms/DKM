<%@page import="Model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>약 보관함 등록</title>
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
				<h2>약 보관함 등록</h2>
				<hr>
				<h4>
				<i class="fa-solid fa-capsules"></i>
					<!-- 실사용자 이름 출력 (수정 필요)-->
					<strong>고점례</strong>님, 약 보관함 페이지입니다.
				</h4>
				<span><img src="images/med_box.png"
					style="width:50%; display: block; margin: 0px auto; " alt="" />
				</span>
			</header>
			
			
				<div>
					<div class="row-6 row-12-mobilep">
						<table>
							<thead>
			                     <tr>
			                        <td colspan="7" align="center">
			                        <i class="fa-solid fa-check"></i> &nbsp;&nbsp;사용자의 약 보관함 정보를 등록해 주세요.<br>
			                        <i class="fa-solid fa-check"></i> &nbsp;&nbsp;처방의료기관(병원명, 약국명)입력해 주세요.<br><br>
			                        <i class="fa-solid fa-check"></i> &nbsp;&nbsp;7번보관함(바르는약 ex.후시딘,소독약 등)<br>- 복약 및 사용 안내에 (ex.후시딘, 상처)라고 기재 해 주세요.<br><br>
			                        <i class="fa-solid fa-check"></i> &nbsp;&nbsp;8번보관함(복용약 ex.타이레놀,종합약 등)<br>- 하루 최대 복용가능 횟수를 기재 해 주세요.</td>
			                     </tr>

			                     <tr>
			                        <td align="center">&nbsp;&nbsp;&nbsp;&nbsp;함&nbsp;&nbsp;&nbsp;&nbsp;</td>
			                        <td align="center">약 이름</td> <!-- med_box -->
			                        <td align="center">처방 의료 기관</td> <!-- med_hosp -->
			                        <td align="center">복약 및 사용안내</td> <!-- med_alert -->
			                        <td align="center">처방 일자</td> <!-- med_date -->
			                        <td align="center">병원 내원일자</td> <!-- med_visit -->
			                        <td align="center">복용시간 알람</td> <!-- med_alarm -->
			                     </tr>
		                     </thead>
		                     
		                     
		                     <tbody>
			                     <tr>
			                        <td align="center">1</td>
			                        <td bgcolor="white"><input type="text" name="med_box1"
			                           style="width: 170px;" placeholder="입력"></td>
			                            
			                        <td><input type="text" name="med_hosp1"
			                           style="width: 170px;"></td>
			                           
			                        <td><input type="text" name="med_alert1" style="width: 170px;"></td>   
			                        <td><input type="date" name="med_date1"></td>    
			                        <td><input type="date" name="med_visit1" style="margin-left:15px"></td> 
			                        <td><input type="time" name="med_alarm1" style="margin-left:15px"></td>    

			                     </tr>
			
			                     <tr>
			                        <td   align="center">2</td>
			                        <td bgcolor="white"><input type="text" name="med_box2"
			                           placeholder="입력"></td>
			                            
			                        <td><input type="text" name="med_hosp2"
			                           style="width: 170px;"></td>
			                           
                                    <td><input type="text" name="med_alert2" style="width: 170px;"></td>   
                                    <td><input type="date" name="med_date2"></td>    
                                    <td><input type="date" name="med_visit2" style="margin-left:15px"></td> 
                                    <td><input type="time" name="med_alarm2" style="margin-left:15px"></td>    
			                     </tr>
			
			                     <tr>
			                        <td   align="center">3</td>
			                        <td bgcolor="white"><input type="text" name="med_box3"
			                           placeholder="입력"></td>
			                            
			                        <td><input type="text" name="med_hosp3"
			                           style="width: 170px;"></td>
			                           
                                    <td><input type="text" name="med_alert3" style="width: 170px;"></td>   
                                    <td><input type="date" name="med_date3"></td>    
                                    <td><input type="date" name="med_visit3" style="margin-left:15px"></td> 
                                    <td><input type="time" name="med_alarm3" style="margin-left:15px"></td>    
			                     </tr>
			
			                     <tr>
			                        <td   align="center">4</td>
			                        <td bgcolor="white"><input type="text" name="med_box4"
			                           placeholder="입력"></td>
			                            
			                        <td><input type="text" name="med_hosp4"
			                           style="width: 170px;"></td>
			                           
                                    <td><input type="text" name="med_alert4" style="width: 170px;"></td>   
                                    <td><input type="date" name="med_date4"></td>    
                                    <td><input type="date" name="med_visit4" style="margin-left:15px"></td> 
                                    <td><input type="time" name="med_alarm4" style="margin-left:15px"></td>     
			                     </tr>
			
			                     <tr>
			                        <td   align="center">5</td>
			                        <td bgcolor="white"><input type="text" name="med_box5"
			                           placeholder="입력"></td>
			                            
			                        <td><input type="text" name="med_hosp5"
			                           style="width: 170px;"></td>
			                           
                                    <td><input type="text" name="med_alert5" style="width: 170px;"></td>   
                                    <td><input type="date" name="med_date5"></td>    
                                    <td><input type="date" name="med_visit5" style="margin-left:15px"></td> 
                                    <td><input type="time" name="med_alarm5" style="margin-left:15px"></td>      
			                     </tr>
			
			                     <tr>
			                        <td   align="center">6</td>
			                        <td bgcolor="white"><input type="text" name="med_box6"
			                           placeholder="입력"></td>
			                            
			                        <td><input type="text" name="med_hosp6"
			                           style="width: 170px;"></td>
			                           
                                    <td><input type="text" name="med_alert6" style="width: 170px;"></td>   
                                    <td><input type="date" name="med_date6"></td>    
                                    <td><input type="date" name="med_visit6" style="margin-left:15px"></td> 
                                    <td><input type="time" name="med_alarm6" style="margin-left:15px"></td>      
			                     </tr>
			                     
			                    <tr>
			                        <td   align="center">7</td>
			                        <td bgcolor="white"><input type="text" name="med_box7"
			                           placeholder="입력"></td>
			                            
			                        <td><input type="text" name="med_hosp7"
			                           style="width: 170px;"></td>
			                           
			                        <td><input type="text" name="med_alert7" style="width: 170px;"></td>   
			                        <td><input type="date" name="med_date7"></td>    
			                        <td><input type="date" name="med_visit6" style="margin-left:15px"></td> 
                                    <td><input type="time" name="med_alarm6" style="margin-left:15px"></td>    
			                    </tr>
			                    
			                    <tr>
			                        <td   align="center">8</td>
			                        <td bgcolor="white"><input type="text" name="med_box8"
			                           placeholder="입력"></td>
			                            
			                        <td><input type="text" name="med_hosp8"
			                           style="width: 170px;"></td>
			                           
			                        <td><input type="text" name="med_alert8" style="width: 170px;"></td>   
			                        <td><input type="date" name="med_date8"></td>    
			                        <td><input type="date" name="med_visit6" style="margin-left:15px"></td> 
                                    <td><input type="time" name="med_alarm6" style="margin-left:15px"></td>    
			                    </tr>
			                    
			                      <tr>
			                        <td colspan="7" align="center">
			                        <input type="submit" value="등록 완료">
			                        <input type="reset" value="초기화" class="button alt">
			                        </td> 
			                     </tr>
		                     </tbody>
							
						</table>
			
			  
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
		<script src="https://kit.fontawesome.com/8b21a455c5.js" crossorigin="anonymous"></script>
</body>
</html>
