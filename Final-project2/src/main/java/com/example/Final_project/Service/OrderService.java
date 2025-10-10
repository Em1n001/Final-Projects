package com.example.Final_project.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.Final_project.Exception.OurRuntimeException;
import com.example.Final_project.Repository.CartRepository;
import com.example.Final_project.Repository.OrderRepository;
import com.example.Final_project.RequestDto.OrderRequestDto;
import com.example.Final_project.entity.Cart;
import com.example.Final_project.entity.Order;

@Service
public class OrderService {
	
	@Autowired
	private CartRepository cartRepository;
	
	@Autowired
	private OrderRepository orderRepository;

	public void order(OrderRequestDto dto) {
		Cart cart = cartRepository.findById(dto.getCartId())
		.orElseThrow(() -> new OurRuntimeException(null, "cart not found"));
		
		Order order = new Order();
		order.setName(dto.getName());
		order.setSurname(dto.getSurname());
		order.setCountry(dto.getCountry());
		order.setCity(dto.getCity());
		order.setAddress(dto.getAddress());
		order.setPhone(dto.getPhone());
		order.setEmail(dto.getEmail());
		order.setCartNumber(dto.getCartNumber());
		order.setExpiryMonth(dto.getExpiryMonth());
		order.setExpiryYear(dto.getExpiryYear());
		order.setZipCode(dto.getZipCode());;
		order.setCvc(dto.getCvc());
		order.setCart(cart);
		orderRepository.save(order);
	}

	
}