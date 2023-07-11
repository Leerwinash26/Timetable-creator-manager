<?php

function generate_time_table($con, $courseid, $s)
{
    $query = "SELECT * FROM subject WHERE department_id = $courseid AND sem_id = $s";
    $que = mysqli_query($con, $query);
    
    if (!$que) {
        die("Database query failed: " . mysqli_error($con));
    }
    
    $rows = mysqli_num_rows($que);

    if ($rows != 0) {
        $subjects = array();

        while ($row = mysqli_fetch_assoc($que)) {
            array_push($subjects, $row);
        }

        $weekTimeTable = array();

        $weekDays = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
        $timeSlots = ['09:00-10:00', '10:00-11:00', '11:00-12:00', '12:00-01:00', '02:30-03:30', '03:30-04:30'];
        $breakSlot = '01:00-02:30';

        for ($i = 0; $i < 5; $i++) {
            $dayTimeTable = array();

            // Add a break slot
            array_push($dayTimeTable, ['subject_name' => 'Break', 'lecture_time' => $breakSlot]);

            shuffle($subjects);
            $pointer = 0;

            for ($j = 0; $j < 6; $j++) {
                if ($pointer >= count($subjects)) {
                    $pointer = 0;
                }

                if ($subjects[$pointer]['lecture_per_week'] > 0) {
                    $lecture = array(
                        'subject_name' => $subjects[$pointer]['subject_name'],
                        'lecture_time' => $timeSlots[$j]
                    );

                    array_push($dayTimeTable, $lecture);
                    $subjects[$pointer]['lecture_per_week']--;
                }

                $pointer++;
            }

            // Add remaining slots as empty
            while (count($dayTimeTable) < 8) {
                array_push($dayTimeTable, ['subject_name' => '', 'lecture_time' => '']);
            }

            $dayTimeTable[0]['subject_name'] = $weekDays[$i]; // Set the day name

            array_push($weekTimeTable, $dayTimeTable);
        }

        return $weekTimeTable;
    } else {
        return false;
    }
}


?>
