package com.jsinc.services.todo;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.jsinc.jsincDAO.ToDoListDAO;
import com.jsinc.jsincDTO.MemberDTO;
import com.jsinc.jsincDTO.ToDoListDTO;

@Service
public class AddListService implements ServiceIf{
	@Autowired
	ToDoListDAO dao;
	
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		ServletContext application = session.getServletContext();
		MemberDTO dto_mem = (MemberDTO)application.getAttribute("user");
		
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String day = format.format(date);
		
		ToDoListDTO dto = new ToDoListDTO();
		dto.setEmpNo(dto_mem.getEmpNo());
		dto.seteDate(request.getParameter("eDate"));
		dto.setTodo(request.getParameter("todo"));
		dto.setsDate(day);
		dao.add(dto);
	}

}
