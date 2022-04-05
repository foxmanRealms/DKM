package Service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Inter.Command;
import Model.StoryDAO;
import Model.StoryDTO;

public class StoryCnt implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("[StoryCntCon.do]");
		
		int story_cnt = Integer.parseInt(request.getParameter("story_cnt"));
		int story_seq = Integer.parseInt(request.getParameter("story_seq"));
		
		int cnt = new StoryDAO().updateCount(story_seq, story_cnt);
		
		if(cnt > 0) {
			System.out.println("조회수 업데이트 성공!");
		} else { 
			System.out.println("조회수 업데이트 실패!");
		}
		
		String nextpage = null;
		return nextpage;
	}
	
	
}
