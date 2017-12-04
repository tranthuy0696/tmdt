package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.domain.Customer;
import com.spring.exception.TmdtException;
import com.spring.repository.CustomerRepository;

@RestController
@RequestMapping("/customer")
public class CustomerController {
	@Autowired
	private CustomerRepository customerRepository;

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public void addCustomer(@RequestBody Customer customer) throws TmdtException {
		customerRepository.addCustomer(customer);

	}

}
