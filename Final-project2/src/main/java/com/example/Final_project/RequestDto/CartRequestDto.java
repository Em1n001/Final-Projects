package com.example.Final_project.RequestDto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CartRequestDto {
	private Integer productId;
	private Integer quantity;
	private Double subTotal;
}