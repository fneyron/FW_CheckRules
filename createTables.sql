SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `fw_logs`
--

-- --------------------------------------------------------

--
-- Structure de la table `fwGroup`
--

CREATE TABLE IF NOT EXISTS `fwGroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grpName` varchar(255) DEFAULT NULL,
  `ipRange` varchar(255) DEFAULT NULL,
  `ip_start` varchar(255) NOT NULL,
  `ip_end` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=142 ;

--
-- Contenu de la table `fwGroup`
--

INSERT INTO `fwGroup` (`id`, `grpName`, `ipRange`, `ip_start`, `ip_end`) VALUES
(4, 'Grp_NET_ALL_RFC1918', '10.0.0.0/8', '10.0.0.1', '10.255.255.254'),
(5, 'Grp_NET_ALL_RFC1918', '172.16.0.0/12', '172.16.0.1', '172.31.255.254'),
(6, 'Grp_NET_ALL_RFC1918', '192.168.0.0/16', '192.168.0.1', '192.168.255.254'),
(7, 'Grp_NET_FR_Admins', '172.16.46.0/25', '172.16.46.1', '172.16.46.126'),
(8, 'Grp_NET_FR_Admins', '192.168.19.0/24', '192.168.19.1', '192.168.19.254'),
(9, 'Grp_NET_FR_Admins', '192.168.26.0/25', '192.168.26.1', '192.168.26.126'),
(10, 'Grp_NET_FR_Admins', '192.168.33.0/27', '192.168.33.1', '192.168.33.30'),
(11, 'Grp_NET_FR_Admins', '192.168.202.0/27', '192.168.202.1', '192.168.202.30'),
(12, 'Grp_NET_FR_Admins', '192.168.204.0/27', '192.168.204.1', '192.168.204.30'),
(13, 'Grp_HOST_FR_Server_Infra', '192.168.138.30', '192.168.138.30', '192.168.138.30'),
(14, 'Grp_HOST_FR_Server_Infra', '192.168.0.29', '192.168.0.29', '192.168.0.29'),
(15, 'Grp_HOST_FR_Server_Infra', '192.168.23.202', '192.168.23.202', '192.168.23.202'),
(16, 'Grp_HOST_FR_Server_Infra', '192.168.31.137', '192.168.31.137', '192.168.31.137'),
(17, 'Grp_HOST_FR_Server_Infra', '192.168.39.224', '192.168.39.224', '192.168.39.224'),
(18, 'Grp_HOST_FR_Server_Infra', '192.168.152.29', '192.168.152.29', '192.168.152.29'),
(19, 'Grp_HOST_FR_Server_Infra', '192.168.0.28', '192.168.0.28', '192.168.0.28'),
(29, 'Grp_NET_FR_Users', '172.16.42.0/24', '172.16.42.1', '172.16.42.254'),
(30, 'Grp_NET_FR_Users', '192.168.18.0/24', '192.168.18.1', '192.168.18.254'),
(31, 'Grp_NET_FR_Users', '192.168.24.0/23', '192.168.24.1', '192.168.25.254'),
(33, 'Grp_NET_FR_Users', '192.168.36.0/23', '192.168.36.1', '192.168.37.254'),
(34, 'Grp_NET_FR_Users', '192.168.205.0/24', '192.168.205.1', '192.168.205.254'),
(35, 'Grp_NET_FR_Users', '172.16.41.32/27', '172.16.41.33', '172.16.41.62'),
(36, 'Grp_NET_FR_Users', '192.168.17.96/27', '192.168.17.97', '192.168.17.126'),
(37, 'Grp_NET_FR_Users', '192.168.27.32/27', '192.168.27.33', '192.168.27.62'),
(38, 'Grp_NET_FR_Users', '192.168.34.0/24', '192.168.34.1', '192.168.34.254'),
(39, 'Grp_NET_FR_Users', '192.168.204.128/25', '192.168.204.129', '192.168.204.254'),
(41, 'Grp_HOST_FR_Server_DHCP', '192.168.28.10', '192.168.28.10', '192.168.28.10'),
(42, 'Grp_HOST_FR_Server_DHCP', '192.168.23.202', '192.168.23.202', '192.168.23.202'),
(43, 'Grp_HOST_FR_Server_DHCP', '192.168.31.137', '192.168.31.137', '192.168.31.137'),
(44, 'Grp_HOST_FR_Server_DHCP', '192.168.39.224', '192.168.39.224', '192.168.39.224'),
(46, 'Grp_HOST_FR_Server_Infra', '192.168.152.28', '192.168.152.28', '192.168.152.28'),
(47, 'Grp_HOST_FR_Server_Radius', '192.168.0.29', '192.168.0.29', '192.168.0.29'),
(48, 'Grp_HOST_FR_Server_Radius', '192.168.23.202', '192.168.23.202', '192.168.23.202'),
(49, 'Grp_HOST_FR_Server_Radius', '192.168.31.137', '192.168.31.137', '192.168.31.137'),
(50, 'Grp_HOST_FR_Server_Radius', '192.168.39.224', '192.168.39.224', '192.168.39.224'),
(51, 'Grp_HOST_FR_Server_Radius', '192.168.152.29', '192.168.152.29', '192.168.152.29'),
(52, 'Grp_HOST_FR_Client_Radius', '172.16.46.130', '172.16.46.130', '172.16.46.130'),
(53, 'Grp_HOST_FR_Client_Radius', '172.16.46.131', '172.16.46.131', '172.16.46.131'),
(54, 'Grp_HOST_FR_Client_Radius', '172.16.46.254', '172.16.46.254', '172.16.46.254'),
(55, 'Grp_HOST_FR_Client_Radius', '192.168.152.250', '192.168.152.250', '192.168.152.250'),
(56, 'Grp_HOST_FR_Client_Radius', '192.168.152.254', '192.168.152.254', '192.168.152.254'),
(57, 'Grp_HOST_FR_Client_Radius', '192.168.200.254', '192.168.200.254', '192.168.200.254'),
(58, 'Grp_HOST_FR_Client_Radius', '192.168.23.19', '192.168.23.19', '192.168.23.19'),
(59, 'Grp_HOST_FR_Client_Radius', '192.168.23.26', '192.168.23.26', '192.168.23.26'),
(60, 'Grp_HOST_FR_Client_Radius', '192.168.23.27', '192.168.23.27', '192.168.23.27'),
(61, 'Grp_HOST_FR_Client_Radius', '192.168.23.30', '192.168.23.30', '192.168.23.30'),
(62, 'Grp_HOST_FR_Client_Radius', '192.168.23.31', '192.168.23.31', '192.168.23.31'),
(63, 'Grp_HOST_FR_Client_Radius', '192.168.23.32', '192.168.23.32', '192.168.23.32'),
(64, 'Grp_HOST_FR_Client_Radius', '192.168.23.33', '192.168.23.33', '192.168.23.33'),
(65, 'Grp_HOST_FR_Client_Radius', '192.168.23.34', '192.168.23.34', '192.168.23.34'),
(66, 'Grp_HOST_FR_Client_Radius', '192.168.23.35', '192.168.23.35', '192.168.23.35'),
(67, 'Grp_HOST_FR_Client_Radius', '192.168.23.36', '192.168.23.36', '192.168.23.36'),
(68, 'Grp_HOST_FR_Client_Radius', '192.168.23.4', '192.168.23.4', '192.168.23.4'),
(69, 'Grp_HOST_FR_Client_Radius', '192.168.23.5', '192.168.23.5', '192.168.23.5'),
(70, 'Grp_HOST_FR_Client_Radius', '192.168.23.52', '192.168.23.52', '192.168.23.52'),
(71, 'Grp_HOST_FR_Client_Radius', '192.168.23.59', '192.168.23.59', '192.168.23.59'),
(72, 'Grp_HOST_FR_Client_Radius', '192.168.23.6', '192.168.23.6', '192.168.23.6'),
(73, 'Grp_HOST_FR_Client_Radius', '192.168.23.60', '192.168.23.60', '192.168.23.60'),
(74, 'Grp_HOST_FR_Client_Radius', '192.168.23.61', '192.168.23.61', '192.168.23.61'),
(75, 'Grp_HOST_FR_Client_Radius', '192.168.23.62', '192.168.23.62', '192.168.23.62'),
(76, 'Grp_HOST_FR_Client_Radius', '192.168.23.7', '192.168.23.7', '192.168.23.7'),
(77, 'Grp_HOST_FR_Client_Radius', '192.168.250.84', '192.168.250.84', '192.168.250.84'),
(78, 'Grp_HOST_FR_Client_Radius', '192.168.31.10', '192.168.31.10', '192.168.31.10'),
(79, 'Grp_HOST_FR_Client_Radius', '192.168.31.12', '192.168.31.12', '192.168.31.12'),
(80, 'Grp_HOST_FR_Client_Radius', '192.168.31.13', '192.168.31.13', '192.168.31.13'),
(81, 'Grp_HOST_FR_Client_Radius', '192.168.31.14', '192.168.31.14', '192.168.31.14'),
(82, 'Grp_HOST_FR_Client_Radius', '192.168.31.15', '192.168.31.15', '192.168.31.15'),
(83, 'Grp_HOST_FR_Client_Radius', '192.168.31.16', '192.168.31.16', '192.168.31.16'),
(84, 'Grp_HOST_FR_Client_Radius', '192.168.31.17', '192.168.31.17', '192.168.31.17'),
(85, 'Grp_HOST_FR_Client_Radius', '192.168.31.18', '192.168.31.18', '192.168.31.18'),
(86, 'Grp_HOST_FR_Client_Radius', '192.168.31.19', '192.168.31.19', '192.168.31.19'),
(87, 'Grp_HOST_FR_Client_Radius', '192.168.31.24', '192.168.31.24', '192.168.31.24'),
(88, 'Grp_HOST_FR_Client_Radius', '192.168.31.25', '192.168.31.25', '192.168.31.25'),
(89, 'Grp_HOST_FR_Client_Radius', '192.168.31.4', '192.168.31.4', '192.168.31.4'),
(90, 'Grp_HOST_FR_Client_Radius', '192.168.31.5', '192.168.31.5', '192.168.31.5'),
(91, 'Grp_HOST_FR_Client_Radius', '192.168.31.6', '192.168.31.6', '192.168.31.6'),
(92, 'Grp_HOST_FR_Client_Radius', '192.168.31.8', '192.168.31.8', '192.168.31.8'),
(93, 'Grp_HOST_FR_Client_Radius', '192.168.39.15', '192.168.39.15', '192.168.39.15'),
(94, 'Grp_HOST_FR_Client_Radius', '192.168.39.16', '192.168.39.16', '192.168.39.16'),
(95, 'Grp_HOST_FR_Client_Radius', '192.168.39.17', '192.168.39.17', '192.168.39.17'),
(96, 'Grp_HOST_FR_Client_Radius', '192.168.39.18', '192.168.39.18', '192.168.39.18'),
(97, 'Grp_HOST_FR_Client_Radius', '192.168.39.4', '192.168.39.4', '192.168.39.4'),
(98, 'Grp_HOST_FR_Client_Radius', '192.168.39.40', '192.168.39.40', '192.168.39.40'),
(99, 'Grp_HOST_FR_Client_Radius', '192.168.39.5', '192.168.39.5', '192.168.39.5'),
(100, 'Grp_HOST_FR_Client_Radius', '192.168.39.6', '192.168.39.6', '192.168.39.6'),
(101, 'Grp_HOST_FR_Client_Radius', '192.168.39.8', '192.168.39.8', '192.168.39.8'),
(102, 'Grp_HOST_FR_Client_Radius', '192.168.7.4', '192.168.7.4', '192.168.7.4'),
(103, 'Grp_HOST_FR_Client_Radius', '192.168.7.5', '192.168.7.5', '192.168.7.5'),
(104, 'Grp_HOST_FR_Client_Radius', '192.168.7.7', '192.168.7.7', '192.168.7.7'),
(105, 'Grp_HOST_FR_Client_Radius', '192.168.7.8', '192.168.7.8', '192.168.7.8'),
(106, 'Grp_NET_FR_Guest', '192.168.32.128/27', '192.168.32.129', '192.168.32.158'),
(107, 'Grp_NET_FR_Guest', '192.168.27.96/27', '192.168.27.97', '192.168.27.126'),
(108, 'Grp_NET_FR_Guest', '192.168.17.0/27', '192.168.17.1', '192.168.17.30'),
(109, 'Grp_NET_FR_Guest', '172.16.41.0/27', '172.16.41.1', '172.16.41.30'),
(110, 'Grp_HOST_FR_Server_Print', '192.168.23.235', '192.168.23.235', '192.168.23.235'),
(111, 'Grp_HOST_FR_Server_Print', '192.168.31.230', '192.168.31.230', '192.168.31.230'),
(112, 'Grp_HOST_FR_Server_Print', '192.168.39.229', '192.168.39.229', '192.168.39.229'),
(113, 'Grp_HOST_FR_Monitoring', '192.168.0.41', '192.168.0.41', '192.168.0.41'),
(114, 'Grp_HOST_FR_Server_AntiVirus', '192.168.31.225', '192.168.31.225', '192.168.31.225'),
(115, 'Grp_NET_FR_All', '10.1.0.0/16', '10.1.0.1', '10.1.255.254'),
(116, 'Grp_NET_FR_All', '172.16.40.0/21', '172.16.40.1', '172.16.47.254'),
(117, 'Grp_NET_FR_All', '172.16.144.0/21', '172.16.144.1', '172.16.151.254'),
(118, 'Grp_NET_FR_All', '172.16.255.0/24', '172.16.255.1', '172.16.255.254'),
(119, 'Grp_NET_FR_All', '192.168.0.0/21', '192.168.0.1', '192.168.7.254'),
(120, 'Grp_NET_FR_All', '192.168.16.0/21', '192.168.16.1', '192.168.23.254'),
(121, 'Grp_NET_FR_All', '192.168.24.0/21', '192.168.24.1', '192.168.31.254'),
(122, 'Grp_NET_FR_All', '192.168.32.0/21', '192.168.32.1', '192.168.39.254'),
(123, 'Grp_NET_FR_All', '192.168.136.0/21', '192.168.136.1', '192.168.143.254'),
(124, 'Grp_NET_FR_All', '192.168.128.0/21', '192.168.128.1', '192.168.135.254'),
(125, 'Grp_NET_FR_All', '192.168.144.0/24', '192.168.144.1', '192.168.144.254'),
(126, 'Grp_NET_FR_All', '192.168.151.0/24', '192.168.151.1', '192.168.151.254'),
(127, 'Grp_NET_FR_All', '192.168.152.0/24', '192.168.152.1', '192.168.152.254'),
(128, 'Grp_NET_FR_All', '192.168.200.0/24', '192.168.200.1', '192.168.200.254'),
(130, 'Grp_NET_FR_Print', '192.168.32.160/27', '192.168.32.161', '192.168.32.190'),
(131, 'Grp_NET_FR_Print', '192.168.26.128/25', '192.168.26.129', '192.168.26.254'),
(132, 'Grp_NET_FR_Print', '192.168.17.64/27', '192.168.17.65', '192.168.17.94'),
(133, 'Grp_NET_FR_Print', '192.168.17.128/26', '192.168.17.129', '192.168.17.190'),
(134, 'Grp_NET_FR_Print', '192.168.17.192/26', '192.168.17.193', '192.168.17.254'),
(135, 'Grp_NET_FR_Print', '172.16.44.0/24', '172.16.44.1', '172.16.44.254'),
(136, 'Grp_HOST_FR_Inventory', '192.168.23.205', '192.168.23.205', '192.168.23.205'),
(137, 'Grp_HOST_FR_Inventory', '192.168.23.220', '192.168.23.220', '192.168.23.220'),
(138, 'Grp_HOST_FR_Server_Share', '192.168.39.140', '192.168.39.140', '192.168.39.140'),
(139, 'Grp_HOST_FR_Server_Share', '192.168.152.35', '192.168.152.35', '192.168.152.35'),
(140, 'Grp_HOST_FR_Server_Share', '192.168.39.142', '192.168.39.142', '192.168.39.142'),
(141, 'Grp_HOST_FR_Server_Share', '192.168.23.214', '192.168.23.214', '192.168.23.214');

-- --------------------------------------------------------

--
-- Structure de la table `fwRule`
--

CREATE TABLE IF NOT EXISTS `fwRule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Source` varchar(255) DEFAULT NULL,
  `Destination` varchar(255) DEFAULT NULL,
  `Service` varchar(255) DEFAULT NULL,
  `Policy` varchar(255) NOT NULL DEFAULT 'accept',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Contenu de la table `fwRule`
--

INSERT INTO `fwRule` (`id`, `Source`, `Destination`, `Service`, `Policy`) VALUES
(1, 'Grp_NET_FR_Guest', '!Grp_NET_ALL_RFC1918', 'Grp_NET_FR_Guest_Srvc', 'accept'),
(2, 'Grp_NET_FR_Guest', 'any', 'any', 'drop'),
(7, 'Grp_HOST_FR_Client_Radius', 'Grp_HOST_FR_Server_Radius', 'Grp_Radius', 'accept'),
(8, 'Grp_NET_ALL_RFC1918', 'Grp_HOST_FR_Server_Infra', 'Grp_Windows_AD', 'accept'),
(9, 'Grp_NET_ALL_RFC1918', 'Grp_HOST_FR_Server_Infra', 'Grp_UDP67_DHCP_Req', 'accept'),
(10, 'Grp_NET_FR_All', 'Grp_HOST_FR_Server_Print', 'Grp_Windows_Share_Access', 'accept'),
(11, 'Grp_NET_FR_All', 'Grp_HOST_FR_Monitoring', 'Grp_Monitoring_Client_Server', 'accept'),
(12, 'Grp_NET_FR_All', 'Grp_HOST_FR_Server_AntiVirus', 'Grp_Kaspersky', 'accept'),
(13, 'Grp_NET_ALL_RFC1918', 'any', 'Grp_ICMP', 'accept'),
(14, 'Grp_HOST_FR_Server_Infra', 'Grp_HOST_FR_Server_Infra', 'Grp_SMTP_TCP25', 'accept'),
(15, 'Grp_HOST_FR_Server_DHCP', 'Grp_HOST_FR_Server_DHCP', 'Grp_DHCPFAILOVER_TCP647', 'accept'),
(16, 'Grp_HOST_FR_Server_Print', 'Grp_NET_FR_Print', 'Grp_Print', 'accept'),
(17, 'Grp_HOST_FR_Inventory', 'Grp_NET_ALL_RFC1918', 'Grp_Inventory_Server_Client', 'accept'),
(18, 'Grp_HOST_FR_Monitoring', 'any', 'Grp_Monitoring_Server_Client', 'accept'),
(19, 'Grp_HOST_FR_Server_Share', 'Grp_HOST_FR_Server_Share', 'Grp_Windows_Share_Replication', 'accept');

-- --------------------------------------------------------

--
-- Structure de la table `fwService`
--

CREATE TABLE IF NOT EXISTS `fwService` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `srvcName` varchar(255) DEFAULT NULL,
  `protocol` varchar(255) DEFAULT NULL,
  `port_b` int(11) DEFAULT NULL,
  `port_e` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=90 ;

--
-- Contenu de la table `fwService`
--

INSERT INTO `fwService` (`id`, `srvcName`, `protocol`, `port_b`, `port_e`) VALUES
(1, 'Grp_IRC', 'tcp', 6660, 6670),
(2, 'Grp_IRC', 'tcp', 6697, 6697),
(3, 'Grp_IRC', 'tcp', 7000, 7000),
(4, 'Grp_IRC', 'tcp', 7070, 7070),
(17, 'Grp_Monitoring_Server_Client', 'tcp', 21, 21),
(18, 'Grp_Monitoring_Server_Client', 'tcp', 22, 22),
(19, 'Grp_Monitoring_Server_Client', 'tcp', 25, 25),
(20, 'Grp_Monitoring_Server_Client', 'tcp', 80, 80),
(21, 'Grp_Monitoring_Server_Client', 'tcp', 443, 443),
(22, 'Grp_Monitoring_Server_Client', 'tcp', 8080, 8080),
(23, 'Grp_Monitoring_Server_Client', 'tcp', 10050, 10050),
(24, 'Grp_Monitoring_Server_Client', 'tcp', 10051, 10051),
(25, 'Grp_Monitoring_Server_Client', 'udp', 123, 123),
(26, 'Grp_Monitoring_Server_Client', 'udp', 161, 161),
(27, 'Grp_Windows_AD', 'tcp', 53, 53),
(28, 'Grp_Windows_AD', 'tcp', 88, 88),
(29, 'Grp_Windows_AD', 'tcp', 135, 135),
(30, 'Grp_Windows_AD', 'tcp', 389, 389),
(31, 'Grp_Windows_AD', 'tcp', 445, 445),
(32, 'Grp_Windows_AD', 'tcp', 636, 636),
(33, 'Grp_Windows_AD', 'tcp', 1024, 65535),
(34, 'Grp_Windows_AD', 'udp', 53, 53),
(35, 'Grp_Windows_AD', 'udp', 88, 88),
(36, 'Grp_Windows_AD', 'udp', 123, 123),
(38, 'Grp_Windows_AD', 'udp', 137, 137),
(39, 'Grp_Windows_AD', 'udp', 138, 138),
(40, 'Grp_Windows_AD', 'udp', 389, 389),
(41, 'Grp_Windows_AD', 'udp', 445, 445),
(42, 'Grp_Radius', 'udp', 1812, 1813),
(44, 'Grp_NET_FR_Guest_Srvc', 'tcp', 25, 25),
(45, 'Grp_NET_FR_Guest_Srvc', 'tcp', 80, 80),
(46, 'Grp_NET_FR_Guest_Srvc', 'tcp', 110, 110),
(47, 'Grp_NET_FR_Guest_Srvc', 'tcp', 143, 143),
(48, 'Grp_NET_FR_Guest_Srvc', 'tcp', 443, 443),
(50, 'Grp_NET_FR_Guest_Srvc', 'tcp', 587, 587),
(51, 'Grp_NET_FR_Guest_Srvc', 'tcp', 993, 993),
(52, 'Grp_NET_FR_Guest_Srvc', 'tcp', 995, 995),
(53, 'Grp_NET_FR_Guest_Srvc', 'udp', 53, 53),
(54, 'Grp_UDP67_DHCP_Req', 'udp', 67, 67),
(55, 'Grp_Windows_Share_Access', 'tcp', 135, 135),
(56, 'Grp_Windows_Share_Access', 'tcp', 445, 445),
(57, 'Grp_Windows_Share_Access', 'udp', 137, 137),
(58, 'Grp_Windows_Share_Access', 'udp', 138, 138),
(59, 'Grp_Monitoring_Client_Server', 'tcp', 10051, 10051),
(60, 'Grp_Kaspersky', 'tcp', 13000, 13001),
(61, 'Grp_Kaspersky', 'tcp', 13292, 13292),
(62, 'Grp_Kaspersky', 'tcp', 14000, 14001),
(63, 'Grp_Kaspersky', 'udp', 13000, 13000),
(64, 'Grp_Kaspersky', 'udp', 15000, 15001),
(65, 'Grp_Kaspersky', 'tcp', 135, 135),
(66, 'Grp_Kaspersky', 'tcp', 445, 445),
(67, 'Grp_Kaspersky', 'udp', 137, 137),
(68, 'Grp_Kaspersky', 'udp', 138, 138),
(69, 'Grp_ICMP', 'icmp', 0, 0),
(70, 'Grp_SMTP_TCP25', 'tcp', 25, 25),
(71, 'Grp_DHCPFAILOVER_TCP647', 'tcp', 647, 647),
(72, 'Grp_Print', 'tcp', 9100, 9100),
(73, 'Grp_Print', 'udp', 161, 161),
(74, 'Grp_Inventory_Server_Client', 'tcp', 21, 21),
(75, 'Grp_Inventory_Server_Client', 'tcp', 22, 22),
(76, 'Grp_Inventory_Server_Client', 'tcp', 23, 23),
(77, 'Grp_Inventory_Server_Client', 'tcp', 25, 25),
(78, 'Grp_Inventory_Server_Client', 'tcp', 80, 80),
(79, 'Grp_Inventory_Server_Client', 'tcp', 139, 139),
(80, 'Grp_Inventory_Server_Client', 'tcp', 443, 443),
(81, 'Grp_Inventory_Server_Client', 'tcp', 445, 445),
(82, 'Grp_Inventory_Server_Client', 'tcp', 1024, 65535),
(83, 'Grp_Inventory_Server_Client', 'udp', 137, 138),
(84, 'Grp_Inventory_Server_Client', 'udp', 161, 161),
(85, 'Grp_Windows_Share_Replication', 'tcp', 135, 135),
(86, 'Grp_Windows_Share_Replication', 'tcp', 445, 445),
(87, 'Grp_Windows_Share_Replication', 'tcp', 1024, 65535),
(88, 'Grp_Windows_Share_Replication', 'udp', 137, 138),
(89, 'Grptest', 'tcp', 67, 67);

--
-- Structure de la table `logs`
--

CREATE TABLE IF NOT EXISTS `logs` (
  `Number` text,
  `Date` text,
  `Time` text,
  `Interface` text,
  `Origin` text,
  `Type` text,
  `Action` text,
  `Service` text,
  `SourcePort` text,
  `Source` char(15) DEFAULT NULL,
  `Destination` text,
  `Protocol` text,
  `Rule` text,
  `RuleName` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

