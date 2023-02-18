package com.example.service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.model.SellShare;
import com.example.repository.SellShareRepository;

@Service
public class SellShareService {
		
	@Autowired
	SellShareRepository sellShareRepository;
	
	public List<SellShare> getAllSellShare() {
		List<SellShare> sellShares = new ArrayList<SellShare>();
		sellShareRepository.findAll().forEach(share1 -> sellShares.add(share1));
		return sellShares;
	}

	public SellShare getSellShareById(Long id) {
		return sellShareRepository.findById(id).get();
	}
	
	public List<SellShare> getSellShareByLoginId(String loginId) {
		return sellShareRepository.findByLoginId(loginId).get();
	}
	
	public List<SellShare> getUnsoldShare() {
//		System.out.println(getAllSellShare().stream().filter(s->s.getShareName().equals("NOT SOLD")));
//		Stream<SellShare> data= getAllSellShare().stream().filter(s->s.getStatus().equals("NOT SOLD"));
		return  getAllSellShare().stream().filter(s->s.getStatus().equals("NOT SOLD")).collect(Collectors.toList());
	}
		
	public SellShare saveOrUpdate(SellShare sellShare) {
		return sellShareRepository.save(sellShare);
	}

	public void delete(Long id) {
		sellShareRepository.deleteById(id);
	}

	public SellShare getSellShareByShareNameAndLoginId(String loginId, String shareName){
		return sellShareRepository.findByLoginIdAndShareName(loginId, shareName).orElse(null);
	}
	
	public SellShare updateSellShareStatus(String loginId, String shareName, String status){
		SellShare newSellShare = getSellShareByShareNameAndLoginId(loginId, shareName);
		if(newSellShare != null) {
			 newSellShare.setStatus(status);
			 return saveOrUpdate(newSellShare);
		}
		return null;
		
	}
	
	
}
