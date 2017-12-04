package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.mail.MailException;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring.exception.TmdtException;
import com.spring.services.ISendMailService;


@RestController
@RequestMapping("/sendEmail")
public class SendMailController {
	@Autowired
	private ISendMailService mailService;
	@RequestMapping(value="",method = RequestMethod.GET)
	public void sendMail(@RequestParam( "email" ) String email ) throws TmdtException {
		try {
			mailService.sendMail(email);
		}
		catch (MailException e) {
			throw new TmdtException("Không gửi được mail");
		}
		
	}

}
