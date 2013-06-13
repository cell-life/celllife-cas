<jsp:directive.include file="includes/top.jsp" />

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
									<input type="hidden" name="lt" value="${loginTicket}" />
									<input type="hidden" name="execution" value="${flowExecutionKey}" />
									<input type="hidden" name="_eventId" value="submit" />

									<button class="btn" name="submit" accesskey="l" type="submit">
										<spring:message code="screen.welcome.button.login" />
									</button>
								</div>
							</div>
						</form:form>

<jsp:directive.include file="includes/bottom.jsp" />