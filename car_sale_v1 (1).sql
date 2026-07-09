-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09/07/2026 às 12:32
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
-- Banco de dados: `car_sale_v1`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `anuncios_top`
--

CREATE TABLE `anuncios_top` (
  `id` int(11) NOT NULL,
  `veiculo_id` int(11) NOT NULL,
  `inicio` date NOT NULL,
  `fim` date NOT NULL,
  `valor_pago` decimal(10,2) NOT NULL,
  `ativo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `anuncios_top`
--

INSERT INTO `anuncios_top` (`id`, `veiculo_id`, `inicio`, `fim`, `valor_pago`, `ativo`) VALUES
(1, 1, '2026-06-22', '2026-07-22', 0.00, 1),
(2, 2, '2026-06-22', '2026-07-22', 0.00, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `favoritos`
--

CREATE TABLE `favoritos` (
  `utilizador_id` int(11) NOT NULL,
  `veiculo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fotos`
--

CREATE TABLE `fotos` (
  `id` int(11) NOT NULL,
  `veiculo_id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `is_principal` tinyint(1) DEFAULT 0,
  `ordem` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `fotos`
--

INSERT INTO `fotos` (`id`, `veiculo_id`, `url`, `is_principal`, `ordem`) VALUES
(1, 1, 'uploads/6a386021e72e4.jpg', 1, 0),
(2, 1, 'uploads/6a386021e77e0.jpg', 0, 0),
(3, 1, 'uploads/6a386021e813c.jpg', 0, 0),
(4, 2, 'uploads/6a38633a38d0f.jpg', 1, 0),
(5, 2, 'uploads/6a38633a39d56.jpg', 0, 0),
(6, 2, 'uploads/6a38633a3a95d.jpg', 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `mensagens`
--

CREATE TABLE `mensagens` (
  `id` int(11) NOT NULL,
  `remetente_id` int(11) NOT NULL,
  `destinatario_id` int(11) NOT NULL,
  `veiculo_id` int(11) NOT NULL,
  `mensagem` text NOT NULL,
  `lida` tinyint(1) DEFAULT 0,
  `criada_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `apagada_destinatario` tinyint(1) NOT NULL DEFAULT 0,
  `apagada_remetente` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `mensagens`
--

INSERT INTO `mensagens` (`id`, `remetente_id`, `destinatario_id`, `veiculo_id`, `mensagem`, `lida`, `criada_em`, `apagada_destinatario`, `apagada_remetente`) VALUES
(7, 2, 1, 1, 'virus!!!!!!!!!!', 0, '2026-07-08 10:36:08', 0, 0),
(10, 1, 2, 1, 'resposta sobre o anuncio, favor me ligue', 0, '2026-07-08 11:14:37', 0, 0),
(11, 1, 2, 2, 'testetstetstetstreceber mensagens responder mensagens', 0, '2026-07-08 11:34:15', 0, 0),
(12, 1, 2, 1, 'ola , tem interesse, entre em contato com o numero99999999', 0, '2026-07-08 11:37:04', 0, 0),
(13, 1, 2, 2, 'ola..tenho interesse', 0, '2026-07-09 10:03:02', 0, 0),
(14, 1, 1, 2, 'ok...me cha me pelo whatssap', 0, '2026-07-09 10:04:40', 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `utilizadores`
--

CREATE TABLE `utilizadores` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `perfil` enum('comprador','anunciante','lojista') NOT NULL DEFAULT 'comprador',
  `verificado` tinyint(1) NOT NULL DEFAULT 0,
  `codigo_verificacao` varchar(6) DEFAULT NULL,
  `codigo_expira` datetime DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `nome_loja` varchar(150) DEFAULT NULL,
  `descricao_loja` text DEFAULT NULL,
  `logo_loja` varchar(255) DEFAULT NULL,
  `morada_loja` varchar(255) DEFAULT NULL,
  `plano_lojista` varchar(30) DEFAULT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `utilizadores`
--

INSERT INTO `utilizadores` (`id`, `nome`, `email`, `password`, `perfil`, `verificado`, `codigo_verificacao`, `codigo_expira`, `telefone`, `cidade`, `nome_loja`, `descricao_loja`, `logo_loja`, `morada_loja`, `plano_lojista`, `criado_em`) VALUES
(1, 'Osni Posse', 'osniposse@gmail.com', '$2y$10$ukJ4IcIFn3rVQgBzdLK8yOl0v1BouZwZ.g/vKk2nWAIMOgKRqep9W', 'lojista', 1, NULL, NULL, '912363650', 'Guimarães', 'Osni Posse', 'testes', 'uploads/lojas/loja_6a385e64d8ac5.jpg', 'Rua do mira rio, 131 - 2° apto. AI', 'basico', '2026-06-21 21:57:56'),
(2, 'Thaynan', 'thay.ivanievick@gmail.com', '$2y$10$nC7H0.3pa5TpQ/Tzo0F3ju6Q39K5nZfSmc7eyfkF.s2pAc3HtWO7y', 'lojista', 1, NULL, NULL, '333333333333', 'Guimarães', 'thay', 'teste', 'uploads/lojas/loja_6a3862e2e7676.jpg', 'Rua do mira rio, 131 - 2° apto. AI', 'profissional', '2026-06-21 22:17:07');

-- --------------------------------------------------------

--
-- Estrutura para tabela `veiculos`
--

CREATE TABLE `veiculos` (
  `id` int(11) NOT NULL,
  `utilizador_id` int(11) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `ano` char(4) NOT NULL,
  `quilometragem` int(11) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `combustivel` enum('gasolina','diesel','eletrico','hibrido') NOT NULL,
  `cambio` enum('manual','automatico') NOT NULL,
  `estado` enum('novo','seminovo','usado') NOT NULL,
  `descricao` text DEFAULT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `veiculos`
--

INSERT INTO `veiculos` (`id`, `utilizador_id`, `marca`, `modelo`, `ano`, `quilometragem`, `preco`, `combustivel`, `cambio`, `estado`, `descricao`, `criado_em`) VALUES
(1, 1, 'ferrari', 'f1000', '-2', 1111, 1111.00, 'gasolina', 'manual', 'usado', 'testesfdsfsd', '2026-06-21 22:05:21'),
(2, 2, 'bmw', 'teste', '123', 1213, 1213.00, 'eletrico', 'manual', 'usado', 'teste', '2026-06-21 22:18:34');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `anuncios_top`
--
ALTER TABLE `anuncios_top`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `veiculo_id` (`veiculo_id`);

--
-- Índices de tabela `favoritos`
--
ALTER TABLE `favoritos`
  ADD PRIMARY KEY (`utilizador_id`,`veiculo_id`),
  ADD KEY `fk_favoritos_veiculos` (`veiculo_id`);

--
-- Índices de tabela `fotos`
--
ALTER TABLE `fotos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_fotos_veiculos` (`veiculo_id`);

--
-- Índices de tabela `mensagens`
--
ALTER TABLE `mensagens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_mensagens_remetente` (`remetente_id`),
  ADD KEY `fk_mensagens_destinatario` (`destinatario_id`),
  ADD KEY `fk_mensagens_veiculo` (`veiculo_id`);

--
-- Índices de tabela `utilizadores`
--
ALTER TABLE `utilizadores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices de tabela `veiculos`
--
ALTER TABLE `veiculos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_veiculos_utilizadores` (`utilizador_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `anuncios_top`
--
ALTER TABLE `anuncios_top`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `fotos`
--
ALTER TABLE `fotos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `mensagens`
--
ALTER TABLE `mensagens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `utilizadores`
--
ALTER TABLE `utilizadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `veiculos`
--
ALTER TABLE `veiculos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `anuncios_top`
--
ALTER TABLE `anuncios_top`
  ADD CONSTRAINT `fk_anuncios_top_veiculos` FOREIGN KEY (`veiculo_id`) REFERENCES `veiculos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `favoritos`
--
ALTER TABLE `favoritos`
  ADD CONSTRAINT `fk_favoritos_utilizadores` FOREIGN KEY (`utilizador_id`) REFERENCES `utilizadores` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_favoritos_veiculos` FOREIGN KEY (`veiculo_id`) REFERENCES `veiculos` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `fotos`
--
ALTER TABLE `fotos`
  ADD CONSTRAINT `fk_fotos_veiculos` FOREIGN KEY (`veiculo_id`) REFERENCES `veiculos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `mensagens`
--
ALTER TABLE `mensagens`
  ADD CONSTRAINT `fk_mensagens_destinatario` FOREIGN KEY (`destinatario_id`) REFERENCES `utilizadores` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_mensagens_remetente` FOREIGN KEY (`remetente_id`) REFERENCES `utilizadores` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_mensagens_veiculo` FOREIGN KEY (`veiculo_id`) REFERENCES `veiculos` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `veiculos`
--
ALTER TABLE `veiculos`
  ADD CONSTRAINT `fk_veiculos_utilizadores` FOREIGN KEY (`utilizador_id`) REFERENCES `utilizadores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
