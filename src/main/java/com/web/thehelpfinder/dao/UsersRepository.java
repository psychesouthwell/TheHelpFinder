package com.web.thehelpfinder.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.web.thehelpfinder.model.Users;

public interface UsersRepository extends JpaRepository<Users, Long> {

	@Query("FROM Users WHERE email=?1 AND password=?2 ")
	Optional<Users> login(String email, String password);
	
	//pull users by email
	Optional<Users>findUserByEmail(String email);

	//Search client list by email or name
	@Query("FROM Users WHERE email=?1 OR firstName=?1 OR lastName=?1")
	List<Users> searchUser(String keyword);

}
