package dao;
public class DaoFactory {
	private static String daoName = "sqliteDao";
//	private static String daoName = "mock";
	/*
	 public static ScheduleDao createScheduleDao() {
		ScheduleDao result = null;
		try {
			Object o = Class.forName(daoName + "." + "ScheduleDao" + "Impl").newInstance();
			result = (ScheduleDao)o;
		} catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	*/
	public static CourseDao createCourseDao() {
		CourseDao result = null;
		try {
			Object o = Class.forName(daoName + "." + "CourseDao" + "Impl").newInstance();
			result = (CourseDao)o;
		} catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static SectionDao createSectionDao() {
		SectionDao result = null;
		try {
			Object o = Class.forName(daoName + "." + "SectionDao" + "Impl").newInstance();
			result = (SectionDao)o;
		} catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return result;
	}	
	
	public static UserDao createUserDao() {
		UserDao result = null;
		try {
			Object o = Class.forName(daoName + "." + "UserDao" + "Impl").newInstance();
			result = (UserDao)o;
		} catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return result;
	}

	public static PersonDao createPersonDao() {
		PersonDao result = null;
		try {
			Object o = Class.forName(daoName + "." + "PersonDao" + "Impl").newInstance();
			result = (PersonDao)o;
		} catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return result;
	}
	public static TranscriptDao createTranscriptDao() {
		TranscriptDao result = null;
		try {
			Object o = Class.forName(daoName + "." + "TranscriptDao" + "Impl").newInstance();
			result = (TranscriptDao)o;
		} catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return result;
	}
	public static PlanOfStudyDao createPlanOfStudyDao() {
		PlanOfStudyDao result = null;
		try {
			Object o = Class.forName(daoName + "." + "PlanOfStudyDao" + "Impl").newInstance();
			result = (PlanOfStudyDao)o;
		} catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
