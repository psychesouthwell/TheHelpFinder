package com.web.thehelpfinder.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.web.thehelpfinder.dao.SESFactorsRepository;
import com.web.thehelpfinder.dao.UsersRepository;
import com.web.thehelpfinder.model.SocioEconomicFactors;
import com.web.thehelpfinder.model.Users;

@Controller
public class UsersController {

	@Autowired
	private UsersRepository usersRepository;
	
	@Autowired
	private SESFactorsRepository sesRepository;	
	
	@PostMapping("buildprofile")
	String update(@ModelAttribute SocioEconomicFactors sesFactors, RedirectAttributes model) {
	
		try {
			Users user=usersRepository.findById(sesFactors.getId()).get();	
			sesFactors.setUser(user);
			sesRepository.save(sesFactors);
			model.addFlashAttribute("ses", "Update successful!");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:profile";		
	}
	
	@PostMapping("changepassword")	
	String register(@ModelAttribute Users user, RedirectAttributes mod) {
		String passwordRegex ="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&+=])(?=\\S+$).{8,}$";
		
		usersRepository.findById(user.getId()).ifPresent(a->{			
			
			if(!a.getPassword().equals(user.getPassword())) {
				mod.addFlashAttribute("error", "Password is different from current one");
			}
			
			if(!user.getPassword2().matches(passwordRegex)) { 				
				mod.addFlashAttribute("error", "Password should be at least 8 characters, lower case, upper case and a special character."); 
			}
			
			if(a.getPassword().equals(user.getPassword()) && user.getPassword2().matches(passwordRegex)) {
				a.setPassword(user.getPassword2());
				usersRepository.save(a);
				mod.addFlashAttribute("msg", "Password reset success");
			}
			
		});
		
		return "redirect:profile";
		
	}
	
	
	@ModelAttribute("sesfactors")
	SocioEconomicFactors sesfactors() {
	return new SocioEconomicFactors();
}

}	