<?php
session_start();
unset($_SESSION['adminUserid']);
unset($_SESSION['admin']);
unset($_SESSION['teacherUserid']);
unset($_SESSION['teacher']);
header("Location:index.php");
?>