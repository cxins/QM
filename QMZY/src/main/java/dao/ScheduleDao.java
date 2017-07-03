package dao;



import java.util.List;

import model.EnrollmentStatus;
import model.ScheduleOfClasses;

import model.Section;

import model.Student;



public interface ScheduleDao {



	public List<ScheduleOfClasses> getScheduleOfClass();



	public List<ScheduleOfClasses> getScheduleOfClassBySemester(String semester);



	public List<ScheduleOfClasses> findAllByStudent(String studentSsn);



	public EnrollmentStatus enroll(Section section, Student student);



	public Section getSectionBySectionNo(String FullNo);



}