-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le :  mar. 26 mai 2020 à 21:04
-- Version du serveur :  8.0.18
-- Version de PHP :  7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `webtp5`
--

-- --------------------------------------------------------

--
-- Structure de la table `capture`
--

DROP TABLE IF EXISTS `capture`;
CREATE TABLE IF NOT EXISTS `capture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_type_elementary_id` int(11) DEFAULT NULL,
  `id_lieu_id` int(11) DEFAULT NULL,
  `est_dans_le_lieu` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8BFEA6E5C39AA058` (`id_type_elementary_id`),
  KEY `IDX_8BFEA6E5B42FBABC` (`id_lieu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `capture`
--

INSERT INTO `capture` (`id`, `id_type_elementary_id`, `id_lieu_id`, `est_dans_le_lieu`) VALUES
(1, 1, 1, 1),
(2, 2, 3, 1),
(3, 3, 1, 1),
(4, 3, 5, 1),
(5, 4, 5, 1),
(6, 5, 3, 1),
(7, 6, 2, 1),
(8, 7, 1, 1),
(9, 8, 4, 1),
(10, 9, 1, 1),
(11, 9, 2, 1),
(12, 9, 3, 1),
(13, 9, 4, 1),
(14, 9, 5, 1),
(15, 10, 2, 1),
(16, 11, 5, 1),
(17, 12, 3, 1),
(18, 13, 1, 1),
(19, 14, 2, 1),
(20, 15, 4, 1),
(21, 16, 2, 1),
(22, 16, 4, 1),
(23, 17, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `dresseur`
--

DROP TABLE IF EXISTS `dresseur`;
CREATE TABLE IF NOT EXISTS `dresseur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pseudo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pieces` int(11) DEFAULT NULL,
  `starter_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_77EA2FC6E7927C74` (`email`),
  KEY `IDX_77EA2FC6AD5A66CC` (`starter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `dresseur`
--

INSERT INTO `dresseur` (`id`, `email`, `roles`, `password`, `pseudo`, `pieces`, `starter_id`) VALUES
(1, 'laurinec@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$Y1NvVnZZSWJBUi5lSjRYVw$tnSLvz5+OELaC6HWAGST0B72IjgXcWgeFJ8wIvnWIzM', 'laurine', 5550, 4),
(2, 'estellehu@gmail.com', '[\"ROLE_USER\"]', '$argon2i$v=19$m=65536,t=4,p=1$VGZBa3BBQzdFRktZUTBNVQ$oKCy+s0/ELdqgSVfbeVnml5Cjknc8glttaGB/wWmblg', 'estelle', 5000, 1),
(3, 'estelle@gmail.com', '[\"ROLE_USER\"]', '$argon2i$v=19$m=65536,t=4,p=1$UXJSc3lhcWs4cEZISGhXUw$C0cOnEi/y2aFlu4CjXAe+caOOuXhNXRnx0wEwFrVNi4', 'hu', 5000, 4),
(5, 'eh@gmail.com', '[\"ROLE_USER\"]', '$argon2i$v=19$m=65536,t=4,p=1$WHpRbElMYmI1LnhReksuNg$0eUE7Raa9Wmrr3gn/XMIXjGvZrWq9n023ySEE30MQcs', 'hue', 5000, 7),
(7, 'lili@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$U2U4Vi83VU5EeC5vRzMwVg$eti51Ri+hscAlCXTMKCW0UNkqTLxmmz2+gE8NJu9LkE', 'lili', 6130, 1),
(8, 'lolo@hotmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$WlhZQjdFWmhjLkxSNXZSSA$zEPgC4ur58c3Fds+j2Q0tkBuGRmc6ZCCQ/jXQnOwLVY', 'lolo', 4970, 7),
(9, 'huu@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$b2Y2VjdmMTkxNGpZWC52Rg$i0raYsC8YVUPlGVUtdyWeDG70pXNb3UFmQNHmpKh+t8', 'huu', 3900, 4);

-- --------------------------------------------------------

--
-- Structure de la table `lieu`
--

DROP TABLE IF EXISTS `lieu`;
CREATE TABLE IF NOT EXISTS `lieu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_lieu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lieu`
--

INSERT INTO `lieu` (`id`, `nom_lieu`) VALUES
(1, 'Montagne'),
(2, 'Prairie'),
(3, 'Ville'),
(4, 'Foret'),
(5, 'plage');

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20200518093241', '2020-05-18 15:00:53'),
('20200519085230', '2020-05-19 08:52:47'),
('20200519090215', '2020-05-19 09:02:27'),
('20200519090854', '2020-05-19 09:09:02'),
('20200519132630', '2020-05-19 13:26:40'),
('20200525210659', '2020-05-25 21:07:12'),
('20200525214227', '2020-05-25 21:42:44');

-- --------------------------------------------------------

--
-- Structure de la table `pokemon_existant`
--

DROP TABLE IF EXISTS `pokemon_existant`;
CREATE TABLE IF NOT EXISTS `pokemon_existant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pokemon_type_id` int(11) DEFAULT NULL,
  `dresseur_id` int(11) DEFAULT NULL,
  `sexe` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `xp` int(11) DEFAULT NULL,
  `niveau` int(11) DEFAULT NULL,
  `prix` int(11) DEFAULT NULL,
  `dernier_entrainement` datetime DEFAULT NULL,
  `derniere_chasse` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_351D8709A926F002` (`pokemon_type_id`),
  KEY `IDX_351D8709A1A01CBE` (`dresseur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pokemon_existant`
--

INSERT INTO `pokemon_existant` (`id`, `pokemon_type_id`, `dresseur_id`, `sexe`, `xp`, `niveau`, `prix`, `dernier_entrainement`, `derniere_chasse`) VALUES
(1, 1, 8, 'Male', 17, 5, 0, '2020-05-26 20:28:47', '2020-05-26 19:41:10'),
(2, 7, 9, 'Male', 5, 4, 0, '2020-05-25 19:47:37', NULL),
(4, 113, 8, 'Male', 23, 71, 50845, '2020-05-26 20:52:18', NULL),
(6, 4, 9, 'Male', 0, 1, 0, NULL, '2020-05-26 20:57:13'),
(7, 40, 9, 'Male', 0, 1, 0, NULL, '2020-05-26 20:58:18'),
(8, 116, 9, 'Male', 0, 8, 0, NULL, '2020-05-26 21:01:01'),
(9, 137, 9, 'Female', 10, 23, 0, '2020-05-26 21:03:20', '2020-05-26 21:01:30'),
(10, 108, 9, 'Male', 0, 56, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `ref_elementary_type`
--

DROP TABLE IF EXISTS `ref_elementary_type`;
CREATE TABLE IF NOT EXISTS `ref_elementary_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ref_elementary_type`
--

INSERT INTO `ref_elementary_type` (`id`, `libelle`) VALUES
(0, '-'),
(1, 'acier'),
(2, 'combat'),
(3, 'dragon'),
(4, 'eau'),
(5, 'electrik'),
(6, 'feu'),
(7, 'glace'),
(8, 'insecte'),
(9, 'normal'),
(10, 'plante'),
(11, 'poison'),
(12, 'psy'),
(13, 'roche'),
(14, 'sol'),
(15, 'spectre'),
(16, 'vol'),
(17, 'fee');

-- --------------------------------------------------------

--
-- Structure de la table `ref_pokemon_type`
--

DROP TABLE IF EXISTS `ref_pokemon_type`;
CREATE TABLE IF NOT EXISTS `ref_pokemon_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_1` int(11) DEFAULT NULL,
  `type_2` int(11) DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `evolution` tinyint(1) NOT NULL,
  `starter` tinyint(1) NOT NULL,
  `type_courbe_niveau` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5483EF999C6D843C` (`type_1`),
  KEY `IDX_5483EF99564D586` (`type_2`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ref_pokemon_type`
--

INSERT INTO `ref_pokemon_type` (`id`, `type_1`, `type_2`, `nom`, `evolution`, `starter`, `type_courbe_niveau`) VALUES
(1, 10, 0, 'Bulbizare', 0, 1, 'P'),
(2, 10, 11, 'Herbizarre', 1, 0, 'P'),
(3, 10, 11, 'Florizarre', 1, 0, 'P'),
(4, 6, 0, 'Salamèche', 0, 1, 'P'),
(5, 6, 0, 'Reptincel', 1, 0, 'P'),
(6, 6, 16, 'Dracaufeu', 1, 0, 'P'),
(7, 4, 0, 'Carapuce', 0, 1, 'P'),
(8, 4, 0, 'Carabaffe', 1, 0, 'P'),
(9, 4, 0, 'Tortank', 1, 0, 'P'),
(10, 8, 0, 'Chenipan', 0, 0, 'M'),
(11, 8, 0, 'Chrysacier', 1, 0, 'M'),
(12, 8, 16, 'Papilusion', 1, 0, 'M'),
(13, 8, 11, 'Aspicot', 0, 0, 'M'),
(14, 8, 11, 'Coconfort', 1, 0, 'M'),
(15, 8, 11, 'Dardargnan', 1, 0, 'M'),
(16, 9, 16, 'Roucool', 0, 0, 'P'),
(17, 9, 16, 'Roucoups', 1, 0, 'P'),
(18, 9, 16, 'Roucarnage', 1, 0, 'P'),
(19, 9, 0, 'Rattata', 0, 0, 'M'),
(20, 9, 0, 'Rattatac', 1, 0, 'M'),
(21, 9, 16, 'Piafabec', 0, 0, 'M'),
(22, 9, 16, 'Rapasdepic', 1, 0, 'M'),
(23, 11, 0, 'Abo', 0, 0, 'M'),
(24, 11, 0, 'Arbok', 1, 0, 'M'),
(25, 5, 0, 'Pikachu', 0, 0, 'M'),
(26, 5, 0, 'Raichu', 1, 0, 'M'),
(27, 14, 0, 'Sabelette', 0, 0, 'M'),
(28, 14, 0, 'Sablaireau', 1, 0, 'M'),
(29, 11, 0, 'Nidoran ♀', 0, 0, 'P'),
(30, 11, 0, 'Nidorina', 1, 0, 'P'),
(31, 11, 14, 'Nidoqueen', 1, 0, 'P'),
(32, 11, 0, 'Nidoran ♂', 0, 0, 'P'),
(33, 11, 0, 'Nidorino', 1, 0, 'P'),
(34, 11, 14, 'Nidoking', 1, 0, 'P'),
(35, 17, 0, 'Melofée', 0, 0, 'R'),
(36, 17, 0, 'Mélodelfe', 1, 0, 'R'),
(37, 6, 0, 'Goupix', 0, 0, 'M'),
(38, 6, 0, 'Feunard', 1, 0, 'M'),
(39, 9, 17, 'Rondoudou', 0, 0, 'R'),
(40, 9, 17, 'Grodoudou', 1, 0, 'R'),
(41, 11, 16, 'Nosferapti', 0, 0, 'M'),
(42, 11, 16, 'Nosferalto', 1, 0, 'M'),
(43, 10, 11, 'Mystherbe', 0, 0, 'P'),
(44, 10, 11, 'Ortide', 1, 0, 'P'),
(45, 10, 11, 'Rafflesia', 1, 0, 'P'),
(46, 8, 10, 'Paras', 0, 0, 'M'),
(47, 8, 10, 'Parasect', 1, 0, 'M'),
(48, 8, 11, 'Mimitoss', 0, 0, 'M'),
(49, 8, 11, 'Aeromite', 1, 0, 'M'),
(50, 14, 0, 'Taupiqueur', 0, 0, 'M'),
(51, 14, 0, 'Triopikeur', 1, 0, 'M'),
(52, 9, 0, 'Miaouss', 0, 0, 'M'),
(53, 9, 0, 'Persian', 1, 0, 'M'),
(54, 4, 0, 'Psykokwak', 0, 0, 'M'),
(55, 4, 0, 'Akwakwak', 1, 0, 'M'),
(56, 2, 0, 'Ferosinge', 0, 0, 'M'),
(57, 2, 0, 'Colossinge', 1, 0, 'M'),
(58, 6, 0, 'Caninos', 0, 0, 'L'),
(59, 6, 0, 'Arcanin', 1, 0, 'L'),
(60, 4, 0, 'Ptitard', 0, 0, 'P'),
(61, 4, 0, 'Tetarte', 1, 0, 'P'),
(62, 4, 2, 'Tartard', 1, 0, 'P'),
(63, 12, 0, 'Abra', 0, 0, 'P'),
(64, 12, 0, 'Kadabra', 1, 0, 'P'),
(65, 12, 0, 'Alakazam', 1, 0, 'P'),
(66, 2, 0, 'Machoc', 0, 0, 'P'),
(67, 2, 0, 'Machopeur', 1, 0, 'P'),
(68, 2, 0, 'Mackogneur', 1, 0, 'P'),
(69, 10, 11, 'Chetiflor', 0, 0, 'P'),
(70, 10, 11, 'Boustiflor', 1, 0, 'P'),
(71, 10, 11, 'Empiflor', 1, 0, 'P'),
(72, 4, 11, 'Tentacool', 0, 0, 'L'),
(73, 4, 11, 'Tentacruel', 1, 0, 'L'),
(74, 13, 14, 'Racaillou', 0, 0, 'P'),
(75, 13, 14, 'Gravalanch', 1, 0, 'P'),
(76, 13, 14, 'Grolem', 1, 0, 'P'),
(77, 6, 0, 'Ponyta', 0, 0, 'M'),
(78, 6, 0, 'Galopa', 1, 0, 'M'),
(79, 4, 12, 'Ramoloss', 0, 0, 'M'),
(80, 4, 12, 'Flagadoss', 1, 0, 'M'),
(81, 5, 1, 'Magneti', 0, 0, 'M'),
(82, 5, 1, 'Magneton', 1, 0, 'M'),
(83, 9, 16, 'Canarticho', 0, 0, 'M'),
(84, 9, 16, 'Doduo', 0, 0, 'M'),
(85, 9, 16, 'Dodrio', 1, 0, 'M'),
(86, 4, 0, 'Otaria', 0, 0, 'M'),
(87, 4, 7, 'Lamantine', 1, 0, 'M'),
(88, 11, 0, 'Tadmorv', 0, 0, 'M'),
(89, 11, 0, 'Grotadmorv', 1, 0, 'M'),
(90, 4, 0, 'Kokiyas', 0, 0, 'L'),
(91, 4, 7, 'Crustabri', 1, 0, 'L'),
(92, 15, 11, 'Fantominus', 0, 0, 'P'),
(93, 15, 11, 'Spectrum', 1, 0, 'P'),
(94, 15, 11, 'Ectoplasma', 1, 0, 'P'),
(95, 13, 14, 'Onix', 0, 0, 'M'),
(96, 12, 0, 'Soporifik', 0, 0, 'M'),
(97, 12, 0, 'Hypnomade', 1, 0, 'M'),
(98, 4, 0, 'Krabby', 0, 0, 'M'),
(99, 4, 0, 'Krabboss', 1, 0, 'M'),
(100, 5, 0, '16torbe', 0, 0, 'M'),
(101, 5, 0, 'Electrode', 1, 0, 'M'),
(102, 10, 12, 'Noeunoeuf', 0, 0, 'L'),
(103, 10, 12, 'Noadkoko', 1, 0, 'L'),
(104, 14, 0, 'Osselait', 0, 0, 'M'),
(105, 14, 0, 'Ossatueur', 1, 0, 'M'),
(106, 2, 0, 'Kicklee', 0, 0, 'M'),
(107, 2, 0, 'Tygnon', 0, 0, 'M'),
(108, 9, 0, 'Excelangue', 0, 0, 'M'),
(109, 11, 0, 'Smogo', 0, 0, 'M'),
(110, 11, 0, 'Smogogo', 1, 0, 'M'),
(111, 14, 13, 'Rhinocorne', 0, 0, 'L'),
(112, 14, 13, 'Rhinoferos', 1, 0, 'L'),
(113, 9, 0, 'Leveinard', 0, 0, 'R'),
(114, 10, 0, 'Saquedeneu', 0, 0, 'M'),
(115, 9, 0, 'Kangourex', 0, 0, 'M'),
(116, 4, 0, 'Hypotrempe', 0, 0, 'M'),
(117, 4, 0, 'Hypocean', 1, 0, 'M'),
(118, 4, 0, 'Poissirene', 0, 0, 'M'),
(119, 4, 0, 'Poissoroy', 1, 0, 'M'),
(120, 4, 0, 'Stari', 0, 0, 'L'),
(121, 4, 12, 'Staross', 1, 0, 'L'),
(122, 12, 17, 'M. Mime', 0, 0, 'M'),
(123, 8, 16, 'Insecateur', 0, 0, 'M'),
(124, 7, 12, 'Lippoutou', 0, 0, 'M'),
(125, 5, 0, 'Elektek', 0, 0, 'M'),
(126, 6, 0, 'Magmar', 0, 0, 'M'),
(127, 8, 0, 'Scarabrute', 0, 0, 'L'),
(128, 9, 0, 'Tauros', 0, 0, 'L'),
(129, 4, 0, 'Magicarpe', 0, 0, 'L'),
(130, 4, 16, 'Leviator', 1, 0, 'L'),
(131, 4, 7, 'Lokhlass', 0, 0, 'L'),
(132, 9, 0, 'Metamorph', 0, 0, 'M'),
(133, 9, 0, 'Evoli', 0, 0, 'M'),
(134, 4, 0, 'Aquali', 1, 0, 'M'),
(135, 5, 0, 'Voltali', 1, 0, 'M'),
(136, 6, 0, 'Pyroli', 1, 0, 'M'),
(137, 9, 0, 'Porygon', 0, 0, 'M'),
(138, 13, 4, 'Amonita', 0, 0, 'M'),
(139, 13, 4, 'Amonistar', 1, 0, 'M'),
(140, 13, 4, 'Kabuto', 0, 0, 'M'),
(141, 13, 4, 'Kabutops', 1, 0, 'M'),
(142, 13, 16, 'Ptera', 0, 0, 'L'),
(143, 9, 0, 'Ronflex', 0, 0, 'L'),
(144, 7, 16, 'Artikodin', 0, 0, 'L'),
(145, 5, 16, 'Electhor', 0, 0, 'L'),
(146, 6, 16, 'Sulfura', 0, 0, 'L'),
(147, 3, 0, 'Minidraco', 0, 0, 'L'),
(148, 3, 0, 'Draco', 1, 0, 'L'),
(149, 3, 16, 'Dracolosse', 1, 0, 'L'),
(150, 12, 0, 'Mewtwo', 0, 0, 'L'),
(151, 12, 0, 'Mew', 0, 0, 'P');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `capture`
--
ALTER TABLE `capture`
  ADD CONSTRAINT `FK_8BFEA6E5B42FBABC` FOREIGN KEY (`id_lieu_id`) REFERENCES `lieu` (`id`),
  ADD CONSTRAINT `FK_8BFEA6E5C39AA058` FOREIGN KEY (`id_type_elementary_id`) REFERENCES `ref_elementary_type` (`id`);

--
-- Contraintes pour la table `dresseur`
--
ALTER TABLE `dresseur`
  ADD CONSTRAINT `FK_77EA2FC6AD5A66CC` FOREIGN KEY (`starter_id`) REFERENCES `ref_pokemon_type` (`id`);

--
-- Contraintes pour la table `pokemon_existant`
--
ALTER TABLE `pokemon_existant`
  ADD CONSTRAINT `FK_351D8709A1A01CBE` FOREIGN KEY (`dresseur_id`) REFERENCES `dresseur` (`id`),
  ADD CONSTRAINT `FK_351D8709A926F002` FOREIGN KEY (`pokemon_type_id`) REFERENCES `ref_pokemon_type` (`id`);

--
-- Contraintes pour la table `ref_pokemon_type`
--
ALTER TABLE `ref_pokemon_type`
  ADD CONSTRAINT `FK_5483EF99564D586` FOREIGN KEY (`type_2`) REFERENCES `ref_elementary_type` (`id`),
  ADD CONSTRAINT `FK_5483EF999C6D843C` FOREIGN KEY (`type_1`) REFERENCES `ref_elementary_type` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
