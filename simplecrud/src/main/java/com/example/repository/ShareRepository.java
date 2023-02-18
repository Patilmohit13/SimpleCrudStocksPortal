package com.example.repository;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.model.Share;

@Repository
public interface ShareRepository extends CrudRepository<Share, Integer>{

	Optional<Share> findByName(String share);

}
