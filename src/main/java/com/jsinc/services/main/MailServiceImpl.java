package com.jsinc.services.main;

import java.util.HashMap;
import java.util.Map;

import org.apache.groovy.util.Maps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.jsinc.handler.MailHandler;

@Service
public class MailServiceImpl implements MailService {
	@Autowired
	private JavaMailSender sender;

	public Map<String, Object> send(String email, String title, String body) {

		MailHandler mail;
		try {
			mail = new MailHandler(sender);
			mail.setFrom("tjgowns12@gmail.com", "JS Inc.");
			mail.setTo(email);
			mail.setSubject(title);
			mail.setText(body);
			mail.send();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String resultCode = "S-1";
		String msg = "메일이 발송되었습니다.";
		Map<String, Object> rs = new HashMap();
		rs.put("resultCode", resultCode);
		rs.put("msg", msg);
		return rs;
	}
}
