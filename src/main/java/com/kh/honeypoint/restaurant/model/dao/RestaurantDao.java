package com.kh.honeypoint.restaurant.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.honeypoint.restaurant.model.vo.Favor;
import com.kh.honeypoint.restaurant.model.vo.InsertReviewImg;
import com.kh.honeypoint.restaurant.model.vo.Photofile;
import com.kh.honeypoint.restaurant.model.vo.Reservation;
import com.kh.honeypoint.restaurant.model.vo.Restaurant;
import com.kh.honeypoint.restaurant.model.vo.Review;
import com.kh.honeypoint.restaurant.model.vo.ReviewCount;
import com.kh.honeypoint.restaurant.model.vo.ReviewImg;
import com.kh.honeypoint.restaurant.model.vo.RstrntMenu;
import com.kh.honeypoint.restaurant.model.vo.UpdateReviewImg;

@Repository("rDao")
public class RestaurantDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void addReadCount(int rNo) {
		sqlSession.update("restaurantMapper.updateCount", rNo);
		
	}

	public Restaurant selectRestaurant(int rNo) {
		return sqlSession.selectOne("restaurantMapper.selectOne", rNo);
	}

	public int selectImgListCount(int rNo) {
		return sqlSession.selectOne("restaurantMapper.selectImgListCount", rNo);
	}

	public ArrayList<Photofile> selectImgList(int rNo) {
		return (ArrayList)sqlSession.selectList("restaurantMapper.selectImgList", rNo);
	}

	public ArrayList<RstrntMenu> selectMenuList(int rNo) {
		return (ArrayList)sqlSession.selectList("restaurantMapper.selectMenuList", rNo);
	}

	public ArrayList<Review> selectReviewList(HashMap<String, Integer> value) {
		int offset = (value.get("startNum") - 1) * 5;
		RowBounds rowBounds = new RowBounds(offset, 5);
		return (ArrayList)sqlSession.selectList("restaurantMapper.selectReviewList", value, rowBounds);
	}

	public ReviewCount selectReviewCount(int rNo) {
		return sqlSession.selectOne("restaurantMapper.selectReviewCount", rNo);
	}

	public ArrayList<ReviewImg> selectReviewImgList(HashMap<String, Integer> value) {
		return (ArrayList)sqlSession.selectList("restaurantMapper.selectReviewImgList", value);
	}

	public ArrayList<Review> selectReviewFilterList(HashMap<String, Integer> value) {
		int offset = (value.get("startNum") - 1) * 5;
		RowBounds rowBounds = new RowBounds(offset, 5);
		return (ArrayList)sqlSession.selectList("restaurantMapper.selectReviewFilterList", value, rowBounds);
	}

	public int insertReview(Review rev) {
		return sqlSession.insert("restaurantMapper.insertReview", rev);
	}

	public int insertReviewImg(InsertReviewImg value) {
		return sqlSession.insert("restaurantMapper.insertReviewImg", value);
	}

	public Review selectReview(int rNo, int revNo) {
		Review rev = new Review();
		rev.setRNo(rNo);
		rev.setRevNo(revNo);
		return sqlSession.selectOne("restaurantMapper.selectReview", rev);
	}

	public String deleteImgFile(ReviewImg revImg) {
		String fileName = sqlSession.selectOne("restaurantMapper.selectReviewImg", revImg);
		
		int result1 = sqlSession.delete("restaurantMapper.deleteReviewImg", revImg);
		
		if(result1 != 0) {
			int count = sqlSession.selectOne("restaurantMapper.selectReviewImgListCount", revImg);
			ArrayList<String> originFileList = new ArrayList<String>();
			
			for(int i = 0; i < count; i++) {
				originFileList.add(Integer.toString(i));
			}
			
			InsertReviewImg value = new InsertReviewImg();
			value.setRevNo(revImg.getRevNo());
			value.setRNo(revImg.getRNo());
			value.setOriginFileList(originFileList);
			
			int result2 = sqlSession.update("restaurantMapper.updateNumber", value);
			
			if(result2 == 0) {
				System.out.println("fileNo 재설정 실패");
			}
		}else {
			fileName = "";
		}
		
		return fileName;
	}

	public int deleteReviewImg(Review rev, String[] names) {
		HashMap<String, String[]> value = new HashMap<String, String[]>();
		
		value.put("names", names);
		
		int result = sqlSession.delete("restaurantMapper.deleteReviewImg", value);

		
		return result;
	}

	public int updateReviewImg(UpdateReviewImg value) {
		return sqlSession.insert("restaurantMapper.updateReviewImg", value);
	}

	public int updateReview(Review rev) {
		return sqlSession.update("restaurantMapper.updateReview", rev);
	}

	public int deleteReviewImage(String name) {
		return sqlSession.delete("restaurantMapper.deleteReviewImage", name);
	}

	public int deleteReview(int revNo) {
		return sqlSession.delete("restaurantMapper.deleteReview", revNo);
	}

	public ArrayList<String> getRevImgNames(int revNo) {
		return (ArrayList)sqlSession.selectList("restaurantMapper.getRevImgNames", revNo);
	}

	public int selectFavorCount(int rNo) {
		return sqlSession.selectOne("restaurantMapper.selectFavorCount", rNo);
	}

	public int insertFavor(Favor favor) {
		return sqlSession.insert("restaurantMapper.insertFavor", favor);
	}

	public int deleteFavor(Favor favor) {
		return sqlSession.delete("restaurantMapper.deleteFavor", favor);
	}

	public Favor selectFavor(Favor inputFavor) {
		return sqlSession.selectOne("restaurantMapper.selectFavor", inputFavor);
	}

	public int insertResve(Reservation resve) {
		return sqlSession.insert("restaurantMapper.insertResve", resve);
	}

	public int insertPoint(Reservation resve) {
		return sqlSession.insert("restaurantMapper.insertPoint", resve);
	}

	public ArrayList<Reservation> selectResveList(int rNo) {
		return (ArrayList)sqlSession.selectList("restaurantMapper.selectResve", rNo);
	}

}
