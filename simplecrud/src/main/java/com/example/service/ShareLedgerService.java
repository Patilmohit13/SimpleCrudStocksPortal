package com.example.service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.model.OrderLedger;
import com.example.model.ShareLedger;
import com.example.repository.OrderLedgerRepository;
import com.example.repository.ShareLedgerRepository;
import com.example.repository.ShareRepository;

@Service
public class ShareLedgerService {
	@Autowired
	OrderLedgerRepository orderLedgerRepository;
	
	@Autowired
	ShareService shareService;
	
	@Autowired
	ShareLedgerRepository shareLedgerRepository;
	
	
	public ShareLedger saveOrUpdate(ShareLedger shareLedger) {
		ShareLedger newShareLedger = getShareLedgerByLoginIdAndShareName(shareLedger.getLoginId(), shareLedger.getShareName());
		if(newShareLedger==null)
			return shareLedgerRepository.save(shareLedger);
		newShareLedger.setQuantity(newShareLedger.getQuantity()+shareLedger.getQuantity());
		return shareLedgerRepository.save(newShareLedger);	
	}
	
	
	public ShareLedger getShareLedgerByLoginIdAndShareName(String loginId, String ShareName){
		return shareLedgerRepository.findByLoginIdAndShareName(loginId, ShareName).orElse(null);
	}
	
		
	public List<ShareLedger> getShareLedgerByLoginId(String loginId){
		return shareLedgerRepository.findByLoginId(loginId).orElse(new ArrayList<>());
		/**
		List<String> shareList = shareService.getListOfShares();
		List<ShareLedger> shareLedgerList = new ArrayList<>();
		for(String s: shareList)
			shareLedgerList.add(new ShareLedger(LoginId, s, orderLedgerRepository
					.findByLoginIdAndShare(LoginId, s)
					.get().
					stream()
					.mapToInt(i->i.getTotalPurchase())
					.sum()));
         **/
	}
	
	public void deleteByLoginIdAndShareName(String loginId, String shareName) {
		ShareLedger newShareLedger = getShareLedgerByLoginIdAndShareName(loginId, shareName );
		if(newShareLedger!=null)
				shareLedgerRepository.delete(newShareLedger);
	}
	
	public Stream<String> getShareListByLoginId(String loginId){
		Stream<String> lis =  getShareLedgerByLoginId(loginId).stream().map(i->i.getShareName()).distinct();
		return lis;
	}
}
