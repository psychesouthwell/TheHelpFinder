package com.web.thehelpfinder.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.web.thehelpfinder.model.SocioEconomicFactors;

@Repository
public interface SESFactorsRepository extends JpaRepository<SocioEconomicFactors, Long> {
	SocioEconomicFactors findByEmail(String email);
}
