package com.hcentive.cloudmanage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.hcentive.cloudmanage.domain.VPC;
import com.hcentive.cloudmanage.service.provider.ProviderFacade;

//@RestController
//@RequestMapping("/vpcs")
public class VPCController {
	
	@Autowired
	private ProviderFacade provideFacade;
	
	@RequestMapping(method=RequestMethod.GET)
	public List<VPC> list(){
		return provideFacade.getVPCList();
	}
}