package com.afunms.system.vo;

import java.io.Serializable;

public class ProcessVo implements Serializable {

	private String name;

	private String count;

	private String types;

	private String cputime;

	private String cpuUtilization;

	private String memoryUtilization;

	private String memory;

	private String status;

	public String getCount() {
		return count;
	}

	public String getCputime() {
		return cputime;
	}

	public String getCpuUtilization() {
		return cpuUtilization;
	}

	public String getMemory() {
		return memory;
	}

	public String getMemoryUtilization() {
		return memoryUtilization;
	}

	public String getName() {
		return name;
	}

	public String getStatus() {
		return status;
	}

	public String getTypes() {
		return types;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public void setCputime(String cputime) {
		this.cputime = cputime;
	}

	public void setCpuUtilization(String cpuUtilization) {
		this.cpuUtilization = cpuUtilization;
	}

	public void setMemory(String memory) {
		this.memory = memory;
	}

	public void setMemoryUtilization(String memoryUtilization) {
		this.memoryUtilization = memoryUtilization;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setTypes(String types) {
		this.types = types;
	}

}