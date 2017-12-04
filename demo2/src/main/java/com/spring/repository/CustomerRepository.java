package com.spring.repository;

import java.util.List;

import com.spring.domain.Customer;

public interface CustomerRepository {
public List<Customer> getAllCustomer();
public Customer findByUsername(String username);
public void updatePassword(String password, String email);
public void addCustomer(Customer customer);
}
