package com.example.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.example.model.ShareLedger;

public interface ShareLedgerRepository extends CrudRepository<ShareLedger, Long> {
		Optional<List<ShareLedger>> findByLoginId(String loginId);
		Optional<ShareLedger> findByLoginIdAndShareName(String loginId, String ShareName);
}
