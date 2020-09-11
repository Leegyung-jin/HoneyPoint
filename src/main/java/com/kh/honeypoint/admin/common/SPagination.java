package com.kh.honeypoint.admin.common;

public class SPagination {
	
	public static SearchPaging getPageInfo(int currentPage, int listCount) {
		SearchPaging sp = null;		// 페이지 정보를 담아 줄 PageInfo 참조변수 선언
		
		int pageLimit = 10;	// 한 페이지에 보여질 페이징바의 갯수
		int maxPage;		// 마지막 페이지
		int startPage;		// 페이징 시작
		int endPage;		// 페이징 끝
		
		int boardLimit = 10;	// 한 페이지 보여질 게시글 개수
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		sp = new SearchPaging(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		
		return sp;
	}
}
