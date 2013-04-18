<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page session="true"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<spring:theme code="mobile.custom.css.file" var="mobileCss" text="" />

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
<title>CAS &#8211; Central Authentication Service</title>

<c:set var="url">${pageContext.request.requestURL}</c:set>
<base href="${fn:substring(url, 0, fn:length(url) - fn:length(pageContext.request.requestURI))}${pageContext.request.contextPath}/" />

<c:if
	test="${not empty requestScope['isMobile'] and not empty mobileCss}">
	<meta name="viewport"
		content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<meta name="apple-mobile-web-app-status-bar-style" content="black" />
</c:if>
<spring:theme code="standard.custom.css.file" var="customCssFile" />
<link type="text/css" rel="stylesheet" href="css/bootstrap-combined.css" />
<link type="text/css" rel="stylesheet" href="<c:url value="${customCssFile}" />" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="icon" href="<c:url value="/favicon.ico" />"
	type="image/x-icon" />

<style type="text/css">
</style>

</head>
<body>
	<div class="wrap">
		<div class="main container">
			<div class="row spacer"></div>

			<c:if test="${not pageContext.request.secure}">
				<div class="alert">
					<h2>Non-secure Connection</h2>
					<p>You are currently accessing CAS over a non-secure
						connection. Single Sign On WILL NOT WORK. In order to have single
						sign on work, you MUST log in over HTTPS.</p>
				</div>
			</c:if>

			<div class="row-fluid sidetext-row">
				<div class="span4 visible-desktop sidetext-span">
					<div class="sidetext">
						Application for quality monitoring for <br />The Office of Health
						Standards <br />Compliance
					</div>
				</div>
				<div class="span8">

					<div class="row logo"></div>

					<div class="row form-row">
						<form:form method="post" commandName="${commandName}"
							htmlEscape="true">

							<form:errors path="*" class="alert alert-error" element="div" />

							<div class="control-group">
								<div class="controls">
									<c:if test="${not empty sessionScope.openIdLocalId}">
										<strong>${sessionScope.openIdLocalId}</strong>
										<input class="input-xlarge span4" placeholder="Username"
											stype="hidden" name="username"
											value="${sessionScope.openIdLocalId}" required />
									</c:if>
									<c:if test="${empty sessionScope.openIdLocalId}">
										<spring:message code="screen.welcome.label.netid.accesskey"
											var="userNameAccessKey" />
										<form:input class="input-xlarge span4" placeholder="Username"
											accesskey="${userNameAccessKey}" path="username"
											autocomplete="false" htmlEscape="true" />
									</c:if>
								</div>
							</div>

							<div class="control-group">
								<div class="controls">
									<spring:message code="screen.welcome.label.password.accesskey"
										var="passwordAccessKey" />
									<form:password class="input-xlarge span4"
										placeholder="Password" path="password"
										accesskey="${passwordAccessKey}" htmlEscape="true"
										autocomplete="off" id="password" size="25" />
								</div>

							</div>

							<div class="control-group">
								<div class="controls">
									<input type="hidden" name="lt" value="${loginTicket}" /> <input
										type="hidden" name="execution" value="${flowExecutionKey}" />
									<input type="hidden" name="_eventId" value="submit" />

									<button class="btn" name="submit" accesskey="l" type="submit">
										<spring:message code="screen.welcome.button.login" />
									</button>
								</div>
							</div>
						</form:form>

					</div>
				</div>
			</div>
		</div>
	</div>

	<footer class="footer visible-desktop">
	<div>
		<img src="http://ope.unizar.es/unizarEU2020/images/7/7c/Eu_logo.png"
			class="img" width="120px" /> <img
			src="http://www.aat.co.za/templates/ja_puresite/images/logo-trans.png"
			class="img" width="230px" /> <img
			src="http://www.cell-life.org/wp-content/uploads/2012/03/Cell-Life-Logo-Transparent-H-30mm1.png"
			class="img" width="180px" />

		<div class="footertext">©2013 Supported by a grant from the
			European Union. Powered by Cell-Life.</div>
	</div>
	</footer>

</body>
</html>