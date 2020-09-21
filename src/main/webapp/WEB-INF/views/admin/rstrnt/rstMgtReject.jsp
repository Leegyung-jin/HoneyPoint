<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
<link rel="stylesheet" href="${ contextPath }/resources/css/admin/admin.css" type="text/css"/>

<!-- Font setting -->
<!-- <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gothic+A1:wght@900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@100&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
</head>

<body>
	<%@ include file="../../common/menubar.jsp" %>
	<div class="container mt-3">
		<div class="container-second mt-10 col-2 ml-4 mr-4 float-left">
			<%@ include file="../common/sideMenu.jsp" %>
		</div>
	
		<div class="container-second mt-10 col-9 float-left" style="border: 0px">
			<!-- LoginUser & Preview -->
			<div class="w-100 h-25 mt-3 pl-3 pt-3 pb-1 overflow-auto">
			<h3>RSTRNT MANAGEMENT</h3>
				<div class="pb-2 float-right">
					<p class="rstrnt-menu-list pl-2" id="myTabContentTitle1">맛집 관리 ▶ 맛집 신청 반려 목록</p>					
				</div>
			</div>
			
			<div>
				<div class="btn-group btn-group-toggle pl-2 pb-1" data-toggle="buttons">
					<label class="btn btn-light radio-button radio-button-height" onclick="rSearch()">맛집 목록</label>
					<label class="btn btn-light radio-button radio-button-height" onclick="rstRegist()">신청 목록</label>
					<label class="btn btn-light radio-button radio-button-height active" onclick="rntReject()">불가 목록</label>					
				</div>
			</div>
			
			<!-- Board Area -->
			<div class="tab-content">
	 			<div class="tab-pane fade show active pl-2" id="home" role="tabpanel" aria-labelledby="home-tab">
				  	<div class="taplist"></div>
					<table class="table table-hover mb-0">
						<colgroup>
							<col width="15%"/>
							<col width="15%"/>
							<col width="40%"/>
							<col width="20%"/>							
						</colgroup>
						<thead class="btn-secondary non-hover">
							<tr>
								<th scope="col" class="th-center-title th-menu">신청 번호</th>
								<th scope="col" class="th-center-title th-menu">신청자</th>
								<th scope="col" class="th-center-title th-menu ">맛집 이름(주소)</th>								
								<!-- <th scope="col" class="th-center-title th-menu">반려 일자</th> -->
								<th scope="col" class="th-center-title th-menu ">게시 처리</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${list}">
								<tr>
									<td scope="col" class="th-center-txt td-txt"><c:out value="${ list.RNo }"/></td>
									<td scope="col" class="th-center-txt td-txt"><c:out value="${ list.MName }"/></td>
									<td scope="col" class="th-center-txt td-txt"><c:out value="${ list.RName } (${ list.RAddress }, ${ list.ROAddress })"/></td>
									<%-- <td scope="col" class="th-center-txt td-txt"><c:out value="${ list.RReturnCn }"/></td>
									<td scope="col" class="th-center-txt td-txt"><c:out value="${ list.RReturnDate }"/></td> --%>
									<td scope="col" class="th-center-txt td-txt"><button class="btn btn-outline-warning btn-delete" onclick="rejectInsert(${ list.RNo })">게시</button></td>
								</tr>
							</c:forEach>								
						</tbody>
					</table>
				</div>
				<table class="table">
					<!-- PAGING -->
					<tr align="center" height="20">
						<td colspan="6" class="pt-5 pagin-txt">
						
							<!-- [이전] -->
							<c:if test="${ sp.currentPage eq 1 }">
								<font color="lightgray">[이전] &nbsp;</font>
							</c:if>
							<c:if test="${ sp.currentPage ne 1 }">
								<c:url var="before" value="rntReject.do">
									<c:param name="currentPage" value="${ sp.currentPage - 1 }"/>
								</c:url>
								<a href="${ before }" style="color:black">[이전]</a> &nbsp;
							</c:if>
							
							<!-- PAGE NUMBER -->
							<c:forEach var="p" begin="${ sp.startPage }" end="${ sp.endPage }">
								<c:if test="${ p eq sp.currentPage }">
									<font color="orange" size="2"><b>[${ p }]</b></font>
								</c:if>
								
								<c:if test="${ p ne sp.currentPage }">
									<c:url var="pagination" value="rntReject.do">
										<c:param name="currentPage" value="${ p }"/>
									</c:url>
									<a href="${ pagination }" style="color:black">${ p }</a>
								</c:if>
							</c:forEach>
							
							<!-- [다음] -->
							<c:if test="${ sp.currentPage eq sp.maxPage }">
								<font color="lightgray">&nbsp;[다음]</font>
							</c:if>
							<c:if test="${ sp.currentPage ne sp.maxPage }">
								<c:url var="after" value="rntReject.do">
									<c:param name="currentPage" value="${ sp.currentPage + 1 }"/>
								</c:url>
								<a href="${ after }" style="color:black">&nbsp;[다음]</a>
							</c:if>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
<script>
function rSearch(){
	location.href="rSearch.do";
}	
function rstRegist(){
	location.href="rstRegist.do";
}	
function rntReject(){
	location.href="rntReject.do";
}

function rejectInsert(rNo){
	if(confirm("해당 맛집을 다시 등록하시겠습니까?")) {
		location.href="${ contextPath }/rejectInsert.do?rNo=" + rNo;
		alert("맛집 등록이 완료되었습니다.")
	} else{
		return false;
	}
}
</script>
</html>