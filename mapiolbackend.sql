-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 28, 2024 at 04:29 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mapiolbackend`
--

-- --------------------------------------------------------

--
-- Table structure for table `abonnees`
--

CREATE TABLE `abonnees` (
  `id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `proprietaire_id` int UNSIGNED NOT NULL,
  `typeAbonnement_id` int UNSIGNED NOT NULL,
  `statut` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `biens`
--

CREATE TABLE `biens` (
  `id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `proprietaire_id` int UNSIGNED NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `typemouvement` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nbrchambre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surface` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codepostal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ville_id` int UNSIGNED NOT NULL,
  `nbrbatiment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nbretage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nbrescalier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numeroporte` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zoneStationnement` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ungarage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unecave` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `internet` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dep_tvecranplat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dep_lingemaison` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dep_lavevaiselle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pc_gardiennage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pc_interphone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pc_ascenseur` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pc_vide_ordure` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pc_espace_vert` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pc_chauffage_collective` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pc_eau_chaude_collective` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pc_antennetv_collective` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exist_balcon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exist_cheminee` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exist_salle_manger` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exist_proxi_education` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exist_sous_sol` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exist_proxi_centre_sante` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exist_proxi_restaurant` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `anneeconstruction` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nbr_salle_bain` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img5` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img6` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img7` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `typeBien_id` int UNSIGNED NOT NULL,
  `statut` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contrats`
--

CREATE TABLE `contrats` (
  `id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `duree` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateDedut` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `montantLoyer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `charge` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `typecharge_id` int UNSIGNED NOT NULL,
  `periode_paiement` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jourpaiement` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `typePaiement_id` int UNSIGNED NOT NULL,
  `clause_revision_loyer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `indice_reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_bail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clauseparticuliere` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `garantsolidaire` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aut_paiement` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aut_avis_echeance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aut_quittance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `typeContrat_id` int UNSIGNED NOT NULL,
  `statut` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proprietaire_id` int UNSIGNED NOT NULL,
  `locataire_id` int UNSIGNED NOT NULL,
  `location_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `finances`
--

CREATE TABLE `finances` (
  `id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `proprietaire_id` int UNSIGNED NOT NULL,
  `bien_id` int UNSIGNED NOT NULL,
  `typePaiement_id` int UNSIGNED NOT NULL,
  `autre_typepaiement` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datepaiement` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `montant` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `statut` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `periode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentaire` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `frequence` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `typeFinance_id` int UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `locataire_id` int UNSIGNED NOT NULL,
  `proprietaire_id` int UNSIGNED NOT NULL,
  `contrat_id` int UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `recepteur_id` int UNSIGNED NOT NULL,
  `emetteur_id` int UNSIGNED NOT NULL,
  `contenue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `statut` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_02_14_214939_create_abonnees_table', 1),
(6, '2024_02_14_214939_create_biens_table', 1),
(7, '2024_02_14_214939_create_contrats_table', 1),
(8, '2024_02_14_214939_create_finances_table', 1),
(9, '2024_02_14_214939_create_locations_table', 1),
(10, '2024_02_14_214939_create_messages_table', 1),
(11, '2024_02_14_214939_create_pays_table', 1),
(12, '2024_02_14_214939_create_regions_table', 1),
(13, '2024_02_14_214939_create_typeAbonnements_table', 1),
(14, '2024_02_14_214939_create_typeBiens_table', 1),
(15, '2024_02_14_214939_create_typeCharge_table', 1),
(16, '2024_02_14_214939_create_typeContrats_table', 1),
(17, '2024_02_14_214939_create_typeFinances_table', 1),
(18, '2024_02_14_214939_create_typePaiement_table', 1),
(19, '2024_02_14_214939_create_typeUsers_table', 1),
(20, '2024_02_14_214939_create_utilisateurs_table', 1),
(21, '2024_02_14_214939_create_villes_table', 1),
(22, '2024_02_14_214949_create_foreign_keys', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pays`
--

CREATE TABLE `pays` (
  `id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pay_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `typeabonnements`
--

CREATE TABLE `typeabonnements` (
  `id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `montant` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duree` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `typebiens`
--

CREATE TABLE `typebiens` (
  `id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `typecharge`
--

CREATE TABLE `typecharge` (
  `id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `typecontrats`
--

CREATE TABLE `typecontrats` (
  `id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `typefinances`
--

CREATE TABLE `typefinances` (
  `id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `typepaiement`
--

CREATE TABLE `typepaiement` (
  `id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `typeusers`
--

CREATE TABLE `typeusers` (
  `id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sexe` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `typeUser_id` int UNSIGNED NOT NULL,
  `statut` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `villes`
--

CREATE TABLE `villes` (
  `id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pay_id` int UNSIGNED NOT NULL,
  `region_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abonnees`
--
ALTER TABLE `abonnees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `abonnees_proprietaire_id_foreign` (`proprietaire_id`),
  ADD KEY `abonnees_typeabonnement_id_foreign` (`typeAbonnement_id`);

--
-- Indexes for table `biens`
--
ALTER TABLE `biens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `biens_ville_id_index` (`ville_id`),
  ADD KEY `biens_proprietaire_id_foreign` (`proprietaire_id`),
  ADD KEY `biens_typebien_id_foreign` (`typeBien_id`);

--
-- Indexes for table `contrats`
--
ALTER TABLE `contrats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contrats_typecharge_id_foreign` (`typecharge_id`),
  ADD KEY `contrats_typepaiement_id_foreign` (`typePaiement_id`),
  ADD KEY `contrats_typecontrat_id_foreign` (`typeContrat_id`),
  ADD KEY `contrats_proprietaire_id_foreign` (`proprietaire_id`),
  ADD KEY `contrats_locataire_id_foreign` (`locataire_id`),
  ADD KEY `contrats_location_id_foreign` (`location_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `finances`
--
ALTER TABLE `finances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `finances_proprietaire_id_foreign` (`proprietaire_id`),
  ADD KEY `finances_bien_id_foreign` (`bien_id`),
  ADD KEY `finances_typepaiement_id_foreign` (`typePaiement_id`),
  ADD KEY `finances_typefinance_id_foreign` (`typeFinance_id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `locations_locataire_id_foreign` (`locataire_id`),
  ADD KEY `locations_proprietaire_id_foreign` (`proprietaire_id`),
  ADD KEY `locations_contrat_id_foreign` (`contrat_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_recepteur_id_foreign` (`recepteur_id`),
  ADD KEY `messages_emetteur_id_foreign` (`emetteur_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pays`
--
ALTER TABLE `pays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `regions_pay_id_foreign` (`pay_id`);

--
-- Indexes for table `typeabonnements`
--
ALTER TABLE `typeabonnements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `typebiens`
--
ALTER TABLE `typebiens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `typecharge`
--
ALTER TABLE `typecharge`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `typecontrats`
--
ALTER TABLE `typecontrats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `typefinances`
--
ALTER TABLE `typefinances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `typepaiement`
--
ALTER TABLE `typepaiement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `typeusers`
--
ALTER TABLE `typeusers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `utilisateurs_typeuser_id_foreign` (`typeUser_id`);

--
-- Indexes for table `villes`
--
ALTER TABLE `villes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `villes_pay_id_foreign` (`pay_id`),
  ADD KEY `villes_region_id_foreign` (`region_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abonnees`
--
ALTER TABLE `abonnees`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `biens`
--
ALTER TABLE `biens`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contrats`
--
ALTER TABLE `contrats`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finances`
--
ALTER TABLE `finances`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `pays`
--
ALTER TABLE `pays`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `typeabonnements`
--
ALTER TABLE `typeabonnements`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `typebiens`
--
ALTER TABLE `typebiens`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `typecharge`
--
ALTER TABLE `typecharge`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `typecontrats`
--
ALTER TABLE `typecontrats`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `typefinances`
--
ALTER TABLE `typefinances`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `typepaiement`
--
ALTER TABLE `typepaiement`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `typeusers`
--
ALTER TABLE `typeusers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `villes`
--
ALTER TABLE `villes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `abonnees`
--
ALTER TABLE `abonnees`
  ADD CONSTRAINT `abonnees_proprietaire_id_foreign` FOREIGN KEY (`proprietaire_id`) REFERENCES `utilisateurs` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `abonnees_typeabonnement_id_foreign` FOREIGN KEY (`typeAbonnement_id`) REFERENCES `typeabonnements` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `biens`
--
ALTER TABLE `biens`
  ADD CONSTRAINT `biens_proprietaire_id_foreign` FOREIGN KEY (`proprietaire_id`) REFERENCES `utilisateurs` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `biens_typebien_id_foreign` FOREIGN KEY (`typeBien_id`) REFERENCES `typebiens` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `biens_ville_id_foreign` FOREIGN KEY (`ville_id`) REFERENCES `villes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `contrats`
--
ALTER TABLE `contrats`
  ADD CONSTRAINT `contrats_locataire_id_foreign` FOREIGN KEY (`locataire_id`) REFERENCES `utilisateurs` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `contrats_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `contrats_proprietaire_id_foreign` FOREIGN KEY (`proprietaire_id`) REFERENCES `utilisateurs` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `contrats_typecharge_id_foreign` FOREIGN KEY (`typecharge_id`) REFERENCES `typecharge` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `contrats_typecontrat_id_foreign` FOREIGN KEY (`typeContrat_id`) REFERENCES `typecontrats` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `contrats_typepaiement_id_foreign` FOREIGN KEY (`typePaiement_id`) REFERENCES `typepaiement` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `finances`
--
ALTER TABLE `finances`
  ADD CONSTRAINT `finances_bien_id_foreign` FOREIGN KEY (`bien_id`) REFERENCES `biens` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `finances_proprietaire_id_foreign` FOREIGN KEY (`proprietaire_id`) REFERENCES `utilisateurs` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `finances_typefinance_id_foreign` FOREIGN KEY (`typeFinance_id`) REFERENCES `typefinances` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `finances_typepaiement_id_foreign` FOREIGN KEY (`typePaiement_id`) REFERENCES `typepaiement` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_contrat_id_foreign` FOREIGN KEY (`contrat_id`) REFERENCES `contrats` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `locations_locataire_id_foreign` FOREIGN KEY (`locataire_id`) REFERENCES `utilisateurs` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `locations_proprietaire_id_foreign` FOREIGN KEY (`proprietaire_id`) REFERENCES `utilisateurs` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_emetteur_id_foreign` FOREIGN KEY (`emetteur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `messages_recepteur_id_foreign` FOREIGN KEY (`recepteur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `regions`
--
ALTER TABLE `regions`
  ADD CONSTRAINT `regions_pay_id_foreign` FOREIGN KEY (`pay_id`) REFERENCES `pays` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD CONSTRAINT `utilisateurs_typeuser_id_foreign` FOREIGN KEY (`typeUser_id`) REFERENCES `typeusers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `villes`
--
ALTER TABLE `villes`
  ADD CONSTRAINT `villes_pay_id_foreign` FOREIGN KEY (`pay_id`) REFERENCES `pays` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `villes_region_id_foreign` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
