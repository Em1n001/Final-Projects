package com.example.Final_project.RequestDto;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class OrderRequestDto {
	
		private Integer cartId;
		private String name;
		private String surname;
		private String country;
		private String city;
		private String address; 
		private String phone;
		private String email;
		private String cartNumber;
		private String zipCode;
		private String expiryMonth;
		private Integer expiryYear;

	}

