-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17-Maio-2026 às 13:15
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `geoagro`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `admin`
--

CREATE TABLE `admin` (
  `idAdmin` int(11) NOT NULL,
  `nivelacesso` varchar(20) NOT NULL,
  `idUsuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `agricultor`
--

CREATE TABLE `agricultor` (
  `idAgricultor` int(11) NOT NULL,
  `declaracaoadministracaolocal` varchar(255) NOT NULL,
  `titulopropriedade` varchar(255) NOT NULL,
  `idUsuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `alertadados`
--

CREATE TABLE `alertadados` (
  `idAlertaDados` int(11) NOT NULL,
  `mensagem` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `campoagricola`
--

CREATE TABLE `campoagricola` (
  `idCampoAgricola` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `rua` varchar(100) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `municipio` varchar(50) NOT NULL,
  `provincia` varchar(100) NOT NULL,
  `tamanhohectares` decimal(10,2) NOT NULL,
  `idAgricultor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `leiturasensor`
--

CREATE TABLE `leiturasensor` (
  `idLeituraSensor` int(11) NOT NULL,
  `valorlido` decimal(15,4) NOT NULL,
  `unidademedida` varchar(20) NOT NULL,
  `datahoraleitura` datetime NOT NULL,
  `idSensor` int(11) DEFAULT NULL,
  `idAlertaDados` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidotransporte`
--

CREATE TABLE `pedidotransporte` (
  `idPedidoTransporte` int(11) NOT NULL,
  `origem` varchar(255) NOT NULL,
  `destino` varchar(255) NOT NULL,
  `quantidadecarga` decimal(10,2) NOT NULL,
  `idTransportador` int(11) DEFAULT NULL,
  `idAgricultor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sensor`
--

CREATE TABLE `sensor` (
  `idSensor` int(11) NOT NULL,
  `tiposensor` varchar(100) NOT NULL,
  `idCampoAgricola` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `transportador`
--

CREATE TABLE `transportador` (
  `idTransportador` int(11) NOT NULL,
  `disponibilidade` varchar(50) NOT NULL,
  `matriculacarro` varchar(50) NOT NULL,
  `idUsuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `datanascimento` date NOT NULL,
  `numerobi` varchar(50) NOT NULL,
  `numerotelefone` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `genero` enum('Masculino','Feminino') NOT NULL,
  `imagem` varchar(255) NOT NULL,
  `tipoUsuario` enum('Agricultor','Transportador','Admin') DEFAULT NULL,
  `idAdmin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`idAdmin`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Índices para tabela `agricultor`
--
ALTER TABLE `agricultor`
  ADD PRIMARY KEY (`idAgricultor`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Índices para tabela `alertadados`
--
ALTER TABLE `alertadados`
  ADD PRIMARY KEY (`idAlertaDados`);

--
-- Índices para tabela `campoagricola`
--
ALTER TABLE `campoagricola`
  ADD PRIMARY KEY (`idCampoAgricola`),
  ADD KEY `idAgricultor` (`idAgricultor`);

--
-- Índices para tabela `leiturasensor`
--
ALTER TABLE `leiturasensor`
  ADD PRIMARY KEY (`idLeituraSensor`),
  ADD KEY `idSensor` (`idSensor`),
  ADD KEY `idAlertaDados` (`idAlertaDados`);

--
-- Índices para tabela `pedidotransporte`
--
ALTER TABLE `pedidotransporte`
  ADD PRIMARY KEY (`idPedidoTransporte`),
  ADD KEY `idTransportador` (`idTransportador`),
  ADD KEY `idAgricultor` (`idAgricultor`);

--
-- Índices para tabela `sensor`
--
ALTER TABLE `sensor`
  ADD PRIMARY KEY (`idSensor`),
  ADD KEY `idCampoAgricola` (`idCampoAgricola`);

--
-- Índices para tabela `transportador`
--
ALTER TABLE `transportador`
  ADD PRIMARY KEY (`idTransportador`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idAdmin` (`idAdmin`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `admin`
--
ALTER TABLE `admin`
  MODIFY `idAdmin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `agricultor`
--
ALTER TABLE `agricultor`
  MODIFY `idAgricultor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `alertadados`
--
ALTER TABLE `alertadados`
  MODIFY `idAlertaDados` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `campoagricola`
--
ALTER TABLE `campoagricola`
  MODIFY `idCampoAgricola` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `leiturasensor`
--
ALTER TABLE `leiturasensor`
  MODIFY `idLeituraSensor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedidotransporte`
--
ALTER TABLE `pedidotransporte`
  MODIFY `idPedidoTransporte` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `sensor`
--
ALTER TABLE `sensor`
  MODIFY `idSensor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `transportador`
--
ALTER TABLE `transportador`
  MODIFY `idTransportador` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Limitadores para a tabela `agricultor`
--
ALTER TABLE `agricultor`
  ADD CONSTRAINT `agricultor_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Limitadores para a tabela `campoagricola`
--
ALTER TABLE `campoagricola`
  ADD CONSTRAINT `campoagricola_ibfk_1` FOREIGN KEY (`idAgricultor`) REFERENCES `agricultor` (`idAgricultor`);

--
-- Limitadores para a tabela `leiturasensor`
--
ALTER TABLE `leiturasensor`
  ADD CONSTRAINT `leiturasensor_ibfk_1` FOREIGN KEY (`idSensor`) REFERENCES `sensor` (`idSensor`),
  ADD CONSTRAINT `leiturasensor_ibfk_2` FOREIGN KEY (`idAlertaDados`) REFERENCES `alertadados` (`idAlertaDados`);

--
-- Limitadores para a tabela `pedidotransporte`
--
ALTER TABLE `pedidotransporte`
  ADD CONSTRAINT `pedidotransporte_ibfk_1` FOREIGN KEY (`idTransportador`) REFERENCES `transportador` (`idTransportador`),
  ADD CONSTRAINT `pedidotransporte_ibfk_2` FOREIGN KEY (`idAgricultor`) REFERENCES `agricultor` (`idAgricultor`);

--
-- Limitadores para a tabela `sensor`
--
ALTER TABLE `sensor`
  ADD CONSTRAINT `sensor_ibfk_1` FOREIGN KEY (`idCampoAgricola`) REFERENCES `campoagricola` (`idCampoAgricola`);

--
-- Limitadores para a tabela `transportador`
--
ALTER TABLE `transportador`
  ADD CONSTRAINT `transportador_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idAdmin`) REFERENCES `admin` (`idAdmin`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
