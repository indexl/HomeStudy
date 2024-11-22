<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="상세보기" />

<%@ include file="/WEB-INF/jsp/common/header.jsp"%>

<section class="mt-8">
	<div class="container mx-auto">
		<div class="w-9/12 mx-auto">
			<table class="table table-lg">
				<tr>
					<th>번호</th>
					<td>${article.getId() }</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${article.getRegDate().substring(2, 16) }</td>
				</tr>
				<tr>
					<th>수정일</th>
					<td>${article.getUpdateDate().substring(2, 16) }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${article.getLoginId() }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${article.getTitle() }</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${article.getBody() }</td>
				</tr>
			</table>
		</div>

		<div class="w-9/12 mx-auto mt-3 text-sm flex justify-between">
			<div>
				<button class="btn btn-active btn-sm" onclick="history.back();">뒤로가기</button>
			</div>
			<c:if test="${rq.getLoginedMemberId() == article.getMemberId() }">
				<div>
					<a class="btn btn-active btn-sm"
						href="modify?id=${article.getId() }">수정</a> 
					<a class="btn btn-active btn-sm"
						onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;"
						href="doDelete?id=${article.getId() }">삭제</a>
				</div>
			</c:if>
		</div>

		<!-- 댓글 작성 섹션 -->
		<div class="w-9/12 mx-auto mt-8">
			<h3 class="text-lg font-bold">댓글 작성</h3>
			<form action="../reply/doWrite" method="post" class="mt-4">
				<div class="flex flex-col space-y-3">
					<textarea 
						name="body" 
						class="textarea textarea-bordered w-full h-24"
						placeholder="댓글을 입력하세요."
						required></textarea>
					<input type="hidden" name="relId" value="${article.getId() }" />
					<input type="hidden" name="relTypeCode" value="article"/>
					<div class="flex justify-end">
						<button type="submit" class="btn btn-primary">댓글 작성</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>







<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>