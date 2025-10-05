package com.example.Final_project.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.Final_project.entity.Product;

public interface ProductRepository extends JpaRepository<Product, Integer> {

	List<Product> findAllByUserId(Integer id);

	List<Product> findAllByOrderByPriceAsc();

	List<Product> findAllByOrderByPriceDesc(); 

}
