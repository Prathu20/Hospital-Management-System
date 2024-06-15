package com.demo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.demo.entity.Appointment;
import com.demo.entity.Doctor;

public class AppointmentDao {

	private Connection conn;

	public AppointmentDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addAppointment(Appointment appointment) {
		boolean f = false;
		
		try {
			String sql = "insert into appointment(userId,fullname,gender,age,appointment_date,email,mobno,diseases,doctorId,address,status)"
					+ " values(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, appointment.getUserId());
			ps.setString(2, appointment.getFullname());
			ps.setString(3, appointment.getGender());
			ps.setString(4, appointment.getAge());
			ps.setString(5, appointment.getAppointment_date());
			ps.setString(6, appointment.getEmail());
			ps.setString(7, appointment.getMobno());
			ps.setString(8, appointment.getDiseases());
			ps.setInt(9, appointment.getDoctorId());
			ps.setString(10, appointment.getAddress());
			ps.setString(11, appointment.getStatus());
			
			
			int i= ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return f;
	}
	
	public List<Appointment> getAllAppointmentByLoginUser(int userId) {
		List<Appointment> list = new ArrayList<Appointment>();
		Appointment app = null;
		try {
			String sql = "select * from appointment where userId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				app = new Appointment();
				app.setId(rs.getInt(1));
				app.setUserId(rs.getInt(2));
				app.setFullname(rs.getString(3));
				app.setGender(rs.getString(4));
				app.setAge(rs.getString(5));
				app.setAppointment_date(rs.getString(6));
				app.setEmail(rs.getString(7));
				app.setMobno(rs.getString(8));
				app.setDiseases(rs.getString(9));
				app.setDoctorId(rs.getInt(10));
				app.setAddress(rs.getString(11));
				app.setStatus(rs.getString(12));
				
				list.add(app);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Appointment> getAllAppointmentByDoctorLogin(int doctorId) {
		List<Appointment> list = new ArrayList<Appointment>();
		Appointment app = null;
		try {
			String sql = "select * from appointment where doctorId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, doctorId);
			
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				app = new Appointment();
				app.setId(rs.getInt(1));
				app.setUserId(rs.getInt(2));
				app.setFullname(rs.getString(3));
				app.setGender(rs.getString(4));
				app.setAge(rs.getString(5));
				app.setAppointment_date(rs.getString(6));
				app.setEmail(rs.getString(7));
				app.setMobno(rs.getString(8));
				app.setDiseases(rs.getString(9));
				app.setDoctorId(rs.getInt(10));
				app.setAddress(rs.getString(11));
				app.setStatus(rs.getString(12));
				
				list.add(app);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	
	public Appointment getAppointmentById(int id) {
		
		Appointment app = null;
		try {
			String sql = "select * from appointment where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				app = new Appointment();
				app.setId(rs.getInt(1));
				app.setUserId(rs.getInt(2));
				app.setFullname(rs.getString(3));
				app.setGender(rs.getString(4));
				app.setAge(rs.getString(5));
				app.setAppointment_date(rs.getString(6));
				app.setEmail(rs.getString(7));
				app.setMobno(rs.getString(8));
				app.setDiseases(rs.getString(9));
				app.setDoctorId(rs.getInt(10));
				app.setAddress(rs.getString(11));
				app.setStatus(rs.getString(12));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return app;
	}
	
	public boolean updateCommentStatus(int id,int doctorId,String comment) {
		boolean f = false;
		
		try {
			String sql = "update appointment set status=? where id=? and doctorId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, comment);
			ps.setInt(2, id);
			ps.setInt(3, doctorId);
			int i= ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return f;
	}
	public List<Appointment> getAllAppointment() {
		List<Appointment> list = new ArrayList<Appointment>();
		Appointment app = null;
		try {
			String sql = "select * from appointment order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				app = new Appointment();
				app.setId(rs.getInt(1));
				app.setUserId(rs.getInt(2));
				app.setFullname(rs.getString(3));
				app.setGender(rs.getString(4));
				app.setAge(rs.getString(5));
				app.setAppointment_date(rs.getString(6));
				app.setEmail(rs.getString(7));
				app.setMobno(rs.getString(8));
				app.setDiseases(rs.getString(9));
				app.setDoctorId(rs.getInt(10));
				app.setAddress(rs.getString(11));
				app.setStatus(rs.getString(12));
				
				list.add(app);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
}
