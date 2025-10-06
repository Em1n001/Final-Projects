package com.example.Final_project.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.Final_project.entity.Cart;

public interface CartRepository extends JpaRepository<Cart, Integer>{

}