<!doctype html>
<html lang="en">
<head>
<title>Home || Signup</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.0/css/bootstrap.min.css"
	integrity="sha512-F7WyTLiiiPqvu2pGumDR15med0MDkUIo5VTVyyfECR5DZmCnDhti9q5VID02ItWjq6fvDfMaBaDl2J3WdL1uxA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.0/js/bootstrap.bundle.min.js"
	integrity="sha512-PqRelaJGXVuQ81N6wjUrRQelCDR7z8RvKGiR9SbSxKHPIt15eJDmIVv9EJgwq0XvgylszsjzvQ0+VyI2WtIshQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<style>
body {
	background: #007bff;
	background: linear-gradient(to right, #e60000, #ff33b1);
}

.btn-login {
	font-size: 0.9rem;
	letter-spacing: 0.05rem;
	padding: 0.75rem 1rem;
}
</style>
</head>
<body>
	<div class="row">
		<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
			<div class="card border-0 shadow rounded-3 my-5">
				<div class="card-body p-4 p-sm-5">
					<h5 class="card-title text-center mb-5 fw-light fs-5">Signup</h5>
					<p id = "hai"></P>
					<p Id = "balance"></p>
						
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="name"
								placeholder="name"> <label for="floatingInput">Name</label>
						</div>
						<div class="form-floating mb-3">
							<input type="email" class="form-control" id="email"
								placeholder="Login Id"> <label for="floatingInput" >Email ID</label>
						</div>
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="uniqueno"
								placeholder="unique Id"> <label for="floatingInput" >UniqueNO</label>
						</div>
						<div class="form-floating mb-3">
							<input type="password" class="form-control" id="password"
								> <label for="floatingInput" >Password</label>
						</div>
						<div class="form-floating mb-3">
							<input type="number" class="form-control" id="initial-amount">
									<label for="floatingInput" >Initial Amount</label>
						</div>
						<div class="d-grid">
							<button  style = "background-color: rgb(244, 132, 21);"class="btn btn-primary btn-login text-uppercase fw-bold"
								type="submit" onclick="signUp();">Sign up</button>
						</div>                                                      <div>
						</div>
						<div class="d-grid" style="margin-top:10px;">
							<button style = "background-color: darkgrey;" class="btn btn-primary btn-login text-uppercase fw-bold"
								type="submit" onclick="moveBack();">Back
							</button>
						</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		
		function signUp() {

		 if (isEmptyString($("#initial-amount").val()) || $("#initial-amount").val() < 50000) {
	            alert("initial amount should be greater than or equal to 50000");
	            return

	        } 
			
			else{
				var newUser = new Object();
				newUser.name = $("#name").val();
				newUser.loginId = $("#email").val();
				newUser.uniqueId = $("#uniqueno").val();
				newUser.password = $("#password").val();
				newUser.balance = $("#initial-amount").val();
                
				var dataObject = JSON.stringify(newUser);
				$.ajax({
					url : "/service/user/signup",
					type : "POST",
					async : false,
					dataType : "json",
					contentType : "application/json",
					data : dataObject,
					success : function(data) {
						if (data.hasOwnProperty("ERROR")) {
							alert(data.ERROR)
						} else {
							var str = data.SUCCESS+" redirecting to Login page";
							alert(str);
							window.location.href = "/";
							//var url = window.location.href+"/orderplaced/";
							//window.location.href = url;
							//window.open(window.location.host+ "/home/"+data.unit_Id);
						}

					},
					error : function(data) {
						console.log("ERROR " + data.error)
					}
				});
	        }
		}
		
	    
	   
	    function isNES(str) {
	        return !isEmptyString(str);
	    }

	    function isEmptyString(s) {
	        if (typeof s == "undefined") {
	            return true;
	        }
	        if (s == null) {
	            return true;
	        }
	        if (s == " " || s == "&NBSP;") {
	            return true;
	        }
	        if (s["@nil"] == "true" || s["@nil"] == true) {
	            return true;
	        }
	        s = $.trim(s);
	        if (s == "") {
	            return true;
	        }
	        if (s == "null") {
	            return true;
	        }
	        return false;
	    }
	    
		
		function moveBack(){
			window.location.href = "/";
		}
	</script>
</body>
</html>