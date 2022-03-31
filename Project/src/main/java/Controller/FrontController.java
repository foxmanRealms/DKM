package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Inter.Command;
import Service.CommService;
import Service.DeleteCommService;
import Service.EditPwService;
import Service.IdCheckService;
import Service.JoinService;
import Service.LoginService;
import Service.LogoutService;
import Service.StoryBoardService;
import Service.StoryCnt;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("[FrontController]");
		
		Command com = null;
		String nextpage = null;
		
		String uri = request.getRequestURI();
//		System.out.println("uri : " + uri);
		String path = request.getContextPath();
//		System.out.println("path : " + path);
		String command = uri.substring(path.length() + 1);
		System.out.println("command : " + command);
		
		// 회원 가입 기능
		if(command.equals("JoinServiceCon.do")) {
			com = new JoinService();
			nextpage = com.execute(request, response);	
			nextpage = nextpage + "?check=1&status=1";
			
		// 아이디 중복 확인 기능
		} else if(command.equals("IdCheckServiceCon.do")) {
			com = new IdCheckService();
			nextpage = com.execute(request, response);
		
		// 로그인 기능
		} else if(command.equals("LoginServiceCon.do")) {
			com = new LoginService();
			nextpage = com.execute(request, response);
		
		// 로그아웃 기능
		} else if(command.equals("LogoutServiceCon.do")) {
			com = new LogoutService();
			nextpage = com.execute(request, response);
		
		// 비밀번호 변경 기능
		} else if(command.equals("EditPwServiceCon.do")) {
			com = new EditPwService();
			nextpage = com.execute(request, response);
		
		// 정보 공유 기능
		} else if(command.equals("StoryBoardServiceCon.do")) {
			com = new StoryBoardService();
			nextpage = com.execute(request, response);
		
		// 댓글 작성 기능
		} else if(command.equals("CommServiceCon.do")) {
			com = new CommService();
			nextpage = com.execute(request, response);
		
		// 댓글 삭제 기능
		} else if(command.equals("DeleteCommServiceCon.do")) {
			com = new DeleteCommService();
			nextpage = com.execute(request, response);
			
		}
		
		
		
		
		
		
		// else if 마지막라인
		
		// nextpage로 이동
		if(nextpage != null) {
			response.sendRedirect(nextpage);
		}
	
	} // service 메소드 마지막라인
	

}
