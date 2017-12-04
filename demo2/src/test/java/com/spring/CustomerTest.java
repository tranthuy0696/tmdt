package com.spring;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.spring.repository.CustomerRepository;

@RunWith(SpringRunner.class)
@SpringBootTest
public class CustomerTest {
	@Autowired
	private CustomerRepository customerRepository;
	
	@Test
	public void test() {
		assertEquals(1, customerRepository.getAllCustomer().size());
		System.out.println( customerRepository.getAllCustomer().get(0).getAuthority());
	}
	

	@Test
	public void testFindUser() {
		assertEquals( customerRepository.getAllCustomer().get(0).getUsername(), customerRepository.findByUsername("tttthuy").getUsername());
		System.out.println( customerRepository.findByUsername("tttthuy"));
	}



}
