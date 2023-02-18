package com.example.service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.model.Share;
import com.example.repository.OrderLedgerRepository;
import com.example.repository.ShareRepository;

@Service
public class ShareService {
	
	
	@Autowired
	ShareRepository shareRepository;
	
	public List<Share> getAllShare() {
		List<Share> share = new ArrayList<Share>();
		shareRepository.findAll().forEach(share1 -> share.add(share1));
		return share;
	}

	public Share getShareById(int id) {
		return shareRepository.findById(id).get();
	}
	
	public Share getShareByName(String loginId) {
		return shareRepository.findByName(loginId).get();
	}
	
	public Stream<Object> getListOfShares(){
		return getAllShare().stream().map(s->s.getName());
	}
	
	
	public void saveOrUpdate(Share share) {
		shareRepository.save(share);
	}

	public void delete(int id) {
		shareRepository.deleteById(id);
	}

	public void update(Share share, int shareno) {
		shareRepository.save(share);
	}
	
	public void updatePrice(int shareId, int newPrice) {
		Share s = shareRepository.findById(shareId).get();
		s.setPrice(newPrice);
		shareRepository.save(s);
	}
}
