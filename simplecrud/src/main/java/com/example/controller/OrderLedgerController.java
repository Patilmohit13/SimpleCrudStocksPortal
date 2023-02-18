package com.example.controller;

import java.util.ArrayList;
import java.util.List;

import org.codehaus.jettison.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.model.OrderLedger;
import com.example.model.ShareLedger;
import com.example.model.User;
import com.example.service.OrderLedgerService;
import com.example.service.ShareLedgerService;
import com.example.service.ShareService;
import com.example.service.UserService;

@RestController
@RequestMapping("/service/orderLedger")
public class OrderLedgerController {

	@Autowired
	OrderLedgerService orderLedgerService;
	@Autowired
	UserService userService;
	
	@Autowired
	ShareService shareService;
	
	@Autowired
	ShareLedgerService shareLedgerService;

//creating a get mapping that retrieves all the orderLedgers detail from the database   
	@GetMapping("/get")
	private List<OrderLedger> getAllOrderLedger() {
		return orderLedgerService.getAllOrderLedger();
	}

//creating a get mapping that retrieves the detail of a specific orderLedger  
	@GetMapping("/get/{orderLedgerid}")
	private OrderLedger getOrderLedger(@PathVariable("orderLedgerno") int orderLedgerid) {
		return orderLedgerService.getOrderLedgerById(orderLedgerid);
	}

//creating a delete mapping that deletes a specified orderLedger  
	@DeleteMapping("/orderLedger/{orderLedgerno}")
	private void deleteOrderLedger(@PathVariable("orderLedgerno") int orderLedgerid) {
		orderLedgerService.delete(orderLedgerid);
	}

//creating post mapping that post the orderLedger detail in the database  
	@PostMapping("/add")
	private int saveOrderLedger(@RequestBody OrderLedger orderLedgers) {
		orderLedgerService.saveOrUpdate(orderLedgers);
		return orderLedgers.getOrderId();
	}

//creating put mapping that updates the orderLedger detail   
	@PutMapping("/update")
	private OrderLedger update(@RequestBody OrderLedger orderLedger) {
		orderLedgerService.saveOrUpdate(orderLedger);
		return orderLedger;
	}
	
	
	@PostMapping(path = "/order")
	public String order(@RequestBody OrderLedger orderLedger) throws Exception {
		JSONObject output = new JSONObject();
		try {
			/**
			List<OrderLedger> orderLedgers = orderLedgerService.getAllOrderLedger();
			List<OrderLedger> userOrderLedgers = new ArrayList<>();
			for (OrderLedger orderLedger2 : orderLedgers) {
				//System.out.println(orderLedger.getLoginId());
				if (orderLedger.getLoginId().equals(orderLedger2.getLoginId())) {
					//System.out.println(orderLedger2.getLoginId());
					userOrderLedgers.add(orderLedger2);
					orderLedgerService.saveOrUpdate(orderLedger2);
				}
			}
			System.out.println(userOrderLedgers);
			int totalPurchase = 0;
			if (userOrderLedgers.isEmpty()) {
				orderLedgerService.saveOrUpdate(orderLedger);
			} else {
				for (OrderLedger order : userOrderLedgers) {
					//totalPurchase = totalPurchase + order.getTotalPurchase();
				}
				User user = userService.getUser(orderLedger.getLoginId());
				 System.out.println(orderLedger.getLoginId());
				//***BUG***:-int remainingAmount = 50000 - totalpurchase();
				//BUG FIX : checking with users current balance
				//int remainingAmount = user.getBalance() -totalPurchase;
				if ((orderLedger.getTotalPurchase()+totalPurchase) > user.getBalance()) {
					output.put("ERROR", "Not Enough Remaining Balance");
				} else {
					
					//BUG FIX:UPDATING USER BALANCE AFTER SUCCESSFULL PURCHASE
					//orderLedgerService.saveOrUpdate(orderLedger);
					int currBal = user.getBalance()-totalPurchase;
					System.out.println(currBal);
					user.setBalance(currBal);
					System.out.println(user.getBalance());
					userService.update(user,user.getUserId());
					System.out.println(user.getBalance());
					output.put("SUCCESS", "Order placed Successfully!");
				}
			}
		**/
			User user = userService.getUser(orderLedger.getLoginId());
			ShareLedger shareLedger = new ShareLedger();
			int userCurrBal = user.getBalance();
			if(userCurrBal < orderLedger.getTotalPurchase()) {
				output.put("ERROR", "Not Enough Remaining Balance");
			}
			else {
				user.setBalance(userCurrBal -  orderLedger.getTotalPurchase());
				userService.update(user, user.getUserId());
				orderLedgerService.saveOrUpdate(orderLedger);
				shareLedger.setLoginId(orderLedger.getLoginId());
				shareLedger.setShareName(orderLedger.getShare());
				shareLedger.setQuantity(orderLedger.getQuantity());
				shareLedgerService.saveOrUpdate(shareLedger);
				output.put("SUCCESS", "Order placed Successfully!");

			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			output.put("ERROR", "Error from Server: /orderLedger/order");
			return output.toString();
		}
		return output.toString();
	}
}
