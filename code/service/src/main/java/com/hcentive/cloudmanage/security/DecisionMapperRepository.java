package com.hcentive.cloudmanage.security;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.Repository;
import org.springframework.data.repository.query.Param;

/**
 * Spring data will create an instance at runtime. Instead of @Repository -
 * extend Repository interface.
 */
public interface DecisionMapperRepository extends
		Repository<DecisionMapper, Tag> {
	
	public List<DecisionMapper> findAll();
	
	@Query("select t from DecisionMapper t where find_in_set(:role,t.ldapAuthNames) <> 0")
	public List<DecisionMapper> findByRole(@Param("role") String role);
}