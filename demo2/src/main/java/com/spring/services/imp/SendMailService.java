package com.spring.services.imp;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.repository.CustomerRepository;
import com.spring.services.ISendMailService;


@Service
public class SendMailService implements ISendMailService{

	@Autowired
	private JavaMailSender javaMailSender;
	@Autowired
    private PasswordEncoder passwordEncoder;
	@Autowired
	private CustomerRepository customerRepository;
	public void sendMail(String email) throws MailException {
		SimpleMailMessage simpleMail = new SimpleMailMessage();
		simpleMail.setTo(email);
		simpleMail.setSubject("Thay đổi mật khẩu");
		Random rd = new Random();
		String password_new=String.valueOf(randomInteger(10000000, 99999999, rd));
		simpleMail.setText("Mật khẩu mới của bạn là: " +password_new);
		javaMailSender.send(simpleMail);
		customerRepository.updatePassword(passwordEncoder.encode(password_new), email);
	}

	private static long randomInteger(long start, long end, Random random) {
		long range = end - start + 1;
		long fraction = (long) (range * random.nextDouble());
		long randomNumber = fraction + start;
		return randomNumber;
	}
	

}
