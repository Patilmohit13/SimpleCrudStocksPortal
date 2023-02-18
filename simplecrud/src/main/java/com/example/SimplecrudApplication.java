package com.example;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class SimplecrudApplication {

	public static void main(String[] args) {
		try {
			SpringApplication.run(SimplecrudApplication.class, args);
		} catch (Throwable e) {
			if (e.getClass().getName().contains("SilentExitException")) {
				System.out.println("Spring is restarting the main thread - See spring-boot-devtools");
				System.out.println("Application Started");
			} else {
				System.out.println("Application crashed!" + e);
			}
		}
	}

}
