<?php
include('../config.php');
session_start();

echo "<table border='1' class='table'>";

echo "<tr>
<th><font color='#FFF'>Department</font></th>
<th><font color='#FFF'>Semester</font></th>
<th><font color='#FFF'>Subject Name</font></th>
<th><font color='#FFF'>Teacher Name</font></th>
<th><font color='#FFF'>Date</font></th>
<th><font color='#FFF'>Time</font></th>
</tr>";

if(isset($_SESSION['e_id']))
{
    $e_id = $_SESSION['e_id'];
    
    // Get user's semester ID
    $que4 = mysqli_query($con, "SELECT * FROM student WHERE eid='$e_id'");
    $res4 = mysqli_fetch_array($que4);
    
    // Join tables to fetch data
    $query = "SELECT department.department_name, semester.semester_name, subject_sub.subject_name, teacher.teacher_name, timeschedule.date, timeschedule.time 
              FROM timeschedule 
              JOIN department ON department.department_id = timeschedule.department_name 
              JOIN semester ON semester.sem_id = '$res4[sem_id]'
              JOIN subject_sub ON subject_sub.subject_id = timeschedule.subject_name
              JOIN teacher ON teacher.teacher_id = timeschedule.teacher_id";
    
    $result = mysqli_query($con, $query);
    
    if(mysqli_num_rows($result) > 0)
    {
        while($row = mysqli_fetch_array($result))
        {
            echo "<tr>";
            
            echo "<td style='color:white'>" . $row['department_name'] . "</td>";
            echo "<td style='color:white'>" . $row['semester_name'] . "</td>";
            echo "<td style='color:white'>" . $row['subject_name'] . "</td>";
            echo "<td style='color:white'>" . $row['teacher_name'] . "</td>";
            echo "<td style='color:white'>" . $row['date'] . "</td>";
            echo "<td style='color:white'>" . $row['time'] . "</td>";
            
            echo "</tr>";
        }
    }
    else
    {
        echo "<tr><td colspan='6' style='color:white'>No data available</td></tr>";
    }
}
else
{
    echo "<tr><td colspan='6' style='color:white'>User not logged in</td></tr>";
}

echo "</table>";
?>
