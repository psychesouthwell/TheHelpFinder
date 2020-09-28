<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="page" value="Access Denied"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<!--[if IE]>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Favicons Icon -->

<title>404</title>

<!-- Mobile Specific -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS Style -->
<link rel="stylesheet" type="text/css" href="static/css/internal.css">
<link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="static/css/font-awesome.css" media="all">
<link rel="stylesheet" type="text/css" href="static/css/simple-line-icons.css" media="all">
<link rel="stylesheet" type="text/css" href="static/css/style.css" media="all">
<link rel="stylesheet" type="text/css" href="static/css/revslider.css" >
<link rel="stylesheet" type="text/css" href="static/css/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="static/css/owl.theme.css">
<link rel="stylesheet" type="text/css" href="static/css/flexslider.css">
<link rel="stylesheet" type="text/css" href="static/css/jquery.mobile-menu.css">

<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800,900' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300italic,300,600,600italic,400italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
</head>

<body class="customer-account-login inner-page">
<div id="page"> 
  
<jsp:include page="components/header.jsp"/>
<jsp:include page="components/breadcrumb.jsp"/>
   
   
   <section class="content-wrapper bounceInUp animated">
    <div class="container">
      <div class="std">
        <div class="page-not-found">
          <h1>404</h1>
          <h3>Oops! The Page you requested was not found!</h3>
          <div><a href="home" class="btn-home"><span>Back To Home</span></a></div>
          <br><br>    
          <c:choose>
          <c:when test="${empty loggedInuser}">  
          <div><a href="login" class="btn-home"><span>Log In</span></a></div>
          <br><br>    
          <div><a href="register" class="btn-home"><span>Register</span></a></div>
          <br><br>
          </c:when>
          <c:otherwise>
          <div><a href="profile" class="btn-home"><span>Profile</span></a></div>
          <br><br>        
          <div><a href="logout" class="btn-home"><span>Log Out</span></a></div>
          </c:otherwise>
          </c:choose> 		
        </div>
      </div>
    </div>
  </section>
    </div> 
    <jsp:include page="components/footer.jsp"/>
</body>
</html>
