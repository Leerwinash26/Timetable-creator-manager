<option value="" selected="selected" disabled="disabled">Select subject</option>
<?php 
include('../config.php');

$q = mysqli_query($con, "SELECT * FROM subject WHERE sem_id='" . $_GET['id'] . "'");
while ($res = mysqli_fetch_assoc($q)) {
    echo "<option value='" . $res['subject_id'] . "'>" . $res['subject_name'] . "</option>";
}
?>
