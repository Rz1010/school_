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
<script src="js/sections2.js"></script>
<?php include('inc/container.php');?>
<div class="container">	
	<?php include('side-menu2.php');	?>
	<div class="content">
		<div class="container-fluid">
			<div>   
				<a href="#"><strong><span class="ti-crown"></span> Classes Section</strong></a>
				<hr>		
				<table id="sectionList" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>ID</th>
							<th>Assigned Subject</th>				
							<th></th>
							<th></th>							
						</tr>
					</thead>
				</table>
				
			</div>			
		</div>		
	</div>	
</div>	
<div id="sectionModal" class="modal fade">
	<div class="modal-dialog">
		<form method="post" id="sectionForm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"><i class="fa fa-plus"></i> Edit Section</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="firstname" class="control-label">Section Name*</label>
						<input type="text" class="form-control" id="section_name" name="section_name" placeholder="Section Name" required>							
					</div>	
					<div class="form-group">
						<label for="mname" class="control-label">Assign Class Teacher*</label>	
						<select name="teacherid" id="teacherid" class="form-control" required>
							<option value="">Select</option>
							<?php echo $school->getTeacherList(); ?>
						</select>
					</div>									
				</div>
				<div class="modal-footer">
					<input type="hidden" name="sectionid" id="sectionid" />
					<input type="hidden" name="action" id="action" value="updateSection" />
					<input type="submit" name="save" id="save" class="btn btn-info" value="Save" />
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</form>
	</div>
</div>
<?php include('inc/footer.php');?>