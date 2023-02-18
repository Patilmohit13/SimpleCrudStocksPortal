package com.example.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.example.model.OrderLedger;
import com.example.model.SellShare;

public interface SellShareRepository extends CrudRepository<SellShare, Long> {
	Optional<SellShare> findByLoginIdAndShareName(String loginId, String share);
	Optional<List<SellShare>> findByLoginId(String loginId);
}
