package Service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Inter.Command;

public class RegHandiService implements Command{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("[RegHandiService.do]");
		
		request.setCharacterEncoding("UTF-8");	
		
		String h_relationship = request.getParameter("hRelation");
		String h_name = request.getParameter("hName");
		String h_birthdate = request.getParameter("hBirth");
		String h_gender = request.getParameter("hGender");
		String h_phone = request.getParameter("hPhone");
		String h_roadAddress = request.getParameter("hRoadAdr");
		String h_detailAddress = request.getParameter("hDetailAdr");
		String hAdr = h_roadAddress + " " + h_detailAddress;
		
		
		String result ="";
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		out.print(result);
		return null;
	}
}
