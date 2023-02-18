<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student list</title>
<!-- <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css"> -->
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!-- <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<!-- <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.6.0.slim.js"
	integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
	crossorigin="anonymous"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="//cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
</head>
<body>
	<div class="row">
		<div class="col-md-12 " style="align-items: center;">
			<div class="table-responsive">
				<table
					class="table table-border table-striped custom-table datatable mb-0"
					id="student_table">
					<thead>
						<tr>
							<th style="text-align: center;">STUDENT ID</th>
							<th style="text-align: center;">NAME</th>
							<th style="text-align: center;">GENDER</th>
							<th style="text-align: center;">DATE OF BIRTH</th>
							<th style="text-align: center;">ADDRESS</th>
							<th style="text-align: center;">EDIT</th>
							<th style="text-align: center;">DELETE</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<button type="button" class="btn btn-primary btn-lg"
		data-toggle="modal" data-target="#ModalLoginForm">ADD
		STUDENT</button>
	<!-- Modal HTML Markup -->
	<div id="ModalLoginForm" class="modal fade">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title">DETAILS</h3>
				</div>
				<div class="modal-body">
					<form role="form" method="POST" action="">
						<div class="form-group">
							<label class="control-label">Student ID</label>
							<div>
								<input type="number" class="form-control input-lg" name="studid"
									id="studid">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label">NAME</label>
							<div>
								<input type="text" class="form-control input-lg" name="studname"
									id="studname">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label">GENDER</label>
							<div>
								<label for="radio1" class="form-check-label "> <input
									type="radio" name="gender" id="gender" value="male">Male
									<input type="radio" name="gender" id="gender" value="female">Female
								</label>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label">Date of Birth</label>
							<div>
								<input type="date" class="form-control input-lg" name="dob" placeholder=dd/mm/yy
									id="dob">
							</div>
						</div>
						</div>
						<div class="form-group">
							<label class="control-label">ADDRESS</label>
							
<!-- 								<input type="text" class="form-control input-lg" name="address" -->
<!-- 									id="address"> -->
								<textarea id="address"  class="form-control input-lg" name="address" ></textarea>	
							</div>
						</div>
						<div class="form-group">
							<div>
								<button type="submit" class="btn btn-success"
									onclick="addStudent();">ADD STUDENT</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	<!-- Modal HTML Markup -->
	<div id="ModalEditForm" class="modal fade">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title">DETAILS</h3>
				</div>
				<div class="modal-body">
					<form role="form" method="POST" action="">
						<div class="form-group">
							<label class="control-label">Student ID</label>
							<div>
								<input type="number" class="form-control input-lg"
									name="editstudid" id="editstudid" disabled>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label">NAME</label>
							<div>
								<input type="text" class="form-control input-lg" name="editstudname"
									id="editstudname">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label">GENDER</label>
							<div>
								<label for="radio1" class="form-check-label "> <input
									type="radio" name="editgender" value="male">Male <input
									type="radio" name="editgender" value="female">Female
								</label>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label">Date of Birth</label>
							<div>
								<input type="date" class="form-control input-lg" placeholder=dd/mm/yy
									name="editdob" id="editdob">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label">ADDRESS</label>
							<div>
								<input type="textarea" class="form-control input-lg"
									name="editaddress" id="editaddress">
							</div>
						</div>
						<div class="form-group">
							<div>
								<button type="submit" class="btn btn-success"
									onclick="updateStudent();">UPDATE DETAILS</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	<!-- Delete modal  -->
	<div class="modal fade" id="basicModal" tabindex="-1" role="dialog"
		aria-labelledby="basicModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">Basic Modal</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<h3>Are You Sure</h3>
					<input type="hidden" id="deletestudid">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						onclick="deleteStudent('+full.studid+');">Delete</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
         $(document).ready(function() {
	         $('#student_table').DataTable({
		         "rowId": "studid",
		         "processing" : false,
		         "serverSide" : false,
		         "ajax" : {
						"url" : "/stud",
						"type" : "GET",
						"error" : function(e) {
							console.log(e);
						},
						"dataSrc" : function(d) {
							console.log(d);
							return d
						}
					},
					
		         "columns" : [
			         {
			         "data" : "studid"
			         },
			         {
			         "data" : "studname"
			         },
			         {
			         "data" : "gender"
			         },
			         {
			         "data" : "dob"
			         },
			         {
			         "data" : "address"
			         },
			         {
				         "render" : function(data, type, full) {
					         console.log("DATA" + data);
					         return '<button class="btn btn-info btn-sm" data-toggle="modal" data-target="#ModalEditForm" onclick="editStudent('+ full.studid +');">Edit</button>'
				         }
			         },
			         {
				         "render" : function(data, type, full) {
					         console.log("DATA" +data)
					         return '<button class="btn btn-info btn-sm" data-toggle="modal" data-target="#basicModal" onclick="setDelete('+full.studid +')">Delete</button>'
				         }
			         }
	         
	         	]
	         });
         });
         
         <!-- Edit Modal -->
         
         
         
         
         function addStudent() {
         var studentData = new Object();
         studentData.studid = document.getElementById("studid").value;
         studentData.studname = document.getElementById("studname").value;
         studentData.gender = document.querySelector('input[name="gender"]:checked').value;
         studentData.dob = document.getElementById("dob").value;
         studentData.address = document.getElementById("address").value;
         
         var dataObject = JSON.stringify(studentData);
         $.ajax({
         url : "/studs",
         type : "POST",
         async : false,
         dataType : "json",
         contentType : "application/json",
         data : dataObject,
         success : function(data) {
         console.log("Data Added");
         $('#"student_table"').DataTable().ajax.reload();
         
         },
         error : function(data) {
         console.log("Error" + data)
         }
         });
         }
         
         
         
         function editStudent(id) {
         console.log(id);
         var beforeEditData = $("#student_table").DataTable().row("#"+id).data();
         $("#editstudid").val(beforeEditData.studid);
         $("#editstudname").val(beforeEditData.studname);
         $("input[name=editgender][value="+beforeEditData.gender+"]").prop('checked', true);
         $("#editdob").val(beforeEditData.dob);
         $("#editaddress").val(beforeEditData.address);
         }
         
         function updateStudent() {
         var studentData = new Object();
         studentData.studid = document.getElementById("editstudid").value;
         studentData.studname = document.getElementById("editstudname").value;
         studentData.gender = document.querySelector('input[name="editgender"]:checked').value;
         studentData.dob = document.getElementById("editdob").value;
         studentData.address = document.getElementById("editaddress").value;
         
         var dataObject = JSON.stringify(studentData);
         $.ajax({
         url : "/ustuds",
         type : "PUT",
         async : false,
         dataType : "json",
         contentType : "application/json",
         data : dataObject,
         success : function(data) {
         console.log("Data Updated");
         $('#student_table').DataTable().ajax.reload();
         
         },
         error : function(data) {
         console.log("Error" + data)
         }
         });
         
         }
         
         function setDelete(id) {
         console.log(id);
         $("#deletestudid").val(id)
         }
         
         function deleteStudent(id){
         
         var dId = document.getElementById("deletestudid").value;
         
         $.ajax({
         url : "/stud/"+dId,
         type : "DELETE",
         async : false,
         success : function(data) {
         console.log("Data Deleted");
         $('#student_table').DataTable().ajax.reload();
         },
         error : function(data) {
         console.log("Error" + data)
         $('#student_table').DataTable().ajax.reload();
         alert("admission canceled");
         }
         
         })
         
         }
         
      </script>
      
</body>
</html>