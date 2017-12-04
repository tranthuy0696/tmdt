package com.spring.repository.imp;

import java.util.Collections;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.spring.domain.Customer;
import com.spring.mapper.CustomerMapper;
import com.spring.repository.CustomerRepository;
@Repository
public class CustomerRepositoryImp implements CustomerRepository{
	@Autowired
    private PasswordEncoder passwordEncoder;
	private static final Logger LOGGER = LoggerFactory.getLogger(CustomerRepositoryImp.class);

	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	@Override
	public List<Customer> getAllCustomer() {
		SqlSession session=sqlSessionFactory.openSession();
		List<Customer> result=Collections.emptyList();
		try {
			CustomerMapper customerMapper=session.getMapper(CustomerMapper.class);
			result=customerMapper.getAllCustomer();
		}
		catch(Exception e) {
			LOGGER.error(e.getMessage());
		}
		finally {
			session.close();
		}
		return result;
	}
	@Override
	public Customer findByUsername(String username) {
		SqlSession session=sqlSessionFactory.openSession();
		Customer customer=null;
		try {
			CustomerMapper customerMapper=session.getMapper(CustomerMapper.class);
			customer=customerMapper.findByUsername(username);
		}
		catch(Exception e) {
			LOGGER.error(e.getMessage());
		}
		finally {
			session.close();
		}
		return customer;
	}
	@Override
	public void updatePassword(String password, String email) {
		SqlSession session=sqlSessionFactory.openSession();
		try {
			CustomerMapper customerMapper=session.getMapper(CustomerMapper.class);
			customerMapper.updatePassword(password, email);
		}
		catch(Exception e) {
			LOGGER.error(e.getMessage());
		}
		finally {
			session.close();
		}
		
		
	}
	@Override
	public void addCustomer(Customer customer) {
		SqlSession session=sqlSessionFactory.openSession();
		try {
			CustomerMapper customerMapper=session.getMapper(CustomerMapper.class);
			customer.setPassword(passwordEncoder.encode(customer.getPassword()));
			customerMapper.addCustomer(customer);
		}
		catch(Exception e) {
			LOGGER.error(e.getMessage());
		}
		finally {
			session.close();
		}
	}
	
}
