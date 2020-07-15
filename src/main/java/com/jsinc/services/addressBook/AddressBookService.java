package com.jsinc.services.addressBook;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.jsinc.jsincDAO.AddressBookDAO;
import com.jsinc.jsincDTO.MemberDTO;

@Service
public class AddressBookService implements ServiceIf{
	@Autowired
	AddressBookDAO dao;
	
	@Override
	public void execute(Model model) {
		ArrayList<MemberDTO> management = (ArrayList<MemberDTO>)dao.listAll("경영지원부");
		ArrayList<MemberDTO> development = (ArrayList<MemberDTO>)dao.listAll("개발부");
		ArrayList<MemberDTO> accountancy = (ArrayList<MemberDTO>)dao.listAll("경리부");
		ArrayList<MemberDTO> quality = (ArrayList<MemberDTO>)dao.listAll("품질관리부");
		ArrayList<MemberDTO> overseas = (ArrayList<MemberDTO>)dao.listAll("해외영업부");
		
		model.addAttribute("mg", management);
		model.addAttribute("dp", development);
		model.addAttribute("at", accountancy);
		model.addAttribute("ql", quality);
		model.addAttribute("os", overseas);
	}

}
