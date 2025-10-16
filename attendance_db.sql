-- ph... SQLINES DEMO ***
-- ve... SQLINES DEMO ***
-- SQLINES DEMO *** admin.net/
--
-- Ho... SQLINES DEMO ***
-- SQLINES DEMO *** Oct 14, 2025 at 10:17 AM
-- SQLINES DEMO *** 0.4.32-MariaDB
-- PH... SQLINES DEMO ***

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/* SQLINES DEMO *** CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/* SQLINES DEMO *** CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/* SQLINES DEMO *** COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/* SQLINES DEMO ***  utf8mb4 */;

--
-- SQLINES DEMO *** ance_db`
--

-- SQLINES DEMO *** ---------------------------------------

--
-- SQLINES DEMO *** or table `assignments`
--

-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE `assignments` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `due_date` datetime NOT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `total_marks` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- SQLINES DEMO *** ---------------------------------------

--
-- SQLINES DEMO *** or table `attendance_records`
--

CREATE TABLE `attendance_records` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `attendance_date` date NOT NULL,
  `status` enum('present','absent','late','excused') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- SQLINES DEMO *** table `attendance_records`
--

INSERT INTO `attendance_records` (`id`, `class_id`, `student_id`, `attendance_date`, `status`) VALUES
(1, 1, 6, '2025-10-14', 'absent'),
(2, 1, 7, '2025-10-14', 'present'),
(3, 1, 3, '2025-10-14', 'absent'),
(4, 1, 2, '2025-10-14', 'absent'),
(5, 1, 5, '2025-10-14', 'absent'),
(6, 1, 4, '2025-10-14', 'present'),
(7, 1, 1, '2025-10-14', 'absent'),
(8, 1, 10, '2025-10-14', 'absent'),
(9, 1, 11, '2025-10-14', 'absent'),
(10, 1, 63, '2025-10-14', 'present'),
(11, 1, 12, '2025-10-14', 'late'),
(12, 1, 13, '2025-10-14', 'present'),
(13, 1, 14, '2025-10-14', 'absent'),
(14, 1, 15, '2025-10-14', 'absent'),
(15, 1, 18, '2025-10-14', 'late'),
(16, 1, 64, '2025-10-14', 'excused'),
(17, 1, 8, '2025-10-14', 'present'),
(18, 1, 9, '2025-10-14', 'absent'),
(19, 1, 19, '2025-10-14', 'present'),
(20, 1, 16, '2025-10-14', 'late'),
(21, 1, 20, '2025-10-14', 'present'),
(22, 1, 21, '2025-10-14', 'absent'),
(23, 1, 22, '2025-10-14', 'present'),
(24, 1, 23, '2025-10-14', 'absent'),
(25, 1, 24, '2025-10-14', 'absent'),
(26, 1, 65, '2025-10-14', 'late'),
(27, 1, 25, '2025-10-14', 'present'),
(28, 1, 26, '2025-10-14', 'absent'),
(29, 1, 28, '2025-10-14', 'present'),
(30, 1, 27, '2025-10-14', 'absent'),
(31, 1, 17, '2025-10-14', 'present'),
(32, 1, 29, '2025-10-14', 'absent'),
(33, 1, 41, '2025-10-14', 'present'),
(34, 1, 30, '2025-10-14', 'absent'),
(35, 1, 31, '2025-10-14', 'present'),
(36, 1, 32, '2025-10-14', 'absent'),
(37, 1, 43, '2025-10-14', 'present'),
(38, 1, 57, '2025-10-14', 'absent'),
(39, 1, 33, '2025-10-14', 'present'),
(40, 1, 34, '2025-10-14', 'absent'),
(41, 1, 44, '2025-10-14', 'present'),
(42, 1, 39, '2025-10-14', 'present'),
(43, 1, 42, '2025-10-14', 'absent'),
(44, 1, 47, '2025-10-14', 'present'),
(45, 1, 35, '2025-10-14', 'absent'),
(46, 1, 40, '2025-10-14', 'present'),
(47, 1, 38, '2025-10-14', 'absent'),
(48, 1, 37, '2025-10-14', 'present'),
(49, 1, 36, '2025-10-14', 'absent'),
(50, 1, 56, '2025-10-14', 'present'),
(51, 1, 49, '2025-10-14', 'present'),
(52, 1, 52, '2025-10-14', 'present'),
(53, 1, 45, '2025-10-14', 'absent'),
(54, 1, 46, '2025-10-14', 'absent'),
(55, 1, 60, '2025-10-14', 'present'),
(56, 1, 48, '2025-10-14', 'absent'),
(57, 1, 61, '2025-10-14', 'present'),
(58, 1, 66, '2025-10-14', 'absent'),
(59, 1, 50, '2025-10-14', 'absent'),
(60, 1, 51, '2025-10-14', 'present'),
(61, 1, 53, '2025-10-14', 'present'),
(62, 1, 54, '2025-10-14', 'absent'),
(63, 1, 55, '2025-10-14', 'absent'),
(64, 1, 58, '2025-10-14', 'absent'),
(65, 1, 62, '2025-10-14', 'present'),
(66, 1, 67, '2025-10-14', 'present'),
(67, 1, 59, '2025-10-14', 'present');

-- SQLINES DEMO *** ---------------------------------------

--
-- SQLINES DEMO *** or table `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `class_name` varchar(255) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `academic_year` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- SQLINES DEMO *** table `classes`
--

INSERT INTO `classes` (`id`, `class_name`, `teacher_id`, `academic_year`) VALUES
(1, 'CS-302 Object-oriented Programming', 2, '2024-2025'),
(2, 'CS-304 Database System', 3, '2024-2025'),
(3, 'CS-306 Digital Logic & Design', 4, '2024-2025'),
(4, 'Math-302 Multivariable Calculus', 5, '2024-2025'),
(5, 'ENG-302 Expository Writing', 6, '2024-2025'),
(6, 'PS-302 Ideology & Constitution of Pakistan', 7, '2024-2025');

-- SQLINES DEMO *** ---------------------------------------

--
-- SQLINES DEMO *** or table `enrollments`
--

CREATE TABLE `enrollments` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- SQLINES DEMO *** table `enrollments`
--

INSERT INTO `enrollments` (`id`, `student_id`, `class_id`) VALUES
(1121, 1, 1),
(1188, 1, 2),
(1255, 1, 3),
(1389, 1, 4),
(1322, 1, 5),
(1055, 1, 6),
(1118, 2, 1),
(1185, 2, 2),
(1252, 2, 3),
(1386, 2, 4),
(1319, 2, 5),
(1051, 2, 6),
(1117, 3, 1),
(1184, 3, 2),
(1251, 3, 3),
(1385, 3, 4),
(1318, 3, 5),
(1050, 3, 6),
(1120, 4, 1),
(1187, 4, 2),
(1254, 4, 3),
(1388, 4, 4),
(1321, 4, 5),
(1054, 4, 6),
(1119, 5, 1),
(1186, 5, 2),
(1253, 5, 3),
(1387, 5, 4),
(1320, 5, 5),
(1052, 5, 6),
(1115, 6, 1),
(1182, 6, 2),
(1249, 6, 3),
(1383, 6, 4),
(1316, 6, 5),
(1048, 6, 6),
(1116, 7, 1),
(1183, 7, 2),
(1250, 7, 3),
(1384, 7, 4),
(1317, 7, 5),
(1049, 7, 6),
(1131, 8, 1),
(1198, 8, 2),
(1265, 8, 3),
(1399, 8, 4),
(1332, 8, 5),
(1064, 8, 6),
(1132, 9, 1),
(1199, 9, 2),
(1266, 9, 3),
(1400, 9, 4),
(1333, 9, 5),
(1065, 9, 6),
(1122, 10, 1),
(1189, 10, 2),
(1256, 10, 3),
(1390, 10, 4),
(1323, 10, 5),
(1056, 10, 6),
(1123, 11, 1),
(1190, 11, 2),
(1257, 11, 3),
(1391, 11, 4),
(1324, 11, 5),
(1053, 11, 6),
(1125, 12, 1),
(1192, 12, 2),
(1259, 12, 3),
(1393, 12, 4),
(1326, 12, 5),
(1058, 12, 6),
(1126, 13, 1),
(1193, 13, 2),
(1260, 13, 3),
(1394, 13, 4),
(1327, 13, 5),
(1059, 13, 6),
(1127, 14, 1),
(1194, 14, 2),
(1261, 14, 3),
(1395, 14, 4),
(1328, 14, 5),
(1060, 14, 6),
(1128, 15, 1),
(1195, 15, 2),
(1262, 15, 3),
(1396, 15, 4),
(1329, 15, 5),
(1061, 15, 6),
(1134, 16, 1),
(1201, 16, 2),
(1268, 16, 3),
(1402, 16, 4),
(1335, 16, 5),
(1067, 16, 6),
(1145, 17, 1),
(1212, 17, 2),
(1279, 17, 3),
(1413, 17, 4),
(1346, 17, 5),
(1078, 17, 6),
(1129, 18, 1),
(1196, 18, 2),
(1263, 18, 3),
(1397, 18, 4),
(1330, 18, 5),
(1062, 18, 6),
(1133, 19, 1),
(1200, 19, 2),
(1267, 19, 3),
(1401, 19, 4),
(1334, 19, 5),
(1066, 19, 6),
(1135, 20, 1),
(1202, 20, 2),
(1269, 20, 3),
(1403, 20, 4),
(1336, 20, 5),
(1068, 20, 6),
(1136, 21, 1),
(1203, 21, 2),
(1270, 21, 3),
(1404, 21, 4),
(1337, 21, 5),
(1069, 21, 6),
(1137, 22, 1),
(1204, 22, 2),
(1271, 22, 3),
(1405, 22, 4),
(1338, 22, 5),
(1070, 22, 6),
(1138, 23, 1),
(1205, 23, 2),
(1272, 23, 3),
(1406, 23, 4),
(1339, 23, 5),
(1071, 23, 6),
(1139, 24, 1),
(1206, 24, 2),
(1273, 24, 3),
(1407, 24, 4),
(1340, 24, 5),
(1072, 24, 6),
(1141, 25, 1),
(1208, 25, 2),
(1275, 25, 3),
(1409, 25, 4),
(1342, 25, 5),
(1074, 25, 6),
(1142, 26, 1),
(1209, 26, 2),
(1276, 26, 3),
(1410, 26, 4),
(1343, 26, 5),
(1075, 26, 6),
(1144, 27, 1),
(1211, 27, 2),
(1278, 27, 3),
(1412, 27, 4),
(1345, 27, 5),
(1077, 27, 6),
(1143, 28, 1),
(1210, 28, 2),
(1277, 28, 3),
(1411, 28, 4),
(1344, 28, 5),
(1076, 28, 6),
(1146, 29, 1),
(1213, 29, 2),
(1280, 29, 3),
(1414, 29, 4),
(1347, 29, 5),
(1079, 29, 6),
(1148, 30, 1),
(1215, 30, 2),
(1282, 30, 3),
(1416, 30, 4),
(1349, 30, 5),
(1081, 30, 6),
(1149, 31, 1),
(1216, 31, 2),
(1283, 31, 3),
(1417, 31, 4),
(1350, 31, 5),
(1082, 31, 6),
(1150, 32, 1),
(1217, 32, 2),
(1284, 32, 3),
(1418, 32, 4),
(1351, 32, 5),
(1083, 32, 6),
(1153, 33, 1),
(1220, 33, 2),
(1287, 33, 3),
(1421, 33, 4),
(1354, 33, 5),
(1086, 33, 6),
(1154, 34, 1),
(1221, 34, 2),
(1288, 34, 3),
(1422, 34, 4),
(1355, 34, 5),
(1087, 34, 6),
(1159, 35, 1),
(1226, 35, 2),
(1293, 35, 3),
(1427, 35, 4),
(1360, 35, 5),
(1092, 35, 6),
(1163, 36, 1),
(1230, 36, 2),
(1297, 36, 3),
(1431, 36, 4),
(1364, 36, 5),
(1096, 36, 6),
(1162, 37, 1),
(1229, 37, 2),
(1296, 37, 3),
(1430, 37, 4),
(1363, 37, 5),
(1095, 37, 6),
(1161, 38, 1),
(1228, 38, 2),
(1295, 38, 3),
(1429, 38, 4),
(1362, 38, 5),
(1094, 38, 6),
(1156, 39, 1),
(1223, 39, 2),
(1290, 39, 3),
(1424, 39, 4),
(1357, 39, 5),
(1089, 39, 6),
(1160, 40, 1),
(1227, 40, 2),
(1294, 40, 3),
(1428, 40, 4),
(1361, 40, 5),
(1093, 40, 6),
(1147, 41, 1),
(1214, 41, 2),
(1281, 41, 3),
(1415, 41, 4),
(1348, 41, 5),
(1080, 41, 6),
(1157, 42, 1),
(1224, 42, 2),
(1291, 42, 3),
(1425, 42, 4),
(1358, 42, 5),
(1090, 42, 6),
(1151, 43, 1),
(1218, 43, 2),
(1285, 43, 3),
(1419, 43, 4),
(1352, 43, 5),
(1084, 43, 6),
(1155, 44, 1),
(1222, 44, 2),
(1289, 44, 3),
(1423, 44, 4),
(1356, 44, 5),
(1088, 44, 6),
(1167, 45, 1),
(1234, 45, 2),
(1301, 45, 3),
(1435, 45, 4),
(1368, 45, 5),
(1100, 45, 6),
(1168, 46, 1),
(1235, 46, 2),
(1302, 46, 3),
(1436, 46, 4),
(1369, 46, 5),
(1101, 46, 6),
(1158, 47, 1),
(1225, 47, 2),
(1292, 47, 3),
(1426, 47, 4),
(1359, 47, 5),
(1091, 47, 6),
(1170, 48, 1),
(1237, 48, 2),
(1304, 48, 3),
(1438, 48, 4),
(1371, 48, 5),
(1103, 48, 6),
(1165, 49, 1),
(1232, 49, 2),
(1299, 49, 3),
(1433, 49, 4),
(1366, 49, 5),
(1098, 49, 6),
(1173, 50, 1),
(1240, 50, 2),
(1307, 50, 3),
(1441, 50, 4),
(1374, 50, 5),
(1106, 50, 6),
(1174, 51, 1),
(1241, 51, 2),
(1308, 51, 3),
(1442, 51, 4),
(1375, 51, 5),
(1107, 51, 6),
(1166, 52, 1),
(1233, 52, 2),
(1300, 52, 3),
(1434, 52, 4),
(1367, 52, 5),
(1099, 52, 6),
(1175, 53, 1),
(1242, 53, 2),
(1309, 53, 3),
(1443, 53, 4),
(1376, 53, 5),
(1108, 53, 6),
(1176, 54, 1),
(1243, 54, 2),
(1310, 54, 3),
(1444, 54, 4),
(1377, 54, 5),
(1109, 54, 6),
(1177, 55, 1),
(1244, 55, 2),
(1311, 55, 3),
(1445, 55, 4),
(1378, 55, 5),
(1110, 55, 6),
(1164, 56, 1),
(1231, 56, 2),
(1298, 56, 3),
(1432, 56, 4),
(1365, 56, 5),
(1097, 56, 6),
(1152, 57, 1),
(1219, 57, 2),
(1286, 57, 3),
(1420, 57, 4),
(1353, 57, 5),
(1085, 57, 6),
(1178, 58, 1),
(1245, 58, 2),
(1312, 58, 3),
(1446, 58, 4),
(1379, 58, 5),
(1111, 58, 6),
(1181, 59, 1),
(1248, 59, 2),
(1315, 59, 3),
(1449, 59, 4),
(1382, 59, 5),
(1114, 59, 6),
(1169, 60, 1),
(1236, 60, 2),
(1303, 60, 3),
(1437, 60, 4),
(1370, 60, 5),
(1102, 60, 6),
(1171, 61, 1),
(1238, 61, 2),
(1305, 61, 3),
(1439, 61, 4),
(1372, 61, 5),
(1104, 61, 6),
(1179, 62, 1),
(1246, 62, 2),
(1313, 62, 3),
(1447, 62, 4),
(1380, 62, 5),
(1112, 62, 6),
(1124, 63, 1),
(1191, 63, 2),
(1258, 63, 3),
(1392, 63, 4),
(1325, 63, 5),
(1057, 63, 6),
(1130, 64, 1),
(1197, 64, 2),
(1264, 64, 3),
(1398, 64, 4),
(1331, 64, 5),
(1063, 64, 6),
(1140, 65, 1),
(1207, 65, 2),
(1274, 65, 3),
(1408, 65, 4),
(1341, 65, 5),
(1073, 65, 6),
(1172, 66, 1),
(1239, 66, 2),
(1306, 66, 3),
(1440, 66, 4),
(1373, 66, 5),
(1105, 66, 6),
(1180, 67, 1),
(1247, 67, 2),
(1314, 67, 3),
(1448, 67, 4),
(1381, 67, 5),
(1113, 67, 6);

-- SQLINES DEMO *** ---------------------------------------

--
-- SQLINES DEMO *** or table `results`
--

CREATE TABLE `results` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `result_title` varchar(255) NOT NULL,
  `marks_obtained` decimal(5,2) NOT NULL,
  `total_marks` decimal(5,2) NOT NULL,
  `result_date` date NOT NULL,
  `remarks` text DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `uploaded_by_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- SQLINES DEMO *** ---------------------------------------

--
-- SQLINES DEMO *** or table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `student_id_number` varchar(100) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- SQLINES DEMO *** table `students`
--

INSERT INTO `students` (`id`, `student_id_number`, `full_name`, `user_id`) VALUES
(1, '2K24-CS-1', 'Abdul Moeed S/o Abdul Jalil Arain', 8),
(2, '2K24-CS-2', 'Abdul Haseeb Shaikh S/o Sarfraz Ahmed Shaikh Shaikh', 9),
(3, '2K24-CS-3', 'Abdul Hanan S/o Zulifqar Ali Chohan', 10),
(4, '2K24-CS-4', 'Abdul Mateen S/o Muhammad Aslam Khoja', 11),
(5, '2K24-CS-5', 'Abdul Malik S/o Ali Akber Mahar', 12),
(6, '2K24-CS-6', 'Abdul Basit S/o M Anwar Kashmiri', 13),
(7, '2K24-CS-7', 'Abdul Hafeez S/o Muhammad Aslam Dars', 14),
(8, '2K24-CS-8', 'Hiba Aisha D/o Muhammad Waris Jat', 15),
(9, '2K24-CS-9', 'Hunain Ali S/o Abdul Hakeem Qureshi', 16),
(10, '2K24-CS-10', 'Aftab Ali S/o Arbab Khaskheli Khaskheli', 17),
(11, '2K24-CS-11', 'Ahsaan Ali Darban S/o Hoat Ali Darban Darban', 18),
(12, '2K24-CS-12', 'Akhtar Hussain S/o Muhammad Suleman Gabole', 19),
(13, '2K24-CS-13', 'Amrash S/o Thanwar Dass Kolhi', 20),
(14, '2K24-CS-14', 'Asad All Asghar S/o Muhammad Asghar Arain', 21),
(15, '2K24-CS-15', 'Asbah Aamna D/o Muhammad Aamir Khanzada', 22),
(16, '2K24-CS-16', 'Irfan S/o Sonomal Oad', 23),
(17, '2K24-CS-17', 'Khansa Fatima D/o Muhammad Nasir Shaikh', 24),
(18, '2K24-CS-18', 'Barkat Ali S/o Motia Khan Bangwar', 25),
(19, '2K24-CS-19', 'Huzaifa S/o Imdad Ali Bhutto', 26),
(20, '2K24-CS-20', 'Ishfaque Ali S/o Mubarak Soomro', 27),
(21, '2K24-CS-21', 'Jahanzeb S/o Muhammad Malook Rind', 28),
(22, '2K24-CS-22', 'Jameel S/o Ghulam Rasool Jamali', 29),
(23, '2K24-CS-23', 'Jaswant S/o Kapil Dev Maheshwari', 30),
(24, '2K24-CS-24', 'Jawad Hussain S/o Ghulam Shabir Khuhro', 31),
(25, '2K24-CS-25', 'Kaleemullah S/o Abdul Ghaffar Shabrani', 32),
(26, '2K24-CS-26', 'Kashif Ali S/o Wazir All Hothipoto', 33),
(27, '2K24-CS-27', 'Kelash S/o Devsi Bheel', 34),
(28, '2K24-CS-28', 'Kelash S/o Chetan Meghwar', 35),
(29, '2K24-CS-29', 'Kiran D/o Shams-Ud-Din Dhiloo', 36),
(30, '2K24-CS-30', 'Mazhar Ul Haque S/o Abdul Haque Palli', 37),
(31, '2K24-CS-31', 'Mohammad Yasin S/o Mohammad Aslam Laghari', 38),
(32, '2K24-CS-32', 'Moiz Ur Rehman S/o Nadeem Ahmed Shaikh', 39),
(33, '2K24-CS-33', 'Muhammad Asharib S/o Muhammad Arif Bhatti', 40),
(34, '2K24-CS-34', 'Muhammad Hamza Faisal S/o Muhammad Faisal Sheikh', 41),
(35, '2K24-CS-35', 'Muhammad Rauf S/o Mansoor Ahmed Rind', 42),
(36, '2K24-CS-36', 'Muhammad Umar S/o Abdul Fatah Ghanghro', 43),
(37, '2K24-CS-37', 'Muhammad Tahir Hussain S/o Sajid Ali Memon', 44),
(38, '2K24-CS-38', 'Muhammad Saleem S/o Muhammad Ismail Junejo', 45),
(39, '2K24-CS-39', 'Muhammad Kait S/o Shahid Hussain Qureshi', 46),
(40, '2K24-CS-40', 'Muhammad Raza S/o Rustam Ali Halepoto', 47),
(41, '2K24-CS-41', 'Komal D/o Ramchand Meghwar', 48),
(42, '2K24-CS-42', 'Muhammad Kamran S/o Muhammad Siddique Nihalani', 49),
(43, '2K24-CS-43', 'Muhammad Abdullah S/o Jawed Ali Lodhi', 50),
(44, '2K24-CS-44', 'Muhammad Huzaim S/o Abdul Sami Shaikh', 51),
(45, '2K24-CS-45', 'Muzzafar Ali S/o Mazhar Ali Jamro', 52),
(46, '2K24-CS-46', 'Nazim Ali S/o Azam Khan Lashari', 53),
(47, '2K24-CS-47', 'Muhammad Mubeen S/o Ghulam Yaseen Mangi', 54),
(48, '2K24-CS-48', 'Qais Ul Hassan Shaikh S/o Abdul Waheed Shaikh Shaikh', 55),
(49, '2K24-CS-49', 'Muhammad Uzair Khan S/o Aurangzaib Khan Kaimkhani', 56),
(50, '2K24-CS-50', 'Salman Khan S/o Muzafar Ali Laghari', 57),
(51, '2K24-CS-51', 'Samar Hussain S/o Shoukat Ali Mari', 58),
(52, '2K24-CS-52', 'Muzamil Hussain S/o Manzoor Hussain Nahiyoon', 59),
(53, '2K24-CS-53', 'Sanaullah S/o Ghulam Qadir Shaikh', 60),
(54, '2K24-CS-54', 'Shankar S/o Chetan Kolhi', 61),
(55, '2K24-CS-55', 'Shoukat Ali S/o Muhammad Suleman Mirani', 62),
(56, '2K24-CS-56', 'Muhammad Umer S/o Habib Asif Arain', 63),
(57, '2K24-CS-57', 'Muhammad Ahsan S/o Khushi Muhammad Mughal', 64),
(58, '2K24-CS-58', 'Ubada Bin Aslam S/o Muhammad Aslam Sial', 65),
(59, '2K24-CS-59', 'Zuhaib Ali S/o Mushtaque Ali Hisbani', 66),
(60, '2K24-CS-60', 'Nimra D/o Ghulam Rasool Khokhar', 67),
(61, '2K24-CS-61', 'Raza Hayat S/o Tarique Hayat Pathan', 68),
(62, '2K24-CS-62', 'Umair Afzal S/o Muhammad Afzal Kashmiri', 69),
(63, '2K24-CS-63', 'Aisha D/o Ali Bux Laghari', 70),
(64, '2K24-CS-64', 'Bilal Ahmed S/o Abdul Rasheed Arain', 71),
(65, '2K24-CS-65', 'Jetha Nand S/o Pahlaj Rai Hindu', 72),
(66, '2K24-CS-66', 'Rohit S/o Arjun Kumar Malhi', 73),
(67, '2K24-CS-67', 'Wafa Zahra D/o Shahid Ali Chandiyo', 74);

-- SQLINES DEMO *** ---------------------------------------

--
-- SQLINES DEMO *** or table `timetable`
--

CREATE TABLE `timetable` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `day_of_week` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `room_number` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- SQLINES DEMO *** table `timetable`
--

INSERT INTO `timetable` (`id`, `class_id`, `day_of_week`, `start_time`, `end_time`, `room_number`) VALUES
(19, 5, 'Monday', '08:30:00', '09:30:00', NULL),
(20, 3, 'Monday', '09:30:00', '10:30:00', NULL),
(21, 4, 'Monday', '10:30:00', '11:30:00', NULL),
(22, 1, 'Monday', '11:30:00', '12:30:00', NULL),
(23, 3, 'Monday', '13:30:00', '15:30:00', 'Electronic Lab'),
(24, 5, 'Tuesday', '08:30:00', '09:30:00', NULL),
(25, 3, 'Tuesday', '09:30:00', '10:30:00', NULL),
(26, 1, 'Tuesday', '10:30:00', '11:30:00', NULL),
(27, 4, 'Tuesday', '11:30:00', '12:30:00', NULL),
(28, 6, 'Wednesday', '08:30:00', '10:30:00', NULL),
(29, 2, 'Wednesday', '10:30:00', '12:30:00', 'AB Lab'),
(30, 1, 'Wednesday', '13:30:00', '15:30:00', 'Electronic Lab'),
(31, 2, 'Thursday', '08:30:00', '09:30:00', NULL),
(32, 5, 'Thursday', '09:30:00', '10:30:00', NULL),
(33, 1, 'Thursday', '10:30:00', '11:30:00', NULL),
(34, 2, 'Thursday', '11:30:00', '12:30:00', NULL),
(35, 2, 'Friday', '08:30:00', '09:30:00', NULL),
(36, 4, 'Friday', '09:30:00', '10:30:00', NULL);

-- SQLINES DEMO *** ---------------------------------------

--
-- SQLINES DEMO *** or table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('admin','teacher','student') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- SQLINES DEMO *** table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password_hash`, `role`, `created_at`) VALUES
(1, 'Admin User', 'admin@sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'admin', '2025-10-14 06:34:39'),
(2, 'Mr. Tasaduq Hussain', 'tasaduq.hussain@sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'teacher', '2025-10-14 06:34:39'),
(3, 'Mr. Amir Bangish', 'amir.bangish@sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'teacher', '2025-10-14 06:34:39'),
(4, 'Mr. Ghulam Hussain', 'ghulam.hussain@sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'teacher', '2025-10-14 06:34:39'),
(5, 'Mr. Veero Mal', 'veero.mal@sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'teacher', '2025-10-14 06:34:39'),
(6, 'Mr. Jahanzeb Talpur', 'jahanzeb.talpur@sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'teacher', '2025-10-14 06:34:39'),
(7, 'Dr. Farkhanda Warsi', 'farkhanda.warsi@sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'teacher', '2025-10-14 06:34:39'),
(8, 'Abdul Moeed S/o Abdul Jalil Arain', '2k24-cs-1@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(9, 'Abdul Haseeb Shaikh S/o Sarfraz Ahmed Shaikh Shaikh', '2k24-cs-2@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(10, 'Abdul Hanan S/o Zulifqar Ali Chohan', '2k24-cs-3@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(11, 'Abdul Mateen S/o Muhammad Aslam Khoja', '2k24-cs-4@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(12, 'Abdul Malik S/o Ali Akber Mahar', '2k24-cs-5@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(13, 'Abdul Basit S/o M Anwar Kashmiri', '2k24-cs-6@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(14, 'Abdul Hafeez S/o Muhammad Aslam Dars', '2k24-cs-7@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(15, 'Hiba Aisha D/o Muhammad Waris Jat', '2k24-cs-8@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(16, 'Hunain Ali S/o Abdul Hakeem Qureshi', '2k24-cs-9@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(17, 'Aftab Ali S/o Arbab Khaskheli Khaskheli', '2k24-cs-10@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(18, 'Ahsaan Ali Darban S/o Hoat Ali Darban Darban', '2k24-cs-11@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(19, 'Akhtar Hussain S/o Muhammad Suleman Gabole', '2k24-cs-12@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(20, 'Amrash S/o Thanwar Dass Kolhi', '2k24-cs-13@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(21, 'Asad All Asghar S/o Muhammad Asghar Arain', '2k24-cs-14@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(22, 'Asbah Aamna D/o Muhammad Aamir Khanzada', '2k24-cs-15@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(23, 'Irfan S/o Sonomal Oad', '2k24-cs-16@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(24, 'Khansa Fatima D/o Muhammad Nasir Shaikh', '2k24-cs-17@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(25, 'Barkat Ali S/o Motia Khan Bangwar', '2k24-cs-18@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(26, 'Huzaifa S/o Imdad Ali Bhutto', '2k24-cs-19@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(27, 'Ishfaque Ali S/o Mubarak Soomro', '2k24-cs-20@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(28, 'Jahanzeb S/o Muhammad Malook Rind', '2k24-cs-21@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(29, 'Jameel S/o Ghulam Rasool Jamali', '2k24-cs-22@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(30, 'Jaswant S/o Kapil Dev Maheshwari', '2k24-cs-23@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(31, 'Jawad Hussain S/o Ghulam Shabir Khuhro', '2k24-cs-24@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(32, 'Kaleemullah S/o Abdul Ghaffar Shabrani', '2k24-cs-25@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(33, 'Kashif Ali S/o Wazir All Hothipoto', '2k24-cs-26@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(34, 'Kelash S/o Devsi Bheel', '2k24-cs-27@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(35, 'Kelash S/o Chetan Meghwar', '2k24-cs-28@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(36, 'Kiran D/o Shams-Ud-Din Dhiloo', '2k24-cs-29@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(37, 'Mazhar Ul Haque S/o Abdul Haque Palli', '2k24-cs-30@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(38, 'Mohammad Yasin S/o Mohammad Aslam Laghari', '2k24-cs-31@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(39, 'Moiz Ur Rehman S/o Nadeem Ahmed Shaikh', '2k24-cs-32@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(40, 'Muhammad Asharib S/o Muhammad Arif Bhatti', '2k24-cs-33@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(41, 'Muhammad Hamza Faisal S/o Muhammad Faisal Sheikh', '2k24-cs-34@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(42, 'Muhammad Rauf S/o Mansoor Ahmed Rind', '2k24-cs-35@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(43, 'Muhammad Umar S/o Abdul Fatah Ghanghro', '2k24-cs-36@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(44, 'Muhammad Tahir Hussain S/o Sajid Ali Memon', '2k24-cs-37@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(45, 'Muhammad Saleem S/o Muhammad Ismail Junejo', '2k24-cs-38@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(46, 'Muhammad Kait S/o Shahid Hussain Qureshi', '2k24-cs-39@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(47, 'Muhammad Raza S/o Rustam Ali Halepoto', '2k24-cs-40@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(48, 'Komal D/o Ramchand Meghwar', '2k24-cs-41@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(49, 'Muhammad Kamran S/o Muhammad Siddique Nihalani', '2k24-cs-42@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(50, 'Muhammad Abdullah S/o Jawed Ali Lodhi', '2k24-cs-43@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(51, 'Muhammad Huzaim S/o Abdul Sami Shaikh', '2k24-cs-44@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(52, 'Muzzafar Ali S/o Mazhar Ali Jamro', '2k24-cs-45@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(53, 'Nazim Ali S/o Azam Khan Lashari', '2k24-cs-46@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(54, 'Muhammad Mubeen S/o Ghulam Yaseen Mangi', '2k24-cs-47@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(55, 'Qais Ul Hassan Shaikh S/o Abdul Waheed Shaikh Shaikh', '2k24-cs-48@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(56, 'Muhammad Uzair Khan S/o Aurangzaib Khan Kaimkhani', '2k24-cs-49@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(57, 'Salman Khan S/o Muzafar Ali Laghari', '2k24-cs-50@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(58, 'Samar Hussain S/o Shoukat Ali Mari', '2k24-cs-51@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(59, 'Muzamil Hussain S/o Manzoor Hussain Nahiyoon', '2k24-cs-52@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(60, 'Sanaullah S/o Ghulam Qadir Shaikh', '2k24-cs-53@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(61, 'Shankar S/o Chetan Kolhi', '2k24-cs-54@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(62, 'Shoukat Ali S/o Muhammad Suleman Mirani', '2k24-cs-55@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(63, 'Muhammad Umer S/o Habib Asif Arain', '2k24-cs-56@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(64, 'Muhammad Ahsan S/o Khushi Muhammad Mughal', '2k24-cs-57@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(65, 'Ubada Bin Aslam S/o Muhammad Aslam Sial', '2k24-cs-58@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(66, 'Zuhaib Ali S/o Mushtaque Ali Hisbani', '2k24-cs-59@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(67, 'Nimra D/o Ghulam Rasool Khokhar', '2k24-cs-60@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(68, 'Raza Hayat S/o Tarique Hayat Pathan', '2k24-cs-61@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(69, 'Umair Afzal S/o Muhammad Afzal Kashmiri', '2k24-cs-62@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(70, 'Aisha D/o Ali Bux Laghari', '2k24-cs-63@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(71, 'Bilal Ahmed S/o Abdul Rasheed Arain', '2k24-cs-64@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(72, 'Jetha Nand S/o Pahlaj Rai Hindu', '2k24-cs-65@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(73, 'Rohit S/o Arjun Kumar Malhi', '2k24-cs-66@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39'),
(74, 'Wafa Zahra D/o Shahid Ali Chandiyo', '2k24-cs-67@student.sau.edu.pk', '$2y$10$L2ykTvNQLkJAOwyunTHDpe.3H/0eO3yz7ojbYm5Nw4V/zhc6RA4y6', 'student', '2025-10-14 06:34:39');

--
-- SQLINES DEMO *** d tables
--

--
-- SQLINES DEMO ***  `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- SQLINES DEMO ***  `attendance_records`
--
ALTER TABLE `attendance_records`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_class_date_unique` (`student_id`,`class_id`,`attendance_date`),
  ADD KEY `class_id` (`class_id`);

--
-- SQLINES DEMO ***  `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- SQLINES DEMO ***  `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_class_unique` (`student_id`,`class_id`),
  ADD UNIQUE KEY `unique_enrollment` (`student_id`,`class_id`),
  ADD KEY `class_id` (`class_id`);

--
-- SQLINES DEMO ***  `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `uploaded_by_id` (`uploaded_by_id`);

--
-- SQLINES DEMO ***  `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_id_number` (`student_id_number`),
  ADD KEY `user_id` (`user_id`);

--
-- SQLINES DEMO ***  `timetable`
--
ALTER TABLE `timetable`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`);

--
-- SQLINES DEMO ***  `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- SQLINES DEMO *** r dumped tables
--

--
-- SQLINES DEMO *** r table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `id` cast(11 as int) NOT NULL AUTO_INCREMENT;

--
-- SQLINES DEMO *** r table `attendance_records`
--
ALTER TABLE `attendance_records`
  MODIFY `id` cast(11 as int) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- SQLINES DEMO *** r table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` cast(11 as int) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- SQLINES DEMO *** r table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` cast(11 as int) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1450;

--
-- SQLINES DEMO *** r table `results`
--
ALTER TABLE `results`
  MODIFY `id` cast(11 as int) NOT NULL AUTO_INCREMENT;

--
-- SQLINES DEMO *** r table `students`
--
ALTER TABLE `students`
  MODIFY `id` cast(11 as int) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- SQLINES DEMO *** r table `timetable`
--
ALTER TABLE `timetable`
  MODIFY `id` cast(11 as int) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- SQLINES DEMO *** r table `users`
--
ALTER TABLE `users`
  MODIFY `id` cast(11 as int) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- SQLINES DEMO *** umped tables
--

--
-- SQLINES DEMO *** able `assignments`
--
ALTER TABLE `assignments`
  ADD CONSTRAINT `assignments_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assignments_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`);

--
-- SQLINES DEMO *** able `attendance_records`
--
ALTER TABLE `attendance_records`
  ADD CONSTRAINT `attendance_records_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attendance_records_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE;

--
-- SQLINES DEMO *** able `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- SQLINES DEMO *** able `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE;

--
-- SQLINES DEMO *** able `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `results_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `results_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `results_ibfk_3` FOREIGN KEY (`uploaded_by_id`) REFERENCES `users` (`id`);

--
-- SQLINES DEMO *** able `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- SQLINES DEMO *** able `timetable`
--
ALTER TABLE `timetable`
  ADD CONSTRAINT `timetable_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE;
COMMIT;

/* SQLINES DEMO *** CTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/* SQLINES DEMO *** CTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/* SQLINES DEMO *** TION_CONNECTION=@OLD_COLLATION_CONNECTION */;
