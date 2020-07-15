package com.jsinc.controllers;

import java.io.File;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jsinc.jsincDTO.MemberDTO;
import com.jsinc.services.main.ComponentService;
import com.jsinc.services.main.LoginService;
import com.jsinc.services.main.MailService;
import com.jsinc.services.main.MemberServiceImpl;
import com.jsinc.services.main.PasswordChangeService;
import com.jsinc.services.main.ProfileEditServiceImpl;
import com.jsinc.services.main.ProfileService;
import com.jsinc.services.main.ProfileValueServiceImpl;
import com.jsinc.services.main.ResentSurveyService;
import com.jsinc.services.main.ServiceIf;
import com.jsinc.services.message.MsgAlarmServiceImpl;
import com.jsinc.services.message.RecentServiceImpl;
import com.jsinc.services.message.ServiceMes;

@Controller
public class MainController {
	ApplicationContext ac = App.ac;
	static String vali;
	private ServiceIf service;
	@Autowired
	MailService mailService;
	ProfileService profileService;
	ServiceMes msgService;
	ComponentService comService;

	@Resource(name = "uploadPath") // ���ε� ��� (��ó : servlet-context)
	private String uploadPath;

	@RequestMapping("loginChk")
	public String loginChk(Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("request", request);
		service = ac.getBean("loginService", LoginService.class);
		int result = service.execute(model);
		
		if (result == 0) {
			msgService=ac.getBean("msgAlarmServiceImpl",MsgAlarmServiceImpl.class);
			model.addAttribute("request",request);
			msgService.execute(model);
			return "redirect:index";
		}
		return "home";
	}

	@RequestMapping("index")
	public String index(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		comService = ac.getBean("resentSurveyService", ResentSurveyService.class);
		comService.execute(model);
		
		msgService=ac.getBean("recentServiceImpl",RecentServiceImpl.class);
		msgService.execute(model);
		
		return "index";
	}

	@RequestMapping("profile")
	public String profile(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		profileService = ac.getBean("profileValueServiceImpl", ProfileValueServiceImpl.class);
		profileService.execute(model);
		return "profile";
	}

	@RequestMapping("editProfile")
	public String editProfile(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		profileService = ac.getBean("profileEditServiceImpl", ProfileEditServiceImpl.class);
		profileService.execute(model);
		return "redirect:profile";
	}

	@RequestMapping("changePw")
	public String changePw(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		profileService = ac.getBean("passwordChangeService", PasswordChangeService.class);
		profileService.execute(model);
		return "redirect:profile";
	}

	@RequestMapping("logout")
	public String logout(HttpSession session) {
		ServletContext application = session.getServletContext();
		application.removeAttribute("user");
		application.removeAttribute("start");
		application.removeAttribute("end");
		return "home";
	}

	@RequestMapping("join")
	public String view() {
		return "join";
	}

	@RequestMapping("doSend")
	@ResponseBody
	public String doSend(String email, String title, String body, HttpServletRequest req) {

		title = "JSInc. ȸ������ ���� �ڵ� �߱� �ȳ� �Դϴ�.";
		email = req.getParameter("userEmail");
		body = "������ ���� �ڵ��" + vali + " �Դϴ�.";

		char[] charSet = { '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'e', 'F', 'G', 'h', 'I',
				'j', 'K', 'L', 'm', 'O', 'p', 'Q', 'r', 'S', 't' };

		StringBuffer newKey = new StringBuffer();
		for (int i = 0; i < 10; i++) {
			int idx = (int) (charSet.length * Math.random());
			newKey.append(charSet[idx]);
		}
		this.vali = newKey.toString();
		System.out.println("����� �̸���:" + email);
		System.out.println("�����ڵ�:" + vali);
		title = "JSInc. ȸ������ ���� �ڵ� �߱� �ȳ� �Դϴ�.";
		body = "";
		body += "<div align='center' style='border:1px solid black;' font-family:verdana'>";
		body += "<h3 style='color:blue;'>������ �����ڵ� �Դϴ�. </h3>";
		body += "<p>�����ڵ�: <strong>" + vali + "</strong></p></div>";

		Map<String, Object> sendRs = mailService.send(email, title, body);
		return (String) sendRs.get("msg");
	}

	@RequestMapping(value = "chkEmail", produces = "application/text;charset=utf8")
	@ResponseBody
	public String chkEmail(HttpServletRequest req) {
		String chkNum = (String) req.getParameter("chkNum");
		System.out.println("�Է��� ������ȣ" + chkNum);
		System.out.println("������ȣ=======" + vali);
		if (vali.equals(chkNum)) {
			return 0 + "";
		} else if (chkNum.equals("")) {
			return 1 + "";
		} else {
			return 2 + "";
		}
	}

	@RequestMapping(value = "empNoChk", produces = "application/text;charset=utf8")
	@ResponseBody
	public String empNoChk(MemberDTO dto) throws Exception {
		service = ac.getBean("memberServiceImpl", MemberServiceImpl.class);
		System.out.println(dto.getEmpNo());
		int result = service.empNoChk(dto);
		System.out.println("result: " + result);
		return result + "";
	}

	@RequestMapping(value = "userEmailChk", produces = "application/text;charset=utf8")
	@ResponseBody
	public String userEmailChk(HttpServletRequest req) throws Exception {
		String userEmail = (String) req.getParameter("userEmail");
		System.out.println("controller:" + userEmail);
		service = ac.getBean("memberServiceImpl", MemberServiceImpl.class);
		int result = service.userEmailChk(userEmail);
		System.out.println("result:" + result);
		return result + "";
	}

	@RequestMapping("registerMem")
	public String registerMem(MemberDTO dto, Model model, MultipartFile profile) throws Exception {
		// ���ε�
		UUID uuid = UUID.randomUUID(); // ���� �̸� �ߺ� ����
		String saveName = uuid + "_" + profile.getOriginalFilename(); // UUID�� ���� �����̸��� ��ü�� ����
		File saveFile = new File(uploadPath + File.separator + "img" + File.separator + "profile", saveName);// ������ ����
																												// �̸� ,
																												// ������
																												// ���� �̸�
		try {
			profile.transferTo(saveFile); // ���ε� ���Ͽ� saveFile�̶�� ������ ������
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		dto.setImg(File.separator + "profile" + File.separator + saveName);

		service = ac.getBean("memberServiceImpl", MemberServiceImpl.class);
		model.addAttribute("dto", dto);
		service.execute(model);

		return "home";
	}

	@RequestMapping("lostPw")
	@ResponseBody
	public String lostPw(MemberDTO dto) throws Exception {
		int result = 0;
		char[] charSet = { '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'e', 'F', 'G', 'h', 'I',
				'j', 'K', 'L', 'm', 'O', 'p', 'Q', 'r', 'S', 't' };

		StringBuffer newKey = new StringBuffer();
		for (int i = 0; i < 10; i++) {
			int idx = (int) (charSet.length * Math.random());
			newKey.append(charSet[idx]);
		}
		String sentpw = newKey.toString();
		dto.setPassword(sentpw);
		System.out.println("����� �̸���:" + dto.getUserEmail());
		System.out.println("�ӽ� ��й�ȣ:" + dto.getPassword());
		String title = "JSInc. �ӽ� ��й�ȣ �߱� �ȳ� �Դϴ�.";
		String body = "";
		body += "<div align='center' style='border:1px solid black;' font-family:verdana'>";
		body += "<h3 style='color:blue;'>������ �ӽ� ��й�ȣ �Դϴ�. �α��� �� ��й�ȣ�� �����ϼ���.</h3>";
		body += "<p>�ӽ� ��й�ȣ: <strong>" + sentpw + "</strong></p></div>";
		Map<String, Object> sendRs = mailService.send(dto.getUserEmail(), title, body);

		service = ac.getBean("memberServiceImpl", MemberServiceImpl.class);
		service.sentPw(dto);

		return (String) sendRs.get("msg");

	}

	@RequestMapping("lockScreen")
	public String lockScreen() {
		return "lockScreen";
	}

	@RequestMapping("lock")
	public String lock(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		ServletContext application = session.getServletContext();
		MemberDTO dto = (MemberDTO) application.getAttribute("user");
		if (dto.getPassword().equals(request.getParameter("password"))) {
			return "redirect:index";
		}
		return "redirect:lockScreen";
	}

}
