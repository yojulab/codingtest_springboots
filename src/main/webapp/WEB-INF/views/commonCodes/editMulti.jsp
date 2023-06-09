<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
				integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
				crossorigin="anonymous" />

			<div class="container mt-1">
				<c:set var="form_action" value="updateMulti" />
				<c:if test="${empty resultMap}">
					<c:set var="form_action" value="insertMulti" />
				</c:if>

				<form action="/commonCode/${form_action}" method="post" enctype="multipart/form-data">
					<input type="hidden" name="REGISTER_SEQ" value="UUID-1111-1111111">
					<input type="hidden" name="MODIFIER_SEQ" value="UUID-1111-1111111">
					<input type="hidden" name="PARENT_COMMON_CODE_ID" value="${resultMap.PARENT_COMMON_CODE_ID}">

					<c:choose>
						<c:when test='${empty resultMap.attachFiles}'>
							<div class="form-group form-row">
								<label class="form-label">File Upload</label>
								<input type="file" name="file_first" class="form-control">
							</div>
						</c:when>
						<c:otherwise>

							<c:forEach items="${resultMap.attachFiles}" var="resultData" varStatus="loop">
								<div class="form-group form-row">
									<label class="form-label">File Upload</label>
									<input type="file" name="file_${loop.index}" class="form-control">
									<a
										href="/files/${resultData.PHYSICALFILE_NAME}/${resultData.ORGINALFILE_NAME}">${resultData.ORGINALFILE_NAME}</a>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>

					<div class="form-group form-row">
						<div class="col">
							<label>코드 ID</label> <input class="form-control" type="text" name="COMMON_CODE_ID"
								value="${resultMap.COMMON_CODE_ID}" required ${form_action=="update" ? "readonly" : ""
								} />
							<div class="invalid-tooltip">

							</div>
						</div>
					</div>
					<div class="form-group form-row">
						<div class="col">
							<label>코드명 </label> <input class="form-control" type="text" name="NAME"
								value="${resultMap.NAME}" placeholder="임시 코드명" required ${statusDisabled} />
							<div class="invalid-tooltip">

							</div>
						</div>
					</div>
					<div class="form-group form-row">
						<div class="col">
							<label>표시 순서 <span class="text-muted">(
									<spring:message code="text.option" />)
								</span></label>
							<select class="form-control" name="ORDER_NUMBER" ${statusDisabled}>
								<%-- for(int number=1;number <=5: number++) { --%>
									<c:forEach var="number" begin="1" end="5">
										<option ${resultMap.ORDER_NUMBER==number ? 'selected' : '' }>${number }</option>
									</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group form-row">
						<div class="col">
							<label>설명 <span class="text-muted">(
									<spring:message code="text.option" />)
								</span></label>
							<textarea class="form-control" rows="3" name="DESCRIPTION" placeholder=""
								${statusDisabled}>${resultMap.DESCRIPTION }</textarea>
						</div>
					</div>
					<div class="form-group form-row">
						<div class="col">
							<div class="form-check">
								<input type="checkbox" class="form-check-input" name="SYSTEM_CODE_YN"
									${resultMap.SYSTEM_CODE_YN=='Yes' ? 'checked' : '' } ${statusDisabled}>
								<label class="form-check-label">시스템 코드
									여부</label>
							</div>
						</div>
					</div>
					<div class="form-group form-row">
						<div class="col">
							<div class="form-check">
								<input type="checkbox" class="form-check-input" name="USE_YN" ${resultMap.USE_YN=='Yes'
									? 'checked' : '' } ${statusDisabled}> <label class="form-check-label">사용 여부</label>
							</div>
						</div>
					</div>
					<div class="row justify-content-between">
						<div class="col">
							<button class="btn btn-primary">
								${form_action}
							</button>
							<button class="btn btn-outline-info"
								formaction="/commonCode/listPagination/${param.currentPage}">
								List
							</button>
						</div>

						<div class="col text-right">
							<%-- <button type="button" class="btn btn-secondary" data-dismiss="modal">

								</button> --%>
						</div>
					</div>
				</form>
			</div>