package com.jsinc.services.message;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.jsinc.jsincDAO.MessageDAO;
import com.jsinc.jsincDTO.MemberDTO;
import com.jsinc.jsincDTO.MessageDTO;
@Service
public class RecentServiceImpl implements ServiceMes{
	@Autowired
	MessageDAO dao;
	
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
		ServletContext app= session.getServletContext();
		MemberDTO dto = (MemberDTO) app.getAttribute("user");
		int empNo = dto.getEmpNo();
		ArrayList<MessageDTO> list = (ArrayList<MessageDTO>) dao.recentMsg(empNo);
		model.addAttribute("recList",list);
		
	}
	

}
