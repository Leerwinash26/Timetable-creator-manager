<?php
if ($_GET['generated']) {
    include "timetablegen.php";

    echo "<table border='1' class='table'>";

    echo "<tr class='danger'>
        <th>Days/Lecture</th>
        <th>Lecture 1</th>
        <th>Lecture 2</th>
        <th>Lecture 3</th>
        <th>Lecture 4</th>
        <th>Lecture 5</th>
        <th>Lecture 6</th>
    </tr>"; // Close the <tr> tag

    // Assuming $con, $courseid, and $s are properly defined

    // Generate the timetable using the generate_time_table() function
    $timetable = generate_time_table($con, $courseid, $s);

    // Populate the timetable data into the table rows and cells
    $weekDays = array("Monday", "Tuesday", "Wednesday", "Thursday", "Friday");

    foreach ($weekDays as $index => $day) {
        echo "<tr>";
        echo "<th class='danger text-center'>$day</th>"; // Remove unnecessary 'center' class

        for ($i = 0; $i < 6; $i++) {
            $lecture = $timetable[$index][$i];

            if ($lecture === "Empty") {
                echo "<td class='text-center'>Empty</td>"; // Use <td> instead of <th> for cell data
            } else {
                $subjectName = $lecture['subject_name'];
                $lectureType = $lecture['type'];

                if ($lectureType === 'Lab') {
                    echo "<td class='text-center' colspan='2'>$subjectName</td>"; // Use <td> instead of <th> for cell data
                    $i++;
                } else {
                    echo "<td class='text-center'>$subjectName</td>"; // Use <td> instead of <th> for cell data
                }
            }
        }

        echo "</tr>";
    }

    echo "</table>";
}

?>
