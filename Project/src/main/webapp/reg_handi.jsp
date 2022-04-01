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
							<li><a href="edit_pw_next.jsp?user_id=<%=udto.getUser_id()%>">비밀번호 재설정</a></li>
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

				<div class="table-wrapper">
					<div class="row-6 row-12-mobilep">
						<table>
							<tr>
								<td colspan="2" bgcolor="white" align="center">※ 약통 사용자의
									정보를 등록해 주세요.</td>
							</tr>

							<tr>
								<td bgcolor="white" align="right">사용자와의 관계</td>
								<td bgcolor="white"><input type="text" name="h_relation"
									value="수정" readonly></td>
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
											value="male" checked> <label for="user_gender0">남자</label>
										<input type="radio" id="user_gender1" name="h_gender"
											value="female"> <label for="user_gender1">여자</label>
									</div>
								<td>
							</tr>

							<tr>
								<td bgcolor="white" align="right">연락처</td>
								<td bgcolor="white"><input type="text" name="h_phone"
									placeholder="'-'표시를 제외하고 입력해주세요."></td>
							</tr>

							<tr>
								<td>주소</td>
								<td>
									<input type="text" id="re_postcode" name="re_postcode" placeholder="우편번호"> 
									<input type="button" onclick="user_region()" value="우편번호 찾기"><br> 
									<input type="text" id="re_roadAddress" name="re_roadAddress" placeholder="도로명주소"> <!-- <input type="hidden" id="re_jibunAddress" name="re_jibunAddress"  placeholder="지번주소">     -->
									<span id="guide" style="color: #999; display: none"></span> 
									<input type="text" id="re_detailAddress" name="re_detailAddress" placeholder="상세주소"> 
									<input type="hidden" id="re_extraAddress" name="re_extraAddress" placeholder="법정동">
									<input type="hidden" name="user_id" value="<%= udto.getUser_name() %>"/>
								</td>
							</tr>

							<tr bgcolor="white" colspan="2">
								<td colspan="2" align="center">
								<input type="button" onclick="input()" value="등록"> 
								<input type="reset" value="취소">
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</section>



		<!-- Footer -->




		<!-- Scripts -->

		<!-- 주소 관련 scripts -->
		<script>
    			// 본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 
    			// 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
                function user_region() {
                       new daum.Postcode({
                           oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                let roadAddr = data.roadAddress; // 도로명 주소 변수
                let extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('re_postcode').value = data.zonecode;
                document.getElementById("re_roadAddress").value = roadAddr;
                /* document.getElementById("re_jibunAddress").value = data.jibunAddress; */
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("re_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("re_extraAddress").value = '';
                }

                let guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    let expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    let expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            	}
        		}).open();
   			 }
			</script>

		<script>
            // 카카오 주소 api
            function findAddr(){ new daum.Postcode({ oncomplete: function(data)
            { console.log(data); // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분. 
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다. // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            let roadAddr = data.roadAddress; 
            // 도로명 주소 변수 
            let jibunAddr = data.jibunAddress; 
            // 지번 주소 변수 
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('member_post').value = data.zonecode;
            if(roadAddr !== ''){ document.getElementById("member_addr").value =
            roadAddr; } else if(jibunAddr !== ''){
            document.getElementById("member_addr").value = jibunAddr; } }
            }).open(); }
            </script>
		<script
			src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

		<script type="text/javascript">
		function input(){
			$.ajax({
				url: "RegHandiServiceCon.do",
				type: "post",
				data: {
					"hRelation"	 : $('input[name=h_relation]').val(),
					"hName" 	 : $('input[name=h_name]').val(),
					"hBirth" 	 : $('input[name=h_birthdate]').val(),
					"hGender" 	 : $('input[name=h_gender]').val(),
					"hPhone" 	 : $('input[name=h_phone]').val(),
					"hRoadAdr" 	 : $('input[name=re_roadAddress]').val(),
					"hDetailAdr" : $('input[name=re_detailAddress]').val(),
					"user_id"	 : $('input[name=user_id]').val()
				},
				//dataType -> 데이터 보낼 때
				//서버에 요청된 결과가 담김
				success: function(res){
					alert("등록 성공!");
				},
				error: function() {
					alert("등록 실패!");
				}
			});
		}
		</script>


		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
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
