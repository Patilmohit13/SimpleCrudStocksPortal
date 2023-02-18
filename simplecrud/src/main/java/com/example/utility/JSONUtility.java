package com.example.utility;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class JSONUtility {
	
	public static <T> String toJson(T object) {
		String datePattern = "dd/MM/yyyy hh:mm a";
		Gson gson = new GsonBuilder().serializeNulls().setDateFormat(datePattern).create();
		return gson.toJson(object);
	}

}
