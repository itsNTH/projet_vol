-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 14 mars 2024 à 10:19
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projet_vol`
--

-- --------------------------------------------------------

--
-- Structure de la table `a`
--

DROP TABLE IF EXISTS `a`;
CREATE TABLE IF NOT EXISTS `a` (
  `ref_compagnie` int NOT NULL,
  `ref_fonction` int NOT NULL,
  KEY `fk_ref_fonction1` (`ref_fonction`),
  KEY `fk_ref_compagnie` (`ref_compagnie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `avion`
--

DROP TABLE IF EXISTS `avion`;
CREATE TABLE IF NOT EXISTS `avion` (
  `id_avion` int NOT NULL AUTO_INCREMENT,
  `modele` varchar(255) NOT NULL,
  `ref_compagnie` int NOT NULL,
  PRIMARY KEY (`id_avion`),
  KEY `fk-ref_compagnie2` (`ref_compagnie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `compagnie`
--

DROP TABLE IF EXISTS `compagnie`;
CREATE TABLE IF NOT EXISTS `compagnie` (
  `id_compagnie` int NOT NULL AUTO_INCREMENT,
  `nom` int NOT NULL,
  PRIMARY KEY (`id_compagnie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fonction`
--

DROP TABLE IF EXISTS `fonction`;
CREATE TABLE IF NOT EXISTS `fonction` (
  `id_fonction` int NOT NULL AUTO_INCREMENT,
  `admin` tinyint NOT NULL,
  `client` tinyint NOT NULL,
  `pilote` tinyint NOT NULL,
  PRIMARY KEY (`id_fonction`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `reserver`
--

DROP TABLE IF EXISTS `reserver`;
CREATE TABLE IF NOT EXISTS `reserver` (
  `ref_utilisateur` int NOT NULL,
  `ref_vol` int NOT NULL,
  `annuler` tinyint(1) NOT NULL,
  KEY `fk_ref_utilisateurs` (`ref_utilisateur`),
  KEY `fk_ref_vol` (`ref_vol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id_utilisateur` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `age` int NOT NULL,
  `ville` varchar(100) NOT NULL,
  `ref_fonction` int NOT NULL,
  PRIMARY KEY (`id_utilisateur`),
  KEY `fk_ref_fonction` (`ref_fonction`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `vol`
--

DROP TABLE IF EXISTS `vol`;
CREATE TABLE IF NOT EXISTS `vol` (
  `id_vol` int NOT NULL AUTO_INCREMENT,
  `destination` varchar(100) NOT NULL,
  `heure_dep` datetime NOT NULL,
  `heure_arr` datetime NOT NULL,
  `ville_arr` varchar(100) NOT NULL,
  `ref_avion` int NOT NULL,
  PRIMARY KEY (`id_vol`),
  KEY `fk_ref_avion` (`ref_avion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `a`
--
ALTER TABLE `a`
  ADD CONSTRAINT `fk_ref_compagnie` FOREIGN KEY (`ref_compagnie`) REFERENCES `compagnie` (`id_compagnie`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_ref_fonction1` FOREIGN KEY (`ref_fonction`) REFERENCES `fonction` (`id_fonction`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `avion`
--
ALTER TABLE `avion`
  ADD CONSTRAINT `fk-ref_compagnie2` FOREIGN KEY (`ref_compagnie`) REFERENCES `compagnie` (`id_compagnie`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `reserver`
--
ALTER TABLE `reserver`
  ADD CONSTRAINT `fk_ref_utilisateurs` FOREIGN KEY (`ref_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`),
  ADD CONSTRAINT `fk_ref_vol` FOREIGN KEY (`ref_vol`) REFERENCES `vol` (`id_vol`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `fk_ref_fonction` FOREIGN KEY (`ref_fonction`) REFERENCES `fonction` (`id_fonction`);

--
-- Contraintes pour la table `vol`
--
ALTER TABLE `vol`
  ADD CONSTRAINT `fk_ref_avion` FOREIGN KEY (`ref_avion`) REFERENCES `avion` (`id_avion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
