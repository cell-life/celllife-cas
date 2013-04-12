
<jsp:directive.include file="includes/top.jsp" />

<c:if test="${not pageContext.request.secure}">
	<div class="alert">
		<h2>Non-secure Connection</h2>
		<p>You are currently accessing CAS over a non-secure connection.
			Single Sign On WILL NOT WORK. In order to have single sign on work,
			you MUST log in over HTTPS.</p>
	</div>
</c:if>

<div>
	<!-- <spring:message code="screen.welcome.welcome" /> -->
	<form:form method="post" class="form-horizontal"
		commandName="${commandName}" htmlEscape="true">
		<legend>
			<spring:message code="screen.welcome.instructions" />
		</legend>
		<form:errors path="*" class="alert alert-error" element="div" />
		<div class="control-group">
			<label for="username" class="control-label"><spring:message
					code="screen.welcome.label.netid" /></label>
			<div class="controls">
				<c:if test="${not empty sessionScope.openIdLocalId}">
					<strong>${sessionScope.openIdLocalId}</strong>
					<input type="hidden" name="username"
						value="${sessionScope.openIdLocalId}" required />
				</c:if>
				<c:if test="${empty sessionScope.openIdLocalId}">
					<spring:message code="screen.welcome.label.netid.accesskey"
						var="userNameAccessKey" />
					<form:input accesskey="${userNameAccessKey}" path="username"
						autocomplete="false" htmlEscape="true" />
				</c:if>
			</div>
		</div>
		<div class="control-group">
			<label for="password" class="control-label"><spring:message
					code="screen.welcome.label.password" /></label>
			<%--
						NOTE: Certain browsers will offer the option of caching passwords for a user.  There is a non-standard attribute,
						"autocomplete" that when set to "off" will tell certain browsers not to prompt to cache credentials.  For more
						information, see the following web page:
						http://www.geocities.com/technofundo/tech/web/ie_autocomplete.html
						--%>
			<div class="controls">
				<spring:message code="screen.welcome.label.password.accesskey"
					var="passwordAccessKey" />
				<form:password id="password" size="25" path="password"
					accesskey="${passwordAccessKey}" htmlEscape="true"
					autocomplete="off" />
			</div>
		</div>
		<div class="control-group">
			<div class="controls">
				<label class="checkbox" for="warn"><spring:message
						code="screen.welcome.label.warn" /> <input type="checkbox"
					id="warn" name="warn" value="true"
					accesskey="<spring:message code="screen.welcome.label.warn.accesskey" />" />
				</label> <input type="hidden" name="lt" value="${loginTicket}" /> <input
					type="hidden" name="execution" value="${flowExecutionKey}" /> <input
					type="hidden" name="_eventId" value="submit" />
				<button class="btn" name="submit" accesskey="l" type="submit">
					<spring:message code="screen.welcome.button.login" />
				</button>

			</div>
	</form:form>
</div>
<jsp:directive.include file="includes/bottom.jsp" />