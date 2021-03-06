package action;

import java.util.HashMap;
import java.util.Map.Entry;

import com.opensymphony.xwork2.ActionSupport;

import dao.CourseDao;
import dao.DaoFactory;
import model.Course;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import service.CourseService;


public class CourseAction extends ActionSupport {
	
	private static final long serialVersionUID = 1L;
	private JSONObject jsonObject = new JSONObject();
	private JSONArray jsonArray = new JSONArray();
	public String courseNo;
	public String courseName;
	public String credits;
	public String prerequisite;
	

	public String findAllCourse(){
		CourseService courseService = new CourseService();
		HashMap<String,Course> courses = courseService.findAll();
		for(Entry<String,Course> c : courses.entrySet()){
			JSONObject jo = new JSONObject();
			jo.put("courseNo", c.getValue().getCourseNo());
			jo.put("courseName", c.getValue().getCourseName());
			jo.put("credits", c.getValue().getCredits());
			jo.put("prerequisite", c.getValue().getPrerequisites());
			jsonArray.add(jo);
		}
		return "jsonArray";
	}
	
	
	
	public String addCourse(){
		CourseService courseService = new CourseService();
		jsonObject.put("status", "ok");
		HashMap<String, Course> courses = courseService.findAll();
		Course course =new Course(courseNo, courseName, Double.valueOf(credits));
		course.addPrerequisite(courses.get(prerequisite));
		CourseDao courseDao =  DaoFactory.createCourseDao();
		courseDao.addCourse(course);
		return "jsonObject";
	}

	public String deleteCourse(){
		CourseService courseService = new CourseService();
		jsonObject.put("status", "ok");
		HashMap<String, Course> courses = courseService.findAll();
		Course course = courses.get(courseNo);
		CourseDao courseDao =  DaoFactory.createCourseDao();
		courseDao.deleteCourse(course);
		return "jsonObject";
	}
	
	
	
	

	public JSONObject getJsonObject() {
		return jsonObject;
	}

	public void setJsonObject(JSONObject jsonObject) {
		this.jsonObject = jsonObject;
	}

	public JSONArray getJsonArray() {
		return jsonArray;
	}

	public void setJsonArray(JSONArray jsonArray) {
		this.jsonArray = jsonArray;
	}

	public String getCourseNo() {
		return courseNo;
	}

	public void setCourseNo(String courseNo) {
		this.courseNo = courseNo;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getCredits() {
		return credits;
	}

	public void setCredits(String credits) {
		this.credits = credits;
	}

	public String getPrerequisite() {
		return prerequisite;
	}

	public void setPrerequisite(String prerequisite) {
		this.prerequisite = prerequisite;
	}
	
	
	
}
