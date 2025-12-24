package com.example.spring_nginx;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Value;
import java.net.InetAddress;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

@SpringBootApplication
@RestController
public class SpringNginxApplication {

	@Value("${server.port}")
	private String serverPort;

	public static void main(String[] args) {
		SpringApplication.run(SpringNginxApplication.class, args);
	}

	@GetMapping("/")
	public Map<String, Object> home() throws Exception {
		Map<String, Object> response = new HashMap<>();
		response.put("message", "Hello from Spring Boot!");
		response.put("port", serverPort);
		response.put("hostname", InetAddress.getLocalHost().getHostName());
		response.put("timestamp", LocalDateTime.now().toString());
		return response;
	}

	@GetMapping("/api/health")
	public Map<String, String> health() {
		Map<String, String> response = new HashMap<>();
		response.put("status", "UP");
		response.put("port", serverPort);
		return response;
	}

	@GetMapping("/api/users")
	public Map<String, Object> getUsers() {
		Map<String, Object> response = new HashMap<>();
		response.put("users", new String[]{"Alice", "Bob", "Charlie"});
		response.put("servedBy", "Instance on port " + serverPort);
		return response;
	}

	@PostMapping("/api/users")
	public Map<String, Object> createUser(@RequestBody Map<String, String> user) {
		Map<String, Object> response = new HashMap<>();
		response.put("message", "User created successfully");
		response.put("user", user);
		response.put("servedBy", "Instance on port " + serverPort);
		return response;
	}

	@GetMapping("/api/slow")
	public Map<String, Object> slowEndpoint() throws InterruptedException {
		// Simulate slow operation
		Thread.sleep(2000);
		Map<String, Object> response = new HashMap<>();
		response.put("message", "This was a slow operation");
		response.put("port", serverPort);
		return response;
	}
}