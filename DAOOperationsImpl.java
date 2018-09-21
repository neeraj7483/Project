package com.service.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.service.controller.Item;
import com.service.model.Address;
import com.service.model.Customer;
import com.service.model.Dealer;
import com.service.model.Manager;
import com.service.utility.ConnectionProvider;

import oracle.net.aso.i;

public class DAOOperationsImpl implements DAOOperations {

	public Customer checkCustomer(String id, String password) throws SQLException {
		Customer customer = null;
		Address address = new Address();
		String query = "select * from customers c,customeraddress ca "
				+ "where c.customerid=ca.userid and c.customerid=? and c.password=?";
		Connection con = ConnectionProvider.getConnection();
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, id);
		ps.setString(2, password);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			customer = new Customer();
			customer.setCustomerId(rs.getString(1));
			customer.setPassword(rs.getString(2));
			customer.setName(rs.getString(3));
			customer.setEmail(rs.getString(4));
			customer.setLocation(rs.getString(5));
			customer.setContactNo(rs.getString(6));
			address.setStreetAddress(rs.getString(8));
			address.setState(rs.getString(9));
			address.setPincode(rs.getString(10));
			customer.setAddress(address);
		}
		return customer;
	}

	public Dealer checkDealer(String id, String password) throws SQLException {
		Dealer dealer = null;
		Address address = new Address();
		String query = "select * from dealers d,dealeraddress da "
				+ "where d.dealerid=da.userid and d.dealerid=? and d.password=?";
		Connection con = ConnectionProvider.getConnection();
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, id);
		ps.setString(2, password);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			dealer = new Dealer();
			dealer.setDealerId(rs.getString(1));
			dealer.setPassword(rs.getString(2));
			dealer.setName(rs.getString(3));
			dealer.setEmail(rs.getString(4));
			dealer.setLocation(rs.getString(5));
			dealer.setContactNo(rs.getString(6));
			dealer.setRating(rs.getInt(7));
			address.setStreetAddress(rs.getString(9));
			address.setState(rs.getString(10));
			address.setPincode(rs.getString(11));
			dealer.setAddress(address);

		}
		return dealer;
	}

	public Manager checkManager(String id, String password) {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean registerDealer(Dealer dealer) throws SQLException {
		String query1 = "insert into dealers values(?,?,?,?,?,?,?)";
		String query2 = "insert into dealeraddress values(?,?,?,?)";
		Connection con = ConnectionProvider.getConnection();
		PreparedStatement ps1 = con.prepareStatement(query1);
		ps1.setString(1, dealer.getDealerId().toLowerCase());
		ps1.setString(2, dealer.getPassword());
		ps1.setString(3, dealer.getName());
		ps1.setString(4, dealer.getEmail());
		ps1.setString(5, dealer.getLocation());
		ps1.setString(6, dealer.getContactNo());
		ps1.setInt(7, 3);
		PreparedStatement ps2 = con.prepareStatement(query2);
		ps2.setString(1, dealer.getDealerId().toLowerCase());
		ps2.setString(2, dealer.getAddress().getStreetAddress());
		ps2.setString(3, dealer.getAddress().getState());
		ps2.setString(4, dealer.getAddress().getPincode());
		int i = ps1.executeUpdate();
		i = ps2.executeUpdate();
		if (i > 0)
			return true;
		else
			return false;
	}

	public boolean registerCustomer(Customer customer) throws SQLException {
		String query1 = "insert into customers values(?,?,?,?,?,?)";
		String query2 = "insert into customeraddress values(?,?,?,?)";
		Connection con = ConnectionProvider.getConnection();
		PreparedStatement ps1 = con.prepareStatement(query1);
		ps1.setString(1, customer.getCustomerId().toLowerCase());
		ps1.setString(2, customer.getPassword());
		ps1.setString(3, customer.getName());
		ps1.setString(4, customer.getEmail());
		ps1.setString(5, customer.getLocation());
		ps1.setString(6, customer.getContactNo());
		PreparedStatement ps2 = con.prepareStatement(query2);
		ps2.setString(1, customer.getCustomerId().toLowerCase());
		ps2.setString(2, customer.getAddress().getStreetAddress());
		ps2.setString(3, customer.getAddress().getState());
		ps2.setString(4, customer.getAddress().getPincode());
		int i = ps1.executeUpdate();
		i = ps2.executeUpdate();
		if (i > 0)
			return true;
		else
			return false;

	}

	public boolean checkUserId(String id) throws SQLException {
		String query1 = "select dealerId from dealers where dealerId=?";
		String query2 = "select customerId from customers where customerId=?";
		Connection con = ConnectionProvider.getConnection();
		PreparedStatement ps1 = con.prepareStatement(query1);
		ps1.setString(1, id);
		PreparedStatement ps2 = con.prepareStatement(query2);
		ps2.setString(1, id);
		ResultSet rs1 = ps1.executeQuery();
		ResultSet rs2 = ps2.executeQuery();
		if ((rs1.next() == true) || (rs2.next() == true)) {
			return false;
		} else
			return true;
	}

	public ResultSet getMessage(String id) throws SQLException {
		String query = "select * from inbox where inbox_user_id=?";
		Connection con = ConnectionProvider.getConnection();
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();
		return rs;
	}

	public List<Item> getUnsoldItems(String dealerId) throws SQLException {
		List<Item> itemList = new ArrayList<Item>();
		String query = "select i.itemid,i.name,i.price,oi.quantity from items i, "
				+ "order_item_quantity oi where i.itemId in(select itemId from order_item_quantity "
				+ "where orderId in(select orderId from orders where dealerid=?)) and i.itemid=oi.itemid";
		Connection con = ConnectionProvider.getConnection();
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, dealerId);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Item item = new Item(rs.getString(1), rs.getString(2), rs.getFloat(3), rs.getInt(4));
			itemList.add(item);
		}
		return itemList;
	}

	public List<Item> getDealerStock(String dealerId) throws SQLException {
		List<Item> itemList = new ArrayList<Item>();
		String query = "select  i.itemid,i.name,i.price,d.quantity from items i,dealerstock d "
				+ "where dealerid=? and i.itemid=d.itemid";
		Connection con = ConnectionProvider.getConnection();
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, dealerId);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Item item = new Item(rs.getString(1), rs.getString(2), rs.getFloat(3), rs.getInt(4));
			itemList.add(item);
		}
		return itemList;
	}

	public ResultSet getIncompleteOrder(String dealerId) throws SQLException {
		String query = "select o.orderid,o.customerid,oi.itemid,i.name,i.price from orders o , order_item_quantity oi,items i "
				+ "where oi.orderid = o.orderid and i.itemid=oi.itemid and o.status=? and o.dealerid=?";
		Connection con = ConnectionProvider.getConnection();
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, "0");
		ps.setString(2, dealerId);
		ResultSet rs = ps.executeQuery();
		return rs;
	}

}
