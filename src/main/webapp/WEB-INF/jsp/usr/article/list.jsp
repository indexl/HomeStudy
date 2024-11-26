<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="${board.getName() } 게시판" />

<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<section class="mt-8">
	<div class="container mx-auto">
		<div class="w-9/12 mx-auto mb-2 pl-3 text-sm flex justify-between items-end">
			<div>총 : ${articlesCnt }개</div>
			<form>
				<input type="hidden" name="boardId" value="${board.getId() }" />
				<div class="flex">
					<select class="select select-bordered select-sm mr-2" name="searchType">
						<option value="title" <c:if test="${searchType == 'title' }">selected="selected"</c:if>>제목</option>
						<option value="body" <c:if test="${searchType == 'body' }">selected="selected"</c:if>>내용</option>
						<option value="title,body" <c:if test="${searchType == 'title,body' }">selected="selected"</c:if>>제목 + 내용</option>
					</select>
					
					<label class="input input-bordered input-sm flex items-center gap-2 w-60">
					  <input type="text" class="grow" name="searchKeyword" placeholder="검색어를 입력해주세요" maxlength="25" value="${searchKeyword }"/>
					  <svg
					    xmlns="http://www.w3.org/2000/svg"
					    viewBox="0 0 16 16"
					    fill="currentColor"
					    class="h-4 w-4 opacity-70">
					    <path
					      fill-rule="evenodd"
					      d="M9.965 11.026a5 5 0 1 1 1.06-1.06l2.755 2.754a.75.75 0 1 1-1.06 1.06l-2.755-2.754ZM10.5 7a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0Z"
					      clip-rule="evenodd" />
					  </svg>
					</label>
					
					<button class="hidden">검색</button>
				</div>
			</form>
		</div>
		<div class="w-9/12 mx-auto">
			<table class="table table-lg">
				<colgroup>
					<col width="60" />
					<col />
					<col width="60" />
					<col width="200" />
					<col width="40"/>
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="article" items="${articles }">
						<tr class="hover">
							<td>${article.getId() }</td>
							<td class="link link-hover"><a href="detail?id=${article.getId() }">${article.getTitle() }</a></td>
							<td>${article.getLoginId() }</td>
							<td>${article.getRegDate().substring(2,16) }</td>
							<td>${article.getViews() }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<c:if test="${rq.getLoginedMemberId() != -1 }">
			<div class="w-9/12 mx-auto flex justify-end my-3">
				<a class="btn btn-active btn-sm" href="write">글쓰기</a>
			</div>
		</c:if>
		
		<div class="mt-2 flex justify-center">
			<div class="join">
				<c:set var="path" value="?boardId=${board.getId() }&searchType=${searchType }&searchKeyword=${searchKeyword }" />
			
				<c:if test="${from != 1 }">
					<a class="join-item btn btn-sm" href="${path }&cPage=1"><i class="fa-solid fa-angles-left"></i></a>
					<a class="join-item btn btn-sm" href="${path }&cPage=${from - 1 }"><i class="fa-solid fa-angle-left"></i></a>
				</c:if>
				
				<c:forEach var="i" begin="${from }" end="${end }">
					<a class="join-item btn btn-sm ${cPage == i ? 'btn-active' : '' }" href="${path }&cPage=${i }">${i }</a>
				</c:forEach>
				
				<c:if test="${end != totalPagesCnt }">
					<a class="join-item btn btn-sm" href="${path }&cPage=${end + 1 }"><i class="fa-solid fa-angle-right"></i></a>
					<a class="join-item btn btn-sm" href="${path }&cPage=${totalPagesCnt }"><i class="fa-solid fa-angles-right"></i></a>
				</c:if>
			</div>
		</div>
	</div>
</section>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>