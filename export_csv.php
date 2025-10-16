<?php
session_start();
require 'db.php';

// Security check: ensure user is a logged-in teacher
if (!isset($_SESSION['user_id']) || $_SESSION['user_role'] != 'teacher') {
    die("Access Denied.");
}

// Ensure required parameters are present
if (!isset($_GET['class_id']) || !isset($_GET['month'])) {
    die("Missing required parameters.");
}

$class_id = $_GET['class_id'];
$month_str = $_GET['month'];

// --- PREPARE FILENAME ---
$class_name_stmt = $pdo->prepare("SELECT class_name FROM classes WHERE id = ?");
$class_name_stmt->execute([$class_id]);
$class_name = str_replace([' ', '/', '\\'], '_', $class_name_stmt->fetchColumn());
$filename = "Attendance_Report_{$class_name}_{$month_str}.csv";

// --- SET HTTP HEADERS FOR DOWNLOAD ---
header('Content-Type: text/csv');
header('Content-Disposition: attachment; filename="' . $filename . '"');

// --- FETCH DATA (similar to the reports page) ---
$year = date('Y', strtotime($month_str));
$month = date('m', strtotime($month_str));
$days_in_month = cal_days_in_month(CAL_GREGORIAN, $month, $year);

$students_stmt = $pdo->prepare("SELECT s.id, s.full_name, s.student_id_number FROM students s JOIN enrollments e ON s.id = e.student_id WHERE e.class_id = ? ORDER BY s.full_name");
$students_stmt->execute([$class_id]);
$students = $students_stmt->fetchAll(PDO::FETCH_ASSOC);

$attendance_stmt = $pdo->prepare("SELECT student_id, attendance_date, status FROM attendance_records WHERE class_id = ? AND DATE_FORMAT(attendance_date, '%Y-%m') = ?");
$attendance_stmt->execute([$class_id, $month_str]);
$records = $attendance_stmt->fetchAll(PDO::FETCH_ASSOC);

$attendance_map = [];
foreach ($records as $record) {
    $day = date('d', strtotime($record['attendance_date']));
    $attendance_map[$record['student_id']][$day] = $record['status'];
}

// --- WRITE TO CSV ---
$output = fopen('php://output', 'w');

// Create Header Row
$header = ['Reg. No.', 'Student Name'];
for ($day = 1; $day <= $days_in_month; $day++) {
    $header[] = date("d-M", strtotime("$month_str-$day"));
}
fputcsv($output, $header);

// Create Data Rows
foreach ($students as $student) {
    $row = [
        $student['student_id_number'],
        $student['full_name']
    ];
    for ($day = 1; $day <= $days_in_month; $day++) {
        $day_str = str_pad($day, 2, '0', STR_PAD_LEFT);
        $row[] = $attendance_map[$student['id']][$day_str] ?? '';
    }
    fputcsv($output, $row);
}

fclose($output);
exit;
?>