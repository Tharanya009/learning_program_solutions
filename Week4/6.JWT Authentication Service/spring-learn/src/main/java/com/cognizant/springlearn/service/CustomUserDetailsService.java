package com.cognizant.springlearn.service;

import java.util.ArrayList;

import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        if ("user".equals(username)) {
            // Use already encoded password for "pwd" with BCrypt
            String encodedPassword = "$2a$10$2xuQkUG0E5Cl7jN5IdJvue5b5BF4lKM0N3u3zPqpNc0tx6sw48ybq";
            return new User("user", encodedPassword, new ArrayList<>());
        } else {
            throw new UsernameNotFoundException("User not found");
        }
    }
}
