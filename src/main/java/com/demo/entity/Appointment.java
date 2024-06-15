package com.demo.entity;

public class Appointment {

	private int id;
	private int userId;
	private String fullname;
	private String gender;
	private String age;
	private String appointment_date;
	private String email;
	private String mobno;
	private String diseases;
	private int doctorId;
	private String address;
	private String status;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getAppointment_date() {
		return appointment_date;
	}
	public void setAppointment_date(String appointment_date) {
		this.appointment_date = appointment_date;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobno() {
		return mobno;
	}
	public void setMobno(String mobno) {
		this.mobno = mobno;
	}
	public String getDiseases() {
		return diseases;
	}
	public void setDiseases(String diseases) {
		this.diseases = diseases;
	}
	public int getDoctorId() {
		return doctorId;
	}
	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Appointment(int userId, String fullname, String gender, String age, String appointment_date, String email,
			String mobno, String diseases, int doctorId, String address, String status) {
		super();
		this.userId = userId;
		this.fullname = fullname;
		this.gender = gender;
		this.age = age;
		this.appointment_date = appointment_date;
		this.email = email;
		this.mobno = mobno;
		this.diseases = diseases;
		this.doctorId = doctorId;
		this.address = address;
		this.status = status;
	}
	public Appointment() {
		super();
	}
	@Override
	public String toString() {
		return "Appointment [id=" + id + ", userId=" + userId + ", fullname=" + fullname + ", gender=" + gender
				+ ", age=" + age + ", appointment_date=" + appointment_date + ", email=" + email + ", mobno=" + mobno
				+ ", diseases=" + diseases + ", doctorId=" + doctorId + ", address=" + address + ", status=" + status
				+ "]";
	}
	
	
	
}
