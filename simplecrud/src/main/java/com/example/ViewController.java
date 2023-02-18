package com.example;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.User;
import com.example.service.UserService;
import com.example.utility.JSONUtility;
import com.example.service.OrderLedgerService;
import com.example.service.SellShareService;
import com.example.service.ShareLedgerService;
import com.example.service.ShareService;
import com.example.model.OrderLedger;
import com.example.model.SellShare;
import com.example.model.Share;
import com.example.model.ShareLedger;

@Controller
public class ViewController {

	@Autowired
	UserService userService;
	@Autowired
	ShareService shareService;
	
	@Autowired
	OrderLedgerService orderLedgerService;
	
	@Autowired
	ShareLedgerService shareLedgerService;
	
	@Autowired
	SellShareService sellShareService;
	
	@RequestMapping("/")
	public ModelAndView goHome(HttpServletRequest request) throws Exception {
		ModelAndView model = new ModelAndView();
		model = new ModelAndView("login");
		return model;
	}

	@RequestMapping("/home/{loginId}")
	public ModelAndView home(@PathVariable("loginId") String loginId, HttpServletRequest request) throws Exception {
		ModelAndView model = new ModelAndView();
		model = new ModelAndView("order");
		try {
			User user = userService.getUser(loginId);
			List<Share> shares = shareService.getAllShare();
			model.addObject("shareList", shares);
			model.addObject("shares", JSONUtility.toJson(shares));
			model.addObject("user", JSONUtility.toJson(user));
		} catch (Exception e) {
			
		}
		return model;
		
	}
	//**FEATURE ADDED**
	//USER CAN VIEW HIS ORDER HISTROY AFTER EVERY ORDER PLACED
	@RequestMapping("/home/{loginId}/Dashboard/")
	public ModelAndView orderplaced(@PathVariable("loginId") String loginId, HttpServletRequest request) throws Exception {
		ModelAndView model = new ModelAndView();
		model = new ModelAndView("userDashboard");
		try {
			User user = userService.getUser(loginId);
			List<Share> shareList = shareService.getAllShare();
			List<OrderLedger> ol = orderLedgerService.get(loginId);
			List<ShareLedger> sl = shareLedgerService.getShareLedgerByLoginId(loginId);
			List<SellShare> ss = sellShareService.getSellShareByLoginId(loginId);
			model.addObject("sharelist",shareList);
			model.addObject("shares",sl);
			model.addObject("order",ol);
			model.addObject("sellShares", ss);
			model.addObject("user",user);
			
		} catch (Exception e) {}
		return model;
	}
	
	@RequestMapping("/home/signup")
	public ModelAndView signup(HttpServletRequest request) throws Exception {
		ModelAndView model = new ModelAndView();
		model = new ModelAndView("sign-up");
		return model;
	}
	
	@RequestMapping("/home/share/{loginId}")
	public ModelAndView sellShare(@PathVariable("loginId") String loginId, HttpServletRequest request) throws Exception {
		User user = userService.getUser(loginId);
		List<Share> shareList = shareService.getAllShare();
		List<String> share = (List<String>) shareLedgerService.getShareListByLoginId(loginId);
		ModelAndView model = new ModelAndView();
		model = new ModelAndView("sellform");
		model.addObject("sharelist",shareList);
		model.addObject("shares", JSONUtility.toJson(share));
		model.addObject("user", JSONUtility.toJson(user));
		return model;
	}
	
	

}
	
//
//@RequestMapping("/employ")
//public ModelAndView employeeHome(HttpServletRequest request) throws Exception {
//ModelAndView model = new ModelAndView();
//model = new ModelAndView("employeecrud");
//return model;
//}
//
//@RequestMapping("/gadi")
//public ModelAndView vehicleHome(HttpServletRequest request) throws Exception {
//ModelAndView model = new ModelAndView();
//model = new ModelAndView("vehiclecrud");
//return model;
//}
//}
//
