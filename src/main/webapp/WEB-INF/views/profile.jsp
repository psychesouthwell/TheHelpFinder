<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.util.*"%>

<c:if test="${empty loggedInuser}">
	<c:redirect url="/login?expired=Session expired please login" />
</c:if>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Favicons Icon -->

<title>My Account</title>

<!-- Mobile Specific -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS Style -->
<link rel="stylesheet" type="text/css" href="static/css/internal.css">
<link rel="stylesheet" type="text/css"
	href="static/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="static/css/font-awesome.css" media="all">
<link rel="stylesheet" type="text/css"
	href="static/css/simple-line-icons.css" media="all">
<link rel="stylesheet" type="text/css" href="static/css/style.css"
	media="all">
<link rel="stylesheet" type="text/css" href="static/css/revslider.css">
<link rel="stylesheet" type="text/css"
	href="static/css/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="static/css/owl.theme.css">
<link rel="stylesheet" type="text/css" href="static/css/flexslider.css">
<link rel="stylesheet" type="text/css"
	href="static/css/jquery.mobile-menu.css">

<!-- Google Fonts -->
<link
	href='https://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800,900'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,300italic,300,600,600italic,400italic,700,700italic,800,800italic'
	rel='stylesheet' type='text/css'>
</head>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />


<body class="customer-account-index customer-account inner-page">
	<div class="container">

		<jsp:include page="components/header.jsp" />

		<!-- Navbar -->
		<jsp:include page="components/breadcrumb.jsp" />
		<!-- end nav -->


		<br>

		<!--col-right sidebar col-sm-3-->
		<div class="col-main col-sm-9 animated" style="visibility: visible;">
			<div class="my-account">
				<div class="page-title">
					<h1>
						Welcome back, ${user_account.firstName}! ${update} ${ses} <a
							href="#" data-toggle="modal" data-target="#edits"> <i
							class="fa fa-pencil"></i></a>
					</h1>
				</div>
				<div
					class="product-collateral col-lg-12 col-sm-12 col-xs-12 bounceInUp animated">
					<ul id="product-detail-tab" class="nav nav-tabs product-tabs">
						<li class="active"><a href="#acc_info" data-toggle="tab"
							aria-expanded="true"> Account Detail </a></li>

						<li class=""><a href="#acc_build" data-toggle="tab"
							aria-expanded="false">Build Profile</a></li>

						<c:if test="${role eq 'USER'}">
							<li class=""><a href="#acc_services" data-toggle="tab"
								aria-expanded="false">Recommended Services</a></li>
						</c:if>
						<li class=""><a href="#acc_password" data-toggle="tab"
							aria-expanded="false">Change Password</a></li>
					</ul>
					<div id="productTabContent" class="tab-content">
						<div class="tab-pane fade active in" id="acc_info">
							<div class="col-md-5 fieldset">
								<form:form action="updatemyinfo" modelAttribute="user"
									method="post" id="form-validate">
									<div class="fieldset">
										<input name="id" type="hidden" value="${user_account.id}">
										<h2 class="legend">
											<b>Edit Information</b>
										</h2>
										<ul class="form-list">
											<li class="fields">
												<div class="customer-name">
													<div class="input-box name-firstname">
														<label for="firstname">First Name<span
															class="required">*</span></label>
														<div class="input-box1">
															<input type="text" id="firstname" name="firstName"
																value="${user_account.firstName}" title=""
																maxlength="255" class="input-text required-entry">
														</div>
													</div>
													<div class="input-box name-lastname">
														<label for="lastname">Last Name<span
															class="required">*</span></label>
														<div class="input-box1">
															<input type="text" id="lastname" name="lastName"
																value="${user_account.lastName}" title=""
																maxlength="255" class="input-text required-entry">
														</div>
													</div>
												</div>
											</li>
										</ul>
									</div>
									<div class="buttons-set">
										<p class="required">* Required Fields</p>
										<button type="submit" title="Save" class="button">
											<span>Save</span>
										</button>
									</div>
								</form:form>
							</div>
							<div class="col-md-7 fieldset">
								<h2 class="legend">
									<b>My Information</b> <a href="#" data-toggle="modal"
										data-target="#addtel" class="btn btn-default">Add <i
										class="fa fa-plus"><i class="fa fa-phone-square"></i></i>
									</a>
								</h2>
								<table class="table">
									<tr class="text-success">
										<th>Item</th>
										<th>Detail</th>
									</tr>
									<tr class="text-success">
										<td>Name <i class="fa fa-user" aria-hidden="true"></i></td>
										<td>${user_account.firstName} ${user_account.lastName}</td>

									</tr>
									<tr class="text-success">
										<td>Email <i class="fa fa-envelope" aria-hidden="true"></i></td>
										<td>${user_account.email}</td>

									</tr>

									<tr class="text-success">
										<td>SES Status <i class="fa fa-users" aria-hidden="true"></i></td>
										<td>Income:
											${user_account.getSesFactors().householdIncome} , Family
											size: ${user_account.getSesFactors().householdSize}</td>

									</tr>

									<tbody>
									</tbody>
								</table>

								<!-- Programs could also be listed here later -->

							</div>

						</div>

						<!-- Start SES Factors Form-->
						<div class="tab-pane fade" id="acc_build">
							<div class="product-tabs-content-inner clearfix">
								<div class="col-md-6 fieldset">
									<form:form action="buildprofile" modelAttribute="sesfactors"
										method="post" id="form-validate">
										<h2 class="legend">Build Profile</h2>
										<ul class="form-list">

											<li class="fields"><input name="id" type="hidden"
												value="${user_account.id}"> <input name="email"
												type="hidden" value="${user_account.email}">


												<div class="field">
													<label for="confirmation">Household Income<em
														class="required">*</em></label>
													<div class="input-box">
														<input type="text" title="Household Income"
															class="input-text" name="householdIncome"
															value="${user_account.getSesFactors().householdIncome}"
															id="hhincome">
													</div>
												</div>

												<div class="field">
													<label for="confirmation">Household Size<em
														class="required">*</em></label>
													<div class="input-box">
														<input type="text" title="Enter household size"
															class="input-text" name="householdSize"
															value="${user_account.getSesFactors().householdSize}"
															id="hhsize">
													</div>
												</div>

												<div class="field">
													<label for="confirmation">Number of Children Under 13
														<em class="required">*</em>
													</label>
													<div class="input-box">
														<input type="text" title="Enter household children"
															class="input-text" name="numberOfKids"
															value="${user_account.getSesFactors().numberOfKids}"
															id="hhkids">
													</div>
												</div> <%-- <div class="field">
													<label for="confirmation">Prior Felony? Yes or No<em
														class="required">*</em></label>
													<div class="input-box">
														<input type="text" title="Enter yes or no"
															class="input-text" name="felony"
															value="${user_account.getSesFactors().felony}"
															id="felony">
													</div>
												</div>
												<div class="field">
													<label for="confirmation">Prior Program Use? Yes or
														No<em class="required">*</em>
													</label>
													<div class="input-box">
														<input type="text" title="Reply yes or no"
															class="input-text" name="priorProgramUse"
															value="${user_account.getSesFactors().priorProgramUse}"
															id="programuse">
													</div>
												</div> --%></li>
										</ul>

										<div class="buttons-set">
											<p class="required">* Required Fields</p>
											<button type="submit" title="Save" class="button">
												<span>Save</span>
											</button>
										</div>
									</form:form>
								</div>
							</div>
						</div>
						<!-- END SES Factors -->


						<!-- Start Program/Service Results | Demonstrating with 4 key income-based programs ONLY-->
						<div class="tab-pane fade" id="acc_services">
							<div class="product-tabs-content-inner clearfix">
								<div class="col-md-6 fieldset"></div>

								<h2 class="legend">Program/Service Matches</h2>

								<c:if
									test="${user_account.getSesFactors().householdIncome le (guide.povertyGuideline) *1.3 }">
									<li class="level2 nav-6-1-1"><a
										href="https://mydss.mo.gov/temporary-assistance"
										target="_blank"><span>Temporary Assistance to Needy
												Families</span></a></li>
								</c:if>

								<c:if
									test="${user_account.getSesFactors().householdIncome le (guide.povertyGuideline * 1.25)}">
									<li class="level2 nav-6-1-1"><a
										href="https://mydss.mo.gov/food-assistance/food-stamp-program"
										target="_blank"><span>Supplemental Nutrition
												Assistance Program</span></a></li>
								</c:if>

								<c:if
									test="${user_account.getSesFactors().numberOfKids > 0 && user_account.getSesFactors().householdIncome le guide.povertyGuideline *1.38}">
									<li class="level2 nav-6-1-1"><a
										href="https://dss.mo.gov/fsd/child-care.htm" target="_blank"><span>Child
												Care Assistance</span></a></li>
								</c:if>
								
								<c:if
									test="${user_account.getSesFactors().householdIncome le guide.povertyGuideline *1.4}">
									<li class="level2 nav-6-1-1"><a
										href="https://mydss.mo.gov/energy-assistance" target="_blank"><span>Energy Assistance(Utility bill)</span></a></li>
								</c:if>
								
							</div>
						</div>
						<!-- End Program/Service Results -->
					
						<!--Change password code -->
						<div class="tab-pane fade" id="acc_password">
							<div class="product-tabs-content-inner clearfix">
								<div class="col-md-6 fieldset">
									<form:form action="changepassword" modelAttribute="user"
										method="post">
										<div class="content">
											<ul class="form-list">
												<li><form:input type="hidden" path="id"
														class="form-control" placeholder="Password" /> <label
													for="password">Old Password <span class="required">*</span></label>
													<br> <form:input type="password" path="password"
														name="password" class="input-text" placeholder="Password" /></li>
												<li><label for="password">Create New Password <span
														class="required">*</span>
												</label> <br> <form:input type="password" path="password"
														name="password" class="input-text"
														placeholder="Retype Password" /></li>
											</ul>
											<p class="required">* Required Fields</p>
											<div class="buttons-set">
												<button id="send2" name="" type="submit"
													class="button login">
													<span>Change</span>
												</button>
											</div>
										</div>
									</form:form>
								</div>
							</div>
						</div>
											</div>

				</div>
				<!--dashboard-->
			</div>
		</div>

	</div>

	<!-- Main Container End -->

	<hr>


	<div class="modal fade" id="edits">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-">Update Info</h5>
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<!-- Modal body -->
				<div class="modal-body">

					<form:form action="updatemyinfo" modelAttribute="user"
						method="post" id="form-validate">

						<input name="id" type="hidden" value="${user_account.id}">
						<h2 class="legend">Edit Information</h2>
						<ul class="form-list">
							<li class="fields">
								<div class="customer-name">
									<div class="input-box name-firstname">
										<label for="firstname">First Name<span
											class="required">*</span></label>
										<div class="input-box1">
											<input type="text" id="firstname" name="firstName"
												value="${user_account.firstName}" title="" maxlength="255"
												class="input-text required-entry">
										</div>
									</div>
									<div class="input-box name-lastname">
										<label for="lastname">Last Name<span class="required">*</span></label>
										<div class="input-box1">
											<input type="text" id="lastname" name="lastName"
												value="${user_account.lastName}" title="" maxlength="255"
												class="input-text required-entry">
										</div>
									</div>
								</div>
							</li>
						</ul>

						<div class="buttons-set">
							<p class="required">* Required Fields</p>
							<button type="submit" title="Save" class="btn btn-info">
								<span>Save</span>
							</button>
							<button type="button" data-dismiss="modal" aria-label="Close"
								class="btn btn-danger">Close</button>
						</div>
					</form:form>


				</div>
			</div>
		</div>
	</div>


	<!-- Footer -->
	<jsp:include page="components/footer.jsp" />
	<!-- End Footer -->

	<!-- JavaScript -->
	<script type="text/javascript" src="static/js/jquery.min.js"></script>
	<script type="text/javascript" src="static/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="static/js/parallax.js"></script>
	<script type="text/javascript" src="static/js/common.js"></script>
	<script type="text/javascript" src="static/js/jquery.flexslider.js"></script>
	<script type="text/javascript" src="static/js/owl.carousel.min.js"></script>
	<script type="text/javascript"
		src="static/js/jquery.mobile-menu.min.js"></script>
	<script type="text/javascript" src="static/js/cloud-zoom.js"></script>
	<script type="text/javascript">
		
	</script>

</body>
</html>
