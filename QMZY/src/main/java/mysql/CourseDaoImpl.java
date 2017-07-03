package mysql;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;



import dao.CourseDao;

import model.Course;


import util.DBUtil;



public class CourseDaoImpl implements CourseDao {

	private PreparedStatement pstmt;

	HashMap<String, Course> courses = new HashMap<String, Course>();





	public CourseDaoImpl() {

		// TODO Auto-generated constructor stub

		String sql = "select * from course;";

		try {

			pstmt = DBUtil.getSqliteConnection().prepareStatement(sql);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {

				String courseNo = rs.getString("courseNo");

				String courseName = rs.getString("courseName");

				double credits = rs.getDouble("credits");

				Course course = new Course(courseNo, courseName, credits);

				sql = "select * from prerequisites,course where course.courseNo=prerequisites.courseNo;";

				pstmt = DBUtil.getSqliteConnection().prepareStatement(sql);

				ResultSet rsprerequisites = pstmt.executeQuery();

				while (rsprerequisites.next()) {

					String courseNo2 = rsprerequisites.getString("courseNo");

					String courseName2 = rsprerequisites.getString("courseName");

					double credits2 = rsprerequisites.getDouble("credits");

					Course prerequisitescourse = new Course(courseNo2, courseName2, credits2);

					if (courseNo.equals(courseNo2))

						course.addPrerequisite(prerequisitescourse);

					courses.put(courseNo, course);

				}

			}


			pstmt.close();

		}  catch (SQLException e) {

			// TODO Auto-generated catch block

			e.printStackTrace();

		}

	}



	public HashMap<String, Course> findAllMap() {

		return courses;

	}

	@Override

	public void addCourse(Course course) {

		// TODO Auto-generated method stub

		String sql = "insert into course values(?,?,?);";

		try {

			pstmt = DBUtil.getSqliteConnection().prepareStatement(sql);

			pstmt.setString(1, course.getCourseNo());

			pstmt.setString(2, course.getCourseName());

			pstmt.setDouble(3, course.getCredits());



			pstmt.executeUpdate();


			pstmt.close();


		} catch (SQLException e) {

			// TODO Auto-generated catch block

			e.printStackTrace();

		}

	}



	@Override

	public void deleteCourse(Course course) {

		// TODO Auto-generated method stub

		String sql = "DELETE FROM course where courseNo=?;";

		try {

			pstmt = DBUtil.getSqliteConnection().prepareStatement(sql);

			pstmt.setString(1, course.getCourseNo());

			pstmt.executeUpdate();

			pstmt.close();

		} catch (SQLException e) {

			// TODO Auto-generated catch block

			e.printStackTrace();

		}

	}



	@Override
	public Course getByCourseNo(String CourseNo) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public HashMap<String, Course> findAll() {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public void updateCourse(Course course) {
		// TODO Auto-generated method stub
		
	}



}