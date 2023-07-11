<?php
include('../config.php');
$q = mysqli_query($con, "SELECT * FROM teacher WHERE teacher_id='" . $_SESSION['teacher_id'] . "'");
$res = mysqli_fetch_assoc($q);

extract($_POST);
if (isset($update)) {
  $query = "UPDATE teacher SET teacher_name='$n', eid='$e', password='$p', mob='$m', address='$a', department_id='$dep_id', sem_id='$semester' WHERE teacher_id='" . $_SESSION['teacher_id'] . "'";

  mysqli_query($con, $query);

  $err = "Records updated";
}
?>

<div class="row" style="height:700px">
  <div class="col-md-5">
    <h2><font color="#FFFFFF">Update Profile</font></h2>
    <form method="POST" enctype="multipart/form-data">
      <table border="0" cellspacing="5" cellpadding="5" class="table">
        <tr>
          <td colspan="2"><?php echo @$err; ?></td>
        </tr>
        <tr>
          <th width="237" scope="row"><font color="#000000">Select Department</font></th>
          <td width="213">
            <select name="dep_id" id="courseid" onchange="showSemester(this.value)" class="form-control">
              <?php
              $sub = mysqli_query($con, "SELECT * FROM department");
              while ($s = mysqli_fetch_array($sub)) {
                $s_id = $s[0];
                $selected = ($s_id == $res['department_id']) ? 'selected' : '';
                echo "<option value='$s_id' $selected>" . $s[1] . "</option>";
              }
              ?>
            </select>
          </td>
        </tr>
        <tr>
          <th width="237" scope="row"><font color="#000000">Semester Name</font></th>
          <td width="213">
            <select name="semester" id="semester" class="form-control">
              <?php
              $sem = mysqli_query($con, "SELECT * FROM semester WHERE department_id='" . $res['department_id'] . "'");
              while ($s = mysqli_fetch_array($sem)) {
                $s_id = $s[0];
                $selected = ($s_id == $res['sem_id']) ? 'selected' : '';
                echo "<option value='$s_id' $selected>" . $s[1] . "</option>";
              }
              ?>
            </select>
          </td>
        </tr>
        <tr>
          <th width="237" scope="row"><font color="#000000">Teacher Name</font></th>
          <td width="213"><input type="text" name="n" class="form-control" value="<?php echo $res['name']; ?>" /></td>
        </tr>
        <tr>
          <th width="237" scope="row"><font color="#000000">Email</font></th>
          <td width="213"><input type="text" name="e" class="form-control" value="<?php echo $res['eid']; ?>" /></td>
        </tr>
        <tr>
          <th width="237" scope="row"><font color="#000000">Password</font></th>
          <td width="213"><input type="text" name="p" class="form-control" value="<?php echo $res['password']; ?>" /></td>
        </tr>
        <tr>
          <th width="237" scope="row"><font color="#000000">Mobile</font></th>
          <td width="213"><input type="text" name="m" class="form-control" value="<?php echo $res['mob']; ?>" /></td>
        </tr>
        <tr>
          <th width="237" scope="row"><font color="#000000">Address</font></th>
          <td width="213"><input type="text" name="a" class="form-control" value="<?php echo $res['address']; ?>" /></td>
        </tr>
        <tr>
          <th colspan="2" scope="row" align="center">
            <input type="submit" value="Update Records" name="update" />
          </th>
        </tr>
      </table>
    </form>
  </div>
</div>
