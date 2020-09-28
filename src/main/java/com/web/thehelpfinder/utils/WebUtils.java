package com.web.thehelpfinder.utils;


import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import javax.xml.bind.DatatypeConverter;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
@Transactional // Used to open the transaction you saved and then close it.
public class WebUtils {


	@Autowired
	private JavaMailSender sender;

	
	@Autowired
	HttpServletRequest request;

	public void sendMail(String from, String msg, String subject) {
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		try {
			helper.setFrom(from);
			helper.setTo("helpfinderstl@gmail.com");
			helper.setText(msg + "  FROM: " + from);
			helper.setSubject(subject);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		try {
			sender.send(message);
		} catch (MailException e) {
			e.printStackTrace();
		}
	}

	public String md5(String filename) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		String hash = DatatypeConverter
				.printHexBinary(MessageDigest.getInstance("MD5").digest(filename.getBytes("UTF-8")));
		return hash;
	}

}
