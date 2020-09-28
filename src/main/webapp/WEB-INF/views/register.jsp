<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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

<title>Register</title>

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

<jsp:include page="components/header.jsp"/>
<jsp:include page="components/breadcrumb.jsp"/>

  
  <!-- Main Container -->
  <section class="main-container col1-layout bounceInUp animated">
    <div class="main container">
      <div class="account-login">
        <div class="page-title">
          <h1>Create an Account</h1>
        </div>
        <fieldset class="col2-set">
          <legend>Create an Account</legend>
          
            <div class="content">
              <p>If you don't have an account with us, create one today.</p>
         	  <form action="signup" method="post">
              <ul class="form-list">          
                <li>
                  <label for="email">First Name <span class="required">*</span></label>
                  <br>
                  <input type="text" title="firstName" class="input-text" id="firstName" value="" name="firstName">
                </li>
                <li>
                  <label for="email">Last Name <span class="required">*</span></label>
                  <br>
                  <input type="text" title="lastName" class="input-text" id="lastName" value="" name="lastName">
                </li>
                <li>
                  <label for="email">Email Address <span class="required">*</span></label>
                  <br>
                  <input type="text" title="email" class="input-text" id="email" value="" name="email">
                </li>
                <li>
                  <label for="pass">Password <span class="required">*</span></label>
                  <br>
                  <input type="password" title="password" id="pass" class="input-text" name="password">
                </li>
                <li>
                  <label for="pass">Re-Enter Password <span class="required">*</span></label>
                  <br>
                  <input type="password" title="password2" id="pass" class="input-text" name="password2">
                </li>                
              </ul>            
              <p class="required">* Required Fields</p>
              <div class="buttons-set">
                <button id="submit-login" type="submit" class="button login"><span>Register</span></button>
              </div>
               </form>
            </div>
       
        </fieldset>
      </div>
      <br>
      <br>
      <br>
      <br>
      <br>
    </div>
  </section>
  <!-- Main Container End --> 
  <jsp:include page="components/footer.jsp"/>
  
<!-- JavaScript --> 
<script type="text/javascript" src="static/js/jquery.min.js"></script> 
<script type="text/javascript" src="static/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="static/js/parallax.js"></script> 
<script type="text/javascript" src="static/js/common.js"></script> 
<script type="text/javascript" src="static/js/jquery.flexslider.js"></script> 
<script type="text/javascript" src="static/js/owl.carousel.min.js"></script> 
<script type="text/javascript" src="static/js/jquery.mobile-menu.min.js"></script> 
<script type="text/javascript" src="static/js/cloud-zoom.js"></script>
</body>
</html>