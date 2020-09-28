package com.web.thehelpfinder.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.thehelpfinder.dao.PovertyGuidelinesRepository;
import com.web.thehelpfinder.dao.UsersRepository;
import com.web.thehelpfinder.model.SocioEconomicFactors;
import com.web.thehelpfinder.model.Users;
import com.web.thehelpfinder.utils.DataValidation;
//import com.web.thehelpfinder.utils.DataValidation;
import com.web.thehelpfinder.utils.WebUtils;

@Controller
@SessionAttributes({"loggedInuser", "role"})
public class AppController {
	
	@Autowired
	private UsersRepository usersRepository;
	
	@Autowired
	private PovertyGuidelinesRepository povertyRepository;
	
	@Autowired
	private DataValidation dataValidation;
	
	@Autowired
	private WebUtils webUtils;
	
	
	@ModelAttribute("user")
	   public Users user() {		
	   return new Users();		
	 }
	
	@ModelAttribute("sesfactors")
	SocioEconomicFactors sesFactors() {
		return new SocioEconomicFactors();
	}

	@GetMapping({"/","home"})
	String index(Model model) {
		model.addAttribute("msg", "Welcome To The Help Finder!");
		return "index";	
	}
	
	@GetMapping({"about"})
	String about(Model model){	
		model.addAttribute("msg", "about us");
	return "about";
	}
	
	@GetMapping({"privacy"})
	String privacy(Model model){	
	return "privacy";
	}
	
	@GetMapping({"contact"})
	String contact(Model model) {
		model.addAttribute("msg", "Contact us");		
		model.addAttribute("page", "Contact Us");
		return "contact";	
	}
	
	@PostMapping("sendemail")
 	String sendemail(@RequestParam String email, 
 					 @RequestParam String name,
 					 @RequestParam String subject,
 					 @RequestParam String message, RedirectAttributes red) {
 		try {
 			webUtils.sendMail(email, message+ " From " + name, subject);
 			red.addFlashAttribute("success", "Your message has been sent. Thank you, "+ name +"!");
 		} catch (Exception e) {
 			e.printStackTrace();
 			red.addFlashAttribute("error", "Email failed to send.");
 			
 		}
 	 
 	return "redirect:contact";		
 	}

	
	@GetMapping({"login"})
	public String login(Model model) {
		model.addAttribute("msg", "Log In Here");
		model.addAttribute("page", "Login");
		return "login";
	}
	
	
	@PostMapping("login")
	String login(RedirectAttributes redirect, Model model, @RequestParam String email, @RequestParam String password){
	  // login user
	  Optional<Users> user= usersRepository.login(email, password);
	 //add user email and role in session
	  if(user.isPresent()) {
		  model.addAttribute("loggedInuser", email);
		  model.addAttribute("role", user.get().getRole()); 
		  model.addAttribute("user_account", user.get());
		  
	  }else {
		  redirect.addFlashAttribute("error", "The Email or Password you entered does not match our records");
		  return "redirect:/login";
	  }
	return "profile";	
	}
	
	@GetMapping("logout")
	String logout(Model model, SessionStatus status, HttpSession session){
		//status.setComplete();
		session.invalidate();
		model.addAttribute("loggedInuser", "");
		model.addAttribute("role", "");
		Users user=new Users();		
		model.addAttribute("user", user);
		model.addAttribute("msg", "You have been logged out.");
	
	return "login";	
	}
	
	@GetMapping("profile") 
	  String profile(@SessionAttribute(required = false) String loggedInuser, Model model) {
	     try {
	    	 model.addAttribute("page", "Profile");
	    	 //if user is not in session return login page expired session
			if(loggedInuser.isEmpty() || loggedInuser ==null) {
				 model.addAttribute("error", "Expired session, please Login");
				 return "login"; 
			 }
			//populate user details from database 
			usersRepository.findUserByEmail(loggedInuser).ifPresent(a->{
				 model.addAttribute("user_account", a);
				 if(a.getSesFactors() !=null) {
					 model.addAttribute("sesfactors", a.getSesFactors());
				 }
				 
			      model.addAttribute("guide", povertyRepository.findGuide(a.getSesFactors().getHouseholdSize()));
				 
				 
			 });
			
		} catch (Exception e) {

		} 
	  return "profile";
	 }
	@PostMapping("updatemyinfo")
	public String udateMyinfo(@ModelAttribute Users user, RedirectAttributes red) {
		
		usersRepository.findById(user.getId()).ifPresent(u->{
			u.setFirstName(user.getFirstName());
			u.setLastName(user.getLastName());
			usersRepository.save(u);
			red.addFlashAttribute("update", "Update successful!");
		});		
		return "redirect:profile";
	}		
	
	@GetMapping({"register"})
	public String register(Model model) {
		model.addAttribute("msg", "Register");
		model.addAttribute("users", new Users());
		model.addAttribute("page", "Register");
		return "register";	
}
	
	@PostMapping("signup")
	public String register(@ModelAttribute Users user, BindingResult result, Model model) {
		model.addAttribute("success", user);
		model.addAttribute("msg",  "Hi" + user.getFirstName()+ "Welcome");

		dataValidation.validate(user, result);
			if (result.hasErrors()) {
			model.addAttribute("page", "Register");
			return "register";
		}	
		
		// save users and put the user in session/log in
		user.setRole("USER");
		usersRepository.save(user);
		model.addAttribute("user_account", user);		
		model.addAttribute("msg","Hi "+ user.getFirstName()+ " welcome");
		model.addAttribute("page", "Profile");
	    model.addAttribute("loggedInuser", user.getEmail());
	    model.addAttribute("role", user.getRole());
		
		return "profile";	
	}
	
	@GetMapping("accessdenied")
 	public String denied() {
		return "accessdenied";
	}
	
	@GetMapping({"admin"})
	String admin(Model model) {
		model.addAttribute("msg", "Admin");
		model.addAttribute("list", usersRepository.findAll());
		//model.addAttribute("page", "Admin");
		return "admin";
	}
	
	@PostMapping("editrole")
	String editrole(@RequestParam Long id, @RequestParam String role, 
	RedirectAttributes redirect) {
		try {			
			usersRepository.findById(id).
			ifPresent(a->{				
				a.setRole(role);
				usersRepository.save(a);
			});
			redirect.addFlashAttribute("success", role+ " Role Granted ");
		} catch (Exception e) {
			e.printStackTrace();
			redirect.addFlashAttribute("success", "Operation Fail");
		}
		return "redirect:/admin";
                                      }
		
	@GetMapping({"removeuser"})
	String deleteUser(Model model, @RequestParam Long id){	
		
		try {
			usersRepository.deleteById(id);
			model.addAttribute("msg", "Delete success");
			model.addAttribute("list", usersRepository.findAll());
		} catch (Exception e) {			
			e.printStackTrace();
			model.addAttribute("error", "Delete Fail");
		}	
		
	return "admin";
	}	

	@PostMapping("search")
	public String search(@RequestParam String keyword, Model model) {			
		
		model.addAttribute("page", "Admin");
		List<Users> users=usersRepository.searchUser(keyword);
		if(users.isEmpty()) {
			model.addAttribute("msg", " No match found");
		}else {
		model.addAttribute("list", users);
		model.addAttribute("msg", users.size()+ " found");
		}
		return "admin";
	}
	
}
