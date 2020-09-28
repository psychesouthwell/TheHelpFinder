package com.web.thehelpfinder.model;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="guidelines")
public class PovertyGuidelines {


	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;	
    private String householdSize;
    private String povertyGuideline;
    
    
    public PovertyGuidelines() {}

	public String getHouseholdSize() {
		return householdSize;
	}

	public void setHouseholdSize(String householdSize) {
		this.householdSize = householdSize;
	}

	public String getPovertyGuideline() {
		return povertyGuideline;
	}

	public void setPovertyGuideline(String povertyGuideline) {
		this.povertyGuideline = povertyGuideline;
	}

	@Override
	public String toString() {
		return "PovertyGuidelines [id=" + id + ", householdSize=" + householdSize + ", povertyGuideline="
				+ povertyGuideline + "]";
	}
     
	
}
