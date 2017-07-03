package mysql;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.SectionDao;
import model.Course;
import model.Professor;
import model.Section;
import model.User;

public class SectionDaoImpl implements SectionDao{

	@Override
	public HashMap<String, Section> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HashMap<String, Section> findBySemester(String semester) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addSection(Section section, Professor professor, String semester) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteSection(String FullSectionNo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateSection(Section section) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public HashMap<String, Section> findByProfessor(User user) {
		// TODO Auto-generated method stub
		return null;
	}
	}
