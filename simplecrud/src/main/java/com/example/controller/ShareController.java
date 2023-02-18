package com.example.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

import com.example.model.Share;
import com.example.model.ShareLedger;
import com.example.service.ShareLedgerService;
import com.example.service.ShareService;

@RestController
@RequestMapping("/service/share")
public class ShareController {
	
	@Autowired
	ShareLedgerService shareLedgerService;
	
	@Autowired
	ShareService shareService;

//creating a get mapping that retrieves all the shares detail from the database   
	@GetMapping("/get")
	private List<Share> getAllShare() {
		return shareService.getAllShare();
	}

//creating a get mapping that retrieves the detail of a specific share  
	@GetMapping("/get/{shareid}")
	private Share getShare(@PathVariable("shareno") int shareid) {
		return shareService.getShareById(shareid);
	}

//creating a delete mapping that deletes a specified share  
	@DeleteMapping("/share/{shareno}")
	private void deleteShare(@PathVariable("shareno") int shareid) {
		shareService.delete(shareid);
	}

//creating post mapping that post the share detail in the database  
	@PostMapping("/add")
	private int saveShare(@RequestBody Share shares) {
		shareService.saveOrUpdate(shares);
		return shares.getShareId();
	}

//creating put mapping that updates the share detail   
	@PutMapping("/update")
	private Share update(@RequestBody Share share) {
		shareService.saveOrUpdate(share);
		return share;
	}
	
	@GetMapping("/get/{loginId}")
	private List<ShareLedger> getShareLedgers(@PathVariable("loginId") String loginId) {
		return shareLedgerService.getShareLedgerByLoginId(loginId);
	}
}
