<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html lang="en">
<head>
<title>Home || Dashboard</title>
<meta charset="utf-8">
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
	
<script>
</script>
</head>


<body style="background-color: antiquewhite;">
  
   <h3> Welcome </h3>
   <div width = "50%" style="margin: 10px;padding : 2px; border: 2.5px black ridge; align-content: center;">
  <table class="table table-striped">
  <tbody>
       <tr >	
			<td>Name</td>
			<td>${user.name}</td>
       </tr>
	   <tr >	
			<td>Email Id</td>
			<td>${user.loginId}</td>
       </tr>
	    <tr >	
			<td>Current Balance</td>
			<td>${user.balance}</td>
       </tr>
  </tbody>
		</table>
  </div>
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
<div Style="margin:20px; padding : 10px; border-color:black; border-radius:1pc; width:70%; height: fit-content;align-content: center;">
  <h3>List of Shares</h3>
   <table class="table table-striped">
  <thead>
    <tr>
      <th>Share Name</th>
      <th>Quantity</th>
    </tr>
  </thead>
  <tbody>
      <c:forEach var="s" items="${shares}" >
        <tr >
			
			<td>${s.shareName}</td>
			<td>${s.quantity}</td>
       </tr>
      </c:forEach>
  </tbody>
</table>
</div>
<div Style="margin:20px; padding : 10px; border-color:black; border-radius:1pc; width:70%; height: fit-content;align-content: center;">
  <h3>Status of Shares Sold/to be Sold</h3>
   <table class="table table-striped">
  <thead>
    <tr>
      <th>Share Name</th>
      <th>Minimum Price</th>
      <th>Status</th>
    </tr>
  </thead>
  <tbody>
      <c:forEach var="ss" items="${sellShares}" >
        <tr >
			
			<td>${ss.shareName}</td>
			<td>${ss.minSellPrice}</td>
      <td>${ss.status}</td>
       </tr>
      </c:forEach>
  </tbody>
</table>
</div>
<div Style="margin:10px; padding : 20px; border-color:black; border-radius:1pc; width:70%; height: fit-content;align-content:center;">
	<h5>Order History</h5>
   <table class="table table-striped">
  <thead>
    <tr>
      <th>share</th>
      <th>Quantity</th>
      <th>price</th>
	  <th>Total Purchase</th>
    </tr>
  </thead>
  <tbody>
      <c:forEach var="o" items="${order}" >
        <tr >
			
			<td>${o.share}</td>
			<td>${o.quantity}</td>
			<td>${o.price}</td>
			<td>${o.totalPurchase}</td>
       </tr>
      </c:forEach>
  </tbody>
</table>


 </div>
 <div style="margin-left: 25%;">
 <div  class="d-grid" style="margin-top:10px; width:200px;">
							<button style="width: max-content;"class="btn btn-primary btn-login text-uppercase fw-bold"
								type="submit" onclick="moveBack();">Continue purchasing
	</button>
 </div>
 <div class="d-grid" style="margin-top:10px; width: 200px;">
  <button style="width: max-content;" class="btn btn-primary btn-login text-uppercase fw-bold"
    type="submit" onclick="sellForm()">Sell Form</button>
</div>
<div style="width: max-content;" class="d-grid" style="margin-top:10px;width: 200px ;">
							<button class="btn btn-primary btn-login text-uppercase fw-bold"
								type="submit" onclick="back()">to Login page</button>
</div>
</div>

</body>
<script>
function moveBack(){
			window.location.href ="/home/"+"${user.loginId}";
		}
function back(){
      //window.top.close();
      window.location.href = "/";
			//window.open("/",'_blank');
			
		}

    function sellForm(){
			window.location.href ="/home/"+"share/"+"${user.loginId}";
		}

 
</script>

</html>
