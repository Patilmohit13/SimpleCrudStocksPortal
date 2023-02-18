package com.example.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.model.User;
import com.example.service.UserService;

@RestController
@RequestMapping("/service/user")
public class UserController {

	@Autowired
	UserService userService;

//creating a get mapping that retrieves all the users detail from the database   
	@GetMapping("/get")
	private List<User> getAllUser() {
		return userService.getAllUser();
	}

//creating a get mapping that retrieves the detail of a specific user  
	@GetMapping("/get/{userid}")
	private ResponseEntity<?> getUser(@PathVariable("userid") int userid) {
		ResponseEntity<?> response;
		try {
		response =ResponseEntity.ok(userService.getUserById(userid));
		}
		catch (Exception e) {
			response = ResponseEntity.ok(e.getMessage());
		}
		return response;
	}

//creating a delete mapping that deletes a specified user  
	@DeleteMapping("/user/{userno}")
	private void deleteUser(@PathVariable("userno") int userid) {
		userService.delete(userid);
	}

//creating post mapping that post the user detail in the database  
	@PostMapping("/add")
	private int saveUser(@RequestBody User users) throws Exception {
		userService.saveOrUpdate(users);
		return users.getUserId();
	}

//creating put mapping that updates the user detail   
	@PutMapping("/update")
	private User update(@RequestBody User user) throws Exception {
		userService.saveOrUpdate(user);
		return user;
	}
	
	@PostMapping("/login")
	public String login(@RequestBody String jsonString, HttpServletRequest request) throws Exception {
		JSONObject output = new JSONObject();
		try {
			JSONObject jsonObject = new JSONObject(jsonString);
			User user = userService.getUser(jsonObject.optString("loginId"));
			//System.out.println(user.getPassword() == Integer.parseInt((jsonObject.optString("password"))));
			if (user.getLoginId() == null || user.getPassword() != Integer.parseInt((jsonObject.optString("password")))) {
				output.put("ERROR", "Wrong LoginId or Password");
			} else {
				output.put("loginId",user.getLoginId());
			}

		} catch (Exception e) {
			output.put("ERROR", e.getMessage());
		}
		return output.toString();
	}
	
	
	@PostMapping("/signup")
	public String signup(@RequestBody String jsonString, HttpServletRequest request) throws JSONException{
		JSONObject output = new JSONObject();
		
			JSONObject jsonObject = new JSONObject(jsonString);
			User newUser = new User();
			System.out.println(jsonObject.optString("name"));
			newUser.setName(jsonObject.optString("name"));
			newUser.setLoginId(jsonObject.optString("loginId"));
			newUser.setUniqueId(jsonObject.optString("uniqueId"));
			newUser.setPassword(Integer.parseInt(jsonObject.optString("password")));
			newUser.setBalance(Integer.parseInt(jsonObject.optString("balance")));
			try {
			userService.saveOrUpdate(newUser);
			output.put("SUCCESS", "User Registered");
		} catch (Exception e) {
			//e.printStackTrace();
			output.put("ERROR", e.getMessage());
		}
		return output.toString();
	}
}
