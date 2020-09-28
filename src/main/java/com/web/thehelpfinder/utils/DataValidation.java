package com.web.thehelpfinder.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.web.thehelpfinder.dao.UsersRepository;
import com.web.thehelpfinder.model.Users;

@Component
public class DataValidation implements Validator {
	@Autowired
	public UsersRepository userRepository;
	//add regex validation
	String emailRegex ="^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
	String passwordRegex ="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&+=])(?=\\S+$).{8,}$";	
	
	@Override
	public boolean supports(Class<?> clazz) {
		return Users.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object o, Errors errors) {
		
		Users user = (Users) o;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstName", "size.user.firstName");		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastName", "size.user.lastName");			
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "NotEmpty");		
		if (userRepository.findUserByEmail(user.getEmail()).isPresent()) {
	    	errors.rejectValue("email", "size.user.unique");
	    }
		       
	    ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password2", "NotEmpty");
        if (!user.getPassword2().equals(user.getPassword())) {
	    	errors.rejectValue("password2", "match.user.password2");
	    }
        		
		if(!user.getEmail().matches(emailRegex)) { 
			errors.rejectValue("email","size.user.email"); 
		}
		 
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
        if (!user.getPassword().matches(passwordRegex)) {
        	errors.rejectValue("password", "size.user.password");
	    }
       

	}

}

	
	

