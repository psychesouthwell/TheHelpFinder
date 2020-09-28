package com.web.thehelpfinder.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.MapsId;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="SESFactors")
public class SocioEconomicFactors {

	@Id
	private Long id;
	private String householdIncome;
	private String householdSize;
	private String numberOfKids;
	private boolean felony;
	private boolean priorProgramUse;
	private String email;

	@JsonIgnore
	@OneToOne
	@MapsId
	private Users user;
	
	
	public SocioEconomicFactors() {}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	public String getHouseholdIncome() {
		return householdIncome;
	}

	public void setHouseholdIncome(String householdIncome) {
		this.householdIncome = householdIncome;
	}

	public String getHouseholdSize() {
		return householdSize;
	}

	public void setHouseholdSize(String householdSize) {
		this.householdSize = householdSize;
	}

	public String getNumberOfKids() {
		return numberOfKids;
	}

	public void setNumberOfKids(String numberOfKids) {
		this.numberOfKids = numberOfKids;
	}

	public boolean isFelony() {
		return felony;
	}

	public void setFelony(boolean felony) {
		this.felony = felony;
	}

	public boolean isPriorProgramUse() {
		return priorProgramUse;
	}

	public void setPriorProgramUse(boolean priorProgramUse) {
		this.priorProgramUse = priorProgramUse;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "SocioEconomicFactors [id=" + id + ", householdIncome=" + householdIncome + ", householdSize="
				+ householdSize + ", numberOfKids=" + numberOfKids + ", felony=" + felony + ", priorProgramUse="
				+ priorProgramUse + ", email=" + email + ", user=" + user + "]";
	}

	
}
