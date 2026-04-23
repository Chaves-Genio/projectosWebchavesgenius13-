-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23/04/2026 às 13:38
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `monografiadb`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `ano_lectivo`
--

CREATE TABLE `ano_lectivo` (
  `id` int(11) NOT NULL,
  `descricao` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `ano_lectivo`
--

INSERT INTO `ano_lectivo` (`id`, `descricao`) VALUES
(1, '2025/2026'),
(2, '2026/2027');

-- --------------------------------------------------------

--
-- Estrutura para tabela `avaliacao`
--

CREATE TABLE `avaliacao` (
  `id` int(11) NOT NULL,
  `id_Defesa` int(11) DEFAULT NULL,
  `nota_Final` decimal(5,2) DEFAULT NULL,
  `parecer` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `curso`
--

CREATE TABLE `curso` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descricao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `curso`
--

INSERT INTO `curso` (`id`, `nome`, `descricao`) VALUES
(2, 'Farmácia', 'nakakka d'),
(3, 'Enfermagem', 'coqco'),
(4, 'Análises Clínica', 'dahdma'),
(5, 'Radiologia', 'ajd');

-- --------------------------------------------------------

--
-- Estrutura para tabela `defesa`
--

CREATE TABLE `defesa` (
  `id` int(11) NOT NULL,
  `id_monog` int(11) DEFAULT NULL,
  `data_defesa` date DEFAULT NULL,
  `local` varchar(100) DEFAULT NULL,
  `estado_defesa` enum('Agendada','Realizada','Cancelada') DEFAULT 'Agendada',
  `presidente` varchar(50) NOT NULL,
  `primeiro_vogal` varchar(50) NOT NULL,
  `orientador` varchar(50) NOT NULL,
  `hora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `estudante`
--

CREATE TABLE `estudante` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `sexo` enum('M','F') DEFAULT NULL,
  `num_Proc` int(11) NOT NULL,
  `turma` varchar(10) DEFAULT NULL,
  `telefone` varchar(25) DEFAULT NULL,
  `numBi` varchar(14) NOT NULL,
  `id_curso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `monografia`
--

CREATE TABLE `monografia` (
  `id` int(11) NOT NULL,
  `id_tema` int(11) DEFAULT NULL,
  `id_orientador` int(11) DEFAULT NULL,
  `id_estudante` int(11) DEFAULT NULL,
  `id_ano_lectivo` int(11) DEFAULT NULL,
  `estado_monog` enum('Em andamento','Concluída','Cancelada') DEFAULT 'Em andamento',
  `data_inicio` date DEFAULT NULL,
  `data_conclusao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `orientador`
--

CREATE TABLE `orientador` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `especialidade` varchar(100) DEFAULT NULL,
  `telefone` varchar(25) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `numBi` varchar(14) NOT NULL,
  `id_curso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `perfil`
--

CREATE TABLE `perfil` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `submissao`
--

CREATE TABLE `submissao` (
  `id` int(11) NOT NULL,
  `id_monog` int(11) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `data_sub` date DEFAULT NULL,
  `ficheiro` longblob DEFAULT NULL,
  `estado_sub` enum('Pendente','Aceite','Rejeitada') DEFAULT 'Pendente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tema`
--

CREATE TABLE `tema` (
  `id` int(11) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `descricao` text DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL,
  `estado_Tema` enum('Proposto','Aprovado','Rejeitado') DEFAULT 'Proposto',
  `data_Proposta` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `numBi` varchar(14) NOT NULL,
  `senha_hash` varchar(300) NOT NULL,
  `status` enum('Ativo','Inativo') DEFAULT 'Ativo',
  `tipo` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `numBi`, `senha_hash`, `status`, `tipo`, `email`) VALUES
(3, 'Chaves Genius13', '000000000AA000', '$2y$10$hanhfcwYw4jYXnnuKF.cO.VNVXzZfISEB1LBZs/Y5NhzjBwILUaI2', 'Ativo', 'Super Admin', 'chaves@gmail.com'),
(13, 'Paulo Mateus Maya', '008379772UE038', '$2y$10$C4ot0vB8/ExDTLCBP0t76Oks922Milbqlx1LrNicekL1r0BipCiDe', 'Ativo', 'Orientador', 'maya@gmail.com'),
(14, 'Chaves Genius', '008379772UE045', '$2y$10$oaAZijv9Q4eS9O1tObG4G.eEMHeXjITzcpIIOfCOHm7OdqkLgEbhq', 'Ativo', 'Orientador', 'uatu@gmail.com'),
(15, 'Nunuez Manuel Cobra', '007779772UE045', '$2y$10$dpoXn46f4VT.dxFIgx5cSOcP7nRujYRl3TSrB784SvkCMu2Wu58uG', 'Ativo', 'Orientador', 'nunez@gmail.com'),
(16, 'Nunuez Manuel Cobra', '007779772UE042', '$2y$10$VTo49TvDkLQTIL.HPJbEAuK9BIx7bFAbOikKpW7OZ1fivQKtST.Oi', 'Ativo', 'Orientador', 'nunez2@gmail.com'),
(17, 'Nunuez Manuel Cobra', '007779772UE022', '$2y$10$sjkJvLlYDORbwktD4crmxuMWhQyjYcBdPAClqYI9Uf6E69MmnBxxi', 'Ativo', 'Orientador', 'nunez32@gmail.com'),
(18, 'Emana Luessy Gilas', '007779772UE041', '$2y$10$5CgWqAlbvUro8qXQ.1AShuum2nXYBMuXu7RCtpfKsieTFsxpc36eG', 'Ativo', 'Orientador', 'emana@gmail.com'),
(19, 'Emana Luessy Gilas', '007379772UE045', '$2y$10$zeN6bMEDXNSADI0Z2AZdrek7E7v4LjBYm40TNzb9RP532aRaKtFHK', 'Ativo', 'Orientador', 'emana33@gmail.com'),
(21, 'Emana Luessy Gilas', '007379772UE047', '$2y$10$Aqi50lzBKxPxCPIpHcUCUunnKs5/uvDvcEAfUqf6QM2Cw2eSQKm.a', 'Ativo', 'Orientador', 'emana33@gmail.com'),
(22, 'Mateus Bernardo', '007779772UE049', '$2y$10$7XDIo49mhOL45GH4vfnYP.tJ4goZhasMIclz1tUczG6hhel2VTaCu', 'Ativo', 'Orientador', 'matesus@gmail.com'),
(23, 'Mateus Fernado', '007779712UE042', '$2y$10$voKguy03vVM5ZUHQ2guK/OsqkVOll0UXWF3tMMbVOwEeJ/GosWF12', 'Ativo', 'Orientador', 'matesus1@gmail.com'),
(24, 'Paulo Bernardo', '007779772UE040', '$2y$10$KmpL/DDo05OBXfTK/1.grenDEQF2L.pwSFUJiR764EeGcS2V/OKAS', 'Ativo', 'Orientador', 'mates1us@gmail.com');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `ano_lectivo`
--
ALTER TABLE `ano_lectivo`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_Defesa` (`id_Defesa`);

--
-- Índices de tabela `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `defesa`
--
ALTER TABLE `defesa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_Monog` (`id_monog`);

--
-- Índices de tabela `estudante`
--
ALTER TABLE `estudante`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `num_Proc` (`num_Proc`);

--
-- Índices de tabela `monografia`
--
ALTER TABLE `monografia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tema` (`id_tema`),
  ADD KEY `id_orientador` (`id_orientador`),
  ADD KEY `id_estudante` (`id_estudante`),
  ADD KEY `id_ano_lectivo` (`id_ano_lectivo`);

--
-- Índices de tabela `orientador`
--
ALTER TABLE `orientador`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `submissao`
--
ALTER TABLE `submissao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_Monog` (`id_monog`);

--
-- Índices de tabela `tema`
--
ALTER TABLE `tema`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numBi` (`numBi`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `ano_lectivo`
--
ALTER TABLE `ano_lectivo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `curso`
--
ALTER TABLE `curso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `defesa`
--
ALTER TABLE `defesa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `estudante`
--
ALTER TABLE `estudante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `monografia`
--
ALTER TABLE `monografia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `orientador`
--
ALTER TABLE `orientador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `submissao`
--
ALTER TABLE `submissao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tema`
--
ALTER TABLE `tema`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD CONSTRAINT `avaliacao_ibfk_1` FOREIGN KEY (`id_Defesa`) REFERENCES `defesa` (`id`);

--
-- Restrições para tabelas `defesa`
--
ALTER TABLE `defesa`
  ADD CONSTRAINT `defesa_ibfk_1` FOREIGN KEY (`id_monog`) REFERENCES `monografia` (`id`),
  ADD CONSTRAINT `defesa_ibfk_2` FOREIGN KEY (`id_monog`) REFERENCES `monografia` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `monografia`
--
ALTER TABLE `monografia`
  ADD CONSTRAINT `monografia_ibfk_1` FOREIGN KEY (`id_tema`) REFERENCES `tema` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `monografia_ibfk_2` FOREIGN KEY (`id_orientador`) REFERENCES `orientador` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `monografia_ibfk_3` FOREIGN KEY (`id_estudante`) REFERENCES `estudante` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `monografia_ibfk_4` FOREIGN KEY (`id_ano_lectivo`) REFERENCES `ano_lectivo` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `submissao`
--
ALTER TABLE `submissao`
  ADD CONSTRAINT `submissao_ibfk_1` FOREIGN KEY (`id_monog`) REFERENCES `monografia` (`id`),
  ADD CONSTRAINT `submissao_ibfk_2` FOREIGN KEY (`id_monog`) REFERENCES `monografia` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
