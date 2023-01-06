package kr.co.bookstore.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bookstore.dao.CustDAO;
import kr.co.bookstore.vo.CustVO;

@Service
public class CustService {
	
	@Autowired
	private CustDAO dao;
	
	public void insertCust(CustVO vo) {
		dao.insertCust(vo);
	}
	public CustVO selectCust(String id) {
		return dao.selectCust(id);
	}
	public List<CustVO> selectCusts() {
		return dao.selectCusts();
	}
	public void updateCust(CustVO vo) {
		dao.updateCust(vo);
	}
	public void deleteCust(String id) {
		dao.deleteCust(id);
	}
}
