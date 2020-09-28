package com.web.thehelpfinder.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.web.thehelpfinder.model.PovertyGuidelines;

public interface PovertyGuidelinesRepository extends JpaRepository<PovertyGuidelines, Long> {

	//Pulling the relevant poverty guideline, which is based on household size
	@Query("FROM PovertyGuidelines where householdSize =?1")
	PovertyGuidelines findGuide(String householdSize);
	
}
