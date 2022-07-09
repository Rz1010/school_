<?php 

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);


ob_start();
include('class/School.php');
if(!empty($_SESSION["adminUserid"])) {	
	header("location: dashboard.php"); 	
}
if(!empty($_SESSION["teacherUserid"])) {	
	header("location: dashboard2.php"); 	
}
$school = new School();
$errorMessage1 =  $school->adminLogin();
$errorMessage2 =  $school->teacherLogin();
include('inc/header.php');
?>
<title>LearnAll.org</title>
<?php include('include_files.php');?>
<?php include('inc/container.php');?>


<div class="row">		
	<div class="col-md-6">                    
		<div class="panel panel-info">
			<div class="panel-heading" style="background:#000;color:white;">
				<div class="panel-title">Admin Login</div>                        
			</div> 
			<div style="padding-top:30px" class="panel-body" >
				<?php if ($errorMessage1 != '') { ?>
					<div id="login-alert" class="alert alert-danger col-sm-12"><?php echo $errorMessage1; ?></div>                            
				<?php } ?>
				<form id="loginform" class="form-horizontal" role="form" method="POST" action="">                                    
					<div style="margin-bottom: 25px" class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
						<input type="text" class="form-control" id="email" name="email" placeholder="email" required>                                        
					</div>                                
					<div style="margin-bottom: 25px" class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
						<input type="password" class="form-control" id="password" name="password" placeholder="password" required>
					</div>
					<div style="margin-top:10px" class="form-group">                               
						<div class="col-sm-12 controls">
						  <input type="submit" name="login" value="Login" class="btn btn-success">						  
						</div>						
					</div>	
					<div style="margin-top:10px" class="form-group">                               
											
					</div>	
				</form>   
			</div>                     
		</div>  
	</div>
	
	<div class="col-md-6">                    
		<div class="panel panel-info">
			<div class="panel-heading" style="background:#000;color:white;">
				<div class="panel-title">Teacher Login</div>                        
			</div> 
			<div style="padding-top:30px" class="panel-body" >
				<?php if ($errorMessage2!= '') { ?>
					<div id="login-alert" class="alert alert-danger col-sm-12"><?php echo $errorMessage2; ?></div>                            
				<?php } ?>
				<form id="loginform" class="form-horizontal" role="form" method="POST" action="">                                    
					<div style="margin-bottom: 25px" class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
						<input type="text" class="form-control" id="email" name="email" placeholder="email" required>                                        
					</div>                                
					<div style="margin-bottom: 25px" class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
						<input type="password" class="form-control" id="password" name="password" placeholder="password" required>
					</div>
					<div style="margin-top:10px" class="form-group">                               
						<div class="col-sm-12 controls">
						  <input type="submit" name="login2" value="Login" class="btn btn-success">						  
						</div>						
					</div>	
					<div style="margin-top:10px" class="form-group">                               
											
					</div>	
				</form>   
			</div>                     
		</div>  
	</div>
</div>	



<?php include('inc/footer.php');?>
