<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>
<!-- CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
.banner-background {
	clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 100%, 78% 93%, 50% 100%, 21% 93%,
		0 100%, 0% 35%, 0 0);
}
</style>
</head>
<body>
	<!-- Navbar -->
	<%@include file="normal_navbar.jsp"%>
	<main class="d-flex align-items-center bg-info banner-background"
		style="padding-bottom: 60px; height: 120vh;">
		<div class="container">
			<div class="col-md-6 offset-md-3">
				<div class="card ">
					<div class="card-header text-center ">
						<span class="fa fa-user-circle fa-3x"></span>
						<p>Register Here</p>
					</div>
					<div class="card-body">
						<form id="reg-form" action="register" method="post">
							<div class="mb-3">
								<label for="user_name" class="form-label">User Name </label> <input
									type="text" class="form-control" id="user_name"
									name="user_name" placeholder="Enter Name">

							</div>

							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" name="user_email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required>
								<div id="emailHelp" class="form-text">We'll never share
									your email with anyone else.</div>
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control" name="user_password"
									id="exampleInputPassword1">
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">
									Gender </label> <input type="radio" id="gender_male" name="gender" required>Male
								<input type="radio" id="gender_female" name="gender">Female
							</div>

							<div class="mb-3">
								<textarea rows="5" cols="20"
									placeholder="Enter Something about yourself" name="about"
									class="form-control"></textarea>
							</div>

							<div class="mb-3 form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Accept terms and conditions</label>
							</div>
							 <br>

                                <div class="container text-center" id="loader" style="display: none;">
                                    <span class="fa fa-refresh fa-spin fa-4x"></span>
                                    <h4>Please wait..</h4>
                                </div>

                                <div class="d-flex justify-content-center">
                                <button id="sumbimt-btn" type="submit" class="btn btn-success ">Submit</button>
                                </div>
						</form>


					</div>




				</div>

			</div>
		</div>
	</main>


	<!-- JavaScript -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script src="js/techtalk.js" type="text/javascript"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script>
		$(document).ready(function() {
			console.log("loaded.....");
			  $('#reg-form').on('submit', function (event) {
                  event.preventDefault();



                  let form = new FormData(this);

                  $("#sumbimt-btn").hide();
                  $("#loader").show();
                  //send register servlet:
                  $.ajax({
                      url: "register",
                      type: 'POST',
                      data: form,
                      success: function (data, textStatus, jqXHR) {
                          console.log(data)

                          $("#sumbimt-btn").show();
                          $("#loader").hide();

                          if (data.trim() === 'Done')
                          {

                              swal("Registered successfully..We are going to redirect to login page")
                                      .then((value) => {
                                          window.location = "login_page.jsp"
                                      });
                          } else
                          {

                              swal(data);
                          }

                      },
                      error: function (jqXHR, textStatus, errorThrown) {
                          $("#sumbimt-btn").show();
                          $("#loader").hide();
                          swal("something went wrong..try again");

                      },
                      processData: false,
                      contentType: false

                  });



              });





		});
	</script>


</body>
</html>