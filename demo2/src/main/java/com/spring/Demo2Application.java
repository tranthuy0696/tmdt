package com.spring;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.fasterxml.jackson.core.JsonProcessingException;

@SpringBootApplication
public class Demo2Application {

	public static void main(String[] args) throws JsonProcessingException {
		SpringApplication.run(Demo2Application.class, args);
		
	}
}
