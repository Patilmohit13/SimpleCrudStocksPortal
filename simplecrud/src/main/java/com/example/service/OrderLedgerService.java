package com.example.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.model.OrderLedger;
import com.example.repository.OrderLedgerRepository;

@Service
public class OrderLedgerService {

	@Autowired
	OrderLedgerRepository orderLedgerRepository; // injects the OrderLedgerRepository dependency
	
	@Autowired
	ShareService shareService; // injects the ShareService dependency
	
	// returns all OrderLedger objects in the database as a list
	public List<OrderLedger> getAllOrderLedger() {
		List<OrderLedger> orderLedger = new ArrayList<>();
		orderLedgerRepository.findAll().forEach(ol-> orderLedger.add(ol));
		return orderLedger;
	}
	
	// returns a list of OrderLedger objects associated with the specified loginId
	public  List<OrderLedger> get(String loginId) {
		Optional<List<OrderLedger>> orderLedger = orderLedgerRepository.findByLoginId(loginId);
		return orderLedger.get();
	}
	
	// returns a list of unique share names associated with the specified loginId
	public List<String> getShareListByLoginId(String loginId){
		Stream<String> lis =  get(loginId).stream().map(i->i.getShare()).distinct();
		return (List<String>) lis;
	}
	
	// returns a list of OrderLedger objects associated with the specified loginId and share name
	public List<OrderLedger> getByLoginIdAndShare(String loginId, String share){
		return orderLedgerRepository.findByLoginIdAndShare(loginId, share).get();
	}

	// returns the OrderLedger object with the specified id
	public OrderLedger getOrderLedgerById(int id) {
		return orderLedgerRepository.findById(id).get();
	}

	// saves or updates the specified OrderLedger object in the database
	public void saveOrUpdate(OrderLedger orderLedger) {
		orderLedgerRepository.save(orderLedger);
	}

	// deletes the OrderLedger object with the specified id from the database
	public void delete(int id) {
		orderLedgerRepository.deleteById(id);
	}

	// updates the specified OrderLedger object with the specified orderLedgerNo in the database
	public void update(OrderLedger orderLedger, int orderLedgerno) {
		orderLedgerRepository.save(orderLedger);
	}
}
