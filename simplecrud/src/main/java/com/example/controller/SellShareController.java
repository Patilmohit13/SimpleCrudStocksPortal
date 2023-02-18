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

import com.example.model.SellShare;
import com.example.model.Share;
import com.example.model.ShareLedger;
import com.example.model.User;
import com.example.service.OrderLedgerService;
import com.example.service.SellShareService;
import com.example.service.UserService;

@RestController
@RequestMapping("/home/share/")
public class SellShareController {
	@Autowired 
	SellShareService sellShareService;
	
	@Autowired
	OrderLedgerService orderLedgerService;
	
	//creating a get mapping that retrieves all the shares detail from the database   
	@GetMapping("/get")
	private List<SellShare> getAllShare() {
		return sellShareService.getAllSellShare();
	}

//creating a get mapping that retrieves the detail of a specific share  
	@GetMapping("/get/{sellShareid}")
	private SellShare getShare(@PathVariable("sellShareId") Long sellShareId) {
		return sellShareService.getSellShareById(sellShareId);
	}

//creating a delete mapping that deletes a specified share  
	@DeleteMapping("/share/{sellShareId}")
	private void deleteShare(@PathVariable("sellShareId") Long sellShareId) {
		sellShareService.delete(sellShareId);
	}

	@PostMapping("{loginId}/add")
	public String addSellShare(@RequestBody String jsonString, HttpServletRequest request) throws Exception {
		JSONObject output = new JSONObject();
		try {
			JSONObject jsonObject = new JSONObject(jsonString);
			SellShare sellShare = new SellShare();
			String share = jsonObject.optString("shareName");
			String userId = jsonObject.optString("loginId");
			sellShare.setShareName(jsonObject.optString("shareName"));
			sellShare.setLoginId(jsonObject.optString("loginId"));
			sellShare.setMinSellPrice(Integer.parseInt(jsonObject.optString("minSellPrice")));
			sellShareService.saveOrUpdate(sellShare);
			output.put("SUCCESS", " Share Registered for sale");
		} catch (Exception e) {
			e.printStackTrace();
			output.put("ERROR", e.getMessage());
		}
		return output.toString();
	}
		 
	
	@GetMapping("/get/{loginId}/{share}")
	private SellShare getSellShareByShareNameAndLoginId(@PathVariable("loginId") String loginId, @PathVariable("share") String shareName){
		 return sellShareService.getSellShareByShareNameAndLoginId(loginId , shareName);
	}
	
}
