-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : lun. 09 sep. 2024 à 09:52
-- Version du serveur : 5.7.39
-- Version de PHP : 8.3.1

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
-- Structure de la table `fichefrais`
--

CREATE TABLE `fichefrais` (
  `idVisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `nbJustificatifs` int(11) DEFAULT NULL,
  `montantValide` decimal(10,2) DEFAULT NULL,
  `dateModif` date DEFAULT NULL,
  `idEtat` char(2) DEFAULT 'CR'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `fichefrais`
--

INSERT INTO `fichefrais` (`idVisiteur`, `mois`, `nbJustificatifs`, `montantValide`, `dateModif`, `idEtat`) VALUES
('a131', '202407', 1, 4470.57, '2024-08-06', 'VA'),
('a131', '202408', 10, 0.00, '2024-08-07', 'CL'),
('a17', '202407', 1, 3682.42, '2024-08-07', 'VA'),
('a17', '202408', 5, 0.00, '2024-08-02', 'CL'),
('a55', '202407', 3, 3160.09, '2024-08-01', 'VA'),
('a55', '202408', 11, 0.00, '2024-08-04', 'CL'),
('a93', '202407', 4, 3399.84, '2024-08-02', 'VA'),
('a93', '202408', 5, 0.00, '2024-08-04', 'CL'),
('b13', '202407', 0, 2147.40, '2024-08-06', 'VA'),
('b13', '202408', 9, 0.00, '2024-08-01', 'CL'),
('b16', '202407', 12, 3247.04, '2024-08-02', 'VA'),
('b16', '202408', 7, 0.00, '2024-08-04', 'CL'),
('b19', '202407', 5, 2461.33, '2024-08-05', 'VA'),
('b19', '202408', 4, 0.00, '2024-08-03', 'CL'),
('b25', '202407', 9, 5164.22, '2024-08-04', 'VA'),
('b25', '202408', 2, 0.00, '2024-08-04', 'CL'),
('b28', '202407', 11, 2566.29, '2024-08-05', 'VA'),
('b28', '202408', 9, 0.00, '2024-08-03', 'CL'),
('b34', '202407', 11, 2044.48, '2024-08-06', 'VA'),
('b34', '202408', 1, 0.00, '2024-08-03', 'CL'),
('b4', '202407', 3, 2997.88, '2024-08-01', 'VA'),
('b4', '202408', 9, 0.00, '2024-08-04', 'CL'),
('b50', '202407', 9, 2055.86, '2024-08-05', 'VA'),
('b50', '202408', 0, 0.00, '2024-08-05', 'CL'),
('b59', '202407', 6, 5985.77, '2024-08-03', 'VA'),
('b59', '202408', 10, 0.00, '2024-08-04', 'CL'),
('c14', '202407', 4, 5242.00, '2024-08-05', 'VA'),
('c14', '202408', 9, 0.00, '2024-08-04', 'CL'),
('c3', '202407', 3, 3267.80, '2024-08-03', 'VA'),
('c3', '202408', 5, 0.00, '2024-08-03', 'CL'),
('c54', '202407', 8, 2948.84, '2024-08-04', 'VA'),
('c54', '202408', 9, 0.00, '2024-08-02', 'CL'),
('d13', '202407', 1, 3371.62, '2024-08-07', 'VA'),
('d13', '202408', 6, 0.00, '2024-08-08', 'CL'),
('d51', '202407', 9, 2140.48, '2024-08-03', 'VA'),
('d51', '202408', 4, 0.00, '2024-08-03', 'CL'),
('e22', '202407', 9, 2602.19, '2024-08-05', 'VA'),
('e22', '202408', 10, 0.00, '2024-08-06', 'CL'),
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
('f4', '202408', 11, 0.00, '2024-08-06', 'CL');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `fichefrais`
--
ALTER TABLE `fichefrais`
  ADD PRIMARY KEY (`idVisiteur`,`mois`),
  ADD KEY `idEtat` (`idEtat`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `fichefrais`
--
ALTER TABLE `fichefrais`
  ADD CONSTRAINT `fichefrais_ibfk_1` FOREIGN KEY (`idEtat`) REFERENCES `etat` (`id`),
  ADD CONSTRAINT `fichefrais_ibfk_2` FOREIGN KEY (`idVisiteur`) REFERENCES `visiteur` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
