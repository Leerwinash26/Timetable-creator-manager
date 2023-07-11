<?php
include('../config.php');

if (isset($_POST['generate']) || isset($_POST['regenerate'])) {
  $generated = true;
} else {
  $generated = false;
}

function generateSubjectOptions($con) {
  $options = '';
  $dep = mysqli_query($con, "SELECT * FROM department");
  while ($dp = mysqli_fetch_array($dep)) {
    $dp_id = $dp[0];
    $options .= "<option value='$dp_id'>" . $dp[1] . "</option>";
  }
  return $options;
}

function generateSemesterOptions($con, $id) {
  $options = '';
  $semesters = mysqli_query($con, "SELECT * FROM semester WHERE department_id = $id");
  while ($sem = mysqli_fetch_array($semesters)) {
    $sem_id = $sem[0];
    $options .= "<option value='$sem_id'>" . $sem[1] . "</option>";
  }
  return $options;
}

function generateTimeTable($con, $courseid, $s) {
  $weekDays = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
  $timeTable = [];

  // Generate the timetable for each day
  foreach ($weekDays as $day) {
    $dayTimeTable = [];

    if ($day === 'Tuesday' || $day === 'Thursday') {
      // No classes on Tuesday and Thursday
      $dayTimeTable[] = 'No Class';
    } else {
      // Retrieve subject names for each time slot from the database
      $query = "SELECT subject_name FROM timetable.subject_sub WHERE department_id = $courseid AND sem_id = $s LIMIT 6";
      $result = mysqli_query($con, $query);

      if ($result && mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_assoc($result)) {
          $subjectName = $row['subject_name'];
          $dayTimeTable[] = $subjectName;
        }
      } else {
        $dayTimeTable[] = 'No Subject';
      }

      // Insert the "Break" slot at the 5th position
      array_splice($dayTimeTable, 4, 0, 'Break');
    }

    // Add the day and its subject names to the timetable
    $timeTable[] = array_merge([$day], $dayTimeTable);
  }

  return $timeTable;
}





?>

<script>
function showSubject(str) {
  if (str === "") {
    document.getElementById("txtHint").innerHTML = "";
    return;
  }

  if (window.XMLHttpRequest) {
    // code for IE7+, Firefox, Chrome, Opera, Safari
    xmlhttp = new XMLHttpRequest();
  } else {
    // code for IE6, IE5
    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
  }

  xmlhttp.onreadystatechange = function() {
    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
      document.getElementById("subject").innerHTML = xmlhttp.responseText;
    }
  };
  xmlhttp.open("GET", "subject_ajax.php?id=" + str, true);
  xmlhttp.send();
}

function showSemester(str) {
  if (str === "") {
    document.getElementById("txtHint").innerHTML = "";
    return;
  }

  if (window.XMLHttpRequest) {
    // code for IE7+, Firefox, Chrome, Opera, Safari
    xmlhttp = new XMLHttpRequest();
  } else {
    // code for IE6, IE5
    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
  }

  xmlhttp.onreadystatechange = function() {
    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
      document.getElementById("semester").innerHTML = xmlhttp.responseText;
    }
  };
  xmlhttp.open("GET", "semester_ajax.php?id=" + str, true);
  xmlhttp.send();
}
</script>

<div class="row">
  <div class="col-sm-12">
    <h2>Generate Time Table</h2>
    <form method="POST" enctype="multipart/form-data">
      <table border="0" class="table">
        <tr>
          <td colspan="2"><?php echo @$err; ?></td>
        </tr>
        <tr>
          <th width="237" scope="row">Select Department</th>
          <td width="213">
            <select name="courseid" class="form-control" onchange="showSemester(this.value)" id="courseid">
              <option disabled selected>Select Department</option>
              <?php echo generateSubjectOptions($con); ?>
            </select>
          </td>
        </tr>
        <tr>
          <th width="237" scope="row">Select Semester</th>
          <td width="213">
            <select name="s" id="semester" onchange="showSubject(this.value)" class="form-control">
              <option disabled selected>Select Semester</option>
            </select>
          </td>
        </tr>
        <tr>
          <th colspan="1" scope="row"></th>
          <td>
            <input type="submit" value="Generate Time Table" name="generate" class="btn btn-success" />
          </td>
        </tr>
        <?php if ($generated): ?>
          <tr>
            <td></td>
            <td class="text-right">
              <input type="submit" value="Save" name="save" class="btn btn-primary text-right" />
            </td>
          </tr>
        <?php endif; ?>
      </table>
    </form>
  </div>
</div>

<div>
  <?php 
  if ($generated) {
    $weekDays = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
    $lunch = "LUNCH";

    $branch = '';
    $semester = '';

    if (isset($_POST['courseid'])) {
      $courseid = $_POST['courseid'];
      $query = "SELECT * FROM department WHERE department_id = $courseid";
      $que = mysqli_query($con, $query);
      $row = mysqli_fetch_assoc($que);
      $branch = $row['department_name'];
    }

    if (isset($_POST['s'])) {
      $s = $_POST['s'];
      $query = "SELECT * FROM semester WHERE sem_id = $s";
      $que = mysqli_query($con, $query);
      $row = mysqli_fetch_assoc($que);
      $semester = $row['semester_name'];
    }

    if ($branch && $semester) {
      echo "<div style='font-size: 32'><b>".$branch." ".$semester." Semester</b></div><br>";
    }

    $weekTimeTable = generateTimeTable($con, $courseid, $s);

    if ($weekTimeTable) {
      echo "<table border='1' class='table'>";
      echo "<tr class='danger text-center'>
              <th class='text-center'>Days/Lecture</th>
              <th class='text-center'>Lecture 1<br>09:00-10:00</th>
              <th class='text-center'>Lecture 2<br>10:00-11:00</th>
              <th class='text-center'>Lecture 3<br>11:00-12:00</th>
              <th class='text-center'>Lecture 4<br>12:00-01:00</th>
              <th class='text-center'>Break</th>
              <th class='text-center'>Lecture 5<br>02:30-03:30</th>
              <th class='text-center'>Lecture 6<br>03:30-04:30</th>";

      foreach ($weekTimeTable as $dayRow) {
        echo "<tr>";
        foreach ($dayRow as $lecture) {
          echo "<td class='text-center'>".$lecture."</td>";
        }
        echo "</tr>";
      }
    } else {
      echo "<div style='font-size:28'><b>Not enough data for the selected Course and semester.</b></div>";
    }
  }
  ?>
</div>
