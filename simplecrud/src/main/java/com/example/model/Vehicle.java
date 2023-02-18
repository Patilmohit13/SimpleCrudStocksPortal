package com.example.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class Vehicle  {

	@Id
	@Column
	private int vehicleno;
	@Column
	private String type;
	@Column
	private String name;
	@Column
	private String capacity;
	@Column
	private String passing;

	public int getVehicleno() {
		return vehicleno;
	}

	public void setVehicleno(int vehicleno) {
		this.vehicleno = vehicleno;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCapacity() {
		return capacity;
	}

	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}

	public String getPassing() {
		return passing;
	}

	public void setPassing(String passing) {
		this.passing = passing;
	}
}
