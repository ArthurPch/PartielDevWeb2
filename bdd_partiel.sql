-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 27 mars 2025 à 13:07
-- Version du serveur : 5.7.24
-- Version de PHP : 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bdd partiel`
--

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

CREATE TABLE `auteur` (
  `ID_Auteur` int(11) NOT NULL,
  `Nom` varchar(100) NOT NULL,
  `Date_Naissance` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `auteur`
--

INSERT INTO `auteur` (`ID_Auteur`, `Nom`, `Date_Naissance`) VALUES
(1, 'Kentaro Miura', '1966-07-11'),
(2, 'Hirohiko Araki', '1960-06-07'),
(3, 'Takehiko Inoue', '1967-01-12'),
(4, 'Eiichiro Oda', '1975-01-01'),
(5, 'Naoki Urasawa', '1960-01-02');

-- --------------------------------------------------------

--
-- Structure de la table `manga`
--

CREATE TABLE `manga` (
  `ID_Manga` int(11) NOT NULL,
  `Titre` varchar(200) NOT NULL,
  `Annee_Publication` int(11) DEFAULT NULL,
  `Note_Satisfaction` decimal(3,1) DEFAULT NULL,
  `Description` text,
  `ID_Auteur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `manga`
--

INSERT INTO `manga` (`ID_Manga`, `Titre`, `Annee_Publication`, `Note_Satisfaction`, `Description`, `ID_Auteur`) VALUES
(1, 'Berserk', 1989, '9.5', 'Guts, a former mercenary now known as the Black Swordsman, is out for revenge. After a tumultuous childhood, he finally finds someone he respects and believes he can trust, only to have everything fall apart when this person takes away everything important to Guts for the purpose of fulfilling his own desires. Now marked for death, Guts becomes condemned to a fate in which he is relentlessly pursued by demonic beings.', 1),
(2, 'JoJo no Kimyou na Bouken', 2004, '9.4', 'In the American Old West, the world s greatest race is about to begin. Thousands line up in San Diego to travel over six thousand kilometers for a chance to win the grand prize of fifty million dollars. With the era of the horse reaching its end, contestants are allowed to use any kind of vehicle they wish. Competitors will have to endure grueling conditions, traveling up to a hundred kilometers a day through uncharted wastelands. The Steel Ball Run is truly a one-of-a-kind event.', 2),
(3, 'Vagabond', 1998, '9.3', 'In 16th-century Japan, Shinmen Takezou is a wild, rough young man in both his appearance and his actions. His aggressive nature has won him the collective reproach and fear of his village, leading him and his best friend, Matahachi Honiden, to run away in search of something grander than provincial life. The pair enlist in the Toyotomi army, yearning for glory—but when the Toyotomi suffer a crushing defeat at the hands of the Tokugawa Clan at the Battle of Sekigahara, the friends barely make it out alive.', 3),
(4, 'One Piece', 1997, '9.2', 'Gol D. Roger, a man referred to as the King of the Pirates, is set to be executed by the World Government. But just before his demise, he confirms the existence of a great treasure, One Piece, located somewhere within the vast ocean known as the Grand Line. Announcing that One Piece can be claimed by anyone worthy enough to reach it, the King of the Pirates is executed and the Great Age of Pirates begins.', 4),
(5, 'Monster', 1994, '9.1', 'Kenzou Tenma, a renowned Japanese neurosurgeon working in post-war Germany, faces a difficult choice: to operate on Johan Liebert, an orphan boy on the verge of death, or on the mayor of Düsseldorf. In the end, Tenma decides to gamble his reputation by saving Johan, effectively leaving the mayor for dead.', 5);

-- --------------------------------------------------------

--
-- Structure de la table `personnage`
--

CREATE TABLE `personnage` (
  `ID_Personnage` int(11) NOT NULL,
  `Nom` varchar(100) NOT NULL,
  `Description` text,
  `ID_Manga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `personnage`
--

INSERT INTO `personnage` (`ID_Personnage`, `Nom`, `Description`, `ID_Manga`) VALUES
(1, 'Guts', 'Grand guerrier maniant une grande épée', 1),
(2, 'Griffith', 'Leader de la brigade des faucons, il est avide de pouvoir', 1),
(3, 'Joestar Jonhy', 'Johnny Joestar, also known as \"Joe Kid\" or \"JoJo\", was a racing prodigy.', 2),
(4, 'Diego Brando', 'Dio s alternate universe counterpart in Part 7 of JoJo s Bizarre Adventure, Steel Ball Run.', 2),
(5, 'Miyamoto Musashi', 'Samouraï légendaire', 3),
(6, 'Sasaki Kojirō', 'Rival de Musashi et maître escrimeur', 3),
(7, 'Monkey D. Luffy', 'Capitaine au chapeau de paille rêvant de devenir le roi des pirates', 4),
(8, 'Roronoa Zoro', 'Grand épéiste maniant l art du combat à 3 sabres', 4),
(9, 'Dr. Kenzo Tenma', 'Chirurgien', 5),
(10, 'Johan Liebert', 'Tueur en série mystérieux', 5);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `auteur`
--
ALTER TABLE `auteur`
  ADD PRIMARY KEY (`ID_Auteur`);

--
-- Index pour la table `manga`
--
ALTER TABLE `manga`
  ADD PRIMARY KEY (`ID_Manga`),
  ADD KEY `ID_Auteur` (`ID_Auteur`);

--
-- Index pour la table `personnage`
--
ALTER TABLE `personnage`
  ADD PRIMARY KEY (`ID_Personnage`),
  ADD KEY `ID_Manga` (`ID_Manga`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `manga`
--
ALTER TABLE `manga`
  ADD CONSTRAINT `manga_ibfk_1` FOREIGN KEY (`ID_Auteur`) REFERENCES `auteur` (`ID_Auteur`);

--
-- Contraintes pour la table `personnage`
--
ALTER TABLE `personnage`
  ADD CONSTRAINT `personnage_ibfk_1` FOREIGN KEY (`ID_Manga`) REFERENCES `manga` (`ID_Manga`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
