<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- Header -->
<header>
	<div class="header-container">
		<div class="header-top">
			<div class="container">
				<div class="row">

					<!-- Header Language -->
					<div class="col-xs-7 col-sm-6">
						<div class="dropdown block-language-wrapper hidden-xs">
							<a role="button" data-toggle="dropdown" data-target="#"
								class="block-language dropdown-toggle" href="#"> 
								<c:choose>
									<c:when test="${param.lang !=null}">
										<spring:message code="${param.lang}" />
									</c:when>
									<c:otherwise>English</c:otherwise>
								</c:choose> <span class="caret"></span>
							</a>
							<ul class="dropdown-menu" role="menu">
								<li role="presentation"><a role="menuitem" tabindex="-1"
									href="?lang=en"> English </a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1"
									href="?lang=sp"> Spanish </a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1"
									href="?lang=fr"> French </a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1"
									href="?lang=ge"> German </a></li>
							</ul>
						</div>

						<!-- End Header Language -->

						<div class="welcome-msg hidden-xs">Welcome to The Help
							Finder!</div>
					</div>


					<div class="col-xs-5 col-sm-6">


						<!-- Header Top Links -->
						<div class="toplinks">
							<div class="links">

								<c:choose>
									<c:when test="${empty loggedInuser}">
										<div class="login">
											<a href="login" id="loginid"><span class="hidden-xs">Log
													In</span></a>
										</div>
										<div class="login">
											<a href="register" id="registerid"><span
												class="hidden-xs">Register</span></a>
										</div>
									</c:when>
									<c:otherwise>
										<div class="myaccount">
											<a title="My Profile" href="profile"><span
												class="hidden-xs">My Profile</span></a>
										</div>
										<c:if test="${role eq 'ADMIN' or role eq 'DBA'}">
											<div class="myaccount">
												<a title="Admin" href="admin"><span class="hidden-xs">Admin</span></a>
											</div>
										</c:if>
										<div>
											<a title="Log Out" href="logout"><span class="hidden-xs">Log
													Out</span></a>
										</div>
									</c:otherwise>
								</c:choose>
								<!-- Header Company -->

								<!-- End Header Company -->

							</div>

						</div>
						<!-- End Header Top Links -->

					</div>
				</div>
			</div>
		</div>
	</div>
</header>
<!-- end header -->
