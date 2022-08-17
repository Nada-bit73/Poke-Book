<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	<div class="container">
		<c:if test="${success != null}">
			<div class="alert alert-success" role="alert">
				<c:out value="${success}" />
			</div>
		</c:if>
	</div>
	<div class="d-flex justify-content-center m-4 container">
		<div class="align-items-center">
			<div class="row ml-5 mt-1 ">
				<div class="span6">
					<h1>PokeBook</h1>
					<c:if test="${books != null}">
						<table class="table table-hover table-dark mt-4">
							<thead>
								<tr>
									<th colspan="1">Expense</th>
									<th colspan="1">Vendor</th>
									<th colspan="1">Amount</th>
									<th colspan="2">Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="myBook" items="${books}">
									<tr>
										<td colspan="1"><a href="books/${myBook.id}/view">
										<c:out value="${myBook.expenseName}" />
										</a>
										
										</td>
										<td colspan="1"><c:out value="${myBook.vendor}" /></td>
										<td colspan="1">$ <c:out value="${myBook.amount}" /></td>
										<td colspan="1"><a href="books/${myBook.id}/edit">Edit</a></td>
										<td colspan="1">
										<form action="/books/${myBook.id}" method="POST">
											<input type="hidden" name="_method" value="DELETE"> 
											<input type="submit" value="Delete" class="btn btn-link mb-1">
										</form>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:if>

					<form:form class="form align-items-center mt-4"
						modelAttribute="book" action="/books/create" method="POST">

						<h2 class="form-heading mb-5">Track an expense:</h2>
						<div class="row mb-3">
							<form:label class="form-label" path="expenseName">Expense Name:</form:label>
							<div class="col-12">
								<form:input type="text" path="expenseName"
									cssClass="form-control" cssErrorClass="form-control is-invalid" />
								<form:errors cssClass="invalid-feedback" path="expenseName" />
							</div>
						</div>

						<div class="row mb-3">
							<form:label class="form-label" path="vendor">Vendor:</form:label>
							<div class="col-12">
								<form:input type="text" path="vendor" cssClass="form-control"
									cssErrorClass="form-control is-invalid" />
								<form:errors cssClass="invalid-feedback" path="vendor" />
							</div>
						</div>

						<div class="row mb-3">
							<form:label class="form-label" path="amount">Amount:</form:label>
							<div class="col-12">
								<form:input type="text" path="amount" cssClass="form-control"
									cssErrorClass="form-control is-invalid" />
								<form:errors cssClass="invalid-feedback" path="amount" />
							</div>
						</div>

						<div class="row mb-3">
							<form:label class="form-label" path="description">Description:</form:label>
							<div class="col-12">
								<form:input type="text" path="description"
									cssClass="form-control" cssErrorClass="form-control is-invalid" />
								<form:errors cssClass="invalid-feedback" path="description" />
							</div>
						</div>

						<div class="row mb-3">
							<div class="col-12">
								<button class="btn btn-large btn-dark" type="submit">submit</button>
							</div>
						</div>
					</form:form>
				</div>

			</div>
		</div>
	</div>
</body>
</html>