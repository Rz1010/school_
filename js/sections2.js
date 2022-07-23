$(document).ready(function(){
	var sectionData = $('#sectionList').DataTable({
		"lengthChange": false,
		"processing":true,
		"serverSide":true,

		"order":[],
		"ajax":{
			url:"action.php",
			type:"POST",
			data:{action:'listSectionsSpecial'},
			dataType:"json"
		},
		
		"pageLength": 10
	});	

	$('#addSection').click(function(){
		$('#sectionModal').modal('show');
		$('#sectionForm')[0].reset();		
		$('.modal-title').html("<i class='fa fa-plus'></i> Add Section");
		$('#action').val('addSection');
		$('#save').val('Save');
	});	
	
	$(document).on('submit','#sectionForm', function(event){
		event.preventDefault();
		$('#save').attr('disabled','disabled');
		var formData = $(this).serialize();
		$.ajax({
			url:"action.php",
			method:"POST",
			data:formData,
			success:function(data){				
				$('#sectionForm')[0].reset();
				$('#sectionModal').modal('hide');				
				$('#save').attr('disabled', false);
				sectionData.ajax.reload();
			}
		})
	});	
	
	
	
	
});