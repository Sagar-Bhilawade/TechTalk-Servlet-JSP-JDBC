<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
		<a class="navbar-brand" href="index.jsp"><span
			class="fa fa-asterisk"></span> Tech Talk</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#"><span
						class="fa fa-phone"></span> One o One with Sagar <span
						class="sr-only">(current)</span> </a></li>

				<li class="nav-item active dropdown "><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"><span class="fa fa-tasks"></span>
						Categories </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Programming Language</a> <a
							class="dropdown-item" href="#">Programming Implementation</a> <a
							class="dropdown-item" href="#">Data Structures</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li>
				<li class="nav-item active"><a class="nav-link" href="#"><span
						class="fa fa-address-card-o"></span> Contact</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="login_page.jsp"><span class="fa fa fa-user-circle"></span>
						Login</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="register_page.jsp"><span class="fa fa fa-user-plus"></span>
						Sign up</a></li>

			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
	</nav>

</body>
</html>