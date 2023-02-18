<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html lang="en">
<head>
<title>Home || Sell Share</title>
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
	background: linear-gradient(to right, #00e6e6, #36688a);
}

.btn-login {
	font-size: 0.9rem;
	letter-spacing: 0.05rem;
	padding: 0.75rem 1rem;
}
</style>
</head>
<body>
	<div style = "margin-top: 20pt;background-color:rgb(232, 255, 117); font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; height: fit-content;border: 2pt darkred ridge thick">
		<marquee style="margin-top: 2px;">
		  <h6 id = "sharelist" style="color: #ad0303;;">
		  <c:forEach var="ss" items="${sharelist}" >	
				[ 
			  <b>${ss.name}</b>&nbsp; : &nbsp; <em>${ss.price}</em>
		  ]
		  </c:forEach></h6>
		</marquee>
	  </div>
	<div class="row">
		<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
			<div class="card border-0 shadow rounded-3 my-5">
				<div class="card-body p-4 p-sm-5">
					<h5 class="card-title text-center mb-5 fw-light fs-5">Sell It</h5>
						<label for="sel1" class="form-label">Select list:</label> 
						<em style = "font-size: small; color: #ad0303; font-family: monospace; font-style: italic;" id = "msg"></em>
						<select class="form-select mb-3"  name="sellist1" id="shareName"></select>
						
						<div class="form-floating mb-3">
							<input type="number" class="form-control" id="price"
								placeholder="Number"> <label for="floatingInput" >Price to be Sold</label>
						</div>
						<div class="d-grid">
							<button style="background-color: #36688a;" class="btn btn-primary btn-login text-uppercase fw-bold" id ='sell'
								type="submit" onclick="sell();">sell share</button>
						</div>      
						<div  class="d-grid" style="margin-top:10px;">
							<button style="background-color: #d54e4c;" class="btn btn-primary btn-login text-uppercase fw-bold"
								type="submit" onclick="mv();">move back</button>
						</div>	
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		
		$(document).ready(function () {
			displayShare();	
	    });

		var user = ${user};
		var shares = ${shares};
		var log = user.loginId;
       
		function sell() {			
             if (isEmptyString($("#price").val())) {
	            alert("Price is Empty");
	            return

	        } else{
				var sellShare = new Object();
                
				sellShare.loginId =log;
				sellShare.shareName = $("#shareName option:selected").text();
				sellShare.minSellPrice = $("#price").val();
                
				var dataObject = JSON.stringify(sellShare);
				$.ajax({
					url : "/home/share/"+log+"/add",
					type : "POST",
					async : false,
					dataType : "json",
					contentType : "application/json",
					data : dataObject,
					success : function(data) {
						if (data.hasOwnProperty("ERROR")) {
							alert(data.ERROR);
						} else {
							alert(data.SUCCESS);
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

     
		
	    function displayShare() {
			if(shares.length === 0){
				document.getElementById('msg').innerHTML = "NO SHARE AVAILABLE IN YOUR POCKET";
				document.getElementById('shareName').disabled = true;
				document.querySelector('#sell').disabled = true;
				document.querySelector('#price').disabled = true;

			}
			   
	        $.each(shares, function (i) {
		
	            $('#shareName')
	                .append($("<option></option>")
	                    .text(shares[i]));
				var value = $('#shareName').val();
				
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
		
		function mv(){
            history.back();
			//window.location.replace(url);
		}
	</script>

</body>
</html>