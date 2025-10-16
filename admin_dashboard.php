<?php
include 'header.php';
require 'db.php';
$studentsCount = $pdo->query("SELECT count(*) FROM students")->fetchColumn();
$teachersCount = $pdo->query("SELECT count(*) FROM users WHERE role = 'teacher'")->fetchColumn();
$classesCount = $pdo->query("SELECT count(*) FROM classes")->fetchColumn();
?>

<div class="row">
    <div class="col-md-4">
        <div class="dashboard-card text-primary">
            <div class="d-flex align-items-center">
                <div class="card-icon bg-primary bg-opacity-10 me-3">
                    <i class="bi bi-people-fill"></i>
                </div>
                <div>
                    <h6 class="text-muted">Total Students</h6>
                    <h3 class="fw-bold"><?php echo $studentsCount; ?></h3>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="dashboard-card text-success">
            <div class="d-flex align-items-center">
                <div class="card-icon bg-success bg-opacity-10 me-3">
                    <i class="bi bi-person-video3"></i>
                </div>
                <div>
                    <h6 class="text-muted">Total Teachers</h6>
                    <h3 class="fw-bold"><?php echo $teachersCount; ?></h3>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="dashboard-card text-info">
             <div class="d-flex align-items-center">
                <div class="card-icon bg-info bg-opacity-10 me-3">
                    <i class="bi bi-collection-fill"></i>
                </div>
                <div>
                    <h6 class="text-muted">Total Classes</h6>
                    <h3 class="fw-bold"><?php echo $classesCount; ?></h3>
                </div>
            </div>
        </div>
    </div>
</div>

<?php include 'footer.php'; ?>