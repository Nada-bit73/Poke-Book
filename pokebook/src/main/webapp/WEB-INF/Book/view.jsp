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
						<h1 class="form-heading mb-5 mr-3">Expense Details:</h1>

						<!-- ----------------------------------------------------------- -->
						<div style="display: flex; justify-content: space-between;">
							<h3 style="flex-basis: 49.5%;">Expense Name:</h3>
							<p style="flex-basis: 49.5%;">
								<c:out value="${book.expenseName}" />
							</p>
						</div>

						<div style="display: flex; justify-content: space-between;">
							<h3 style="flex-basis: 49.5%;">Expense Description:</h3>
							<p style="flex-basis: 49.5%;">
								<c:out value="${book.description}" />
							</p>
						</div>

						<div style="display: flex; justify-content: space-between;">
							<h3 style="flex-basis: 49.5%;">Vendor:</h3>
							<p style="flex-basis: 49.5%;">
								<c:out value="${book.vendor}" />
							</p>
						</div>

						<div style="display: flex; justify-content: space-between;">
							<h3 style="flex-basis: 49.5%;">Amount Spent:</h3>
							<p style="flex-basis: 49.5%;">
								$
								<c:out value="${book.amount}" />
							</p>
						</div>




						<!-- -------------------------------------------------------- -->
						<form class="form align-items-right ml-4 mt-5" action="/books"
							method="POST">

							<button type="submit" class="btn btn-link text-right">Go
								Back</button>

						</form>

					</div>

				</div>

			</div>
		</div>
	</div>
</body>
</html>