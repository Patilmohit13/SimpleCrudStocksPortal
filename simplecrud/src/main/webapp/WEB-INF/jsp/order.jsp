<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html lang="en">
<head>
<title>Home || Order</title>
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
	background: linear-gradient(to right, #0062E6, #33AEFF);
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
		  <c:forEach var="ss" items="${shareList}" >	
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
					<h5 class="card-title text-center mb-5 fw-light fs-5">Order</h5>
					<p id = "hai"></P>
					<p Id = "balance"></p>
						<label for="sel1" class="form-label">Select list:</label> 
						<select class="form-select mb-3"  name="sellist1" id="shareName"></select>
						<div class="form-floating mb-3">
							<input type="number" class="form-control" id="quantity"
								placeholder="Number" min="1" max ="10"> <label for="floatingInput">Quantity</label>
						</div>
						<div class="form-floating mb-3">
							<input type="number" class="form-control" id="price"
								placeholder="Number" disabled> <label for="floatingInput" >Price</label>
						</div>
						<div class="d-grid">
							<button class="btn btn-primary btn-login text-uppercase fw-bold"
								type="submit" onclick="order();">Place Order</button>
						</div>                                                      <div>
						</div>
						<div class="d-grid" style="margin-top:10px;">
							<button class="btn btn-primary btn-login text-uppercase fw-bold"
								type="submit" onclick="viewOrderHistory();">View Dashboard</button>
						</div>
						
						<div class="d-grid" style="margin-top:10px;">
							<button class="btn btn-primary btn-login text-uppercase fw-bold"
								type="submit" onclick="moveBack();">back
							</button>
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
		document.getElementById('hai').innerHTML ="Hai! "+user.name;

		document.getElementById('balance').innerHTML ="Your Current Balance is : "+user.balance;
		function order() {
			if($("#quantity").val() > 10 ){
				alert("Quantity should be less than 10");
				return
			} else if($("#quantity").val() < 1){
				alert("Quantity should be greater than 1");
				return
			}
			if (isEmptyString($("#quantity").val())) {
	            alert("Quantity is Empty");
	            return

	        } else if (isEmptyString($("#price").val())) {
	            alert("Price is Empty");
	            return

	        } else{
				var orderLedger = new Object();
				orderLedger.loginId = user.loginId;
				orderLedger.share = $("#shareName option:selected").text();
				orderLedger.quantity = $("#quantity").val();
				orderLedger.price = $("#price").val();
				orderLedger.totalPurchase = totalPurchase();
                
				var dataObject = JSON.stringify(orderLedger);
				$.ajax({
					url : "/service/orderLedger/order",
					type : "POST",
					async : false,
					dataType : "json",
					contentType : "application/json",
					data : dataObject,
					success : function(data) {
						if (data.hasOwnProperty("ERROR")) {
							alert(data.ERROR)
						} else {
							alert(data.SUCCESS)
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
	        $.each(shares, function (i, value) {
	            $('#shareName')
	                .append($("<option></option>")
	                    .attr("value", shares[i].price)
	                    .text(shares[i].name));
				var value = $('#shareName').val();
	    		$('#price').val(value);
	        });
	    }

		 
	  
		
	    $('#shareName').on('change', function() {
	    	  var value = $(this).val();
	    	  $('#price').val(value);
	    });
	    
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
	    function totalPurchase(){
	    	return $("#quantity").val() * $("#price").val()
	    }
		
		function viewOrderHistory(){
			var url = window.location.href+"/Dashboard/";
			window.location.href = url;
		}
		
		function moveBack(){
			window.location.href = "/";
			//window.top.close();
			//window.open("/",'_self');
		}
	</script>
	
</body>
</html>