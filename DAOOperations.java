package com.service.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.service.controller.Item;
import com.service.model.Customer;
import com.service.model.Dealer;
import com.service.model.Manager;

public interface DAOOperations {

	public Customer checkCustomer(String id,String password) throws SQLException;
	public Dealer checkDealer(String id,String password) throws SQLException;
	public Manager checkManager(String id,String password);
	public boolean registerDealer(Dealer dealer) throws SQLException;
	public boolean registerCustomer(Customer customer) throws SQLException;
	public boolean checkUserId(String id) throws SQLException;
	public ResultSet getMessage(String id) throws SQLException;
	public List<Item> getUnsoldItems(String orderId) throws SQLException;
	public List<Item> getDealerStock(String dealerId) throws SQLException;
	public ResultSet getIncompleteOrder(String dealerId) throws SQLException;
}
