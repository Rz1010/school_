<?php 
include('class/School.php');
$school = new School();
$school->teacherLoginStatus();
include('inc/header.php');
?>
<title>LearnAll.org</title>
<?php include('include_files.php');?>
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/dataTables.bootstrap.min.js"></script>		
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css" />
<script src="js/subjects.js"></script>
<?php include('inc/container.php');?>
<div class="container">	
	<?php include('side-menu2.php');	?>
	<div class="content">
		<div class="container-fluid">
			<div>   
				<a href="#"><strong><span class="ti-crown"></span> Subjects Section</strong></a>

				<hr>		
				<div class="panel-heading">
					<div class="row">
						<div class="col-md-10">
							<h3 class="panel-title"></h3>
						</div>
						<div class="col-md-2" align="right">
							<button type="button" name="add" id="addSubject" class="btn btn-success btn-xs">Add New Subject</button>
						</div>
					</div>
				</div>
				<table id="subjectList" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>ID</th>
							<th>Subject</th>
								
							<th>Code</th>
							<th>Assigned Section</th>							
							<th></th>
							<th></th>							
						</tr>
					</thead>
				</table>
				
			</div>			
		</div>		
	</div>	
</div>	
<div id="subjectModal" class="modal fade">
	<div class="modal-dialog">
		<form method="post" id="subjectForm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"><i class="fa fa-plus"></i> Edit Subject</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="teacher" class="control-label">Subject Name*</label>
						<input type="text" class="form-control" id="subject" name="subject" placeholder="Subject Name" required>					
					</div>	
					
					<div class="form-group">
						<label for="code" class="control-label">Code*</label>
						<input type="text" class="form-control" id="code" name="code" placeholder="code..." required>					
					</div>
					<div class="form-group">
						<label for="section" class="control-label">Section*</label>
						<input type="text" class="form-control" id="section" name="section" placeholder="Section" required>					
					</div>
				</div>
				<div class="modal-footer">
					<input type="hidden" name="subjectid" id="subjectid" />
					<input type="hidden" name="action" id="action" value="updateSubject" />
					<input type="submit" name="save" id="save" class="btn btn-info" value="Save" />
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</form>
	</div>
</div>