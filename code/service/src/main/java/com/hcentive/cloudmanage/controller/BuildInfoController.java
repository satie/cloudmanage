package com.hcentive.cloudmanage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.MimeType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.amazonaws.services.cloudsearchdomain.model.ContentType;
import com.hcentive.cloudmanage.domain.BuildInfo;
import com.hcentive.cloudmanage.domain.BuildJobResponse;
import com.hcentive.cloudmanage.jenkins.BuildInfoService;

@RestController
@RequestMapping("/build")
public class BuildInfoController {

	@Autowired
	private BuildInfoService buildInfoService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public BuildJobResponse buildJobs() throws IOException {
		return buildInfoService.getBuilds();
	}

	@RequestMapping(value = "/{jobName}", method = RequestMethod.GET)
	public BuildInfo getLastSuccessfulBuildInfo(@PathVariable(value = "jobName") String jobName)
			throws IOException {
		Integer lastSuccessfulBuild = buildInfoService.getLastSuccessfulBuildNumber(jobName);
		if(lastSuccessfulBuild != null){
			BuildInfo buildInfo = buildInfoService.getBuildInfo(jobName,
					lastSuccessfulBuild);
			return buildInfo;
		}
		return null;
	}
	
	@RequestMapping(value = "/log/{jobName}/{buildNumber}", method = RequestMethod.GET)
	public void downloadBuildLog(@PathVariable(value="jobName") String jobName, @PathVariable(value="buildNumber") Integer buildNumber, HttpServletResponse response) throws IOException{
		String logFileContents = buildInfoService.getLogFile(jobName, buildNumber);
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", String.format("inline; filename=\"" + jobName +"_"+buildNumber+".log\""));
		FileCopyUtils.copy(logFileContents, response.getWriter());
	}
}
