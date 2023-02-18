package com.example.service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.model.User;
import com.example.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	UserRepository userRepository;
	
	public List<User> getAllUser() {
		List<User> user = new ArrayList<User>();
		userRepository.findAll().forEach(user1 -> user.add(user1));
		return user;
	}

	public User getUserById(int id) throws Exception {
		return userRepository.findById(id).orElseThrow(()->new Exception("User not present for this Login Id"));
	}
	
	public User getUser(String loginId) throws Exception {
		return userRepository.findByLoginId(loginId).orElseThrow(()->new Exception("User not present for this Login Id"));
	}

	public void saveOrUpdate(User user) throws Exception {
		
		if(getAllUser().stream().map(u->u.getLoginId()).anyMatch(i->i.equals(user.getLoginId())))
			throw new Exception("Login Id already exist");
		else if(getAllUser().stream().map(u->u.getUniqueId()).anyMatch(i->i.equals(user.getUniqueId())))
			throw new Exception("UniqueId already exist");
		else
			userRepository.save(user);
	}

	public void delete(int id) {
		userRepository.deleteById(id);
	}
	
	public void update(User user, int userId ) {
		userRepository.save(user);
	}

	public void updateBalance(String loginId, int price ) {
		User user = userRepository.findByLoginId(loginId).get();
		user.setBalance(price);
		userRepository.save(user);
	}
}
