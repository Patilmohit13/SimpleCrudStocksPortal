package com.example.utility;

import java.util.Random;

public class Utility {
	
	public static String generateRandomPassword(int length) {
		String capitalCaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		String lowerCaseLetters = "abcdefghijklmnopqrstuvwxyz";
		String numbers = "1234567890";
		String combinedChars = capitalCaseLetters + lowerCaseLetters + numbers;

		Random random = new Random();
		char[] password = new char[length];

		password[0] = lowerCaseLetters.charAt(random.nextInt(lowerCaseLetters.length()));
		password[1] = capitalCaseLetters.charAt(random.nextInt(capitalCaseLetters.length()));
		password[2] = numbers.charAt(random.nextInt(numbers.length()));

		StringBuffer pas = new StringBuffer();
		pas.append(password[0]);
		pas.append(password[1]);
		pas.append(password[2]);
		for (int i = 3; i < length; i++) {
			pas.append(combinedChars.charAt(random.nextInt(combinedChars.length())));
		}
		return pas.toString();
	}

}
