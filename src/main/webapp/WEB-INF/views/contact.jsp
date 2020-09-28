<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<title>Contact Us</title>

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

<body class="contacts-index-index rtl inner-page">
<div id="page"> 
  
<!-- Header -->
<jsp:include page="components/header.jsp"/>
<!-- end header --> 

<!-- Navbar -->
<jsp:include page="components/breadcrumb.jsp"/>
<!-- end nav -->
  
  <!-- Main Container -->
  <section class="main-container col2-right-layout">
    <div class="main container">
    
    <h2 style="text-align:center text-success">${success}</h2>
    <h2 style="text-align:center text-danger">${error}</h2>
    
      <div class="row">
        <section class="col-main col-sm-9">
          <div class="page-title">
            <h1>Contact Us</h1>
          </div>
          <div class="static-contain">
          <form action="sendemail" method="post" id="contact-form" role="form">
            <fieldset class="group-select">
              <ul>
                <li id="billing-new-address-form">
                  <fieldset>
                    <legend>New Address</legend>
                    <input type="hidden"  id="billing:address_id">
                    <ul>
                      <li>
                        <div class="customer-name">
                          <div class="input-box name-firstname">
                            <label for="billing:firstname"> Name<span class="required">*</span></label>
                            <br>
                            <input type="text" id="name" name="name" title="First Name" class="input-text ">
                          </div>
                          <div class="input-box name-lastname">
                            <label for="billing:lastname"> Email Address <span class="required">*</span> </label>
                            <br>
                            <input type="text" id="email" name="email" title="Email" class="input-text">
                          </div>
                          <div class="input-box name-lastname">
                            <label for="billing:lastname"> Subject <span class="required">*</span> </label>
                            <br>
                            <input type="text" id="subject" name="subject" title="Subject" class="input-text">
                          </div>
                        </div>
                      </li>
                      
                      <li class="">
                        <label for="comment">Comment<em class="required">*</em></label>
                        <br>
                        <div style="float:none" class="">
                          <textarea name="message" id="message" title="Message" class="input-text" cols="5" rows="3"></textarea>
                        </div>
                      </li>
                    </ul>
                  </fieldset>
                </li>
                <span class="require"><em class="required">* </em>Required Fields</span>
                <div class="buttons-set">
                  <button type="submit" title="Submit" class="button submit"> <span> Submit </span> </button>
                </div>
              </ul>
            </fieldset>
            </form>
          </div>
        </section>
        <aside class="col-right sidebar col-sm-3">
          <div class="block block-company">
            <div class="block-title">Company </div>
            <div class="block-content">
              <ol id="recently-viewed-items">
                <li class="item last"><strong>Contact Us</strong></li>
                <li class="item odd"><a href="about">About Us</a></li>
                <li class="item even"><a href="login">Log in/Create account</a></li>
                <li class="item  odd"><a href="privacy">Privacy</a></li>                
              </ol>
            </div>
          </div>
        </aside>
      </div>
    </div>
  </section>
  <!-- Main Container End --> 
  
  <!-- Footer -->  
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