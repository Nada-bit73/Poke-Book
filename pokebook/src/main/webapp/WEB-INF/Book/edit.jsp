<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="windows-1256">
<title>Poke Book</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script type="text/javascript" src="/js/app.js"></script>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css" />
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="d-flex justify-content-center m-4 container">
		<div class="align-items-center">
			<div class="row ml-5 mt-1 ">
				<div class="span6">
					<div class="row ml-5 mt-2 mr-3 ">
						<h1 class="green">Edit Expense:</h1>
						<!-- ----------------------------------------------------------- -->
						<form:form  class="form align-items-center mt-4" action="/books/${book.id}" method="POST" modelAttribute="book">
							<input type="hidden" name="_method" value="PUT">
							
						<div class="row mb-3">
							 <form:label class="form-label" path="expenseName">Expense Name:</form:label>
								<div class="col-12">
									<form:input type="text" path="expenseName" cssClass="form-control" cssErrorClass="form-control is-invalid"/>
									<form:errors cssClass="invalid-feedback" path="expenseName"/>
								</div>
							</div>	
						
							
							<div class="row mb-3">
							 <form:label class="form-label" path="vendor">Vendor:</form:label>
								<div class="col-12">
									<form:input type="text" path="vendor" cssClass="form-control" cssErrorClass="form-control is-invalid"/>
									<form:errors cssClass="invalid-feedback" path="vendor"/>
								</div>
							</div>		
							
							
							<div class="row mb-3">
							 <form:label class="form-label" path="amount">Amount:</form:label>
								<div class="col-12">
									<form:input type="text"  path="amount" cssClass="form-control" cssErrorClass="form-control is-invalid"/>
									<form:errors cssClass="invalid-feedback" path="amount"/>
								</div>
							</div>
							
							<div class="row mb-3">
							 <form:label class="form-label" path="description">Description:</form:label>
								<div class="col-12">
									<form:input type="text" path="description" cssClass="form-control" cssErrorClass="form-control is-invalid"/>
									<form:errors cssClass="invalid-feedback" path="description"/>
								</div>
							</div>

							<div class="row mb-3">
								<div class="col-12">
									<button class="btn btn-large btn-dark" type="submit">submit</button>
								</div>
							</div>

						</form:form>

						<!-- -------------------------------------------------------- -->
						<form class="form align-items-right ml-4 mt-2" action="/books" method="POST">
							
							<button type="submit" class="btn btn-link text-right">Go Back</button>
								
						</form>

					</div>

				</div>

			</div>
		</div>
	</div>
</body>
</html>