$(document).ready(function(){	
	$('#search').click(function(){
		$('#studentList').removeClass('hidden');
		$('#saveAttendance').removeClass('hidden');
		if ($.fn.DataTable.isDataTable("#studentList")) {
			$('#studentList').DataTable().clear().destroy();
		}
		var classid = $('#classid').val();
		var sectionid = $('#sectionid').val();
		var subjectid = $('#subjectid').val();
		if(classid && sectionid) {
			$.ajax({
				url:"action.php",
				method:"POST",
				data:{classid:classid, sectionid:sectionid, subjectid:subjectid , action:"attendanceStatusSpecial"},
				success:function(data) {					
					$('#message').text(data).removeClass('hidden');	
				}
			})
			$('#studentList').DataTable({
				"lengthChange": false,
				"processing":true,
				"serverSide":true,
				"order":[],
				"ajax":{
					url:"action.php",
					type:"POST",	
					error: function(jqXHR, ajaxOptions, thrownError) {
                  alert(thrownError + "\r\n" + jqXHR.statusText + "\r\n" + jqXHR.responseText + "\r\n" + ajaxOptions.responseText);
                },			
					data:{classid:classid, sectionid:sectionid, subjectid:subjectid , action:'getStudentsSpecial'},
					dataType:"json"
				},
				"columnDefs":[
					{
						"targets":[0],
						"orderable":false,
					},
				],
				"pageLength": 10
			});				
		}
	});	
	$("#classid").change(function() {		
        $('#att_classid').val($(this).val());		
    });	
	$("#sectionid").change(function() {
	$('#att_sectionid').val($(this).val());		
    });
	$("#subjectid").change(function() {
	$('#att_subjectid').val($(this).val());		
    });
	$("#attendanceForm").submit(function(e) {		
		var formData = $(this).serialize();
		$.ajax({
			url:"action.php",
			method:"POST",
			data:formData,
			success:function(data){				
				$('#message').text(data).removeClass('hidden');				
			}
		});
		return false;
	});	
});