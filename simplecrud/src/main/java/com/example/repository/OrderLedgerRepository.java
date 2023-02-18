package com.example.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.model.OrderLedger;
import com.example.model.User;

@Repository
public interface OrderLedgerRepository extends CrudRepository<OrderLedger, Integer>{
	Optional<List<OrderLedger>> findByLoginId(String loginId);
	Optional<List<OrderLedger>> findByLoginIdAndShare(String loginId, String share);
}
