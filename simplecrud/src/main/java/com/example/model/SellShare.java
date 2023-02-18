package com.example.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class SellShare {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long sellShareId;
	
	private String loginId;
	
	private String shareName;
	
	private int minSellPrice;
	
	private String status = "NOT SOLD";

	public Long getSellShareId() {
		return sellShareId;
	}

	public void setSellShareId(Long sellShareId) {
		this.sellShareId = sellShareId;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getShareName() {
		return shareName;
	}

	public void setShareName(String shareName) {
		this.shareName = shareName;
	}

	public int getMinSellPrice() {
		return minSellPrice;
	}

	public void setMinSellPrice(int minSellPrice) {
		this.minSellPrice = minSellPrice;
	}

	public SellShare() {
		this.setStatus("NOT SOLD");
	}
	public SellShare(String loginId, String shareName, int minSellPrice) {
		
		this.loginId = loginId;
		this.shareName = shareName;
		this.minSellPrice = minSellPrice;
		this.setStatus("NOT SOLD");
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	

}
