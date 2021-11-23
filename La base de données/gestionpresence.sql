-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 14 juil. 2020 à 13:08
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestionpresence`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `ID` varchar(30) NOT NULL,
  `firstNName` text DEFAULT NULL,
  `lastName` text DEFAULT NULL,
  `userName` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `pass` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`ID`, `firstNName`, `lastName`, `userName`, `email`, `pass`) VALUES
('AD1', 'Safouan', 'BENZEYAN', 'Safouan Benzeyan', 'safouan.benzeyan@etu.uae.ac.ma', 'Safouan123'),
('AD2', 'Youssef', 'AKCHAR', 'Youssef Akchar', 'youssef.akchar@etu.uae.ac.ma', 'Youssef123');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant_lf`
--

CREATE TABLE `etudiant_lf` (
  `code_apogee` varchar(30) NOT NULL,
  `rfid` varchar(30) DEFAULT NULL,
  `cne` varchar(30) DEFAULT NULL,
  `cin` varchar(30) DEFAULT NULL,
  `nom` text DEFAULT NULL,
  `prenom` text DEFAULT NULL,
  `section` varchar(30) DEFAULT NULL,
  `branche` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `etudiant_lf`
--

INSERT INTO `etudiant_lf` (`code_apogee`, `rfid`, `cne`, `cin`, `nom`, `prenom`, `section`, `branche`) VALUES
('111111', '1111', 'S111111111', 'R111111', 'BENZEYAN', 'Safouan', 'LF-A', 'GST'),
('222222', '2222', 'S222222222', 'R222222', 'AKCHAR', 'Youssef', 'LF-B', 'ECO'),
('333333', '3333', 'S333333333', 'R333333', 'BENZEYAN', 'Youssef', 'LF-B', 'DRT'),
('444444', '4444', 'S444444444', 'R444444', 'AKCHAR', 'Safouan', 'LF-A', 'INF');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant_lp_mstr`
--

CREATE TABLE `etudiant_lp_mstr` (
  `code_apogee2` varchar(30) NOT NULL,
  `rfid2` varchar(30) DEFAULT NULL,
  `cin2` varchar(30) DEFAULT NULL,
  `cne2` varchar(30) DEFAULT NULL,
  `nom2` text DEFAULT NULL,
  `prenom2` text DEFAULT NULL,
  `section2` varchar(30) DEFAULT NULL,
  `branche2` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `etudiant_lp_mstr`
--

INSERT INTO `etudiant_lp_mstr` (`code_apogee2`, `rfid2`, `cin2`, `cne2`, `nom2`, `prenom2`, `section2`, `branche2`) VALUES
('LP111111', 'LP1111', 'LPR111111', 'LPS1111111111', 'BENZEYAN', 'Safouan', 'LP', 'INF'),
('LP222222', 'LP2222', 'LPR222222', 'LPS222222222', 'AKCHAR', 'Safouan', 'LP', 'INF'),
('LP333333', 'LP3333', 'LPR333333', 'LPS3333333333', 'AKCHAR', 'Yousef', 'LP', 'INF'),
('LP444444', 'LP4444', 'LPR444444', 'LPS444444444', 'BENZEYAN', 'Yousef', 'LP', 'INF');

-- --------------------------------------------------------

--
-- Structure de la table `exam_lf`
--

CREATE TABLE `exam_lf` (
  `code_exam` int(11) NOT NULL,
  `code_matiere` varchar(30) DEFAULT NULL,
  `code_apogee` varchar(30) DEFAULT NULL,
  `locall` varchar(30) DEFAULT NULL,
  `dateEx` datetime DEFAULT NULL,
  `professeur` text DEFAULT NULL,
  `presence` varchar(30) DEFAULT NULL
) ;

--
-- Déchargement des données de la table `exam_lf`
--

INSERT INTO `exam_lf` (`code_exam`, `code_matiere`, `code_apogee`, `locall`, `dateEx`, `professeur`, `presence`) VALUES
(7, 'ENTRPRN1', '111111', 'Local1', '2020-06-15 00:00:00', 'PR.TABAA', 'present(e)'),
(8, 'STTQ1', '222222', 'Local2', '2020-06-15 00:00:00', 'PR.TABAA', 'present(e)');

-- --------------------------------------------------------

--
-- Structure de la table `exam_lp_mstr`
--

CREATE TABLE `exam_lp_mstr` (
  `code_exam2` int(11) NOT NULL,
  `code_matiere2` varchar(30) DEFAULT NULL,
  `code_apogee2` varchar(30) DEFAULT NULL,
  `locall2` varchar(30) DEFAULT NULL,
  `dateEx2` datetime DEFAULT NULL,
  `professeur2` text DEFAULT NULL,
  `presence2` varchar(30) DEFAULT NULL
) ;

--
-- Déchargement des données de la table `exam_lp_mstr`
--

INSERT INTO `exam_lp_mstr` (`code_exam2`, `code_matiere2`, `code_apogee2`, `locall2`, `dateEx2`, `professeur2`, `presence2`) VALUES
(6, 'ENTRPRN1', 'LP333333', 'Local1', '2020-06-15 00:00:00', 'PR.MOUMMOU', 'present(e)'),
(7, 'STTQ1', 'LP444444', 'Local2', '2020-06-15 00:00:00', 'PR.TABAA', 'present(e)');

-- --------------------------------------------------------

--
-- Structure de la table `filiere`
--

CREATE TABLE `filiere` (
  `code_filiere` varchar(30) NOT NULL,
  `libelle_filiere` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `filiere`
--

INSERT INTO `filiere` (`code_filiere`, `libelle_filiere`) VALUES
('ANG', 'Anglais'),
('ARA', 'Arabe'),
('DRT', 'DROIT'),
('ECO', 'Economie'),
('FRN', 'Français'),
('GST', 'Gestion'),
('INF', 'Informatique');

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

CREATE TABLE `matiere` (
  `code_matiere` varchar(30) NOT NULL,
  `libelle_matiere` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `matiere`
--

INSERT INTO `matiere` (`code_matiere`, `libelle_matiere`) VALUES
('ENTRPRN1', 'Entreprenariat'),
('GSTNPROD1', 'Gestion de Production'),
('STTQ1', 'Statistiques');

-- --------------------------------------------------------

--
-- Structure de la table `seance_lp_mstr`
--

CREATE TABLE `seance_lp_mstr` (
  `code_seance` int(11) NOT NULL,
  `filiere` varchar(30) DEFAULT NULL,
  `code_matiere3` varchar(30) DEFAULT NULL,
  `code_apogee3` varchar(30) DEFAULT NULL,
  `dateSeance` datetime DEFAULT NULL,
  `professeur3` text DEFAULT NULL,
  `presence3` varchar(30) DEFAULT NULL
) ;

--
-- Déchargement des données de la table `seance_lp_mstr`
--

INSERT INTO `seance_lp_mstr` (`code_seance`, `filiere`, `code_matiere3`, `code_apogee3`, `dateSeance`, `professeur3`, `presence3`) VALUES
(11, 'INF', 'STTQ1', 'LP111111', '2020-06-15 00:00:00', 'NULL', 'present(e)'),
(12, 'INF', 'ENTRPRN1', 'LP222222', '2020-06-15 00:00:00', 'NULL', 'present(e)'),
(13, 'INF', 'GSTNPROD1', 'LP333333', '2020-06-15 00:00:00', 'NULL', 'present(e)');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `etudiant_lf`
--
ALTER TABLE `etudiant_lf`
  ADD PRIMARY KEY (`code_apogee`),
  ADD KEY `FK_lf_FLR` (`branche`);

--
-- Index pour la table `etudiant_lp_mstr`
--
ALTER TABLE `etudiant_lp_mstr`
  ADD PRIMARY KEY (`code_apogee2`),
  ADD KEY `FK_lpMSTR_FLR` (`branche2`);

--
-- Index pour la table `exam_lf`
--
ALTER TABLE `exam_lf`
  ADD PRIMARY KEY (`code_exam`),
  ADD KEY `fk1` (`code_matiere`),
  ADD KEY `fk2` (`code_apogee`);

--
-- Index pour la table `exam_lp_mstr`
--
ALTER TABLE `exam_lp_mstr`
  ADD PRIMARY KEY (`code_exam2`),
  ADD KEY `fk12` (`code_matiere2`),
  ADD KEY `fk22` (`code_apogee2`);

--
-- Index pour la table `filiere`
--
ALTER TABLE `filiere`
  ADD PRIMARY KEY (`code_filiere`);

--
-- Index pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD PRIMARY KEY (`code_matiere`);

--
-- Index pour la table `seance_lp_mstr`
--
ALTER TABLE `seance_lp_mstr`
  ADD PRIMARY KEY (`code_seance`),
  ADD KEY `fk123` (`code_matiere3`),
  ADD KEY `fk223` (`code_apogee3`),
  ADD KEY `FK_S_FLR` (`filiere`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `exam_lf`
--
ALTER TABLE `exam_lf`
  MODIFY `code_exam` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `exam_lp_mstr`
--
ALTER TABLE `exam_lp_mstr`
  MODIFY `code_exam2` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `seance_lp_mstr`
--
ALTER TABLE `seance_lp_mstr`
  MODIFY `code_seance` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `etudiant_lf`
--
ALTER TABLE `etudiant_lf`
  ADD CONSTRAINT `FK_lf_FLR` FOREIGN KEY (`branche`) REFERENCES `filiere` (`code_filiere`);

--
-- Contraintes pour la table `etudiant_lp_mstr`
--
ALTER TABLE `etudiant_lp_mstr`
  ADD CONSTRAINT `FK_lpMSTR_FLR` FOREIGN KEY (`branche2`) REFERENCES `filiere` (`code_filiere`);

--
-- Contraintes pour la table `exam_lf`
--
ALTER TABLE `exam_lf`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`code_matiere`) REFERENCES `matiere` (`code_matiere`),
  ADD CONSTRAINT `fk2` FOREIGN KEY (`code_apogee`) REFERENCES `etudiant_lf` (`code_apogee`);

--
-- Contraintes pour la table `exam_lp_mstr`
--
ALTER TABLE `exam_lp_mstr`
  ADD CONSTRAINT `fk12` FOREIGN KEY (`code_matiere2`) REFERENCES `matiere` (`code_matiere`),
  ADD CONSTRAINT `fk22` FOREIGN KEY (`code_apogee2`) REFERENCES `etudiant_lp_mstr` (`code_apogee2`);

--
-- Contraintes pour la table `seance_lp_mstr`
--
ALTER TABLE `seance_lp_mstr`
  ADD CONSTRAINT `FK_S_FLR` FOREIGN KEY (`filiere`) REFERENCES `filiere` (`code_filiere`),
  ADD CONSTRAINT `fk123` FOREIGN KEY (`code_matiere3`) REFERENCES `matiere` (`code_matiere`),
  ADD CONSTRAINT `fk223` FOREIGN KEY (`code_apogee3`) REFERENCES `etudiant_lp_mstr` (`code_apogee2`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
