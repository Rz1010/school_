$(document).ready(function(){
	var studentData = $('#studentList').DataTable({
		"lengthChange": false,
		"processing":true,
		"serverSide":true,
		"order":[],
		"ajax":{
			url:"action.php",
			type:"POST",
			data:{action:'listStudentSpecial'},
			dataType:"json"
		},
		
		"pageLength": 10
	});	

	$('#addStudent').click(function(){
		$('#studentModal').modal('show');
		$('#studentForm')[0].reset();		
		$('.modal-title').html("<i class='fa fa-plus'></i> Student Admission");
		$('#action').val('addStudent');
		$('#save').val('Save');
	});	
	
	$(document).on('submit','#studentForm', function(event){
		event.preventDefault();
		$('#save').attr('disabled','disabled');		
		$.ajax({
			url:"action.php",
			method:"POST",
			data: new FormData(this),
			processData: false,
			contentType: false,
			success:function(data){				
				$('#studentForm')[0].reset();
				$('#studentModal').modal('hide');				
				$('#save').attr('disabled', false);
				studentData.ajax.reload();
			}
		})
	});	
	
	
	
	
	
});