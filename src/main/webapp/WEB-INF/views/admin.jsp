<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.util.*"%>

<c:if test="${role ne 'ADMIN' && role ne 'DBA'}">
<c:redirect url="/accessdenied"/>
</c:if>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>Admin</title>

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

<body class="customer-account-login inner-page">

	<jsp:include page="components/header.jsp" />
	<jsp:include page="components/breadcrumb.jsp" />

	<br>
	
	<div class="container">
         <hr>
  			<div class="col-lg-10">
              <form action="search" method="post" class="form-inline">
			    <input id="searchnow" class="form-control mr-sm-2" type="text" name="keyword" placeholder="Search users">
			    
			    <button class="btn btn-success" type="submit">Search</button>
			  </form>
			  
			   <hr>
              <table class="table table-striped">
                <tr class="text-info">
					 <th>#</th>					
					 <th>Name</th>
					 <th>Email</th>
					 <th>Roles</th>
					 <th>Action</th>
			    </tr>
			    
			    <c:forEach var="item" items="${list}">
				<tr class="text-body">
					<td>${list.indexOf(item)+1}.</td>	
										
					
					<td>${item.firstName} ${item.lastName}</td>	
					<td>${item.email}</td>	
					<td>
					<form method="POST" action="editrole" >		    									
							<input type="hidden" name="id" value="${item.id}" />		    	 
							<select onchange="this.form.submit()" name="role" class="form-control">
							<option value="${item.role}">${item.role}</option>
							<option value="USER">USER </option>
							<option value="DBA">DBA</option>
							<option value="ADMIN">ADMIN</option>												  
						 </select>												
					 </form>
					</td>
					<td>
					<a href="removeuser?id=${item.id}" onclick="confirmed(); return false;" title="Delete member ${item.firstName} ${item.lastName}" class="btn btn-danger"> <i class="fa fa-trash"></i></a>
                   <!-- <a href="#" data-toggle="modal" data-target="#edits${item.id}" class="btn btn-secondary"><i class="fa fa-pencil"></i></a>   -->
                    </td>			
				</tr>
				</c:forEach>
				
				<tbody>
				</tbody>
				</table>
				
            </div>
            		
	<script>
		function confirmed() {
			if (confirm('You are about to delete, Do you want to proceed?')) {
				document.getElementById("del").submit();
				return true;
			} else {
				return false;
			}
		}

		$("#searchnow").keyup(function() {
			var value = this.value.toLowerCase().trim();

			$("table tr").each(function(index) {
				if (!index)
					return;
				$(this).find("td").each(function() {
					var id = $(this).text().toLowerCase().trim();
					var not_found = (id.indexOf(value) == -1);
					$(this).closest('tr').toggle(!not_found);
					return not_found;
				});
			});
		});
	</script>
</body>
</html>