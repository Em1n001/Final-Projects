package com.example.Final_project.Response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ProductResponseDto {

	private Integer id;
	private Double price;
	private String brand;
	private String model;
	private String category;
	private String description;
	private Integer rating;
	private String image;
}
