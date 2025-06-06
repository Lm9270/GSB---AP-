-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mer. 09 avr. 2025 à 07:21
-- Version du serveur : 8.0.30
-- Version de PHP : 8.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gsb_frais`
--

-- --------------------------------------------------------

--
-- Structure de la table `comptable`
--

CREATE TABLE `comptable` (
  `id` varchar(4) NOT NULL,
  `login` varchar(20) DEFAULT NULL,
  `mdp` varchar(20) DEFAULT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `prenom` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `comptable`
--

INSERT INTO `comptable` (`id`, `login`, `mdp`, `nom`, `prenom`) VALUES
('TEST', 'comptable1', 'comptable1', 'Dupont', 'Jean');

-- --------------------------------------------------------

--
-- Structure de la table `etat`
--

CREATE TABLE `etat` (
  `id` char(2) NOT NULL,
  `libelle` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `etat`
--

INSERT INTO `etat` (`id`, `libelle`) VALUES
('CL', 'Saisie clôturée'),
('CR', 'Fiche créée, saisie en cours'),
('RB', 'Remboursée'),
('VA', 'Validée et mise en paiement');

-- --------------------------------------------------------

--
-- Structure de la table `fichefrais`
--

CREATE TABLE `fichefrais` (
  `idVisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `nbJustificatifs` int DEFAULT NULL,
  `montantValide` decimal(10,2) DEFAULT NULL,
  `dateModif` date DEFAULT NULL,
  `idEtat` char(2) DEFAULT 'CR'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `fichefrais`
--

INSERT INTO `fichefrais` (`idVisiteur`, `mois`, `nbJustificatifs`, `montantValide`, `dateModif`, `idEtat`) VALUES
('a131', '202407', 1, 4967.30, '2024-08-06', 'VA'),
('a131', '202408', 10, 0.00, '2024-08-07', 'CL'),
('a131', '202411', 0, 0.00, '2024-12-09', 'CL'),
('a131', '202412', 0, 0.00, '2025-02-26', 'CL'),
('a131', '202502', 0, 0.00, '2025-04-07', 'CL'),
('a131', '202504', 0, 0.00, '2025-04-07', 'CR'),
('a17', '202407', 1, 3682.42, '2024-08-07', 'VA'),
('a17', '202408', 5, 0.00, '2024-08-02', 'VA'),
('a17', '202411', 0, 0.00, '2024-11-04', 'CR'),
('a55', '202407', 3, 3160.09, '2024-08-01', 'VA'),
('a55', '202408', 11, 0.00, '2024-08-04', 'VA'),
('a93', '202407', 4, 3399.84, '2024-08-02', 'VA'),
('a93', '202408', 5, 0.00, '2024-08-04', 'VA'),
('b13', '202407', 0, 2147.40, '2024-08-06', 'VA'),
('b13', '202408', 9, 0.00, '2024-08-01', 'VA'),
('b16', '202407', 12, 3247.04, '2024-08-02', 'VA'),
('b16', '202408', 7, 0.00, '2024-08-04', 'CL'),
('b16', '202409', 0, 0.00, '2024-10-08', 'CR'),
('b19', '202407', 5, 2461.33, '2024-08-05', 'VA'),
('b19', '202408', 4, 0.00, '2024-08-03', 'CL'),
('b25', '202407', 9, 5164.22, '2024-08-04', 'VA'),
('b25', '202408', 2, 0.00, '2024-08-04', 'CL'),
('b28', '202407', 11, 2566.29, '2024-08-05', 'VA'),
('b28', '202408', 9, 0.00, '2024-08-03', 'CL'),
('b34', '202407', 11, 2044.48, '2024-08-06', 'VA'),
('b34', '202408', 1, 0.00, '2024-08-03', 'VA'),
('b4', '202407', 3, 2997.88, '2024-08-01', 'VA'),
('b4', '202408', 9, 0.00, '2024-08-04', 'CL'),
('b50', '202407', 9, 2055.86, '2024-08-05', 'VA'),
('b50', '202408', 0, 0.00, '2024-08-05', 'VA'),
('b59', '202407', 6, 5985.77, '2024-08-03', 'VA'),
('b59', '202408', 10, 0.00, '2024-08-04', 'CL'),
('c14', '202407', 4, 5242.00, '2024-08-05', 'VA'),
('c14', '202408', 9, 0.00, '2024-08-04', 'VA'),
('c3', '202407', 3, 3267.80, '2024-08-03', 'VA'),
('c3', '202408', 5, 0.00, '2024-08-03', 'CL'),
('c54', '202407', 8, 2948.84, '2024-08-04', 'VA'),
('c54', '202408', 9, 0.00, '2024-08-02', 'CL'),
('d13', '202407', 1, 3371.62, '2024-08-07', 'VA'),
('d13', '202408', 6, 0.00, '2024-08-08', 'CL'),
('d51', '202407', 9, 2140.48, '2024-08-03', 'VA'),
('d51', '202408', 4, 0.00, '2024-08-03', 'VA'),
('d51', '202411', 0, 0.00, '2024-11-04', 'CR'),
('e22', '202407', 9, 2602.19, '2024-08-05', 'VA'),
('e22', '202408', 10, 0.00, '2024-08-06', 'VA'),
('e22', '202409', 0, 0.00, '2024-10-30', 'CR'),
('e24', '202407', 0, 2123.86, '2024-08-04', 'VA'),
('e24', '202408', 2, 0.00, '2024-08-04', 'CL'),
('e39', '202407', 12, 3697.64, '2024-08-07', 'VA'),
('e39', '202408', 10, 0.00, '2024-08-06', 'CL'),
('e49', '202407', 10, 1969.74, '2024-08-05', 'VA'),
('e49', '202408', 12, 0.00, '2024-08-02', 'CL'),
('e5', '202407', 10, 4201.31, '2024-08-07', 'VA'),
('e5', '202408', 11, 0.00, '2024-08-03', 'CL'),
('e52', '202407', 0, 2425.05, '2024-08-01', 'VA'),
('e52', '202408', 5, 0.00, '2024-08-01', 'CL'),
('f21', '202407', 2, 4286.34, '2024-08-02', 'VA'),
('f21', '202408', 3, 0.00, '2024-08-03', 'CL'),
('f39', '202407', 10, 2777.98, '2024-08-07', 'VA'),
('f39', '202408', 4, 0.00, '2024-08-08', 'CL'),
('f4', '202407', 3, 3651.70, '2024-08-01', 'VA'),
('f4', '202408', 11, 5636.90, '2024-08-06', 'VA');

-- --------------------------------------------------------

--
-- Structure de la table `fraisforfait`
--

CREATE TABLE `fraisforfait` (
  `id` char(3) NOT NULL,
  `libelle` char(20) DEFAULT NULL,
  `montant` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `fraisforfait`
--

INSERT INTO `fraisforfait` (`id`, `libelle`, `montant`) VALUES
('ETP', 'Forfait Etape', 110.00),
('KM', 'Frais Kilométrique', 0.62),
('NUI', 'Nuitée Hôtel', 80.00),
('REP', 'Repas Restaurant', 25.00);

-- --------------------------------------------------------

--
-- Structure de la table `lignefraisforfait`
--

CREATE TABLE `lignefraisforfait` (
  `idVisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `idFraisForfait` char(3) NOT NULL,
  `quantite` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `lignefraisforfait`
--

INSERT INTO `lignefraisforfait` (`idVisiteur`, `mois`, `idFraisForfait`, `quantite`) VALUES
('a131', '202407', 'ETP', 20),
('a131', '202407', 'KM', 515),
('a131', '202407', 'NUI', 7),
('a131', '202407', 'REP', 8),
('a131', '202408', 'ETP', 0),
('a131', '202408', 'KM', 20),
('a131', '202408', 'NUI', 9),
('a131', '202408', 'REP', 0),
('a131', '202411', 'ETP', 0),
('a131', '202411', 'KM', 0),
('a131', '202411', 'NUI', 0),
('a131', '202411', 'REP', 0),
('a131', '202412', 'ETP', 0),
('a131', '202412', 'KM', 0),
('a131', '202412', 'NUI', 0),
('a131', '202412', 'REP', 0),
('a131', '202502', 'ETP', 0),
('a131', '202502', 'KM', 20),
('a131', '202502', 'NUI', 0),
('a131', '202502', 'REP', 0),
('a131', '202504', 'ETP', 0),
('a131', '202504', 'KM', 0),
('a131', '202504', 'NUI', 0),
('a131', '202504', 'REP', 0),
('a17', '202407', 'ETP', 12),
('a17', '202407', 'KM', 641),
('a17', '202407', 'NUI', 15),
('a17', '202407', 'REP', 18),
('a17', '202408', 'ETP', 102),
('a17', '202408', 'KM', 459),
('a17', '202408', 'NUI', 20),
('a17', '202408', 'REP', 4),
('a17', '202411', 'ETP', 0),
('a17', '202411', 'KM', 0),
('a17', '202411', 'NUI', 0),
('a17', '202411', 'REP', 0),
('a55', '202407', 'ETP', 9),
('a55', '202407', 'KM', 911),
('a55', '202407', 'NUI', 10),
('a55', '202407', 'REP', 19),
('a55', '202408', 'ETP', 10),
('a55', '202408', 'KM', 303),
('a55', '202408', 'NUI', 15),
('a55', '202408', 'REP', 11),
('a93', '202407', 'ETP', 7),
('a93', '202407', 'KM', 480),
('a93', '202407', 'NUI', 16),
('a93', '202407', 'REP', 4),
('a93', '202408', 'ETP', 200),
('a93', '202408', 'KM', 496),
('a93', '202408', 'NUI', 8),
('a93', '202408', 'REP', 6),
('b13', '202407', 'ETP', 3),
('b13', '202407', 'KM', 519),
('b13', '202407', 'NUI', 13),
('b13', '202407', 'REP', 4),
('b13', '202408', 'ETP', 100),
('b13', '202408', 'KM', 684),
('b13', '202408', 'NUI', 20),
('b13', '202408', 'REP', 6),
('b16', '202407', 'ETP', 10),
('b16', '202407', 'KM', 628),
('b16', '202407', 'NUI', 17),
('b16', '202407', 'REP', 15),
('b16', '202408', 'ETP', 4),
('b16', '202408', 'KM', 785),
('b16', '202408', 'NUI', 14),
('b16', '202408', 'REP', 2),
('b19', '202407', 'ETP', 7),
('b19', '202407', 'KM', 783),
('b19', '202407', 'NUI', 18),
('b19', '202407', 'REP', 2),
('b19', '202408', 'ETP', 19),
('b19', '202408', 'KM', 820),
('b19', '202408', 'NUI', 15),
('b19', '202408', 'REP', 8),
('b25', '202407', 'ETP', 20),
('b25', '202407', 'KM', 887),
('b25', '202407', 'NUI', 15),
('b25', '202407', 'REP', 3),
('b25', '202408', 'ETP', 14),
('b25', '202408', 'KM', 706),
('b25', '202408', 'NUI', 14),
('b25', '202408', 'REP', 14),
('b28', '202407', 'ETP', 5),
('b28', '202407', 'KM', 651),
('b28', '202407', 'NUI', 11),
('b28', '202407', 'REP', 3),
('b28', '202408', 'ETP', 7),
('b28', '202408', 'KM', 778),
('b28', '202408', 'NUI', 13),
('b28', '202408', 'REP', 17),
('b34', '202407', 'ETP', 13),
('b34', '202407', 'KM', 415),
('b34', '202407', 'NUI', 4),
('b34', '202407', 'REP', 13),
('b34', '202408', 'ETP', 16),
('b34', '202408', 'KM', 587),
('b34', '202408', 'NUI', 6),
('b34', '202408', 'REP', 12),
('b4', '202407', 'ETP', 4),
('b4', '202407', 'KM', 518),
('b4', '202407', 'NUI', 6),
('b4', '202407', 'REP', 12),
('b4', '202408', 'ETP', 8),
('b4', '202408', 'KM', 550),
('b4', '202408', 'NUI', 18),
('b4', '202408', 'REP', 5),
('b50', '202407', 'ETP', 2),
('b50', '202407', 'KM', 680),
('b50', '202407', 'NUI', 2),
('b50', '202407', 'REP', 14),
('b50', '202408', 'ETP', 2),
('b50', '202408', 'KM', 967),
('b50', '202408', 'NUI', 5),
('b50', '202408', 'REP', 2),
('b59', '202407', 'ETP', 16),
('b59', '202407', 'KM', 682),
('b59', '202407', 'NUI', 19),
('b59', '202407', 'REP', 10),
('b59', '202408', 'ETP', 19),
('b59', '202408', 'KM', 349),
('b59', '202408', 'NUI', 17),
('b59', '202408', 'REP', 10),
('c14', '202407', 'ETP', 13),
('c14', '202407', 'KM', 580),
('c14', '202407', 'NUI', 7),
('c14', '202407', 'REP', 14),
('c14', '202408', 'ETP', 6),
('c14', '202408', 'KM', 715),
('c14', '202408', 'NUI', 11),
('c14', '202408', 'REP', 8),
('c3', '202407', 'ETP', 12),
('c3', '202407', 'KM', 399),
('c3', '202407', 'NUI', 7),
('c3', '202407', 'REP', 11),
('c3', '202408', 'ETP', 15),
('c3', '202408', 'KM', 449),
('c3', '202408', 'NUI', 14),
('c3', '202408', 'REP', 3),
('c54', '202407', 'ETP', 17),
('c54', '202407', 'KM', 708),
('c54', '202407', 'NUI', 2),
('c54', '202407', 'REP', 6),
('c54', '202408', 'ETP', 4),
('c54', '202408', 'KM', 354),
('c54', '202408', 'NUI', 4),
('c54', '202408', 'REP', 9),
('d13', '202407', 'ETP', 12),
('d13', '202407', 'KM', 820),
('d13', '202407', 'NUI', 16),
('d13', '202407', 'REP', 15),
('d13', '202408', 'ETP', 14),
('d13', '202408', 'KM', 884),
('d13', '202408', 'NUI', 13),
('d13', '202408', 'REP', 10),
('d51', '202407', 'ETP', 5),
('d51', '202407', 'KM', 680),
('d51', '202407', 'NUI', 4),
('d51', '202407', 'REP', 9),
('d51', '202408', 'ETP', 4),
('d51', '202408', 'KM', 919),
('d51', '202408', 'NUI', 7),
('d51', '202408', 'REP', 8),
('d51', '202411', 'ETP', 0),
('d51', '202411', 'KM', 0),
('d51', '202411', 'NUI', 0),
('d51', '202411', 'REP', 0),
('e22', '202407', 'ETP', 5),
('e22', '202407', 'KM', 865),
('e22', '202407', 'NUI', 9),
('e22', '202407', 'REP', 20),
('e22', '202408', 'ETP', 12),
('e22', '202408', 'KM', 751),
('e22', '202408', 'NUI', 9),
('e22', '202408', 'REP', 14),
('e24', '202407', 'ETP', 8),
('e24', '202407', 'KM', 360),
('e24', '202407', 'NUI', 3),
('e24', '202407', 'REP', 7),
('e24', '202408', 'ETP', 6),
('e24', '202408', 'KM', 740),
('e24', '202408', 'NUI', 16),
('e24', '202408', 'REP', 8),
('e39', '202407', 'ETP', 6),
('e39', '202407', 'KM', 868),
('e39', '202407', 'NUI', 18),
('e39', '202407', 'REP', 13),
('e39', '202408', 'ETP', 20),
('e39', '202408', 'KM', 310),
('e39', '202408', 'NUI', 14),
('e39', '202408', 'REP', 19),
('e49', '202407', 'ETP', 5),
('e49', '202407', 'KM', 371),
('e49', '202407', 'NUI', 2),
('e49', '202407', 'REP', 12),
('e49', '202408', 'ETP', 3),
('e49', '202408', 'KM', 681),
('e49', '202408', 'NUI', 7),
('e49', '202408', 'REP', 9),
('e5', '202407', 'ETP', 20),
('e5', '202407', 'KM', 938),
('e5', '202407', 'NUI', 8),
('e5', '202407', 'REP', 14),
('e5', '202408', 'ETP', 8),
('e5', '202408', 'KM', 659),
('e5', '202408', 'NUI', 4),
('e5', '202408', 'REP', 8),
('e52', '202407', 'ETP', 6),
('e52', '202407', 'KM', 1000),
('e52', '202407', 'NUI', 7),
('e52', '202407', 'REP', 11),
('e52', '202408', 'ETP', 13),
('e52', '202408', 'KM', 693),
('e52', '202408', 'NUI', 3),
('e52', '202408', 'REP', 17),
('f21', '202407', 'ETP', 13),
('f21', '202407', 'KM', 769),
('f21', '202407', 'NUI', 19),
('f21', '202407', 'REP', 16),
('f21', '202408', 'ETP', 7),
('f21', '202408', 'KM', 505),
('f21', '202408', 'NUI', 14),
('f21', '202408', 'REP', 6),
('f39', '202407', 'ETP', 7),
('f39', '202407', 'KM', 640),
('f39', '202407', 'NUI', 10),
('f39', '202407', 'REP', 17),
('f39', '202408', 'ETP', 20),
('f39', '202408', 'KM', 326),
('f39', '202408', 'NUI', 17),
('f39', '202408', 'REP', 11),
('f4', '202407', 'ETP', 6),
('f4', '202407', 'KM', 893),
('f4', '202407', 'NUI', 9),
('f4', '202407', 'REP', 19),
('f4', '202408', 'ETP', 18),
('f4', '202408', 'KM', 745),
('f4', '202408', 'NUI', 13),
('f4', '202408', 'REP', 7);

-- --------------------------------------------------------

--
-- Structure de la table `lignefraishorsforfait`
--

CREATE TABLE `lignefraishorsforfait` (
  `id` int NOT NULL,
  `idVisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `libelle` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `montant` decimal(10,2) DEFAULT NULL,
  `refuse` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `lignefraishorsforfait`
--

INSERT INTO `lignefraishorsforfait` (`id`, `idVisiteur`, `mois`, `libelle`, `date`, `montant`, `refuse`) VALUES
(1, 'a131', '202407', 'Repas avec praticien', '2024-07-26', 43.00, NULL),
(2, 'a131', '202407', 'Rémunération intervenant/spécialiste', '2024-07-15', 528.00, NULL),
(3, 'a131', '202407', 'Achat de matériel de papèterie', '2024-07-13', 12.00, NULL),
(4, 'a131', '202407', 'Rémunération intervenant/spécialiste', '2024-07-10', 635.00, NULL),
(5, 'a131', '202407', 'Location véhicule', '2024-07-11', 406.00, NULL),
(6, 'a131', '202407', 'Achat espace publicitaire', '2024-07-14', 64.00, NULL),
(7, 'a131', '202408', 'Voyage SNCF', '2024-08-12', 133.00, NULL),
(8, 'a131', '202408', 'Repas avec praticien', '2024-08-22', 32.00, NULL),
(9, 'a131', '202408', 'Rémunération intervenant/spécialiste', '2024-08-08', 897.00, NULL),
(10, 'a131', '202408', 'Achat de matériel de papèterie', '2024-08-11', 44.00, NULL),
(11, 'a131', '202408', 'Taxi', '2024-08-20', 42.00, NULL),
(12, 'a131', '202408', 'Location salle conférence', '2024-08-26', 399.00, NULL),
(13, 'a17', '202407', 'Location véhicule', '2024-07-10', 242.00, NULL),
(14, 'a17', '202407', 'Frais vestimentaire/représentation', '2024-07-24', 73.00, NULL),
(15, 'a17', '202408', 'Location salle conférence', '2024-08-20', 420.00, NULL),
(16, 'a17', '202408', 'Location équipement vidéo/sonore', '2024-08-13', 468.00, NULL),
(17, 'a17', '202408', 'Voyage SNCF', '2024-08-19', 53.00, NULL),
(18, 'a17', '202408', 'Repas avec praticien', '2024-08-12', 45.00, NULL),
(19, 'a17', '202408', 'Location véhicule', '2024-08-28', 354.00, NULL),
(20, 'a17', '202408', 'Repas avec praticien', '2024-08-08', 46.00, NULL),
(21, 'a55', '202407', 'Location salle conférence', '2024-07-02', 211.00, NULL),
(22, 'a55', '202407', 'Achat espace publicitaire', '2024-07-11', 70.00, NULL),
(23, 'a55', '202407', 'Voyage SNCF', '2024-07-12', 116.00, NULL),
(24, 'a55', '202407', 'Repas avec praticien', '2024-07-16', 31.00, NULL),
(25, 'a55', '202408', 'Frais vestimentaire/représentation', '2024-08-06', 160.00, NULL),
(26, 'a55', '202408', 'Repas avec praticien', '2024-08-08', 41.00, NULL),
(27, 'a55', '202408', 'Repas avec praticien', '2024-08-11', 39.00, NULL),
(28, 'a93', '202407', 'Achat de matériel de papèterie', '2024-07-22', 23.00, NULL),
(29, 'a93', '202407', 'Location véhicule', '2024-07-19', 180.00, NULL),
(30, 'a93', '202407', 'Achat de matériel de papèterie', '2024-07-08', 26.00, NULL),
(31, 'a93', '202407', 'Location équipement vidéo/sonore', '2024-07-20', 714.00, NULL),
(32, 'a93', '202407', 'Frais vestimentaire/représentation', '2024-07-26', 387.00, NULL),
(33, 'a93', '202408', 'Location véhicule', '2024-08-28', 257.00, NULL),
(34, 'b13', '202407', 'Achat de matériel de papèterie', '2024-07-21', 26.00, NULL),
(35, 'b13', '202407', 'Frais vestimentaire/représentation', '2024-07-19', 373.00, NULL),
(36, 'b13', '202407', 'Traiteur, alimentation, boisson', '2024-07-04', 349.00, NULL),
(37, 'b13', '202407', 'Voyage SNCF', '2024-07-18', 50.00, NULL),
(38, 'b13', '202407', 'Achat espace publicitaire', '2024-07-09', 29.00, NULL),
(39, 'b13', '202408', 'Location salle conférence', '2024-08-17', 324.00, NULL),
(40, 'b13', '202408', 'Voyage SNCF', '2024-08-12', 66.00, NULL),
(41, 'b16', '202407', 'Traiteur, alimentation, boisson', '2024-07-07', 424.00, NULL),
(42, 'b16', '202408', '(REFUSÉ)Repas avec practicien', '2024-08-14', 94.00, 1),
(43, 'b16', '202408', '(REFUSÉ) Repas avec praticien', '2024-08-16', 44.00, 1),
(44, 'b16', '202409', 'Repas avec praticien', '2024-08-07', 50.00, NULL),
(45, 'b19', '202407', 'Achat espace publicitaire', '2024-07-26', 125.00, NULL),
(46, 'b19', '202407', 'Achat de matériel de papèterie', '2024-07-25', 20.00, NULL),
(47, 'b19', '202407', 'Achat de matériel de papèterie', '2024-07-23', 32.00, NULL),
(48, 'b19', '202407', 'Repas avec praticien', '2024-07-24', 43.00, NULL),
(49, 'b19', '202408', ' (REFUSÉ) Location salle conférence', '2024-08-09', 273.00, 1),
(50, 'b19', '202408', ' (REFUSÉ) Location salle conférence', '2024-08-03', 566.00, 1),
(51, 'b19', '202408', 'Repas avec praticien', '2024-08-16', 38.00, NULL),
(52, 'b19', '202408', 'Achat de matériel de papèterie', '2024-08-16', 46.00, NULL),
(53, 'b25', '202407', 'Repas avec praticien', '2024-07-05', 45.00, NULL),
(54, 'b25', '202407', 'Rémunération intervenant/spécialiste', '2024-07-07', 1127.00, NULL),
(55, 'b25', '202407', 'Taxi', '2024-07-15', 78.00, NULL),
(56, 'b25', '202407', 'Repas avec praticien', '2024-07-11', 49.00, NULL),
(57, 'b25', '202408', 'Location véhicule', '2024-08-03', 393.00, NULL),
(58, 'b25', '202408', 'Frais vestimentaire/représentation', '2024-08-18', 352.00, NULL),
(59, 'b25', '202408', 'Traiteur, alimentation, boisson', '2024-08-19', 353.00, NULL),
(60, 'b25', '202408', 'Location salle conférence', '2024-08-06', 474.00, NULL),
(61, 'b28', '202407', 'Location équipement vidéo/sonore', '2024-07-08', 816.00, NULL),
(62, 'b28', '202407', 'Repas avec praticien', '2024-07-19', 47.00, NULL),
(63, 'b28', '202407', 'Traiteur, alimentation, boisson', '2024-07-09', 228.00, NULL),
(64, 'b28', '202407', 'Achat espace publicitaire', '2024-07-24', 81.00, NULL),
(65, 'b28', '202407', 'Repas avec praticien', '2024-07-08', 49.00, NULL),
(66, 'b28', '202408', 'Achat de matériel de papèterie', '2024-08-04', 39.00, NULL),
(67, 'b28', '202408', 'Taxi', '2024-08-12', 58.00, NULL),
(68, 'b28', '202408', 'Frais vestimentaire/représentation', '2024-08-22', 348.00, NULL),
(69, 'b28', '202408', 'Taxi', '2024-08-10', 20.00, NULL),
(70, 'b34', '202407', 'Repas avec praticien', '2024-07-22', 45.00, NULL),
(71, 'b34', '202408', 'Rémunération intervenant/spécialiste', '2024-08-18', 593.00, NULL),
(72, 'b34', '202408', 'Location équipement vidéo/sonore', '2024-08-23', 684.00, NULL),
(73, 'b34', '202408', 'Achat espace publicitaire', '2024-08-24', 75.00, NULL),
(74, 'b34', '202408', 'Voyage SNCF', '2024-08-22', 55.00, NULL),
(75, 'b34', '202408', 'Traiteur, alimentation, boisson', '2024-08-28', 34.00, NULL),
(76, 'b4', '202407', 'Traiteur, alimentation, boisson', '2024-07-02', 397.00, NULL),
(77, 'b4', '202407', 'Traiteur, alimentation, boisson', '2024-07-15', 374.00, NULL),
(78, 'b4', '202407', 'Location salle conférence', '2024-07-09', 193.00, NULL),
(79, 'b4', '202407', 'Location salle conférence', '2024-07-14', 375.00, NULL),
(80, 'b4', '202407', 'Taxi', '2024-07-23', 44.00, NULL),
(81, 'b4', '202407', 'Frais vestimentaire/représentation', '2024-07-16', 104.00, NULL),
(82, 'b4', '202408', 'Repas avec praticien', '2024-08-03', 34.00, NULL),
(83, 'b4', '202408', 'Achat de matériel de papèterie', '2024-08-17', 10.00, NULL),
(84, 'b50', '202407', 'Location salle conférence', '2024-07-28', 348.00, NULL),
(85, 'b50', '202407', 'Voyage SNCF', '2024-07-27', 38.00, NULL),
(86, 'b50', '202407', 'Location équipement vidéo/sonore', '2024-07-03', 369.00, NULL),
(87, 'b50', '202407', 'Traiteur, alimentation, boisson', '2024-07-26', 304.00, NULL),
(88, 'b50', '202408', 'Taxi', '2024-08-27', 68.00, NULL),
(89, 'b50', '202408', 'Achat espace publicitaire', '2024-08-19', 50.00, NULL),
(90, 'b50', '202408', 'Traiteur, alimentation, boisson', '2024-08-25', 432.00, NULL),
(91, 'b50', '202408', 'Rémunération intervenant/spécialiste', '2024-08-25', 909.00, NULL),
(92, 'b59', '202407', 'Traiteur, alimentation, boisson', '2024-07-07', 366.00, NULL),
(93, 'b59', '202407', 'Voyage SNCF', '2024-07-14', 74.00, NULL),
(94, 'b59', '202407', 'Location salle conférence', '2024-07-07', 411.00, NULL),
(95, 'b59', '202407', 'Traiteur, alimentation, boisson', '2024-07-18', 311.00, NULL),
(96, 'b59', '202407', 'Taxi', '2024-07-14', 64.00, NULL),
(97, 'b59', '202407', 'Rémunération intervenant/spécialiste', '2024-07-14', 1189.00, NULL),
(98, 'b59', '202408', 'Achat de matériel de papèterie', '2024-08-22', 41.00, NULL),
(99, 'b59', '202408', 'Taxi', '2024-08-07', 55.00, NULL),
(100, 'b59', '202408', 'Repas avec praticien', '2024-08-15', 46.00, NULL),
(101, 'c14', '202407', 'Rémunération intervenant/spécialiste', '2024-07-24', 1029.00, NULL),
(102, 'c14', '202407', 'Location équipement vidéo/sonore', '2024-07-04', 784.00, NULL),
(103, 'c14', '202407', 'Voyage SNCF', '2024-07-28', 42.00, NULL),
(104, 'c14', '202407', 'Traiteur, alimentation, boisson', '2024-07-25', 241.00, NULL),
(105, 'c14', '202407', 'Location équipement vidéo/sonore', '2024-07-23', 781.00, NULL),
(106, 'c14', '202408', 'Location véhicule', '2024-08-02', 197.00, NULL),
(107, 'c14', '202408', 'Taxi', '2024-08-12', 67.00, NULL),
(108, 'c14', '202408', 'Achat espace publicitaire', '2024-08-05', 25.00, NULL),
(109, 'c3', '202407', 'Frais vestimentaire/représentation', '2024-07-10', 252.00, NULL),
(110, 'c3', '202407', 'Repas avec praticien', '2024-07-10', 37.00, NULL),
(111, 'c3', '202407', 'Achat espace publicitaire', '2024-07-14', 118.00, NULL),
(112, 'c3', '202407', 'Location équipement vidéo/sonore', '2024-07-10', 480.00, NULL),
(113, 'c3', '202407', 'Achat espace publicitaire', '2024-07-18', 67.00, NULL),
(114, 'c3', '202407', 'Achat espace publicitaire', '2024-07-17', 120.00, NULL),
(115, 'c3', '202408', 'Voyage SNCF', '2024-08-25', 136.00, NULL),
(116, 'c3', '202408', 'Taxi', '2024-08-13', 48.00, NULL),
(117, 'c3', '202408', 'Achat de matériel de papèterie', '2024-08-17', 49.00, NULL),
(118, 'c3', '202408', 'Traiteur, alimentation, boisson', '2024-08-13', 287.00, NULL),
(119, 'c3', '202408', 'Voyage SNCF', '2024-08-09', 38.00, NULL),
(120, 'c54', '202407', 'Location équipement vidéo/sonore', '2024-07-12', 732.00, NULL),
(121, 'c54', '202408', 'Location équipement vidéo/sonore', '2024-08-28', 408.00, NULL),
(122, 'c54', '202408', 'Location salle conférence', '2024-08-16', 182.00, NULL),
(123, 'c54', '202408', 'Location équipement vidéo/sonore', '2024-08-28', 838.00, NULL),
(124, 'c54', '202408', 'Voyage SNCF', '2024-08-15', 149.00, NULL),
(125, 'c54', '202408', 'Traiteur, alimentation, boisson', '2024-08-25', 101.00, NULL),
(126, 'c54', '202408', 'Location équipement vidéo/sonore', '2024-08-24', 371.00, NULL),
(127, 'd13', '202407', 'Taxi', '2024-07-28', 67.00, NULL),
(128, 'd13', '202407', 'Repas avec praticien', '2024-07-13', 36.00, NULL),
(129, 'd13', '202407', 'Repas avec praticien', '2024-07-02', 39.00, NULL),
(130, 'd13', '202408', 'Voyage SNCF', '2024-08-03', 128.00, NULL),
(131, 'd13', '202408', 'Taxi', '2024-08-13', 68.00, NULL),
(132, 'd13', '202408', 'Voyage SNCF', '2024-08-03', 81.00, NULL),
(133, 'd13', '202408', 'Frais vestimentaire/représentation', '2024-08-26', 48.00, NULL),
(134, 'd13', '202408', 'Location salle conférence', '2024-08-25', 638.00, NULL),
(135, 'd51', '202407', 'Taxi', '2024-07-22', 20.00, NULL),
(136, 'd51', '202407', 'Achat de matériel de papèterie', '2024-07-22', 17.00, NULL),
(137, 'd51', '202407', 'Location équipement vidéo/sonore', '2024-07-18', 547.00, NULL),
(138, 'd51', '202407', 'Voyage SNCF', '2024-07-12', 31.00, NULL),
(139, 'd51', '202407', 'Location véhicule', '2024-07-06', 407.00, NULL),
(140, 'd51', '202407', 'Traiteur, alimentation, boisson', '2024-07-07', 137.00, NULL),
(141, 'd51', '202408', 'Achat espace publicitaire', '2024-08-07', 47.00, NULL),
(142, 'd51', '202408', 'Rémunération intervenant/spécialiste', '2024-08-08', 1013.00, NULL),
(143, 'd51', '202408', 'Traiteur, alimentation, boisson', '2024-08-03', 368.00, NULL),
(144, 'd51', '202408', 'Location salle conférence', '2024-08-06', 253.00, NULL),
(145, 'e22', '202407', 'Rémunération intervenant/spécialiste', '2024-07-24', 301.00, NULL),
(146, 'e22', '202407', 'Taxi', '2024-07-04', 48.00, NULL),
(147, 'e22', '202409', 'Repas avec praticien', '2024-08-23', 37.00, NULL),
(148, 'e24', '202407', 'Repas avec praticien', '2024-07-05', 33.00, NULL),
(149, 'e24', '202407', 'Traiteur, alimentation, boisson', '2024-07-11', 439.00, NULL),
(150, 'e24', '202407', 'Frais vestimentaire/représentation', '2024-07-19', 83.00, NULL),
(151, 'e24', '202407', 'Achat espace publicitaire', '2024-07-23', 94.00, NULL),
(152, 'e24', '202408', 'Frais vestimentaire/représentation', '2024-08-12', 284.00, NULL),
(153, 'e24', '202408', 'Location équipement vidéo/sonore', '2024-08-20', 829.00, NULL),
(154, 'e24', '202408', 'Repas avec praticien', '2024-08-04', 37.00, NULL),
(155, 'e24', '202408', 'Repas avec praticien', '2024-08-01', 38.00, NULL),
(156, 'e24', '202408', 'Traiteur, alimentation, boisson', '2024-08-22', 202.00, NULL),
(157, 'e24', '202408', 'Taxi', '2024-08-24', 61.00, NULL),
(158, 'e39', '202407', 'Achat espace publicitaire', '2024-07-09', 86.00, NULL),
(159, 'e39', '202407', 'Location équipement vidéo/sonore', '2024-07-13', 842.00, NULL),
(160, 'e39', '202407', 'Location équipement vidéo/sonore', '2024-07-21', 459.00, NULL),
(161, 'e39', '202408', 'Location équipement vidéo/sonore', '2024-08-16', 643.00, NULL),
(162, 'e49', '202407', 'Location salle conférence', '2024-07-27', 554.00, NULL),
(163, 'e49', '202407', 'Location salle conférence', '2024-07-11', 216.00, NULL),
(164, 'e49', '202407', 'Voyage SNCF', '2024-07-11', 131.00, NULL),
(165, 'e49', '202408', 'Frais vestimentaire/représentation', '2024-08-11', 36.00, NULL),
(166, 'e49', '202408', 'Repas avec praticien', '2024-08-08', 36.00, NULL),
(167, 'e49', '202408', 'Rémunération intervenant/spécialiste', '2024-08-14', 1023.00, NULL),
(168, 'e5', '202407', 'Traiteur, alimentation, boisson', '2024-07-04', 328.00, NULL),
(169, 'e5', '202407', 'Repas avec praticien', '2024-07-17', 50.00, NULL),
(170, 'e5', '202407', 'Rémunération intervenant/spécialiste', '2024-07-24', 769.00, NULL),
(171, 'e5', '202407', 'Achat espace publicitaire', '2024-07-20', 83.00, NULL),
(172, 'e5', '202408', 'Traiteur, alimentation, boisson', '2024-08-25', 108.00, NULL),
(173, 'e5', '202408', 'Achat de matériel de papèterie', '2024-08-20', 40.00, NULL),
(174, 'e5', '202408', 'Location véhicule', '2024-08-17', 417.00, NULL),
(175, 'e5', '202408', 'Frais vestimentaire/représentation', '2024-08-06', 83.00, NULL),
(176, 'e5', '202408', 'Location véhicule', '2024-08-09', 354.00, NULL),
(177, 'e52', '202407', 'Repas avec praticien', '2024-07-18', 48.00, NULL),
(178, 'e52', '202407', 'Voyage SNCF', '2024-07-14', 90.00, NULL),
(179, 'e52', '202407', 'Rémunération intervenant/spécialiste', '2024-07-04', 600.00, NULL),
(180, 'e52', '202408', 'Voyage SNCF', '2024-08-27', 50.00, NULL),
(181, 'e52', '202408', 'Rémunération intervenant/spécialiste', '2024-08-16', 278.00, NULL),
(182, 'e52', '202408', 'Frais vestimentaire/représentation', '2024-08-02', 77.00, NULL),
(183, 'e52', '202408', 'Traiteur, alimentation, boisson', '2024-08-24', 353.00, NULL),
(184, 'e52', '202408', 'Repas avec praticien', '2024-08-12', 39.00, NULL),
(185, 'e52', '202408', 'Frais vestimentaire/représentation', '2024-08-13', 272.00, NULL),
(186, 'f21', '202407', 'Repas avec praticien', '2024-07-10', 39.00, NULL),
(187, 'f21', '202407', 'Repas avec praticien', '2024-07-13', 40.00, NULL),
(188, 'f21', '202407', 'Frais vestimentaire/représentation', '2024-07-09', 290.00, NULL),
(189, 'f21', '202407', 'Rémunération intervenant/spécialiste', '2024-07-22', 907.00, NULL),
(190, 'f21', '202408', 'Repas avec praticien', '2024-08-08', 31.00, NULL),
(191, 'f21', '202408', 'Taxi', '2024-08-21', 27.00, NULL),
(192, 'f21', '202408', 'Repas avec praticien', '2024-08-16', 45.00, NULL),
(193, 'f21', '202408', 'Location salle conférence', '2024-08-25', 591.00, NULL),
(194, 'f21', '202408', 'Achat de matériel de papèterie', '2024-08-18', 10.00, NULL),
(195, 'f21', '202408', 'Rémunération intervenant/spécialiste', '2024-08-02', 548.00, NULL),
(196, 'f39', '202407', 'Taxi', '2024-07-15', 75.00, NULL),
(197, 'f39', '202407', 'Traiteur, alimentation, boisson', '2024-07-22', 434.00, NULL),
(198, 'f39', '202407', 'Frais vestimentaire/représentation', '2024-07-02', 58.00, NULL),
(199, 'f39', '202407', 'Frais vestimentaire/représentation', '2024-07-14', 198.00, NULL),
(200, 'f39', '202408', 'Achat espace publicitaire', '2024-08-14', 79.00, NULL),
(201, 'f39', '202408', 'Voyage SNCF', '2024-08-07', 86.00, NULL),
(202, 'f39', '202408', 'Achat de matériel de papèterie', '2024-08-17', 44.00, NULL),
(203, 'f4', '202407', 'Achat espace publicitaire', '2024-07-23', 97.00, NULL),
(204, 'f4', '202407', 'Location équipement vidéo/sonore', '2024-07-02', 823.00, NULL),
(205, 'f4', '202407', 'Location véhicule', '2024-07-21', 291.00, NULL),
(206, 'f4', '202407', 'Traiteur, alimentation, boisson', '2024-07-26', 150.00, NULL),
(207, 'f4', '202407', 'Achat espace publicitaire', '2024-07-28', 34.00, NULL),
(208, 'f4', '202407', 'Location salle conférence', '2024-07-05', 346.00, NULL),
(209, 'f4', '202408', 'Voyage SNCF', '2024-08-20', 39.00, NULL),
(210, 'f4', '202408', 'Location équipement vidéo/sonore', '2024-08-04', 665.00, NULL),
(211, 'f4', '202408', 'Rémunération intervenant/spécialiste', '2024-08-21', 791.00, NULL),
(212, 'f4', '202408', 'Location salle conférence', '2024-08-12', 485.00, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `visiteur`
--

CREATE TABLE `visiteur` (
  `id` char(4) NOT NULL,
  `nom` char(30) DEFAULT NULL,
  `prenom` char(30) DEFAULT NULL,
  `login` char(20) DEFAULT NULL,
  `mdp` char(20) DEFAULT NULL,
  `adresse` char(30) DEFAULT NULL,
  `cp` char(5) DEFAULT NULL,
  `ville` char(30) DEFAULT NULL,
  `dateEmbauche` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `visiteur`
--

INSERT INTO `visiteur` (`id`, `nom`, `prenom`, `login`, `mdp`, `adresse`, `cp`, `ville`, `dateEmbauche`) VALUES
('a131', 'Villechalane', 'Louis', 'lvillachane', 'jux7g', '8 rue des Charmes', '46000', 'Cahors', '2005-12-21'),
('a17', 'Andre', 'David', 'dandre', 'oppg5', '1 rue Petit', '46200', 'Lalbenque', '2016-11-23'),
('a55', 'Bedos', 'Christian', 'cbedos', 'gmhxd', '1 rue Peranud', '46250', 'Montcuq', '2017-01-12'),
('a93', 'Tusseau', 'Louis', 'ltusseau', 'ktp3s', '22 rue des Ternes', '46123', 'Gramat', '2015-05-01'),
('b13', 'Bentot', 'Pascal', 'pbentot', 'doyw1', '11 allée des Cerises', '46512', 'Bessines', '2017-07-09'),
('b16', 'Bioret', 'Luc', 'lbioret', 'hrjfs', '1 Avenue gambetta', '46000', 'Cahors', '2010-05-11'),
('b19', 'Bunisset', 'Francis', 'fbunisset', '4vbnd', '10 rue des Perles', '93100', 'Montreuil', '2009-10-21'),
('b25', 'Bunisset', 'Denise', 'dbunisset', 's1y1r', '23 rue Manin', '75019', 'paris', '2010-12-05'),
('b28', 'Cacheux', 'Bernard', 'bcacheux', 'uf7r3', '114 rue Blanche', '75017', 'Paris', '2015-11-12'),
('b34', 'Cadic', 'Eric', 'ecadic', '6u8dc', '123 avenue de la République', '75011', 'Paris', '2008-09-23'),
('b4', 'Charoze', 'Catherine', 'ccharoze', 'u817o', '100 rue Petit', '75019', 'Paris', '2005-11-12'),
('b50', 'Clepkens', 'Christophe', 'cclepkens', 'bw1us', '12 allée des Anges', '93230', 'Romainville', '2014-08-11'),
('b59', 'Cottin', 'Vincenne', 'vcottin', '2hoh9', '36 rue Des Roches', '93100', 'Monteuil', '2011-11-18'),
('c14', 'Daburon', 'François', 'fdaburon', '7oqpv', '13 rue de Chanzy', '94000', 'Créteil', '2012-02-11'),
('c3', 'De', 'Philippe', 'pde', 'gk9kx', '13 rue Barthes', '94000', 'Créteil', '2010-12-14'),
('c54', 'Debelle', 'Michel', 'mdebelle', 'od5rt', '181 avenue Barbusse', '93210', 'Rosny', '2016-11-23'),
('d13', 'Debelle', 'Jeanne', 'jdebelle', 'nvwqq', '134 allée des Joncs', '44000', 'Nantes', '2010-05-11'),
('d51', 'Debroise', 'Michel', 'mdebroise', 'sghkb', '2 Bld Jourdain', '44000', 'Nantes', '2011-04-17'),
('e22', 'Desmarquest', 'Nathalie', 'ndesmarquest', 'f1fob', '14 Place d Arc', '45000', 'Orléans', '2015-11-12'),
('e24', 'Desnost', 'Pierre', 'pdesnost', '4k2o5', '16 avenue des Cèdres', '23200', 'Guéret', '2017-02-05'),
('e39', 'Dudouit', 'Frédéric', 'fdudouit', '44im8', '18 rue de l église', '23120', 'GrandBourg', '2010-08-01'),
('e49', 'Duncombe', 'Claude', 'cduncombe', 'qf77j', '19 rue de la tour', '23100', 'La souteraine', '2015-10-10'),
('e5', 'Enault-Pascreau', 'Céline', 'cenault', 'y2qdu', '25 place de la gare', '23200', 'Gueret', '2018-09-01'),
('e52', 'Eynde', 'Valérie', 'veynde', 'i7sn3', '3 Grand Place', '13015', 'Marseille', '2016-11-01'),
('f21', 'Finck', 'Jacques', 'jfinck', 'mpb3t', '10 avenue du Prado', '13002', 'Marseille', '2019-11-10'),
('f39', 'Frémont', 'Fernande', 'ffremont', 'xs5tq', '4 route de la mer', '13012', 'Allauh', '2014-10-01'),
('f4', 'Gest', 'Alain', 'agest', 'dywvt', '30 avenue de la mer', '13025', 'Berre', '2018-11-01');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `comptable`
--
ALTER TABLE `comptable`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `etat`
--
ALTER TABLE `etat`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fichefrais`
--
ALTER TABLE `fichefrais`
  ADD PRIMARY KEY (`idVisiteur`,`mois`),
  ADD KEY `idEtat` (`idEtat`);

--
-- Index pour la table `fraisforfait`
--
ALTER TABLE `fraisforfait`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lignefraisforfait`
--
ALTER TABLE `lignefraisforfait`
  ADD PRIMARY KEY (`idVisiteur`,`mois`,`idFraisForfait`),
  ADD KEY `idFraisForfait` (`idFraisForfait`);

--
-- Index pour la table `lignefraishorsforfait`
--
ALTER TABLE `lignefraishorsforfait`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idVisiteur` (`idVisiteur`,`mois`);

--
-- Index pour la table `visiteur`
--
ALTER TABLE `visiteur`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `lignefraishorsforfait`
--
ALTER TABLE `lignefraishorsforfait`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `fichefrais`
--
ALTER TABLE `fichefrais`
  ADD CONSTRAINT `fichefrais_ibfk_1` FOREIGN KEY (`idEtat`) REFERENCES `etat` (`id`),
  ADD CONSTRAINT `fichefrais_ibfk_2` FOREIGN KEY (`idVisiteur`) REFERENCES `visiteur` (`id`);

--
-- Contraintes pour la table `lignefraisforfait`
--
ALTER TABLE `lignefraisforfait`
  ADD CONSTRAINT `lignefraisforfait_ibfk_1` FOREIGN KEY (`idVisiteur`,`mois`) REFERENCES `fichefrais` (`idVisiteur`, `mois`),
  ADD CONSTRAINT `lignefraisforfait_ibfk_2` FOREIGN KEY (`idFraisForfait`) REFERENCES `fraisforfait` (`id`);

--
-- Contraintes pour la table `lignefraishorsforfait`
--
ALTER TABLE `lignefraishorsforfait`
  ADD CONSTRAINT `lignefraishorsforfait_ibfk_1` FOREIGN KEY (`idVisiteur`,`mois`) REFERENCES `fichefrais` (`idVisiteur`, `mois`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
