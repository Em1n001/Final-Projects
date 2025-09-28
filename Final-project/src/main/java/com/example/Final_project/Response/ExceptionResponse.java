package com.example.Final_project.Response;

import java.util.List;

import com.example.ProjectBook.response.ValidationResponse;

import lombok.Data;

@Data
public class ExceptionResponse {
private String message;
private List<ValidationResponse> validations;
}