<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>
	<c:when test="${not empty sidetext}">
					</div>
				</div>
			</div>
	</c:when>
	<c:otherwise>
                    </div>
                </div>
                <div class="row">
			</div>
	</c:otherwise>
</c:choose>

		</div>
	</div>

	<c:set var="footertext"><spring:theme code="footer.text" /></c:set>
	
	<c:if test="${not empty footertext}">
		<footer class="footer visible-desktop">
		<div>
			<div class="footerimg"></div>
			<div class="footertext">${footertext}</div>
		</div>
		</footer>
	</c:if>

</body>
</html>