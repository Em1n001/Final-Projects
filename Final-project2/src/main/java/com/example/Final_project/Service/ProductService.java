package com.example.Final_project.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.example.Final_project.Exception.OurRuntimeException;
import com.example.Final_project.Repository.ProductRepository;
import com.example.Final_project.Repository.UserRepository;
import com.example.Final_project.RequestDto.ProductRequestDto;
import com.example.Final_project.Response.ProductListResponse;
import com.example.Final_project.Response.ProductResponseDto;
import com.example.Final_project.entity.Product;
import com.example.Final_project.entity.User;

@Service
public class ProductService {

	@Autowired UserRepository userRepository;
	
	@Autowired ProductRepository productRepository;
	
	public void create(ProductRequestDto d) {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		User user = userRepository.getUserByUsername(username);
		Integer id = user.getId();
		
		Product product = new Product();
		product.setId(null);
		product.setPrice(d.getPrice());
		product.setBrand(d.getBrand());
		product.setModel(d.getModel());
		product.setRating(d.getRating());
		product.setCategory(d.getCategory());
		product.setDescription(d.getDescription());
		product.setImage(d.getImage());
		product.setUserId(id);
		productRepository.save(product);
	}

	public ProductListResponse getAll() {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		User user = userRepository.getUserByUsername(username);
		Integer id = user.getId();
		
			List<Product> products = productRepository.findAllByUserId(id);
			ProductListResponse response = new ProductListResponse();
			response.setProducts(products);
			return response;
	}

	public ProductResponseDto get(Integer id) {
		if (id == null || id<=0) {
			throw new OurRuntimeException(null, "id mutleqdir");
		}
		Optional<Product> byId = productRepository.findById(id);
		ProductResponseDto response = new ProductResponseDto();
		if (byId.isPresent()) {
			Product product = byId.get();
			response.setId(product.getId());
			response.setBrand(product.getBrand());
			response.setModel(product.getModel());
			response.setRating(product.getRating());
			response.setCategory(product.getCategory());
			response.setDescription(product.getDescription());
			response.setPrice(product.getPrice());
			response.setImage(product.getImage());
		}else {
			throw new OurRuntimeException(null, "id tapilmadi");
		}
		return response;

	}

	public void update(ProductRequestDto dto) {
		if (dto.getId() == null || dto.getId() <= 0) {
			throw new OurRuntimeException(null, "id mutleqdir");
		}
		Optional<Product> byId = productRepository.findById(dto.getId());
		if (byId.isPresent()) {
			Product product = byId.get();
			product.setId(dto.getId());
			product.setBrand(dto.getBrand());
			product.setModel(dto.getModel());
			product.setRating(dto.getRating());
			product.setCategory(dto.getCategory());
			product.setDescription(dto.getDescription());
			product.setPrice(dto.getPrice());
			product.setImage(dto.getImage());
			productRepository.save(product);
		}else {
			throw new OurRuntimeException(null, "id tapilmadi");
		}
	}

	public void delete(Integer id) {
		if (id == null || id <= 0) {
			throw new OurRuntimeException(null, "id mutleqdir");
		}
		if (productRepository.findById(id).isPresent()) {
			productRepository.deleteById(id);
		}else {
			throw new OurRuntimeException(null, "id tapilmadi");
		}
		
	}

	public ProductListResponse getAllProduct() {
		ProductListResponse response = new ProductListResponse();
		List<Product> all = productRepository.findAll();
		response.setProducts(all);
		return response;
	}

	public List<ProductResponseDto> search(String query) {
		List<Product> products = productRepository.findAll();
		return products.stream().filter(product -> product.getBrand().toLowerCase().contains(query.toLowerCase()))
				.map(product -> {
					ProductResponseDto response = new ProductResponseDto();
					response.setId(product.getId());
					response.setBrand(product.getBrand());
					response.setModel(product.getModel());
					response.setRating(product.getRating());
					response.setCategory(product.getCategory());
					response.setDescription(product.getDescription());
					response.setPrice(product.getPrice());
					response.setImage(product.getImage());
					return response;
				})
				.collect(Collectors.toList());
	}

	public List<ProductResponseDto> sortedProduct(String sort) {
		List<Product> products;
		
		if ("priceAsc".equalsIgnoreCase(sort)) {
			products = productRepository.findAllByOrderByPriceAsc();
		}else if("priceDesc".equalsIgnoreCase(sort)) {
			products = productRepository.findAllByOrderByPriceDesc();
		}else {
			products = productRepository.findAll();
		}
		return products.stream().map(product -> {
			ProductResponseDto response = new ProductResponseDto();
			response.setId(product.getId());
			response.setBrand(product.getBrand());
			response.setModel(product.getModel());
			response.setRating(product.getRating());
			response.setCategory(product.getCategory());
			response.setDescription(product.getDescription());
			response.setPrice(product.getPrice());
			response.setImage(product.getImage());
			return response;
		})
				.collect(Collectors.toList());
	}

}
