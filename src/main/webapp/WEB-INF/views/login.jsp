<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="page" value="login"/>
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

<title><spring:message code="login.now"/></title>

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
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	
<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800,900' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300italic,300,600,600italic,400italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
</head>

<body class="customer-account-login inner-page">
<div id="page"> 
  
  <!-- Header -->
  <jsp:include page="components/header.jsp"/>
  <!-- end header --> 
  <jsp:include page="components/breadcrumb.jsp"/>
   
  <!-- Main Container -->
  <section class="main-container col1-layout bounceInUp animated">
    <div class="main container">
      <div class="account-login">
        <div class="page-title">
          <h1><spring:message code="login.msg" /></h1>
        </div>
        <fieldset class="col2-set">
          <legend><spring:message code="login.msg"/></legend>
          <div class="col-1 new-users"><strong><spring:message code="new.cust"/></strong>
            <div class="content">
              <p><spring:message code="create" /></p>
             <div class="buttons-set">
                <a href="register" class="button create-account">
                <button class="button create-account"><span><spring:message code="new.create"/></span></button>
                </a>
                
                
              </div>
            </div>
          </div>
          <div class="col-2 registered-users"><strong><spring:message code="label.cust"/> </strong>
            <form action="login" method="post">
            <div class="content">
              <h3 class="text-Success"> 
                <spring:message code="login.now"/>
                </h3>
                <h4 class="text-muted">
                <span class="required">${error} ${param.expired}</span>
                </h4>
              <p><spring:message code="label.login"/></p>
              <ul class="form-list">
                <li>
                  <label for="email"><spring:message code="label.email" />  <span class="required">*</span></label>
                  <br>
                  <input type="text" title="" class="input-text" id="user" name="email" placeholder="<spring:message code="label.email" />" >
                </li>
                <li>
                  <label for="password"><spring:message code="label.pass" /> <span class="required">*</span></label>
                  <br>
                  <input type="password" title="" id="pass" class="input-text" name="password" placeholder="<spring:message code="label.pass" />" >
                </li>
              </ul>
              <p class="required">*<spring:message code="required" /></p>
              <div class="buttons-set">
                <button id="send2" name="" type="submit" class="button login"><span><spring:message code="login.now"/></span></button>
               <a href="#" data-toggle="modal" data-target="#pswrd" class="forgot-word"><spring:message code="label.forgot"/> </a>
                </div>
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
  
 				<div class="modal fade" id="pswrd">
					    <div class="modal-dialog modal-md">
						<div class="modal-content">	
						<div class="modal-header">
			                <h5 class="modal-"><spring:message code="label.forgot"/>
			                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
			                </h5>
			              </div>      
						<!-- Modal body -->
						<div class="modal-body">			    		
			    		  
	                      <form method="POST" action="#"  method="post" id="form-validate" >			                 
			                  <ul class="form-list">
			                    <li class="fields">
			                      <div class="customer-name">
			                        <div class="input-box name-firstname">
			                          <label for="userEmail"><spring:message code="label.email" /><span class="required">*</span></label>
			                          <div class="input-box1">
			                             <input id="email" name="userEmail" maxlength="255" placeholder="<spring:message code="label.email" />" class="input-text required-entry">
			                          </div>
			                        </div>			                       
			                      </div>
			                    </li>
			                  </ul>
			                <p class="legend"><spring:message code="reset.msg" /></p>	                
			                <div class="buttons-set">
			                  <button type="submit" title="Save" class="btn btn-info"><span><spring:message code="token" /></span></button>
			                  <button type="button" data-dismiss="modal" aria-label="Close" class="btn btn-danger"><spring:message code="close" /></button>
			                </div>
			              </form>
		             
			    		  
	                     </div>
					    </div>	
				      </div>
					  </div>
					  
					   
                     
  <!-- Main Container End --> 
  
  <jsp:include page="components/footer.jsp"/>
  
 
</div>
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