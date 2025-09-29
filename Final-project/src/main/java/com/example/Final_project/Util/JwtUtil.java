package com.example.Final_project.Util;

import java.security.Key;
import java.util.Base64;
import java.util.Date;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class JwtUtil {
	
	private Key signinKey;

	public JwtUtil(@Value("${jwt.secret}") String secretKey) {
	 byte[] decode = Base64.getDecoder().decode(secretKey);
	 this.signinKey = Keys.hmacShaKeyFor(decode);
	}
	
	public String generateToken(String username) {
		return Jwts.builder()
				.setSubject(username)
				.setIssuedAt(new Date())
				.setExpiration(new Date(System.currentTimeMillis() + 86400000))
				.signWith(signinKey)
				.compact();
	}
}