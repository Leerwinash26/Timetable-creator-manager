<?php
include('../config.php');
$tid = $_REQUEST['timeschedule_id'];

if (isset($_REQUEST['timeschedule_id'])) {
    mysqli_query($con, "DELETE FROM timeschedule WHERE timeschedule_id='$tid'");
    header('location: admindashboard.php?info=timetable');
}
?>
