package com.example.Final_project.Response;

import java.util.List;

import com.example.Final_project.entity.Product;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ProductListResponse {

	private List<Product> products;
}
