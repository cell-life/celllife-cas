<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page session="true"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
<title>Cell-Life &#8211; Central Authentication Service</title>

<c:set var="url">${pageContext.request.requestURL}</c:set>
<base href="${fn:substring(url, 0, fn:length(url) - fn:length(pageContext.request.requestURI))}${pageContext.request.contextPath}/" />

<c:if test="${not empty requestScope['isMobile']}">
	<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<meta name="apple-mobile-web-app-status-bar-style" content="black" />
</c:if>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<link type="text/css" rel="stylesheet" href="css/bootstrap-combined.css" />
<link type="text/css" rel="stylesheet" href="<spring:theme code="css" />" />

<link rel="icon" href="<c:url value="/favicon.ico" />" type="image/x-icon" />

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

			<c:set var="sidetext"><spring:theme code="side.text" /></c:set>
			<c:choose>
			<c:when test="${not empty sidetext}">
				<div class="row sidetext-row">
				
					<div class="span4 visible-desktop sidetext-span">
						<div class="sidetext">
							${sidetext}
						</div>
					</div>
					
					<div class="span6">
						<div class="logo"></div>
						<div class="offset1">
			</c:when>
			<c:otherwise>
				<div class="row">
		            <div class="span3 visible-desktop"></div>
		            <div class="span6">
		                <div class="row">
		                    <div class="span6">
		                    	<div class="logo"></div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="span4 offset1">
			</c:otherwise>
			</c:choose>