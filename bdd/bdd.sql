-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 17 juil. 2024 à 10:14
-- Version du serveur : 5.7.26
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `site_web`
--

-- --------------------------------------------------------

--
-- Structure de la table `absences_personnels`
--

DROP TABLE IF EXISTS `absences_personnels`;
CREATE TABLE IF NOT EXISTS `absences_personnels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `personnel_id` int(11) NOT NULL,
  `lieu_vente_id` int(11) NOT NULL,
  `saisie_par_id` int(11) NOT NULL,
  `heure_absence` double NOT NULL,
  `date_absence` date NOT NULL,
  `date_saisie` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9DB9B52C1C109075` (`personnel_id`),
  KEY `IDX_9DB9B52CAA2B41DC` (`lieu_vente_id`),
  KEY `IDX_9DB9B52CC74AC7FE` (`saisie_par_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `achat_fournisseur`
--

DROP TABLE IF EXISTS `achat_fournisseur`;
CREATE TABLE IF NOT EXISTS `achat_fournisseur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fournisseur_id` int(11) NOT NULL,
  `lieu_vente_id` int(11) NOT NULL,
  `devise_id` int(11) NOT NULL,
  `personnel_id` int(11) NOT NULL,
  `numero_facture` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_product` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commentaire` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `montant` decimal(13,2) DEFAULT NULL,
  `date_facture` date NOT NULL,
  `date_saisie` datetime NOT NULL,
  `taux` double NOT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `etat_paiement` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tva` decimal(13,2) DEFAULT NULL,
  `type_saisie` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `etat_reception` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D8FB1B0F670C757F` (`fournisseur_id`),
  KEY `IDX_D8FB1B0FAA2B41DC` (`lieu_vente_id`),
  KEY `IDX_D8FB1B0FF4445056` (`devise_id`),
  KEY `IDX_D8FB1B0F1C109075` (`personnel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `achat_fournisseur_general`
--

DROP TABLE IF EXISTS `achat_fournisseur_general`;
CREATE TABLE IF NOT EXISTS `achat_fournisseur_general` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fournisseur_id` int(11) NOT NULL,
  `lieu_vente_id` int(11) NOT NULL,
  `devise_id` int(11) NOT NULL,
  `personnel_id` int(11) NOT NULL,
  `numero_facture` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_product` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commentaire` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `montant` decimal(13,2) DEFAULT NULL,
  `date_facture` date NOT NULL,
  `date_saisie` datetime NOT NULL,
  `taux` double NOT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `etat_paiement` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tva` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C048D0ED670C757F` (`fournisseur_id`),
  KEY `IDX_C048D0EDAA2B41DC` (`lieu_vente_id`),
  KEY `IDX_C048D0EDF4445056` (`devise_id`),
  KEY `IDX_C048D0ED1C109075` (`personnel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
CREATE TABLE IF NOT EXISTS `adresse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `rue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `complement_adresse` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ville` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pays` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom_client` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C35F0816A76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ajustement_solde`
--

DROP TABLE IF EXISTS `ajustement_solde`;
CREATE TABLE IF NOT EXISTS `ajustement_solde` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collaborateur_id` int(11) NOT NULL,
  `devise_id` int(11) NOT NULL,
  `lieu_vente_id` int(11) NOT NULL,
  `traite_par_id` int(11) NOT NULL,
  `commentaire` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `montant` decimal(13,2) NOT NULL,
  `date_operation` datetime NOT NULL,
  `date_saisie` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_835EE1E7A848E3B1` (`collaborateur_id`),
  KEY `IDX_835EE1E7F4445056` (`devise_id`),
  KEY `IDX_835EE1E7AA2B41DC` (`lieu_vente_id`),
  KEY `IDX_835EE1E7167FABE8` (`traite_par_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ajustement_solde`
--

INSERT INTO `ajustement_solde` (`id`, `collaborateur_id`, `devise_id`, `lieu_vente_id`, `traite_par_id`, `commentaire`, `montant`, `date_operation`, `date_saisie`) VALUES
(1, 11, 1, 1, 9, 'solde initial', -3975000.00, '2024-07-16 12:33:40', '2024-07-16 12:33:40'),
(2, 12, 1, 1, 9, 'ACHAT DE RALLONGE 50M 3x2.5(1) ,50M 2x2.5(1) ,25M', -1700000.00, '2024-07-16 00:00:00', '2024-07-16 12:40:46'),
(3, 13, 1, 1, 9, 'Meche a beton 6(500pcs) et 8(500pcs), Pince Bisso(5dzs)', -3027500.00, '2024-07-16 00:00:00', '2024-07-16 12:47:54'),
(4, 15, 1, 1, 9, 'Coupe carreaux pm, Scizaille bisso 36(1pc), 42(1pc) et 48(1pc) NUM(0596)', -280000.00, '2024-07-16 00:00:00', '2024-07-16 12:58:15'),
(5, 15, 1, 1, 9, 'Poste a soudire 400A(1pc), 600A (1pc), 400PFC(1pc) num (0597)', -4500000.00, '2024-07-16 00:00:00', '2024-07-16 12:57:37'),
(6, 16, 1, 1, 9, 'Turfon 8x60(10pqts), Cheville 12(20pqts), Vice 6.3(2 cts) Num4445', -500000.00, '2024-07-16 00:00:00', '2024-07-16 13:11:43'),
(7, 10, 1, 1, 9, 'VICE 10x2(6PQTS),ETAU 150mm(2pcs) NUM(4446)', -1470000.00, '2024-07-16 00:00:00', '2024-07-16 13:22:53'),
(8, 17, 1, 1, 9, 'Defonceuse MPT 2200W (3pcs) Num 0535', -1200000.00, '2024-07-16 00:00:00', '2024-07-16 13:31:18'),
(9, 18, 1, 1, 9, 'Meche en fer16 (2pqts), Defonceuse MPT 2200W(1pc), Scie Circulaire SALI 2400W(2pcs) Num0538', -3100000.00, '2024-07-16 00:00:00', '2024-07-16 13:37:53'),
(10, 19, 1, 1, 9, 'Facture Num0653', -2555000.00, '2024-07-16 00:00:00', '2024-07-16 14:13:37'),
(11, 20, 1, 1, 9, 'Facture Num0660', -1000000.00, '2024-07-16 00:00:00', '2024-07-16 14:18:18'),
(12, 36, 1, 1, 9, 'REPORT SOLDE', -1515000.00, '2024-07-16 00:00:00', '2024-07-16 15:48:30');

-- --------------------------------------------------------

--
-- Structure de la table `anomalie_produit`
--

DROP TABLE IF EXISTS `anomalie_produit`;
CREATE TABLE IF NOT EXISTS `anomalie_produit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `personnel_id` int(11) NOT NULL,
  `inventaire_id` int(11) DEFAULT NULL,
  `quantite` double NOT NULL,
  `prix_revient` decimal(12,2) DEFAULT NULL,
  `date_anomalie` date NOT NULL,
  `comentaire` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_ADB996D0DCD6110` (`stock_id`),
  KEY `IDX_ADB996D04584665A` (`product_id`),
  KEY `IDX_ADB996D01C109075` (`personnel_id`),
  KEY `IDX_ADB996D0CE430A85` (`inventaire_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `avance_salaire`
--

DROP TABLE IF EXISTS `avance_salaire`;
CREATE TABLE IF NOT EXISTS `avance_salaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `devise_id` int(11) NOT NULL,
  `mode_paiement_id` int(11) NOT NULL,
  `traite_par_id` int(11) NOT NULL,
  `caisse_id` int(11) NOT NULL,
  `lieu_vente_id` int(11) NOT NULL,
  `montant` decimal(12,2) NOT NULL,
  `mois` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_avance` date NOT NULL,
  `periode` date NOT NULL,
  `date_saisie` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6DA8D105A76ED395` (`user_id`),
  KEY `IDX_6DA8D105F4445056` (`devise_id`),
  KEY `IDX_6DA8D105438F5B63` (`mode_paiement_id`),
  KEY `IDX_6DA8D105167FABE8` (`traite_par_id`),
  KEY `IDX_6DA8D10527B4FEBF` (`caisse_id`),
  KEY `IDX_6DA8D105AA2B41DC` (`lieu_vente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `bannieres_entreprise`
--

DROP TABLE IF EXISTS `bannieres_entreprise`;
CREATE TABLE IF NOT EXISTS `bannieres_entreprise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `bannieres_entreprise`
--

INSERT INTO `bannieres_entreprise` (`id`, `image`) VALUES
(1, 'banniere-boutique_65b3a196133e3.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `bon_commande_fournisseur`
--

DROP TABLE IF EXISTS `bon_commande_fournisseur`;
CREATE TABLE IF NOT EXISTS `bon_commande_fournisseur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fournisseur_id` int(11) NOT NULL,
  `lieu_vente_id` int(11) NOT NULL,
  `devise_id` int(11) NOT NULL,
  `personnel_id` int(11) NOT NULL,
  `numero_bon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentaire` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `montant` decimal(13,2) DEFAULT NULL,
  `date_saisie` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D91605A9670C757F` (`fournisseur_id`),
  KEY `IDX_D91605A9AA2B41DC` (`lieu_vente_id`),
  KEY `IDX_D91605A9F4445056` (`devise_id`),
  KEY `IDX_D91605A91C109075` (`personnel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `caisse`
--

DROP TABLE IF EXISTS `caisse`;
CREATE TABLE IF NOT EXISTS `caisse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `point_de_vente_id` int(11) DEFAULT NULL,
  `designation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_compte` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B2A353C83F95E273` (`point_de_vente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `caisse`
--

INSERT INTO `caisse` (`id`, `point_de_vente_id`, `designation`, `type`, `numero_compte`, `document`) VALUES
(1, 1, 'Caisse Principal', 'Caisse', '01', NULL),
(2, 1, 'Orange Money', 'Banque', '02', NULL),
(3, 1, 'FirstBank', 'Banque', '03', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_categorie` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `couverture` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_produit` json DEFAULT NULL,
  `priorite` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `name_categorie`, `couverture`, `img_produit`, `priorite`, `description`) VALUES
(4, 'Cheville plastique', 'defaut.jpg', NULL, '1', NULL),
(5, 'Meche en fer', 'defaut.jpg', NULL, '1', NULL),
(6, 'Charbon', 'defaut.jpg', NULL, '1', NULL),
(8, 'Vice Noir', 'defaut.jpg', NULL, '1', NULL),
(9, 'Vice Dore', 'defaut.jpg', NULL, '1', NULL),
(10, 'Vice Parker', 'defaut.jpg', NULL, '1', NULL),
(11, 'Vice Tete Fraise', 'defaut.jpg', NULL, '1', NULL),
(12, 'Vice Tole', 'defaut.jpg', NULL, '1', NULL),
(13, 'Rivet', 'defaut.jpg', NULL, '1', NULL),
(14, 'Cheville Metallique', 'defaut.jpg', NULL, '1', NULL),
(15, 'TURFON', 'defaut.jpg', NULL, '1', NULL),
(16, 'Rondelle', 'defaut.jpg', NULL, '1', NULL),
(17, 'Crochet Plafond', 'defaut.jpg', NULL, '1', NULL),
(18, 'Collier', 'defaut.jpg', NULL, '1', NULL),
(19, 'Boulons Tournevices', 'defaut.jpg', NULL, '1', NULL),
(20, 'Crochet Tole et Accesoire', 'defaut.jpg', NULL, '1', NULL),
(21, 'Accesoire Vice Tole', 'defaut.jpg', NULL, '1', NULL),
(22, 'Cheville Frappe', 'defaut.jpg', NULL, '1', NULL),
(23, 'Cheville Metallique petit', 'defaut.jpg', NULL, '1', NULL),
(24, 'Boulons Ecrous', 'defaut.jpg', NULL, '1', NULL),
(25, 'Baguette Fonte', 'defaut.jpg', NULL, '1', NULL),
(26, 'Baguette Inox', 'defaut.jpg', NULL, '1', NULL),
(27, 'Baguette Brasil', 'defaut.jpg', NULL, '1', NULL),
(28, 'Baguette Ordinaire', 'defaut.jpg', NULL, '1', NULL),
(29, 'Baguette Acier', 'defaut.jpg', NULL, '1', NULL),
(30, 'Centimetres Gris', 'defaut.jpg', NULL, '1', NULL),
(31, 'Centimetres en Fer', 'defaut.jpg', NULL, '1', NULL),
(32, 'Centimetres Noir', 'defaut.jpg', NULL, '1', NULL),
(33, 'Centimetres Orange', 'defaut.jpg', NULL, '1', NULL),
(34, 'Decametres', 'defaut.jpg', NULL, '1', NULL),
(35, 'Plastique Meule', 'defaut.jpg', NULL, '1', NULL),
(36, 'Griffe Fer A Beton', 'defaut.jpg', NULL, '1', NULL),
(37, 'Cisaille Bisso', 'defaut.jpg', NULL, '1', NULL),
(38, 'Tenaille Germanie', 'defaut.jpg', NULL, '1', NULL),
(39, 'Disque A Soudure', 'defaut.jpg', NULL, '1', ''),
(40, 'Disque A Beton', 'defaut.jpg', NULL, '1', NULL),
(41, 'Tournevice Testeur JUMLEE', 'defaut.jpg', NULL, '1', NULL),
(42, 'Meche A Beton', 'defaut.jpg', NULL, '1', NULL),
(43, 'Disque Frottage JUMLEE', 'defaut.jpg', NULL, '1', NULL),
(44, 'Bascule Vert', 'defaut.jpg', NULL, '1', NULL),
(45, 'Bascule 200Kg NOPS', 'defaut.jpg', NULL, '1', NULL),
(46, 'Meule MPT 2400W', 'defaut.jpg', NULL, '1', NULL),
(47, 'Machine ulty-Batterie', 'defaut.jpg', NULL, '1', NULL),
(48, 'Poste A Soudure', 'defaut.jpg', NULL, '1', NULL),
(49, 'Chargeur Ulty', 'defaut.jpg', NULL, '1', NULL),
(50, 'Batterie Ulty', 'defaut.jpg', NULL, '1', NULL),
(51, 'Marteau Rouge Noir', 'defaut.jpg', NULL, '1', NULL),
(52, 'Bande Signalisation 500m', 'defaut.jpg', NULL, '1', NULL),
(53, 'Plastique Noir Pour Meule', 'defaut.jpg', NULL, '1', NULL),
(54, 'Ciseaux Menuisier', 'defaut.jpg', NULL, '1', NULL),
(55, 'Papier Vert Ponsage 150', 'defaut.jpg', NULL, '1', ''),
(56, 'Papier Vert Ponsage 180', 'defaut.jpg', NULL, '1', ''),
(57, 'Rabot', 'defaut.jpg', NULL, '1', NULL),
(58, 'Secateur FLEUR Jaune Noir', 'defaut.jpg', NULL, '1', NULL),
(59, 'Secateur FLEUR Rouge Noir', 'defaut.jpg', NULL, '1', NULL),
(60, 'Machine Coupe Carreau', 'defaut.jpg', NULL, '1', NULL),
(61, 'Ciseaux Tapissier', 'defaut.jpg', NULL, '1', NULL),
(62, 'Balle Tapissier', 'defaut.jpg', NULL, '1', NULL),
(63, 'Appareil Sillicone', 'defaut.jpg', NULL, '1', ''),
(64, 'Pinceau', 'defaut.jpg', NULL, '1', NULL),
(65, 'Machine Ulty Bosch', 'defaut.jpg', NULL, '1', NULL),
(66, 'Viceuse Makita', 'defaut.jpg', NULL, '1', NULL),
(67, 'Pince Plomberie', 'defaut.jpg', NULL, '1', NULL),
(68, 'Lame sixoteuse', 'defaut.jpg', NULL, '1', NULL),
(69, 'Tenaille Noir Wellborn', 'defaut.jpg', NULL, '1', NULL),
(70, 'Cisaille Wiseup', 'defaut.jpg', NULL, '1', ''),
(71, 'Pince A River', 'defaut.jpg', NULL, '1', NULL),
(72, 'Monture lame de scie Bisso', 'defaut.jpg', NULL, '1', NULL),
(73, 'Monture lame de scie Wiseip', 'defaut.jpg', NULL, '1', NULL),
(74, 'Sizaille Wizeip', 'defaut.jpg', NULL, '1', NULL),
(75, 'Tareau', 'defaut.jpg', NULL, '1', NULL),
(76, 'Trouwel wiseup', 'defaut.jpg', NULL, '1', NULL),
(77, 'Trouwel Plastique', 'defaut.jpg', NULL, '1', NULL),
(78, 'Tournevice Electrique', 'defaut.jpg', NULL, '1', NULL),
(79, 'Tournevice 2face', 'defaut.jpg', NULL, '1', NULL),
(80, 'Palette', 'defaut.jpg', NULL, '1', NULL),
(81, 'Marteau Menuisier', 'defaut.jpg', NULL, '1', NULL),
(82, 'Pied de biche', 'defaut.jpg', NULL, '1', NULL),
(83, 'Marteau Orange Noir', 'defaut.jpg', NULL, '1', NULL),
(84, 'Marteau Tapissier', 'defaut.jpg', NULL, '1', NULL),
(85, 'Etau', 'defaut.jpg', NULL, '1', NULL),
(86, 'Sizaille Tole', 'defaut.jpg', NULL, '1', NULL),
(87, 'Taloche Maçon', 'defaut.jpg', NULL, '1', NULL),
(88, 'Taloche Mastique', 'defaut.jpg', NULL, '1', NULL),
(89, 'Serrant Menuisier En Fer', 'defaut.jpg', NULL, '1', ''),
(90, 'serrant Menuisier wiseup', 'defaut.jpg', NULL, '1', NULL),
(91, 'Pierre', 'defaut.jpg', NULL, '1', NULL),
(92, 'Disque en Bois', 'defaut.jpg', NULL, '1', NULL),
(93, 'Disque Frottage Bosshei', 'defaut.jpg', NULL, '1', NULL),
(94, 'Niveau Maçon Jaune', 'defaut.jpg', NULL, '1', NULL),
(95, 'Niveau Maçon Noir', 'defaut.jpg', NULL, '1', NULL),
(96, 'Sizaille Bisso', 'defaut.jpg', NULL, '1', NULL),
(97, 'Pistolet Peinture', 'defaut.jpg', NULL, '1', NULL),
(98, 'Gant Wiseup', 'defaut.jpg', NULL, '1', NULL),
(99, 'Controleur Pneu', 'defaut.jpg', NULL, '1', NULL),
(100, 'Pointe Acier', 'defaut.jpg', NULL, '1', NULL),
(101, 'Defonçeuse MPT', 'defaut.jpg', NULL, '1', NULL),
(102, 'Ecaire Jaune', 'defaut.jpg', NULL, '1', NULL),
(103, 'Ecaire Noir', 'defaut.jpg', NULL, '1', NULL),
(104, 'Dent Difonceuse', 'defaut.jpg', NULL, '1', NULL),
(105, 'Ecaire Aliminium', 'defaut.jpg', NULL, '1', NULL),
(106, 'Brosse Metallique', 'defaut.jpg', NULL, '1', NULL),
(107, 'Tournevice Vistole', 'defaut.jpg', NULL, '1', NULL),
(108, 'Meule Makita', 'defaut.jpg', NULL, '1', NULL),
(109, 'Pince Plaquette', 'defaut.jpg', NULL, '1', NULL),
(110, 'Tenaille wiseup', 'defaut.jpg', NULL, '1', NULL),
(111, 'Tenaille Bisso', 'defaut.jpg', NULL, '1', NULL),
(112, 'Sangle', 'defaut.jpg', NULL, '1', NULL),
(113, 'Pince Universelle N8', 'defaut.jpg', NULL, '1', NULL),
(114, 'Pince Coupante', 'defaut.jpg', NULL, '1', NULL),
(115, 'Pince Long Bec', 'defaut.jpg', NULL, '1', NULL),
(116, 'Cle Allain Pliant', 'defaut.jpg', NULL, '1', NULL),
(117, 'Marteau Carreauleur', 'defaut.jpg', NULL, '1', NULL),
(118, 'Rallonge 50M', 'defaut.jpg', NULL, '1', NULL),
(119, 'Rallonge 25M', 'defaut.jpg', NULL, '1', NULL),
(120, 'Caisse A Douille', 'defaut.jpg', NULL, '1', ''),
(121, 'Peinture', 'defaut.jpg', NULL, '1', NULL),
(122, 'POIGNET', 'defaut.jpg', NULL, '1', NULL),
(123, 'POMELLE', 'defaut.jpg', NULL, '1', NULL),
(124, 'SERRURE', 'defaut.jpg', NULL, '1', NULL),
(125, 'VERROU', 'defaut.jpg', NULL, '1', NULL),
(126, 'FERMETURE', 'defaut.jpg', NULL, '1', NULL),
(127, 'CANOT', 'defaut.jpg', NULL, '1', NULL),
(128, 'ROBOT', 'defaut.jpg', NULL, '1', NULL),
(129, 'EQUEUR MOUSTIQUER', 'defaut.jpg', NULL, '1', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `categorie_decaissement`
--

DROP TABLE IF EXISTS `categorie_decaissement`;
CREATE TABLE IF NOT EXISTS `categorie_decaissement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categorie_decaissement`
--

INSERT INTO `categorie_decaissement` (`id`, `designation`) VALUES
(1, 'Autres'),
(2, 'fournisseur'),
(4, 'client');

-- --------------------------------------------------------

--
-- Structure de la table `categorie_depense`
--

DROP TABLE IF EXISTS `categorie_depense`;
CREATE TABLE IF NOT EXISTS `categorie_depense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categorie_depense`
--

INSERT INTO `categorie_depense` (`id`, `description`) VALUES
(1, 'REPAS'),
(2, 'LOYER');

-- --------------------------------------------------------

--
-- Structure de la table `categorie_operation`
--

DROP TABLE IF EXISTS `categorie_operation`;
CREATE TABLE IF NOT EXISTS `categorie_operation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_operation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categorie_operation`
--

INSERT INTO `categorie_operation` (`id`, `nom_operation`) VALUES
(1, 'facturations'),
(2, 'dépenses'),
(3, 'décaissements'),
(4, 'dépots'),
(5, 'salaires'),
(6, 'recettes'),
(7, 'devise');

-- --------------------------------------------------------

--
-- Structure de la table `categorie_recette`
--

DROP TABLE IF EXISTS `categorie_recette`;
CREATE TABLE IF NOT EXISTS `categorie_recette` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cheque_espece`
--

DROP TABLE IF EXISTS `cheque_espece`;
CREATE TABLE IF NOT EXISTS `cheque_espece` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collaborateur_id` int(11) NOT NULL,
  `caisse_depot_id` int(11) NOT NULL,
  `caisse_retrait_id` int(11) NOT NULL,
  `saisie_par_id` int(11) NOT NULL,
  `lieu_vente_id` int(11) NOT NULL,
  `montant_cheque` decimal(13,2) NOT NULL,
  `numero_cheque` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banque_cheque` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `montant_recu` decimal(13,2) NOT NULL,
  `date_operation` datetime NOT NULL,
  `date_saisie` datetime NOT NULL,
  `commentaire` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_EDD98F31A848E3B1` (`collaborateur_id`),
  KEY `IDX_EDD98F315227BF46` (`caisse_depot_id`),
  KEY `IDX_EDD98F311D002A8F` (`caisse_retrait_id`),
  KEY `IDX_EDD98F31C74AC7FE` (`saisie_par_id`),
  KEY `IDX_EDD98F31AA2B41DC` (`lieu_vente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type_client` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rattachement_id` int(11) NOT NULL,
  `limit_credit` decimal(13,2) DEFAULT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `societe` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C7440455A76ED395` (`user_id`),
  KEY `IDX_C74404558E780FD` (`rattachement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `user_id`, `type_client`, `rattachement_id`, `limit_credit`, `document`, `societe`) VALUES
(1, 4, 'client', 1, 1000000000.00, NULL, NULL),
(3, 8, 'client', 1, 1000000000.00, NULL, NULL),
(4, 10, 'client', 1, 1000000000.00, NULL, NULL),
(5, 11, 'client', 1, 1000000000.00, NULL, NULL),
(6, 12, 'client', 1, 1000000000.00, NULL, NULL),
(7, 13, 'client', 1, 1000000000.00, NULL, NULL),
(8, 14, 'client', 1, 1000000000.00, NULL, NULL),
(9, 15, 'client', 1, 1000000000.00, NULL, NULL),
(10, 16, 'client', 1, 1000000000.00, NULL, NULL),
(11, 17, 'client', 1, 1000000000.00, NULL, NULL),
(12, 18, 'client', 1, 1000000000.00, NULL, NULL),
(13, 19, 'client', 1, 1000000000.00, NULL, NULL),
(14, 20, 'client', 1, 1000000000.00, NULL, NULL),
(15, 21, 'client', 1, 1000000000.00, NULL, NULL),
(16, 22, 'client', 1, 1000000000.00, NULL, NULL),
(17, 23, 'client', 1, 1000000000.00, NULL, NULL),
(18, 24, 'client', 1, 1000000000.00, NULL, NULL),
(19, 25, 'client', 1, 1000000000.00, NULL, NULL),
(20, 26, 'client', 1, 1000000000.00, NULL, NULL),
(21, 27, 'client', 1, 1000000000.00, NULL, NULL),
(22, 28, 'client', 1, 1000000000.00, NULL, NULL),
(23, 29, 'client', 1, 1000000000.00, NULL, NULL),
(24, 30, 'client', 1, 1000000000.00, NULL, NULL),
(25, 31, 'client', 1, 1000000000.00, NULL, NULL),
(26, 32, 'client', 1, 1000000000.00, NULL, NULL),
(27, 33, 'client', 1, 1000000000.00, NULL, NULL),
(28, 34, 'client', 1, 1000000000.00, NULL, NULL),
(29, 35, 'client', 1, 1000000000.00, NULL, NULL),
(30, 36, 'client', 1, 1000000000.00, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `cloture_caisse`
--

DROP TABLE IF EXISTS `cloture_caisse`;
CREATE TABLE IF NOT EXISTS `cloture_caisse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `saisie_par_id` int(11) NOT NULL,
  `caisse_id` int(11) NOT NULL,
  `devise_id` int(11) NOT NULL,
  `lieu_vente_id` int(11) NOT NULL,
  `journee` date NOT NULL,
  `montant_theo` decimal(13,2) NOT NULL,
  `montant_reel` decimal(13,2) NOT NULL,
  `date_saisie` datetime NOT NULL,
  `difference` decimal(13,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_21B102FDC74AC7FE` (`saisie_par_id`),
  KEY `IDX_21B102FD27B4FEBF` (`caisse_id`),
  KEY `IDX_21B102FDF4445056` (`devise_id`),
  KEY `IDX_21B102FDAA2B41DC` (`lieu_vente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `collaborateurs`
--

DROP TABLE IF EXISTS `collaborateurs`;
CREATE TABLE IF NOT EXISTS `collaborateurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commande_product`
--

DROP TABLE IF EXISTS `commande_product`;
CREATE TABLE IF NOT EXISTS `commande_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `facturation_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `prix_vente` decimal(13,2) DEFAULT NULL,
  `prix_revient` decimal(13,2) DEFAULT NULL,
  `prix_achat` decimal(13,2) DEFAULT NULL,
  `quantite` double DEFAULT NULL,
  `quantite_livre` double DEFAULT NULL,
  `remise` decimal(13,2) DEFAULT NULL,
  `tva` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_25F1760DDBC5F284` (`facturation_id`),
  KEY `IDX_25F1760D4584665A` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commande_product`
--

INSERT INTO `commande_product` (`id`, `facturation_id`, `product_id`, `prix_vente`, `prix_revient`, `prix_achat`, `quantite`, `quantite_livre`, `remise`, `tva`) VALUES
(27, 10, 379, 45000.00, NULL, NULL, 2, 2, 0.00, 0),
(28, 10, 403, 60000.00, NULL, NULL, 2, 2, 0.00, 0),
(29, 10, 405, 60000.00, NULL, NULL, 1, 1, 0.00, 0),
(30, 10, 594, 50000.00, NULL, NULL, 1, 1, 0.00, 0),
(31, 10, 224, 25000.00, NULL, NULL, 2, 2, 0.00, 0),
(32, 10, 259, 25000.00, NULL, NULL, 4, 4, 0.00, 0),
(33, 10, 297, 35000.00, NULL, NULL, 5, 5, 0.00, 0),
(34, 10, 236, 25000.00, NULL, NULL, 12, 12, 0.00, 0),
(35, 10, 421, 50000.00, NULL, NULL, 1, 1, 0.00, 0),
(36, 10, 423, 60000.00, NULL, NULL, 1, 1, 0.00, 0),
(37, 10, 299, 40000.00, NULL, NULL, 1, 1, 0.00, 0),
(38, 10, 183, 60000.00, NULL, NULL, 10, 10, 0.00, 0),
(39, 11, 223, 625000.00, NULL, NULL, 1, 1, 0.00, 0);

-- --------------------------------------------------------

--
-- Structure de la table `commission_vente`
--

DROP TABLE IF EXISTS `commission_vente`;
CREATE TABLE IF NOT EXISTS `commission_vente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `facture_id` int(11) NOT NULL,
  `beneficiaire_id` int(11) NOT NULL,
  `montant` decimal(13,2) DEFAULT NULL,
  `date_paiement` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C6CB38DF7F2DEE08` (`facture_id`),
  KEY `IDX_C6CB38DF5AF81F68` (`beneficiaire_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `compte_operation`
--

DROP TABLE IF EXISTS `compte_operation`;
CREATE TABLE IF NOT EXISTS `compte_operation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_compte` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentaire` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `compte_operation`
--

INSERT INTO `compte_operation` (`id`, `numero_compte`, `commentaire`) VALUES
(1, '000001', 'decaissement'),
(2, '000002', 'salaires'),
(3, '00003', 'dépenses'),
(4, '000004', 'versements'),
(5, '000005', 'recettes'),
(6, '000006', 'facturation'),
(7, 'devise', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `configuration_logiciel`
--

DROP TABLE IF EXISTS `configuration_logiciel`;
CREATE TABLE IF NOT EXISTS `configuration_logiciel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_color` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `livraison` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caisse` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `format_facture` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `long_logo` varchar(110) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `larg_logo` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom_entreprise` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_contact` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `decaissement`
--

DROP TABLE IF EXISTS `decaissement`;
CREATE TABLE IF NOT EXISTS `decaissement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `lieu_vente_id` int(11) NOT NULL,
  `traite_par_id` int(11) NOT NULL,
  `devise_id` int(11) NOT NULL,
  `mode_paie_id` int(11) NOT NULL,
  `compte_decaisser_id` int(11) NOT NULL,
  `categorie_id` int(11) NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `montant` decimal(13,2) NOT NULL,
  `numero_cheque_bord` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banque_cheque` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commentaire` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_decaissement` datetime NOT NULL,
  `date_saisie` datetime NOT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E5CCA29B19EB6921` (`client_id`),
  KEY `IDX_E5CCA29BAA2B41DC` (`lieu_vente_id`),
  KEY `IDX_E5CCA29B167FABE8` (`traite_par_id`),
  KEY `IDX_E5CCA29BF4445056` (`devise_id`),
  KEY `IDX_E5CCA29B62E04A07` (`mode_paie_id`),
  KEY `IDX_E5CCA29BFA9687D0` (`compte_decaisser_id`),
  KEY `IDX_E5CCA29BBCF5E72D` (`categorie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `delete_decaissement`
--

DROP TABLE IF EXISTS `delete_decaissement`;
CREATE TABLE IF NOT EXISTS `delete_decaissement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `montant` decimal(13,2) NOT NULL,
  `numero_cheque_bord` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banque_cheque` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_decaissement` datetime NOT NULL,
  `date_saisie` datetime NOT NULL,
  `client` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `traite_par` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `devise` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caisse` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commentaire` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `delete_decaissement`
--

INSERT INTO `delete_decaissement` (`id`, `reference`, `montant`, `numero_cheque_bord`, `banque_cheque`, `date_decaissement`, `date_saisie`, `client`, `traite_par`, `devise`, `caisse`, `commentaire`) VALUES
(1, 'dec2406040001', 10000.00, NULL, NULL, '2024-06-04 00:00:00', '2024-06-04 16:34:04', 'client cash cash', 'damko damko', 'gnf', 'Caisse Principal', 'suppression décaissement'),
(2, 'vers2406040001', 10000.00, NULL, NULL, '2024-06-04 00:00:00', '2024-06-04 16:34:21', 'client cash cash', 'damko damko', 'gnf', 'Caisse Principal', 'suppression versement'),
(3, 'vers2407020001', 20000000.00, NULL, NULL, '2024-07-02 00:00:00', '2024-07-16 11:44:25', 'Balde Adrahmane Entag', 'damko damko', 'gnf', 'Caisse Principal', 'suppression versement'),
(4, 'vers2407160001', 1100000.00, NULL, NULL, '2024-07-16 00:00:00', '2024-07-16 12:21:20', 'client cash cash', 'Amanatou Diallo', 'gnf', 'Caisse Principal', 'suppression versement');

-- --------------------------------------------------------

--
-- Structure de la table `depenses`
--

DROP TABLE IF EXISTS `depenses`;
CREATE TABLE IF NOT EXISTS `depenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mode_paiement_id` int(11) NOT NULL,
  `devise_id` int(11) NOT NULL,
  `caisse_retrait_id` int(11) NOT NULL,
  `categorie_depense_id` int(11) NOT NULL,
  `traite_par_id` int(11) NOT NULL,
  `lieu_vente_id` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `montant` decimal(11,2) NOT NULL,
  `date_depense` datetime NOT NULL,
  `date_saisie` datetime NOT NULL,
  `justificatif` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tva` decimal(13,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_EE350ECB438F5B63` (`mode_paiement_id`),
  KEY `IDX_EE350ECBF4445056` (`devise_id`),
  KEY `IDX_EE350ECB1D002A8F` (`caisse_retrait_id`),
  KEY `IDX_EE350ECBDF11DFCF` (`categorie_depense_id`),
  KEY `IDX_EE350ECB167FABE8` (`traite_par_id`),
  KEY `IDX_EE350ECBAA2B41DC` (`lieu_vente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `devise`
--

DROP TABLE IF EXISTS `devise`;
CREATE TABLE IF NOT EXISTS `devise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_devise` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `devise`
--

INSERT INTO `devise` (`id`, `nom_devise`) VALUES
(1, 'gnf'),
(2, 'eu'),
(3, 'us'),
(4, 'cfa');

-- --------------------------------------------------------

--
-- Structure de la table `dimensions`
--

DROP TABLE IF EXISTS `dimensions`;
CREATE TABLE IF NOT EXISTS `dimensions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categorie_id` int(11) DEFAULT NULL,
  `valeur_dimension` varchar(255) NOT NULL,
  `unite` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E27D8BA5BCF5E72D` (`categorie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=272 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `dimensions`
--

INSERT INTO `dimensions` (`id`, `categorie_id`, `valeur_dimension`, `unite`) VALUES
(4, 4, '6', NULL),
(5, 4, '8', NULL),
(6, 4, '10', NULL),
(7, 4, '12', NULL),
(8, 5, '3', NULL),
(9, 5, '3.5', NULL),
(10, 5, '4', NULL),
(11, 5, '4.5', NULL),
(12, 5, '5', NULL),
(13, 5, '6', NULL),
(14, 5, '8', NULL),
(15, 5, '10', NULL),
(16, 5, '12', NULL),
(17, 5, '14', NULL),
(18, 5, '16', NULL),
(19, 6, '230', NULL),
(20, 6, '115', NULL),
(21, 8, '6x3/4', NULL),
(22, 8, '6x1', NULL),
(23, 8, '6x1/2', NULL),
(24, 8, '6x2', NULL),
(25, 8, '6x1/4', NULL),
(26, 9, '4', NULL),
(27, 9, '4x16', NULL),
(28, 9, '4x20', NULL),
(29, 9, '4x25', NULL),
(30, 9, '4x30', NULL),
(31, 9, '4x40', NULL),
(32, 9, '4x50', NULL),
(33, 9, '5', NULL),
(34, 9, '5x20', NULL),
(35, 9, '5x30', NULL),
(36, 9, '5x40', NULL),
(37, 9, '5x50', NULL),
(38, 9, '5x60', NULL),
(39, 9, '5x70', NULL),
(40, 9, '5x80', NULL),
(41, 9, '5x100', NULL),
(42, 9, '6x50', NULL),
(43, 9, '6x60', NULL),
(44, 9, '6x70', NULL),
(45, 9, '6x80', NULL),
(46, 9, '6x100', NULL),
(47, 10, '8x3/8', NULL),
(48, 10, '10x1/2', NULL),
(49, 10, '10x1', NULL),
(50, 10, '8x5/8', NULL),
(51, 10, '10x3/4', NULL),
(52, 10, '10x1-1/2', NULL),
(53, 10, '10x1-1/4', NULL),
(54, 10, '10x80', NULL),
(55, 11, '4.2x19', NULL),
(56, 11, '4.2x25', NULL),
(57, 11, '4.2x32', NULL),
(58, 11, '4.2x50', NULL),
(59, 12, '6.3x25', NULL),
(60, 12, '6.3x32', NULL),
(61, 12, '6.3x50', NULL),
(62, 12, '6.3x70', NULL),
(63, 12, '6.3x100', NULL),
(64, 13, '4x12', NULL),
(65, 13, '4x19', NULL),
(66, 13, '4x25', NULL),
(67, 13, '5x18', NULL),
(68, 14, 'M6x50', NULL),
(69, 14, 'M8x60', NULL),
(70, 14, 'M10x70', NULL),
(71, 14, 'M12x90', NULL),
(72, 15, '8x50', NULL),
(73, 15, '8x60', NULL),
(74, 15, '8x80', NULL),
(75, 15, '8x100', NULL),
(76, 16, 'M6', NULL),
(77, 16, 'M8', NULL),
(78, 16, 'M10', NULL),
(79, 16, 'M12', NULL),
(80, 17, 'size8', NULL),
(81, 17, 'size12', NULL),
(82, 17, 'size16', NULL),
(83, 18, 'size1/2', NULL),
(84, 18, 'size5/8', NULL),
(85, 18, 'size3/4', NULL),
(86, 18, 'size1', NULL),
(87, 18, 'size2-1/2', NULL),
(88, 19, '6x50', NULL),
(89, 19, '6x60', NULL),
(90, 20, '8x250', NULL),
(91, 20, '8x300', NULL),
(92, 22, '16x150', NULL),
(93, 22, '12X120', NULL),
(94, 22, '10x120', NULL),
(95, 23, 'M6', NULL),
(96, 23, 'M8', NULL),
(97, 23, 'M10', NULL),
(98, 23, 'M12', NULL),
(99, 24, '6x12', NULL),
(100, 24, '6x16', NULL),
(101, 24, '6x20', NULL),
(102, 24, '6x25', NULL),
(103, 24, '6x30', NULL),
(104, 24, '6x40', NULL),
(105, 24, '6x50', NULL),
(106, 24, '8x20', NULL),
(107, 24, '8x25', NULL),
(108, 24, '8x30', NULL),
(109, 24, '8x35', NULL),
(110, 24, '8x40', NULL),
(111, 24, '8x50', NULL),
(112, 24, '10x30', NULL),
(113, 24, '10x40', NULL),
(114, 24, '10x50', NULL),
(115, 24, '10x60', NULL),
(116, 24, '10x70', NULL),
(117, 24, '10x80', NULL),
(118, 24, '12x40', NULL),
(119, 24, '12x60', NULL),
(120, 24, '12x70', NULL),
(121, 25, '2.5', NULL),
(122, 25, '3.2', NULL),
(123, 26, '2.5', NULL),
(124, 26, '3.2', NULL),
(125, 28, '2.5', NULL),
(126, 28, '3.2', NULL),
(127, 29, '3.2', NULL),
(128, 30, '5', NULL),
(129, 30, '3', NULL),
(130, 30, '7.5', NULL),
(131, 31, '3', NULL),
(132, 31, '5', NULL),
(133, 31, '7.5', NULL),
(134, 32, '3', NULL),
(135, 32, '5', NULL),
(136, 32, '7.5', NULL),
(137, 33, '3', NULL),
(138, 33, '5', NULL),
(139, 33, '7.5', NULL),
(140, 34, '20M', NULL),
(141, 34, '30M', NULL),
(142, 34, '50M', NULL),
(143, 35, '115', NULL),
(144, 35, '180', NULL),
(145, 36, '6-8', NULL),
(146, 36, '8-10', NULL),
(147, 36, '10-12', NULL),
(148, 36, '12-14', NULL),
(149, 36, '14-16', NULL),
(150, 37, '36', NULL),
(151, 37, '42', NULL),
(152, 37, '48', NULL),
(153, 38, '9', NULL),
(154, 38, '10', NULL),
(155, 39, '115x1.0', NULL),
(156, 39, '113x3.0', NULL),
(157, 39, '115x6.0', NULL),
(158, 40, '230', NULL),
(159, 40, '115', NULL),
(160, 42, '6', NULL),
(161, 42, '8', NULL),
(162, 42, '10', NULL),
(163, 42, '12', NULL),
(164, 42, '14', NULL),
(165, 44, '100Kg', NULL),
(166, 44, '30Kg', NULL),
(167, 44, '20Kg', NULL),
(168, 47, '128V', NULL),
(169, 47, '88V', NULL),
(170, 48, 'ARC-400A', NULL),
(171, 48, 'ARC-600A', NULL),
(172, 48, 'MMA-400A', NULL),
(173, 51, '250g', NULL),
(174, 51, '500g', NULL),
(175, 51, '750g', NULL),
(176, 53, '150mm', NULL),
(177, 53, '180mm', NULL),
(178, 55, 'P120', NULL),
(179, 55, 'P240', NULL),
(180, 55, 'P320', NULL),
(181, 56, '120', NULL),
(182, 56, '240', NULL),
(183, 56, '320', NULL),
(184, 60, '60cm', NULL),
(185, 60, '80cm', NULL),
(186, 62, '8mm', NULL),
(187, 64, '2', NULL),
(188, 64, '3', NULL),
(189, 66, '18v', NULL),
(190, 66, '21v', NULL),
(191, 66, '26v', NULL),
(192, 70, '8', NULL),
(193, 40, '180', NULL),
(194, 74, '18', NULL),
(195, 74, '24', NULL),
(196, 74, '30', NULL),
(197, 74, '36', NULL),
(198, 74, '42', NULL),
(199, 74, '48', NULL),
(200, 76, '8', NULL),
(201, 77, '7', NULL),
(202, 77, '8', NULL),
(203, 79, 'Noir Jaune', NULL),
(204, 79, 'Gris', NULL),
(205, 79, 'Bleu Noir', NULL),
(206, 80, '8', NULL),
(207, 80, '10', NULL),
(208, 81, 'Noir', NULL),
(209, 82, 'petit', NULL),
(210, 82, 'moyen', NULL),
(211, 82, 'grand', NULL),
(212, 83, 'petit', NULL),
(213, 83, 'Grand', NULL),
(216, 85, '150', NULL),
(217, 85, '200', NULL),
(218, 87, 'petit', NULL),
(219, 87, 'Grand', NULL),
(220, 88, 'Dent', NULL),
(221, 88, 'grand', NULL),
(222, 88, 'moyen', NULL),
(223, 89, '18', NULL),
(224, 89, '20', NULL),
(225, 89, '22', NULL),
(226, 90, '30', NULL),
(227, 91, '150', NULL),
(228, 91, '200', NULL),
(229, 92, '180', NULL),
(230, 92, '230', NULL),
(231, 92, '300', NULL),
(232, 92, '350', NULL),
(233, 93, '115', NULL),
(234, 94, '40', NULL),
(235, 94, '60', NULL),
(236, 94, '80', NULL),
(237, 94, '120', NULL),
(238, 94, '100', NULL),
(239, 95, '60', NULL),
(240, 95, '80', NULL),
(241, 96, '36', NULL),
(242, 96, '42', NULL),
(243, 96, '48', NULL),
(244, 102, '12', NULL),
(245, 102, '14', NULL),
(246, 102, '16', NULL),
(247, 103, 'Grand', NULL),
(248, 103, 'Petit', NULL),
(249, 39, '180x1.0', NULL),
(250, 39, '180x6.0', NULL),
(251, 39, '230x1.0', NULL),
(252, 104, '8', NULL),
(253, 104, '12', NULL),
(254, 105, '10', NULL),
(255, 105, '12', NULL),
(256, 106, 'en bois', NULL),
(257, 106, 'en plastique', NULL),
(258, 107, '8', NULL),
(259, 107, '10', NULL),
(260, 108, '125', NULL),
(261, 110, '9', NULL),
(262, 111, '9', NULL),
(263, 111, '10', NULL),
(264, 117, '4', NULL),
(265, 117, '5', NULL),
(266, 117, '6', NULL),
(267, 118, '3x2.5', NULL),
(268, 118, '2x2.5', NULL),
(269, 119, '2x2.5', NULL),
(270, 84, '200g', NULL),
(271, 84, '400g', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20240424105913', '2024-04-24 10:59:17', 246),
('DoctrineMigrations\\Version20240424110109', '2024-04-24 11:01:13', 72),
('DoctrineMigrations\\Version20240424112125', '2024-04-24 11:21:30', 186),
('DoctrineMigrations\\Version20240424112244', '2024-04-24 11:22:48', 185),
('DoctrineMigrations\\Version20240426141710', '2024-04-26 14:17:18', 85),
('DoctrineMigrations\\Version20240529093106', '2024-05-29 09:31:18', 2186),
('DoctrineMigrations\\Version20240717095410', '2024-07-17 09:54:16', 302);

-- --------------------------------------------------------

--
-- Structure de la table `echange_devise`
--

DROP TABLE IF EXISTS `echange_devise`;
CREATE TABLE IF NOT EXISTS `echange_devise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lieu_vente_id` int(11) NOT NULL,
  `saisie_par_id` int(11) NOT NULL,
  `caisse_origine_id` int(11) NOT NULL,
  `caisse_destination_id` int(11) NOT NULL,
  `devise_origine_id` int(11) NOT NULL,
  `devise_destination_id` int(11) NOT NULL,
  `montant_origine` decimal(13,2) NOT NULL,
  `montant_destination` decimal(13,2) NOT NULL,
  `taux` decimal(13,2) NOT NULL,
  `commentaire` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_echange` datetime NOT NULL,
  `date_saisie` datetime NOT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9D6D974EAA2B41DC` (`lieu_vente_id`),
  KEY `IDX_9D6D974EC74AC7FE` (`saisie_par_id`),
  KEY `IDX_9D6D974E637FF67B` (`caisse_origine_id`),
  KEY `IDX_9D6D974E7B81509F` (`caisse_destination_id`),
  KEY `IDX_9D6D974E33B37C92` (`devise_origine_id`),
  KEY `IDX_9D6D974E307009CD` (`devise_destination_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `entreprise`
--

DROP TABLE IF EXISTS `entreprise`;
CREATE TABLE IF NOT EXISTS `entreprise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_entreprise` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifiant` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_agrement` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `entreprise`
--

INSERT INTO `entreprise` (`id`, `nom_entreprise`, `identifiant`, `numero_agrement`, `adresse`, `telephone`, `logo`, `latitude`, `longitude`) VALUES
(1, 'ETS BMTB', 'L000058', '1234586', 'Madina Ecole Gare Voiture Dabola', '620401473', 'logotahirou_66570164cb923.jpg', '9.617408', '-13.6019968');

-- --------------------------------------------------------

--
-- Structure de la table `epaisseurs`
--

DROP TABLE IF EXISTS `epaisseurs`;
CREATE TABLE IF NOT EXISTS `epaisseurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categorie_id` int(11) DEFAULT NULL,
  `valeur_epaisseur` double NOT NULL,
  `unite` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9F8BBE8CBCF5E72D` (`categorie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `facturation`
--

DROP TABLE IF EXISTS `facturation`;
CREATE TABLE IF NOT EXISTS `facturation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) DEFAULT NULL,
  `caisse_id` int(11) DEFAULT NULL,
  `lieu_vente_id` int(11) NOT NULL,
  `saisie_par_id` int(11) NOT NULL,
  `mode_paie_id` int(11) DEFAULT NULL,
  `proformat_id` int(11) DEFAULT NULL,
  `numero_facture` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_facture` decimal(13,2) DEFAULT NULL,
  `montant_paye` decimal(13,2) DEFAULT NULL,
  `montant_remise` decimal(13,2) NOT NULL,
  `etat` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `etat_livraison` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_facturation` datetime NOT NULL,
  `date_saisie` datetime NOT NULL,
  `date_alerte` datetime DEFAULT NULL,
  `commentaire` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom_client_cash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frais_sup` decimal(13,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_17EB513A19EB6921` (`client_id`),
  KEY `IDX_17EB513A27B4FEBF` (`caisse_id`),
  KEY `IDX_17EB513AAA2B41DC` (`lieu_vente_id`),
  KEY `IDX_17EB513AC74AC7FE` (`saisie_par_id`),
  KEY `IDX_17EB513A62E04A07` (`mode_paie_id`),
  KEY `IDX_17EB513AE91D11FF` (`proformat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `facturation`
--

INSERT INTO `facturation` (`id`, `client_id`, `caisse_id`, `lieu_vente_id`, `saisie_par_id`, `mode_paie_id`, `proformat_id`, `numero_facture`, `total_facture`, `montant_paye`, `montant_remise`, `etat`, `etat_livraison`, `date_facturation`, `date_saisie`, `date_alerte`, `commentaire`, `nom_client_cash`, `frais_sup`) VALUES
(10, 4, 1, 1, 9, 1, NULL, 'bmt240001', 1695000.00, 1695000.00, 0.00, 'payé', 'livré', '2024-07-16 15:33:43', '2024-07-16 15:33:43', NULL, NULL, NULL, 0.00),
(11, 4, 1, 1, 9, 1, NULL, 'bmt240011', 615000.00, 615000.00, 10000.00, 'payé', 'livré', '2024-07-16 15:57:58', '2024-07-16 15:57:58', NULL, NULL, NULL, 0.00);

-- --------------------------------------------------------

--
-- Structure de la table `facture_frais`
--

DROP TABLE IF EXISTS `facture_frais`;
CREATE TABLE IF NOT EXISTS `facture_frais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fournisseur_id` int(11) NOT NULL,
  `lieu_vente_id` int(11) NOT NULL,
  `devise_id` int(11) NOT NULL,
  `personnel_id` int(11) NOT NULL,
  `caisse_id` int(11) DEFAULT NULL,
  `numero_facture` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentaire` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `montant` decimal(13,2) NOT NULL,
  `date_facture` date NOT NULL,
  `date_saisie` datetime NOT NULL,
  `taux` double NOT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tva` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B774C42F670C757F` (`fournisseur_id`),
  KEY `IDX_B774C42FAA2B41DC` (`lieu_vente_id`),
  KEY `IDX_B774C42FF4445056` (`devise_id`),
  KEY `IDX_B774C42F1C109075` (`personnel_id`),
  KEY `IDX_B774C42F27B4FEBF` (`caisse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `facture_frais_sup`
--

DROP TABLE IF EXISTS `facture_frais_sup`;
CREATE TABLE IF NOT EXISTS `facture_frais_sup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `facturation_id` int(11) NOT NULL,
  `frais_sup_id` int(11) NOT NULL,
  `devise_id` int(11) NOT NULL,
  `montant` decimal(13,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9671F147DBC5F284` (`facturation_id`),
  KEY `IDX_9671F1476DE81F47` (`frais_sup_id`),
  KEY `IDX_9671F147F4445056` (`devise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `frais_sup`
--

DROP TABLE IF EXISTS `frais_sup`;
CREATE TABLE IF NOT EXISTS `frais_sup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `frais_sup`
--

INSERT INTO `frais_sup` (`id`, `designation`) VALUES
(1, 'Transports');

-- --------------------------------------------------------

--
-- Structure de la table `gestion_cheque`
--

DROP TABLE IF EXISTS `gestion_cheque`;
CREATE TABLE IF NOT EXISTS `gestion_cheque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caisse_depart_id` int(11) DEFAULT NULL,
  `caisse_reception_id` int(11) DEFAULT NULL,
  `lieu_vente_depart_id` int(11) NOT NULL,
  `lieu_vente_reception_id` int(11) DEFAULT NULL,
  `traite_par_id` int(11) DEFAULT NULL,
  `envoye_par_id` int(11) NOT NULL,
  `collaborateur_id` int(11) DEFAULT NULL,
  `mouvement_caisse_id` int(11) NOT NULL,
  `montant` decimal(13,2) NOT NULL,
  `date_operation` datetime NOT NULL,
  `date_saisie` datetime NOT NULL,
  `etat` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_reception` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_99F551445001D256` (`caisse_depart_id`),
  KEY `IDX_99F55144C8D2D59B` (`caisse_reception_id`),
  KEY `IDX_99F551444DA6FBA9` (`lieu_vente_depart_id`),
  KEY `IDX_99F551447ABE48CB` (`lieu_vente_reception_id`),
  KEY `IDX_99F55144167FABE8` (`traite_par_id`),
  KEY `IDX_99F55144D603292` (`envoye_par_id`),
  KEY `IDX_99F55144A848E3B1` (`collaborateur_id`),
  KEY `IDX_99F55144D48E93B2` (`mouvement_caisse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `inventaire`
--

DROP TABLE IF EXISTS `inventaire`;
CREATE TABLE IF NOT EXISTS `inventaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventaire_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `personnel_id` int(11) NOT NULL,
  `quantite_init` double DEFAULT NULL,
  `quantite_inv` double DEFAULT NULL,
  `ecart` double DEFAULT NULL,
  `description` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `statut` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_inventaire` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_338920E0CE430A85` (`inventaire_id`),
  KEY `IDX_338920E04584665A` (`product_id`),
  KEY `IDX_338920E0DCD6110` (`stock_id`),
  KEY `IDX_338920E01C109075` (`personnel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `liaison_produit`
--

DROP TABLE IF EXISTS `liaison_produit`;
CREATE TABLE IF NOT EXISTS `liaison_produit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `produit1_id` int(11) NOT NULL,
  `produit2_id` int(11) NOT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7F4F29C1FC0C3279` (`produit1_id`),
  KEY `IDX_7F4F29C1EEB99D97` (`produit2_id`)
) ENGINE=InnoDB AUTO_INCREMENT=293 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `liaison_produit`
--

INSERT INTO `liaison_produit` (`id`, `produit1_id`, `produit2_id`, `type`) VALUES
(3, 4, 5, 'paquet'),
(4, 6, 7, 'detail'),
(5, 8, 9, 'paquet'),
(6, 10, 11, 'paquet'),
(7, 12, 13, 'paquet'),
(8, 14, 15, 'paquet'),
(9, 18, 19, 'paquet'),
(10, 20, 21, 'paquet'),
(11, 22, 23, 'paquet'),
(12, 24, 25, 'paquet'),
(13, 26, 27, 'paquet'),
(14, 28, 29, 'paquet'),
(15, 30, 31, 'paquet'),
(16, 32, 33, 'paquet'),
(17, 34, 35, 'paquet'),
(18, 36, 37, 'paquet'),
(19, 38, 39, 'paquet'),
(20, 40, 41, 'paquet'),
(21, 42, 43, 'paquet'),
(22, 44, 45, 'paquet'),
(23, 46, 47, 'paquet'),
(24, 48, 49, 'paquet'),
(25, 50, 51, 'paquet'),
(26, 52, 53, 'paquet'),
(27, 54, 55, 'detail'),
(28, 56, 57, 'detail'),
(29, 58, 59, 'detail'),
(30, 60, 61, 'detail'),
(31, 62, 63, 'detail'),
(32, 64, 65, 'detail'),
(33, 66, 67, 'paquet'),
(34, 68, 69, 'detail'),
(35, 70, 71, 'detail'),
(36, 72, 73, 'detail'),
(37, 74, 75, 'detail'),
(38, 76, 77, 'detail'),
(39, 76, 78, 'paquet'),
(40, 79, 80, 'paquet'),
(41, 81, 82, 'paquet'),
(42, 83, 84, 'detail'),
(43, 83, 85, 'paquet'),
(44, 86, 87, 'detail'),
(45, 88, 89, 'detail'),
(46, 90, 91, 'detail'),
(47, 92, 93, 'detail'),
(48, 94, 95, 'detail'),
(49, 96, 97, 'detail'),
(50, 98, 99, 'detail'),
(51, 100, 101, 'detail'),
(52, 102, 103, 'detail'),
(53, 104, 105, 'detail'),
(54, 106, 107, 'detail'),
(55, 108, 109, 'detail'),
(56, 110, 111, 'detail'),
(57, 112, 113, 'detail'),
(58, 114, 115, 'detail'),
(59, 116, 117, 'detail'),
(60, 118, 119, 'detail'),
(61, 120, 121, 'detail'),
(62, 122, 123, 'detail'),
(63, 124, 125, 'paquet'),
(64, 126, 127, 'detail'),
(65, 128, 129, 'detail'),
(66, 130, 131, 'detail'),
(67, 132, 133, 'detail'),
(68, 134, 135, 'detail'),
(69, 136, 137, 'detail'),
(70, 138, 139, 'detail'),
(71, 140, 141, 'detail'),
(72, 143, 144, 'detail'),
(73, 145, 146, 'paquet'),
(74, 147, 148, 'detail'),
(75, 149, 150, 'detail'),
(76, 151, 152, 'detail'),
(77, 153, 154, 'detail'),
(78, 155, 156, 'detail'),
(79, 155, 157, 'paquet'),
(80, 158, 159, 'detail'),
(81, 160, 161, 'detail'),
(82, 162, 163, 'detail'),
(83, 164, 165, 'detail'),
(84, 166, 167, 'detail'),
(85, 168, 169, 'detail'),
(86, 170, 171, 'detail'),
(87, 172, 173, 'detail'),
(88, 174, 175, 'detail'),
(89, 176, 177, 'detail'),
(90, 178, 179, 'detail'),
(91, 180, 181, 'detail'),
(92, 182, 183, 'detail'),
(93, 184, 185, 'detail'),
(94, 186, 187, 'detail'),
(95, 188, 189, 'detail'),
(96, 190, 191, 'detail'),
(97, 192, 193, 'detail'),
(98, 194, 195, 'detail'),
(99, 196, 197, 'detail'),
(100, 198, 199, 'detail'),
(101, 200, 201, 'detail'),
(102, 202, 203, 'detail'),
(103, 204, 205, 'detail'),
(104, 206, 207, 'detail'),
(105, 208, 209, 'detail'),
(106, 210, 211, 'detail'),
(107, 212, 213, 'paquet'),
(108, 214, 215, 'paquet'),
(109, 217, 218, 'detail'),
(110, 219, 220, 'detail'),
(111, 221, 222, 'detail'),
(112, 223, 224, 'detail'),
(113, 225, 226, 'detail'),
(114, 227, 228, 'detail'),
(115, 229, 230, 'detail'),
(116, 231, 232, 'detail'),
(117, 233, 234, 'detail'),
(118, 235, 236, 'detail'),
(119, 237, 238, 'detail'),
(120, 239, 240, 'paquet'),
(121, 241, 242, 'detail'),
(122, 243, 244, 'paquet'),
(123, 245, 246, 'paquet'),
(124, 247, 248, 'paquet'),
(125, 249, 250, 'paquet'),
(126, 251, 252, 'paquet'),
(127, 254, 255, 'detail'),
(128, 256, 257, 'detail'),
(129, 258, 259, 'detail'),
(130, 260, 261, 'detail'),
(131, 262, 263, 'detail'),
(132, 265, 266, 'detail'),
(133, 267, 268, 'detail'),
(134, 270, 271, 'detail'),
(135, 272, 273, 'detail'),
(136, 274, 275, 'detail'),
(137, 276, 277, 'detail'),
(138, 278, 279, 'paquet'),
(139, 280, 281, 'paquet'),
(140, 282, 283, 'paquet'),
(141, 284, 285, 'paquet'),
(142, 286, 287, 'paquet'),
(143, 288, 289, 'paquet'),
(144, 290, 291, 'paquet'),
(145, 292, 293, 'paquet'),
(146, 294, 295, 'detail'),
(147, 296, 297, 'detail'),
(148, 298, 299, 'detail'),
(149, 300, 301, 'detail'),
(150, 302, 303, 'detail'),
(151, 304, 305, 'detail'),
(152, 306, 307, 'detail'),
(153, 308, 309, 'detail'),
(154, 310, 311, 'detail'),
(155, 312, 313, 'detail'),
(156, 314, 315, 'detail'),
(157, 316, 317, 'detail'),
(158, 318, 319, 'detail'),
(159, 320, 321, 'detail'),
(160, 322, 323, 'detail'),
(161, 324, 325, 'detail'),
(162, 326, 327, 'detail'),
(163, 328, 329, 'detail'),
(164, 331, 332, 'detail'),
(165, 333, 334, 'detail'),
(166, 335, 336, 'detail'),
(167, 337, 338, 'detail'),
(168, 339, 340, 'paquet'),
(169, 341, 342, 'paquet'),
(170, 343, 344, 'paquet'),
(171, 345, 346, 'paquet'),
(172, 347, 348, 'paquet'),
(173, 349, 350, 'paquet'),
(174, 351, 352, 'paquet'),
(175, 353, 354, 'paquet'),
(176, 355, 356, 'paquet'),
(177, 357, 358, 'paquet'),
(178, 359, 360, 'paquet'),
(179, 362, 363, 'paquet'),
(180, 364, 365, 'paquet'),
(181, 366, 367, 'paquet'),
(182, 368, 369, 'paquet'),
(183, 370, 371, 'paquet'),
(184, 372, 373, 'paquet'),
(185, 374, 375, 'paquet'),
(186, 376, 377, 'paquet'),
(187, 378, 379, 'paquet'),
(188, 380, 381, 'paquet'),
(189, 382, 383, 'paquet'),
(190, 384, 385, 'paquet'),
(191, 386, 387, 'paquet'),
(192, 388, 389, 'paquet'),
(193, 390, 391, 'paquet'),
(194, 392, 393, 'paquet'),
(195, 394, 395, 'paquet'),
(196, 396, 397, 'paquet'),
(197, 398, 399, 'paquet'),
(198, 400, 401, 'paquet'),
(199, 402, 403, 'paquet'),
(200, 404, 405, 'paquet'),
(201, 406, 407, 'paquet'),
(202, 408, 409, 'paquet'),
(203, 410, 411, 'paquet'),
(204, 412, 413, 'paquet'),
(205, 414, 415, 'paquet'),
(206, 416, 417, 'paquet'),
(207, 418, 419, 'paquet'),
(208, 420, 421, 'paquet'),
(209, 422, 423, 'paquet'),
(210, 424, 425, 'paquet'),
(211, 426, 427, 'paquet'),
(212, 428, 429, 'paquet'),
(213, 430, 431, 'paquet'),
(214, 432, 433, 'paquet'),
(215, 434, 435, 'paquet'),
(216, 436, 437, 'paquet'),
(217, 438, 439, 'paquet'),
(218, 440, 441, 'paquet'),
(219, 442, 443, 'paquet'),
(220, 444, 445, 'paquet'),
(221, 446, 447, 'paquet'),
(222, 448, 449, 'paquet'),
(223, 450, 451, 'paquet'),
(224, 452, 453, 'paquet'),
(225, 454, 455, 'paquet'),
(226, 456, 457, 'paquet'),
(227, 458, 459, 'paquet'),
(228, 460, 461, 'paquet'),
(229, 462, 463, 'detail'),
(230, 464, 465, 'detail'),
(231, 466, 467, 'detail'),
(232, 469, 470, 'paquet'),
(233, 471, 472, 'paquet'),
(234, 473, 474, 'paquet'),
(235, 475, 476, 'paquet'),
(236, 477, 478, 'paquet'),
(237, 479, 480, 'paquet'),
(238, 481, 482, 'paquet'),
(239, 483, 484, 'paquet'),
(240, 485, 486, 'paquet'),
(241, 487, 488, 'paquet'),
(242, 489, 490, 'paquet'),
(243, 491, 492, 'paquet'),
(244, 493, 494, 'paquet'),
(245, 495, 496, 'paquet'),
(246, 497, 498, 'paquet'),
(247, 499, 500, 'paquet'),
(248, 501, 502, 'paquet'),
(249, 503, 504, 'paquet'),
(250, 505, 506, 'paquet'),
(251, 507, 508, 'paquet'),
(252, 509, 510, 'paquet'),
(253, 511, 512, 'paquet'),
(254, 513, 514, 'paquet'),
(255, 515, 516, 'paquet'),
(256, 517, 518, 'detail'),
(257, 519, 520, 'detail'),
(258, 521, 522, 'detail'),
(259, 523, 524, 'paquet'),
(260, 525, 526, 'detail'),
(261, 525, 527, 'paquet'),
(262, 528, 529, 'detail'),
(263, 528, 530, 'paquet'),
(264, 531, 532, 'detail'),
(265, 531, 533, 'paquet'),
(266, 534, 535, 'detail'),
(267, 534, 536, 'paquet'),
(268, 537, 538, 'detail'),
(269, 537, 539, 'paquet'),
(270, 540, 541, 'detail'),
(271, 540, 542, 'paquet'),
(272, 543, 544, 'detail'),
(273, 543, 545, 'paquet'),
(274, 546, 547, 'paquet'),
(275, 548, 549, 'paquet'),
(276, 550, 551, 'paquet'),
(277, 552, 553, 'paquet'),
(278, 567, 568, 'detail'),
(279, 569, 570, 'detail'),
(280, 569, 571, 'paquet'),
(281, 572, 573, 'detail'),
(282, 572, 574, 'paquet'),
(283, 575, 576, 'detail'),
(284, 575, 577, 'paquet'),
(285, 578, 579, 'paquet'),
(286, 580, 581, 'paquet'),
(287, 582, 583, 'paquet'),
(288, 584, 585, 'detail'),
(289, 586, 587, 'detail'),
(290, 588, 589, 'paquet'),
(291, 590, 591, 'paquet'),
(292, 592, 593, 'paquet');

-- --------------------------------------------------------

--
-- Structure de la table `licence`
--

DROP TABLE IF EXISTS `licence`;
CREATE TABLE IF NOT EXISTS `licence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entreprise_id` int(11) NOT NULL,
  `numero_licence` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_debut` date NOT NULL,
  `datefin` date NOT NULL,
  `statut` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `statut_site_web` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1DAAE648A4AEAFEA` (`entreprise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `licence`
--

INSERT INTO `licence` (`id`, `entreprise_id`, `numero_licence`, `date_debut`, `datefin`, `statut`, `statut_site_web`) VALUES
(1, 1, 'l000051', '2023-08-30', '2024-08-30', 'actif', 'nok');

-- --------------------------------------------------------

--
-- Structure de la table `lieux_ventes`
--

DROP TABLE IF EXISTS `lieux_ventes`;
CREATE TABLE IF NOT EXISTS `lieux_ventes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entreprise_id` int(11) NOT NULL,
  `gestionnaire_id` int(11) DEFAULT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pays` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ville` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `initial` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_commerce` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lieu` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8FE8FCB7A4AEAFEA` (`entreprise_id`),
  KEY `IDX_8FE8FCB76885AC1B` (`gestionnaire_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lieux_ventes`
--

INSERT INTO `lieux_ventes` (`id`, `entreprise_id`, `gestionnaire_id`, `adresse`, `pays`, `region`, `ville`, `telephone`, `email`, `latitude`, `longitude`, `initial`, `type_commerce`, `lieu`) VALUES
(1, 1, 7, 'Madina', 'Guinée', 'Conakry', 'Conakry', '620401473', NULL, NULL, NULL, 'bmt', 'Commerce Générale', 'Madina');

-- --------------------------------------------------------

--
-- Structure de la table `liste_inventaire`
--

DROP TABLE IF EXISTS `liste_inventaire`;
CREATE TABLE IF NOT EXISTS `liste_inventaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `personnel_id` int(11) NOT NULL,
  `lieu_vente_id` int(11) NOT NULL,
  `date_creation` date NOT NULL,
  `description` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2163BD761C109075` (`personnel_id`),
  KEY `IDX_2163BD76AA2B41DC` (`lieu_vente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `liste_product_achat_fournisseur`
--

DROP TABLE IF EXISTS `liste_product_achat_fournisseur`;
CREATE TABLE IF NOT EXISTS `liste_product_achat_fournisseur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `achat_fournisseur_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `stock_id` int(11) DEFAULT NULL,
  `personnel_id` int(11) NOT NULL,
  `quantite` double NOT NULL,
  `prix_achat` decimal(13,2) DEFAULT NULL,
  `prix_revient` decimal(13,2) DEFAULT NULL,
  `date_saisie` datetime NOT NULL,
  `commentaire` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `taux` double DEFAULT NULL,
  `quantite_livre` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_62BFDB83EE4462DB` (`achat_fournisseur_id`),
  KEY `IDX_62BFDB834584665A` (`product_id`),
  KEY `IDX_62BFDB83DCD6110` (`stock_id`),
  KEY `IDX_62BFDB831C109075` (`personnel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `liste_product_achat_fournisseur_frais`
--

DROP TABLE IF EXISTS `liste_product_achat_fournisseur_frais`;
CREATE TABLE IF NOT EXISTS `liste_product_achat_fournisseur_frais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `achat_fournisseur_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `personnel_id` int(11) NOT NULL,
  `quantite` double DEFAULT NULL,
  `prix_achat` decimal(13,2) DEFAULT NULL,
  `frais` double DEFAULT NULL,
  `commentaire` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `taux` double DEFAULT NULL,
  `date_saisie` datetime NOT NULL,
  `prix_vente` decimal(13,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C73BC9B8EE4462DB` (`achat_fournisseur_id`),
  KEY `IDX_C73BC9B84584665A` (`product_id`),
  KEY `IDX_C73BC9B81C109075` (`personnel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `liste_product_achat_fournisseur_multiple`
--

DROP TABLE IF EXISTS `liste_product_achat_fournisseur_multiple`;
CREATE TABLE IF NOT EXISTS `liste_product_achat_fournisseur_multiple` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `liste_product_achat_id` int(11) NOT NULL,
  `personnel_id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `quantite` double NOT NULL,
  `commentaire` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_saisie` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BCD9FFBC71EC7B3D` (`liste_product_achat_id`),
  KEY `IDX_BCD9FFBC1C109075` (`personnel_id`),
  KEY `IDX_BCD9FFBCDCD6110` (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `liste_product_bon_fournisseur`
--

DROP TABLE IF EXISTS `liste_product_bon_fournisseur`;
CREATE TABLE IF NOT EXISTS `liste_product_bon_fournisseur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bon_fournisseur_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantite` double NOT NULL,
  `prix_achat` decimal(13,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9273D48E4506587E` (`bon_fournisseur_id`),
  KEY `IDX_9273D48E4584665A` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `liste_stock`
--

DROP TABLE IF EXISTS `liste_stock`;
CREATE TABLE IF NOT EXISTS `liste_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lieu_vente_id` int(11) NOT NULL,
  `responsable_id` int(11) NOT NULL,
  `nom_stock` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surface` double DEFAULT NULL,
  `nbre_pieces` int(11) DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_54CD82CEAA2B41DC` (`lieu_vente_id`),
  KEY `IDX_54CD82CE53C59D72` (`responsable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `liste_stock`
--

INSERT INTO `liste_stock` (`id`, `lieu_vente_id`, `responsable_id`, `nom_stock`, `adresse`, `surface`, `nbre_pieces`, `type`) VALUES
(2, 1, 7, 'magasin principal', 'Madina', 1500, NULL, 'vente'),
(3, 1, 7, 'stock1', 'madina', 12222, NULL, 'stock');

-- --------------------------------------------------------

--
-- Structure de la table `liste_transfert_product`
--

DROP TABLE IF EXISTS `liste_transfert_product`;
CREATE TABLE IF NOT EXISTS `liste_transfert_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `stock_depart_id` int(11) NOT NULL,
  `stock_recep_id` int(11) DEFAULT NULL,
  `personnel_id` int(11) NOT NULL,
  `transfert_id` int(11) NOT NULL,
  `quantite` double NOT NULL,
  `quantite_recep` double DEFAULT NULL,
  `comentaire` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_transfert` datetime NOT NULL,
  `date_reception` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F383D2354584665A` (`product_id`),
  KEY `IDX_F383D235369F18A3` (`stock_depart_id`),
  KEY `IDX_F383D235309247F3` (`stock_recep_id`),
  KEY `IDX_F383D2351C109075` (`personnel_id`),
  KEY `IDX_F383D2353C9C4BAD` (`transfert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `livraison`
--

DROP TABLE IF EXISTS `livraison`;
CREATE TABLE IF NOT EXISTS `livraison` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commande_id` int(11) NOT NULL,
  `saisie_par_id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `quantite_liv` double NOT NULL,
  `date_livraison` datetime NOT NULL,
  `date_saisie` datetime NOT NULL,
  `commentaire` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A60C9F1F82EA2E54` (`commande_id`),
  KEY `IDX_A60C9F1FC74AC7FE` (`saisie_par_id`),
  KEY `IDX_A60C9F1FDCD6110` (`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `livraison`
--

INSERT INTO `livraison` (`id`, `commande_id`, `saisie_par_id`, `stock_id`, `quantite_liv`, `date_livraison`, `date_saisie`, `commentaire`) VALUES
(27, 27, 9, 2, 2, '2024-07-16 15:33:43', '2024-07-16 15:33:43', 'livraison direct'),
(28, 28, 9, 2, 2, '2024-07-16 15:33:43', '2024-07-16 15:33:43', 'livraison direct'),
(29, 29, 9, 2, 1, '2024-07-16 15:33:43', '2024-07-16 15:33:43', 'livraison direct'),
(30, 30, 9, 2, 1, '2024-07-16 15:33:43', '2024-07-16 15:33:43', 'livraison direct'),
(31, 31, 9, 2, 2, '2024-07-16 15:33:43', '2024-07-16 15:33:43', 'livraison direct'),
(32, 32, 9, 2, 4, '2024-07-16 15:33:43', '2024-07-16 15:33:43', 'livraison direct'),
(33, 33, 9, 2, 5, '2024-07-16 15:33:43', '2024-07-16 15:33:43', 'livraison direct'),
(34, 34, 9, 2, 12, '2024-07-16 15:33:43', '2024-07-16 15:33:43', 'livraison direct'),
(35, 35, 9, 2, 1, '2024-07-16 15:33:43', '2024-07-16 15:33:43', 'livraison direct'),
(36, 36, 9, 2, 1, '2024-07-16 15:33:43', '2024-07-16 15:33:43', 'livraison direct'),
(37, 37, 9, 2, 1, '2024-07-16 15:33:43', '2024-07-16 15:33:43', 'livraison direct'),
(38, 38, 9, 2, 10, '2024-07-16 15:33:43', '2024-07-16 15:33:43', 'livraison direct'),
(39, 39, 9, 2, 1, '2024-07-16 15:57:58', '2024-07-16 15:57:58', 'livraison direct');

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `messenger_messages`
--

INSERT INTO `messenger_messages` (`id`, `body`, `headers`, `queue_name`, `created_at`, `available_at`, `delivered_at`) VALUES
(1, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:71:\\\"Téléphone: 62855555\nEmail: \nPrénom: dfgdzf\nNom: \nMessage: vsdsdgsdfg\\\";i:1;s:5:\\\"utf-8\\\";i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:22:\\\"malalkoula24@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:10:\\\"koulamatco\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:22:\\\"malalkoula24@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:14:\\\"demande client\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-01-30 13:56:30', '2024-01-30 13:56:30', NULL),
(2, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:68:\\\"Téléphone: 56453453\nEmail: \nPrénom: dqfd\nNom: \nMessage: dfsqfdsfd\\\";i:1;s:5:\\\"utf-8\\\";i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:22:\\\"malalkoula24@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:10:\\\"koulamatco\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:22:\\\"malalkoula24@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:14:\\\"demande client\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-01-30 13:59:03', '2024-01-30 13:59:03', NULL),
(3, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:63:\\\"Téléphone: 6666\nEmail: \nPrénom: dfgfd\nNom: \nMessage: fgfdgfd\\\";i:1;s:5:\\\"utf-8\\\";i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:22:\\\"malalkoula24@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:10:\\\"koulamatco\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:22:\\\"malalkoula24@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:14:\\\"demande client\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-01-30 14:02:00', '2024-01-30 14:02:00', NULL),
(4, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:67:\\\"Téléphone: 6666\nEmail: \nPrénom: sdfqsd\nNom: \nMessage: sqdcqsfdqf\\\";i:1;s:5:\\\"utf-8\\\";i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:22:\\\"malalkoula24@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:10:\\\"koulamatco\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:22:\\\"malalkoula24@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:14:\\\"demande client\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-01-30 14:04:12', '2024-01-30 14:04:12', NULL),
(5, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:65:\\\"Téléphone: 55\nEmail: \nPrénom: sqdqsf\nNom: \nMessage: dqsdfdqfdq\\\";i:1;s:5:\\\"utf-8\\\";i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:22:\\\"malalkoula24@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:10:\\\"koulamatco\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:22:\\\"malalkoula24@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:14:\\\"demande client\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-01-30 14:05:01', '2024-01-30 14:05:01', NULL),
(6, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:67:\\\"Téléphone: 66666\nEmail: \nPrénom: dqdsf\nNom: \nMessage: ddqsfffffv\\\";i:1;s:5:\\\"utf-8\\\";i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:22:\\\"malalkoula24@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:10:\\\"koulamatco\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:22:\\\"malalkoula24@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:14:\\\"demande client\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-01-30 14:05:56', '2024-01-30 14:05:56', NULL),
(7, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:68:\\\"Téléphone: 628196628\nEmail: \nPrénom: ssdds\nNom: \nMessage: sxsqdsd\\\";i:1;s:5:\\\"utf-8\\\";i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:31:\\\"responsableachat@koulamatco.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:10:\\\"koulamatco\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:24:\\\"d.amadoumouctar@yahoo.fr\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:14:\\\"Demande client\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-02-06 09:06:36', '2024-02-06 09:06:36', NULL),
(8, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:97:\\\"Téléphone: 6281415169\nEmail: d.amadoumouctar@yahoo.fr\nPrénom: amadou\nNom: diallo\nMessage: SFdf\\\";i:1;s:5:\\\"utf-8\\\";i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:29:\\\"demande-client@koulamatco.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:10:\\\"koulamatco\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:24:\\\"d.amadoumouctar@yahoo.fr\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:14:\\\"Demande client\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-02-08 15:14:56', '2024-02-08 15:14:56', NULL),
(9, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:109:\\\"Téléphone: 6281415169\nEmail: d.amadoumouctar@yahoo.fr\nPrénom: amadou\nNom: diallo\nMessage: ceci est un test\\\";i:1;s:5:\\\"utf-8\\\";i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:29:\\\"demande-client@koulamatco.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:10:\\\"koulamatco\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:24:\\\"d.amadoumouctar@yahoo.fr\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:14:\\\"Demande client\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-02-09 11:50:59', '2024-02-09 11:50:59', NULL),
(10, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:103:\\\"Téléphone: 6281415169\nEmail: d.amadoumouctar@yahoo.fr\nPrénom: amadou\nNom: diallo\nMessage: fgfqsfgsfg\\\";i:1;s:5:\\\"utf-8\\\";i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:29:\\\"demande-client@koulamatco.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:10:\\\"koulamatco\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:24:\\\"d.amadoumouctar@yahoo.fr\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:14:\\\"Demande client\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-02-09 11:52:14', '2024-02-09 11:52:14', NULL),
(11, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:28:\\\"Sending emails is fun again!\\\";i:1;s:5:\\\"utf-8\\\";i:2;s:56:\\\"<p>See Twig integration for better HTML integration!</p>\\\";i:3;s:5:\\\"utf-8\\\";i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:17:\\\"hello@example.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:15:\\\"you@example.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:24:\\\"Time for Symfony Mailer!\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-02-09 12:01:43', '2024-02-09 12:01:43', NULL),
(12, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:28:\\\"Sending emails is fun again!\\\";i:1;s:5:\\\"utf-8\\\";i:2;s:56:\\\"<p>See Twig integration for better HTML integration!</p>\\\";i:3;s:5:\\\"utf-8\\\";i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:17:\\\"hello@example.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:15:\\\"you@example.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:24:\\\"Time for Symfony Mailer!\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-02-09 12:04:55', '2024-02-09 12:04:55', NULL),
(13, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:28:\\\"Sending emails is fun again!\\\";i:1;s:5:\\\"utf-8\\\";i:2;s:56:\\\"<p>See Twig integration for better HTML integration!</p>\\\";i:3;s:5:\\\"utf-8\\\";i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:17:\\\"hello@example.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:15:\\\"you@example.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:24:\\\"Time for Symfony Mailer!\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-02-09 12:07:43', '2024-02-09 12:07:43', NULL),
(14, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:28:\\\"Sending emails is fun again!\\\";i:1;s:5:\\\"utf-8\\\";i:2;s:56:\\\"<p>See Twig integration for better HTML integration!</p>\\\";i:3;s:5:\\\"utf-8\\\";i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:17:\\\"hello@example.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:15:\\\"you@example.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:24:\\\"Time for Symfony Mailer!\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-02-09 12:09:09', '2024-02-09 12:09:09', NULL);
INSERT INTO `messenger_messages` (`id`, `body`, `headers`, `queue_name`, `created_at`, `available_at`, `delivered_at`) VALUES
(15, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:28:\\\"Sending emails is fun again!\\\";i:1;s:5:\\\"utf-8\\\";i:2;s:56:\\\"<p>See Twig integration for better HTML integration!</p>\\\";i:3;s:5:\\\"utf-8\\\";i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:17:\\\"hello@example.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:15:\\\"you@example.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:24:\\\"Time for Symfony Mailer!\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-02-09 12:31:25', '2024-02-09 12:31:25', NULL),
(16, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:28:\\\"Sending emails is fun again!\\\";i:1;s:5:\\\"utf-8\\\";i:2;s:56:\\\"<p>See Twig integration for better HTML integration!</p>\\\";i:3;s:5:\\\"utf-8\\\";i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:17:\\\"hello@example.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:15:\\\"you@example.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:24:\\\"Time for Symfony Mailer!\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-02-09 12:36:19', '2024-02-09 12:36:19', NULL),
(17, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:28:\\\"Sending emails is fun again!\\\";i:1;s:5:\\\"utf-8\\\";i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:17:\\\"hello@example.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:15:\\\"you@example.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:24:\\\"Time for Symfony Mailer!\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-02-09 12:38:49', '2024-02-09 12:38:49', NULL),
(18, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:28:\\\"Sending emails is fun again!\\\";i:1;s:5:\\\"utf-8\\\";i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:17:\\\"hello@example.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:15:\\\"you@example.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:24:\\\"Time for Symfony Mailer!\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-02-09 12:42:20', '2024-02-09 12:42:20', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `mode_paiement`
--

DROP TABLE IF EXISTS `mode_paiement`;
CREATE TABLE IF NOT EXISTS `mode_paiement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `mode_paiement`
--

INSERT INTO `mode_paiement` (`id`, `designation`) VALUES
(1, 'espèces'),
(2, 'Orange Money'),
(3, 'Virement Bancaire'),
(4, 'Chèque');

-- --------------------------------------------------------

--
-- Structure de la table `modification`
--

DROP TABLE IF EXISTS `modification`;
CREATE TABLE IF NOT EXISTS `modification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collaborateur_id` int(11) DEFAULT NULL,
  `devise_id` int(11) DEFAULT NULL,
  `caisse_id` int(11) DEFAULT NULL,
  `traite_par_id` int(11) DEFAULT NULL,
  `decaissement_id` int(11) DEFAULT NULL,
  `depense_id` int(11) DEFAULT NULL,
  `versement_id` int(11) DEFAULT NULL,
  `montant` decimal(13,2) DEFAULT NULL,
  `origine` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_saisie` datetime NOT NULL,
  `date_operation` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_EF6425D2A848E3B1` (`collaborateur_id`),
  KEY `IDX_EF6425D2F4445056` (`devise_id`),
  KEY `IDX_EF6425D227B4FEBF` (`caisse_id`),
  KEY `IDX_EF6425D2167FABE8` (`traite_par_id`),
  KEY `IDX_EF6425D299E4C234` (`decaissement_id`),
  KEY `IDX_EF6425D241D81563` (`depense_id`),
  KEY `IDX_EF6425D2DBBF8D62` (`versement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `modification_facture`
--

DROP TABLE IF EXISTS `modification_facture`;
CREATE TABLE IF NOT EXISTS `modification_facture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `facture_id` int(11) NOT NULL,
  `caisse_id` int(11) DEFAULT NULL,
  `lieu_vente_id` int(11) NOT NULL,
  `saisie_par_id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `mode_paie_id` int(11) DEFAULT NULL,
  `total_facture` decimal(13,2) DEFAULT NULL,
  `montant_paye` decimal(13,2) DEFAULT NULL,
  `montant_remise` decimal(13,2) DEFAULT NULL,
  `frais_sup` decimal(13,2) DEFAULT NULL,
  `nom_client_cash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `etat` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `etat_livraison` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_facturation` datetime NOT NULL,
  `date_saisie` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6A92FF757F2DEE08` (`facture_id`),
  KEY `IDX_6A92FF7527B4FEBF` (`caisse_id`),
  KEY `IDX_6A92FF75AA2B41DC` (`lieu_vente_id`),
  KEY `IDX_6A92FF75C74AC7FE` (`saisie_par_id`),
  KEY `IDX_6A92FF7519EB6921` (`client_id`),
  KEY `IDX_6A92FF7562E04A07` (`mode_paie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `modif_decaissement`
--

DROP TABLE IF EXISTS `modif_decaissement`;
CREATE TABLE IF NOT EXISTS `modif_decaissement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `decaissement_id` int(11) DEFAULT NULL,
  `traite_par_id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `devise_id` int(11) DEFAULT NULL,
  `caisse_id` int(11) DEFAULT NULL,
  `depense_id` int(11) DEFAULT NULL,
  `date_modification` datetime NOT NULL,
  `montant` decimal(13,2) DEFAULT NULL,
  `origine` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DBDC7D8E99E4C234` (`decaissement_id`),
  KEY `IDX_DBDC7D8E167FABE8` (`traite_par_id`),
  KEY `IDX_DBDC7D8E19EB6921` (`client_id`),
  KEY `IDX_DBDC7D8EF4445056` (`devise_id`),
  KEY `IDX_DBDC7D8E27B4FEBF` (`caisse_id`),
  KEY `IDX_DBDC7D8E41D81563` (`depense_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `mouvement_caisse`
--

DROP TABLE IF EXISTS `mouvement_caisse`;
CREATE TABLE IF NOT EXISTS `mouvement_caisse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lieu_vente_id` int(11) NOT NULL,
  `caisse_id` int(11) NOT NULL,
  `categorie_operation_id` int(11) NOT NULL,
  `compte_operation_id` int(11) NOT NULL,
  `devise_id` int(11) NOT NULL,
  `decaissement_id` int(11) DEFAULT NULL,
  `avance_salaire_id` int(11) DEFAULT NULL,
  `paiement_salaire_id` int(11) DEFAULT NULL,
  `depense_id` int(11) DEFAULT NULL,
  `versement_id` int(11) DEFAULT NULL,
  `transfert_fond_id` int(11) DEFAULT NULL,
  `cheque_espece_id` int(11) DEFAULT NULL,
  `recette_id` int(11) DEFAULT NULL,
  `facturation_id` int(11) DEFAULT NULL,
  `mode_paie_id` int(11) DEFAULT NULL,
  `retour_product_id` int(11) DEFAULT NULL,
  `echange_id` int(11) DEFAULT NULL,
  `saisie_par_id` int(11) DEFAULT NULL,
  `type_mouvement` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `montant` decimal(13,2) NOT NULL,
  `date_operation` datetime NOT NULL,
  `date_saisie` datetime NOT NULL,
  `numero_paie` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banque_cheque` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `taux` double NOT NULL,
  `etat_operation` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_sortie` datetime DEFAULT NULL,
  `type_sortie` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail_sortie` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cloture_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C8E3DDFEAA2B41DC` (`lieu_vente_id`),
  KEY `IDX_C8E3DDFE27B4FEBF` (`caisse_id`),
  KEY `IDX_C8E3DDFE3DAF7301` (`categorie_operation_id`),
  KEY `IDX_C8E3DDFE2886B1E4` (`compte_operation_id`),
  KEY `IDX_C8E3DDFEF4445056` (`devise_id`),
  KEY `IDX_C8E3DDFE99E4C234` (`decaissement_id`),
  KEY `IDX_C8E3DDFE20A4D832` (`avance_salaire_id`),
  KEY `IDX_C8E3DDFEB0B7A971` (`paiement_salaire_id`),
  KEY `IDX_C8E3DDFE41D81563` (`depense_id`),
  KEY `IDX_C8E3DDFEDBBF8D62` (`versement_id`),
  KEY `IDX_C8E3DDFE12B37E1D` (`transfert_fond_id`),
  KEY `IDX_C8E3DDFEFCA48E` (`cheque_espece_id`),
  KEY `IDX_C8E3DDFE89312FE9` (`recette_id`),
  KEY `IDX_C8E3DDFEDBC5F284` (`facturation_id`),
  KEY `IDX_C8E3DDFE62E04A07` (`mode_paie_id`),
  KEY `IDX_C8E3DDFE4EF48CBA` (`retour_product_id`),
  KEY `IDX_C8E3DDFE13713818` (`echange_id`),
  KEY `IDX_C8E3DDFEC74AC7FE` (`saisie_par_id`),
  KEY `IDX_C8E3DDFE3FE4D754` (`cloture_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `mouvement_caisse`
--

INSERT INTO `mouvement_caisse` (`id`, `lieu_vente_id`, `caisse_id`, `categorie_operation_id`, `compte_operation_id`, `devise_id`, `decaissement_id`, `avance_salaire_id`, `paiement_salaire_id`, `depense_id`, `versement_id`, `transfert_fond_id`, `cheque_espece_id`, `recette_id`, `facturation_id`, `mode_paie_id`, `retour_product_id`, `echange_id`, `saisie_par_id`, `type_mouvement`, `montant`, `date_operation`, `date_saisie`, `numero_paie`, `banque_cheque`, `taux`, `etat_operation`, `date_sortie`, `type_sortie`, `detail_sortie`, `cloture_id`) VALUES
(11, 1, 1, 1, 6, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 1, NULL, NULL, 9, 'facturation', 1695000.00, '2024-07-16 15:33:43', '2024-07-16 15:33:43', NULL, NULL, 1, 'non traite', NULL, NULL, NULL, NULL),
(12, 1, 1, 4, 4, 1, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, 1, NULL, NULL, 9, 'versement', 1515000.00, '2024-07-16 00:00:00', '2024-07-16 15:49:35', NULL, NULL, 1, 'non traite', NULL, NULL, NULL, NULL),
(13, 1, 2, 4, 4, 1, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, 2, NULL, NULL, 9, 'versement', 1800000.00, '2024-07-16 00:00:00', '2024-07-16 15:54:12', NULL, NULL, 1, 'non traite', NULL, NULL, NULL, NULL),
(14, 1, 1, 1, 6, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 1, NULL, NULL, 9, 'facturation', 615000.00, '2024-07-16 15:57:58', '2024-07-16 15:57:58', NULL, NULL, 1, 'non traite', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `mouvement_collaborateur`
--

DROP TABLE IF EXISTS `mouvement_collaborateur`;
CREATE TABLE IF NOT EXISTS `mouvement_collaborateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collaborateur_id` int(11) NOT NULL,
  `devise_id` int(11) NOT NULL,
  `caisse_id` int(11) DEFAULT NULL,
  `lieu_vente_id` int(11) NOT NULL,
  `traite_par_id` int(11) NOT NULL,
  `decaissement_id` int(11) DEFAULT NULL,
  `avance_salaire_id` int(11) DEFAULT NULL,
  `versement_id` int(11) DEFAULT NULL,
  `cheque_espece_id` int(11) DEFAULT NULL,
  `ajustement_id` int(11) DEFAULT NULL,
  `achat_fournisseur_id` int(11) DEFAULT NULL,
  `facture_id` int(11) DEFAULT NULL,
  `retour_product_id` int(11) DEFAULT NULL,
  `transfert_cheque_id` int(11) DEFAULT NULL,
  `origine` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `montant` decimal(13,2) DEFAULT NULL,
  `date_operation` datetime NOT NULL,
  `date_saisie` datetime NOT NULL,
  `retour_product_fournisseur_id` int(11) DEFAULT NULL,
  `facture_frais_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C47441A2A848E3B1` (`collaborateur_id`),
  KEY `IDX_C47441A2F4445056` (`devise_id`),
  KEY `IDX_C47441A227B4FEBF` (`caisse_id`),
  KEY `IDX_C47441A2AA2B41DC` (`lieu_vente_id`),
  KEY `IDX_C47441A2167FABE8` (`traite_par_id`),
  KEY `IDX_C47441A299E4C234` (`decaissement_id`),
  KEY `IDX_C47441A220A4D832` (`avance_salaire_id`),
  KEY `IDX_C47441A2DBBF8D62` (`versement_id`),
  KEY `IDX_C47441A2FCA48E` (`cheque_espece_id`),
  KEY `IDX_C47441A2503C6C15` (`ajustement_id`),
  KEY `IDX_C47441A2EE4462DB` (`achat_fournisseur_id`),
  KEY `IDX_C47441A27F2DEE08` (`facture_id`),
  KEY `IDX_C47441A24EF48CBA` (`retour_product_id`),
  KEY `IDX_C47441A2F3F4C2C` (`transfert_cheque_id`),
  KEY `IDX_C47441A2CD76E8DD` (`retour_product_fournisseur_id`),
  KEY `IDX_C47441A2ADAE6335` (`facture_frais_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `mouvement_collaborateur`
--

INSERT INTO `mouvement_collaborateur` (`id`, `collaborateur_id`, `devise_id`, `caisse_id`, `lieu_vente_id`, `traite_par_id`, `decaissement_id`, `avance_salaire_id`, `versement_id`, `cheque_espece_id`, `ajustement_id`, `achat_fournisseur_id`, `facture_id`, `retour_product_id`, `transfert_cheque_id`, `origine`, `montant`, `date_operation`, `date_saisie`, `retour_product_fournisseur_id`, `facture_frais_id`) VALUES
(10, 11, 1, NULL, 1, 9, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'solde initial', -3975000.00, '2024-07-16 12:33:40', '2024-07-16 12:33:40', NULL, NULL),
(11, 12, 1, NULL, 1, 9, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 'ajustement', -1700000.00, '2024-07-16 00:00:00', '2024-07-16 12:40:46', NULL, NULL),
(12, 13, 1, NULL, 1, 9, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 'ajustement', -3027500.00, '2024-07-16 00:00:00', '2024-07-16 12:47:54', NULL, NULL),
(13, 15, 1, NULL, 1, 9, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, 'ajustement', -280000.00, '2024-07-16 00:00:00', '2024-07-16 12:58:15', NULL, NULL),
(14, 15, 1, NULL, 1, 9, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, 'ajustement', -4500000.00, '2024-07-16 00:00:00', '2024-07-16 12:57:37', NULL, NULL),
(15, 16, 1, NULL, 1, 9, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, 'ajustement', -500000.00, '2024-07-16 00:00:00', '2024-07-16 13:11:43', NULL, NULL),
(18, 10, 1, NULL, 1, 9, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, 'ajustement', -1470000.00, '2024-07-16 00:00:00', '2024-07-16 13:22:53', NULL, NULL),
(19, 17, 1, NULL, 1, 9, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, 'ajustement', -1200000.00, '2024-07-16 00:00:00', '2024-07-16 13:31:18', NULL, NULL),
(20, 18, 1, NULL, 1, 9, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, 'ajustement', -3100000.00, '2024-07-16 00:00:00', '2024-07-16 13:37:53', NULL, NULL),
(21, 19, 1, NULL, 1, 9, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, 'ajustement', -2555000.00, '2024-07-16 00:00:00', '2024-07-16 14:13:37', NULL, NULL),
(22, 20, 1, NULL, 1, 9, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, 'ajustement', -1000000.00, '2024-07-16 00:00:00', '2024-07-16 14:18:18', NULL, NULL),
(24, 4, 1, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, 'facturation', 0.00, '2024-07-16 15:33:43', '2024-07-16 15:33:43', NULL, NULL),
(25, 36, 1, NULL, 1, 9, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, 'ajustement', -1515000.00, '2024-07-16 00:00:00', '2024-07-16 15:48:30', NULL, NULL),
(26, 36, 1, 1, 1, 9, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, 'versement', 1515000.00, '2024-07-16 00:00:00', '2024-07-16 15:49:35', NULL, NULL),
(27, 11, 1, 2, 1, 9, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'versement', 1800000.00, '2024-07-16 00:00:00', '2024-07-16 15:54:12', NULL, NULL),
(28, 4, 1, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, 'facturation', 0.00, '2024-07-16 15:57:58', '2024-07-16 15:57:58', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `mouvement_product`
--

DROP TABLE IF EXISTS `mouvement_product`;
CREATE TABLE IF NOT EXISTS `mouvement_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_product_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `lieu_vente_id` int(11) NOT NULL,
  `personnel_id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `inventaire_id` int(11) DEFAULT NULL,
  `anomalie_id` int(11) DEFAULT NULL,
  `transfert_id` int(11) DEFAULT NULL,
  `achat_fournisseur_id` int(11) DEFAULT NULL,
  `livraison_id` int(11) DEFAULT NULL,
  `quantite` double DEFAULT NULL,
  `date_operation` datetime NOT NULL,
  `origine` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `livraison_multiple_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1C8AD1BAEBCD91F6` (`stock_product_id`),
  KEY `IDX_1C8AD1BA4584665A` (`product_id`),
  KEY `IDX_1C8AD1BAAA2B41DC` (`lieu_vente_id`),
  KEY `IDX_1C8AD1BA1C109075` (`personnel_id`),
  KEY `IDX_1C8AD1BA19EB6921` (`client_id`),
  KEY `IDX_1C8AD1BACE430A85` (`inventaire_id`),
  KEY `IDX_1C8AD1BAAEEAB197` (`anomalie_id`),
  KEY `IDX_1C8AD1BA3C9C4BAD` (`transfert_id`),
  KEY `IDX_1C8AD1BAEE4462DB` (`achat_fournisseur_id`),
  KEY `IDX_1C8AD1BA8E54FB25` (`livraison_id`),
  KEY `IDX_1C8AD1BA49809274` (`livraison_multiple_id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `mouvement_product`
--

INSERT INTO `mouvement_product` (`id`, `stock_product_id`, `product_id`, `lieu_vente_id`, `personnel_id`, `client_id`, `inventaire_id`, `anomalie_id`, `transfert_id`, `achat_fournisseur_id`, `livraison_id`, `quantite`, `date_operation`, `origine`, `description`, `livraison_multiple_id`) VALUES
(42, 2, 13, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 100, '2024-07-02 13:20:08', 'appro-initial', 'appro-initial', NULL),
(43, 2, 15, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 20, '2024-07-02 13:20:20', 'appro-initial', 'appro-initial', NULL),
(44, 2, 9, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 100, '2024-07-02 13:20:35', 'appro-initial', 'appro-initial', NULL),
(45, 2, 11, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 50, '2024-07-02 13:20:41', 'appro-initial', 'appro-initial', NULL),
(46, 3, 11, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 70, '2024-07-02 13:22:09', 'appro-initial', 'appro-initial', NULL),
(47, 3, 9, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 10, '2024-07-02 13:22:13', 'appro-initial', 'appro-initial', NULL),
(48, 3, 13, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 50, '2024-07-02 13:22:22', 'appro-initial', 'appro-initial', NULL),
(49, 3, 15, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 25, '2024-07-02 13:22:27', 'appro-initial', 'appro-initial', NULL),
(60, 2, 378, 1, 9, 4, NULL, NULL, NULL, NULL, 27, -1, '2024-07-16 15:33:43', 'liaison produit', 'liaison produit', NULL),
(61, 2, 379, 1, 9, 4, NULL, NULL, NULL, NULL, 27, 20, '2024-07-16 15:33:43', 'liaison produit', 'liaison produit', NULL),
(62, 2, 379, 1, 9, 4, NULL, NULL, NULL, NULL, 27, -2, '2024-07-16 15:33:43', 'vente direct', 'vente direct', NULL),
(63, 2, 402, 1, 9, 4, NULL, NULL, NULL, NULL, 28, -1, '2024-07-16 15:33:43', 'liaison produit', 'liaison produit', NULL),
(64, 2, 403, 1, 9, 4, NULL, NULL, NULL, NULL, 28, 20, '2024-07-16 15:33:43', 'liaison produit', 'liaison produit', NULL),
(65, 2, 403, 1, 9, 4, NULL, NULL, NULL, NULL, 28, -2, '2024-07-16 15:33:43', 'vente direct', 'vente direct', NULL),
(66, 2, 404, 1, 9, 4, NULL, NULL, NULL, NULL, 29, -1, '2024-07-16 15:33:43', 'liaison produit', 'liaison produit', NULL),
(67, 2, 405, 1, 9, 4, NULL, NULL, NULL, NULL, 29, 20, '2024-07-16 15:33:43', 'liaison produit', 'liaison produit', NULL),
(68, 2, 405, 1, 9, 4, NULL, NULL, NULL, NULL, 29, -1, '2024-07-16 15:33:43', 'vente direct', 'vente direct', NULL),
(69, 2, 594, 1, 9, 4, NULL, NULL, NULL, NULL, 30, -1, '2024-07-16 15:33:43', 'vente direct', 'vente direct', NULL),
(70, 2, 223, 1, 9, 4, NULL, NULL, NULL, NULL, 31, -1, '2024-07-16 15:33:43', 'liaison produit', 'liaison produit', NULL),
(71, 2, 224, 1, 9, 4, NULL, NULL, NULL, NULL, 31, 25, '2024-07-16 15:33:43', 'liaison produit', 'liaison produit', NULL),
(72, 2, 224, 1, 9, 4, NULL, NULL, NULL, NULL, 31, -2, '2024-07-16 15:33:43', 'vente direct', 'vente direct', NULL),
(73, 2, 258, 1, 9, 4, NULL, NULL, NULL, NULL, 32, -1, '2024-07-16 15:33:43', 'liaison produit', 'liaison produit', NULL),
(74, 2, 259, 1, 9, 4, NULL, NULL, NULL, NULL, 32, 60, '2024-07-16 15:33:43', 'liaison produit', 'liaison produit', NULL),
(75, 2, 259, 1, 9, 4, NULL, NULL, NULL, NULL, 32, -4, '2024-07-16 15:33:43', 'vente direct', 'vente direct', NULL),
(76, 2, 296, 1, 9, 4, NULL, NULL, NULL, NULL, 33, -1, '2024-07-16 15:33:43', 'liaison produit', 'liaison produit', NULL),
(77, 2, 297, 1, 9, 4, NULL, NULL, NULL, NULL, 33, 24, '2024-07-16 15:33:43', 'liaison produit', 'liaison produit', NULL),
(78, 2, 297, 1, 9, 4, NULL, NULL, NULL, NULL, 33, -5, '2024-07-16 15:33:43', 'vente direct', 'vente direct', NULL),
(79, 2, 235, 1, 9, 4, NULL, NULL, NULL, NULL, 34, -1, '2024-07-16 15:33:43', 'liaison produit', 'liaison produit', NULL),
(80, 2, 236, 1, 9, 4, NULL, NULL, NULL, NULL, 34, 60, '2024-07-16 15:33:43', 'liaison produit', 'liaison produit', NULL),
(81, 2, 236, 1, 9, 4, NULL, NULL, NULL, NULL, 34, -12, '2024-07-16 15:33:43', 'vente direct', 'vente direct', NULL),
(82, 2, 420, 1, 9, 4, NULL, NULL, NULL, NULL, 35, -1, '2024-07-16 15:33:43', 'liaison produit', 'liaison produit', NULL),
(83, 2, 421, 1, 9, 4, NULL, NULL, NULL, NULL, 35, 20, '2024-07-16 15:33:43', 'liaison produit', 'liaison produit', NULL),
(84, 2, 421, 1, 9, 4, NULL, NULL, NULL, NULL, 35, -1, '2024-07-16 15:33:43', 'vente direct', 'vente direct', NULL),
(85, 2, 422, 1, 9, 4, NULL, NULL, NULL, NULL, 36, -1, '2024-07-16 15:33:43', 'liaison produit', 'liaison produit', NULL),
(86, 2, 423, 1, 9, 4, NULL, NULL, NULL, NULL, 36, 20, '2024-07-16 15:33:43', 'liaison produit', 'liaison produit', NULL),
(87, 2, 423, 1, 9, 4, NULL, NULL, NULL, NULL, 36, -1, '2024-07-16 15:33:43', 'vente direct', 'vente direct', NULL),
(88, 2, 298, 1, 9, 4, NULL, NULL, NULL, NULL, 37, -1, '2024-07-16 15:33:43', 'liaison produit', 'liaison produit', NULL),
(89, 2, 299, 1, 9, 4, NULL, NULL, NULL, NULL, 37, 24, '2024-07-16 15:33:43', 'liaison produit', 'liaison produit', NULL),
(90, 2, 299, 1, 9, 4, NULL, NULL, NULL, NULL, 37, -1, '2024-07-16 15:33:43', 'vente direct', 'vente direct', NULL),
(91, 2, 182, 1, 9, 4, NULL, NULL, NULL, NULL, 38, -1, '2024-07-16 15:33:43', 'liaison produit', 'liaison produit', NULL),
(92, 2, 183, 1, 9, 4, NULL, NULL, NULL, NULL, 38, 500, '2024-07-16 15:33:43', 'liaison produit', 'liaison produit', NULL),
(93, 2, 183, 1, 9, 4, NULL, NULL, NULL, NULL, 38, -10, '2024-07-16 15:33:43', 'vente direct', 'vente direct', NULL),
(94, 2, 223, 1, 9, 4, NULL, NULL, NULL, NULL, 39, -1, '2024-07-16 15:57:58', 'vente direct', 'vente direct', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `origine_produit`
--

DROP TABLE IF EXISTS `origine_produit`;
CREATE TABLE IF NOT EXISTS `origine_produit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pays` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `paiement_salaire_personnel`
--

DROP TABLE IF EXISTS `paiement_salaire_personnel`;
CREATE TABLE IF NOT EXISTS `paiement_salaire_personnel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `personnel_id` int(11) NOT NULL,
  `saisie_par_id` int(11) NOT NULL,
  `compte_retrait_id` int(11) NOT NULL,
  `type_paiement_id` int(11) NOT NULL,
  `devise_id` int(11) NOT NULL,
  `lieu_vente_id` int(11) NOT NULL,
  `periode` date NOT NULL,
  `date_saisie` datetime NOT NULL,
  `commentaires` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salaire_brut` decimal(12,2) NOT NULL,
  `prime` decimal(12,2) DEFAULT NULL,
  `avance_salaire` decimal(12,2) DEFAULT NULL,
  `cotisation` decimal(12,2) DEFAULT NULL,
  `salaire_net` decimal(12,2) NOT NULL,
  `heures` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B221A0971C109075` (`personnel_id`),
  KEY `IDX_B221A097C74AC7FE` (`saisie_par_id`),
  KEY `IDX_B221A097B6EC9AC4` (`compte_retrait_id`),
  KEY `IDX_B221A097615593E9` (`type_paiement_id`),
  KEY `IDX_B221A097F4445056` (`devise_id`),
  KEY `IDX_B221A097AA2B41DC` (`lieu_vente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personnel`
--

DROP TABLE IF EXISTS `personnel`;
CREATE TABLE IF NOT EXISTS `personnel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `fonction` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_identite` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_paie` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taux_horaire` double DEFAULT NULL,
  `salaire_base` decimal(10,2) DEFAULT NULL,
  `photo_identite` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signature` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A6BCF3DEA76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `personnel`
--

INSERT INTO `personnel` (`id`, `user_id`, `fonction`, `document_identite`, `type_paie`, `taux_horaire`, `salaire_base`, `photo_identite`, `signature`) VALUES
(3, 6, 'VENDEUR', NULL, 'mensuel', NULL, NULL, NULL, NULL),
(4, 7, 'RESPONSABLE', NULL, 'mensuel', NULL, NULL, NULL, NULL),
(5, 9, 'GESTIONNAIRE', NULL, 'mensuel', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `point_de_vente`
--

DROP TABLE IF EXISTS `point_de_vente`;
CREATE TABLE IF NOT EXISTS `point_de_vente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lieu_vente_id` int(11) NOT NULL,
  `designation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C9182F7BAA2B41DC` (`lieu_vente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `point_de_vente`
--

INSERT INTO `point_de_vente` (`id`, `lieu_vente_id`, `designation`) VALUES
(1, 1, 'magasin principal');

-- --------------------------------------------------------

--
-- Structure de la table `primes_personnel`
--

DROP TABLE IF EXISTS `primes_personnel`;
CREATE TABLE IF NOT EXISTS `primes_personnel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `personnel_id` int(11) NOT NULL,
  `saisie_par_id` int(11) NOT NULL,
  `lieu_vente_id` int(11) NOT NULL,
  `montant` decimal(12,2) NOT NULL,
  `periode` date NOT NULL,
  `date_saisie` datetime NOT NULL,
  `commentaires` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_29C84C671C109075` (`personnel_id`),
  KEY `IDX_29C84C67C74AC7FE` (`saisie_par_id`),
  KEY `IDX_29C84C67AA2B41DC` (`lieu_vente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categorie_id` int(11) NOT NULL,
  `epaisseur_id` int(11) DEFAULT NULL,
  `dimension_id` int(11) DEFAULT NULL,
  `origine_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `reference` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix_vente` decimal(15,2) DEFAULT NULL,
  `code_barre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nbre_piece` float DEFAULT NULL,
  `nbre_paquet` float DEFAULT NULL,
  `type_produit` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nbre_vente` int(11) DEFAULT NULL,
  `statut` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `statut_comptable` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tva` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B3BA5A5ABCF5E72D` (`categorie_id`),
  KEY `IDX_B3BA5A5A35810E93` (`epaisseur_id`),
  KEY `IDX_B3BA5A5A277428AD` (`dimension_id`),
  KEY `IDX_B3BA5A5A87998E` (`origine_id`),
  KEY `IDX_B3BA5A5AC54C8C93` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=597 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `categorie_id`, `epaisseur_id`, `dimension_id`, `origine_id`, `type_id`, `reference`, `designation`, `prix_vente`, `code_barre`, `nbre_piece`, `nbre_paquet`, `type_produit`, `nbre_vente`, `statut`, `statut_comptable`, `tva`) VALUES
(4, 21, NULL, NULL, NULL, NULL, 'ACCESS VT', 'Accessoire Vice Tole', 0.00, NULL, NULL, 10, 'en_gros', NULL, 'actif', 'actif', 0),
(5, 21, NULL, NULL, NULL, NULL, 'ACCESS VTpaq', 'Accessoire Vice Tole paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(6, 27, NULL, NULL, NULL, NULL, 'BGT BRASIL', 'BAGUETTE BRASIL', NULL, NULL, 100, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(7, 27, NULL, NULL, NULL, NULL, 'BGT BRASILdet', 'BAGUETTE BRASIL détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(8, 25, NULL, 121, NULL, NULL, 'BGT FONTE 2.5', 'BAGUETTE FONTE 2.5', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(9, 25, NULL, 121, NULL, NULL, 'BGT FONTEpaq', 'BAGUETTE FONTE 2.5 Paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(10, 25, NULL, 122, NULL, NULL, 'BGT FONTE 3.2', 'BAGUETTE FONTE 3.2', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(11, 25, NULL, 122, NULL, NULL, 'BGT FONTE 3.2paq', 'BAGUETTE FONTE 3.2 Paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(12, 26, NULL, 123, NULL, NULL, 'BGT INOX 2.5', 'BAGUETTE INOX 2.5', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(13, 26, NULL, 123, NULL, NULL, 'BGT INOX 2.5paq', 'BAGUETTE INOX 2.5 Paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(14, 26, NULL, 124, NULL, NULL, 'BGT INOX 3.2', 'BAGUETTE INOX 3.2', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(15, 26, NULL, 124, NULL, NULL, 'BGT INOX 3.2paq', 'BAGUETTE INOX 3.2 Paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(16, 28, NULL, 125, NULL, NULL, 'BGT Ordinaire2.5', 'BAGUETTE ORDINAIRE 2.5', NULL, NULL, NULL, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(17, 28, NULL, 126, NULL, NULL, 'BGT Ordinaire3.2', 'BAGUETTE ORDINAIRE 3.2', NULL, NULL, NULL, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(18, 52, NULL, NULL, NULL, NULL, 'BS 500m', 'Bande de Signalistion,500m', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(19, 52, NULL, NULL, NULL, NULL, 'BS 500Mpaq', 'Bande De Signalistion,500m paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(20, 106, NULL, 256, NULL, NULL, 'BM EN BOIS', 'Brosse Metallique en Bois', NULL, NULL, NULL, 10, 'en_gros', NULL, 'actif', 'actif', 0),
(21, 106, NULL, 256, NULL, NULL, 'BM EN BOISpaq', 'Brosse Metallique En Bois paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(22, 106, NULL, 257, NULL, NULL, 'BM EN PLASTIQUE', 'Brosse Metallique en Plastique', NULL, NULL, NULL, 10, 'en_gros', NULL, 'actif', 'actif', 0),
(23, 106, NULL, 257, NULL, NULL, 'BM EN PLASTIQUEpaq', 'Brosse Metallique En Plastique paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(24, 31, NULL, 131, NULL, NULL, 'Cm en fer', 'Centimetres En fer 3m', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(25, 31, NULL, 131, NULL, NULL, 'CM EN FERpaq', 'Centimetres En Fer 3m paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(26, 31, NULL, 132, NULL, NULL, 'Cm en fer 5m', 'Centimetres En fer 5m', NULL, NULL, NULL, 10, 'en_gros', NULL, 'actif', 'actif', 0),
(27, 31, NULL, 132, NULL, NULL, 'CM EN FER 5Mpaq', 'Centimetres En Fer 5m paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(28, 31, NULL, 133, NULL, NULL, 'Cm en fer 7.5m', 'Centimetres En fer 7.5m', NULL, NULL, NULL, 6, 'en_gros', NULL, 'actif', 'actif', 0),
(29, 31, NULL, 133, NULL, NULL, 'CM EN FER 7.5Mpaq', 'Centimetres En Fer 7.5m paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(30, 32, NULL, 134, NULL, NULL, 'Cm noir 3m', 'Centimetres noirs 3m', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(31, 32, NULL, 134, NULL, NULL, 'CM NOIR 3Mpaq', 'Centimetres Noirs 3m paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(32, 32, NULL, 135, NULL, NULL, 'Cm noir 5m', 'Centimetre noir 5m', NULL, NULL, NULL, 10, 'en_gros', NULL, 'actif', 'actif', 0),
(33, 32, NULL, 135, NULL, NULL, 'CM NOIR 5Mpaq', 'Centimetre Noir 5m paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(34, 32, NULL, 136, NULL, NULL, 'Cm noir 7.5m', 'Centimetre noir 7.5m', NULL, NULL, NULL, 6, 'en_gros', NULL, 'actif', 'actif', 0),
(35, 32, NULL, 136, NULL, NULL, 'CM NOIR 7.5Mpaq', 'Centimetre Noir 7.5m paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(36, 33, NULL, 137, NULL, NULL, 'cm orange 3m', 'Centimetre Orange 3m', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(37, 33, NULL, 137, NULL, NULL, 'CM ORANGE 3Mpaq', 'Centimetre Orange 3m paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(38, 33, NULL, 138, NULL, NULL, 'cm orange 5m', 'Centimetre Orange 5m', NULL, NULL, NULL, 10, 'en_gros', NULL, 'actif', 'actif', 0),
(39, 33, NULL, 138, NULL, NULL, 'CM ORANGE 5Mpaq', 'Centimetre Orange 5m paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(40, 33, NULL, 139, NULL, NULL, 'cm orange 7.5m', 'Centimetre Orange 7.5m', NULL, NULL, NULL, 6, 'en_gros', NULL, 'actif', 'actif', 0),
(41, 33, NULL, 139, NULL, NULL, 'CM ORANGE 7.5Mpaq', 'Centimetre Orange 7.5m paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(42, 30, NULL, 129, NULL, NULL, 'Cm gris 3m', 'Centimetre Gris 3m', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(43, 30, NULL, 129, NULL, NULL, 'CM GRIS 3Mpaq', 'Centimetre Gris 3m paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(44, 30, NULL, 128, NULL, NULL, 'Cm gris 5m', 'Centimetre Gris 5m', NULL, NULL, NULL, 10, 'en_gros', NULL, 'actif', 'actif', 0),
(45, 30, NULL, 128, NULL, NULL, 'CM GRIS 5Mpaq', 'Centimetre Gris 5m paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(46, 30, NULL, 130, NULL, NULL, 'Cm gris 7.5m', 'Centimetre Gris 7.5m', NULL, NULL, NULL, 6, 'en_gros', NULL, 'actif', 'actif', 0),
(47, 30, NULL, 130, NULL, NULL, 'CM GRIS 7.5Mpaq', 'Centimetre Gris 7.5m paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(48, 6, NULL, 19, NULL, NULL, 'CHRB 230 BOSS', 'CHARBON BOSS 230', NULL, NULL, NULL, 3000, 'en_gros', NULL, 'actif', 'actif', 0),
(49, 6, NULL, 19, NULL, NULL, 'CHRB 230 BOSSpaq', 'CHARBON BOSS 230 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(50, 6, NULL, 19, NULL, NULL, 'CHRB 230 MAKITA', 'CHARBON MAKITA 230', NULL, NULL, NULL, 3000, 'en_gros', NULL, 'actif', 'actif', 0),
(51, 6, NULL, 19, NULL, NULL, 'CHRB 230 MAKITApaq', 'CHARBON MAKITA 230 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(52, 6, NULL, 19, NULL, NULL, 'CHRB 230 HITACHI', 'CHARBON  230 HITACHI', NULL, NULL, NULL, 3000, 'en_gros', NULL, 'actif', 'actif', 0),
(53, 6, NULL, 19, NULL, NULL, 'CHRB 230 HITACHIpaq', 'CHARBON  230 HITACHI paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(54, 49, NULL, NULL, NULL, NULL, 'CHARGEUR ULTY', 'CHARGEUR ULTY', NULL, NULL, 50, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(55, 49, NULL, NULL, NULL, NULL, 'CHARGEUR ULTYdet', 'CHARGEUR ULTY détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(56, 50, NULL, NULL, NULL, NULL, 'Batterie ulty', 'Batterie ulty', NULL, NULL, 50, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(57, 50, NULL, NULL, NULL, NULL, 'BATTERIE ULTYdet', 'Batterie Ulty détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(58, 45, NULL, NULL, NULL, NULL, 'Bascule 200KG', 'BASCULE 200KG NOPS', NULL, NULL, 10, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(59, 45, NULL, NULL, NULL, NULL, 'BASCULE 200KGdet', 'BASCULE 200KG NOPS détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(60, 44, NULL, 165, NULL, NULL, 'Bascule Vert 100kg', 'Bascule Vert 100kg', NULL, NULL, 2, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(61, 44, NULL, 165, NULL, NULL, 'BASCULE VERT 100KGdet', 'Bascule Vert 100kg détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(62, 44, NULL, 166, NULL, NULL, 'Bascule Vert 30kg', 'Bascule Vert 30kg', NULL, NULL, 4, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(63, 44, NULL, 166, NULL, NULL, 'BASCULE VERT 30KGdet', 'Bascule Vert 30kg détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(64, 44, NULL, 167, NULL, NULL, 'Bascule Vert 20kg', 'Bascule Vert 20kg', NULL, NULL, 4, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(65, 44, NULL, 167, NULL, NULL, 'BASCULE VERT 20KGdet', 'Bascule Vert 20kg détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(66, 62, NULL, 186, NULL, NULL, 'Balle Tapissier 8mm', 'Balle Tapissier 8mm', NULL, NULL, NULL, 120, 'en_gros', NULL, 'actif', 'actif', 0),
(67, 62, NULL, 186, NULL, NULL, 'BALLE TAPISSIER 8MMpaq', 'Balle Tapissier 8mm paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(68, 63, NULL, NULL, NULL, NULL, 'appareil sillicone', 'Appareil Sillicone', NULL, NULL, 60, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(69, 63, NULL, NULL, NULL, NULL, 'APPAREIL SILLICONEdet', 'Appareil Sillicone détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(70, 37, NULL, 150, NULL, NULL, 'cisaille bisso 36', 'Cisaille Bisso 36', NULL, NULL, 5, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(71, 37, NULL, 150, NULL, NULL, 'CISAILLE BISSO 36det', 'Cisaille Bisso 36 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(72, 37, NULL, 151, NULL, NULL, 'cisaille bisso 42', 'Cisaille Bisso 42', NULL, NULL, 4, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(73, 37, NULL, 151, NULL, NULL, 'CISAILLE BISSO 42det', 'Cisaille Bisso 42 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(74, 37, NULL, 152, NULL, NULL, 'cisaille bisso 48', 'Cisaille Bisso 48', NULL, NULL, 4, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(75, 37, NULL, 152, NULL, NULL, 'CISAILLE BISSO 48det', 'Cisaille Bisso 48 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(76, 70, NULL, 192, NULL, NULL, 'cisaille wiseup 8', 'Cisaille Wiseup 8mm', NULL, NULL, 60, 6, 'en_gros', NULL, 'actif', 'actif', 0),
(77, 70, NULL, 192, NULL, NULL, 'CISAILLE WISEUP 8det', 'Cisaille Wiseup 8mm détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(78, 70, NULL, 192, NULL, NULL, 'CISAILLE WISEUP 8paq', 'Cisaille Wiseup 8mm paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(79, 54, NULL, NULL, NULL, NULL, 'ciseaux menuisier', 'Ciseaux Menuisier', NULL, NULL, NULL, 24, 'en_gros', NULL, 'actif', 'actif', 0),
(80, 54, NULL, NULL, NULL, NULL, 'CISEAUX MENUISIERpaq', 'Ciseaux Menuisier paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(81, 61, NULL, NULL, NULL, NULL, 'ciseaux tapissier', 'Ciseaux Tapissier', NULL, NULL, NULL, 48, 'en_gros', NULL, 'actif', 'actif', 0),
(82, 61, NULL, NULL, NULL, NULL, 'CISEAUX TAPISSIERpaq', 'Ciseaux Tapissier paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(83, 99, NULL, NULL, NULL, NULL, 'controleur pneu', 'Controleur Pneu', NULL, NULL, 50, 5, 'en_gros', NULL, 'actif', 'actif', 0),
(84, 99, NULL, NULL, NULL, NULL, 'CONTROLEUR PNEUdet', 'Controleur Pneu détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(85, 99, NULL, NULL, NULL, NULL, 'CONTROLEUR PNEUpaq', 'Controleur Pneu paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(86, 34, NULL, 140, NULL, NULL, 'decametre 20m', 'Decametre 20m', NULL, NULL, 60, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(87, 34, NULL, 140, NULL, NULL, 'DECAMETRE 20Mdet', 'Decametre 20m détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(88, 34, NULL, 141, NULL, NULL, 'decametre 30m', 'Decametre 30m', NULL, NULL, 60, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(89, 34, NULL, 141, NULL, NULL, 'DECAMETRE 30Mdet', 'Decametre 30m détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(90, 34, NULL, 142, NULL, NULL, 'decametre 50m', 'Decametre 50m', NULL, NULL, 40, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(91, 34, NULL, 142, NULL, NULL, 'DECAMETRE 50Mdet', 'Decametre 50m détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(92, 101, NULL, NULL, NULL, NULL, 'difonçeuse MPT', 'Difonçeuse MPT', NULL, NULL, 3, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(93, 101, NULL, NULL, NULL, NULL, 'DIFONçEUSE MPTdet', 'Difonçeuse MPT détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(94, 40, NULL, 158, NULL, NULL, 'dique a beton 230', 'Disque A beton Wiseup', NULL, NULL, 25, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(95, 40, NULL, 158, NULL, NULL, 'DIQUE A BETON 230det', 'Disque A Beton Wiseup détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(96, 40, NULL, 158, NULL, NULL, 'disque a beton 230 jumlee', 'Disque A Beton 230 JUMLEE', NULL, NULL, 30, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(97, 40, NULL, 158, NULL, NULL, 'DISQUE A BETON 230 JUMLEEdet', 'Disque A Beton 230 JUMLEE détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(98, 40, NULL, 159, NULL, NULL, 'disque a beton 115 jumlee', 'Disque A Beton 115 JUMLEE', NULL, NULL, 120, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(99, 40, NULL, 159, NULL, NULL, 'DISQUE A BETON 115 JUMLEEdet', 'Disque A Beton 115 JUMLEE détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(100, 40, NULL, 159, NULL, NULL, 'disque a beton 115 wiseup', 'Disque A Beton 115 WISEUP', NULL, NULL, 100, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(101, 40, NULL, 159, NULL, NULL, 'DISQUE A BETON 115 WISEUPdet', 'Disque A Beton 115 WISEUP détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(102, 40, NULL, 193, NULL, NULL, 'disque a beton 180 jumlee', 'Disque A Beton 180 JUMLEE', NULL, NULL, 60, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(103, 40, NULL, 193, NULL, NULL, 'DISQUE A BETON 180 JUMLEEdet', 'Disque A Beton 180 JUMLEE détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(104, 39, NULL, 155, NULL, NULL, 'disque a soudure 115x1.0', 'Disque A Soudure 115x1.0', NULL, NULL, 600, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(105, 39, NULL, 155, NULL, NULL, 'DISQUE A SOUDURE 115X1.0det', 'Disque A Soudure 115x1.0 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(106, 39, NULL, 156, NULL, NULL, 'disque a soudure 115x3.0', 'Disque A Soudure 115x3.0', NULL, NULL, 300, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(107, 39, NULL, 156, NULL, NULL, 'DISQUE A SOUDURE 115X3.0det', 'Disque A Soudure 115x3.0 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(108, 39, NULL, 157, NULL, NULL, 'disque a soudure 115x6.0', 'Disque A Soudure 115x6.0', NULL, NULL, 100, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(109, 39, NULL, 157, NULL, NULL, 'DISQUE A SOUDURE 115X6.0det', 'Disque A Soudure 115x6.0 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(110, 39, NULL, 249, NULL, NULL, 'disque a soudure 180x1.0', 'Disque A Soudure 180x1.0', NULL, NULL, 150, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(111, 39, NULL, 249, NULL, NULL, 'DISQUE A SOUDURE 180X1.0det', 'Disque A Soudure 180x1.0 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(112, 39, NULL, 250, NULL, NULL, 'disque a soudure 180x6.0', 'Disque A Soudure 180x6.0', NULL, NULL, 50, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(113, 39, NULL, 250, NULL, NULL, 'DISQUE A SOUDURE 180X6.0det', 'Disque A Soudure 180x6.0 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(114, 39, NULL, 251, NULL, NULL, 'disque a soudure 230x1.0', 'Disque A Soudure 230x1.0', NULL, NULL, 100, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(115, 39, NULL, 251, NULL, NULL, 'DISQUE A SOUDURE 230X1.0det', 'Disque A Soudure 230x1.0 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(116, 92, NULL, 229, NULL, NULL, 'disque en bois 180', 'Disque en Bois 180', NULL, NULL, 100, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(117, 92, NULL, 229, NULL, NULL, 'DISQUE EN BOIS 180det', 'Disque En Bois 180 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(118, 92, NULL, 230, NULL, NULL, 'disque en bois 230', 'Disque en Bois 230', NULL, NULL, 50, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(119, 92, NULL, 230, NULL, NULL, 'DISQUE EN BOIS 230det', 'Disque En Bois 230 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(120, 92, NULL, 231, NULL, NULL, 'disque en bois 300', 'Disque en Bois 300', NULL, NULL, 30, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(121, 92, NULL, 231, NULL, NULL, 'DISQUE EN BOIS 300det', 'Disque En Bois 300 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(122, 92, NULL, 232, NULL, NULL, 'disque en bois 350', 'Disque en Bois 350', NULL, NULL, 25, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(123, 92, NULL, 232, NULL, NULL, 'DISQUE EN BOIS 350det', 'Disque En Bois 350 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(124, 93, NULL, 233, NULL, NULL, 'disque frottage bosshei 115', 'Disque Frottage Bosshei 115', NULL, NULL, NULL, 30, 'en_gros', NULL, 'actif', 'actif', 0),
(125, 93, NULL, 233, NULL, NULL, 'DISQUE FROTTAGE BOSSHEI 115paq', 'Disque Frottage Bosshei 115 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(126, 105, NULL, 254, NULL, NULL, 'ecaire aliminium 10', 'Ecaire Aliminium 10', NULL, NULL, 60, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(127, 105, NULL, 254, NULL, NULL, 'ECAIRE ALIMINIUM 10det', 'Ecaire Aliminium 10 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(128, 105, NULL, 255, NULL, NULL, 'ecaire aliminium 12', 'Ecaire Aliminium 12', NULL, NULL, 60, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(129, 105, NULL, 255, NULL, NULL, 'ECAIRE ALIMINIUM 12det', 'Ecaire Aliminium 12 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(130, 102, NULL, 244, NULL, NULL, 'ecaire jaune 12', 'Ecaire Jaune 12', NULL, NULL, 1, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(131, 102, NULL, 244, NULL, NULL, 'ECAIRE JAUNE 12det', 'Ecaire Jaune 12 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(132, 102, NULL, 245, NULL, NULL, 'ecaire jaune 14', 'Ecaire Jaune 14', NULL, NULL, 120, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(133, 102, NULL, 245, NULL, NULL, 'ECAIRE JAUNE 14det', 'Ecaire Jaune 14 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(134, 102, NULL, 246, NULL, NULL, 'ecaire jaune 16', 'Ecaire Jaune 16', NULL, NULL, 120, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(135, 102, NULL, 246, NULL, NULL, 'ECAIRE JAUNE 16det', 'Ecaire Jaune 16 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(136, 103, NULL, 247, NULL, NULL, 'Ecaire noire grand', 'Ecaire Noir Grand', NULL, NULL, 36, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(137, 103, NULL, 247, NULL, NULL, 'ECAIRE NOIRE GRANDdet', 'Ecaire Noir Grand détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(138, 103, NULL, 248, NULL, NULL, 'Ecaire noire petit', 'Ecaire Noir Petit', NULL, NULL, 100, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(139, 103, NULL, 248, NULL, NULL, 'ECAIRE NOIRE PETITdet', 'Ecaire Noir Petit détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(140, 85, NULL, 216, NULL, NULL, 'etau 150', 'ETAU 150', NULL, NULL, 2, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(141, 85, NULL, 216, NULL, NULL, 'ETAU 150det', 'ETAU 150 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(143, 85, NULL, 217, NULL, NULL, 'etau 200', 'Etau 200', NULL, NULL, 1, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(144, 85, NULL, 217, NULL, NULL, 'ETAU 200det', 'Etau 200 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(145, 98, NULL, NULL, NULL, NULL, 'gant wiseup', 'Gant Wiseup', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(146, 98, NULL, NULL, NULL, NULL, 'GANT WISEUPpaq', 'Gant Wiseup paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(147, 36, NULL, 145, NULL, NULL, 'griffe fer a beton 6-8', 'Griffe A Beton 6-8', NULL, NULL, 100, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(148, 36, NULL, 145, NULL, NULL, 'GRIFFE FER A BETON 6-8det', 'Griffe A Beton 6-8 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(149, 36, NULL, 146, NULL, NULL, 'griffe fer a beton 8-10', 'Griffe A Beton 8-10', NULL, NULL, 100, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(150, 36, NULL, 146, NULL, NULL, 'GRIFFE FER A BETON 8-10det', 'Griffe A Beton 8-10 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(151, 36, NULL, 148, NULL, NULL, 'griffe fer a beton 12-14', 'Griffe A Beton 12-14', NULL, NULL, 20, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(152, 36, NULL, 148, NULL, NULL, 'GRIFFE FER A BETON 12-14det', 'Griffe A Beton 12-14 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(153, 36, NULL, 149, NULL, NULL, 'griffe fer a beton 14-16', 'Griffe A Beton 14-16', NULL, NULL, 20, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(154, 36, NULL, 149, NULL, NULL, 'GRIFFE FER A BETON 14-16det', 'Griffe A Beton 14-16 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(155, 68, NULL, NULL, NULL, NULL, 'lame sixoteuse', 'Lame Sixoteuse', NULL, NULL, 400, 4, 'en_gros', NULL, 'actif', 'actif', 0),
(156, 68, NULL, NULL, NULL, NULL, 'LAME SIXOTEUSEdet', 'Lame Sixoteuse détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(157, 68, NULL, NULL, NULL, NULL, 'LAME SIXOTEUSEpaq', 'Lame Sixoteuse paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(158, 65, NULL, NULL, NULL, NULL, 'machine Ulty Bosch', 'Machine Ulty Bosch', NULL, NULL, 4, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(159, 65, NULL, NULL, NULL, NULL, 'MACHINE ULTY BOSCHdet', 'Machine Ulty Bosch détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(160, 117, NULL, 264, NULL, NULL, 'marteau  carreauleur 4', 'Marteau Carreauleur 4', NULL, NULL, 50, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(161, 117, NULL, 264, NULL, NULL, 'MARTEAU  CARREAULEUR 4det', 'Marteau Carreauleur 4 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(162, 117, NULL, 265, NULL, NULL, 'marteau  carreauleur 5', 'Marteau Carreauleur 5', NULL, NULL, 36, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(163, 117, NULL, 265, NULL, NULL, 'MARTEAU  CARREAULEUR 5det', 'Marteau Carreauleur 5 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(164, 117, NULL, 266, NULL, NULL, 'marteau  carreauleur 6', 'Marteau Carreauleur 6', NULL, NULL, 24, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(165, 117, NULL, 266, NULL, NULL, 'MARTEAU  CARREAULEUR 6det', 'Marteau Carreauleur 6 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(166, 81, NULL, 208, NULL, NULL, 'mateau noir', 'Marteau Menuisier Noir', NULL, NULL, 48, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(167, 81, NULL, 208, NULL, NULL, 'MATEAU NOIRdet', 'Marteau Menuisier Noir détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(168, 83, NULL, 212, NULL, NULL, 'marteau orange noir p', 'Marteau Orange Noir Petit', NULL, NULL, 60, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(169, 83, NULL, 212, NULL, NULL, 'MARTEAU ORANGE NOIR Pdet', 'Marteau Orange Noir Petit détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(170, 83, NULL, 213, NULL, NULL, 'marteau orange noir g', 'Marteau Orange Noir Grand', NULL, NULL, 48, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(171, 83, NULL, 213, NULL, NULL, 'MARTEAU ORANGE NOIR Gdet', 'Marteau Orange Noir Grand détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(172, 51, NULL, 173, NULL, NULL, 'marteau rouge 250g', 'Marteau Rouge Noir 250G', NULL, NULL, 60, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(173, 51, NULL, 173, NULL, NULL, 'MARTEAU ROUGE 250Gdet', 'Marteau Rouge Noir 250G détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(174, 51, NULL, 174, NULL, NULL, 'marteau rouge 500g', 'Marteau Rouge Noir 500G', NULL, NULL, 48, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(175, 51, NULL, 174, NULL, NULL, 'MARTEAU ROUGE 500Gdet', 'Marteau Rouge Noir 500G détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(176, 51, NULL, 175, NULL, NULL, 'marteau rouge 750g', 'Marteau Rouge Noir 750G', NULL, NULL, 36, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(177, 51, NULL, 175, NULL, NULL, 'MARTEAU ROUGE 750Gdet', 'Marteau Rouge Noir 750G détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(178, 84, NULL, 270, NULL, NULL, 'marteau tapissier 200g', 'Marteau Tapissier 200g', NULL, NULL, 120, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(179, 84, NULL, 270, NULL, NULL, 'MARTEAU TAPISSIER 200Gdet', 'Marteau Tapissier 200g détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(180, 84, NULL, 271, NULL, NULL, 'marteau tapissier 400g', 'Marteau Tapissier 400g', NULL, NULL, 60, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(181, 84, NULL, 271, NULL, NULL, 'MARTEAU TAPISSIER 400Gdet', 'Marteau Tapissier 400g détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(182, 42, NULL, 160, NULL, NULL, 'Meche A beton 6', 'Meche A Beton 6mm', NULL, NULL, 500, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(183, 42, NULL, 160, NULL, NULL, 'MECHE A BETON 6det', 'Meche A Beton 6mm détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(184, 42, NULL, 161, NULL, NULL, 'Meche A beton 8', 'Meche A Beton 8mm', NULL, NULL, 500, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(185, 42, NULL, 161, NULL, NULL, 'MECHE A BETON 8det', 'Meche A Beton 8mm détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(186, 42, NULL, 162, NULL, NULL, 'Meche A beton 10', 'Meche A Beton 10mm', NULL, NULL, 500, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(187, 42, NULL, 162, NULL, NULL, 'MECHE A BETON 10det', 'Meche A Beton 10mm détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(188, 42, NULL, 163, NULL, NULL, 'Meche A beton 12', 'Meche A Beton 12mm', NULL, NULL, 500, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(189, 42, NULL, 163, NULL, NULL, 'MECHE A BETON 12det', 'Meche A Beton 12mm détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(190, 42, NULL, 164, NULL, NULL, 'Meche A beton 14', 'Meche A Beton 14mm', NULL, NULL, 300, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(191, 42, NULL, 164, NULL, NULL, 'MECHE A BETON 14det', 'Meche A Beton 14mm détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(192, 108, NULL, 260, NULL, NULL, 'meule makita', 'MEULE MAKITA 125mm', NULL, NULL, 10, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(193, 108, NULL, 260, NULL, NULL, 'MEULE MAKITAdet', 'MEULE MAKITA 125mm détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(194, 46, NULL, NULL, NULL, NULL, 'meule MPT2400', 'Meule MPT 240W 230mm', NULL, NULL, 2, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(195, 46, NULL, NULL, NULL, NULL, 'MEULE MPT2400det', 'Meule MPT 240W 230mm détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(196, 72, NULL, NULL, NULL, NULL, 'monture lame de scie bisso', 'Monture Lame De Scie Bisso', NULL, NULL, 48, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(197, 72, NULL, NULL, NULL, NULL, 'MONTURE LAME DE SCIE BISSOdet', 'Monture Lame De Scie Bisso détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(198, 94, NULL, 234, NULL, NULL, 'niveau maçon jaune 60', 'Niveau Maçon Jaune 60mm', NULL, NULL, 60, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(199, 94, NULL, 234, NULL, NULL, 'NIVEAU MAçON JAUNE 60det', 'Niveau Maçon Jaune 60mm détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(200, 94, NULL, 234, NULL, NULL, 'niveau maçon jaune 40', 'Niveau Maçon Jaune 40mm', NULL, NULL, 60, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(201, 94, NULL, 234, NULL, NULL, 'NIVEAU MAçON JAUNE 40det', 'Niveau Maçon Jaune 40mm détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(202, 94, NULL, 236, NULL, NULL, 'niveau maçon jaune 80', 'Niveau Maçon Jaune 80mm', NULL, NULL, 60, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(203, 94, NULL, 236, NULL, NULL, 'NIVEAU MAçON JAUNE 80det', 'Niveau Maçon Jaune 80mm détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(204, 94, NULL, 238, NULL, NULL, 'niveau maçon jaune 100', 'Niveau Maçon Jaune 100mm', NULL, NULL, 60, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(205, 94, NULL, 238, NULL, NULL, 'NIVEAU MAçON JAUNE 100det', 'Niveau Maçon Jaune 100mm détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(206, 94, NULL, 237, NULL, NULL, 'niveau maçon jaune 120', 'Niveau Maçon Jaune 120mm', NULL, NULL, 30, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(207, 94, NULL, 237, NULL, NULL, 'NIVEAU MAçON JAUNE 120det', 'Niveau Maçon Jaune 120mm détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(208, 95, NULL, 239, NULL, NULL, 'niveau maçon noir 60', 'Niveau Maçon Noir 60mm', NULL, NULL, 30, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(209, 95, NULL, 239, NULL, NULL, 'NIVEAU MAçON NOIR 60det', 'Niveau Maçon Noir 60mm détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(210, 95, NULL, 240, NULL, NULL, 'niveau maçon noir 80', 'Niveau Maçon Noir 80mm', NULL, NULL, 30, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(211, 95, NULL, 240, NULL, NULL, 'NIVEAU MAçON NOIR 80det', 'Niveau Maçon Noir 80mm détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(212, 80, NULL, 206, NULL, NULL, 'palette 8', 'Pallete 8mm', NULL, NULL, NULL, 10, 'en_gros', NULL, 'actif', 'actif', 0),
(213, 80, NULL, 206, NULL, NULL, 'PALETTE 8paq', 'Pallete 8mm paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(214, 80, NULL, 207, NULL, NULL, 'palette 10', 'Pallete 10mm', NULL, NULL, NULL, 10, 'en_gros', NULL, 'actif', 'actif', 0),
(215, 80, NULL, 207, NULL, NULL, 'PALETTE 10paq', 'Pallete 10mm paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(216, 120, NULL, NULL, NULL, NULL, 'caisse a douille', 'Caisse A Douille', NULL, NULL, NULL, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(217, 82, NULL, 209, NULL, NULL, 'pierd de biche petit', 'Pied De Biche Petit', NULL, NULL, 36, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(218, 82, NULL, 209, NULL, NULL, 'PIERD DE BICHE PETITdet', 'Pied De Biche Petit détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(219, 82, NULL, 210, NULL, NULL, 'pierd de biche moyen', 'Pied De Biche Moyen', NULL, NULL, 24, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(220, 82, NULL, 210, NULL, NULL, 'PIERD DE BICHE MOYENdet', 'Pied De Biche Moyen détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(221, 82, NULL, 211, NULL, NULL, 'pierd de biche grand', 'Pied De Biche Grand', NULL, NULL, 24, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(222, 82, NULL, 211, NULL, NULL, 'PIERD DE BICHE GRANDdet', 'Pied De Biche Grand détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(223, 91, NULL, 227, NULL, NULL, 'pierre 150', 'Pierre 150', NULL, NULL, 25, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(224, 91, NULL, 227, NULL, NULL, 'PIERRE 150det', 'Pierre 150 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(225, 91, NULL, 228, NULL, NULL, 'pierre 200', 'Pierre 200', NULL, NULL, 16, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(226, 91, NULL, 228, NULL, NULL, 'PIERRE 200det', 'Pierre 200 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(227, 71, NULL, NULL, NULL, NULL, 'pince a river', 'Pince A River', NULL, NULL, 36, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(228, 71, NULL, NULL, NULL, NULL, 'PINCE A RIVERdet', 'Pince A River détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(229, 114, NULL, NULL, NULL, NULL, 'Pince Coupante', 'Pince Coupante', NULL, NULL, 60, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(230, 114, NULL, NULL, NULL, NULL, 'PINCE COUPANTEdet', 'Pince Coupante détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(231, 115, NULL, NULL, NULL, NULL, 'Pince Longue Bec', 'Pince Long Bec', NULL, NULL, 60, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(232, 115, NULL, NULL, NULL, NULL, 'PINCE LONGUE BECdet', 'Pince Long Bec détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(233, 109, NULL, NULL, NULL, NULL, 'pince plaquette', 'Pince Plaquette', NULL, NULL, 60, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(234, 109, NULL, NULL, NULL, NULL, 'PINCE PLAQUETTEdet', 'Pince Plaquette détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(235, 67, NULL, NULL, NULL, NULL, 'pince plomberie', 'Pince Plomberie', NULL, NULL, 60, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(236, 67, NULL, NULL, NULL, NULL, 'PINCE PLOMBERIEdet', 'Pince Plomberie détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(237, 113, NULL, NULL, NULL, NULL, 'pince universelle', 'Pince Universelle N8', NULL, NULL, 60, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(238, 113, NULL, NULL, NULL, NULL, 'PINCE UNIVERSELLEdet', 'Pince Universelle N8 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(239, 64, NULL, 187, NULL, NULL, 'pinceau', 'Pinceau 2', NULL, NULL, NULL, 12, 'en_gros', NULL, 'actif', 'actif', 0),
(240, 64, NULL, 187, NULL, NULL, 'PINCEAUpaq', 'Pinceau 2 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(241, 64, NULL, 188, NULL, NULL, 'pinceau 3', 'Pinceau 3', NULL, NULL, 40, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(242, 64, NULL, 188, NULL, NULL, 'PINCEAU 3det', 'Pinceau 3 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(243, 55, NULL, 178, NULL, NULL, 'PV ponsage 150 P120', 'Papier Vert Ponsange 150 P120', NULL, NULL, NULL, 40, 'en_gros', NULL, 'actif', 'actif', 0),
(244, 55, NULL, 178, NULL, NULL, 'PV PONSAGE 150 P120paq', 'Papier Vert Ponsange 150 P120 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(245, 55, NULL, 179, NULL, NULL, 'PV ponsage 150 P240', 'Papier Vert Ponsange 150 P240', NULL, NULL, NULL, 40, 'en_gros', NULL, 'actif', 'actif', 0),
(246, 55, NULL, 179, NULL, NULL, 'PV PONSAGE 150 P240paq', 'Papier Vert Ponsange 150 P240 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(247, 55, NULL, 180, NULL, NULL, 'PV ponsage 150 P320', 'Papier Vert Ponsange 150 P320', NULL, NULL, NULL, 40, 'en_gros', NULL, 'actif', 'actif', 0),
(248, 55, NULL, 180, NULL, NULL, 'PV PONSAGE 150 P320paq', 'Papier Vert Ponsange 150 P320 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(249, 56, NULL, 181, NULL, NULL, 'PV ponsage 180 P120', 'Papier Vert Ponsange 180 P120', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(250, 56, NULL, 181, NULL, NULL, 'PV PONSAGE 180 P120paq', 'Papier Vert Ponsange 180 P120 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(251, 56, NULL, 182, NULL, NULL, 'PV ponsage 180 P180', 'Papier Vert Ponsange 180 P240', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(252, 56, NULL, 182, NULL, NULL, 'PV PONSAGE 180 P180paq', 'Papier Vert Ponsange 180 P240 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(253, 56, NULL, 183, NULL, NULL, 'PV ponsage 180 P320', 'Papier Vert Ponsange 180 P320', NULL, NULL, NULL, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(254, 97, NULL, NULL, NULL, NULL, 'pistolet peinture', 'Pistolet Peinture', NULL, NULL, 30, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(255, 97, NULL, NULL, NULL, NULL, 'PISTOLET PEINTUREdet', 'Pistolet Peinture détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(256, 35, NULL, 143, NULL, NULL, 'plastique meule 115', 'Plastique Meule 115 BLANC', NULL, NULL, 120, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(257, 35, NULL, 143, NULL, NULL, 'PLASTIQUE MEULE 115det', 'Plastique Meule 115BLANC Détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(258, 35, NULL, 144, NULL, NULL, 'plastique meule 180', 'Plastique Meule 180 BLANC', NULL, NULL, 60, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(259, 35, NULL, 144, NULL, NULL, 'PLASTIQUE MEULE 180det', 'Plastique Meule 180 BLANC Détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(260, 53, NULL, 176, NULL, NULL, 'plastique noir pour meule 150', 'Plastique Noir Pour Meule 150mm', NULL, NULL, 200, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(261, 53, NULL, 176, NULL, NULL, 'PLASTIQUE NOIR POUR MEULE 150det', 'Plastique Noir Pour Meule 150mm détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(262, 53, NULL, 177, NULL, NULL, 'plastique noir pour meule 180', 'Plastique Noir Pour Meule 180mm', NULL, NULL, 100, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(263, 53, NULL, 177, NULL, NULL, 'PLASTIQUE NOIR POUR MEULE 180det', 'Plastique Noir Pour Meule 180mm détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(264, 100, NULL, NULL, NULL, NULL, 'pointe Acier', 'Pointe Acier', NULL, NULL, NULL, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(265, 48, NULL, 170, NULL, NULL, 'PAS 400A', 'Poste A Soudure ARC-400A', NULL, NULL, 4, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(266, 48, NULL, 170, NULL, NULL, 'PAS 400Adet', 'Poste A Soudure ARC-400A détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(267, 48, NULL, 171, NULL, NULL, 'PAS 600A', 'Poste A Soudure ARC-600A', NULL, NULL, 4, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(268, 48, NULL, 171, NULL, NULL, 'PAS 600Adet', 'Poste A Soudure ARC-600A détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(269, 48, NULL, 172, NULL, NULL, 'PAS MMA-400A', 'Poste A Soudure MMA-400A', NULL, NULL, NULL, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(270, 57, NULL, NULL, NULL, NULL, 'rabot', 'Rabot', NULL, NULL, 12, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(271, 57, NULL, NULL, NULL, NULL, 'RABOTdet', 'Rabot détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(272, 119, NULL, 269, NULL, NULL, 'rallonge25 2x2.5', 'Rallonge 25M 2x2.5', NULL, NULL, 4, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(273, 119, NULL, 269, NULL, NULL, 'RALLONGE25 2X2.5det', 'Rallonge 25M 2x2.5 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(274, 118, NULL, 267, NULL, NULL, 'rallonge50 3x2.5', 'Rallonge 50M 3x2.5', NULL, NULL, 3, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(275, 118, NULL, 267, NULL, NULL, 'RALLONGE50 3X2.5det', 'Rallonge 50M 3x2.5 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(276, 118, NULL, 268, NULL, NULL, 'rallonge50 2x2.5', 'Rallonge 50M 2x2.5', NULL, NULL, 3, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(277, 118, NULL, 268, NULL, NULL, 'RALLONGE50 2X2.5det', 'Rallonge 50M 2x2.5 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(278, 13, NULL, 64, NULL, NULL, 'rivet 4x12', 'Rivet 4x12', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(279, 13, NULL, 64, NULL, NULL, 'RIVET 4X12paq', 'Rivet 4x12 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(280, 13, NULL, 65, NULL, NULL, 'rivet 4x19', 'Rivet 4x19', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(281, 13, NULL, 65, NULL, NULL, 'RIVET 4X19paq', 'Rivet 4x19 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(282, 13, NULL, 66, NULL, NULL, 'rivet 4x25', 'Rivet 4x25', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(283, 13, NULL, 66, NULL, NULL, 'RIVET 4X25paq', 'Rivet 4x25 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(284, 13, NULL, 67, NULL, NULL, 'rivet 5x18', 'Rivet 5x18', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(285, 13, NULL, 67, NULL, NULL, 'RIVET 5X18paq', 'Rivet 5x18 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(286, 16, NULL, 76, NULL, NULL, 'rondelle M6', 'Rondelle M6', NULL, NULL, NULL, 12, 'en_gros', NULL, 'actif', 'actif', 0),
(287, 16, NULL, 76, NULL, NULL, 'RONDELLE M6paq', 'Rondelle M6 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(288, 16, NULL, 77, NULL, NULL, 'rondelle M8', 'Rondelle M8', NULL, NULL, NULL, 16, 'en_gros', NULL, 'actif', 'actif', 0),
(289, 16, NULL, 77, NULL, NULL, 'RONDELLE M8paq', 'Rondelle M8 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(290, 16, NULL, 78, NULL, NULL, 'rondelle M10', 'Rondelle M10', NULL, NULL, NULL, 12, 'en_gros', NULL, 'actif', 'actif', 0),
(291, 16, NULL, 78, NULL, NULL, 'RONDELLE M10paq', 'Rondelle M10 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(292, 16, NULL, 79, NULL, NULL, 'rondelle M12', 'Rondelle M12', NULL, NULL, NULL, 12, 'en_gros', NULL, 'actif', 'actif', 0),
(293, 16, NULL, 79, NULL, NULL, 'RONDELLE M12paq', 'Rondelle M12 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(294, 112, NULL, NULL, NULL, NULL, 'sangle', 'Sangle', NULL, NULL, 10, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(295, 112, NULL, NULL, NULL, NULL, 'SANGLEdet', 'Sangle détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(296, 58, NULL, NULL, NULL, NULL, 'secateur fleur jaune noir', 'Secateur Fleur Jaune Noir', NULL, NULL, 24, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(297, 58, NULL, NULL, NULL, NULL, 'SECATEUR FLEUR JAUNE NOIRdet', 'Secateur Fleur Jaune Noir détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(298, 59, NULL, NULL, NULL, NULL, 'secateur fleur rouge noir', 'Secateur Fleur Rouge Noir', NULL, NULL, 24, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(299, 59, NULL, NULL, NULL, NULL, 'SECATEUR FLEUR ROUGE NOIRdet', 'Secateur Fleur Rouge Noir détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(300, 89, NULL, 223, NULL, NULL, 'serrant menuisier en fer 18', 'Serrant Menuisier En Fer 18', NULL, NULL, 60, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(301, 89, NULL, 223, NULL, NULL, 'SERRANT MENUISIER EN FER 18det', 'Serrant Menuisier En Fer 18 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(302, 89, NULL, 224, NULL, NULL, 'serrant menuisier en fer 20', 'Serrant Menuisier En Fer 20', NULL, NULL, 60, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(303, 89, NULL, 224, NULL, NULL, 'SERRANT MENUISIER EN FER 20det', 'Serrant Menuisier En Fer 20 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(304, 89, NULL, 225, NULL, NULL, 'serrant menuisier en fer 22', 'Serrant Menuisier En Fer 22', NULL, NULL, 60, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(305, 89, NULL, 225, NULL, NULL, 'SERRANT MENUISIER EN FER 22det', 'Serrant Menuisier En Fer 22 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(306, 90, NULL, 226, NULL, NULL, 'serrant menuisier WISEUP', 'Serrant Menuisier WISEUP 30', NULL, NULL, 48, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(307, 90, NULL, 226, NULL, NULL, 'SERRANT MENUISIER WISEUPdet', 'Serrant Menuisier WISEUP 30 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(308, 96, NULL, 241, NULL, NULL, 'sizaille bisso 36', 'Sizaille Bisso 36mm', NULL, NULL, 5, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(309, 96, NULL, 241, NULL, NULL, 'SIZAILLE BISSO 36det', 'Sizaille Bisso 36mm détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(310, 96, NULL, 242, NULL, NULL, 'sizaille bisso 42', 'Sizaille Bisso 42mm', NULL, NULL, 4, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(311, 96, NULL, 242, NULL, NULL, 'SIZAILLE BISSO 42det', 'Sizaille Bisso 42mm détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(312, 96, NULL, 243, NULL, NULL, 'sizaille bisso 48', 'Sizaille Bisso 48mm', NULL, NULL, 4, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(313, 96, NULL, 243, NULL, NULL, 'SIZAILLE BISSO 48det', 'Sizaille Bisso 48mm détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(314, 86, NULL, NULL, NULL, NULL, 'sizaille tole', 'Sizaille Tole', NULL, NULL, 2, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(315, 86, NULL, NULL, NULL, NULL, 'SIZAILLE TOLEdet', 'Sizaille Tole détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(316, 74, NULL, 195, NULL, NULL, 'sizaille wizeup 24', 'Sizaille wizeup 24', NULL, NULL, 8, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(317, 74, NULL, 195, NULL, NULL, 'SIZAILLE WIZEUP 24det', 'Sizaille Wizeup 24 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(318, 74, NULL, 194, NULL, NULL, 'sizaille wizeup 18', 'Sizaille WIZEUP 18', NULL, NULL, 12, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(319, 74, NULL, 194, NULL, NULL, 'SIZAILLE WIZEUP 18det', 'Sizaille WIZEUP 18 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(320, 74, NULL, 196, NULL, NULL, 'sizaille wizeup 30', 'Sizaille WIZEUP 30', NULL, NULL, 5, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(321, 74, NULL, 196, NULL, NULL, 'SIZAILLE WIZEUP 30det', 'Sizaille WIZEUP 30 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(322, 74, NULL, 197, NULL, NULL, 'sizaille wizeup 36', 'Sizaille WIZEUP 36', NULL, NULL, 4, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(323, 74, NULL, 197, NULL, NULL, 'SIZAILLE WIZEUP 36det', 'Sizaille WIZEUP 36 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(324, 74, NULL, 198, NULL, NULL, 'sizaille wizeup 42', 'Sizaille WIZEUP 42', NULL, NULL, 3, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(325, 74, NULL, 198, NULL, NULL, 'SIZAILLE WIZEUP 42det', 'Sizaille WIZEUP 42 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(326, 74, NULL, 199, NULL, NULL, 'sizaille wizeup 48', 'Sizaille WIZEUP 48', NULL, NULL, 2, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(327, 74, NULL, 199, NULL, NULL, 'SIZAILLE WIZEUP 48det', 'Sizaille WIZEUP 48 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(328, 87, NULL, 219, NULL, NULL, 'tacloche maçon Grand', 'Taloche Maçon Grand', NULL, NULL, 50, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(329, 87, NULL, 219, NULL, NULL, 'TACLOCHE MAçON GRANDdet', 'Taloche Maçon Grand détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(331, 87, NULL, 218, NULL, NULL, 'tacloche maçon petit', 'Taloche Maçon Petit', NULL, NULL, 60, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(332, 87, NULL, 218, NULL, NULL, 'TACLOCHE MAçON PETITdet', 'Taloche Maçon Petit détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(333, 88, NULL, 220, NULL, NULL, 'taloche mastique dent', 'Taloche Mastique Dent', NULL, NULL, 60, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(334, 88, NULL, 220, NULL, NULL, 'TALOCHE MASTIQUE DENTdet', 'Taloche Mastique Dent détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(335, 88, NULL, 221, NULL, NULL, 'taloche mastique grand', 'Taloche Mastique Grand', NULL, NULL, 60, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(336, 88, NULL, 221, NULL, NULL, 'TALOCHE MASTIQUE GRANDdet', 'Taloche Mastique Grand détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(337, 88, NULL, 222, NULL, NULL, 'taloche mastique moyen', 'Taloche Mastique Moyen', NULL, NULL, 60, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(338, 88, NULL, 222, NULL, NULL, 'TALOCHE MASTIQUE MOYENdet', 'Taloche Mastique Moyen détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(339, 75, NULL, NULL, NULL, NULL, 'tareau', 'Tareau', NULL, NULL, NULL, 10, 'en_gros', NULL, 'actif', 'actif', 0),
(340, 75, NULL, NULL, NULL, NULL, 'TAREAUpaq', 'Tareau paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(341, 111, NULL, 262, NULL, NULL, 'tenaille Bisso 9', 'Tenaille Bisso 9', NULL, NULL, NULL, 5, 'en_gros', NULL, 'actif', 'actif', 0),
(342, 111, NULL, 262, NULL, NULL, 'TENAILLE BISSO 9paq', 'Tenaille Bisso 9 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(343, 111, NULL, 263, NULL, NULL, 'tenaille Bisso 10', 'Tenaille Bisso 10', NULL, NULL, NULL, 5, 'en_gros', NULL, 'actif', 'actif', 0),
(344, 111, NULL, 263, NULL, NULL, 'TENAILLE BISSO 10paq', 'Tenaille Bisso 10 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(345, 38, NULL, 153, NULL, NULL, 'tenaille germanie', 'Tenaille Germanie 9', NULL, NULL, NULL, 5, 'en_gros', NULL, 'actif', 'actif', 0),
(346, 38, NULL, 153, NULL, NULL, 'TENAILLE GERMANIEpaq', 'Tenaille Germanie 9 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(347, 38, NULL, 154, NULL, NULL, 'tenaille germanie 10', 'Tenaille Germanie 10', NULL, NULL, NULL, 5, 'en_gros', NULL, 'actif', 'actif', 0),
(348, 38, NULL, 154, NULL, NULL, 'TENAILLE GERMANIE 10paq', 'Tenaille Germanie 10 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(349, 110, NULL, 261, NULL, NULL, 'tenaille wizeup', 'Tenaille Wizeup 9', NULL, NULL, NULL, 5, 'en_gros', NULL, 'actif', 'actif', 0),
(350, 110, NULL, 261, NULL, NULL, 'TENAILLE WIZEUPpaq', 'Tenaille Wizeup 9 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(351, 69, NULL, NULL, NULL, NULL, 'tenaille noir wellborn', 'Tenaille Noir Wellborn', NULL, NULL, NULL, 5, 'en_gros', NULL, 'actif', 'actif', 0),
(352, 69, NULL, NULL, NULL, NULL, 'TENAILLE NOIR WELLBORNpaq', 'Tenaille Noir Wellborn paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(353, 79, NULL, 203, NULL, NULL, 'tournevice 2FACE noir jaune', 'Tournevice 2face Noir Jaune', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(354, 79, NULL, 203, NULL, NULL, 'TOURNEVICE 2FACE NOIR JAUNEpaq', 'Tournevice 2face Noir Jaune paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(355, 79, NULL, 204, NULL, NULL, 'tournevice 2FACE gris', 'Tournevice 2face Gris', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(356, 79, NULL, 204, NULL, NULL, 'TOURNEVICE 2FACE GRISpaq', 'Tournevice 2face Gris paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(357, 79, NULL, 205, NULL, NULL, 'tournevice 2FACE bleu noir', 'Tournevice 2FACE Bleu Noir', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0);
INSERT INTO `products` (`id`, `categorie_id`, `epaisseur_id`, `dimension_id`, `origine_id`, `type_id`, `reference`, `designation`, `prix_vente`, `code_barre`, `nbre_piece`, `nbre_paquet`, `type_produit`, `nbre_vente`, `statut`, `statut_comptable`, `tva`) VALUES
(358, 79, NULL, 205, NULL, NULL, 'TOURNEVICE 2FACE BLEU NOIRpaq', 'Tournevice 2FACE Bleu Noir paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(359, 78, NULL, NULL, NULL, NULL, 'tournevice electrique', 'Tournevice Electrique', NULL, NULL, NULL, 48, 'en_gros', NULL, 'actif', 'actif', 0),
(360, 78, NULL, NULL, NULL, NULL, 'TOURNEVICE ELECTRIQUEpaq', 'Tournevice Electrique paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(361, 41, NULL, NULL, NULL, NULL, 'tournevice testeur JUMLEE', 'Tournevice Testeur JUMLEE', NULL, NULL, NULL, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(362, 77, NULL, 201, NULL, NULL, 'trouwel plastique 7', 'Trouwel Plastique 7', NULL, NULL, NULL, 10, 'en_gros', NULL, 'actif', 'actif', 0),
(363, 77, NULL, 201, NULL, NULL, 'TROUWEL PLASTIQUE 7paq', 'Trouwel Plastique 7 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(364, 77, NULL, 202, NULL, NULL, 'trouwel plastique 8', 'Trouwel Plastique 8', NULL, NULL, NULL, 10, 'en_gros', NULL, 'actif', 'actif', 0),
(365, 77, NULL, 202, NULL, NULL, 'TROUWEL PLASTIQUE 8paq', 'Trouwel Plastique 8 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(366, 76, NULL, 200, NULL, NULL, 'trouwel wizeup 8', 'Trouwel WIZEUP 8', NULL, NULL, NULL, 4, 'en_gros', NULL, 'actif', 'actif', 0),
(367, 76, NULL, 200, NULL, NULL, 'TROUWEL WIZEUP 8paq', 'Trouwel WIZEUP 8 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(368, 15, NULL, 72, NULL, NULL, 'turfon 8x50', 'Turfon 8x50', NULL, NULL, NULL, 12, 'en_gros', NULL, 'actif', 'actif', 0),
(369, 15, NULL, 72, NULL, NULL, 'TURFON 8X50paq', 'Turfon 8x50 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(370, 15, NULL, 73, NULL, NULL, 'turfon 8x60', 'Turfon 8x60', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(371, 15, NULL, 73, NULL, NULL, 'TURFON 8X60paq', 'Turfon 8x60 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(372, 15, NULL, 74, NULL, NULL, 'turfon 8x80', 'Turfon 8x80', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(373, 15, NULL, 74, NULL, NULL, 'TURFON 8X80paq', 'Turfon 8x80 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(374, 15, NULL, 75, NULL, NULL, 'turfon 8x100', 'Turfon 8x100', NULL, NULL, NULL, 16, 'en_gros', NULL, 'actif', 'actif', 0),
(375, 15, NULL, 75, NULL, NULL, 'TURFON 8X100paq', 'Turfon 8x100 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(376, 9, NULL, 26, NULL, NULL, 'vice dore 4', 'Vice Dore 4', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(377, 9, NULL, 26, NULL, NULL, 'VICE DORE 4paq', 'Vice Dore 4 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(378, 9, NULL, 27, NULL, NULL, 'vice dore 4x16', 'Vice Dore 4x16', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(379, 9, NULL, 27, NULL, NULL, 'VICE DORE 4X16paq', 'Vice Dore 4x16 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(380, 9, NULL, 28, NULL, NULL, 'vice dore 4x20', 'Vice Dore 4x20', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(381, 9, NULL, 28, NULL, NULL, 'VICE DORE 4X20paq', 'Vice Dore 4x20 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(382, 9, NULL, 29, NULL, NULL, 'vice dore 4x25', 'Vice Dore 4x25', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(383, 9, NULL, 29, NULL, NULL, 'VICE DORE 4X25paq', 'Vice Dore 4x25 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(384, 9, NULL, 30, NULL, NULL, 'vice dore 4x30', 'Vice Dore 4x30', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(385, 9, NULL, 30, NULL, NULL, 'VICE DORE 4X30paq', 'Vice Dore 4x30 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(386, 9, NULL, 31, NULL, NULL, 'vice dore 4x40', 'Vice Dore 4x40', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(387, 9, NULL, 31, NULL, NULL, 'VICE DORE 4X40paq', 'Vice Dore 4x40 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(388, 9, NULL, 32, NULL, NULL, 'vice dore 4x50', 'Vice Dore 4x50', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(389, 9, NULL, 32, NULL, NULL, 'VICE DORE 4X50paq', 'Vice Dore 4x50 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(390, 9, NULL, 33, NULL, NULL, 'Vice dore 5', 'Vice Dore 5', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(391, 9, NULL, 33, NULL, NULL, 'VICE DORE 5paq', 'Vice Dore 5 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(392, 9, NULL, 34, NULL, NULL, 'vice dore 5x20', 'Vice Dore 5x20', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(393, 9, NULL, 34, NULL, NULL, 'VICE DORE 5X20paq', 'Vice Dore 5x20 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(394, 9, NULL, 35, NULL, NULL, 'vice dore 5x30', 'Vice Dore 5x30', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(395, 9, NULL, 35, NULL, NULL, 'VICE DORE 5X30paq', 'Vice Dore 5x30 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(396, 9, NULL, 36, NULL, NULL, 'vice dore 5x40', 'Vice Dore 5x40', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(397, 9, NULL, 36, NULL, NULL, 'VICE DORE 5X40paq', 'Vice Dore 5x40 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(398, 9, NULL, 37, NULL, NULL, 'vice dore 5x50', 'Vice Dore 5x50', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(399, 9, NULL, 37, NULL, NULL, 'VICE DORE 5X50paq', 'Vice Dore 5x50 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(400, 9, NULL, 38, NULL, NULL, 'vice dore 5x60', 'vice dore 5x60', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(401, 9, NULL, 38, NULL, NULL, 'VICE DORE 5X60paq', 'Vice Dore 5x60 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(402, 9, NULL, 39, NULL, NULL, 'vice dore 5x70', 'Vice Dore 5x70', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(403, 9, NULL, 39, NULL, NULL, 'VICE DORE 5X70paq', 'Vice Dore 5x70 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(404, 9, NULL, 40, NULL, NULL, 'vice dore 5x80', 'Vice Dore 5x80', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(405, 9, NULL, 40, NULL, NULL, 'VICE DORE 5X80paq', 'Vice Dore 5x80 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(406, 9, NULL, 41, NULL, NULL, 'vice dore 5x100', 'Vice Dore 5x100', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(407, 9, NULL, 41, NULL, NULL, 'VICE DORE 5X100paq', 'Vice Dore 5x100 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(408, 9, NULL, 42, NULL, NULL, 'vice dore 6x50', 'Vice Dore 6x50', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(409, 9, NULL, 42, NULL, NULL, 'VICE DORE 6X50paq', 'Vice Dore 6x50 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(410, 9, NULL, 43, NULL, NULL, 'vice dore 6x60', 'Vice Dore 6x60', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(411, 9, NULL, 43, NULL, NULL, 'VICE DORE 6X60paq', 'Vice Dore 6x60 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(412, 9, NULL, 44, NULL, NULL, 'vice dore 6x70', 'Vice Dore 6x70', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(413, 9, NULL, 44, NULL, NULL, 'VICE DORE 6X70paq', 'Vice Dore 6x70 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(414, 9, NULL, 45, NULL, NULL, 'vice dore 6x80', 'vice dore 6x80', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(415, 9, NULL, 45, NULL, NULL, 'VICE DORE 6X80paq', 'Vice Dore 6x80 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(416, 9, NULL, 46, NULL, NULL, 'vice dore 6x100', 'Vice Dore 6x100', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(417, 9, NULL, 46, NULL, NULL, 'VICE DORE 6X100paq', 'Vice Dore 6x100 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(418, 8, NULL, 21, NULL, NULL, 'vice noir 3/4', 'Vice Noir 3/4', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(419, 8, NULL, 21, NULL, NULL, 'VICE NOIR 3/4paq', 'Vice Noir 3/4 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(420, 8, NULL, 22, NULL, NULL, 'vice noir 6x1', 'Vice Noir 6x1', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(421, 8, NULL, 22, NULL, NULL, 'VICE NOIR 6X1paq', 'Vice Noir 6x1 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(422, 8, NULL, 23, NULL, NULL, 'vice noir 6x1/2', 'Vice Noir 6x1/2', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(423, 8, NULL, 23, NULL, NULL, 'VICE NOIR 6X1/2paq', 'Vice Noir 6x1/2 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(424, 8, NULL, 24, NULL, NULL, 'vice noir 6x2', 'Vice Noir 6x2', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(425, 8, NULL, 24, NULL, NULL, 'VICE NOIR 6X2paq', 'Vice Noir 6x2 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(426, 8, NULL, 25, NULL, NULL, 'vice noir 6x1/4', 'Vice Noir 6x1/4', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(427, 8, NULL, 25, NULL, NULL, 'VICE NOIR 6X1/4paq', 'Vice Noir 6x1/4 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(428, 10, NULL, 47, NULL, NULL, 'vice parker 8x3/8', 'Vice Parker 8x3/8', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(429, 10, NULL, 47, NULL, NULL, 'VICE PARKER 8X3/8paq', 'Vice Parker 8x3/8 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(430, 10, NULL, 48, NULL, NULL, 'vice parker 10x1/2', 'Vice Parker 10x1/2', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(431, 10, NULL, 48, NULL, NULL, 'VICE PARKER 10X1/2paq', 'Vice Parker 10x1/2 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(432, 10, NULL, 49, NULL, NULL, 'vice parker 10x1', 'Vice Parker 10x1', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(433, 10, NULL, 49, NULL, NULL, 'VICE PARKER 10X1paq', 'Vice Parker 10x1 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(434, 10, NULL, 50, NULL, NULL, 'vice parker 8x5/8', 'Vice Parker 8x5/8', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(435, 10, NULL, 50, NULL, NULL, 'VICE PARKER 8X5/8paq', 'Vice Parker 8x5/8 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(436, 10, NULL, 51, NULL, NULL, 'vice parker 10x3/4', 'vice parker 10x3/4', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(437, 10, NULL, 51, NULL, NULL, 'VICE PARKER 10X3/4paq', 'Vice Parker 10x3/4 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(438, 10, NULL, 52, NULL, NULL, 'vice parker 10x1-1/2', 'vice parker 10x1-1/2', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(439, 10, NULL, 52, NULL, NULL, 'VICE PARKER 10X1-1/2paq', 'Vice Parker 10x1-1/2 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(440, 10, NULL, 53, NULL, NULL, 'vice parker 10x1-1/4', 'vice parker 10x1-1/4', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(441, 10, NULL, 53, NULL, NULL, 'VICE PARKER 10X1-1/4paq', 'Vice Parker 10x1-1/4 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(442, 10, NULL, 54, NULL, NULL, 'vice parker 10x80', 'Vice Parker 10x80', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(443, 10, NULL, 54, NULL, NULL, 'VICE PARKER 10X80paq', 'Vice Parker 10x80 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(444, 11, NULL, 55, NULL, NULL, 'vice tete fraise 4.2x19', 'Vice Tete Fraise 4.2x19', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(445, 11, NULL, 55, NULL, NULL, 'VICE TETE FRAISE 4.2X19paq', 'Vice Tete Fraise 4.2x19 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(446, 11, NULL, 56, NULL, NULL, 'vice tete fraise 4.2x25', 'Vice Tete Fraise 4.2x25', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(447, 11, NULL, 56, NULL, NULL, 'VICE TETE FRAISE 4.2X25paq', 'Vice Tete Fraise 4.2x25 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(448, 11, NULL, 57, NULL, NULL, 'vice tete fraise 4.2x32', 'Vice Tete Fraise 4.2x32', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(449, 11, NULL, 57, NULL, NULL, 'VICE TETE FRAISE 4.2X32paq', 'Vice Tete Fraise 4.2x32 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(450, 11, NULL, 58, NULL, NULL, 'vice tete fraise 4.2x50', 'vice tete fraise 4.2x50', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(451, 11, NULL, 58, NULL, NULL, 'VICE TETE FRAISE 4.2X50paq', 'Vice Tete Fraise 4.2x50 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(452, 12, NULL, 59, NULL, NULL, 'vice tole 6.3x25', 'Vice Tole 6.3x25', NULL, NULL, NULL, 5, 'en_gros', NULL, 'actif', 'actif', 0),
(453, 12, NULL, 59, NULL, NULL, 'VICE TOLE 6.3X25paq', 'Vice Tole 6.3x25 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(454, 12, NULL, 60, NULL, NULL, 'vice tole 6.3x32', 'vice tole 6.3x32', NULL, NULL, NULL, 5, 'en_gros', NULL, 'actif', 'actif', 0),
(455, 12, NULL, 60, NULL, NULL, 'VICE TOLE 6.3X32paq', 'Vice Tole 6.3x32 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(456, 12, NULL, 61, NULL, NULL, 'vice tole 6.3x50', 'vice tole 6.3x50', NULL, NULL, NULL, 5, 'en_gros', NULL, 'actif', 'actif', 0),
(457, 12, NULL, 61, NULL, NULL, 'VICE TOLE 6.3X50paq', 'Vice Tole 6.3x50 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(458, 12, NULL, 62, NULL, NULL, 'vice tole 6.3x70', 'vice tole 6.3x70', NULL, NULL, NULL, 5, 'en_gros', NULL, 'actif', 'actif', 0),
(459, 12, NULL, 62, NULL, NULL, 'VICE TOLE 6.3X70paq', 'Vice Tole 6.3x70 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(460, 12, NULL, 63, NULL, NULL, 'vice tole 6.3x100', 'vice tole 6.3x100', NULL, NULL, NULL, 5, 'en_gros', NULL, 'actif', 'actif', 0),
(461, 12, NULL, 63, NULL, NULL, 'VICE TOLE 6.3X100paq', 'Vice Tole 6.3x100 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(462, 66, NULL, 189, NULL, NULL, 'viceuse makita 18V', 'Viceuse Makita 18V', NULL, NULL, 10, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(463, 66, NULL, 189, NULL, NULL, 'VICEUSE MAKITA 18Vdet', 'Viceuse Makita 18V détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(464, 66, NULL, 190, NULL, NULL, 'viceuse makita 21V', 'Viceuse Makita 21V', NULL, NULL, 10, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(465, 66, NULL, 190, NULL, NULL, 'VICEUSE MAKITA 21Vdet', 'Viceuse Makita 21V détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(466, 66, NULL, 191, NULL, NULL, 'viceuse makita 26V', 'Viceuse Makita 26V', NULL, NULL, 10, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(467, 66, NULL, 191, NULL, NULL, 'VICEUSE MAKITA 26Vdet', 'Viceuse Makita 26V détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(468, 29, NULL, 127, NULL, NULL, 'baguette acier 3.2', 'Baguette Acier 3.2', NULL, NULL, NULL, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(469, 24, NULL, 99, NULL, NULL, 'boulon ecrou 6x12', 'Boulon Ecrou 6x12', NULL, NULL, NULL, 24, 'en_gros', NULL, 'actif', 'actif', 0),
(470, 24, NULL, 99, NULL, NULL, 'BOULON ECROU 6X12paq', 'Boulon Ecrou 6x12 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(471, 24, NULL, 100, NULL, NULL, 'boulon ecrou 6x16', 'Boulon Ecrou 6x16', NULL, NULL, NULL, 24, 'en_gros', NULL, 'actif', 'actif', 0),
(472, 24, NULL, 100, NULL, NULL, 'BOULON ECROU 6X16paq', 'Boulon Ecrou 6x16 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(473, 24, NULL, 101, NULL, NULL, 'boulon ecrou 6x20', 'boulon ecrou 6x20', NULL, NULL, NULL, 24, 'en_gros', NULL, 'actif', 'actif', 0),
(474, 24, NULL, 101, NULL, NULL, 'BOULON ECROU 6X20paq', 'Boulon Ecrou 6x20 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(475, 24, NULL, 102, NULL, NULL, 'boulon ecrou 6x24', 'boulon ecrou 6x24', NULL, NULL, NULL, 24, 'en_gros', NULL, 'actif', 'actif', 0),
(476, 24, NULL, 102, NULL, NULL, 'BOULON ECROU 6X24paq', 'Boulon Ecrou 6x24 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(477, 24, NULL, 103, NULL, NULL, 'boulon ecrou 6x30', 'boulon ecrou 6x30', NULL, NULL, NULL, 24, 'en_gros', NULL, 'actif', 'actif', 0),
(478, 24, NULL, 103, NULL, NULL, 'BOULON ECROU 6X30paq', 'Boulon Ecrou 6x30 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(479, 24, NULL, 104, NULL, NULL, 'boulon ecrou 6x40', 'boulon ecrou 6x40', NULL, NULL, NULL, 24, 'en_gros', NULL, 'actif', 'actif', 0),
(480, 24, NULL, 104, NULL, NULL, 'BOULON ECROU 6X40paq', 'Boulon Ecrou 6x40 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(481, 24, NULL, 105, NULL, NULL, 'boulon ecrou 6x50', 'boulon ecrou 6x50', NULL, NULL, NULL, 24, 'en_gros', NULL, 'actif', 'actif', 0),
(482, 24, NULL, 105, NULL, NULL, 'BOULON ECROU 6X50paq', 'Boulon Ecrou 6x50 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(483, 24, NULL, 106, NULL, NULL, 'boulon ecrou 8x20', 'Boulon Ecrou 8x20', NULL, NULL, NULL, 12, 'en_gros', NULL, 'actif', 'actif', 0),
(484, 24, NULL, 106, NULL, NULL, 'BOULON ECROU 8X20paq', 'Boulon Ecrou 8x20 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(485, 24, NULL, 107, NULL, NULL, 'boulon ecrou 8x25', 'boulon ecrou 8x25', NULL, NULL, NULL, 24, 'en_gros', NULL, 'actif', 'actif', 0),
(486, 24, NULL, 107, NULL, NULL, 'BOULON ECROU 8X25paq', 'Boulon Ecrou 8x25 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(487, 24, NULL, 108, NULL, NULL, 'boulon ecrou 8x30', 'boulon ecrou 8x30', NULL, NULL, NULL, 12, 'en_gros', NULL, 'actif', 'actif', 0),
(488, 24, NULL, 108, NULL, NULL, 'BOULON ECROU 8X30paq', 'Boulon Ecrou 8x30 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(489, 24, NULL, 109, NULL, NULL, 'boulon ecrou 8x35', 'boulon ecrou 8x35', NULL, NULL, NULL, 12, 'en_gros', NULL, 'actif', 'actif', 0),
(490, 24, NULL, 109, NULL, NULL, 'BOULON ECROU 8X35paq', 'Boulon Ecrou 8x35 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(491, 24, NULL, 110, NULL, NULL, 'boulon ecrou 8x40', 'boulon ecrou 8x40', NULL, NULL, NULL, 12, 'en_gros', NULL, 'actif', 'actif', 0),
(492, 24, NULL, 110, NULL, NULL, 'BOULON ECROU 8X40paq', 'Boulon Ecrou 8x40 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(493, 24, NULL, 111, NULL, NULL, 'boulon ecrou 8x50', 'boulon ecrou 8x50', NULL, NULL, NULL, 12, 'en_gros', NULL, 'actif', 'actif', 0),
(494, 24, NULL, 111, NULL, NULL, 'BOULON ECROU 8X50paq', 'Boulon Ecrou 8x50 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(495, 24, NULL, 112, NULL, NULL, 'boulon ecrou 10x30', 'Boulon Ecrou 10x30', NULL, NULL, NULL, 8, 'en_gros', NULL, 'actif', 'actif', 0),
(496, 24, NULL, 112, NULL, NULL, 'BOULON ECROU 10X30paq', 'Boulon Ecrou 10x30 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(497, 24, NULL, 113, NULL, NULL, 'boulon ecrou 10x40', 'boulon ecrou 10x40', NULL, NULL, NULL, 8, 'en_gros', NULL, 'actif', 'actif', 0),
(498, 24, NULL, 113, NULL, NULL, 'BOULON ECROU 10X40paq', 'Boulon Ecrou 10x40 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(499, 24, NULL, 114, NULL, NULL, 'boulon ecrou 10x50', 'Boulon Ecrou 10x50', NULL, NULL, NULL, 8, 'en_gros', NULL, 'actif', 'actif', 0),
(500, 24, NULL, 114, NULL, NULL, 'BOULON ECROU 10X50paq', 'Boulon Ecrou 10x50 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(501, 24, NULL, 115, NULL, NULL, 'boulon ecrou 10x60', 'Boulon Ecrou 10x60', NULL, NULL, NULL, 8, 'en_gros', NULL, 'actif', 'actif', 0),
(502, 24, NULL, 115, NULL, NULL, 'BOULON ECROU 10X60paq', 'Boulon Ecrou 10x60 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(503, 24, NULL, 116, NULL, NULL, 'boulon ecrou 10x70', 'Boulon Ecrou 10x70', NULL, NULL, NULL, 8, 'en_gros', NULL, 'actif', 'actif', 0),
(504, 24, NULL, 116, NULL, NULL, 'BOULON ECROU 10X70paq', 'Boulon Ecrou 10x70 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(505, 24, NULL, 117, NULL, NULL, 'boulon ecrou 10x80', 'Boulon Ecrou 10x80', NULL, NULL, NULL, 8, 'en_gros', NULL, 'actif', 'actif', 0),
(506, 24, NULL, 117, NULL, NULL, 'BOULON ECROU 10X80paq', 'Boulon Ecrou 10x80 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(507, 24, NULL, 118, NULL, NULL, 'boulon ecrou 12x40', 'Boulon Ecrou 12x40', NULL, NULL, NULL, 8, 'en_gros', NULL, 'actif', 'actif', 0),
(508, 24, NULL, 118, NULL, NULL, 'BOULON ECROU 12X40paq', 'Boulon Ecrou 12x40 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(509, 24, NULL, 119, NULL, NULL, 'boulon ecrou 12x60', 'boulon ecrou 12x60', NULL, NULL, NULL, 8, 'en_gros', NULL, 'actif', 'actif', 0),
(510, 24, NULL, 119, NULL, NULL, 'BOULON ECROU 12X60paq', 'Boulon Ecrou 12x60 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(511, 24, NULL, 120, NULL, NULL, 'boulon ecrou 12x70', 'Boulon Ecrou 12x70', NULL, NULL, NULL, 8, 'en_gros', NULL, 'actif', 'actif', 0),
(512, 24, NULL, 120, NULL, NULL, 'BOULON ECROU 12X70paq', 'Boulon Ecrou 12x70 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(513, 19, NULL, 88, NULL, NULL, 'boulon tournevice 6x50', 'Boulon Tournevice 6x50', NULL, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(514, 19, NULL, 88, NULL, NULL, 'BOULON TOURNEVICE 6X50paq', 'Boulon Tournevice 6x50 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(515, 19, NULL, 89, NULL, NULL, 'boulon tournevice 6x60', 'Boulon Tournevice 6x60', NULL, NULL, NULL, 16, 'en_gros', NULL, 'actif', 'actif', 0),
(516, 19, NULL, 89, NULL, NULL, 'BOULON TOURNEVICE 6X60paq', 'Boulon Tournevice 6x60 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(517, 22, NULL, 92, NULL, NULL, 'cheville frappe 16x150', 'Cheville Frappe 16x150', NULL, NULL, 150, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(518, 22, NULL, 92, NULL, NULL, 'CHEVILLE FRAPPE 16X150det', 'Cheville Frappe 16x150 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(519, 22, NULL, 93, NULL, NULL, 'cheville frappe 12x120', 'Cheville Frappe 12x120', NULL, NULL, 320, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(520, 22, NULL, 93, NULL, NULL, 'CHEVILLE FRAPPE 12X120det', 'Cheville Frappe 12x120 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(521, 22, NULL, 94, NULL, NULL, 'cheville frappe 10x120', 'Cheville Frappe 10x120', NULL, NULL, 400, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(522, 22, NULL, 94, NULL, NULL, 'CHEVILLE FRAPPE 10X120det', 'Cheville Frappe 10x120 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(523, 14, NULL, 68, NULL, NULL, 'cheville metallique M6x50', 'Cheville Metallique M6x50', NULL, NULL, NULL, 1, 'en_gros', NULL, 'actif', 'actif', 0),
(524, 14, NULL, 68, NULL, NULL, 'CHEVILLE METALLIQUE M6X50paq', 'Cheville Metallique M6x50 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(525, 14, NULL, 69, NULL, NULL, 'cheville frappe 8x60', 'Cheville Frappe 8x60', NULL, NULL, 600, 1, 'en_gros', NULL, 'actif', 'actif', 0),
(526, 14, NULL, 69, NULL, NULL, 'CHEVILLE FRAPPE 8X60det', 'Cheville Frappe 8x60 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(527, 14, NULL, 69, NULL, NULL, 'CHEVILLE FRAPPE 8X60paq', 'Cheville Frappe 8x60 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(528, 14, NULL, 70, NULL, NULL, 'CHEVILLE FRAPPE M10X70', 'Cheville Frappe M10x70', NULL, NULL, 360, 1, 'en_gros', NULL, 'actif', 'actif', 0),
(529, 14, NULL, 70, NULL, NULL, 'CHEVILLE FRAPPE M10X70DET', 'Cheville Frappe M10x70 Détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(530, 14, NULL, 70, NULL, NULL, 'CHEVILLE FRAPPE M10X70PAQ', 'Cheville Frappe M10x70 Paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(531, 14, NULL, 71, NULL, NULL, 'cheville frappe M12x90', 'cheville frappe M12x90', NULL, NULL, 240, 1, 'en_gros', NULL, 'actif', 'actif', 0),
(532, 14, NULL, 71, NULL, NULL, 'CHEVILLE FRAPPE M12X90det', 'Cheville Frappe M12x90 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(533, 14, NULL, 71, NULL, NULL, 'CHEVILLE FRAPPE M12X90paq', 'Cheville Frappe M12x90 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(534, 23, NULL, 95, NULL, NULL, 'cheville metallique M6', 'Cheville Metallique M6', NULL, NULL, 4000, 1, 'en_gros', NULL, 'actif', 'actif', 0),
(535, 23, NULL, 95, NULL, NULL, 'CHEVILLE METALLIQUE M6det', 'Cheville Metallique M6 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(536, 23, NULL, 95, NULL, NULL, 'CHEVILLE METALLIQUE M6paq', 'Cheville Metallique M6 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(537, 23, NULL, 97, NULL, NULL, 'cheville metallique M10', 'cheville metallique M10', NULL, NULL, 1000, 1, 'en_gros', NULL, 'actif', 'actif', 0),
(538, 23, NULL, 97, NULL, NULL, 'CHEVILLE METALLIQUE M10det', 'Cheville Metallique M10 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(539, 23, NULL, 97, NULL, NULL, 'CHEVILLE METALLIQUE M10paq', 'Cheville Metallique M10 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(540, 23, NULL, 98, NULL, NULL, 'cheville metallique M12', 'Cheville Metallique M12', NULL, NULL, 500, 1, 'en_gros', NULL, 'actif', 'actif', 0),
(541, 23, NULL, 98, NULL, NULL, 'CHEVILLE METALLIQUE M12det', 'Cheville Metallique M12 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(542, 23, NULL, 98, NULL, NULL, 'CHEVILLE METALLIQUE M12paq', 'Cheville Metallique M12 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(543, 23, NULL, 96, NULL, NULL, 'cheville metallique M8', 'cheville metallique M8', NULL, NULL, 2000, 1, 'en_gros', NULL, 'actif', 'actif', 0),
(544, 23, NULL, 96, NULL, NULL, 'CHEVILLE METALLIQUE M8det', 'Cheville Metallique M8 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(545, 23, NULL, 96, NULL, NULL, 'CHEVILLE METALLIQUE M8paq', 'Cheville Metallique M8 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(546, 4, NULL, 4, NULL, NULL, 'cheville plastique 6', 'Cheville Plastique 6', NULL, NULL, NULL, 200, 'en_gros', NULL, 'actif', 'actif', 0),
(547, 4, NULL, 4, NULL, NULL, 'CHEVILLE PLASTIQUE 6paq', 'Cheville Plastique 6 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(548, 4, NULL, 5, NULL, NULL, 'cheville plastique 8', 'Cheville Plastique 8', NULL, NULL, NULL, 100, 'en_gros', NULL, 'actif', 'actif', 0),
(549, 4, NULL, 5, NULL, NULL, 'CHEVILLE PLASTIQUE 8paq', 'Cheville Plastique 8 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(550, 4, NULL, 6, NULL, NULL, 'cheville plastique 10', 'Cheville Plastique 10', NULL, NULL, NULL, 100, 'en_gros', NULL, 'actif', 'actif', 0),
(551, 4, NULL, 6, NULL, NULL, 'CHEVILLE PLASTIQUE 10paq', 'Cheville Plastique 10 Paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(552, 4, NULL, 7, NULL, NULL, 'cheville plastique 12', 'cheville plastique 12', NULL, NULL, NULL, 100, 'en_gros', NULL, 'actif', 'actif', 0),
(553, 4, NULL, 7, NULL, NULL, 'CHEVILLE PLASTIQUE 12paq', 'Cheville Plastique 12 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(562, 21, NULL, NULL, NULL, NULL, 'SPB014', 'SP-B014', NULL, NULL, NULL, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(563, 122, NULL, NULL, NULL, NULL, 'SPA17', 'POIGNET SPA17', NULL, NULL, NULL, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(564, 122, NULL, NULL, NULL, NULL, 'SP02', 'POIGNET SP02', NULL, NULL, NULL, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(565, 123, NULL, NULL, NULL, NULL, 'SP35', 'Pomelle SP35', NULL, NULL, NULL, 10, 'en_gros', NULL, 'actif', 'actif', 0),
(566, 124, NULL, NULL, NULL, NULL, 'SERRURESIMPLE', 'SERRURE SIMPLE', NULL, NULL, 30, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(567, 124, NULL, NULL, NULL, NULL, 'SERRURECOMPLET', 'SERRURE COMPLET', NULL, NULL, 24, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(568, 124, NULL, NULL, NULL, NULL, 'SERRURECOMPLETdet', 'SERRURE COMPLET détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(569, 125, NULL, NULL, NULL, NULL, 'SP04A', 'VERROU SP04A', NULL, NULL, 50, 10, 'en_gros', NULL, 'actif', 'actif', 0),
(570, 125, NULL, NULL, NULL, NULL, 'SP04Adet', 'VERROU SP04A détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(571, 125, NULL, NULL, NULL, NULL, 'SP04Apaq', 'VERROU SP04A paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(572, 126, NULL, NULL, NULL, NULL, 'SP2000A', 'FERMETURE CHINOIS SP2000A', NULL, NULL, 100, 2, 'en_gros', NULL, 'actif', 'actif', 0),
(573, 126, NULL, NULL, NULL, NULL, 'SP2000Adet', 'FERMETURE CHINOIS SP2000A détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(574, 126, NULL, NULL, NULL, NULL, 'SP2000Apaq', 'FERMETURE CHINOIS SP2000A paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(575, 126, NULL, NULL, NULL, NULL, 'SPA08', 'FERMETURE LIBANAIS SPA08', NULL, NULL, 75, 15, 'en_gros', NULL, 'actif', 'actif', 0),
(576, 126, NULL, NULL, NULL, NULL, 'SPA08det', 'FERMETURE LIBANAIS SPA08 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(577, 126, NULL, NULL, NULL, NULL, 'SPA08paq', 'FERMETURE LIBANAIS SPA08 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(578, 127, NULL, NULL, NULL, NULL, 'CANOTACRIMA', 'CANOT ACRIMA', NULL, NULL, NULL, 10, 'en_gros', NULL, 'actif', 'actif', 0),
(579, 127, NULL, NULL, NULL, NULL, 'CANOTACRIMApaq', 'CANOT ACRIMA paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(580, 127, NULL, NULL, NULL, NULL, 'CANOTOMECCO', 'CANOT OMECCO', NULL, NULL, NULL, 10, 'en_gros', NULL, 'actif', 'actif', 0),
(581, 127, NULL, NULL, NULL, NULL, 'CANOTOMECCOpaq', 'CANOT OMECCO paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(582, 124, NULL, NULL, NULL, NULL, 'SERRUREPOLICENTREMICO', 'SERRURE POLICENTRE MICO', NULL, NULL, NULL, 50, 'en_gros', NULL, 'actif', 'actif', 0),
(583, 124, NULL, NULL, NULL, NULL, 'SERRUREPOLICENTREMICOpaq', 'SERRURE POLICENTRE MICO paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(584, 57, NULL, NULL, NULL, NULL, 'ROBOT70', 'ROBOT 70', NULL, NULL, 20, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(585, 57, NULL, NULL, NULL, NULL, 'ROBOT70det', 'ROBOT 70 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(586, 57, NULL, NULL, NULL, NULL, 'ROBOT72', 'ROBOT 72', NULL, NULL, 10, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(587, 57, NULL, NULL, NULL, NULL, 'ROBOT72det', 'ROBOT 72 détail', NULL, NULL, NULL, NULL, 'detail', NULL, 'actif', 'actif', 0),
(588, 122, NULL, NULL, NULL, NULL, 'POIGNETPOLICENTSPA51RE', 'POIGNET POLICENTRE SPA51', NULL, NULL, NULL, 50, 'en_gros', NULL, 'actif', 'actif', 0),
(589, 122, NULL, NULL, NULL, NULL, 'POIGNETPOLICENTSPA51REpaq', 'POIGNET POLICENTRE SPA51 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(590, 129, NULL, NULL, NULL, NULL, 'SPE006', 'EQUEUR MOUSTIQUER', NULL, NULL, NULL, 5, 'en_gros', NULL, 'actif', 'actif', 0),
(591, 129, NULL, NULL, NULL, NULL, 'SPE006paq', 'EQUEUR MOUSTIQUER paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(592, 21, NULL, NULL, NULL, NULL, '6x3/4', 'Vis Noir 6x3/4', 900000.00, NULL, NULL, 20, 'en_gros', NULL, 'actif', 'actif', 0),
(593, 21, NULL, NULL, NULL, NULL, '6X3/4paq', 'Vis Noir 6x3/4 paquet', NULL, NULL, NULL, NULL, 'paquet', NULL, 'actif', 'actif', 0),
(594, 17, NULL, NULL, NULL, NULL, 'crochet plafond 8', 'Crochet Plafond 8 Paquet', 50000.00, NULL, NULL, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(595, 17, NULL, NULL, NULL, NULL, 'CROCHET PLAFOND 12', 'Crochet Plafond 12 Paquet', 90000.00, NULL, NULL, NULL, 'en_gros', NULL, 'actif', 'actif', 0),
(596, 17, NULL, NULL, NULL, NULL, 'CROCHET PLAFOND 16', 'crochet plafond 16 Paquet', 120000.00, NULL, NULL, NULL, 'en_gros', NULL, 'actif', 'actif', 0);

-- --------------------------------------------------------

--
-- Structure de la table `proformat`
--

DROP TABLE IF EXISTS `proformat`;
CREATE TABLE IF NOT EXISTS `proformat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `saisie_par_id` int(11) NOT NULL,
  `lieu_vente_id` int(11) NOT NULL,
  `numero_proformat` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_proformat` decimal(13,2) DEFAULT NULL,
  `date_saisie` datetime NOT NULL,
  `commentaire` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_EA59AEE619EB6921` (`client_id`),
  KEY `IDX_EA59AEE6C74AC7FE` (`saisie_par_id`),
  KEY `IDX_EA59AEE6AA2B41DC` (`lieu_vente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `proformat_frais_sup`
--

DROP TABLE IF EXISTS `proformat_frais_sup`;
CREATE TABLE IF NOT EXISTS `proformat_frais_sup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proformat_id` int(11) NOT NULL,
  `frais_sup_id` int(11) NOT NULL,
  `devise_id` int(11) NOT NULL,
  `montant` decimal(13,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_EA665822E91D11FF` (`proformat_id`),
  KEY `IDX_EA6658226DE81F47` (`frais_sup_id`),
  KEY `IDX_EA665822F4445056` (`devise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `proformat_product`
--

DROP TABLE IF EXISTS `proformat_product`;
CREATE TABLE IF NOT EXISTS `proformat_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proformat_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `prix_vente` decimal(13,2) DEFAULT NULL,
  `quantite` double NOT NULL,
  `remise` double DEFAULT NULL,
  `tva` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BCCCE744E91D11FF` (`proformat_id`),
  KEY `IDX_BCCCE7444584665A` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `recette`
--

DROP TABLE IF EXISTS `recette`;
CREATE TABLE IF NOT EXISTS `recette` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categorie_id` int(11) NOT NULL,
  `devise_id` int(11) NOT NULL,
  `mode_paie_id` int(11) NOT NULL,
  `caisse_id` int(11) NOT NULL,
  `saisie_par_id` int(11) NOT NULL,
  `lieu_vente_id` int(11) NOT NULL,
  `montant` decimal(13,2) NOT NULL,
  `commentaire` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_operation` datetime NOT NULL,
  `date_saisie` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_49BB6390BCF5E72D` (`categorie_id`),
  KEY `IDX_49BB6390F4445056` (`devise_id`),
  KEY `IDX_49BB639062E04A07` (`mode_paie_id`),
  KEY `IDX_49BB639027B4FEBF` (`caisse_id`),
  KEY `IDX_49BB6390C74AC7FE` (`saisie_par_id`),
  KEY `IDX_49BB6390AA2B41DC` (`lieu_vente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `region`
--

DROP TABLE IF EXISTS `region`;
CREATE TABLE IF NOT EXISTS `region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `region`
--

INSERT INTO `region` (`id`, `nom`) VALUES
(1, 'conakry'),
(2, 'kindia'),
(3, 'mamou'),
(4, 'gaoual'),
(5, 'dalaba'),
(6, 'pita'),
(7, 'labe'),
(8, 'dabola'),
(9, 'faranah'),
(10, 'kankan'),
(11, 'siguiri'),
(12, 'telemele'),
(13, 'nzerekore'),
(14, 'kamsar'),
(15, 'fria'),
(16, 'boke'),
(17, 'boffa'),
(18, 'kolabounyi'),
(19, 'Gueckedou'),
(20, 'forecariah'),
(21, 'coyah'),
(22, 'Pays de l\'Extérieur'),
(23, 'Madina');

-- --------------------------------------------------------

--
-- Structure de la table `retour_product`
--

DROP TABLE IF EXISTS `retour_product`;
CREATE TABLE IF NOT EXISTS `retour_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `caisse_id` int(11) DEFAULT NULL,
  `lieu_vente_id` int(11) NOT NULL,
  `stock_retour_id` int(11) NOT NULL,
  `saisie_par_id` int(11) NOT NULL,
  `commande_id` int(11) NOT NULL,
  `quantite` double NOT NULL,
  `prix_vente` decimal(13,2) DEFAULT NULL,
  `date_retour` datetime NOT NULL,
  `date_saisie` datetime NOT NULL,
  `remise` decimal(13,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_211320214584665A` (`product_id`),
  KEY `IDX_2113202127B4FEBF` (`caisse_id`),
  KEY `IDX_21132021AA2B41DC` (`lieu_vente_id`),
  KEY `IDX_21132021B04BE5F7` (`stock_retour_id`),
  KEY `IDX_21132021C74AC7FE` (`saisie_par_id`),
  KEY `IDX_2113202182EA2E54` (`commande_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `retour_product_fournisseur`
--

DROP TABLE IF EXISTS `retour_product_fournisseur`;
CREATE TABLE IF NOT EXISTS `retour_product_fournisseur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `liste_product_achat_id` int(11) NOT NULL,
  `lieu_vente_id` int(11) NOT NULL,
  `saisie_par_id` int(11) NOT NULL,
  `date_saisie` datetime NOT NULL,
  `quantite` double NOT NULL,
  `prix_achat` decimal(13,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3438CC8771EC7B3D` (`liste_product_achat_id`),
  KEY `IDX_3438CC87AA2B41DC` (`lieu_vente_id`),
  KEY `IDX_3438CC87C74AC7FE` (`saisie_par_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE IF NOT EXISTS `stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_produit_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantite` double DEFAULT NULL,
  `prix_achat` decimal(12,2) DEFAULT NULL,
  `prix_revient` decimal(12,2) DEFAULT NULL,
  `prix_vente` decimal(12,2) DEFAULT NULL,
  `date_peremption` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4B365660A17D8957` (`stock_produit_id`),
  KEY `IDX_4B3656604584665A` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1167 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `stock`
--

INSERT INTO `stock` (`id`, `stock_produit_id`, `product_id`, `quantite`, `prix_achat`, `prix_revient`, `prix_vente`, `date_peremption`) VALUES
(1, 2, 4, 0, NULL, NULL, 0.00, NULL),
(2, 2, 5, NULL, NULL, NULL, NULL, NULL),
(3, 2, 6, 0, NULL, NULL, NULL, NULL),
(4, 2, 7, NULL, NULL, NULL, NULL, NULL),
(5, 2, 8, NULL, NULL, NULL, NULL, NULL),
(6, 2, 9, 100, 0.00, 0.00, 0.00, NULL),
(7, 2, 10, NULL, NULL, NULL, NULL, NULL),
(8, 2, 11, 50, 0.00, 0.00, 0.00, NULL),
(9, 2, 12, 2, NULL, NULL, NULL, NULL),
(10, 2, 13, 60, 0.00, 0.00, 0.00, NULL),
(11, 2, 14, 1, NULL, NULL, NULL, NULL),
(12, 2, 15, 0, 0.00, 0.00, 0.00, NULL),
(13, 2, 16, NULL, NULL, NULL, NULL, NULL),
(14, 2, 17, NULL, NULL, NULL, NULL, NULL),
(15, 2, 18, NULL, NULL, NULL, NULL, NULL),
(16, 2, 19, NULL, NULL, NULL, NULL, NULL),
(17, 2, 20, NULL, NULL, NULL, NULL, NULL),
(18, 2, 21, NULL, NULL, NULL, NULL, NULL),
(19, 2, 22, NULL, NULL, NULL, NULL, NULL),
(20, 2, 23, NULL, NULL, NULL, NULL, NULL),
(21, 2, 24, NULL, NULL, NULL, NULL, NULL),
(22, 2, 25, NULL, NULL, NULL, NULL, NULL),
(23, 2, 26, NULL, NULL, NULL, NULL, NULL),
(24, 2, 27, NULL, NULL, NULL, NULL, NULL),
(25, 2, 28, NULL, NULL, NULL, NULL, NULL),
(26, 2, 29, NULL, NULL, NULL, NULL, NULL),
(27, 2, 30, NULL, NULL, NULL, NULL, NULL),
(28, 2, 31, NULL, NULL, NULL, NULL, NULL),
(29, 2, 32, NULL, NULL, NULL, NULL, NULL),
(30, 2, 33, NULL, NULL, NULL, NULL, NULL),
(31, 2, 34, NULL, NULL, NULL, NULL, NULL),
(32, 2, 35, NULL, NULL, NULL, NULL, NULL),
(33, 2, 36, NULL, NULL, NULL, NULL, NULL),
(34, 2, 37, NULL, NULL, NULL, NULL, NULL),
(35, 2, 38, NULL, NULL, NULL, NULL, NULL),
(36, 2, 39, NULL, NULL, NULL, NULL, NULL),
(37, 2, 40, NULL, NULL, NULL, NULL, NULL),
(38, 2, 41, NULL, NULL, NULL, NULL, NULL),
(39, 2, 42, NULL, NULL, NULL, NULL, NULL),
(40, 2, 43, NULL, NULL, NULL, NULL, NULL),
(41, 2, 44, NULL, NULL, NULL, NULL, NULL),
(42, 2, 45, NULL, NULL, NULL, NULL, NULL),
(43, 2, 46, NULL, NULL, NULL, NULL, NULL),
(44, 2, 47, NULL, NULL, NULL, NULL, NULL),
(45, 2, 48, NULL, NULL, NULL, NULL, NULL),
(46, 2, 49, NULL, NULL, NULL, NULL, NULL),
(47, 2, 50, NULL, NULL, NULL, NULL, NULL),
(48, 2, 51, NULL, NULL, NULL, NULL, NULL),
(49, 2, 52, NULL, NULL, NULL, NULL, NULL),
(50, 2, 53, NULL, NULL, NULL, NULL, NULL),
(51, 2, 54, NULL, NULL, NULL, NULL, NULL),
(52, 2, 55, NULL, NULL, NULL, NULL, NULL),
(53, 2, 56, NULL, NULL, NULL, NULL, NULL),
(54, 2, 57, NULL, NULL, NULL, NULL, NULL),
(55, 2, 58, NULL, NULL, NULL, NULL, NULL),
(56, 2, 59, NULL, NULL, NULL, NULL, NULL),
(57, 2, 60, NULL, NULL, NULL, NULL, NULL),
(58, 2, 61, NULL, NULL, NULL, NULL, NULL),
(59, 2, 62, NULL, NULL, NULL, NULL, NULL),
(60, 2, 63, NULL, NULL, NULL, NULL, NULL),
(61, 2, 64, NULL, NULL, NULL, NULL, NULL),
(62, 2, 65, NULL, NULL, NULL, NULL, NULL),
(63, 2, 66, NULL, NULL, NULL, NULL, NULL),
(64, 2, 67, NULL, NULL, NULL, NULL, NULL),
(65, 2, 68, NULL, NULL, NULL, NULL, NULL),
(66, 2, 69, NULL, NULL, NULL, NULL, NULL),
(67, 2, 70, NULL, NULL, NULL, NULL, NULL),
(68, 2, 71, NULL, NULL, NULL, NULL, NULL),
(69, 2, 72, NULL, NULL, NULL, NULL, NULL),
(70, 2, 73, NULL, NULL, NULL, NULL, NULL),
(71, 2, 74, NULL, NULL, NULL, NULL, NULL),
(72, 2, 75, NULL, NULL, NULL, NULL, NULL),
(73, 2, 76, NULL, NULL, NULL, NULL, NULL),
(74, 2, 77, NULL, NULL, NULL, NULL, NULL),
(75, 2, 78, NULL, NULL, NULL, NULL, NULL),
(76, 2, 79, NULL, NULL, NULL, NULL, NULL),
(77, 2, 80, NULL, NULL, NULL, NULL, NULL),
(78, 2, 81, NULL, NULL, NULL, NULL, NULL),
(79, 2, 82, NULL, NULL, NULL, NULL, NULL),
(80, 2, 83, NULL, NULL, NULL, NULL, NULL),
(81, 2, 84, NULL, NULL, NULL, NULL, NULL),
(82, 2, 85, NULL, NULL, NULL, NULL, NULL),
(83, 2, 86, NULL, NULL, NULL, NULL, NULL),
(84, 2, 87, NULL, NULL, NULL, NULL, NULL),
(85, 2, 88, NULL, NULL, NULL, NULL, NULL),
(86, 2, 89, NULL, NULL, NULL, NULL, NULL),
(87, 2, 90, NULL, NULL, NULL, NULL, NULL),
(88, 2, 91, NULL, NULL, NULL, NULL, NULL),
(89, 2, 92, NULL, NULL, NULL, NULL, NULL),
(90, 2, 93, NULL, NULL, NULL, NULL, NULL),
(91, 2, 94, NULL, NULL, NULL, NULL, NULL),
(92, 2, 95, NULL, NULL, NULL, NULL, NULL),
(93, 2, 96, 0, NULL, NULL, NULL, NULL),
(94, 2, 97, 0, NULL, NULL, NULL, NULL),
(95, 2, 98, NULL, NULL, NULL, NULL, NULL),
(96, 2, 99, NULL, NULL, NULL, NULL, NULL),
(97, 2, 100, NULL, NULL, NULL, NULL, NULL),
(98, 2, 101, NULL, NULL, NULL, NULL, NULL),
(99, 2, 102, NULL, NULL, NULL, NULL, NULL),
(100, 2, 103, NULL, NULL, NULL, NULL, NULL),
(101, 2, 104, NULL, NULL, NULL, NULL, NULL),
(102, 2, 105, NULL, NULL, NULL, NULL, NULL),
(103, 2, 106, NULL, NULL, NULL, NULL, NULL),
(104, 2, 107, NULL, NULL, NULL, NULL, NULL),
(105, 2, 108, NULL, NULL, NULL, NULL, NULL),
(106, 2, 109, NULL, NULL, NULL, NULL, NULL),
(107, 2, 110, NULL, NULL, NULL, NULL, NULL),
(108, 2, 111, NULL, NULL, NULL, NULL, NULL),
(109, 2, 112, NULL, NULL, NULL, NULL, NULL),
(110, 2, 113, NULL, NULL, NULL, NULL, NULL),
(111, 2, 114, NULL, NULL, NULL, NULL, NULL),
(112, 2, 115, NULL, NULL, NULL, NULL, NULL),
(113, 2, 116, NULL, NULL, NULL, NULL, NULL),
(114, 2, 117, NULL, NULL, NULL, NULL, NULL),
(115, 2, 118, NULL, NULL, NULL, NULL, NULL),
(116, 2, 119, NULL, NULL, NULL, NULL, NULL),
(117, 2, 120, NULL, NULL, NULL, NULL, NULL),
(118, 2, 121, NULL, NULL, NULL, NULL, NULL),
(119, 2, 122, NULL, NULL, NULL, NULL, NULL),
(120, 2, 123, NULL, NULL, NULL, NULL, NULL),
(121, 2, 124, NULL, NULL, NULL, NULL, NULL),
(122, 2, 125, NULL, NULL, NULL, NULL, NULL),
(123, 2, 126, NULL, NULL, NULL, NULL, NULL),
(124, 2, 127, NULL, NULL, NULL, NULL, NULL),
(125, 2, 128, NULL, NULL, NULL, NULL, NULL),
(126, 2, 129, NULL, NULL, NULL, NULL, NULL),
(127, 2, 130, NULL, NULL, NULL, NULL, NULL),
(128, 2, 131, NULL, NULL, NULL, NULL, NULL),
(129, 2, 132, NULL, NULL, NULL, NULL, NULL),
(130, 2, 133, NULL, NULL, NULL, NULL, NULL),
(131, 2, 134, NULL, NULL, NULL, NULL, NULL),
(132, 2, 135, NULL, NULL, NULL, NULL, NULL),
(133, 2, 136, NULL, NULL, NULL, NULL, NULL),
(134, 2, 137, NULL, NULL, NULL, NULL, NULL),
(135, 2, 138, NULL, NULL, NULL, NULL, NULL),
(136, 2, 139, NULL, NULL, NULL, NULL, NULL),
(137, 2, 140, NULL, NULL, NULL, NULL, NULL),
(138, 2, 141, NULL, NULL, NULL, NULL, NULL),
(139, 2, 143, NULL, NULL, NULL, NULL, NULL),
(140, 2, 144, NULL, NULL, NULL, NULL, NULL),
(141, 2, 145, 0, NULL, NULL, NULL, NULL),
(142, 2, 146, NULL, NULL, NULL, NULL, NULL),
(143, 2, 147, NULL, NULL, NULL, NULL, NULL),
(144, 2, 148, NULL, NULL, NULL, NULL, NULL),
(145, 2, 149, NULL, NULL, NULL, NULL, NULL),
(146, 2, 150, NULL, NULL, NULL, NULL, NULL),
(147, 2, 151, NULL, NULL, NULL, NULL, NULL),
(148, 2, 152, NULL, NULL, NULL, NULL, NULL),
(149, 2, 153, NULL, NULL, NULL, NULL, NULL),
(150, 2, 154, NULL, NULL, NULL, NULL, NULL),
(151, 2, 155, NULL, NULL, NULL, NULL, NULL),
(152, 2, 156, NULL, NULL, NULL, NULL, NULL),
(153, 2, 157, NULL, NULL, NULL, NULL, NULL),
(154, 2, 158, NULL, NULL, NULL, NULL, NULL),
(155, 2, 159, NULL, NULL, NULL, NULL, NULL),
(156, 2, 160, NULL, NULL, NULL, NULL, NULL),
(157, 2, 161, NULL, NULL, NULL, NULL, NULL),
(158, 2, 162, NULL, NULL, NULL, NULL, NULL),
(159, 2, 163, NULL, NULL, NULL, NULL, NULL),
(160, 2, 164, NULL, NULL, NULL, NULL, NULL),
(161, 2, 165, NULL, NULL, NULL, NULL, NULL),
(162, 2, 166, NULL, NULL, NULL, NULL, NULL),
(163, 2, 167, NULL, NULL, NULL, NULL, NULL),
(164, 2, 168, NULL, NULL, NULL, NULL, NULL),
(165, 2, 169, NULL, NULL, NULL, NULL, NULL),
(166, 2, 170, NULL, NULL, NULL, NULL, NULL),
(167, 2, 171, NULL, NULL, NULL, NULL, NULL),
(168, 2, 172, NULL, NULL, NULL, NULL, NULL),
(169, 2, 173, NULL, NULL, NULL, NULL, NULL),
(170, 2, 174, NULL, NULL, NULL, NULL, NULL),
(171, 2, 175, NULL, NULL, NULL, NULL, NULL),
(172, 2, 176, NULL, NULL, NULL, NULL, NULL),
(173, 2, 177, NULL, NULL, NULL, NULL, NULL),
(174, 2, 178, NULL, NULL, NULL, NULL, NULL),
(175, 2, 179, NULL, NULL, NULL, NULL, NULL),
(176, 2, 180, NULL, NULL, NULL, NULL, NULL),
(177, 2, 181, NULL, NULL, NULL, NULL, NULL),
(178, 2, 182, -1, NULL, NULL, NULL, NULL),
(179, 2, 183, 490, NULL, NULL, NULL, NULL),
(180, 2, 184, NULL, NULL, NULL, NULL, NULL),
(181, 2, 185, NULL, NULL, NULL, NULL, NULL),
(182, 2, 186, NULL, NULL, NULL, NULL, NULL),
(183, 2, 187, NULL, NULL, NULL, NULL, NULL),
(184, 2, 188, NULL, NULL, NULL, NULL, NULL),
(185, 2, 189, NULL, NULL, NULL, NULL, NULL),
(186, 2, 190, NULL, NULL, NULL, NULL, NULL),
(187, 2, 191, NULL, NULL, NULL, NULL, NULL),
(188, 2, 192, NULL, NULL, NULL, NULL, NULL),
(189, 2, 193, NULL, NULL, NULL, NULL, NULL),
(190, 2, 194, NULL, NULL, NULL, NULL, NULL),
(191, 2, 195, NULL, NULL, NULL, NULL, NULL),
(192, 2, 196, NULL, NULL, NULL, NULL, NULL),
(193, 2, 197, NULL, NULL, NULL, NULL, NULL),
(194, 2, 198, NULL, NULL, NULL, NULL, NULL),
(195, 2, 199, NULL, NULL, NULL, NULL, NULL),
(196, 2, 200, NULL, NULL, NULL, NULL, NULL),
(197, 2, 201, NULL, NULL, NULL, NULL, NULL),
(198, 2, 202, NULL, NULL, NULL, NULL, NULL),
(199, 2, 203, NULL, NULL, NULL, NULL, NULL),
(200, 2, 204, NULL, NULL, NULL, NULL, NULL),
(201, 2, 205, NULL, NULL, NULL, NULL, NULL),
(202, 2, 206, NULL, NULL, NULL, NULL, NULL),
(203, 2, 207, NULL, NULL, NULL, NULL, NULL),
(204, 2, 208, NULL, NULL, NULL, NULL, NULL),
(205, 2, 209, NULL, NULL, NULL, NULL, NULL),
(206, 2, 210, NULL, NULL, NULL, NULL, NULL),
(207, 2, 211, NULL, NULL, NULL, NULL, NULL),
(208, 2, 212, NULL, NULL, NULL, NULL, NULL),
(209, 2, 213, NULL, NULL, NULL, NULL, NULL),
(210, 2, 214, NULL, NULL, NULL, NULL, NULL),
(211, 2, 215, NULL, NULL, NULL, NULL, NULL),
(212, 2, 216, NULL, NULL, NULL, NULL, NULL),
(213, 2, 217, NULL, NULL, NULL, NULL, NULL),
(214, 2, 218, NULL, NULL, NULL, NULL, NULL),
(215, 2, 219, NULL, NULL, NULL, NULL, NULL),
(216, 2, 220, NULL, NULL, NULL, NULL, NULL),
(217, 2, 221, NULL, NULL, NULL, NULL, NULL),
(218, 2, 222, NULL, NULL, NULL, NULL, NULL),
(219, 2, 223, -2, NULL, NULL, NULL, NULL),
(220, 2, 224, 23, NULL, NULL, NULL, NULL),
(221, 2, 225, NULL, NULL, NULL, NULL, NULL),
(222, 2, 226, NULL, NULL, NULL, NULL, NULL),
(223, 2, 227, NULL, NULL, NULL, NULL, NULL),
(224, 2, 228, NULL, NULL, NULL, NULL, NULL),
(225, 2, 229, NULL, NULL, NULL, NULL, NULL),
(226, 2, 230, NULL, NULL, NULL, NULL, NULL),
(227, 2, 231, NULL, NULL, NULL, NULL, NULL),
(228, 2, 232, NULL, NULL, NULL, NULL, NULL),
(229, 2, 233, NULL, NULL, NULL, NULL, NULL),
(230, 2, 234, NULL, NULL, NULL, NULL, NULL),
(231, 2, 235, -1, NULL, NULL, NULL, NULL),
(232, 2, 236, 48, NULL, NULL, NULL, NULL),
(233, 2, 237, NULL, NULL, NULL, NULL, NULL),
(234, 2, 238, NULL, NULL, NULL, NULL, NULL),
(235, 2, 239, NULL, NULL, NULL, NULL, NULL),
(236, 2, 240, NULL, NULL, NULL, NULL, NULL),
(237, 2, 241, NULL, NULL, NULL, NULL, NULL),
(238, 2, 242, NULL, NULL, NULL, NULL, NULL),
(239, 2, 243, NULL, NULL, NULL, NULL, NULL),
(240, 2, 244, NULL, NULL, NULL, NULL, NULL),
(241, 2, 245, NULL, NULL, NULL, NULL, NULL),
(242, 2, 246, NULL, NULL, NULL, NULL, NULL),
(243, 2, 247, NULL, NULL, NULL, NULL, NULL),
(244, 2, 248, NULL, NULL, NULL, NULL, NULL),
(245, 2, 249, NULL, NULL, NULL, NULL, NULL),
(246, 2, 250, NULL, NULL, NULL, NULL, NULL),
(247, 2, 251, NULL, NULL, NULL, NULL, NULL),
(248, 2, 252, NULL, NULL, NULL, NULL, NULL),
(249, 2, 253, NULL, NULL, NULL, NULL, NULL),
(250, 2, 254, NULL, NULL, NULL, NULL, NULL),
(251, 2, 255, NULL, NULL, NULL, NULL, NULL),
(252, 2, 256, NULL, NULL, NULL, NULL, NULL),
(253, 2, 257, NULL, NULL, NULL, NULL, NULL),
(254, 2, 258, -1, NULL, NULL, NULL, NULL),
(255, 2, 259, 56, NULL, NULL, NULL, NULL),
(256, 2, 260, NULL, NULL, NULL, NULL, NULL),
(257, 2, 261, NULL, NULL, NULL, NULL, NULL),
(258, 2, 262, NULL, NULL, NULL, NULL, NULL),
(259, 2, 263, NULL, NULL, NULL, NULL, NULL),
(260, 2, 264, NULL, NULL, NULL, NULL, NULL),
(261, 2, 265, NULL, NULL, NULL, NULL, NULL),
(262, 2, 266, NULL, NULL, NULL, NULL, NULL),
(263, 2, 267, NULL, NULL, NULL, NULL, NULL),
(264, 2, 268, NULL, NULL, NULL, NULL, NULL),
(265, 2, 269, NULL, NULL, NULL, NULL, NULL),
(266, 2, 270, NULL, NULL, NULL, NULL, NULL),
(267, 2, 271, NULL, NULL, NULL, NULL, NULL),
(268, 2, 272, NULL, NULL, NULL, NULL, NULL),
(269, 2, 273, NULL, NULL, NULL, NULL, NULL),
(270, 2, 274, NULL, NULL, NULL, NULL, NULL),
(271, 2, 275, NULL, NULL, NULL, NULL, NULL),
(272, 2, 276, NULL, NULL, NULL, NULL, NULL),
(273, 2, 277, NULL, NULL, NULL, NULL, NULL),
(274, 2, 278, NULL, NULL, NULL, NULL, NULL),
(275, 2, 279, NULL, NULL, NULL, NULL, NULL),
(276, 2, 280, NULL, NULL, NULL, NULL, NULL),
(277, 2, 281, NULL, NULL, NULL, NULL, NULL),
(278, 2, 282, NULL, NULL, NULL, NULL, NULL),
(279, 2, 283, NULL, NULL, NULL, NULL, NULL),
(280, 2, 284, NULL, NULL, NULL, NULL, NULL),
(281, 2, 285, NULL, NULL, NULL, NULL, NULL),
(282, 2, 286, NULL, NULL, NULL, NULL, NULL),
(283, 2, 287, NULL, NULL, NULL, NULL, NULL),
(284, 2, 288, NULL, NULL, NULL, NULL, NULL),
(285, 2, 289, NULL, NULL, NULL, NULL, NULL),
(286, 2, 290, NULL, NULL, NULL, NULL, NULL),
(287, 2, 291, NULL, NULL, NULL, NULL, NULL),
(288, 2, 292, NULL, NULL, NULL, NULL, NULL),
(289, 2, 293, NULL, NULL, NULL, NULL, NULL),
(290, 2, 294, NULL, NULL, NULL, NULL, NULL),
(291, 2, 295, NULL, NULL, NULL, NULL, NULL),
(292, 2, 296, -1, NULL, NULL, NULL, NULL),
(293, 2, 297, 19, NULL, NULL, NULL, NULL),
(294, 2, 298, -1, NULL, NULL, NULL, NULL),
(295, 2, 299, 23, NULL, NULL, NULL, NULL),
(296, 2, 300, NULL, NULL, NULL, NULL, NULL),
(297, 2, 301, NULL, NULL, NULL, NULL, NULL),
(298, 2, 302, NULL, NULL, NULL, NULL, NULL),
(299, 2, 303, NULL, NULL, NULL, NULL, NULL),
(300, 2, 304, NULL, NULL, NULL, NULL, NULL),
(301, 2, 305, NULL, NULL, NULL, NULL, NULL),
(302, 2, 306, NULL, NULL, NULL, NULL, NULL),
(303, 2, 307, NULL, NULL, NULL, NULL, NULL),
(304, 2, 308, NULL, NULL, NULL, NULL, NULL),
(305, 2, 309, NULL, NULL, NULL, NULL, NULL),
(306, 2, 310, 0, NULL, NULL, NULL, NULL),
(307, 2, 311, NULL, NULL, NULL, NULL, NULL),
(308, 2, 312, NULL, NULL, NULL, NULL, NULL),
(309, 2, 313, NULL, NULL, NULL, NULL, NULL),
(310, 2, 314, NULL, NULL, NULL, NULL, NULL),
(311, 2, 315, NULL, NULL, NULL, NULL, NULL),
(312, 2, 316, NULL, NULL, NULL, NULL, NULL),
(313, 2, 317, NULL, NULL, NULL, NULL, NULL),
(314, 2, 318, NULL, NULL, NULL, NULL, NULL),
(315, 2, 319, NULL, NULL, NULL, NULL, NULL),
(316, 2, 320, NULL, NULL, NULL, NULL, NULL),
(317, 2, 321, NULL, NULL, NULL, NULL, NULL),
(318, 2, 322, 0, NULL, NULL, NULL, NULL),
(319, 2, 323, NULL, NULL, NULL, NULL, NULL),
(320, 2, 324, NULL, NULL, NULL, NULL, NULL),
(321, 2, 325, NULL, NULL, NULL, NULL, NULL),
(322, 2, 326, NULL, NULL, NULL, NULL, NULL),
(323, 2, 327, NULL, NULL, NULL, NULL, NULL),
(324, 2, 328, NULL, NULL, NULL, NULL, NULL),
(325, 2, 329, NULL, NULL, NULL, NULL, NULL),
(326, 2, 331, 0, NULL, NULL, NULL, NULL),
(327, 2, 332, NULL, NULL, NULL, NULL, NULL),
(328, 2, 333, NULL, NULL, NULL, NULL, NULL),
(329, 2, 334, NULL, NULL, NULL, NULL, NULL),
(330, 2, 335, NULL, NULL, NULL, NULL, NULL),
(331, 2, 336, NULL, NULL, NULL, NULL, NULL),
(332, 2, 337, NULL, NULL, NULL, NULL, NULL),
(333, 2, 338, NULL, NULL, NULL, NULL, NULL),
(334, 2, 339, NULL, NULL, NULL, NULL, NULL),
(335, 2, 340, NULL, NULL, NULL, NULL, NULL),
(336, 2, 341, NULL, NULL, NULL, NULL, NULL),
(337, 2, 342, NULL, NULL, NULL, NULL, NULL),
(338, 2, 343, NULL, NULL, NULL, NULL, NULL),
(339, 2, 344, NULL, NULL, NULL, NULL, NULL),
(340, 2, 345, 0, NULL, NULL, NULL, NULL),
(341, 2, 346, 0, NULL, NULL, NULL, NULL),
(342, 2, 347, NULL, NULL, NULL, NULL, NULL),
(343, 2, 348, NULL, NULL, NULL, NULL, NULL),
(344, 2, 349, NULL, NULL, NULL, NULL, NULL),
(345, 2, 350, NULL, NULL, NULL, NULL, NULL),
(346, 2, 351, NULL, NULL, NULL, NULL, NULL),
(347, 2, 352, NULL, NULL, NULL, NULL, NULL),
(348, 2, 353, NULL, NULL, NULL, NULL, NULL),
(349, 2, 354, NULL, NULL, NULL, NULL, NULL),
(350, 2, 355, NULL, NULL, NULL, NULL, NULL),
(351, 2, 356, NULL, NULL, NULL, NULL, NULL),
(352, 2, 357, NULL, NULL, NULL, NULL, NULL),
(353, 2, 358, NULL, NULL, NULL, NULL, NULL),
(354, 2, 359, NULL, NULL, NULL, NULL, NULL),
(355, 2, 360, NULL, NULL, NULL, NULL, NULL),
(356, 2, 361, 0, NULL, NULL, NULL, NULL),
(357, 2, 362, NULL, NULL, NULL, NULL, NULL),
(358, 2, 363, NULL, NULL, NULL, NULL, NULL),
(359, 2, 364, NULL, NULL, NULL, NULL, NULL),
(360, 2, 365, NULL, NULL, NULL, NULL, NULL),
(361, 2, 366, NULL, NULL, NULL, NULL, NULL),
(362, 2, 367, NULL, NULL, NULL, NULL, NULL),
(363, 2, 368, NULL, NULL, NULL, NULL, NULL),
(364, 2, 369, NULL, NULL, NULL, NULL, NULL),
(365, 2, 370, NULL, NULL, NULL, NULL, NULL),
(366, 2, 371, NULL, NULL, NULL, NULL, NULL),
(367, 2, 372, NULL, NULL, NULL, NULL, NULL),
(368, 2, 373, NULL, NULL, NULL, NULL, NULL),
(369, 2, 374, NULL, NULL, NULL, NULL, NULL),
(370, 2, 375, NULL, NULL, NULL, NULL, NULL),
(371, 2, 376, 0, NULL, NULL, NULL, NULL),
(372, 2, 377, NULL, NULL, NULL, NULL, NULL),
(373, 2, 378, -1, NULL, NULL, NULL, NULL),
(374, 2, 379, 18, NULL, NULL, NULL, NULL),
(375, 2, 380, NULL, NULL, NULL, NULL, NULL),
(376, 2, 381, NULL, NULL, NULL, NULL, NULL),
(377, 2, 382, 0, NULL, NULL, NULL, NULL),
(378, 2, 383, 0, NULL, NULL, NULL, NULL),
(379, 2, 384, 0, NULL, NULL, NULL, NULL),
(380, 2, 385, 0, NULL, NULL, NULL, NULL),
(381, 2, 386, NULL, NULL, NULL, NULL, NULL),
(382, 2, 387, NULL, NULL, NULL, NULL, NULL),
(383, 2, 388, NULL, NULL, NULL, NULL, NULL),
(384, 2, 389, NULL, NULL, NULL, NULL, NULL),
(385, 2, 390, NULL, NULL, NULL, NULL, NULL),
(386, 2, 391, NULL, NULL, NULL, NULL, NULL),
(387, 2, 392, NULL, NULL, NULL, NULL, NULL),
(388, 2, 393, NULL, NULL, NULL, NULL, NULL),
(389, 2, 394, 0, NULL, NULL, NULL, NULL),
(390, 2, 395, 0, NULL, NULL, NULL, NULL),
(391, 2, 396, NULL, NULL, NULL, NULL, NULL),
(392, 2, 397, NULL, NULL, NULL, NULL, NULL),
(393, 2, 398, NULL, NULL, NULL, NULL, NULL),
(394, 2, 399, NULL, NULL, NULL, NULL, NULL),
(395, 2, 400, NULL, NULL, NULL, NULL, NULL),
(396, 2, 401, NULL, NULL, NULL, NULL, NULL),
(397, 2, 402, -1, NULL, NULL, NULL, NULL),
(398, 2, 403, 18, NULL, NULL, NULL, NULL),
(399, 2, 404, -1, NULL, NULL, NULL, NULL),
(400, 2, 405, 19, NULL, NULL, NULL, NULL),
(401, 2, 406, NULL, NULL, NULL, NULL, NULL),
(402, 2, 407, NULL, NULL, NULL, NULL, NULL),
(403, 2, 408, NULL, NULL, NULL, NULL, NULL),
(404, 2, 409, NULL, NULL, NULL, NULL, NULL),
(405, 2, 410, NULL, NULL, NULL, NULL, NULL),
(406, 2, 411, NULL, NULL, NULL, NULL, NULL),
(407, 2, 412, NULL, NULL, NULL, NULL, NULL),
(408, 2, 413, NULL, NULL, NULL, NULL, NULL),
(409, 2, 414, NULL, NULL, NULL, NULL, NULL),
(410, 2, 415, NULL, NULL, NULL, NULL, NULL),
(411, 2, 416, NULL, NULL, NULL, NULL, NULL),
(412, 2, 417, NULL, NULL, NULL, NULL, NULL),
(413, 2, 418, NULL, NULL, NULL, NULL, NULL),
(414, 2, 419, NULL, NULL, NULL, NULL, NULL),
(415, 2, 420, -1, NULL, NULL, NULL, NULL),
(416, 2, 421, 19, NULL, NULL, NULL, NULL),
(417, 2, 422, -1, NULL, NULL, NULL, NULL),
(418, 2, 423, 19, NULL, NULL, NULL, NULL),
(419, 2, 424, 0, NULL, NULL, NULL, NULL),
(420, 2, 425, 0, NULL, NULL, NULL, NULL),
(421, 2, 426, NULL, NULL, NULL, NULL, NULL),
(422, 2, 427, NULL, NULL, NULL, NULL, NULL),
(423, 2, 428, NULL, NULL, NULL, NULL, NULL),
(424, 2, 429, NULL, NULL, NULL, NULL, NULL),
(425, 2, 430, NULL, NULL, NULL, NULL, NULL),
(426, 2, 431, NULL, NULL, NULL, NULL, NULL),
(427, 2, 432, 0, NULL, NULL, NULL, NULL),
(428, 2, 433, 0, NULL, NULL, NULL, NULL),
(429, 2, 434, NULL, NULL, NULL, NULL, NULL),
(430, 2, 435, NULL, NULL, NULL, NULL, NULL),
(431, 2, 436, NULL, NULL, NULL, NULL, NULL),
(432, 2, 437, NULL, NULL, NULL, NULL, NULL),
(433, 2, 438, NULL, NULL, NULL, NULL, NULL),
(434, 2, 439, NULL, NULL, NULL, NULL, NULL),
(435, 2, 440, 0, NULL, NULL, NULL, NULL),
(436, 2, 441, 0, NULL, NULL, NULL, NULL),
(437, 2, 442, NULL, NULL, NULL, NULL, NULL),
(438, 2, 443, NULL, NULL, NULL, NULL, NULL),
(439, 2, 444, NULL, NULL, NULL, NULL, NULL),
(440, 2, 445, NULL, NULL, NULL, NULL, NULL),
(441, 2, 446, NULL, NULL, NULL, NULL, NULL),
(442, 2, 447, NULL, NULL, NULL, NULL, NULL),
(443, 2, 448, NULL, NULL, NULL, NULL, NULL),
(444, 2, 449, NULL, NULL, NULL, NULL, NULL),
(445, 2, 450, NULL, NULL, NULL, NULL, NULL),
(446, 2, 451, NULL, NULL, NULL, NULL, NULL),
(447, 2, 452, NULL, NULL, NULL, NULL, NULL),
(448, 2, 453, NULL, NULL, NULL, NULL, NULL),
(449, 2, 454, NULL, NULL, NULL, NULL, NULL),
(450, 2, 455, NULL, NULL, NULL, NULL, NULL),
(451, 2, 456, NULL, NULL, NULL, NULL, NULL),
(452, 2, 457, NULL, NULL, NULL, NULL, NULL),
(453, 2, 458, NULL, NULL, NULL, NULL, NULL),
(454, 2, 459, NULL, NULL, NULL, NULL, NULL),
(455, 2, 460, NULL, NULL, NULL, NULL, NULL),
(456, 2, 461, NULL, NULL, NULL, NULL, NULL),
(457, 2, 462, NULL, NULL, NULL, NULL, NULL),
(458, 2, 463, NULL, NULL, NULL, NULL, NULL),
(459, 2, 464, NULL, NULL, NULL, NULL, NULL),
(460, 2, 465, NULL, NULL, NULL, NULL, NULL),
(461, 2, 466, NULL, NULL, NULL, NULL, NULL),
(462, 2, 467, NULL, NULL, NULL, NULL, NULL),
(463, 2, 468, NULL, NULL, NULL, NULL, NULL),
(464, 2, 469, NULL, NULL, NULL, NULL, NULL),
(465, 2, 470, NULL, NULL, NULL, NULL, NULL),
(466, 2, 471, NULL, NULL, NULL, NULL, NULL),
(467, 2, 472, NULL, NULL, NULL, NULL, NULL),
(468, 2, 473, NULL, NULL, NULL, NULL, NULL),
(469, 2, 474, NULL, NULL, NULL, NULL, NULL),
(470, 2, 475, NULL, NULL, NULL, NULL, NULL),
(471, 2, 476, NULL, NULL, NULL, NULL, NULL),
(472, 2, 477, NULL, NULL, NULL, NULL, NULL),
(473, 2, 478, NULL, NULL, NULL, NULL, NULL),
(474, 2, 479, NULL, NULL, NULL, NULL, NULL),
(475, 2, 480, NULL, NULL, NULL, NULL, NULL),
(476, 2, 481, NULL, NULL, NULL, NULL, NULL),
(477, 2, 482, NULL, NULL, NULL, NULL, NULL),
(478, 2, 483, NULL, NULL, NULL, NULL, NULL),
(479, 2, 484, NULL, NULL, NULL, NULL, NULL),
(480, 2, 485, NULL, NULL, NULL, NULL, NULL),
(481, 2, 486, NULL, NULL, NULL, NULL, NULL),
(482, 2, 487, NULL, NULL, NULL, NULL, NULL),
(483, 2, 488, NULL, NULL, NULL, NULL, NULL),
(484, 2, 489, NULL, NULL, NULL, NULL, NULL),
(485, 2, 490, NULL, NULL, NULL, NULL, NULL),
(486, 2, 491, NULL, NULL, NULL, NULL, NULL),
(487, 2, 492, NULL, NULL, NULL, NULL, NULL),
(488, 2, 493, NULL, NULL, NULL, NULL, NULL),
(489, 2, 494, NULL, NULL, NULL, NULL, NULL),
(490, 2, 495, NULL, NULL, NULL, NULL, NULL),
(491, 2, 496, NULL, NULL, NULL, NULL, NULL),
(492, 2, 497, NULL, NULL, NULL, NULL, NULL),
(493, 2, 498, NULL, NULL, NULL, NULL, NULL),
(494, 2, 499, NULL, NULL, NULL, NULL, NULL),
(495, 2, 500, NULL, NULL, NULL, NULL, NULL),
(496, 2, 501, NULL, NULL, NULL, NULL, NULL),
(497, 2, 502, NULL, NULL, NULL, NULL, NULL),
(498, 2, 503, NULL, NULL, NULL, NULL, NULL),
(499, 2, 504, NULL, NULL, NULL, NULL, NULL),
(500, 2, 505, NULL, NULL, NULL, NULL, NULL),
(501, 2, 506, NULL, NULL, NULL, NULL, NULL),
(502, 2, 507, NULL, NULL, NULL, NULL, NULL),
(503, 2, 508, NULL, NULL, NULL, NULL, NULL),
(504, 2, 509, NULL, NULL, NULL, NULL, NULL),
(505, 2, 510, NULL, NULL, NULL, NULL, NULL),
(506, 2, 511, NULL, NULL, NULL, NULL, NULL),
(507, 2, 512, NULL, NULL, NULL, NULL, NULL),
(508, 2, 513, NULL, NULL, NULL, NULL, NULL),
(509, 2, 514, NULL, NULL, NULL, NULL, NULL),
(510, 2, 515, NULL, NULL, NULL, NULL, NULL),
(511, 2, 516, NULL, NULL, NULL, NULL, NULL),
(512, 2, 517, NULL, NULL, NULL, NULL, NULL),
(513, 2, 518, NULL, NULL, NULL, NULL, NULL),
(514, 2, 519, NULL, NULL, NULL, NULL, NULL),
(515, 2, 520, NULL, NULL, NULL, NULL, NULL),
(516, 2, 521, NULL, NULL, NULL, NULL, NULL),
(517, 2, 522, NULL, NULL, NULL, NULL, NULL),
(518, 2, 523, NULL, NULL, NULL, NULL, NULL),
(519, 2, 524, NULL, NULL, NULL, NULL, NULL),
(520, 2, 525, NULL, NULL, NULL, NULL, NULL),
(521, 2, 526, NULL, NULL, NULL, NULL, NULL),
(522, 2, 527, NULL, NULL, NULL, NULL, NULL),
(523, 2, 528, NULL, NULL, NULL, NULL, NULL),
(524, 2, 529, NULL, NULL, NULL, NULL, NULL),
(525, 2, 530, NULL, NULL, NULL, NULL, NULL),
(526, 2, 531, NULL, NULL, NULL, NULL, NULL),
(527, 2, 532, NULL, NULL, NULL, NULL, NULL),
(528, 2, 533, NULL, NULL, NULL, NULL, NULL),
(529, 2, 534, NULL, NULL, NULL, NULL, NULL),
(530, 2, 535, NULL, NULL, NULL, NULL, NULL),
(531, 2, 536, NULL, NULL, NULL, NULL, NULL),
(532, 2, 537, NULL, NULL, NULL, NULL, NULL),
(533, 2, 538, NULL, NULL, NULL, NULL, NULL),
(534, 2, 539, NULL, NULL, NULL, NULL, NULL),
(535, 2, 540, NULL, NULL, NULL, NULL, NULL),
(536, 2, 541, NULL, NULL, NULL, NULL, NULL),
(537, 2, 542, NULL, NULL, NULL, NULL, NULL),
(538, 2, 543, NULL, NULL, NULL, NULL, NULL),
(539, 2, 544, NULL, NULL, NULL, NULL, NULL),
(540, 2, 545, NULL, NULL, NULL, NULL, NULL),
(541, 2, 546, NULL, NULL, NULL, NULL, NULL),
(542, 2, 547, NULL, NULL, NULL, NULL, NULL),
(543, 2, 548, NULL, NULL, NULL, NULL, NULL),
(544, 2, 549, NULL, NULL, NULL, NULL, NULL),
(545, 2, 550, 0, 0.00, 0.00, 500000.00, NULL),
(546, 2, 551, 0, 0.00, NULL, 5000.00, NULL),
(547, 2, 552, NULL, NULL, NULL, NULL, NULL),
(548, 2, 553, NULL, NULL, NULL, NULL, NULL),
(549, 2, 562, NULL, NULL, NULL, NULL, NULL),
(550, 2, 563, NULL, NULL, NULL, NULL, NULL),
(551, 2, 564, NULL, NULL, NULL, NULL, NULL),
(552, 2, 565, NULL, NULL, NULL, NULL, NULL),
(553, 2, 566, NULL, NULL, NULL, NULL, NULL),
(554, 2, 567, NULL, NULL, NULL, NULL, NULL),
(555, 2, 568, NULL, NULL, NULL, NULL, NULL),
(556, 2, 569, NULL, NULL, NULL, NULL, NULL),
(557, 2, 570, NULL, NULL, NULL, NULL, NULL),
(558, 2, 571, NULL, NULL, NULL, NULL, NULL),
(559, 2, 572, NULL, NULL, NULL, NULL, NULL),
(560, 2, 573, NULL, NULL, NULL, NULL, NULL),
(561, 2, 574, NULL, NULL, NULL, NULL, NULL),
(562, 2, 575, NULL, NULL, NULL, NULL, NULL),
(563, 2, 576, NULL, NULL, NULL, NULL, NULL),
(564, 2, 577, NULL, NULL, NULL, NULL, NULL),
(565, 2, 578, NULL, NULL, NULL, NULL, NULL),
(566, 2, 579, NULL, NULL, NULL, NULL, NULL),
(567, 2, 580, NULL, NULL, NULL, NULL, NULL),
(568, 2, 581, NULL, NULL, NULL, NULL, NULL),
(569, 2, 582, NULL, NULL, NULL, NULL, NULL),
(570, 2, 583, NULL, NULL, NULL, NULL, NULL),
(571, 2, 584, NULL, NULL, NULL, NULL, NULL),
(572, 2, 585, NULL, NULL, NULL, NULL, NULL),
(573, 2, 586, NULL, NULL, NULL, NULL, NULL),
(574, 2, 587, NULL, NULL, NULL, NULL, NULL),
(575, 2, 588, 0, 0.00, 0.00, 0.00, NULL),
(576, 2, 589, NULL, NULL, NULL, NULL, NULL),
(577, 2, 590, NULL, NULL, NULL, NULL, NULL),
(578, 2, 591, NULL, NULL, NULL, NULL, NULL),
(579, 2, 592, 0, NULL, NULL, 900000.00, NULL),
(580, 2, 593, 0, NULL, NULL, NULL, NULL),
(581, 3, 4, NULL, NULL, NULL, 0.00, NULL),
(582, 3, 5, NULL, NULL, NULL, NULL, NULL),
(583, 3, 6, NULL, NULL, NULL, NULL, NULL),
(584, 3, 7, NULL, NULL, NULL, NULL, NULL),
(585, 3, 8, NULL, NULL, NULL, NULL, NULL),
(586, 3, 9, 10, 0.00, 0.00, 0.00, NULL),
(587, 3, 10, 1, NULL, NULL, NULL, NULL),
(588, 3, 11, 50, 0.00, 0.00, 0.00, NULL),
(589, 3, 12, NULL, NULL, NULL, NULL, NULL),
(590, 3, 13, 50, 0.00, 0.00, 0.00, NULL),
(591, 3, 14, NULL, NULL, NULL, NULL, NULL),
(592, 3, 15, 25, 0.00, 0.00, 0.00, NULL),
(593, 3, 16, NULL, NULL, NULL, NULL, NULL),
(594, 3, 17, NULL, NULL, NULL, NULL, NULL),
(595, 3, 18, NULL, NULL, NULL, NULL, NULL),
(596, 3, 19, NULL, NULL, NULL, NULL, NULL),
(597, 3, 20, NULL, NULL, NULL, NULL, NULL),
(598, 3, 21, NULL, NULL, NULL, NULL, NULL),
(599, 3, 22, NULL, NULL, NULL, NULL, NULL),
(600, 3, 23, NULL, NULL, NULL, NULL, NULL),
(601, 3, 24, NULL, NULL, NULL, NULL, NULL),
(602, 3, 25, NULL, NULL, NULL, NULL, NULL),
(603, 3, 26, NULL, NULL, NULL, NULL, NULL),
(604, 3, 27, NULL, NULL, NULL, NULL, NULL),
(605, 3, 28, NULL, NULL, NULL, NULL, NULL),
(606, 3, 29, NULL, NULL, NULL, NULL, NULL),
(607, 3, 30, NULL, NULL, NULL, NULL, NULL),
(608, 3, 31, NULL, NULL, NULL, NULL, NULL),
(609, 3, 32, NULL, NULL, NULL, NULL, NULL),
(610, 3, 33, NULL, NULL, NULL, NULL, NULL),
(611, 3, 34, NULL, NULL, NULL, NULL, NULL),
(612, 3, 35, NULL, NULL, NULL, NULL, NULL),
(613, 3, 36, NULL, NULL, NULL, NULL, NULL),
(614, 3, 37, NULL, NULL, NULL, NULL, NULL),
(615, 3, 38, NULL, NULL, NULL, NULL, NULL),
(616, 3, 39, NULL, NULL, NULL, NULL, NULL),
(617, 3, 40, NULL, NULL, NULL, NULL, NULL),
(618, 3, 41, NULL, NULL, NULL, NULL, NULL),
(619, 3, 42, NULL, NULL, NULL, NULL, NULL),
(620, 3, 43, NULL, NULL, NULL, NULL, NULL),
(621, 3, 44, NULL, NULL, NULL, NULL, NULL),
(622, 3, 45, NULL, NULL, NULL, NULL, NULL),
(623, 3, 46, NULL, NULL, NULL, NULL, NULL),
(624, 3, 47, NULL, NULL, NULL, NULL, NULL),
(625, 3, 48, NULL, NULL, NULL, NULL, NULL),
(626, 3, 49, NULL, NULL, NULL, NULL, NULL),
(627, 3, 50, NULL, NULL, NULL, NULL, NULL),
(628, 3, 51, NULL, NULL, NULL, NULL, NULL),
(629, 3, 52, NULL, NULL, NULL, NULL, NULL),
(630, 3, 53, NULL, NULL, NULL, NULL, NULL),
(631, 3, 54, NULL, NULL, NULL, NULL, NULL),
(632, 3, 55, NULL, NULL, NULL, NULL, NULL),
(633, 3, 56, NULL, NULL, NULL, NULL, NULL),
(634, 3, 57, NULL, NULL, NULL, NULL, NULL),
(635, 3, 58, NULL, NULL, NULL, NULL, NULL),
(636, 3, 59, NULL, NULL, NULL, NULL, NULL),
(637, 3, 60, NULL, NULL, NULL, NULL, NULL),
(638, 3, 61, NULL, NULL, NULL, NULL, NULL),
(639, 3, 62, NULL, NULL, NULL, NULL, NULL),
(640, 3, 63, NULL, NULL, NULL, NULL, NULL),
(641, 3, 64, NULL, NULL, NULL, NULL, NULL),
(642, 3, 65, NULL, NULL, NULL, NULL, NULL),
(643, 3, 66, NULL, NULL, NULL, NULL, NULL),
(644, 3, 67, NULL, NULL, NULL, NULL, NULL),
(645, 3, 68, NULL, NULL, NULL, NULL, NULL),
(646, 3, 69, NULL, NULL, NULL, NULL, NULL),
(647, 3, 70, NULL, NULL, NULL, NULL, NULL),
(648, 3, 71, NULL, NULL, NULL, NULL, NULL),
(649, 3, 72, NULL, NULL, NULL, NULL, NULL),
(650, 3, 73, NULL, NULL, NULL, NULL, NULL),
(651, 3, 74, NULL, NULL, NULL, NULL, NULL),
(652, 3, 75, NULL, NULL, NULL, NULL, NULL),
(653, 3, 76, NULL, NULL, NULL, NULL, NULL),
(654, 3, 77, NULL, NULL, NULL, NULL, NULL),
(655, 3, 78, NULL, NULL, NULL, NULL, NULL),
(656, 3, 79, NULL, NULL, NULL, NULL, NULL),
(657, 3, 80, NULL, NULL, NULL, NULL, NULL),
(658, 3, 81, NULL, NULL, NULL, NULL, NULL),
(659, 3, 82, NULL, NULL, NULL, NULL, NULL),
(660, 3, 83, NULL, NULL, NULL, NULL, NULL),
(661, 3, 84, NULL, NULL, NULL, NULL, NULL),
(662, 3, 85, NULL, NULL, NULL, NULL, NULL),
(663, 3, 86, NULL, NULL, NULL, NULL, NULL),
(664, 3, 87, NULL, NULL, NULL, NULL, NULL),
(665, 3, 88, NULL, NULL, NULL, NULL, NULL),
(666, 3, 89, NULL, NULL, NULL, NULL, NULL),
(667, 3, 90, NULL, NULL, NULL, NULL, NULL),
(668, 3, 91, NULL, NULL, NULL, NULL, NULL),
(669, 3, 92, NULL, NULL, NULL, NULL, NULL),
(670, 3, 93, NULL, NULL, NULL, NULL, NULL),
(671, 3, 94, NULL, NULL, NULL, NULL, NULL),
(672, 3, 95, NULL, NULL, NULL, NULL, NULL),
(673, 3, 96, NULL, NULL, NULL, NULL, NULL),
(674, 3, 97, NULL, NULL, NULL, NULL, NULL),
(675, 3, 98, NULL, NULL, NULL, NULL, NULL),
(676, 3, 99, NULL, NULL, NULL, NULL, NULL),
(677, 3, 100, NULL, NULL, NULL, NULL, NULL),
(678, 3, 101, NULL, NULL, NULL, NULL, NULL),
(679, 3, 102, NULL, NULL, NULL, NULL, NULL),
(680, 3, 103, NULL, NULL, NULL, NULL, NULL),
(681, 3, 104, NULL, NULL, NULL, NULL, NULL),
(682, 3, 105, NULL, NULL, NULL, NULL, NULL),
(683, 3, 106, NULL, NULL, NULL, NULL, NULL),
(684, 3, 107, NULL, NULL, NULL, NULL, NULL),
(685, 3, 108, NULL, NULL, NULL, NULL, NULL),
(686, 3, 109, NULL, NULL, NULL, NULL, NULL),
(687, 3, 110, NULL, NULL, NULL, NULL, NULL),
(688, 3, 111, NULL, NULL, NULL, NULL, NULL),
(689, 3, 112, NULL, NULL, NULL, NULL, NULL),
(690, 3, 113, NULL, NULL, NULL, NULL, NULL),
(691, 3, 114, NULL, NULL, NULL, NULL, NULL),
(692, 3, 115, NULL, NULL, NULL, NULL, NULL),
(693, 3, 116, NULL, NULL, NULL, NULL, NULL),
(694, 3, 117, NULL, NULL, NULL, NULL, NULL),
(695, 3, 118, NULL, NULL, NULL, NULL, NULL),
(696, 3, 119, NULL, NULL, NULL, NULL, NULL),
(697, 3, 120, NULL, NULL, NULL, NULL, NULL),
(698, 3, 121, NULL, NULL, NULL, NULL, NULL),
(699, 3, 122, NULL, NULL, NULL, NULL, NULL),
(700, 3, 123, NULL, NULL, NULL, NULL, NULL),
(701, 3, 124, NULL, NULL, NULL, NULL, NULL),
(702, 3, 125, NULL, NULL, NULL, NULL, NULL),
(703, 3, 126, NULL, NULL, NULL, NULL, NULL),
(704, 3, 127, NULL, NULL, NULL, NULL, NULL),
(705, 3, 128, NULL, NULL, NULL, NULL, NULL),
(706, 3, 129, NULL, NULL, NULL, NULL, NULL),
(707, 3, 130, NULL, NULL, NULL, NULL, NULL),
(708, 3, 131, NULL, NULL, NULL, NULL, NULL),
(709, 3, 132, NULL, NULL, NULL, NULL, NULL),
(710, 3, 133, NULL, NULL, NULL, NULL, NULL),
(711, 3, 134, NULL, NULL, NULL, NULL, NULL),
(712, 3, 135, NULL, NULL, NULL, NULL, NULL),
(713, 3, 136, NULL, NULL, NULL, NULL, NULL),
(714, 3, 137, NULL, NULL, NULL, NULL, NULL),
(715, 3, 138, NULL, NULL, NULL, NULL, NULL),
(716, 3, 139, NULL, NULL, NULL, NULL, NULL),
(717, 3, 140, NULL, NULL, NULL, NULL, NULL),
(718, 3, 141, NULL, NULL, NULL, NULL, NULL),
(719, 3, 143, NULL, NULL, NULL, NULL, NULL),
(720, 3, 144, NULL, NULL, NULL, NULL, NULL),
(721, 3, 145, NULL, NULL, NULL, NULL, NULL),
(722, 3, 146, NULL, NULL, NULL, NULL, NULL),
(723, 3, 147, NULL, NULL, NULL, NULL, NULL),
(724, 3, 148, NULL, NULL, NULL, NULL, NULL),
(725, 3, 149, NULL, NULL, NULL, NULL, NULL),
(726, 3, 150, NULL, NULL, NULL, NULL, NULL),
(727, 3, 151, NULL, NULL, NULL, NULL, NULL),
(728, 3, 152, NULL, NULL, NULL, NULL, NULL),
(729, 3, 153, NULL, NULL, NULL, NULL, NULL),
(730, 3, 154, NULL, NULL, NULL, NULL, NULL),
(731, 3, 155, NULL, NULL, NULL, NULL, NULL),
(732, 3, 156, NULL, NULL, NULL, NULL, NULL),
(733, 3, 157, NULL, NULL, NULL, NULL, NULL),
(734, 3, 158, NULL, NULL, NULL, NULL, NULL),
(735, 3, 159, NULL, NULL, NULL, NULL, NULL),
(736, 3, 160, NULL, NULL, NULL, NULL, NULL),
(737, 3, 161, NULL, NULL, NULL, NULL, NULL),
(738, 3, 162, NULL, NULL, NULL, NULL, NULL),
(739, 3, 163, NULL, NULL, NULL, NULL, NULL),
(740, 3, 164, NULL, NULL, NULL, NULL, NULL),
(741, 3, 165, NULL, NULL, NULL, NULL, NULL),
(742, 3, 166, NULL, NULL, NULL, NULL, NULL),
(743, 3, 167, NULL, NULL, NULL, NULL, NULL),
(744, 3, 168, NULL, NULL, NULL, NULL, NULL),
(745, 3, 169, NULL, NULL, NULL, NULL, NULL),
(746, 3, 170, NULL, NULL, NULL, NULL, NULL),
(747, 3, 171, NULL, NULL, NULL, NULL, NULL),
(748, 3, 172, NULL, NULL, NULL, NULL, NULL),
(749, 3, 173, NULL, NULL, NULL, NULL, NULL),
(750, 3, 174, NULL, NULL, NULL, NULL, NULL),
(751, 3, 175, NULL, NULL, NULL, NULL, NULL),
(752, 3, 176, NULL, NULL, NULL, NULL, NULL),
(753, 3, 177, NULL, NULL, NULL, NULL, NULL),
(754, 3, 178, NULL, NULL, NULL, NULL, NULL),
(755, 3, 179, NULL, NULL, NULL, NULL, NULL),
(756, 3, 180, NULL, NULL, NULL, NULL, NULL),
(757, 3, 181, NULL, NULL, NULL, NULL, NULL),
(758, 3, 182, NULL, NULL, NULL, NULL, NULL),
(759, 3, 183, NULL, NULL, NULL, NULL, NULL),
(760, 3, 184, NULL, NULL, NULL, NULL, NULL),
(761, 3, 185, NULL, NULL, NULL, NULL, NULL),
(762, 3, 186, NULL, NULL, NULL, NULL, NULL),
(763, 3, 187, NULL, NULL, NULL, NULL, NULL),
(764, 3, 188, NULL, NULL, NULL, NULL, NULL),
(765, 3, 189, NULL, NULL, NULL, NULL, NULL),
(766, 3, 190, NULL, NULL, NULL, NULL, NULL),
(767, 3, 191, NULL, NULL, NULL, NULL, NULL),
(768, 3, 192, NULL, NULL, NULL, NULL, NULL),
(769, 3, 193, NULL, NULL, NULL, NULL, NULL),
(770, 3, 194, NULL, NULL, NULL, NULL, NULL),
(771, 3, 195, NULL, NULL, NULL, NULL, NULL),
(772, 3, 196, NULL, NULL, NULL, NULL, NULL),
(773, 3, 197, NULL, NULL, NULL, NULL, NULL),
(774, 3, 198, NULL, NULL, NULL, NULL, NULL),
(775, 3, 199, NULL, NULL, NULL, NULL, NULL),
(776, 3, 200, NULL, NULL, NULL, NULL, NULL),
(777, 3, 201, NULL, NULL, NULL, NULL, NULL),
(778, 3, 202, NULL, NULL, NULL, NULL, NULL),
(779, 3, 203, NULL, NULL, NULL, NULL, NULL),
(780, 3, 204, NULL, NULL, NULL, NULL, NULL),
(781, 3, 205, NULL, NULL, NULL, NULL, NULL),
(782, 3, 206, NULL, NULL, NULL, NULL, NULL),
(783, 3, 207, NULL, NULL, NULL, NULL, NULL),
(784, 3, 208, NULL, NULL, NULL, NULL, NULL),
(785, 3, 209, NULL, NULL, NULL, NULL, NULL),
(786, 3, 210, NULL, NULL, NULL, NULL, NULL),
(787, 3, 211, NULL, NULL, NULL, NULL, NULL),
(788, 3, 212, NULL, NULL, NULL, NULL, NULL),
(789, 3, 213, NULL, NULL, NULL, NULL, NULL),
(790, 3, 214, NULL, NULL, NULL, NULL, NULL),
(791, 3, 215, NULL, NULL, NULL, NULL, NULL),
(792, 3, 216, NULL, NULL, NULL, NULL, NULL),
(793, 3, 217, NULL, NULL, NULL, NULL, NULL),
(794, 3, 218, NULL, NULL, NULL, NULL, NULL),
(795, 3, 219, NULL, NULL, NULL, NULL, NULL),
(796, 3, 220, NULL, NULL, NULL, NULL, NULL),
(797, 3, 221, NULL, NULL, NULL, NULL, NULL),
(798, 3, 222, NULL, NULL, NULL, NULL, NULL),
(799, 3, 223, NULL, NULL, NULL, NULL, NULL),
(800, 3, 224, NULL, NULL, NULL, NULL, NULL),
(801, 3, 225, NULL, NULL, NULL, NULL, NULL),
(802, 3, 226, NULL, NULL, NULL, NULL, NULL),
(803, 3, 227, NULL, NULL, NULL, NULL, NULL),
(804, 3, 228, NULL, NULL, NULL, NULL, NULL),
(805, 3, 229, NULL, NULL, NULL, NULL, NULL),
(806, 3, 230, NULL, NULL, NULL, NULL, NULL),
(807, 3, 231, NULL, NULL, NULL, NULL, NULL),
(808, 3, 232, NULL, NULL, NULL, NULL, NULL),
(809, 3, 233, NULL, NULL, NULL, NULL, NULL),
(810, 3, 234, NULL, NULL, NULL, NULL, NULL),
(811, 3, 235, NULL, NULL, NULL, NULL, NULL),
(812, 3, 236, NULL, NULL, NULL, NULL, NULL),
(813, 3, 237, NULL, NULL, NULL, NULL, NULL),
(814, 3, 238, NULL, NULL, NULL, NULL, NULL),
(815, 3, 239, NULL, NULL, NULL, NULL, NULL),
(816, 3, 240, NULL, NULL, NULL, NULL, NULL),
(817, 3, 241, NULL, NULL, NULL, NULL, NULL),
(818, 3, 242, NULL, NULL, NULL, NULL, NULL),
(819, 3, 243, NULL, NULL, NULL, NULL, NULL),
(820, 3, 244, NULL, NULL, NULL, NULL, NULL),
(821, 3, 245, NULL, NULL, NULL, NULL, NULL),
(822, 3, 246, NULL, NULL, NULL, NULL, NULL),
(823, 3, 247, NULL, NULL, NULL, NULL, NULL),
(824, 3, 248, NULL, NULL, NULL, NULL, NULL),
(825, 3, 249, NULL, NULL, NULL, NULL, NULL),
(826, 3, 250, NULL, NULL, NULL, NULL, NULL),
(827, 3, 251, NULL, NULL, NULL, NULL, NULL),
(828, 3, 252, NULL, NULL, NULL, NULL, NULL),
(829, 3, 253, NULL, NULL, NULL, NULL, NULL),
(830, 3, 254, NULL, NULL, NULL, NULL, NULL),
(831, 3, 255, NULL, NULL, NULL, NULL, NULL),
(832, 3, 256, NULL, NULL, NULL, NULL, NULL),
(833, 3, 257, NULL, NULL, NULL, NULL, NULL),
(834, 3, 258, NULL, NULL, NULL, NULL, NULL),
(835, 3, 259, NULL, NULL, NULL, NULL, NULL),
(836, 3, 260, NULL, NULL, NULL, NULL, NULL),
(837, 3, 261, NULL, NULL, NULL, NULL, NULL),
(838, 3, 262, NULL, NULL, NULL, NULL, NULL),
(839, 3, 263, NULL, NULL, NULL, NULL, NULL),
(840, 3, 264, NULL, NULL, NULL, NULL, NULL),
(841, 3, 265, NULL, NULL, NULL, NULL, NULL),
(842, 3, 266, NULL, NULL, NULL, NULL, NULL),
(843, 3, 267, NULL, NULL, NULL, NULL, NULL),
(844, 3, 268, NULL, NULL, NULL, NULL, NULL),
(845, 3, 269, NULL, NULL, NULL, NULL, NULL),
(846, 3, 270, NULL, NULL, NULL, NULL, NULL),
(847, 3, 271, NULL, NULL, NULL, NULL, NULL),
(848, 3, 272, NULL, NULL, NULL, NULL, NULL),
(849, 3, 273, NULL, NULL, NULL, NULL, NULL),
(850, 3, 274, NULL, NULL, NULL, NULL, NULL),
(851, 3, 275, NULL, NULL, NULL, NULL, NULL),
(852, 3, 276, NULL, NULL, NULL, NULL, NULL),
(853, 3, 277, NULL, NULL, NULL, NULL, NULL),
(854, 3, 278, NULL, NULL, NULL, NULL, NULL),
(855, 3, 279, NULL, NULL, NULL, NULL, NULL),
(856, 3, 280, NULL, NULL, NULL, NULL, NULL),
(857, 3, 281, NULL, NULL, NULL, NULL, NULL),
(858, 3, 282, NULL, NULL, NULL, NULL, NULL),
(859, 3, 283, NULL, NULL, NULL, NULL, NULL),
(860, 3, 284, NULL, NULL, NULL, NULL, NULL),
(861, 3, 285, NULL, NULL, NULL, NULL, NULL),
(862, 3, 286, NULL, NULL, NULL, NULL, NULL),
(863, 3, 287, NULL, NULL, NULL, NULL, NULL),
(864, 3, 288, NULL, NULL, NULL, NULL, NULL),
(865, 3, 289, NULL, NULL, NULL, NULL, NULL),
(866, 3, 290, NULL, NULL, NULL, NULL, NULL),
(867, 3, 291, NULL, NULL, NULL, NULL, NULL),
(868, 3, 292, NULL, NULL, NULL, NULL, NULL),
(869, 3, 293, NULL, NULL, NULL, NULL, NULL),
(870, 3, 294, NULL, NULL, NULL, NULL, NULL),
(871, 3, 295, NULL, NULL, NULL, NULL, NULL),
(872, 3, 296, NULL, NULL, NULL, NULL, NULL),
(873, 3, 297, NULL, NULL, NULL, NULL, NULL),
(874, 3, 298, NULL, NULL, NULL, NULL, NULL),
(875, 3, 299, NULL, NULL, NULL, NULL, NULL),
(876, 3, 300, NULL, NULL, NULL, NULL, NULL),
(877, 3, 301, NULL, NULL, NULL, NULL, NULL),
(878, 3, 302, NULL, NULL, NULL, NULL, NULL),
(879, 3, 303, NULL, NULL, NULL, NULL, NULL),
(880, 3, 304, NULL, NULL, NULL, NULL, NULL),
(881, 3, 305, NULL, NULL, NULL, NULL, NULL),
(882, 3, 306, NULL, NULL, NULL, NULL, NULL),
(883, 3, 307, NULL, NULL, NULL, NULL, NULL),
(884, 3, 308, NULL, NULL, NULL, NULL, NULL),
(885, 3, 309, NULL, NULL, NULL, NULL, NULL),
(886, 3, 310, NULL, NULL, NULL, NULL, NULL),
(887, 3, 311, NULL, NULL, NULL, NULL, NULL),
(888, 3, 312, NULL, NULL, NULL, NULL, NULL),
(889, 3, 313, NULL, NULL, NULL, NULL, NULL),
(890, 3, 314, NULL, NULL, NULL, NULL, NULL),
(891, 3, 315, NULL, NULL, NULL, NULL, NULL),
(892, 3, 316, NULL, NULL, NULL, NULL, NULL),
(893, 3, 317, NULL, NULL, NULL, NULL, NULL),
(894, 3, 318, NULL, NULL, NULL, NULL, NULL),
(895, 3, 319, NULL, NULL, NULL, NULL, NULL),
(896, 3, 320, NULL, NULL, NULL, NULL, NULL),
(897, 3, 321, NULL, NULL, NULL, NULL, NULL),
(898, 3, 322, NULL, NULL, NULL, NULL, NULL),
(899, 3, 323, NULL, NULL, NULL, NULL, NULL),
(900, 3, 324, NULL, NULL, NULL, NULL, NULL),
(901, 3, 325, NULL, NULL, NULL, NULL, NULL),
(902, 3, 326, NULL, NULL, NULL, NULL, NULL),
(903, 3, 327, NULL, NULL, NULL, NULL, NULL),
(904, 3, 328, NULL, NULL, NULL, NULL, NULL),
(905, 3, 329, NULL, NULL, NULL, NULL, NULL),
(906, 3, 331, NULL, NULL, NULL, NULL, NULL),
(907, 3, 332, NULL, NULL, NULL, NULL, NULL),
(908, 3, 333, NULL, NULL, NULL, NULL, NULL),
(909, 3, 334, NULL, NULL, NULL, NULL, NULL),
(910, 3, 335, NULL, NULL, NULL, NULL, NULL),
(911, 3, 336, NULL, NULL, NULL, NULL, NULL),
(912, 3, 337, NULL, NULL, NULL, NULL, NULL),
(913, 3, 338, NULL, NULL, NULL, NULL, NULL),
(914, 3, 339, NULL, NULL, NULL, NULL, NULL),
(915, 3, 340, NULL, NULL, NULL, NULL, NULL),
(916, 3, 341, NULL, NULL, NULL, NULL, NULL),
(917, 3, 342, NULL, NULL, NULL, NULL, NULL),
(918, 3, 343, NULL, NULL, NULL, NULL, NULL),
(919, 3, 344, NULL, NULL, NULL, NULL, NULL),
(920, 3, 345, NULL, NULL, NULL, NULL, NULL),
(921, 3, 346, NULL, NULL, NULL, NULL, NULL),
(922, 3, 347, NULL, NULL, NULL, NULL, NULL),
(923, 3, 348, NULL, NULL, NULL, NULL, NULL),
(924, 3, 349, NULL, NULL, NULL, NULL, NULL),
(925, 3, 350, NULL, NULL, NULL, NULL, NULL),
(926, 3, 351, NULL, NULL, NULL, NULL, NULL),
(927, 3, 352, NULL, NULL, NULL, NULL, NULL),
(928, 3, 353, NULL, NULL, NULL, NULL, NULL),
(929, 3, 354, NULL, NULL, NULL, NULL, NULL),
(930, 3, 355, NULL, NULL, NULL, NULL, NULL),
(931, 3, 356, NULL, NULL, NULL, NULL, NULL),
(932, 3, 357, NULL, NULL, NULL, NULL, NULL),
(933, 3, 358, NULL, NULL, NULL, NULL, NULL),
(934, 3, 359, NULL, NULL, NULL, NULL, NULL),
(935, 3, 360, NULL, NULL, NULL, NULL, NULL),
(936, 3, 361, NULL, NULL, NULL, NULL, NULL),
(937, 3, 362, NULL, NULL, NULL, NULL, NULL),
(938, 3, 363, NULL, NULL, NULL, NULL, NULL),
(939, 3, 364, NULL, NULL, NULL, NULL, NULL),
(940, 3, 365, NULL, NULL, NULL, NULL, NULL),
(941, 3, 366, NULL, NULL, NULL, NULL, NULL),
(942, 3, 367, NULL, NULL, NULL, NULL, NULL),
(943, 3, 368, NULL, NULL, NULL, NULL, NULL),
(944, 3, 369, NULL, NULL, NULL, NULL, NULL),
(945, 3, 370, NULL, NULL, NULL, NULL, NULL),
(946, 3, 371, NULL, NULL, NULL, NULL, NULL),
(947, 3, 372, NULL, NULL, NULL, NULL, NULL),
(948, 3, 373, NULL, NULL, NULL, NULL, NULL),
(949, 3, 374, NULL, NULL, NULL, NULL, NULL),
(950, 3, 375, NULL, NULL, NULL, NULL, NULL),
(951, 3, 376, NULL, NULL, NULL, NULL, NULL),
(952, 3, 377, NULL, NULL, NULL, NULL, NULL),
(953, 3, 378, NULL, NULL, NULL, NULL, NULL),
(954, 3, 379, NULL, NULL, NULL, NULL, NULL),
(955, 3, 380, NULL, NULL, NULL, NULL, NULL),
(956, 3, 381, NULL, NULL, NULL, NULL, NULL),
(957, 3, 382, NULL, NULL, NULL, NULL, NULL),
(958, 3, 383, NULL, NULL, NULL, NULL, NULL),
(959, 3, 384, NULL, NULL, NULL, NULL, NULL),
(960, 3, 385, NULL, NULL, NULL, NULL, NULL),
(961, 3, 386, NULL, NULL, NULL, NULL, NULL),
(962, 3, 387, NULL, NULL, NULL, NULL, NULL),
(963, 3, 388, NULL, NULL, NULL, NULL, NULL),
(964, 3, 389, NULL, NULL, NULL, NULL, NULL),
(965, 3, 390, NULL, NULL, NULL, NULL, NULL),
(966, 3, 391, NULL, NULL, NULL, NULL, NULL),
(967, 3, 392, NULL, NULL, NULL, NULL, NULL),
(968, 3, 393, NULL, NULL, NULL, NULL, NULL),
(969, 3, 394, NULL, NULL, NULL, NULL, NULL),
(970, 3, 395, NULL, NULL, NULL, NULL, NULL),
(971, 3, 396, NULL, NULL, NULL, NULL, NULL),
(972, 3, 397, NULL, NULL, NULL, NULL, NULL),
(973, 3, 398, NULL, NULL, NULL, NULL, NULL),
(974, 3, 399, NULL, NULL, NULL, NULL, NULL),
(975, 3, 400, NULL, NULL, NULL, NULL, NULL),
(976, 3, 401, NULL, NULL, NULL, NULL, NULL),
(977, 3, 402, NULL, NULL, NULL, NULL, NULL),
(978, 3, 403, NULL, NULL, NULL, NULL, NULL),
(979, 3, 404, NULL, NULL, NULL, NULL, NULL),
(980, 3, 405, NULL, NULL, NULL, NULL, NULL),
(981, 3, 406, NULL, NULL, NULL, NULL, NULL),
(982, 3, 407, NULL, NULL, NULL, NULL, NULL),
(983, 3, 408, NULL, NULL, NULL, NULL, NULL),
(984, 3, 409, NULL, NULL, NULL, NULL, NULL),
(985, 3, 410, NULL, NULL, NULL, NULL, NULL),
(986, 3, 411, NULL, NULL, NULL, NULL, NULL),
(987, 3, 412, NULL, NULL, NULL, NULL, NULL),
(988, 3, 413, NULL, NULL, NULL, NULL, NULL),
(989, 3, 414, NULL, NULL, NULL, NULL, NULL),
(990, 3, 415, NULL, NULL, NULL, NULL, NULL),
(991, 3, 416, NULL, NULL, NULL, NULL, NULL),
(992, 3, 417, NULL, NULL, NULL, NULL, NULL),
(993, 3, 418, NULL, NULL, NULL, NULL, NULL),
(994, 3, 419, NULL, NULL, NULL, NULL, NULL),
(995, 3, 420, NULL, NULL, NULL, NULL, NULL),
(996, 3, 421, NULL, NULL, NULL, NULL, NULL),
(997, 3, 422, NULL, NULL, NULL, NULL, NULL),
(998, 3, 423, NULL, NULL, NULL, NULL, NULL),
(999, 3, 424, NULL, NULL, NULL, NULL, NULL),
(1000, 3, 425, NULL, NULL, NULL, NULL, NULL),
(1001, 3, 426, NULL, NULL, NULL, NULL, NULL),
(1002, 3, 427, NULL, NULL, NULL, NULL, NULL),
(1003, 3, 428, NULL, NULL, NULL, NULL, NULL),
(1004, 3, 429, NULL, NULL, NULL, NULL, NULL),
(1005, 3, 430, NULL, NULL, NULL, NULL, NULL),
(1006, 3, 431, NULL, NULL, NULL, NULL, NULL),
(1007, 3, 432, NULL, NULL, NULL, NULL, NULL),
(1008, 3, 433, NULL, NULL, NULL, NULL, NULL),
(1009, 3, 434, NULL, NULL, NULL, NULL, NULL),
(1010, 3, 435, NULL, NULL, NULL, NULL, NULL),
(1011, 3, 436, NULL, NULL, NULL, NULL, NULL),
(1012, 3, 437, NULL, NULL, NULL, NULL, NULL),
(1013, 3, 438, NULL, NULL, NULL, NULL, NULL),
(1014, 3, 439, NULL, NULL, NULL, NULL, NULL),
(1015, 3, 440, NULL, NULL, NULL, NULL, NULL),
(1016, 3, 441, NULL, NULL, NULL, NULL, NULL),
(1017, 3, 442, NULL, NULL, NULL, NULL, NULL),
(1018, 3, 443, NULL, NULL, NULL, NULL, NULL),
(1019, 3, 444, NULL, NULL, NULL, NULL, NULL),
(1020, 3, 445, NULL, NULL, NULL, NULL, NULL),
(1021, 3, 446, NULL, NULL, NULL, NULL, NULL),
(1022, 3, 447, NULL, NULL, NULL, NULL, NULL),
(1023, 3, 448, NULL, NULL, NULL, NULL, NULL),
(1024, 3, 449, NULL, NULL, NULL, NULL, NULL),
(1025, 3, 450, NULL, NULL, NULL, NULL, NULL),
(1026, 3, 451, NULL, NULL, NULL, NULL, NULL),
(1027, 3, 452, NULL, NULL, NULL, NULL, NULL),
(1028, 3, 453, NULL, NULL, NULL, NULL, NULL),
(1029, 3, 454, NULL, NULL, NULL, NULL, NULL),
(1030, 3, 455, NULL, NULL, NULL, NULL, NULL),
(1031, 3, 456, NULL, NULL, NULL, NULL, NULL),
(1032, 3, 457, NULL, NULL, NULL, NULL, NULL),
(1033, 3, 458, NULL, NULL, NULL, NULL, NULL),
(1034, 3, 459, NULL, NULL, NULL, NULL, NULL),
(1035, 3, 460, NULL, NULL, NULL, NULL, NULL),
(1036, 3, 461, NULL, NULL, NULL, NULL, NULL),
(1037, 3, 462, NULL, NULL, NULL, NULL, NULL),
(1038, 3, 463, NULL, NULL, NULL, NULL, NULL),
(1039, 3, 464, NULL, NULL, NULL, NULL, NULL),
(1040, 3, 465, NULL, NULL, NULL, NULL, NULL),
(1041, 3, 466, NULL, NULL, NULL, NULL, NULL),
(1042, 3, 467, NULL, NULL, NULL, NULL, NULL),
(1043, 3, 468, NULL, NULL, NULL, NULL, NULL),
(1044, 3, 469, NULL, NULL, NULL, NULL, NULL),
(1045, 3, 470, NULL, NULL, NULL, NULL, NULL),
(1046, 3, 471, NULL, NULL, NULL, NULL, NULL),
(1047, 3, 472, NULL, NULL, NULL, NULL, NULL),
(1048, 3, 473, NULL, NULL, NULL, NULL, NULL),
(1049, 3, 474, NULL, NULL, NULL, NULL, NULL),
(1050, 3, 475, NULL, NULL, NULL, NULL, NULL),
(1051, 3, 476, NULL, NULL, NULL, NULL, NULL),
(1052, 3, 477, NULL, NULL, NULL, NULL, NULL),
(1053, 3, 478, NULL, NULL, NULL, NULL, NULL),
(1054, 3, 479, NULL, NULL, NULL, NULL, NULL),
(1055, 3, 480, NULL, NULL, NULL, NULL, NULL),
(1056, 3, 481, NULL, NULL, NULL, NULL, NULL),
(1057, 3, 482, NULL, NULL, NULL, NULL, NULL),
(1058, 3, 483, NULL, NULL, NULL, NULL, NULL),
(1059, 3, 484, NULL, NULL, NULL, NULL, NULL),
(1060, 3, 485, NULL, NULL, NULL, NULL, NULL),
(1061, 3, 486, NULL, NULL, NULL, NULL, NULL),
(1062, 3, 487, NULL, NULL, NULL, NULL, NULL),
(1063, 3, 488, NULL, NULL, NULL, NULL, NULL),
(1064, 3, 489, NULL, NULL, NULL, NULL, NULL),
(1065, 3, 490, NULL, NULL, NULL, NULL, NULL),
(1066, 3, 491, NULL, NULL, NULL, NULL, NULL),
(1067, 3, 492, NULL, NULL, NULL, NULL, NULL),
(1068, 3, 493, NULL, NULL, NULL, NULL, NULL),
(1069, 3, 494, NULL, NULL, NULL, NULL, NULL),
(1070, 3, 495, NULL, NULL, NULL, NULL, NULL),
(1071, 3, 496, NULL, NULL, NULL, NULL, NULL),
(1072, 3, 497, NULL, NULL, NULL, NULL, NULL),
(1073, 3, 498, NULL, NULL, NULL, NULL, NULL),
(1074, 3, 499, NULL, NULL, NULL, NULL, NULL),
(1075, 3, 500, NULL, NULL, NULL, NULL, NULL),
(1076, 3, 501, NULL, NULL, NULL, NULL, NULL),
(1077, 3, 502, NULL, NULL, NULL, NULL, NULL),
(1078, 3, 503, NULL, NULL, NULL, NULL, NULL),
(1079, 3, 504, NULL, NULL, NULL, NULL, NULL),
(1080, 3, 505, NULL, NULL, NULL, NULL, NULL),
(1081, 3, 506, NULL, NULL, NULL, NULL, NULL),
(1082, 3, 507, NULL, NULL, NULL, NULL, NULL),
(1083, 3, 508, NULL, NULL, NULL, NULL, NULL),
(1084, 3, 509, NULL, NULL, NULL, NULL, NULL),
(1085, 3, 510, NULL, NULL, NULL, NULL, NULL),
(1086, 3, 511, NULL, NULL, NULL, NULL, NULL),
(1087, 3, 512, NULL, NULL, NULL, NULL, NULL),
(1088, 3, 513, NULL, NULL, NULL, NULL, NULL),
(1089, 3, 514, NULL, NULL, NULL, NULL, NULL),
(1090, 3, 515, NULL, NULL, NULL, NULL, NULL),
(1091, 3, 516, NULL, NULL, NULL, NULL, NULL),
(1092, 3, 517, NULL, NULL, NULL, NULL, NULL),
(1093, 3, 518, NULL, NULL, NULL, NULL, NULL),
(1094, 3, 519, NULL, NULL, NULL, NULL, NULL),
(1095, 3, 520, NULL, NULL, NULL, NULL, NULL),
(1096, 3, 521, NULL, NULL, NULL, NULL, NULL),
(1097, 3, 522, NULL, NULL, NULL, NULL, NULL),
(1098, 3, 523, NULL, NULL, NULL, NULL, NULL),
(1099, 3, 524, NULL, NULL, NULL, NULL, NULL),
(1100, 3, 525, NULL, NULL, NULL, NULL, NULL),
(1101, 3, 526, NULL, NULL, NULL, NULL, NULL),
(1102, 3, 527, NULL, NULL, NULL, NULL, NULL),
(1103, 3, 528, NULL, NULL, NULL, NULL, NULL),
(1104, 3, 529, NULL, NULL, NULL, NULL, NULL),
(1105, 3, 530, NULL, NULL, NULL, NULL, NULL),
(1106, 3, 531, NULL, NULL, NULL, NULL, NULL),
(1107, 3, 532, NULL, NULL, NULL, NULL, NULL),
(1108, 3, 533, NULL, NULL, NULL, NULL, NULL),
(1109, 3, 534, NULL, NULL, NULL, NULL, NULL),
(1110, 3, 535, NULL, NULL, NULL, NULL, NULL),
(1111, 3, 536, NULL, NULL, NULL, NULL, NULL),
(1112, 3, 537, NULL, NULL, NULL, NULL, NULL),
(1113, 3, 538, NULL, NULL, NULL, NULL, NULL),
(1114, 3, 539, NULL, NULL, NULL, NULL, NULL),
(1115, 3, 540, NULL, NULL, NULL, NULL, NULL),
(1116, 3, 541, NULL, NULL, NULL, NULL, NULL),
(1117, 3, 542, NULL, NULL, NULL, NULL, NULL),
(1118, 3, 543, NULL, NULL, NULL, NULL, NULL),
(1119, 3, 544, NULL, NULL, NULL, NULL, NULL),
(1120, 3, 545, NULL, NULL, NULL, NULL, NULL),
(1121, 3, 546, NULL, NULL, NULL, NULL, NULL),
(1122, 3, 547, NULL, NULL, NULL, NULL, NULL),
(1123, 3, 548, NULL, NULL, NULL, NULL, NULL),
(1124, 3, 549, NULL, NULL, NULL, NULL, NULL),
(1125, 3, 550, NULL, NULL, NULL, NULL, NULL),
(1126, 3, 551, NULL, NULL, NULL, NULL, NULL),
(1127, 3, 552, NULL, NULL, NULL, NULL, NULL),
(1128, 3, 553, NULL, NULL, NULL, NULL, NULL),
(1129, 3, 562, NULL, NULL, NULL, NULL, NULL),
(1130, 3, 563, NULL, NULL, NULL, NULL, NULL),
(1131, 3, 564, NULL, NULL, NULL, NULL, NULL),
(1132, 3, 565, NULL, NULL, NULL, NULL, NULL),
(1133, 3, 566, NULL, NULL, NULL, NULL, NULL),
(1134, 3, 567, NULL, NULL, NULL, NULL, NULL),
(1135, 3, 568, NULL, NULL, NULL, NULL, NULL),
(1136, 3, 569, NULL, NULL, NULL, NULL, NULL),
(1137, 3, 570, NULL, NULL, NULL, NULL, NULL),
(1138, 3, 571, NULL, NULL, NULL, NULL, NULL),
(1139, 3, 572, NULL, NULL, NULL, NULL, NULL),
(1140, 3, 573, NULL, NULL, NULL, NULL, NULL),
(1141, 3, 574, NULL, NULL, NULL, NULL, NULL),
(1142, 3, 575, NULL, NULL, NULL, NULL, NULL),
(1143, 3, 576, NULL, NULL, NULL, NULL, NULL),
(1144, 3, 577, NULL, NULL, NULL, NULL, NULL),
(1145, 3, 578, NULL, NULL, NULL, NULL, NULL),
(1146, 3, 579, NULL, NULL, NULL, NULL, NULL),
(1147, 3, 580, NULL, NULL, NULL, NULL, NULL),
(1148, 3, 581, NULL, NULL, NULL, NULL, NULL),
(1149, 3, 582, NULL, NULL, NULL, NULL, NULL),
(1150, 3, 583, NULL, NULL, NULL, NULL, NULL),
(1151, 3, 584, NULL, NULL, NULL, NULL, NULL),
(1152, 3, 585, NULL, NULL, NULL, NULL, NULL),
(1153, 3, 586, NULL, NULL, NULL, NULL, NULL),
(1154, 3, 587, NULL, NULL, NULL, NULL, NULL),
(1155, 3, 588, NULL, NULL, NULL, NULL, NULL),
(1156, 3, 589, NULL, NULL, NULL, NULL, NULL),
(1157, 3, 590, NULL, NULL, NULL, NULL, NULL),
(1158, 3, 591, NULL, NULL, NULL, NULL, NULL),
(1159, 3, 592, NULL, NULL, NULL, 900000.00, NULL),
(1160, 3, 593, NULL, NULL, NULL, NULL, NULL),
(1161, 2, 594, -1, NULL, NULL, 50000.00, NULL),
(1162, 3, 594, NULL, NULL, NULL, 50000.00, NULL),
(1163, 2, 595, NULL, NULL, NULL, 90000.00, NULL),
(1164, 3, 595, NULL, NULL, NULL, 90000.00, NULL),
(1165, 2, 596, NULL, NULL, NULL, 120000.00, NULL);
INSERT INTO `stock` (`id`, `stock_produit_id`, `product_id`, `quantite`, `prix_achat`, `prix_revient`, `prix_vente`, `date_peremption`) VALUES
(1166, 3, 596, NULL, NULL, NULL, 120000.00, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `suppression_facture`
--

DROP TABLE IF EXISTS `suppression_facture`;
CREATE TABLE IF NOT EXISTS `suppression_facture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) DEFAULT NULL,
  `caisse_id` int(11) DEFAULT NULL,
  `mode_paie_id` int(11) DEFAULT NULL,
  `lieu_vente_id` int(11) NOT NULL,
  `saisie_par_id` int(11) NOT NULL,
  `numero_facture` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_facture` decimal(13,2) DEFAULT NULL,
  `montant_paye` decimal(13,2) DEFAULT NULL,
  `montant_remise` decimal(13,2) NOT NULL,
  `etat` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `etat_livraison` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_facturation` datetime NOT NULL,
  `date_saisie` datetime NOT NULL,
  `commentaire` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom_client_cash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frais_sup` decimal(13,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_15A6587019EB6921` (`client_id`),
  KEY `IDX_15A6587027B4FEBF` (`caisse_id`),
  KEY `IDX_15A6587062E04A07` (`mode_paie_id`),
  KEY `IDX_15A65870AA2B41DC` (`lieu_vente_id`),
  KEY `IDX_15A65870C74AC7FE` (`saisie_par_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `suppression_facture`
--

INSERT INTO `suppression_facture` (`id`, `client_id`, `caisse_id`, `mode_paie_id`, `lieu_vente_id`, `saisie_par_id`, `numero_facture`, `total_facture`, `montant_paye`, `montant_remise`, `etat`, `etat_livraison`, `date_facturation`, `date_saisie`, `commentaire`, `nom_client_cash`, `frais_sup`) VALUES
(1, NULL, 1, 1, 1, 1, 'bmt240001', 200.00, 200.00, 0.00, 'payé', 'livré', '2024-06-04 17:17:40', '2024-06-04 17:21:11', NULL, NULL, 0.00),
(2, 8, 1, 1, 1, 1, 'bmt240005', 900000.00, 100000.00, 0.00, 'paie partiel', 'livré', '2024-07-02 13:28:19', '2024-07-16 11:45:27', NULL, NULL, 0.00),
(3, 8, 1, 1, 1, 1, 'bmt240004', 3950000.00, 3950000.00, 0.00, 'payé', 'livré', '2024-07-02 13:18:23', '2024-07-16 11:45:45', NULL, NULL, 0.00),
(4, 8, 1, 1, 1, 1, 'bmt240003', 820000.00, 0.00, 0.00, 'non payé', 'livré', '2024-06-05 16:19:21', '2024-07-16 11:46:03', NULL, NULL, 0.00),
(5, NULL, 1, 1, 1, 1, 'bmt240001', 3620000.00, 3620000.00, 0.00, 'payé', 'livré', '2024-06-05 15:49:25', '2024-07-16 11:46:18', NULL, 'DGIMMEYAH', 0.00),
(6, 4, 1, 1, 1, 9, 'bmt240007', 1200000.00, 0.00, 0.00, 'non payé', 'livré', '2024-07-16 12:15:16', '2024-07-16 12:20:54', NULL, NULL, 0.00),
(7, 4, 1, 1, 1, 9, 'bmt240001', 1240000.00, 1240000.00, 10000.00, 'payé', 'livré', '2024-07-16 12:06:09', '2024-07-16 12:21:01', NULL, NULL, 0.00),
(8, 4, 1, 1, 1, 9, 'bmt240001', 12000000.00, 0.00, 0.00, 'non payé', 'non livré', '2024-07-16 00:00:00', '2024-07-16 13:19:57', NULL, NULL, 0.00),
(9, 4, 1, 1, 1, 9, 'bmt240001', 990000.00, 990000.00, 10000.00, 'payé', 'non livré', '2024-07-16 14:29:03', '2024-07-16 15:08:53', NULL, NULL, 0.00);

-- --------------------------------------------------------

--
-- Structure de la table `taux_devise`
--

DROP TABLE IF EXISTS `taux_devise`;
CREATE TABLE IF NOT EXISTS `taux_devise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `devise_id` int(11) NOT NULL,
  `lieu_vente_id` int(11) NOT NULL,
  `taux` decimal(13,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F96A6F4EF4445056` (`devise_id`),
  KEY `IDX_F96A6F4EAA2B41DC` (`lieu_vente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `transfert_fond`
--

DROP TABLE IF EXISTS `transfert_fond`;
CREATE TABLE IF NOT EXISTS `transfert_fond` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `devise_id` int(11) DEFAULT NULL,
  `caisse_depart_id` int(11) DEFAULT NULL,
  `caisse_reception_id` int(11) DEFAULT NULL,
  `lieu_vente_id` int(11) NOT NULL,
  `traite_par_id` int(11) DEFAULT NULL,
  `envoye_par_id` int(11) NOT NULL,
  `lieu_vente_reception_id` int(11) DEFAULT NULL,
  `reference` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `montant` decimal(13,2) DEFAULT NULL,
  `commentaire` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_operation` datetime NOT NULL,
  `date_saisie` datetime NOT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `etat` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_reception` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5EE96800F4445056` (`devise_id`),
  KEY `IDX_5EE968005001D256` (`caisse_depart_id`),
  KEY `IDX_5EE96800C8D2D59B` (`caisse_reception_id`),
  KEY `IDX_5EE96800AA2B41DC` (`lieu_vente_id`),
  KEY `IDX_5EE96800167FABE8` (`traite_par_id`),
  KEY `IDX_5EE96800D603292` (`envoye_par_id`),
  KEY `IDX_5EE968007ABE48CB` (`lieu_vente_reception_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `transfert_products`
--

DROP TABLE IF EXISTS `transfert_products`;
CREATE TABLE IF NOT EXISTS `transfert_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lieu_vente_depart_id` int(11) NOT NULL,
  `lieu_vente_recep_id` int(11) NOT NULL,
  `cree_par_id` int(11) NOT NULL,
  `traite_par_id` int(11) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `etat` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_envoi` datetime NOT NULL,
  `date_reception` datetime DEFAULT NULL,
  `charges_transfert` decimal(13,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8741DE764DA6FBA9` (`lieu_vente_depart_id`),
  KEY `IDX_8741DE76B85AE339` (`lieu_vente_recep_id`),
  KEY `IDX_8741DE76FC29C013` (`cree_par_id`),
  KEY `IDX_8741DE76167FABE8` (`traite_par_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `type_produit`
--

DROP TABLE IF EXISTS `type_produit`;
CREATE TABLE IF NOT EXISTS `type_produit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lieu_vente_id` int(11) NOT NULL,
  `region_id` int(11) DEFAULT NULL,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prenom` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_user` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_creation` date NOT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ville` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pays` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `statut` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`),
  KEY `IDX_8D93D649AA2B41DC` (`lieu_vente_id`),
  KEY `IDX_8D93D64998260155` (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `lieu_vente_id`, `region_id`, `username`, `roles`, `password`, `nom`, `prenom`, `telephone`, `email`, `type_user`, `date_creation`, `adresse`, `ville`, `pays`, `statut`, `reference`) VALUES
(1, 1, NULL, 'admin', '[\"ROLE_ADMIN\"]', '$2y$13$yu.eZp0kHBuwiCoEwaUTveWCf7TUhJod19J6QQjQnWNq1r2tdK22m', 'damko', 'damko', NULL, NULL, 'personnel', '2024-02-10', 'nongo', 'conakry', 'guinée', 'actif', ''),
(3, 1, 1, 'vendeur', '[\"ROLE_VENDEUR\"]', '$2y$13$rbVJb6K.ECn/UdVHkSQ0GulMKcETev4vMLqTUNNIsAVFohoIq6NSu', 'vendeur', 'vendeur', '628', NULL, 'personnel', '2024-05-29', 'Conakry', 'conakry', 'guinee', 'actif', 'p2405290003'),
(4, 1, 1, 'client@', '[\"ROLE_CLIENT\"]', '$2y$13$k/i.ReZfP7MYN4mloKpSr.qAmiOjXzkQikjOJ3Evepvykik8SQi.6', 'client cash', 'cash', '6280000', NULL, 'client', '2024-05-29', 'Conakry', 'conakry', 'guinee', 'actif', 'c2405290004'),
(6, 1, 1, 'IBRAHIMA', '{\"0\": \"ROLE_LIVREUR\", \"2\": \"ROLE_VENDEUR\", \"3\": \"ROLE_COMPTABLE\", \"4\": \"ROLE_GESTIONNAIRE\", \"6\": \"ROLE_ADMIN\", \"7\": \"ROLE_STOCK\"}', '$2y$13$ofa1miRRYxqnoi3ABKNSI.foga8HOjaeA42.zIZEo0vsSXsV2YANO', 'Bah', 'IBRAHIMA', '628551416', NULL, 'personnel', '2024-06-04', 'Madina', 'conakry', 'Guinee', 'Actif', 'p2406040006'),
(7, 1, 1, 'tahirou@', '[\"ROLE_VENDEUR\", \"ROLE_LIVREUR\", \"ROLE_COMPTABLE\", \"ROLE_GESTIONNAIRE\", \"ROLE_RESPONSABLE\", \"ROLE_ACTIONNAIRE\", \"ROLE_ADMIN\", \"ROLE_STOCK\", \"ROLE_SUPPRESSION\", \"ROLE_MODIFICATION\"]', '$2y$13$JrJk4HX9iUnc6IvwRIINdukmVojT4ggrxMQ1s6OGrj4f26MR/ZdA6', 'Barry', 'Tahirou', '620401473', NULL, 'personnel', '2024-06-04', 'Madina', 'conakry', 'Guinee', 'Actif', 'p2406040007'),
(8, 1, 1, 'Adrahmane Entag', '[\"ROLE_CLIENT\"]', '$2y$13$U9f8p15rNfbVuEtiioEuRetTh5/XB/5XxmzqYZYotVJd0RzcCpC.O', 'Balde', 'Adrahmane Entag', '1122', NULL, 'client', '2024-06-05', 'Entag', 'conakry', 'Guinee', 'actif', 'c2406050008'),
(9, 1, 1, 'damanatou@', '[\"ROLE_VENDEUR\", \"ROLE_LIVREUR\", \"ROLE_COMPTABLE\", \"ROLE_GESTIONNAIRE\", \"ROLE_RESPONSABLE\", \"ROLE_ADMIN\", \"ROLE_STOCK\", \"ROLE_SUPPRESSION\", \"ROLE_MODIFICATION\"]', '$2y$13$jAMR.Li4TJPHWkB62nsJZOJJlS1k8qd5o/EkTGP89X1qRcGN0/vaS', 'Diallo', 'Amanatou', '624483386', NULL, 'personnel', '2024-07-16', 'Conakry', 'conakry', 'guinee', 'actif', 'p2407160009'),
(10, 1, 6, '628228857', '[\"ROLE_CLIENT\"]', '$2y$13$TM7.X0wgpse3CVRJCpVNW.wr1fAWee4rHi8ts2cnYoFOANjqbI39u', 'PITA', 'mamadou samba', '628228857', NULL, 'client', '2024-07-16', 'pita', 'pita', 'Guinee', 'actif', 'c2407160010'),
(11, 1, 1, '624095560', '[\"ROLE_CLIENT\"]', '$2y$13$uJh54d.igPuZrssNYotygeMU7HhtLzJSHa0TNCRzLBhu4lbDdXe6a', 'Barry', 'Mamadou bobo', '624095560', NULL, 'client', '2024-07-16', 'Madina', 'conakry', 'Guinee', 'actif', 'c2407160011'),
(12, 1, 1, '620797779', '[\"ROLE_CLIENT\"]', '$2y$13$qMleJQaXRDcW.dHkH.R/XOoUPYpOqjjyK4hnMNlP8N7g1u7lfcwKC', 'W', 'WISSAM', '620797779', NULL, 'client', '2024-07-16', 'Madina', 'conakry', 'Guinee', 'actif', 'c2407160012'),
(13, 1, 1, '628061949', '[\"ROLE_CLIENT\"]', '$2y$13$kvUpcfvgMAsW9L0bA6HTKeqt5bNUo1qvQ77Vu1a8PKIqmo9l0v/FS', 'Barry', 'El Alpha Amadou', '628061949', NULL, 'client', '2024-07-16', 'Madina', 'conakry', 'Guinee', 'actif', 'c2407160013'),
(14, 1, 7, '622252240', '[\"ROLE_CLIENT\"]', '$2y$13$IxqkNqxRbaVheY06C7Ez8Od5LQsTGNlX/hwBV7VMGvDP0qfRXm8XS', 'Labe', 'Mamadou Saliou', '622252240', NULL, 'client', '2024-07-16', 'Labe', 'Labe', 'Guinee', 'actif', 'c2407160014'),
(15, 1, 1, '622430938', '[\"ROLE_CLIENT\"]', '$2y$13$mnAfIKkRCBR8iJLMTDswCOswiBKh522ijDHoSonHB5xe9E6lMWBnq', 'Balde', 'Oustage Malal', '622430938', NULL, 'client', '2024-07-16', 'Madina', 'conakry', 'Guinee22', 'actif', 'c2407160015'),
(16, 1, 1, '624658450', '[\"ROLE_CLIENT\"]', '$2y$13$N3wwfaRfPzrX2vRpL0gT9OqurXXPS3yo1lS0bEnJC4z3mXAmP8Jgm', 'Bambeto', 'Cherif', '624658450', NULL, 'client', '2024-07-16', 'Bambeto', 'conakry', 'Guinee', 'actif', 'c2407160016'),
(17, 1, 1, '001', '[\"ROLE_CLIENT\"]', '$2y$13$C.7gIR7y/Bri76/WpRUpHuV6qyIW8nEoivsWDGox4iwHxHY6yZlVu', 'Bah', 'Aboubacar', '001', NULL, 'client', '2024-07-16', 'Sierra-leone', 'Sierra-leone', 'Sierra-leone', 'actif', 'c2407160017'),
(18, 1, 1, '628823945', '[\"ROLE_CLIENT\"]', '$2y$13$HZ22Iddj9gRGLSFw7CDJtOmTGe6ogm5o/zNwYN9K.0dWW/c3M0wny', 'Bonfi', 'Cire', '628823945', NULL, 'client', '2024-07-16', 'Bonfi', 'conakry', 'Guinee', 'actif', 'c2407160018'),
(19, 1, 1, '620629309', '[\"ROLE_CLIENT\"]', '$2y$13$Pf0TnLXc48fY3lAGmueiNOcGapWRWIkJX9FZ3vfOUZS5ELOMXBfVO', 'Diallo', 'Mamoudou Gomboyah', '620629309', NULL, 'client', '2024-07-16', 'Gomboyah', 'conakry', 'Guinee', 'actif', 'c2407160019'),
(20, 1, 1, '621392727/627059599', '[\"ROLE_CLIENT\"]', '$2y$13$sFxt0GqhveoeyFxC6oYPROHHPcyyAU8/1rEqN3EnHDFWzBGcLFclG', 'Kaporo', 'Elhadj', '621392727/627059599', NULL, 'client', '2024-07-16', 'Kaporo', 'conakry', 'Guinee', 'actif', 'c2407160020'),
(21, 1, 7, '622534288', '[\"ROLE_CLIENT\"]', '$2y$13$4yhkJyu4bmV.7fC2zJy5h.xJoN4bm9RB0rO9p/dPQSkGkKZH8e7Me', 'Labe', 'Mamadou Samba', '622534288', NULL, 'client', '2024-07-16', 'Labe', 'Labe', 'Guinee', 'actif', 'c2407160021'),
(22, 1, 14, '621925081', '[\"ROLE_CLIENT\"]', '$2y$13$gKw.n8mTRagwOjLj/PGl2ecXUNPDfLvYpCLqPQddoNSiumecVBmL.', 'Kamsar', 'El A.Oumar', '621925081', NULL, 'client', '2024-07-16', 'Kamsar', 'Kamsar', 'Guinee', 'actif', 'c2407160022'),
(23, 1, 1, '623561404', '[\"ROLE_CLIENT\"]', '$2y$13$R0t9cszuaXOk1r9JQNL//.4gYRnsKWGmjpgxpSa5Q9VHhzDI.W6Ri', 'Tanene', 'Baillo', '623561404', NULL, 'client', '2024-07-16', 'Tanene', 'conakry', 'Guinee', 'actif', 'c2407160023'),
(24, 1, 10, '621977618', '[\"ROLE_CLIENT\"]', '$2y$13$g2bu5ARWIrGhR2K/6IDKTuTRmjsWkfsKoaPiDEUcu0VdlNQ.gNO6e', 'Kankan', 'Berete', '621977618', NULL, 'client', '2024-07-16', 'Kankan', 'Kankan', 'Guinee', 'actif', 'c2407160024'),
(25, 1, 1, '622942621', '[\"ROLE_CLIENT\"]', '$2y$13$mgNHwTbrJdB7JloMNdtfSOqDvhUrlFmGb3J9R/ilMgdTw3K5WUFDO', 'Bonfi', 'Porto', '622942621', NULL, 'client', '2024-07-16', 'Bonfi', 'conakry', 'Guinee', 'actif', 'c2407160025'),
(26, 1, 15, '620249424', '[\"ROLE_CLIENT\"]', '$2y$13$2Ljqehf6KGx.xPlgRN7YiODMjZ9C7vftvklJYST3smiGdiE8TRNQy', 'Fria', 'Algassimou', '620249424', NULL, 'client', '2024-07-16', 'Fria', 'Fria', 'Guinee', 'actif', 'c2407160026'),
(27, 1, 2, '625828745', '[\"ROLE_CLIENT\"]', '$2y$13$KVgZYKPPHtM8GPXTMYHzVOEJ/cYx114lOSWR50g/B6b6RGg/8Mc0.', 'Kindia', 'Mamadou', '625828745', NULL, 'client', '2024-07-16', 'Kindia', 'Kindia', 'Guinee', 'actif', 'c2407160027'),
(28, 1, 1, '628372950', '[]', '$2y$13$T8p.c4eGSw8nixYQt.L9ee3ECFo/J48OiL/bq6/hyb2EupwhmwSDS', 'Oustage', 'Modi Amadou-', '628372950/628593110', NULL, 'client', '2024-07-16', 'Madina', 'conakry', 'Guinee', 'Actif', 'c2407160028'),
(29, 1, 1, '628748371', '[\"ROLE_CLIENT\"]', '$2y$13$Cjv3oEhY0bsGi/ez9TdY3OkfGu6LhBDvb5MjNcvUVyE18DkZhM7YO', 'Diary', 'El Oury', '628748371', NULL, 'client', '2024-07-16', 'Madina', 'conakry', 'Guinee', 'actif', 'c2407160029'),
(30, 1, 1, '628373044/622505011', '[\"ROLE_CLIENT\"]', '$2y$13$/Quq8Q4XkVnZc2GTOwEXrOq5MRTPzYbMn7hTlyQQpp9V/Jx54vHKO', 'Moudjitaba', 'Moustapha', '628373044/622505011', NULL, 'client', '2024-07-16', 'Madina', 'conakry', 'Guinee', 'actif', 'c2407160030'),
(31, 1, 1, '622680251', '[\"ROLE_CLIENT\"]', '$2y$13$oVd4sjorkGoiNsW2i/kOVuZQkEvtLWsaVwS.p42dIeAczmO8INpsa', 'Mafanco', 'Ousmane', '622680251', NULL, 'client', '2024-07-16', 'Madina', 'conakry', 'Guinee', 'actif', 'c2407160031'),
(32, 1, 1, '621004569', '[\"ROLE_CLIENT\"]', '$2y$13$DQvhz1YJmbG.XmFBYUO0X.YfCyJM0IA32PLTybns5Omt8WgRRLJTe', 'Maleh', 'Amadou', '621004569', NULL, 'client', '2024-07-16', 'Madina', 'conakry', 'Guinee', 'actif', 'c2407160032'),
(33, 1, 1, '624121735', '[\"ROLE_CLIENT\"]', '$2y$13$q0hvCBIvOniR3l2ZK5Ze7.VUe.Rc26C26KFe0t2ut0x.y9ppK0PYe', 'Mafanco', 'Modi Ibrahima', '624121735', NULL, 'client', '2024-07-16', 'Madina', 'conakry', 'Guinee', 'actif', 'c2407160033'),
(34, 1, 1, '621379163', '[\"ROLE_CLIENT\"]', '$2y$13$JMkEj9.mGiXq5aZCtI85Ne1hHdqftJtKl26UASSouW2txJA4nz.Zm', 'Barry', 'Modi Baillo', '621379163', NULL, 'client', '2024-07-16', 'Madina', 'conakry', 'Guinee', 'actif', 'c2407160034'),
(35, 1, 1, '622202153', '[\"ROLE_CLIENT\"]', '$2y$13$vLvRkMqtC8JXUZA7ojr0EuLb.CfpeJG4in6Mcf4WcDGska6GouDmu', 'Siguiri', 'Djoulde', '622202153', NULL, 'client', '2024-07-16', 'Madina', 'conakry', 'Guinee', 'actif', 'c2407160035'),
(36, 1, 1, '4647747', '[]', '$2y$13$SPjv97.6lHB0KsBJ0mhN1.oIfKxBbZm2/T8YrdCY.0Eq7c1023H7a', 'M', 'MJB', '4647747', NULL, 'client', '2024-07-16', 'Madina', 'conakry', 'Guinee', 'Actif', 'c2407160036');

-- --------------------------------------------------------

--
-- Structure de la table `versement`
--

DROP TABLE IF EXISTS `versement`;
CREATE TABLE IF NOT EXISTS `versement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `lieu_vente_id` int(11) NOT NULL,
  `traite_par_id` int(11) NOT NULL,
  `devise_id` int(11) NOT NULL,
  `mode_paie_id` int(11) NOT NULL,
  `compte_id` int(11) NOT NULL,
  `categorie_id` int(11) NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `montant` decimal(13,2) NOT NULL,
  `taux` double NOT NULL,
  `numero_paiement` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banque_cheque` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commentaire` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_versement` datetime NOT NULL,
  `date_saisie` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_716E936719EB6921` (`client_id`),
  KEY `IDX_716E9367AA2B41DC` (`lieu_vente_id`),
  KEY `IDX_716E9367167FABE8` (`traite_par_id`),
  KEY `IDX_716E9367F4445056` (`devise_id`),
  KEY `IDX_716E936762E04A07` (`mode_paie_id`),
  KEY `IDX_716E9367F2C56620` (`compte_id`),
  KEY `IDX_716E9367BCF5E72D` (`categorie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `versement`
--

INSERT INTO `versement` (`id`, `client_id`, `lieu_vente_id`, `traite_par_id`, `devise_id`, `mode_paie_id`, `compte_id`, `categorie_id`, `reference`, `montant`, `taux`, `numero_paiement`, `banque_cheque`, `commentaire`, `date_versement`, `date_saisie`) VALUES
(4, 36, 1, 9, 1, 1, 1, 1, 'vers2407160001', 1515000.00, 1, NULL, NULL, 'PAIEMENT FACTURE', '2024-07-16 00:00:00', '2024-07-16 15:49:35'),
(5, 11, 1, 9, 1, 2, 2, 1, 'vers2407160005', 1800000.00, 1, NULL, NULL, 'PAIEMENT FACTURE', '2024-07-16 00:00:00', '2024-07-16 15:54:12');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `absences_personnels`
--
ALTER TABLE `absences_personnels`
  ADD CONSTRAINT `FK_9DB9B52C1C109075` FOREIGN KEY (`personnel_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_9DB9B52CAA2B41DC` FOREIGN KEY (`lieu_vente_id`) REFERENCES `lieux_ventes` (`id`),
  ADD CONSTRAINT `FK_9DB9B52CC74AC7FE` FOREIGN KEY (`saisie_par_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `achat_fournisseur`
--
ALTER TABLE `achat_fournisseur`
  ADD CONSTRAINT `FK_D8FB1B0F1C109075` FOREIGN KEY (`personnel_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_D8FB1B0F670C757F` FOREIGN KEY (`fournisseur_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_D8FB1B0FAA2B41DC` FOREIGN KEY (`lieu_vente_id`) REFERENCES `lieux_ventes` (`id`),
  ADD CONSTRAINT `FK_D8FB1B0FF4445056` FOREIGN KEY (`devise_id`) REFERENCES `devise` (`id`);

--
-- Contraintes pour la table `achat_fournisseur_general`
--
ALTER TABLE `achat_fournisseur_general`
  ADD CONSTRAINT `FK_C048D0ED1C109075` FOREIGN KEY (`personnel_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_C048D0ED670C757F` FOREIGN KEY (`fournisseur_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_C048D0EDAA2B41DC` FOREIGN KEY (`lieu_vente_id`) REFERENCES `lieux_ventes` (`id`),
  ADD CONSTRAINT `FK_C048D0EDF4445056` FOREIGN KEY (`devise_id`) REFERENCES `devise` (`id`);

--
-- Contraintes pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD CONSTRAINT `FK_C35F0816A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `ajustement_solde`
--
ALTER TABLE `ajustement_solde`
  ADD CONSTRAINT `FK_835EE1E7167FABE8` FOREIGN KEY (`traite_par_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_835EE1E7A848E3B1` FOREIGN KEY (`collaborateur_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_835EE1E7AA2B41DC` FOREIGN KEY (`lieu_vente_id`) REFERENCES `lieux_ventes` (`id`),
  ADD CONSTRAINT `FK_835EE1E7F4445056` FOREIGN KEY (`devise_id`) REFERENCES `devise` (`id`);

--
-- Contraintes pour la table `anomalie_produit`
--
ALTER TABLE `anomalie_produit`
  ADD CONSTRAINT `FK_ADB996D01C109075` FOREIGN KEY (`personnel_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_ADB996D04584665A` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FK_ADB996D0CE430A85` FOREIGN KEY (`inventaire_id`) REFERENCES `inventaire` (`id`),
  ADD CONSTRAINT `FK_ADB996D0DCD6110` FOREIGN KEY (`stock_id`) REFERENCES `liste_stock` (`id`);

--
-- Contraintes pour la table `avance_salaire`
--
ALTER TABLE `avance_salaire`
  ADD CONSTRAINT `FK_6DA8D105167FABE8` FOREIGN KEY (`traite_par_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_6DA8D10527B4FEBF` FOREIGN KEY (`caisse_id`) REFERENCES `caisse` (`id`),
  ADD CONSTRAINT `FK_6DA8D105438F5B63` FOREIGN KEY (`mode_paiement_id`) REFERENCES `mode_paiement` (`id`),
  ADD CONSTRAINT `FK_6DA8D105A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_6DA8D105AA2B41DC` FOREIGN KEY (`lieu_vente_id`) REFERENCES `lieux_ventes` (`id`),
  ADD CONSTRAINT `FK_6DA8D105F4445056` FOREIGN KEY (`devise_id`) REFERENCES `devise` (`id`);

--
-- Contraintes pour la table `bon_commande_fournisseur`
--
ALTER TABLE `bon_commande_fournisseur`
  ADD CONSTRAINT `FK_D91605A91C109075` FOREIGN KEY (`personnel_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_D91605A9670C757F` FOREIGN KEY (`fournisseur_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_D91605A9AA2B41DC` FOREIGN KEY (`lieu_vente_id`) REFERENCES `lieux_ventes` (`id`),
  ADD CONSTRAINT `FK_D91605A9F4445056` FOREIGN KEY (`devise_id`) REFERENCES `devise` (`id`);

--
-- Contraintes pour la table `caisse`
--
ALTER TABLE `caisse`
  ADD CONSTRAINT `FK_B2A353C83F95E273` FOREIGN KEY (`point_de_vente_id`) REFERENCES `point_de_vente` (`id`);

--
-- Contraintes pour la table `cheque_espece`
--
ALTER TABLE `cheque_espece`
  ADD CONSTRAINT `FK_EDD98F311D002A8F` FOREIGN KEY (`caisse_retrait_id`) REFERENCES `caisse` (`id`),
  ADD CONSTRAINT `FK_EDD98F315227BF46` FOREIGN KEY (`caisse_depot_id`) REFERENCES `caisse` (`id`),
  ADD CONSTRAINT `FK_EDD98F31A848E3B1` FOREIGN KEY (`collaborateur_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_EDD98F31AA2B41DC` FOREIGN KEY (`lieu_vente_id`) REFERENCES `lieux_ventes` (`id`),
  ADD CONSTRAINT `FK_EDD98F31C74AC7FE` FOREIGN KEY (`saisie_par_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `FK_C74404558E780FD` FOREIGN KEY (`rattachement_id`) REFERENCES `lieux_ventes` (`id`),
  ADD CONSTRAINT `FK_C7440455A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `cloture_caisse`
--
ALTER TABLE `cloture_caisse`
  ADD CONSTRAINT `FK_21B102FD27B4FEBF` FOREIGN KEY (`caisse_id`) REFERENCES `caisse` (`id`),
  ADD CONSTRAINT `FK_21B102FDAA2B41DC` FOREIGN KEY (`lieu_vente_id`) REFERENCES `lieux_ventes` (`id`),
  ADD CONSTRAINT `FK_21B102FDC74AC7FE` FOREIGN KEY (`saisie_par_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_21B102FDF4445056` FOREIGN KEY (`devise_id`) REFERENCES `devise` (`id`);

--
-- Contraintes pour la table `commande_product`
--
ALTER TABLE `commande_product`
  ADD CONSTRAINT `FK_25F1760D4584665A` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FK_25F1760DDBC5F284` FOREIGN KEY (`facturation_id`) REFERENCES `facturation` (`id`);

--
-- Contraintes pour la table `commission_vente`
--
ALTER TABLE `commission_vente`
  ADD CONSTRAINT `FK_C6CB38DF5AF81F68` FOREIGN KEY (`beneficiaire_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_C6CB38DF7F2DEE08` FOREIGN KEY (`facture_id`) REFERENCES `facturation` (`id`);

--
-- Contraintes pour la table `decaissement`
--
ALTER TABLE `decaissement`
  ADD CONSTRAINT `FK_E5CCA29B167FABE8` FOREIGN KEY (`traite_par_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_E5CCA29B19EB6921` FOREIGN KEY (`client_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_E5CCA29B62E04A07` FOREIGN KEY (`mode_paie_id`) REFERENCES `mode_paiement` (`id`),
  ADD CONSTRAINT `FK_E5CCA29BAA2B41DC` FOREIGN KEY (`lieu_vente_id`) REFERENCES `lieux_ventes` (`id`),
  ADD CONSTRAINT `FK_E5CCA29BBCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie_decaissement` (`id`),
  ADD CONSTRAINT `FK_E5CCA29BF4445056` FOREIGN KEY (`devise_id`) REFERENCES `devise` (`id`),
  ADD CONSTRAINT `FK_E5CCA29BFA9687D0` FOREIGN KEY (`compte_decaisser_id`) REFERENCES `caisse` (`id`);

--
-- Contraintes pour la table `depenses`
--
ALTER TABLE `depenses`
  ADD CONSTRAINT `FK_EE350ECB167FABE8` FOREIGN KEY (`traite_par_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_EE350ECB1D002A8F` FOREIGN KEY (`caisse_retrait_id`) REFERENCES `caisse` (`id`),
  ADD CONSTRAINT `FK_EE350ECB438F5B63` FOREIGN KEY (`mode_paiement_id`) REFERENCES `mode_paiement` (`id`),
  ADD CONSTRAINT `FK_EE350ECBAA2B41DC` FOREIGN KEY (`lieu_vente_id`) REFERENCES `lieux_ventes` (`id`),
  ADD CONSTRAINT `FK_EE350ECBDF11DFCF` FOREIGN KEY (`categorie_depense_id`) REFERENCES `categorie_depense` (`id`),
  ADD CONSTRAINT `FK_EE350ECBF4445056` FOREIGN KEY (`devise_id`) REFERENCES `devise` (`id`);

--
-- Contraintes pour la table `dimensions`
--
ALTER TABLE `dimensions`
  ADD CONSTRAINT `FK_E27D8BA5BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`);

--
-- Contraintes pour la table `echange_devise`
--
ALTER TABLE `echange_devise`
  ADD CONSTRAINT `FK_9D6D974E307009CD` FOREIGN KEY (`devise_destination_id`) REFERENCES `devise` (`id`),
  ADD CONSTRAINT `FK_9D6D974E33B37C92` FOREIGN KEY (`devise_origine_id`) REFERENCES `devise` (`id`),
  ADD CONSTRAINT `FK_9D6D974E637FF67B` FOREIGN KEY (`caisse_origine_id`) REFERENCES `caisse` (`id`),
  ADD CONSTRAINT `FK_9D6D974E7B81509F` FOREIGN KEY (`caisse_destination_id`) REFERENCES `caisse` (`id`),
  ADD CONSTRAINT `FK_9D6D974EAA2B41DC` FOREIGN KEY (`lieu_vente_id`) REFERENCES `lieux_ventes` (`id`),
  ADD CONSTRAINT `FK_9D6D974EC74AC7FE` FOREIGN KEY (`saisie_par_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `epaisseurs`
--
ALTER TABLE `epaisseurs`
  ADD CONSTRAINT `FK_9F8BBE8CBCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`);

--
-- Contraintes pour la table `facturation`
--
ALTER TABLE `facturation`
  ADD CONSTRAINT `FK_17EB513A19EB6921` FOREIGN KEY (`client_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_17EB513A27B4FEBF` FOREIGN KEY (`caisse_id`) REFERENCES `caisse` (`id`),
  ADD CONSTRAINT `FK_17EB513A62E04A07` FOREIGN KEY (`mode_paie_id`) REFERENCES `mode_paiement` (`id`),
  ADD CONSTRAINT `FK_17EB513AAA2B41DC` FOREIGN KEY (`lieu_vente_id`) REFERENCES `lieux_ventes` (`id`),
  ADD CONSTRAINT `FK_17EB513AC74AC7FE` FOREIGN KEY (`saisie_par_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_17EB513AE91D11FF` FOREIGN KEY (`proformat_id`) REFERENCES `proformat` (`id`);

--
-- Contraintes pour la table `facture_frais`
--
ALTER TABLE `facture_frais`
  ADD CONSTRAINT `FK_B774C42F1C109075` FOREIGN KEY (`personnel_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_B774C42F27B4FEBF` FOREIGN KEY (`caisse_id`) REFERENCES `caisse` (`id`),
  ADD CONSTRAINT `FK_B774C42F670C757F` FOREIGN KEY (`fournisseur_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_B774C42FAA2B41DC` FOREIGN KEY (`lieu_vente_id`) REFERENCES `lieux_ventes` (`id`),
  ADD CONSTRAINT `FK_B774C42FF4445056` FOREIGN KEY (`devise_id`) REFERENCES `devise` (`id`);

--
-- Contraintes pour la table `facture_frais_sup`
--
ALTER TABLE `facture_frais_sup`
  ADD CONSTRAINT `FK_9671F1476DE81F47` FOREIGN KEY (`frais_sup_id`) REFERENCES `frais_sup` (`id`),
  ADD CONSTRAINT `FK_9671F147DBC5F284` FOREIGN KEY (`facturation_id`) REFERENCES `facturation` (`id`),
  ADD CONSTRAINT `FK_9671F147F4445056` FOREIGN KEY (`devise_id`) REFERENCES `devise` (`id`);

--
-- Contraintes pour la table `gestion_cheque`
--
ALTER TABLE `gestion_cheque`
  ADD CONSTRAINT `FK_99F55144167FABE8` FOREIGN KEY (`traite_par_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_99F551444DA6FBA9` FOREIGN KEY (`lieu_vente_depart_id`) REFERENCES `lieux_ventes` (`id`),
  ADD CONSTRAINT `FK_99F551445001D256` FOREIGN KEY (`caisse_depart_id`) REFERENCES `caisse` (`id`),
  ADD CONSTRAINT `FK_99F551447ABE48CB` FOREIGN KEY (`lieu_vente_reception_id`) REFERENCES `lieux_ventes` (`id`),
  ADD CONSTRAINT `FK_99F55144A848E3B1` FOREIGN KEY (`collaborateur_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_99F55144C8D2D59B` FOREIGN KEY (`caisse_reception_id`) REFERENCES `caisse` (`id`),
  ADD CONSTRAINT `FK_99F55144D48E93B2` FOREIGN KEY (`mouvement_caisse_id`) REFERENCES `mouvement_caisse` (`id`),
  ADD CONSTRAINT `FK_99F55144D603292` FOREIGN KEY (`envoye_par_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `inventaire`
--
ALTER TABLE `inventaire`
  ADD CONSTRAINT `FK_338920E01C109075` FOREIGN KEY (`personnel_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_338920E04584665A` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FK_338920E0CE430A85` FOREIGN KEY (`inventaire_id`) REFERENCES `liste_inventaire` (`id`),
  ADD CONSTRAINT `FK_338920E0DCD6110` FOREIGN KEY (`stock_id`) REFERENCES `liste_stock` (`id`);

--
-- Contraintes pour la table `liaison_produit`
--
ALTER TABLE `liaison_produit`
  ADD CONSTRAINT `FK_7F4F29C1EEB99D97` FOREIGN KEY (`produit2_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FK_7F4F29C1FC0C3279` FOREIGN KEY (`produit1_id`) REFERENCES `products` (`id`);

--
-- Contraintes pour la table `licence`
--
ALTER TABLE `licence`
  ADD CONSTRAINT `FK_1DAAE648A4AEAFEA` FOREIGN KEY (`entreprise_id`) REFERENCES `entreprise` (`id`);

--
-- Contraintes pour la table `lieux_ventes`
--
ALTER TABLE `lieux_ventes`
  ADD CONSTRAINT `FK_8FE8FCB76885AC1B` FOREIGN KEY (`gestionnaire_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_8FE8FCB7A4AEAFEA` FOREIGN KEY (`entreprise_id`) REFERENCES `entreprise` (`id`);

--
-- Contraintes pour la table `liste_inventaire`
--
ALTER TABLE `liste_inventaire`
  ADD CONSTRAINT `FK_2163BD761C109075` FOREIGN KEY (`personnel_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_2163BD76AA2B41DC` FOREIGN KEY (`lieu_vente_id`) REFERENCES `lieux_ventes` (`id`);

--
-- Contraintes pour la table `liste_product_achat_fournisseur`
--
ALTER TABLE `liste_product_achat_fournisseur`
  ADD CONSTRAINT `FK_62BFDB831C109075` FOREIGN KEY (`personnel_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_62BFDB834584665A` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FK_62BFDB83DCD6110` FOREIGN KEY (`stock_id`) REFERENCES `liste_stock` (`id`),
  ADD CONSTRAINT `FK_62BFDB83EE4462DB` FOREIGN KEY (`achat_fournisseur_id`) REFERENCES `achat_fournisseur` (`id`);

--
-- Contraintes pour la table `liste_product_achat_fournisseur_frais`
--
ALTER TABLE `liste_product_achat_fournisseur_frais`
  ADD CONSTRAINT `FK_C73BC9B81C109075` FOREIGN KEY (`personnel_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_C73BC9B84584665A` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FK_C73BC9B8EE4462DB` FOREIGN KEY (`achat_fournisseur_id`) REFERENCES `achat_fournisseur` (`id`);

--
-- Contraintes pour la table `liste_product_achat_fournisseur_multiple`
--
ALTER TABLE `liste_product_achat_fournisseur_multiple`
  ADD CONSTRAINT `FK_BCD9FFBC1C109075` FOREIGN KEY (`personnel_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_BCD9FFBC71EC7B3D` FOREIGN KEY (`liste_product_achat_id`) REFERENCES `liste_product_achat_fournisseur` (`id`),
  ADD CONSTRAINT `FK_BCD9FFBCDCD6110` FOREIGN KEY (`stock_id`) REFERENCES `liste_stock` (`id`);

--
-- Contraintes pour la table `liste_product_bon_fournisseur`
--
ALTER TABLE `liste_product_bon_fournisseur`
  ADD CONSTRAINT `FK_9273D48E4506587E` FOREIGN KEY (`bon_fournisseur_id`) REFERENCES `bon_commande_fournisseur` (`id`),
  ADD CONSTRAINT `FK_9273D48E4584665A` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Contraintes pour la table `liste_stock`
--
ALTER TABLE `liste_stock`
  ADD CONSTRAINT `FK_54CD82CE53C59D72` FOREIGN KEY (`responsable_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_54CD82CEAA2B41DC` FOREIGN KEY (`lieu_vente_id`) REFERENCES `lieux_ventes` (`id`);

--
-- Contraintes pour la table `liste_transfert_product`
--
ALTER TABLE `liste_transfert_product`
  ADD CONSTRAINT `FK_F383D2351C109075` FOREIGN KEY (`personnel_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_F383D235309247F3` FOREIGN KEY (`stock_recep_id`) REFERENCES `liste_stock` (`id`),
  ADD CONSTRAINT `FK_F383D235369F18A3` FOREIGN KEY (`stock_depart_id`) REFERENCES `liste_stock` (`id`),
  ADD CONSTRAINT `FK_F383D2353C9C4BAD` FOREIGN KEY (`transfert_id`) REFERENCES `transfert_products` (`id`),
  ADD CONSTRAINT `FK_F383D2354584665A` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Contraintes pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD CONSTRAINT `FK_A60C9F1F82EA2E54` FOREIGN KEY (`commande_id`) REFERENCES `commande_product` (`id`),
  ADD CONSTRAINT `FK_A60C9F1FC74AC7FE` FOREIGN KEY (`saisie_par_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_A60C9F1FDCD6110` FOREIGN KEY (`stock_id`) REFERENCES `liste_stock` (`id`);

--
-- Contraintes pour la table `modification`
--
ALTER TABLE `modification`
  ADD CONSTRAINT `FK_EF6425D2167FABE8` FOREIGN KEY (`traite_par_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_EF6425D227B4FEBF` FOREIGN KEY (`caisse_id`) REFERENCES `caisse` (`id`),
  ADD CONSTRAINT `FK_EF6425D241D81563` FOREIGN KEY (`depense_id`) REFERENCES `depenses` (`id`),
  ADD CONSTRAINT `FK_EF6425D299E4C234` FOREIGN KEY (`decaissement_id`) REFERENCES `decaissement` (`id`),
  ADD CONSTRAINT `FK_EF6425D2A848E3B1` FOREIGN KEY (`collaborateur_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_EF6425D2DBBF8D62` FOREIGN KEY (`versement_id`) REFERENCES `versement` (`id`),
  ADD CONSTRAINT `FK_EF6425D2F4445056` FOREIGN KEY (`devise_id`) REFERENCES `devise` (`id`);

--
-- Contraintes pour la table `modification_facture`
--
ALTER TABLE `modification_facture`
  ADD CONSTRAINT `FK_6A92FF7519EB6921` FOREIGN KEY (`client_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_6A92FF7527B4FEBF` FOREIGN KEY (`caisse_id`) REFERENCES `caisse` (`id`),
  ADD CONSTRAINT `FK_6A92FF7562E04A07` FOREIGN KEY (`mode_paie_id`) REFERENCES `mode_paiement` (`id`),
  ADD CONSTRAINT `FK_6A92FF757F2DEE08` FOREIGN KEY (`facture_id`) REFERENCES `facturation` (`id`),
  ADD CONSTRAINT `FK_6A92FF75AA2B41DC` FOREIGN KEY (`lieu_vente_id`) REFERENCES `lieux_ventes` (`id`),
  ADD CONSTRAINT `FK_6A92FF75C74AC7FE` FOREIGN KEY (`saisie_par_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `modif_decaissement`
--
ALTER TABLE `modif_decaissement`
  ADD CONSTRAINT `FK_DBDC7D8E167FABE8` FOREIGN KEY (`traite_par_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_DBDC7D8E19EB6921` FOREIGN KEY (`client_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_DBDC7D8E27B4FEBF` FOREIGN KEY (`caisse_id`) REFERENCES `caisse` (`id`),
  ADD CONSTRAINT `FK_DBDC7D8E41D81563` FOREIGN KEY (`depense_id`) REFERENCES `depenses` (`id`),
  ADD CONSTRAINT `FK_DBDC7D8E99E4C234` FOREIGN KEY (`decaissement_id`) REFERENCES `decaissement` (`id`),
  ADD CONSTRAINT `FK_DBDC7D8EF4445056` FOREIGN KEY (`devise_id`) REFERENCES `devise` (`id`);

--
-- Contraintes pour la table `mouvement_caisse`
--
ALTER TABLE `mouvement_caisse`
  ADD CONSTRAINT `FK_C8E3DDFE12B37E1D` FOREIGN KEY (`transfert_fond_id`) REFERENCES `transfert_fond` (`id`),
  ADD CONSTRAINT `FK_C8E3DDFE13713818` FOREIGN KEY (`echange_id`) REFERENCES `echange_devise` (`id`),
  ADD CONSTRAINT `FK_C8E3DDFE20A4D832` FOREIGN KEY (`avance_salaire_id`) REFERENCES `avance_salaire` (`id`),
  ADD CONSTRAINT `FK_C8E3DDFE27B4FEBF` FOREIGN KEY (`caisse_id`) REFERENCES `caisse` (`id`),
  ADD CONSTRAINT `FK_C8E3DDFE2886B1E4` FOREIGN KEY (`compte_operation_id`) REFERENCES `compte_operation` (`id`),
  ADD CONSTRAINT `FK_C8E3DDFE3DAF7301` FOREIGN KEY (`categorie_operation_id`) REFERENCES `categorie_operation` (`id`),
  ADD CONSTRAINT `FK_C8E3DDFE3FE4D754` FOREIGN KEY (`cloture_id`) REFERENCES `cloture_caisse` (`id`),
  ADD CONSTRAINT `FK_C8E3DDFE41D81563` FOREIGN KEY (`depense_id`) REFERENCES `depenses` (`id`),
  ADD CONSTRAINT `FK_C8E3DDFE4EF48CBA` FOREIGN KEY (`retour_product_id`) REFERENCES `retour_product` (`id`),
  ADD CONSTRAINT `FK_C8E3DDFE62E04A07` FOREIGN KEY (`mode_paie_id`) REFERENCES `mode_paiement` (`id`),
  ADD CONSTRAINT `FK_C8E3DDFE89312FE9` FOREIGN KEY (`recette_id`) REFERENCES `recette` (`id`),
  ADD CONSTRAINT `FK_C8E3DDFE99E4C234` FOREIGN KEY (`decaissement_id`) REFERENCES `decaissement` (`id`),
  ADD CONSTRAINT `FK_C8E3DDFEAA2B41DC` FOREIGN KEY (`lieu_vente_id`) REFERENCES `lieux_ventes` (`id`),
  ADD CONSTRAINT `FK_C8E3DDFEB0B7A971` FOREIGN KEY (`paiement_salaire_id`) REFERENCES `paiement_salaire_personnel` (`id`),
  ADD CONSTRAINT `FK_C8E3DDFEC74AC7FE` FOREIGN KEY (`saisie_par_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_C8E3DDFEDBBF8D62` FOREIGN KEY (`versement_id`) REFERENCES `versement` (`id`),
  ADD CONSTRAINT `FK_C8E3DDFEDBC5F284` FOREIGN KEY (`facturation_id`) REFERENCES `facturation` (`id`),
  ADD CONSTRAINT `FK_C8E3DDFEF4445056` FOREIGN KEY (`devise_id`) REFERENCES `devise` (`id`),
  ADD CONSTRAINT `FK_C8E3DDFEFCA48E` FOREIGN KEY (`cheque_espece_id`) REFERENCES `cheque_espece` (`id`);

--
-- Contraintes pour la table `mouvement_collaborateur`
--
ALTER TABLE `mouvement_collaborateur`
  ADD CONSTRAINT `FK_C47441A2167FABE8` FOREIGN KEY (`traite_par_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_C47441A220A4D832` FOREIGN KEY (`avance_salaire_id`) REFERENCES `avance_salaire` (`id`),
  ADD CONSTRAINT `FK_C47441A227B4FEBF` FOREIGN KEY (`caisse_id`) REFERENCES `caisse` (`id`),
  ADD CONSTRAINT `FK_C47441A24EF48CBA` FOREIGN KEY (`retour_product_id`) REFERENCES `retour_product` (`id`),
  ADD CONSTRAINT `FK_C47441A2503C6C15` FOREIGN KEY (`ajustement_id`) REFERENCES `ajustement_solde` (`id`),
  ADD CONSTRAINT `FK_C47441A27F2DEE08` FOREIGN KEY (`facture_id`) REFERENCES `facturation` (`id`),
  ADD CONSTRAINT `FK_C47441A299E4C234` FOREIGN KEY (`decaissement_id`) REFERENCES `decaissement` (`id`),
  ADD CONSTRAINT `FK_C47441A2A848E3B1` FOREIGN KEY (`collaborateur_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_C47441A2AA2B41DC` FOREIGN KEY (`lieu_vente_id`) REFERENCES `lieux_ventes` (`id`),
  ADD CONSTRAINT `FK_C47441A2ADAE6335` FOREIGN KEY (`facture_frais_id`) REFERENCES `facture_frais` (`id`),
  ADD CONSTRAINT `FK_C47441A2CD76E8DD` FOREIGN KEY (`retour_product_fournisseur_id`) REFERENCES `retour_product_fournisseur` (`id`),
  ADD CONSTRAINT `FK_C47441A2DBBF8D62` FOREIGN KEY (`versement_id`) REFERENCES `versement` (`id`),
  ADD CONSTRAINT `FK_C47441A2EE4462DB` FOREIGN KEY (`achat_fournisseur_id`) REFERENCES `achat_fournisseur` (`id`),
  ADD CONSTRAINT `FK_C47441A2F3F4C2C` FOREIGN KEY (`transfert_cheque_id`) REFERENCES `gestion_cheque` (`id`),
  ADD CONSTRAINT `FK_C47441A2F4445056` FOREIGN KEY (`devise_id`) REFERENCES `devise` (`id`),
  ADD CONSTRAINT `FK_C47441A2FCA48E` FOREIGN KEY (`cheque_espece_id`) REFERENCES `cheque_espece` (`id`);

--
-- Contraintes pour la table `mouvement_product`
--
ALTER TABLE `mouvement_product`
  ADD CONSTRAINT `FK_1C8AD1BA19EB6921` FOREIGN KEY (`client_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_1C8AD1BA1C109075` FOREIGN KEY (`personnel_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_1C8AD1BA3C9C4BAD` FOREIGN KEY (`transfert_id`) REFERENCES `liste_transfert_product` (`id`),
  ADD CONSTRAINT `FK_1C8AD1BA4584665A` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FK_1C8AD1BA49809274` FOREIGN KEY (`livraison_multiple_id`) REFERENCES `liste_product_achat_fournisseur_multiple` (`id`),
  ADD CONSTRAINT `FK_1C8AD1BA8E54FB25` FOREIGN KEY (`livraison_id`) REFERENCES `livraison` (`id`),
  ADD CONSTRAINT `FK_1C8AD1BAAA2B41DC` FOREIGN KEY (`lieu_vente_id`) REFERENCES `lieux_ventes` (`id`),
  ADD CONSTRAINT `FK_1C8AD1BAAEEAB197` FOREIGN KEY (`anomalie_id`) REFERENCES `anomalie_produit` (`id`),
  ADD CONSTRAINT `FK_1C8AD1BACE430A85` FOREIGN KEY (`inventaire_id`) REFERENCES `inventaire` (`id`),
  ADD CONSTRAINT `FK_1C8AD1BAEBCD91F6` FOREIGN KEY (`stock_product_id`) REFERENCES `liste_stock` (`id`),
  ADD CONSTRAINT `FK_1C8AD1BAEE4462DB` FOREIGN KEY (`achat_fournisseur_id`) REFERENCES `liste_product_achat_fournisseur` (`id`);

--
-- Contraintes pour la table `paiement_salaire_personnel`
--
ALTER TABLE `paiement_salaire_personnel`
  ADD CONSTRAINT `FK_B221A0971C109075` FOREIGN KEY (`personnel_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_B221A097615593E9` FOREIGN KEY (`type_paiement_id`) REFERENCES `mode_paiement` (`id`),
  ADD CONSTRAINT `FK_B221A097AA2B41DC` FOREIGN KEY (`lieu_vente_id`) REFERENCES `lieux_ventes` (`id`),
  ADD CONSTRAINT `FK_B221A097B6EC9AC4` FOREIGN KEY (`compte_retrait_id`) REFERENCES `caisse` (`id`),
  ADD CONSTRAINT `FK_B221A097C74AC7FE` FOREIGN KEY (`saisie_par_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_B221A097F4445056` FOREIGN KEY (`devise_id`) REFERENCES `devise` (`id`);

--
-- Contraintes pour la table `personnel`
--
ALTER TABLE `personnel`
  ADD CONSTRAINT `FK_A6BCF3DEA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `point_de_vente`
--
ALTER TABLE `point_de_vente`
  ADD CONSTRAINT `FK_C9182F7BAA2B41DC` FOREIGN KEY (`lieu_vente_id`) REFERENCES `lieux_ventes` (`id`);

--
-- Contraintes pour la table `primes_personnel`
--
ALTER TABLE `primes_personnel`
  ADD CONSTRAINT `FK_29C84C671C109075` FOREIGN KEY (`personnel_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_29C84C67AA2B41DC` FOREIGN KEY (`lieu_vente_id`) REFERENCES `lieux_ventes` (`id`),
  ADD CONSTRAINT `FK_29C84C67C74AC7FE` FOREIGN KEY (`saisie_par_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_B3BA5A5A277428AD` FOREIGN KEY (`dimension_id`) REFERENCES `dimensions` (`id`),
  ADD CONSTRAINT `FK_B3BA5A5A35810E93` FOREIGN KEY (`epaisseur_id`) REFERENCES `epaisseurs` (`id`),
  ADD CONSTRAINT `FK_B3BA5A5A87998E` FOREIGN KEY (`origine_id`) REFERENCES `origine_produit` (`id`),
  ADD CONSTRAINT `FK_B3BA5A5ABCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`),
  ADD CONSTRAINT `FK_B3BA5A5AC54C8C93` FOREIGN KEY (`type_id`) REFERENCES `type_produit` (`id`);

--
-- Contraintes pour la table `proformat`
--
ALTER TABLE `proformat`
  ADD CONSTRAINT `FK_EA59AEE619EB6921` FOREIGN KEY (`client_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_EA59AEE6AA2B41DC` FOREIGN KEY (`lieu_vente_id`) REFERENCES `lieux_ventes` (`id`),
  ADD CONSTRAINT `FK_EA59AEE6C74AC7FE` FOREIGN KEY (`saisie_par_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `proformat_frais_sup`
--
ALTER TABLE `proformat_frais_sup`
  ADD CONSTRAINT `FK_EA6658226DE81F47` FOREIGN KEY (`frais_sup_id`) REFERENCES `frais_sup` (`id`),
  ADD CONSTRAINT `FK_EA665822E91D11FF` FOREIGN KEY (`proformat_id`) REFERENCES `proformat` (`id`),
  ADD CONSTRAINT `FK_EA665822F4445056` FOREIGN KEY (`devise_id`) REFERENCES `devise` (`id`);

--
-- Contraintes pour la table `proformat_product`
--
ALTER TABLE `proformat_product`
  ADD CONSTRAINT `FK_BCCCE7444584665A` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FK_BCCCE744E91D11FF` FOREIGN KEY (`proformat_id`) REFERENCES `proformat` (`id`);

--
-- Contraintes pour la table `recette`
--
ALTER TABLE `recette`
  ADD CONSTRAINT `FK_49BB639027B4FEBF` FOREIGN KEY (`caisse_id`) REFERENCES `caisse` (`id`),
  ADD CONSTRAINT `FK_49BB639062E04A07` FOREIGN KEY (`mode_paie_id`) REFERENCES `mode_paiement` (`id`),
  ADD CONSTRAINT `FK_49BB6390AA2B41DC` FOREIGN KEY (`lieu_vente_id`) REFERENCES `lieux_ventes` (`id`),
  ADD CONSTRAINT `FK_49BB6390BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie_recette` (`id`),
  ADD CONSTRAINT `FK_49BB6390C74AC7FE` FOREIGN KEY (`saisie_par_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_49BB6390F4445056` FOREIGN KEY (`devise_id`) REFERENCES `devise` (`id`);

--
-- Contraintes pour la table `retour_product`
--
ALTER TABLE `retour_product`
  ADD CONSTRAINT `FK_2113202127B4FEBF` FOREIGN KEY (`caisse_id`) REFERENCES `caisse` (`id`),
  ADD CONSTRAINT `FK_211320214584665A` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FK_2113202182EA2E54` FOREIGN KEY (`commande_id`) REFERENCES `commande_product` (`id`),
  ADD CONSTRAINT `FK_21132021AA2B41DC` FOREIGN KEY (`lieu_vente_id`) REFERENCES `lieux_ventes` (`id`),
  ADD CONSTRAINT `FK_21132021B04BE5F7` FOREIGN KEY (`stock_retour_id`) REFERENCES `liste_stock` (`id`),
  ADD CONSTRAINT `FK_21132021C74AC7FE` FOREIGN KEY (`saisie_par_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `retour_product_fournisseur`
--
ALTER TABLE `retour_product_fournisseur`
  ADD CONSTRAINT `FK_3438CC8771EC7B3D` FOREIGN KEY (`liste_product_achat_id`) REFERENCES `liste_product_achat_fournisseur` (`id`),
  ADD CONSTRAINT `FK_3438CC87AA2B41DC` FOREIGN KEY (`lieu_vente_id`) REFERENCES `lieux_ventes` (`id`),
  ADD CONSTRAINT `FK_3438CC87C74AC7FE` FOREIGN KEY (`saisie_par_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `FK_4B3656604584665A` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FK_4B365660A17D8957` FOREIGN KEY (`stock_produit_id`) REFERENCES `liste_stock` (`id`);

--
-- Contraintes pour la table `suppression_facture`
--
ALTER TABLE `suppression_facture`
  ADD CONSTRAINT `FK_15A6587019EB6921` FOREIGN KEY (`client_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_15A6587027B4FEBF` FOREIGN KEY (`caisse_id`) REFERENCES `caisse` (`id`),
  ADD CONSTRAINT `FK_15A6587062E04A07` FOREIGN KEY (`mode_paie_id`) REFERENCES `mode_paiement` (`id`),
  ADD CONSTRAINT `FK_15A65870AA2B41DC` FOREIGN KEY (`lieu_vente_id`) REFERENCES `lieux_ventes` (`id`),
  ADD CONSTRAINT `FK_15A65870C74AC7FE` FOREIGN KEY (`saisie_par_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `taux_devise`
--
ALTER TABLE `taux_devise`
  ADD CONSTRAINT `FK_F96A6F4EAA2B41DC` FOREIGN KEY (`lieu_vente_id`) REFERENCES `lieux_ventes` (`id`),
  ADD CONSTRAINT `FK_F96A6F4EF4445056` FOREIGN KEY (`devise_id`) REFERENCES `devise` (`id`);

--
-- Contraintes pour la table `transfert_fond`
--
ALTER TABLE `transfert_fond`
  ADD CONSTRAINT `FK_5EE96800167FABE8` FOREIGN KEY (`traite_par_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_5EE968005001D256` FOREIGN KEY (`caisse_depart_id`) REFERENCES `caisse` (`id`),
  ADD CONSTRAINT `FK_5EE968007ABE48CB` FOREIGN KEY (`lieu_vente_reception_id`) REFERENCES `lieux_ventes` (`id`),
  ADD CONSTRAINT `FK_5EE96800AA2B41DC` FOREIGN KEY (`lieu_vente_id`) REFERENCES `lieux_ventes` (`id`),
  ADD CONSTRAINT `FK_5EE96800C8D2D59B` FOREIGN KEY (`caisse_reception_id`) REFERENCES `caisse` (`id`),
  ADD CONSTRAINT `FK_5EE96800D603292` FOREIGN KEY (`envoye_par_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_5EE96800F4445056` FOREIGN KEY (`devise_id`) REFERENCES `devise` (`id`);

--
-- Contraintes pour la table `transfert_products`
--
ALTER TABLE `transfert_products`
  ADD CONSTRAINT `FK_8741DE76167FABE8` FOREIGN KEY (`traite_par_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_8741DE764DA6FBA9` FOREIGN KEY (`lieu_vente_depart_id`) REFERENCES `lieux_ventes` (`id`),
  ADD CONSTRAINT `FK_8741DE76B85AE339` FOREIGN KEY (`lieu_vente_recep_id`) REFERENCES `lieux_ventes` (`id`),
  ADD CONSTRAINT `FK_8741DE76FC29C013` FOREIGN KEY (`cree_par_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_8D93D64998260155` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`),
  ADD CONSTRAINT `FK_8D93D649AA2B41DC` FOREIGN KEY (`lieu_vente_id`) REFERENCES `lieux_ventes` (`id`);

--
-- Contraintes pour la table `versement`
--
ALTER TABLE `versement`
  ADD CONSTRAINT `FK_716E9367167FABE8` FOREIGN KEY (`traite_par_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_716E936719EB6921` FOREIGN KEY (`client_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_716E936762E04A07` FOREIGN KEY (`mode_paie_id`) REFERENCES `mode_paiement` (`id`),
  ADD CONSTRAINT `FK_716E9367AA2B41DC` FOREIGN KEY (`lieu_vente_id`) REFERENCES `lieux_ventes` (`id`),
  ADD CONSTRAINT `FK_716E9367BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie_decaissement` (`id`),
  ADD CONSTRAINT `FK_716E9367F2C56620` FOREIGN KEY (`compte_id`) REFERENCES `caisse` (`id`),
  ADD CONSTRAINT `FK_716E9367F4445056` FOREIGN KEY (`devise_id`) REFERENCES `devise` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
