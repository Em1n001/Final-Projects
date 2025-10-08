package com.example.Final_project.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.Final_project.entity.Order;

public interface OrderRepository extends JpaRepository<Order, Integer> {

}