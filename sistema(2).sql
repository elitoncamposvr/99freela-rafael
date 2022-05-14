-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 14-Maio-2022 às 16:50
-- Versão do servidor: 8.0.29-0ubuntu0.22.04.2
-- versão do PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sistema`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `bank_check`
--

CREATE TABLE `bank_check` (
  `id` int UNSIGNED NOT NULL,
  `name_check` varchar(100) NOT NULL,
  `issuance_date` date NOT NULL,
  `due_date` date DEFAULT NULL,
  `value_check` float NOT NULL,
  `bank` varchar(100) NOT NULL,
  `account_number` varchar(100) NOT NULL,
  `check_number` varchar(50) NOT NULL,
  `agency` varchar(50) NOT NULL,
  `in_box` int NOT NULL,
  `check_destiny` varchar(100) DEFAULT NULL,
  `deposit_date` date DEFAULT NULL,
  `regarding` varchar(50) DEFAULT NULL,
  `aditional_info` longtext,
  `id_company` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `bank_check`
--

INSERT INTO `bank_check` (`id`, `name_check`, `issuance_date`, `due_date`, `value_check`, `bank`, `account_number`, `check_number`, `agency`, `in_box`, `check_destiny`, `deposit_date`, `regarding`, `aditional_info`, `id_company`) VALUES
(5, 'JONAS BROTHER', '2021-06-30', '2021-07-10', 1000, '', '', '', '', 2, NULL, NULL, NULL, NULL, 1),
(6, 'ADOLFO PEDRO LOPES', '2021-06-27', '2021-08-15', 300, 'B. BRADESCO', '514814-6', '00001', '1653', 1, NULL, NULL, 'OS 188002', 'NÃO DEPOSITAR.', 1),
(7, 'IGOR VEREADOR', '2021-06-26', '2021-07-23', 320, 'SICREDI', '514814-6', '2222', '810', 1, NULL, NULL, NULL, NULL, 1),
(9, 'DR. FRANCISCO', '2021-06-26', '2021-07-10', 1500, 'SICREDI', '20000', '22222', '1653', 3, 'SOUZA', '2021-06-28', 'OS 188000', 'NÃO PASSAR CHEQUE', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `bank_check_issued`
--

CREATE TABLE `bank_check_issued` (
  `id` int UNSIGNED NOT NULL,
  `issued_to` varchar(100) DEFAULT NULL,
  `id_bank` int NOT NULL,
  `check_number` varchar(50) NOT NULL,
  `issuance_date` date NOT NULL,
  `due_date` date NOT NULL,
  `value_check` float NOT NULL,
  `cleared_check` int NOT NULL,
  `clearing_date` date DEFAULT NULL,
  `regarding` varchar(100) NOT NULL,
  `aditional_info` longtext,
  `id_company` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `bank_check_issued`
--

INSERT INTO `bank_check_issued` (`id`, `issued_to`, `id_bank`, `check_number`, `issuance_date`, `due_date`, `value_check`, `cleared_check`, `clearing_date`, `regarding`, `aditional_info`, `id_company`) VALUES
(1, 'SOUZA', 3, '150', '2021-06-10', '2021-07-02', 300, 2, NULL, 'COMPRA', 'ENTREGUE A BRUNO', 1),
(4, 'RETIFICA DIEGO E SÓCIO', 3, '0001', '2021-06-20', '2021-07-15', 1500, 2, '2021-08-30', 'PAGTO NOTAS', 'ENTREGUE AO SÓCIO', 1),
(5, 'COMERCIAL PEÇAS VILA RICA', 2, '1520', '2021-06-28', '2021-07-10', 175, 1, NULL, 'PAGTO NOTAS', '', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `clients`
--

CREATE TABLE `clients` (
  `id` int UNSIGNED NOT NULL,
  `id_company` int NOT NULL,
  `client_type` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `cellphone` varchar(50) DEFAULT NULL,
  `whatsapp` varchar(50) DEFAULT NULL,
  `cpf` varchar(50) DEFAULT NULL,
  `cnpj` varchar(50) DEFAULT NULL,
  `state_registration` varchar(50) DEFAULT NULL,
  `identity` varchar(50) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `limit_credit` float DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `address_number` varchar(50) DEFAULT NULL,
  `address_neighb` varchar(50) DEFAULT NULL,
  `address_city` varchar(100) DEFAULT NULL,
  `address_state` varchar(50) DEFAULT NULL,
  `address_zipcode` varchar(50) DEFAULT NULL,
  `aditional_info` longtext,
  `date_register` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `clients`
--

INSERT INTO `clients` (`id`, `id_company`, `client_type`, `name`, `email`, `phone`, `cellphone`, `whatsapp`, `cpf`, `cnpj`, `state_registration`, `identity`, `birth_date`, `limit_credit`, `address`, `address2`, `address_number`, `address_neighb`, `address_city`, `address_state`, `address_zipcode`, `aditional_info`, `date_register`) VALUES
(76, 1, 1, 'ELITON CAMPOS SILVA', 'eliton.pecas@gmail.com', '(66)3554-1528', '(66)98406-8805', '(66)98406-8805', '030.887.331-92', '', '', '19317999 SSP/MT', '0001-11-30', 5000, 'AV. SABÍAS', '', '415', 'CIDADE JARDIM', 'Vila Rica', 'MT', '78.645-000', '', '0000-00-00'),
(77, 1, 2, 'JULIO ALVES BORGES EIRELLI', 'automecanicaborges@gmail.com', '(66)3554-1528', '', '(66)35541-528', '', '13.694.527/0001-05', '', '', '0001-11-30', 10000, 'RUA DAS ACACIAS', '', '308', 'CIDADE JARDIM', 'Vila Rica', 'MT', '78.645-000', '', '0000-00-00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `companies`
--

CREATE TABLE `companies` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `social_reason` varchar(100) DEFAULT NULL,
  `cnpj` varchar(100) DEFAULT NULL,
  `state_registration` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `site` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `address_number` varchar(50) DEFAULT NULL,
  `address_neighb` varchar(50) DEFAULT NULL,
  `address_city` varchar(50) DEFAULT NULL,
  `address_state` varchar(50) DEFAULT NULL,
  `address_country` varchar(50) DEFAULT NULL,
  `address_zipcode` varchar(50) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `companies`
--

INSERT INTO `companies` (`id`, `name`, `social_reason`, `cnpj`, `state_registration`, `email`, `site`, `phone`, `address`, `address2`, `address_number`, `address_neighb`, `address_city`, `address_state`, `address_country`, `address_zipcode`, `logo`) VALUES
(1, 'Auto Mecanica Borges', 'JULIO ALVES BORGES EIRELLI', '13.694.527/0001-05', '134152655', 'automecanicaborges@gmail.com', 'https://borgesautocenter.com.br', '(66) 3554-1528', 'Rua das Acacias', '', '78.645-000', 'Cidade Jardim', 'Vila Rica', 'MT', 'Brasil', '78.645-000', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `employee`
--

CREATE TABLE `employee` (
  `id` int UNSIGNED NOT NULL,
  `name_employee` varchar(100) NOT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `cellphone` varchar(50) DEFAULT NULL,
  `mother_name` varchar(100) DEFAULT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `marital_status` varchar(50) DEFAULT NULL,
  `cpf` varchar(50) DEFAULT NULL,
  `identity` varchar(50) DEFAULT NULL,
  `ctps` varchar(50) DEFAULT NULL,
  `occupation` varchar(50) DEFAULT NULL,
  `admission_date` date DEFAULT NULL,
  `wage` float DEFAULT NULL,
  `bank` varchar(50) DEFAULT NULL,
  `agency` varchar(50) DEFAULT NULL,
  `bank_account` varchar(50) DEFAULT NULL,
  `pix_key` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `address_number` varchar(50) DEFAULT NULL,
  `address_neighb` varchar(50) DEFAULT NULL,
  `address_city` varchar(50) DEFAULT NULL,
  `address_state` varchar(50) DEFAULT NULL,
  `address_zipcode` varchar(50) DEFAULT NULL,
  `aditional_info` longtext,
  `status` int DEFAULT NULL,
  `id_company` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `employee`
--

INSERT INTO `employee` (`id`, `name_employee`, `nickname`, `phone`, `cellphone`, `mother_name`, `father_name`, `birth_date`, `marital_status`, `cpf`, `identity`, `ctps`, `occupation`, `admission_date`, `wage`, `bank`, `agency`, `bank_account`, `pix_key`, `address`, `address2`, `address_number`, `address_neighb`, `address_city`, `address_state`, `address_zipcode`, `aditional_info`, `status`, `id_company`) VALUES
(31, 'JULIO ALVES BORGES', 'BORGES', '', '', '', '', '1970-01-01', 'nao_informado', '', '', '', '', '1970-01-01', 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 1),
(33, 'LUAN ALVES DOS SANTOS', 'LUAN', '', '', '', '', '1970-01-01', 'nao_informado', '', '', '', '', '1970-01-01', 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 1),
(35, 'JOSENILTON JIEMBA', 'GAUCHAO', '', '', '', '', '1970-01-01', 'nao_informado', '', '', '', '', '1970-01-01', 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 1),
(36, 'FERNANDO JOSE SERAFIM', 'GUGA', '', '', '', '', '1970-01-01', 'nao_informado', '', '', '', '', '1970-01-01', 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 1),
(77, 'ELITON CAMPOS SILVA', 'ELITIN', '(66)3554-1528', '(66)98406-8805', 'DILMA MARIA CAMPOS', 'EDSON MANOEL DA SILVA', '1988-08-11', 'solteiro', '030.887.331-92', '19317999 SSP/MT', '300000', 'GERENTE', '2012-08-03', 1650, 'BRADESCO', '1653', '514814-6', '66984068805', 'AV. SABIÁS', 'CASA MURADA', '415', 'CENTRO', 'VILA RICA', 'MT', '78.645-000', '', 0, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `equipment_brand`
--

CREATE TABLE `equipment_brand` (
  `id` int UNSIGNED NOT NULL,
  `name_brand` varchar(100) NOT NULL,
  `id_company` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `equipment_brand`
--

INSERT INTO `equipment_brand` (`id`, `name_brand`, `id_company`) VALUES
(2, 'GM/Chevrolet', '1'),
(3, 'Fiat', '1'),
(4, 'VW/Volkswagen', '1'),
(5, 'Ford', '1'),
(6, 'Toyota', '1'),
(7, 'suzuki', '1'),
(8, 'mitsubishi', '1'),
(9, 'JAC', '1'),
(10, 'BMW', '1'),
(11, 'VOLVO', '1'),
(12, 'HONDA', '1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `equipment_model`
--

CREATE TABLE `equipment_model` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `id_brand` int NOT NULL DEFAULT '0',
  `id_company` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `equipment_model`
--

INSERT INTO `equipment_model` (`id`, `name`, `id_brand`, `id_company`) VALUES
(1, 'Uno', 3, 1),
(3, 'Strada', 3, 1),
(4, 'Gol', 4, 1),
(5, 'Corsa', 2, 1),
(7, 'Fiesta', 5, 1),
(8, 'Ka', 5, 1),
(9, 'Hilux', 6, 1),
(10, 'PALIO', 3, 1),
(11, 'PUNTO', 3, 1),
(12, 'BRAVO', 3, 1),
(14, 'CRUZE', 2, 1),
(15, 'L200 TRITON', 8, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `fn_accounts_payable`
--

CREATE TABLE `fn_accounts_payable` (
  `id` int UNSIGNED NOT NULL,
  `description` varchar(255) NOT NULL,
  `bill_amount` float NOT NULL,
  `account_category` varchar(100) NOT NULL DEFAULT '0',
  `release_date_of` date NOT NULL,
  `due_date` date NOT NULL,
  `supplier` int DEFAULT NULL,
  `doc_number` varchar(50) DEFAULT NULL,
  `id_transaction` int DEFAULT NULL,
  `aditional_info` longtext,
  `id_company` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fn_accounts_receivable`
--

CREATE TABLE `fn_accounts_receivable` (
  `id` int UNSIGNED NOT NULL,
  `description` varchar(100) NOT NULL,
  `bill_amount` float DEFAULT NULL,
  `account_category` varchar(50) DEFAULT NULL,
  `release_date_of` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `client_name` int DEFAULT NULL,
  `doc_number` varchar(50) DEFAULT NULL,
  `id_transaction` varchar(100) NOT NULL,
  `aditional_info` longtext,
  `id_company` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `fn_accounts_receivable`
--

INSERT INTO `fn_accounts_receivable` (`id`, `description`, `bill_amount`, `account_category`, `release_date_of`, `due_date`, `client_name`, `doc_number`, `id_transaction`, `aditional_info`, `id_company`) VALUES
(1, 'BOLETO-ELITON CAMPOS SILVA', 150, '1', '2021-11-23', '2021-12-26', 77, '76', '', NULL, 1),
(2, 'NOTA - AUTO ESCOLA VILA RICA', 150, '0', '2021-12-26', '2022-01-01', 76, 'OS189900', '', 'TESTE', 1),
(4, 'NOTA - ANGROPECUARIA ANGICO EIRELLI', 1200, 'Vendas', '2021-12-20', '2022-01-30', 76, '189902', '', 'TESTE DE EDIÇÃO 4', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `fn_accounts_received`
--

CREATE TABLE `fn_accounts_received` (
  `id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fn_accounts_received_payment`
--

CREATE TABLE `fn_accounts_received_payment` (
  `id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fn_carrier`
--

CREATE TABLE `fn_carrier` (
  `id` int UNSIGNED NOT NULL,
  `carrier_title` varchar(50) NOT NULL DEFAULT '0',
  `id_company` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `fn_carrier`
--

INSERT INTO `fn_carrier` (`id`, `carrier_title`, `id_company`) VALUES
(2, 'CAIXA', 1),
(3, 'GERENCIANET', 1),
(4, 'BANCO DO BRASIL', 1),
(5, 'BRADESCO', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `fn_paid_bills`
--

CREATE TABLE `fn_paid_bills` (
  `id` int UNSIGNED NOT NULL,
  `description` varchar(100) NOT NULL,
  `bill_amount` float NOT NULL,
  `amount_paid` float NOT NULL,
  `account_category` varchar(50) DEFAULT NULL,
  `release_date_of` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `payday` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier` int DEFAULT NULL,
  `doc_number` varchar(50) DEFAULT NULL,
  `id_transaction` int DEFAULT NULL,
  `carrier` int DEFAULT NULL,
  `aditional_info` longtext,
  `id_company` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `fn_paid_bills`
--

INSERT INTO `fn_paid_bills` (`id`, `description`, `bill_amount`, `amount_paid`, `account_category`, `release_date_of`, `due_date`, `payday`, `supplier`, `doc_number`, `id_transaction`, `carrier`, `aditional_info`, `id_company`) VALUES
(80, 'PARCELA LOTE', 185, 185, 'Compras', '2021-12-26', '2021-12-10', '2022-01-30 13:59:03', 19, '00053132', NULL, 4, 'TESTE', 1),
(81, 'BOLETO SK', 550, 550, 'Boletos', '2022-03-22', '2022-03-22', '2022-03-22 00:39:25', 16, '', NULL, 4, '', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `fn_settings`
--

CREATE TABLE `fn_settings` (
  `id` int UNSIGNED NOT NULL,
  `interest_day` float NOT NULL,
  `id_company` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `fn_settings`
--

INSERT INTO `fn_settings` (`id`, `interest_day`, `id_company`) VALUES
(1, 0.33, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `functional_occurrence`
--

CREATE TABLE `functional_occurrence` (
  `id` int UNSIGNED NOT NULL,
  `id_employee` int UNSIGNED NOT NULL,
  `date_occurrence` date DEFAULT NULL,
  `type_occurrence` int DEFAULT NULL,
  `absense_period` float DEFAULT NULL,
  `aditional_info` longtext,
  `id_company` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `functional_occurrence`
--

INSERT INTO `functional_occurrence` (`id`, `id_employee`, `date_occurrence`, `type_occurrence`, `absense_period`, `aditional_info`, `id_company`) VALUES
(9, 33, '2021-06-01', 2, 7, '', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `inventory`
--

CREATE TABLE `inventory` (
  `id` int UNSIGNED NOT NULL,
  `name_product` varchar(100) NOT NULL,
  `product_code` varchar(50) NOT NULL,
  `original_code` varchar(50) DEFAULT NULL,
  `id_brand` int NOT NULL,
  `id_provider` int NOT NULL,
  `purchase_price` float DEFAULT '0',
  `profit` float DEFAULT '0',
  `price` float DEFAULT '0',
  `min_price` float DEFAULT '0',
  `quant` float DEFAULT '0',
  `ideal_quant` float DEFAULT '0',
  `min_quant` float DEFAULT '0',
  `location` varchar(50) DEFAULT '0',
  `drawer` varchar(50) DEFAULT '0',
  `bar_code` varchar(50) DEFAULT NULL,
  `product_info` longtext,
  `unity` varchar(50) DEFAULT NULL,
  `id_company` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `inventory`
--

INSERT INTO `inventory` (`id`, `name_product`, `product_code`, `original_code`, `id_brand`, `id_provider`, `purchase_price`, `profit`, `price`, `min_price`, `quant`, `ideal_quant`, `min_quant`, `location`, `drawer`, `bar_code`, `product_info`, `unity`, `id_company`) VALUES
(11, 'BATERIA 60AMP', 'HGR60DD', '', 18, 19, 321, 3.24, 425, 430, 0, 8, 3, 'EXPOSITOR', '', '', '', 'UN', 1),
(23, 'BUCHA BAND PALIO/STRADA 02/', '011.1038', '51715790', 1, 0, 15, 50, 30, 25, -16, 8, 4, 'estoque', 'b14-c3', '79552646546', 'SUSPENSÃO DIANTEIRA\r\n(FIAT) ARGO 17>\r\n(FIAT) CRONOS 18>\r\n(FIAT) DOBLO 02>\r\n(FIAT) FIORINO NOVO 14>\r\n(FIAT) GRAND SIENA 12>\r\n(FIAT) MOBI 16>\r\n(FIAT) PALIO 96>\r\n(FIAT) [FIRE)PALIO 01/05\r\n(FIAT) PALIO WEEKEND 97>\r\n(FIAT) [FIRE] PALIO WEEKEND 01>\r\n(FIAT) PALIO ATTRACTIVE 12>\r\n(FIAT) SIENA 96>\r\n(FIAT) [FIRE] SIENA 01/05\r\n(FIAT) STRADA 96/01\r\n(FIAT) [FIRE] STRADA 01/05\r\n(FIAT) UNO VIVACE 11>', 'UN', 1),
(24, 'tambor freio l200 triton 07/16 bd7020', 'bd7020', 'MN102439', 20, 0, 116, 89, 220, 174, -3, 4, 2, 'estoque', 'a7', '', 'L200 TRITON HPE 3.2 16V DIESEL PICKUP (2008 - 2016)\r\nL200 TRITON HPE 3.5 24V FLEX PICKUP (2008 - 2016)\r\nL200 TRITON GLS CD 3.2 16V DIESEL PICKUP (2012 - 2016)\r\nL200 TRITON GLX CD 3.2 16V DIESEL PICKUP (2012 - 2016)\r\nL200 TRITON SAVANA CD 3.2 16V DIESEL PICKUP (2013 - 2016)\r\nL200 TRITON HLS CD 2.4 16V FLEX PICKUP (2013 - 2016)', 'UN', 1),
(25, 'tambor freio l200 triton 07/16', 'hf202c', 'MN102439', 20, 7, 100, 100, 200, 150, -3, 4, 2, 'estoque', 'a7', '', '', 'UN', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `inventory_history`
--

CREATE TABLE `inventory_history` (
  `id` int UNSIGNED NOT NULL,
  `id_product` int NOT NULL,
  `id_user` int NOT NULL,
  `action` varchar(50) NOT NULL,
  `date_action` date NOT NULL,
  `id_company` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `inventory_history`
--

INSERT INTO `inventory_history` (`id`, `id_product`, `id_user`, `action`, `date_action`, `id_company`) VALUES
(4, 8, 1, 'add', '2020-02-16', 1),
(5, 8, 1, 'edt', '2020-02-16', 1),
(6, 8, 1, 'edt', '2020-02-16', 1),
(7, 8, 1, 'edt', '2020-02-16', 1),
(8, 8, 1, 'edt', '2020-02-16', 1),
(9, 8, 1, 'edt', '2020-02-16', 1),
(10, 9, 1, 'add', '2020-02-16', 1),
(11, 9, 1, 'del', '2020-02-16', 1),
(12, 10, 1, 'add', '2020-02-18', 1),
(13, 8, 1, 'dwn', '2020-02-18', 1),
(14, 10, 1, 'dwn', '2020-02-18', 1),
(15, 8, 1, 'dwn', '2020-02-19', 1),
(16, 8, 1, 'dwn', '2020-02-20', 1),
(17, 8, 1, 'dwn', '2020-02-25', 1),
(18, 10, 1, 'dwn', '2020-02-25', 1),
(19, 8, 1, 'dwn', '2020-02-25', 1),
(20, 8, 1, 'dwn', '2020-02-25', 1),
(21, 8, 1, 'dwn', '2020-02-25', 1),
(22, 10, 1, 'dwn', '2020-02-25', 1),
(23, 8, 1, 'dwn', '2020-02-25', 1),
(24, 8, 1, 'dwn', '2020-02-27', 1),
(25, 10, 1, 'dwn', '2020-02-27', 1),
(26, 11, 1, 'add', '2020-05-09', 1),
(27, 11, 1, 'edt', '2020-05-09', 1),
(28, 12, 1, 'add', '2020-05-09', 1),
(29, 12, 1, 'edt', '2020-05-09', 1),
(30, 12, 1, 'edt', '2020-05-09', 1),
(31, 11, 1, 'dwn', '2020-05-10', 1),
(32, 12, 1, 'dwn', '2020-05-10', 1),
(33, 12, 1, 'dwn', '2020-05-10', 1),
(34, 11, 1, 'dwn', '2020-05-10', 1),
(35, 11, 1, 'dwn', '2020-05-10', 1),
(36, 12, 1, 'dwn', '2020-05-10', 1),
(37, 12, 1, 'dwn', '2020-05-10', 1),
(38, 8, 1, 'dwn', '2020-06-20', 1),
(39, 10, 1, 'dwn', '2020-06-20', 1),
(40, 8, 1, 'del', '2021-01-02', 1),
(41, 10, 1, 'edt', '2021-01-02', 1),
(42, 10, 1, 'edt', '2021-01-02', 1),
(43, 0, 1, 'add', '2021-01-09', 1),
(44, 13, 1, 'add', '2021-01-09', 1),
(45, 13, 1, 'del', '2021-01-09', 1),
(46, 0, 1, 'add', '2021-01-09', 1),
(47, 14, 1, 'add', '2021-01-09', 1),
(48, 14, 1, 'del', '2021-01-09', 1),
(49, 0, 1, 'add', '2021-01-09', 1),
(50, 15, 1, 'add', '2021-01-09', 1),
(51, 15, 1, 'del', '2021-01-09', 1),
(52, 16, 1, 'add', '2021-01-09', 1),
(53, 16, 1, 'del', '2021-01-09', 1),
(54, 17, 1, 'add', '2021-01-09', 1),
(55, 17, 1, 'del', '2021-01-10', 1),
(56, 18, 1, 'add', '2021-01-10', 1),
(57, 19, 1, 'add', '2021-01-10', 1),
(58, 20, 1, 'add', '2021-01-10', 1),
(59, 19, 1, 'del', '2021-01-10', 1),
(60, 20, 1, 'del', '2021-01-10', 1),
(61, 21, 1, 'add', '2021-01-10', 1),
(62, 21, 1, 'del', '2021-01-10', 1),
(63, 22, 1, 'add', '2021-01-10', 1),
(64, 22, 1, 'del', '2021-01-10', 1),
(65, 0, 1, 'add', '2021-01-10', 1),
(66, 23, 1, 'add', '2021-01-10', 1),
(67, 24, 1, 'add', '2021-01-23', 1),
(68, 25, 1, 'add', '2021-01-23', 1),
(69, 26, 1, 'add', '2021-01-24', 1),
(70, 26, 1, 'edt', '2021-01-25', 1),
(71, 27, 1, 'add', '2021-04-03', 1),
(72, 27, 1, 'edt', '2021-04-03', 1),
(73, 27, 1, 'edt', '2021-04-03', 1),
(74, 27, 1, 'edt', '2021-04-03', 1),
(75, 27, 1, 'edt', '2021-04-03', 1),
(76, 11, 1, 'edt', '2021-05-01', 1),
(77, 10, 1, 'del', '2021-05-01', 1),
(78, 11, 1, 'edt', '2021-05-27', 1),
(79, 12, 1, 'del', '2021-05-27', 1),
(80, 27, 1, 'del', '2021-05-27', 1),
(81, 26, 1, 'edt', '2021-05-30', 1),
(82, 11, 1, 'edt', '2021-06-03', 1),
(83, 11, 1, 'edt', '2021-06-03', 1),
(84, 11, 1, 'edt', '2021-06-03', 1),
(85, 11, 1, 'edt', '2021-06-03', 1),
(86, 11, 1, 'edt', '2021-06-03', 1),
(87, 11, 1, 'edt', '2021-06-03', 1),
(88, 11, 1, 'edt', '2021-06-07', 1),
(89, 11, 1, 'edt', '2021-06-07', 1),
(90, 11, 1, 'edt', '2021-06-07', 1),
(91, 11, 1, 'edt', '2021-06-07', 1),
(92, 11, 1, 'edt', '2021-06-07', 1),
(93, 11, 1, 'edt', '2021-06-07', 1),
(94, 11, 1, 'edt', '2021-06-07', 1),
(95, 11, 1, 'edt', '2021-06-07', 1),
(96, 11, 1, 'edt', '2021-12-24', 1),
(97, 11, 1, 'edt', '2021-12-24', 1),
(98, 26, 1, 'del', '2022-01-07', 1),
(99, 23, 1, 'dwn', '2022-01-09', 1),
(100, 24, 1, 'dwn', '2022-01-09', 1),
(101, 11, 1, 'dwn', '2022-01-09', 1),
(102, 23, 1, 'dwn', '2022-01-09', 1),
(103, 25, 1, 'dwn', '2022-01-09', 1),
(104, 11, 1, 'dwn', '2022-01-09', 1),
(105, 23, 1, 'dwn', '2022-02-13', 1),
(106, 23, 1, 'dwn', '2022-02-13', 1),
(107, 23, 1, 'dwn', '2022-02-13', 1),
(108, 24, 1, 'dwn', '2022-02-13', 1),
(109, 23, 1, 'dwn', '2022-02-13', 1),
(110, 24, 1, 'dwn', '2022-03-20', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int UNSIGNED NOT NULL,
  `method` varchar(50) NOT NULL,
  `type_method` int NOT NULL,
  `id_company` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `method`, `type_method`, `id_company`) VALUES
(3, 'Cheque a  vista', 1, 1),
(4, 'Cheque Pré', 2, 1),
(5, 'Dinheiro', 1, 1),
(7, 'Cartão Crédito', 2, 1),
(8, 'GARANTIA', 1, 1),
(9, 'PIX', 1, 1),
(10, 'BOLETO', 2, 1),
(11, 'FATURA', 2, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `permission_groups`
--

CREATE TABLE `permission_groups` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `params` varchar(255) NOT NULL DEFAULT '0',
  `id_company` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `permission_groups`
--

INSERT INTO `permission_groups` (`id`, `name`, `params`, `id_company`) VALUES
(1, 'MASTER', '47,61,53,29,30,10,9,51,16,25,31,32,28,11,12,13,19,23,59,22,34,33,48,37,38,20,24,21,27,49,2,40,42,57,56,55,18,1,35,36,58,45,54,8,39,43,44,14,15', 1),
(8, 'Teste 03', '1,2,8,9,10,11,12,13,14,15,16,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `permission_params`
--

CREATE TABLE `permission_params` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `permission_title` varchar(100) NOT NULL,
  `id_company` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `permission_params`
--

INSERT INTO `permission_params` (`id`, `name`, `permission_title`, `id_company`) VALUES
(1, 'logout', 'Sair', 1),
(2, 'permissions_view', 'PermissÃ£o', 1),
(8, 'users_view', 'UsuÃ¡rios', 1),
(9, 'clients_view', 'Clientes', 1),
(10, 'clients_edit', 'Cliente Editar', 1),
(11, 'inventory_view', 'Estoque', 1),
(12, 'inventory_add', 'Estoque Adicionar', 1),
(13, 'inventory_edit', 'Estoque Editar', 1),
(14, 'sales_view', 'Vendas', 1),
(15, 'sales_edit', 'Vendas Editar', 1),
(16, 'purchases_view', 'Compras', 1),
(18, 'report_view', 'RelatÃ³rios', 1),
(19, 'financial_view', 'Financeiro', 1),
(20, 'order_service_view', 'Ordem de ServiÃ§o', 1),
(21, 'order_service_edit', 'Ordem de ServiÃ§o Editar', 1),
(22, 'financial_edit', 'Financeiro Editar', 1),
(23, 'financial_add', 'Financeiro Adicionar', 1),
(24, 'order_service_add', 'Ordem de ServiÃ§o Adicionar', 1),
(25, 'settings', 'ConfiguraÃ§Ã£o', 1),
(27, 'payment_methods', 'Pagamentos MÃ©todos', 1),
(28, 'equipments', 'Equipamentos', 1),
(29, 'bank_check_view', 'Cheque BancÃ¡rio', 1),
(30, 'bank_check_edit', 'Cheque BancÃ¡rio Editar', 1),
(31, 'companies_view', 'Empresa', 1),
(32, 'companies_edit', 'Empresa Editar', 1),
(33, 'provider_view', 'Fornecedores', 1),
(34, 'taxinvoices_view', 'Fiscal', 1),
(35, 'services_view', 'ServiÃ§os', 1),
(36, 'services_edit', 'ServiÃ§os Editar', 1),
(37, 'budget_view', 'OrÃ§amentos', 1),
(38, 'budget_edit', 'OrÃ§amentos Editar', 1),
(39, 'utilitaries', 'UtilitÃ¡rios', 1),
(40, 'singlereceipt_view', 'Recibo Avulso', 1),
(42, 'singlereceipt_edit', 'Recibo Avulso Editar', 1),
(43, 'worthemployee_view', 'Vale de FuncionÃ¡rio', 1),
(44, 'worthemployee_edit', 'Vale de FuncionÃ¡rio - Editar', 1),
(45, 'shipping_company_view', 'Transportadoras', 1),
(47, 'schedule', 'AGENDAMENTO', 1),
(48, 'provider_add', 'fornecedores adicionar', 1),
(49, 'provider_edit', 'PERMISSÃO EDITAR', 1),
(51, 'clients_extract', 'CLIENTES EXTRATO', 1),
(53, 'registrations', 'Cadastros', 1),
(54, 'shipping_company_add', 'Transportadoras Adicionar', 1),
(55, 'human_resources_edit', 'recursos humanos editar', 1),
(56, 'human_resources_delete', 'recursos humanos deletar', 1),
(57, 'human_resources_view', 'recursos humanos', 1),
(58, 'shipping_company_edit', 'TRANSPORTADORA EDITAR', 1),
(59, 'financial_settings', 'FINANCEIRO CONFIGURAÇÃO', 1),
(61, 'schedule_edit', 'AGENDAMENTO EDIÇÃO', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `products`
--

CREATE TABLE `products` (
  `id` int UNSIGNED NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `aditional_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `id_company` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `products`
--

INSERT INTO `products` (`id`, `product_name`, `aditional_info`, `id_company`) VALUES
(43, 'pRODUTO', '', 1),
(44, 'Teste', '', 1),
(45, 'testadfsa', '', 1),
(46, 'TEstnaodlkçjjsdf', '', 1),
(47, 'sdfasdf', '', 1),
(48, 'sadfsadfa', '', 1),
(49, 'sdfsdf', '', 1),
(50, 'dsfasdaf', '', 1),
(51, 'sdafsdafsadf', '', 1),
(52, 'sadfsaf', 'safdsadf', 1),
(53, 'dsafsadf', '', 1),
(54, 'SDAFSADF', '', 1),
(55, 'FSDAFSAD', '', 1),
(56, 'SDAFSADF', '', 1),
(57, 'DFSAFASDF', '', 1),
(58, 'sadfsadf', '', 1),
(59, 'sdafsdf', '', 1),
(60, 'sdafsadf', '', 1),
(61, 'sdfasdf', '', 1),
(62, 'sdafasdf', '', 1),
(63, 'sadfsadf', 'sdafsa', 1),
(64, 'safsadf', '', 1),
(65, 'sadfsafd', '', 1),
(66, 'sadfsdafsd', 'sdfsd', 1),
(67, 'dsafsdaf', '', 1),
(68, 'safsadf', '', 1),
(69, 'SADFSADF', '', 1),
(70, 'asdfasdf', '', 1),
(71, 'sdafsda', '', 1),
(72, 'teste', '', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `products_img`
--

CREATE TABLE `products_img` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int NOT NULL,
  `img_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `products_img`
--

INSERT INTO `products_img` (`id`, `product_id`, `img_name`) VALUES
(8, 23, 'Imagem'),
(9, 24, ''),
(10, 25, 'Captura de tela de 2022-05-12 16-28-32.png'),
(11, 26, 'logo.png'),
(12, 27, 'modelo-de-logomarca-simbolo-apple.png'),
(13, 28, 'Captura de tela de 2022-05-12 16-29-12.png'),
(14, 29, 'Captura de tela de 2022-05-12 16-29-12.png'),
(15, 30, 'Captura de tela de 2022-05-12 16-29-12.png');

-- --------------------------------------------------------

--
-- Estrutura da tabela `product_brand`
--

CREATE TABLE `product_brand` (
  `id` int UNSIGNED NOT NULL,
  `name_product` varchar(100) NOT NULL,
  `id_company` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `product_brand`
--

INSERT INTO `product_brand` (`id`, `name_product`, `id_company`) VALUES
(1, 'MONROE/AXIOS', 1),
(3, 'COFAP/MAGNETI MARELLI', 1),
(4, 'NTK/NGK', 1),
(5, 'FAG', 1),
(6, 'INA', 1),
(7, 'SKF', 1),
(8, 'SACHS', 1),
(9, 'LUK REPSET', 1),
(10, 'KAYABA', 1),
(11, 'SAMPEL', 1),
(12, 'NAKATA', 1),
(13, 'TRW/VARGA', 1),
(14, 'FRAS-LE', 1),
(15, 'LONAFLEX', 1),
(16, 'BOSCH', 1),
(17, 'IMPORT', 1),
(18, 'HELIAR', 1),
(19, 'HIPPER FREIOS', 1),
(20, 'FREMAX', 1),
(21, 'DAYCO', 1),
(22, 'CONTINENTAL', 1),
(23, 'CONTITECH', 1),
(24, 'GATES', 1),
(25, 'KOYO', 1),
(26, 'SABO', 1),
(27, 'ORBI QUIMICA', 1),
(28, 'VISCONDE', 1),
(29, 'VALEO', 1),
(30, 'AUTHOMIX', 1),
(31, 'PARAFLU', 1),
(32, 'tecfil', 1),
(33, 'EATON', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `provider`
--

CREATE TABLE `provider` (
  `id` int UNSIGNED NOT NULL,
  `name_provider` varchar(100) NOT NULL,
  `social_reason` varchar(100) NOT NULL,
  `cnpj` varchar(50) NOT NULL,
  `state_registration` varchar(50) NOT NULL,
  `contact_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `site` varchar(100) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `address2` varchar(100) NOT NULL,
  `address_number` varchar(50) NOT NULL,
  `address_neighb` varchar(50) NOT NULL,
  `address_city` varchar(100) NOT NULL,
  `address_state` varchar(50) NOT NULL,
  `address_zipcode` varchar(50) NOT NULL,
  `aditional_info` longtext NOT NULL,
  `id_company` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `provider`
--

INSERT INTO `provider` (`id`, `name_provider`, `social_reason`, `cnpj`, `state_registration`, `contact_name`, `email`, `site`, `phone`, `address`, `address2`, `address_number`, `address_neighb`, `address_city`, `address_state`, `address_zipcode`, `aditional_info`, `id_company`) VALUES
(11, 'JAVALI AUTO PEÇAS', 'FORTBRAS AUTOPEÇAS S.A.', '22.761.584/0004-01', '137078609', 'DELCIO', '', '', '(65)3363-6300', 'Rua Irmã Elvira Paris', '', '35', 'Dom Aquino', 'Cuiabá', 'MT', '78.015-170', '', 1),
(12, 'REAL MOTO PEÇAS', 'REAL MOTO PEÇAS LTDA', '25.630.302/0026-22', '138274754', 'CLAUDIO', '', '', '', 'Rua Bianco Filho', '', '103', 'Boa Esperança', 'Cuiabá', 'MT', '78.068-700', '', 1),
(13, 'PELLEGRINO', 'PELLEGRINO DISTRIBUIDORA DE AUTOPECAS LTDA', '42.580.092/0010-67', '131991094', 'JAMAR', '', '', '(65)3051-6000', 'Avenida Manoel José de Arruda', '', '1476', 'Praeiro', 'Cuiabá', 'MT', '78.070-500', '', 1),
(14, 'COBRA', 'COBRA ROLAMENTOS E AUTOPECAS LTDA', '58.248.352/0016-27', '132593297', 'DANILO', '', '', '(65)3616-3300', 'Rua Barão de Melgaço', '', '1633', 'Porto', 'Cuiabá', 'MT', '78.025-300', '', 1),
(15, 'MILLANO', 'MILLANO DISTRIBUIDORA DE AUTO PECAS LTDA', '26.770.818/0001-87', '131259431', 'VICTOR', '', '', '(65)3688-1888', 'Avenida da FEB', '', '2280', 'Ponte Nova', 'Várzea Grande', 'MT', '78.115-865', '', 1),
(16, 'SK', 'SK AUTOMOTIVE DISTRIBUIDORA DE AUTOPECAS LTDA', '08.237.002/0011-82', '133422666', 'ANDERSON', '', '', '(65)3616-6500', 'Avenida Manoel José de Arruda', '', '630', 'Jardim Califórnia', 'Cuiabá', 'MT', '78.070-305', '', 1),
(17, 'ROLES', 'CAR-CENTRAL DE AUTOPECAS E ROLAMENTOS LTDA', '62.395.546/0022-70', '132712806', 'WANDERSON', '', '', '(65)2123-6100', 'Avenida Miguel Sutil', '', '5598', 'Bosque da Saúde', 'Cuiabá', 'MT', '78.050-005', '', 1),
(18, 'T-PARTS', 'T-PARTS COMERCIAL E IMPORTADORA DE AUTO PECAS LTDA', '00.262.985/0003-95', '133019438', 'PEDRO', '', '', '(65)3925-1230', 'Avenida da FEB', '', '1037A', 'Ponte Nova', 'Várzea Grande', 'MT', '78.115-806', '', 1),
(19, 'CLAUDIO', 'CLAUDIO AUTOPECAS LTDA', '01.624.149/0013-48', '138269165', 'JEFERSON/EDUARDO', '', '', '(66)3554-2000', 'ROD. BR158', '', 'SN', 'INCONFIDENTES', 'Vila Rica', 'MT', '78.645-000', '', 1),
(20, 'KARANGAO', 'MARAJO COMERCIO DE AUTO PECAS LTDA EPP', '21.582.601/0003-91', '136993192', 'RAFAEL', '', '', '(65)3054-5313', 'Avenida Tenente-Coronel Duarte', '', '1977', 'DOM AQUINO', 'Cuiabá', 'MT', '78.020-450', '', 1),
(21, 'FIAT DOMANI', 'DOMANI DISTRIBUIDORA DE VEICULOS LTDA', '01.016.616/0001-13', '131662600', 'PAULINO', '', '', '(65)3388-4400', 'AV. DA FEB', '', '2255', 'MANGA', 'VARZEA GRANDE', 'MT', '78.115-805', '', 1),
(22, 'LUBRIFIC', 'SOUSA COMERCIO DE PRODUTOS AUTOMOTIVOS LTDA - FILIAL', '08.296.100/0002-08', '135697425', 'MARIO', '', '', '(65)3365-4300', 'Rua dos Curiós', '', '134', 'Parque Ohara', 'Cuiabá', 'MT', '78.080-480', '', 1),
(23, 'VESPOR', 'VESPOR AUTOMOTIVE DISTRIBUIDORA DE AUTO PECAS LTDA', '04.771.370/0001-83', '132058685', 'LEONARDO', '', '', '(65)2121-3400', 'Avenida Fernando Correa da Costa', '', '5274A', 'Vista Alegre', 'Cuiabá', 'MT', '78.085-700', '', 1),
(24, 'MIX', 'MIX COMPONENTES AUTOMOTIVOS LTDA - MT', '02.346.950/0003-60', '135221722', 'DUCLENIO', '', '', '(62)3575-3232', 'RUA MATO GROSSO', '', '734', 'CENTRO', 'BARRA DO GARÇAS', 'MT', '78.600-000', '', 1),
(25, 'ATLANTA', 'ATLANTA DISTRIBUIDORA DE PECAS LTDA', '02.131.333/0001-85', '102977577', 'MARCIO/HENRIQUE', '', '', '(62)3230-7000', 'Avenida Anhangüera', '', '8554', 'Setor Campinas', 'Goiânia', 'GO', '74.503-100', '', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales`
--

CREATE TABLE `sales` (
  `id` int UNSIGNED NOT NULL,
  `id_client` int NOT NULL,
  `id_user` int NOT NULL,
  `date_sale` date NOT NULL,
  `total_price` float NOT NULL,
  `status` int NOT NULL,
  `id_company` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `sales`
--

INSERT INTO `sales` (`id`, `id_client`, `id_user`, `date_sale`, `total_price`, `status`, `id_company`) VALUES
(19, 11, 1, '2020-02-24', 1072.5, 0, 1),
(20, 10, 1, '2020-02-25', 581.25, 0, 1),
(21, 11, 1, '2020-02-25', 536.25, 1, 1),
(22, 11, 1, '2020-02-27', 1743.75, 2, 1),
(23, 45, 1, '2020-05-10', 5555.55, 1, 1),
(24, 45, 1, '2020-05-10', 57.9, 1, 1),
(25, 14, 1, '2020-05-10', 28.95, 0, 1),
(26, 42, 1, '2020-05-10', 5555.55, 0, 1),
(27, 13, 1, '2020-05-10', 5555.55, 0, 1),
(28, 16, 1, '2020-05-10', 28.95, 0, 1),
(29, 45, 1, '2020-05-10', 28.95, 0, 1),
(30, 45, 1, '2020-06-20', 536.25, 1, 1),
(31, 48, 1, '2020-06-20', 90, 2, 1),
(32, 76, 1, '2022-01-09', 310, 0, 1),
(33, 76, 1, '2022-01-09', 425, 0, 1),
(34, 76, 1, '2022-01-09', 0, 0, 1),
(35, 76, 1, '2022-01-09', 1510, 0, 1),
(36, 76, 1, '2022-02-06', 0, 0, 1),
(37, 76, 1, '2022-02-13', 60, 0, 1),
(38, 77, 1, '2022-02-13', 30, 0, 1),
(39, 77, 1, '2022-02-13', 250, 0, 1),
(40, 76, 1, '2022-02-13', 390, 0, 1),
(41, 76, 1, '2022-03-20', 220, 0, 1),
(42, 76, 1, '2022-04-15', 0, 0, 1),
(43, 76, 1, '2022-04-15', 0, 0, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales_products`
--

CREATE TABLE `sales_products` (
  `id` int UNSIGNED NOT NULL,
  `id_sale` int NOT NULL,
  `id_product` int NOT NULL,
  `quant` float NOT NULL,
  `sale_price` float NOT NULL,
  `id_company` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `sales_products`
--

INSERT INTO `sales_products` (`id`, `id_sale`, `id_product`, `quant`, `sale_price`, `id_company`) VALUES
(8, 19, 8, 2, 536.25, 1),
(9, 20, 8, 1, 536.25, 1),
(10, 20, 10, 1, 45, 1),
(11, 21, 8, 1, 536.25, 1),
(12, 22, 8, 3, 536.25, 1),
(13, 22, 10, 3, 45, 1),
(14, 23, 11, 1, 5555.55, 1),
(15, 24, 12, 2, 28.95, 1),
(16, 25, 12, 1, 28.95, 1),
(17, 26, 11, 1, 5555.55, 1),
(18, 27, 11, 1, 5555.55, 1),
(19, 28, 12, 1, 28.95, 1),
(20, 29, 12, 1, 28.95, 1),
(21, 30, 8, 1, 536.25, 1),
(22, 31, 10, 2, 45, 1),
(23, 32, 23, 3, 30, 1),
(24, 32, 24, 1, 220, 1),
(25, 33, 11, 1, 425, 1),
(26, 35, 23, 2, 30, 1),
(27, 35, 25, 3, 200, 1),
(28, 35, 11, 2, 425, 1),
(29, 37, 23, 2, 30, 1),
(30, 38, 23, 1, 30, 1),
(31, 39, 23, 1, 30, 1),
(32, 39, 24, 1, 220, 1),
(33, 40, 23, 13, 30, 1),
(34, 41, 24, 1, 220, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `schedule`
--

CREATE TABLE `schedule` (
  `id` int UNSIGNED NOT NULL,
  `client_name` varchar(150) NOT NULL,
  `reported_defects` longtext,
  `schedule_date` date NOT NULL,
  `schedule_time` time DEFAULT NULL,
  `situation` int NOT NULL,
  `mechanic` int NOT NULL,
  `vehicle` varchar(50) NOT NULL DEFAULT '',
  `priority` int NOT NULL,
  `aditional_info` longtext NOT NULL,
  `id_company` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `schedule`
--

INSERT INTO `schedule` (`id`, `client_name`, `reported_defects`, `schedule_date`, `schedule_time`, `situation`, `mechanic`, `vehicle`, `priority`, `aditional_info`, `id_company`) VALUES
(13, 'PR. DALMO', 'TROCA AMORTECEDOR TRASEIRO', '2022-02-14', '07:30:00', 3, 36, 'GRAND SIENA', 2, '', 1),
(14, 'MARLENE FERREIRA LOPES', 'VAZAMENTO CARTER', '2022-03-21', '07:30:00', 1, 31, 'GRAND SIENA', 2, '', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `services`
--

CREATE TABLE `services` (
  `id` int UNSIGNED NOT NULL,
  `name_service` varchar(100) NOT NULL,
  `standard_value` float NOT NULL,
  `id_company` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `services`
--

INSERT INTO `services` (`id`, `name_service`, `standard_value`, `id_company`) VALUES
(1, 'ALINHAMENTO', 60, 1),
(3, 'FREIO DIANTEIRO', 60, 1),
(4, 'BALANCEAMENTO RODA (LIGA LEVE)', 22.5, 1),
(6, 'BALANCEAMENTO RODA (FERRO)', 15, 1),
(7, 'TROCA BUCHA BANDEJA', 40, 1),
(10, 'SERVICO AMORTECEDOR DIANTEIRO', 50, 1),
(11, 'SERVICO AMORTECEDOR TRASEIRO', 50, 1),
(12, 'SERVICO ROLAMENTO RODA DIANTEIRA', 50, 1),
(13, 'SERVICO ROLAMENTO RODA TRASEIRA', 50, 1),
(14, 'SERVICO FREIO DIANTEIRO', 70, 1),
(15, 'SERVICO FREIO TRASEIRO', 100, 1),
(16, 'SERVICO CRUZETA', 50, 1),
(17, 'CAMBAGEM', 60, 1),
(18, 'SERVICO PIVO SUPERIOR', 50, 1),
(19, 'SERVICO ABS', 80, 1),
(20, 'TROCA CABO FREIO MÃO', 40, 1),
(21, 'DIAGNOSTICO/SCANNER', 80, 1),
(22, 'CAMBAGEM TRASEIRA', 90, 1),
(23, 'SERVICO PIVO INFERIOR', 50, 1),
(24, 'LIMPEZA SISTEMA DE ARREFECIMENTO', 50, 1),
(25, 'TROCA OLEO/FILTROS', 30, 1),
(26, 'TROCA TERMINAL DIRECAO', 50, 1),
(27, 'SERVICO CAIXA DIRECAO', 150, 1),
(28, 'SERVICO BARRA AXIAL', 50, 1),
(29, 'TROCA BUCHA EIXO TRASEIRO', 80, 1),
(30, 'SERVICO TANQUE', 120, 1),
(31, 'SERVICO MOTOR', 1400, 1),
(32, 'SERVICO CABECOTE', 500, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `single_receipt`
--

CREATE TABLE `single_receipt` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `receipt_amount` float NOT NULL,
  `regarding` varchar(100) NOT NULL DEFAULT '',
  `date_receipt` date NOT NULL,
  `cpf` varchar(50) DEFAULT NULL,
  `identity` varchar(50) DEFAULT NULL,
  `id_company` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `single_receipt`
--

INSERT INTO `single_receipt` (`id`, `name`, `receipt_amount`, `regarding`, `date_receipt`, `cpf`, `identity`, `id_company`) VALUES
(18, 'WESLEN VIEIRA DE FREITAS', 2016, 'COMISSÃO MES DE MAIO', '2020-06-03', '052.841.351-13', '2560973-4 SSP/MT', 1),
(19, 'KAUÃƒ RODRIGUES COSTA', 530, 'PAGAMENTO MES DE MAIO', '2020-06-03', '', '', 1),
(21, 'ODETE ALVES DAMACENO', 140, 'PAGTO', '2020-06-03', '372.688.132-87', '', 1),
(22, 'LUAN ALVES DOS SANTOS', 542.5, 'COMISSÃƒO MES DE JUNHO', '2020-07-03', '', '', 1),
(23, 'MARCIO KAUÃƒ RODRIGUES COSTA', 540, 'PAGAMENTO MES DE JUNHO', '2020-07-03', '', '', 1),
(25, 'WESLEN VIEIRA DE FREITAS', 1755, 'COMISSÃƒO MES DE JUNHO', '2020-07-03', '', '', 1),
(26, 'eliton campos silva', 30, 'nada', '2021-01-01', '030.887.331-92', '19317999 SSP/MT', 1),
(27, 'LUAN ALVES DOS SANTOS', 500, 'PAGAMENTO PEÇA COMPRADA', '2021-12-19', '', '', 1),
(28, 'Eliton Campos silva', 10, 'teste', '2021-12-19', '030.887.331-92', '19317999 SSP/MT', 1),
(29, 'Eliton Campos silva', 500, 'TESTE DATA novo', '2021-12-19', '030.887.331-92', '19317999 SSP/MT', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `id_group` int NOT NULL,
  `id_company` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `id_group`, `id_company`) VALUES
(1, 'eliton.pecas@gmail.com', '903b7f422bbb16bcf1d67c2228aeaf83', 1, 1),
(5, 'automecanicaborges@gmail.com', '903b7f422bbb16bcf1d67c2228aeaf83', 8, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `worth_employee`
--

CREATE TABLE `worth_employee` (
  `id` int UNSIGNED NOT NULL,
  `id_employee` int NOT NULL,
  `date_worth` date NOT NULL,
  `advance_amount` float NOT NULL,
  `aditional_info` longtext NOT NULL,
  `id_company` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `worth_employee`
--

INSERT INTO `worth_employee` (`id`, `id_employee`, `date_worth`, `advance_amount`, `aditional_info`, `id_company`) VALUES
(16, 32, '2020-05-11', 10, 'VALE', 1),
(17, 33, '2020-05-11', 20, 'VALE', 1),
(18, 32, '2020-05-13', 10, 'VALE', 1),
(20, 33, '2020-05-14', 125, 'VALE', 1),
(21, 33, '2020-05-14', 10, 'VALE', 1),
(23, 35, '2020-05-14', 50, 'VALE', 1),
(24, 33, '2020-05-16', 200, 'VALE', 1),
(25, 37, '2020-05-16', 400, 'TRANSF. BRADESCO', 1),
(26, 36, '2020-05-16', 79.9, 'VALE INTERNET', 1),
(27, 38, '2020-05-18', 300, 'VALE', 1),
(28, 33, '2020-05-19', 150, 'VALE', 1),
(29, 30, '2020-05-22', 20, 'VALE STRADA', 1),
(30, 32, '2020-05-22', 50, 'VALE', 1),
(31, 33, '2020-05-22', 50, 'vale', 1),
(32, 33, '2020-05-23', 200, 'VALE', 1),
(34, 35, '2020-05-25', 400, 'VALE', 1),
(35, 34, '2020-05-25', 100, 'VALE', 1),
(36, 32, '2020-05-25', 20, 'VALE', 1),
(37, 33, '2020-05-26', 247.54, 'VALE ENERGIA', 1),
(38, 38, '2020-05-26', 10, 'VALE', 1),
(39, 33, '2020-05-27', 10, 'VALE TAMPA', 1),
(40, 34, '2020-05-27', 45, 'VALE CHAVES', 1),
(41, 33, '2020-05-27', 100, 'VALE', 1),
(42, 35, '2020-05-29', 100, '', 1),
(43, 34, '2020-06-01', 70, '', 1),
(44, 34, '2020-06-02', 50, '', 1),
(45, 33, '2020-06-04', 50, '', 1),
(46, 36, '2020-06-05', 120, '', 1),
(47, 36, '2020-06-06', 40, '', 1),
(48, 38, '2020-06-06', 20, '', 1),
(49, 33, '2020-06-08', 400, '', 1),
(50, 38, '2020-06-10', 50, '', 1),
(51, 38, '2020-06-12', 60, 'CORDAS VIOLÃƒO', 1),
(52, 33, '2020-06-15', 50, '', 1),
(53, 33, '2020-06-15', 20, '', 1),
(54, 32, '2020-06-19', 20, '', 1),
(55, 38, '2020-06-19', 10, '', 1),
(56, 33, '2020-06-19', 80, '', 1),
(58, 33, '2020-06-22', 50, '', 1),
(61, 35, '2020-06-24', 300, '', 1),
(62, 33, '2020-06-27', 150, '', 1),
(63, 35, '2020-06-30', 50, '', 1),
(65, 36, '2020-07-01', 20, '', 1),
(68, 77, '2021-05-30', 600, '', 1),
(69, 77, '2021-06-06', 350, '', 1),
(70, 77, '2021-12-18', 200, 'TESTANDO O SISTEMA DE NOVO', 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `bank_check`
--
ALTER TABLE `bank_check`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `bank_check_issued`
--
ALTER TABLE `bank_check_issued`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `equipment_brand`
--
ALTER TABLE `equipment_brand`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `equipment_model`
--
ALTER TABLE `equipment_model`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `fn_accounts_payable`
--
ALTER TABLE `fn_accounts_payable`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `fn_accounts_receivable`
--
ALTER TABLE `fn_accounts_receivable`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `fn_accounts_received`
--
ALTER TABLE `fn_accounts_received`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `fn_accounts_received_payment`
--
ALTER TABLE `fn_accounts_received_payment`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `fn_carrier`
--
ALTER TABLE `fn_carrier`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `fn_paid_bills`
--
ALTER TABLE `fn_paid_bills`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `fn_settings`
--
ALTER TABLE `fn_settings`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `functional_occurrence`
--
ALTER TABLE `functional_occurrence`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `inventory_history`
--
ALTER TABLE `inventory_history`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `permission_groups`
--
ALTER TABLE `permission_groups`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `permission_params`
--
ALTER TABLE `permission_params`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `products_img`
--
ALTER TABLE `products_img`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `product_brand`
--
ALTER TABLE `product_brand`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `sales_products`
--
ALTER TABLE `sales_products`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `single_receipt`
--
ALTER TABLE `single_receipt`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `worth_employee`
--
ALTER TABLE `worth_employee`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `bank_check`
--
ALTER TABLE `bank_check`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `bank_check_issued`
--
ALTER TABLE `bank_check_issued`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT de tabela `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT de tabela `equipment_brand`
--
ALTER TABLE `equipment_brand`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `equipment_model`
--
ALTER TABLE `equipment_model`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `fn_accounts_payable`
--
ALTER TABLE `fn_accounts_payable`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `fn_accounts_receivable`
--
ALTER TABLE `fn_accounts_receivable`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `fn_accounts_received`
--
ALTER TABLE `fn_accounts_received`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fn_accounts_received_payment`
--
ALTER TABLE `fn_accounts_received_payment`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fn_carrier`
--
ALTER TABLE `fn_carrier`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `fn_paid_bills`
--
ALTER TABLE `fn_paid_bills`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT de tabela `fn_settings`
--
ALTER TABLE `fn_settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `functional_occurrence`
--
ALTER TABLE `functional_occurrence`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de tabela `inventory_history`
--
ALTER TABLE `inventory_history`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT de tabela `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `permission_groups`
--
ALTER TABLE `permission_groups`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `permission_params`
--
ALTER TABLE `permission_params`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de tabela `products`
--
ALTER TABLE `products`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de tabela `products_img`
--
ALTER TABLE `products_img`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `product_brand`
--
ALTER TABLE `product_brand`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de tabela `provider`
--
ALTER TABLE `provider`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de tabela `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de tabela `sales_products`
--
ALTER TABLE `sales_products`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de tabela `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `services`
--
ALTER TABLE `services`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de tabela `single_receipt`
--
ALTER TABLE `single_receipt`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `worth_employee`
--
ALTER TABLE `worth_employee`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
