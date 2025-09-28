package com.example.Final_project.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.Final_project.entity.User;

public interface UserRepository extends JpaRepository<User, Integer>{

}