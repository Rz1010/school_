$(document).ready(function(){
	
	
	var subjectData = $('#subjectList').DataTable({


	"lengthChange": false,
		"processing":true,
		"serverSide":true,
		"order":[],
		"ajax":{
			url:"action.php",
			type:"POST",
			data:{action:'listSubjectSpecial'},
			dataType:"json"
		},
		
		
		"pageLength": 10
	});	



	$('#addSubject').click(function(){
		$('#subjectModal').modal('show');
		$('#subjectForm')[0].reset();		
		$('.modal-title').html("<i class='fa fa-plus'></i> Add Subject");
		$('#action').val('addSubject');
		$('#save').val('Save');
	});	
	
	$(document).on('submit','#subjectForm', function(event){
		event.preventDefault();
		$('#save').attr('disabled','disabled');
		var formData = $(this).serialize();
		$.ajax({
			url:"action.php",
			method:"POST",
			data:formData,
			success:function(data){				
				$('#subjectForm')[0].reset();
				$('#subjectModal').modal('hide');				
				$('#save').attr('disabled', false);
				subjectData.ajax.reload();
			}
		})
	});	
	


	
	
	
});