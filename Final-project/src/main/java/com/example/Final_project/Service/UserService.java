package com.example.Final_project.Service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.Final_project.Exception.OurRuntimeException;
import com.example.Final_project.Repository.UserRepository;
import com.example.Final_project.RequestDto.UserRequestDto;
import com.example.Final_project.entity.User;
import com.example.Final_project.Util.JwtUtil;

import lombok.RequiredArgsConstructor;

public class UserService {

	private  UserRepository userRepository;
	private  PasswordEncoder passwordEncoder;
	private  JwtUtil jwtUtil;

	public void create(UserRequestDto dto) {
		Optional<User> byUsername =  userRepository.findByUsername(dto.getUsername());
		if (byUsername.isPresent()) {
			throw new OurRuntimeException(null,"user is exists");
		}
		User user = new User();
		user.setId(null);
		user.setName(dto.getName());
		user.setSurname(dto.getSurname());
		user.setUsername(dto.getUsername());
		user.setEmail(dto.getEmail());
		user.setPassword(dto.getPassword());
		String encode = passwordEncoder.encode(dto.getPassword());
		user.setPassword(encode);
		userRepository.save(user);

	}

	public String login(UserRequestDto d) {
		Optional<User> user = userRepository.findByUsername(d.getUsername());
		if (!user.isPresent() || !passwordEncoder.matches(d.getPassword(), user.get().getPassword())) {
			throw new OurRuntimeException(null, "username or password incorrect");
		}
		return jwtUtil.generateToken(user.get().getUsername());
	}

}