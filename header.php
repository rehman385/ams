<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header('Location: index.php');
    exit;
}
$role = $_SESSION['user_role'];
// Get the current page filename to highlight the active link
$currentPage = basename($_SERVER['PHP_SELF']);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo ucfirst($role); ?> Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="dashboard-wrapper">
        <nav class="sidebar">
            <div class="sidebar-header">
                <h3><i class="bi bi-grid-1x2-fill"></i> AMS Portal</h3>
            </div>
            <ul class="sidebar-links">
                <?php if ($role == 'admin'): ?>
                    <li class="<?php echo ($currentPage == 'admin_dashboard.php') ? 'active' : ''; ?>">
                        <a href="admin_dashboard.php"><i class="bi bi-house-door-fill"></i> Dashboard</a>
                    </li>
                    <li class="<?php echo ($currentPage == 'admin_manage_students.php') ? 'active' : ''; ?>">
                        <a href="admin_manage_students.php"><i class="bi bi-people-fill"></i> Manage Students</a>
                    </li>
                    <li class="<?php echo ($currentPage == 'admin_manage_teachers.php') ? 'active' : ''; ?>">
                        <a href="admin_manage_teachers.php"><i class="bi bi-person-video3"></i> Manage Teachers</a>
                    </li>
                    <li class="<?php echo ($currentPage == 'admin_manage_classes.php') ? 'active' : ''; ?>">
                        <a href="admin_manage_classes.php"><i class="bi bi-collection-fill"></i> Manage Classes</a>
                    </li>
                    <li class="<?php echo ($currentPage == 'admin_manage_enrollments.php') ? 'active' : ''; ?>">
                        <a href="admin_manage_enrollments.php"><i class="bi bi-person-check-fill"></i> Manage Enrollments</a>
                    </li>

                <?php elseif ($role == 'teacher'): ?>
                    <li class="<?php echo ($currentPage == 'teacher_dashboard.php') ? 'active' : ''; ?>">
                        <a href="teacher_dashboard.php"><i class="bi bi-house-door-fill"></i> Dashboard</a>
                    </li>
                    <li class="<?php echo ($currentPage == 'teacher_reports.php') ? 'active' : ''; ?>">
                        <a href="teacher_reports.php"><i class="bi bi-file-earmark-bar-graph-fill"></i> Reports</a>
                    </li>

                <?php elseif ($role == 'student'): ?>
                    <li class="<?php echo ($currentPage == 'student_dashboard.php') ? 'active' : ''; ?>">
                        <a href="student_dashboard.php"><i class="bi bi-house-door-fill"></i> Dashboard</a>
                    </li>
                    <li class="<?php echo ($currentPage == 'student_view_attendance.php') ? 'active' : ''; ?>">
                        <a href="student_view_attendance.php"><i class="bi bi-calendar-check-fill"></i> My Attendance</a>
                    </li>
                    <li class="<?php echo ($currentPage == 'student_view_timetable.php') ? 'active' : ''; ?>">
                        <a href="student_view_timetable.php"><i class="bi bi-table"></i> My Timetable</a>
                    </li>
                <?php endif; ?>
            </ul>
            <div class="sidebar-footer">
                <a href="logout.php" class="logout-btn"><i class="bi bi-box-arrow-left"></i> Logout</a>
            </div>
        </nav>

        <main class="main-content">
            <header class="main-header d-flex justify-content-between align-items-center">
                <div class="user-info">
                    <h5>Welcome, <?php echo htmlspecialchars($_SESSION['user_name']); ?>!</h5>
                    <span class="text-muted">You are logged in as a <?php echo ucfirst($role); ?>.</span>
                </div>
                
                <div class="header-branding text-end">
                    <h6 class="mb-0">Sindh Agriculture University, Tandojam</h6>
                    <span>ITC - Computer Science Department</span><br>
                    <small class="text-muted">
                        <i class="bi bi-calendar-event"></i> Today: <?php echo date("l, F j, Y"); ?>
                    </small>
                </div>
            </header>
            <div class="content-body">