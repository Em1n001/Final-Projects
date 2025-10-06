package com.example.Final_project.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.example.Final_project.Exception.OurRuntimeException;
import com.example.Final_project.Repository.CartRepository;
import com.example.Final_project.Repository.ProductRepository;
import com.example.Final_project.Repository.UserRepository;
import com.example.Final_project.RequestDto.CartRequestDto;
import com.example.Final_project.entity.Cart;
import com.example.Final_project.entity.Product;
import com.example.Final_project.entity.User;

@Service
public class CartService {
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private CartRepository cartRepository;
	
	@Autowired
	private UserRepository userRepository;

	public void addToCart(CartRequestDto dto) {
		Product product = productRepository.findById(dto.getProductId())
		.orElseThrow(() -> new OurRuntimeException(null, "product not found"));
		
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		User user = userRepository.getUserByUsername(username);
		Integer id = user.getId();
		
		Cart cart = new Cart();
		cart.setProduct(product);
		cart.setQuantity(1);
		Double subTotal = product.getPrice() * cart.getQuantity();
		cart.setSubTotal(subTotal);
		cart.setUserId(id);
		cartRepository.save(cart);
	}

}