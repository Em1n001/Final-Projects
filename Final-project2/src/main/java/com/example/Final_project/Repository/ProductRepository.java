package com.example.Final_project.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.Final_project.entity.Product;

public interface ProductRepository extends JpaRepository<Product, Integer> { 

}
