package com.web.thehelpfinder.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;


@Entity
@Table(name="accounts")
public class Users {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;		
	private String firstName;
	private String lastName;
	private String email;
    private String password;
    @Transient
    private String password2;
    private String role;
   
    @Transient
	private MultipartFile file;
    
    @OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
    private SocioEconomicFactors sesFactors;	
    
	public Users() {
		super();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public SocioEconomicFactors getSesFactors() {
		return sesFactors;
	}

	public void setSesFactors(SocioEconomicFactors sesFactors) {
		this.sesFactors = sesFactors;
	}

	
	@Override
	public String toString() {
		return "Users [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email
				+ ", password=" + password + ", password2=" + password2 + ", role=" + role + ", file=" + file + "]";
	}

	
}
