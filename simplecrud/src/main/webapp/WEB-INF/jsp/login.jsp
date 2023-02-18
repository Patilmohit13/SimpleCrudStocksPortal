
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
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
	background: linear-gradient(to right, #901de9, #8906a3);
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
					<h5 class="card-title text-center mb-5 fw-light fs-5">Sign In</h5>
						<div style="border-radius: 2pc;" class="form-floating mb-3">
							<input type="email" class="form-control" id="floatingInput"
								placeholder="name@example.com"> <label
								for="floatingInput">Email address</label>
						</div>
						<div class="form-floating mb-3">
							<input type="password" class="form-control" id="floatingPassword"
								placeholder="Password"> <label for="floatingPassword">Password</label>
						</div>
						<div class="d-grid">
							<button style = "background-color: cornflowerblue;" class="btn btn-primary btn-login text-uppercase fw-bold" onclick="login()"
								type="submit">Login</button>
						</div>
						<div >
						    <p style="font-size: small;">New User...? click sign up to register&nbsp;&nbsp;<a href="/home/signup">sign up</a></p>
							
							<!--<button class="btn btn-primary btn-login text-uppercase fw-bold" onclick="gotosignup()"
								type="submit">signup</button>-->
						</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	function login() {
		var userData = new Object();
		userData.loginId = document.getElementById("floatingInput").value;
		userData.password = document.getElementById("floatingPassword").value;

		var dataObject = JSON.stringify(userData);
		$.ajax({
			url : "/service/user/login",
			type : "POST",
			async : false,
			dataType : "json",
			contentType : "application/json",
			data : dataObject,
			success : function(data) {
				if (data.hasOwnProperty("ERROR")){
					alert(data.ERROR)
				} else{
					window.location.href = "/home/" + data.loginId;
 					//window.open(window.location.host + "/home/" +data.uniqueId,"_self");
				}

			},
			error : function(data) {
				console.log("ERROR " + data.error)
			}
		});
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
    function ValidateEmail(email) {
        var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
        return expr.test(email);
        if (expr.test(email)) {
            return true;
        } else {
            return false;
        }
    }
	
	function gotosignup(){
		window.location.href ="/home/signup";
	}
	</script>
</body>
</html>