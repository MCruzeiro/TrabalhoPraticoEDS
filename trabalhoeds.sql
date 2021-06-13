-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 13-Jun-2021 às 22:55
-- Versão do servidor: 10.4.18-MariaDB
-- versão do PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `trabalhoeds`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `alojamento`
--

CREATE TABLE `alojamento` (
  `cod_alojamento` int(5) NOT NULL,
  `valor` double(10,2) NOT NULL,
  `rua` varchar(300) NOT NULL,
  `nPorta` varchar(100) NOT NULL,
  `cod_postal` varchar(20) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `país` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `alojamento`
--

INSERT INTO `alojamento` (`cod_alojamento`, `valor`, `rua`, `nPorta`, `cod_postal`, `nome`, `país`) VALUES
(1, 220.00, 'Rua dos Algarvios', '25', '4800-474', 'Falésia Hotel', 'Portugal'),
(2, 840.00, 'Meedhoo Street', '79', '00070', 'Baglioni Resort', 'Maldivas'),
(3, 480.00, 'Columbia Falls, Montana', '456', '34787', 'Cedar Creek', 'Estados Unidos da América');

-- --------------------------------------------------------

--
-- Estrutura da tabela `alojamento_pacotes`
--

CREATE TABLE `alojamento_pacotes` (
  `cod_alojamento` int(5) NOT NULL,
  `cod_pacote` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `atividades`
--

CREATE TABLE `atividades` (
  `cod_atividade` int(5) NOT NULL,
  `nome` varchar(10) NOT NULL,
  `descrição` varchar(500) NOT NULL,
  `valor` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `atividades`
--

INSERT INTO `atividades` (`cod_atividade`, `nome`, `descrição`, `valor`) VALUES
(1, 'Slide', 'Descida pelo Gerês para toda a família!', 20.00),
(2, 'Mergulhos', 'Mergulhe pelas melhores águas das Maldivas.', 25.00),
(3, 'Pesca', 'Disfrute de uma tarde de pesca em Montana, USA.', 15.00);

-- --------------------------------------------------------

--
-- Estrutura da tabela `atividades_pacotes`
--

CREATE TABLE `atividades_pacotes` (
  `cod_atividade` int(5) NOT NULL,
  `cod_pacote` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `backend_user`
--

CREATE TABLE `backend_user` (
  `id` int(10) NOT NULL,
  `firstName` varchar(15) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `authKey` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `backend_user`
--

INSERT INTO `backend_user` (`id`, `firstName`, `lastName`, `username`, `password`, `authKey`) VALUES
(0, '', '', 'Admin', '123', '123'),
(1, '', '', 'Cliente', '123', '123'),
(2, '', '', 'Funcionario', '123', '123');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidade`
--

CREATE TABLE `cidade` (
  `cod_cidade` int(5) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `valor` double(10,2) NOT NULL,
  `país` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cidade`
--

INSERT INTO `cidade` (`cod_cidade`, `nome`, `valor`, `país`) VALUES
(1, 'Braga', 20.00, 'Portugal'),
(2, 'Malé', 35.00, 'Maldivas'),
(3, 'Montana', 40.00, 'Estados Unidos da América');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidade_pacotes`
--

CREATE TABLE `cidade_pacotes` (
  `cod_cidade` int(11) NOT NULL,
  `cod_pacote` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `num_cliente` int(5) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `dt_nascimento` date NOT NULL,
  `rua` varchar(100) NOT NULL,
  `nPorta` varchar(50) NOT NULL,
  `cod_postal` varchar(20) NOT NULL,
  `num_cc` int(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` int(12) NOT NULL,
  `num_contribuinte` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`num_cliente`, `nome`, `dt_nascimento`, `rua`, `nPorta`, `cod_postal`, `num_cc`, `email`, `telefone`, `num_contribuinte`) VALUES
(1, 'Miguel Cruzeiro', '2001-01-19', 'Travessa da Padela', '7', '4935-378', 123456789, 'mcruzeiro@ipvc.pt', 963827923, 98765432),
(2, 'Ana Rita', '2001-02-22', 'Rua de Santiago', '2920', '4835-247', 243678394, 'ribeiro.ana@ipvc.pt', 964345678, 89475869);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente_reserva`
--

CREATE TABLE `cliente_reserva` (
  `num_cliente` int(5) NOT NULL,
  `num_reserva` int(5) NOT NULL,
  `tipo_cliente` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `codpostal`
--

CREATE TABLE `codpostal` (
  `cod_postal` varchar(20) NOT NULL,
  `localidade` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `codpostal`
--

INSERT INTO `codpostal` (`cod_postal`, `localidade`) VALUES
('00070', 'Maldivas, Malé'),
('34787', 'Montana, USA'),
('4800-474', 'Algarve'),
('4835-247', 'Guimarães'),
('4935-378', 'Vila Nova de Anha');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `num_funcionario` int(5) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `dt_nascimento` date NOT NULL,
  `num_contribuinte` int(9) NOT NULL,
  `num_cc` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`num_funcionario`, `nome`, `dt_nascimento`, `num_contribuinte`, `num_cc`) VALUES
(1, 'Gonçalo Meira', '2000-03-13', 746328493, 84749487),
(2, 'Bruno Neto', '2000-11-25', 947589438, 94756489);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pacotes`
--

CREATE TABLE `pacotes` (
  `cod_pacote` int(5) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `valor` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `pacotes`
--

INSERT INTO `pacotes` (`cod_pacote`, `nome`, `valor`) VALUES
(11, 'Pacote Simples', 20.00),
(22, 'Pacote Premium', 40.00);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `num_pagamento` int(5) NOT NULL,
  `tipo_pagamento` varchar(200) NOT NULL,
  `data` date NOT NULL,
  `valor_pagar` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `pagamento`
--

INSERT INTO `pagamento` (`num_pagamento`, `tipo_pagamento`, `data`, `valor_pagar`) VALUES
(1, 'MBWAY', '2021-06-12', 40.00),
(2, 'PAYPAL', '2021-05-23', 26.00),
(3, 'MBWAY', '2021-06-02', 65.00),
(4, 'MBWAY', '2021-06-13', 50.00);

-- --------------------------------------------------------

--
-- Estrutura da tabela `reserva`
--

CREATE TABLE `reserva` (
  `num_reserva` int(5) NOT NULL,
  `data` date NOT NULL,
  `valor` double(10,2) NOT NULL,
  `dt_pagamento` date NOT NULL,
  `estado_pagamento` varchar(20) NOT NULL,
  `num_pagamento` int(5) NOT NULL,
  `num_funcionario` int(5) NOT NULL,
  `cod_pacote` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `reserva`
--

INSERT INTO `reserva` (`num_reserva`, `data`, `valor`, `dt_pagamento`, `estado_pagamento`, `num_pagamento`, `num_funcionario`, `cod_pacote`) VALUES
(1, '2021-07-20', 40.00, '2021-06-12', 'PAGO', 1, 2, 11),
(2, '2021-08-05', 26.00, '2021-05-23', 'NÃO PAGO', 2, 1, 22),
(3, '2021-08-01', 65.00, '2021-06-02', 'PAGO', 3, 2, 22);

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefone`
--

CREATE TABLE `telefone` (
  `num_cliente` int(5) NOT NULL,
  `telefone` int(12) NOT NULL,
  `tipo_telefone` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `transporte`
--

CREATE TABLE `transporte` (
  `cod_transporte` int(5) NOT NULL,
  `valor` double(10,2) NOT NULL,
  `nome_companhia` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `transporte`
--

INSERT INTO `transporte` (`cod_transporte`, `valor`, `nome_companhia`) VALUES
(111, 12.00, 'AVIC'),
(222, 18.00, 'TAP'),
(333, 20.00, 'ARRIVA');

-- --------------------------------------------------------

--
-- Estrutura da tabela `transporte_pacotes`
--

CREATE TABLE `transporte_pacotes` (
  `cod_transporte` int(5) NOT NULL,
  `cod_pacote` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `alojamento`
--
ALTER TABLE `alojamento`
  ADD PRIMARY KEY (`cod_alojamento`),
  ADD KEY `cod_postal` (`cod_postal`);

--
-- Índices para tabela `alojamento_pacotes`
--
ALTER TABLE `alojamento_pacotes`
  ADD KEY `cod_alojamento` (`cod_alojamento`),
  ADD KEY `cod_pacote` (`cod_pacote`);

--
-- Índices para tabela `atividades`
--
ALTER TABLE `atividades`
  ADD PRIMARY KEY (`cod_atividade`);

--
-- Índices para tabela `atividades_pacotes`
--
ALTER TABLE `atividades_pacotes`
  ADD KEY `cod_atividade` (`cod_atividade`),
  ADD KEY `cod_pacote` (`cod_pacote`);

--
-- Índices para tabela `backend_user`
--
ALTER TABLE `backend_user`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`cod_cidade`);

--
-- Índices para tabela `cidade_pacotes`
--
ALTER TABLE `cidade_pacotes`
  ADD KEY `cod_cidade` (`cod_cidade`),
  ADD KEY `cod_pacote` (`cod_pacote`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`num_cliente`),
  ADD KEY `cod_postal` (`cod_postal`);

--
-- Índices para tabela `cliente_reserva`
--
ALTER TABLE `cliente_reserva`
  ADD KEY `num_cliente` (`num_cliente`),
  ADD KEY `num_reserva` (`num_reserva`);

--
-- Índices para tabela `codpostal`
--
ALTER TABLE `codpostal`
  ADD PRIMARY KEY (`cod_postal`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`num_funcionario`);

--
-- Índices para tabela `pacotes`
--
ALTER TABLE `pacotes`
  ADD PRIMARY KEY (`cod_pacote`);

--
-- Índices para tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`num_pagamento`);

--
-- Índices para tabela `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`num_reserva`),
  ADD KEY `num_pagamento` (`num_pagamento`),
  ADD KEY `num_funcionario` (`num_funcionario`),
  ADD KEY `cod_pacote` (`cod_pacote`);

--
-- Índices para tabela `telefone`
--
ALTER TABLE `telefone`
  ADD KEY `num_cliente` (`num_cliente`);

--
-- Índices para tabela `transporte`
--
ALTER TABLE `transporte`
  ADD PRIMARY KEY (`cod_transporte`);

--
-- Índices para tabela `transporte_pacotes`
--
ALTER TABLE `transporte_pacotes`
  ADD KEY `cod_pacote` (`cod_pacote`),
  ADD KEY `cod_transporte` (`cod_transporte`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `alojamento`
--
ALTER TABLE `alojamento`
  ADD CONSTRAINT `alojamento_ibfk_1` FOREIGN KEY (`cod_postal`) REFERENCES `codpostal` (`cod_postal`);

--
-- Limitadores para a tabela `alojamento_pacotes`
--
ALTER TABLE `alojamento_pacotes`
  ADD CONSTRAINT `alojamento_pacotes_ibfk_1` FOREIGN KEY (`cod_alojamento`) REFERENCES `alojamento` (`cod_alojamento`),
  ADD CONSTRAINT `alojamento_pacotes_ibfk_2` FOREIGN KEY (`cod_pacote`) REFERENCES `pacotes` (`cod_pacote`);

--
-- Limitadores para a tabela `atividades_pacotes`
--
ALTER TABLE `atividades_pacotes`
  ADD CONSTRAINT `atividades_pacotes_ibfk_1` FOREIGN KEY (`cod_atividade`) REFERENCES `atividades` (`cod_atividade`),
  ADD CONSTRAINT `atividades_pacotes_ibfk_2` FOREIGN KEY (`cod_pacote`) REFERENCES `pacotes` (`cod_pacote`);

--
-- Limitadores para a tabela `cidade_pacotes`
--
ALTER TABLE `cidade_pacotes`
  ADD CONSTRAINT `cidade_pacotes_ibfk_1` FOREIGN KEY (`cod_cidade`) REFERENCES `cidade` (`cod_cidade`),
  ADD CONSTRAINT `cidade_pacotes_ibfk_2` FOREIGN KEY (`cod_pacote`) REFERENCES `pacotes` (`cod_pacote`);

--
-- Limitadores para a tabela `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`cod_postal`) REFERENCES `codpostal` (`cod_postal`);

--
-- Limitadores para a tabela `cliente_reserva`
--
ALTER TABLE `cliente_reserva`
  ADD CONSTRAINT `cliente_reserva_ibfk_1` FOREIGN KEY (`num_cliente`) REFERENCES `cliente` (`num_cliente`),
  ADD CONSTRAINT `cliente_reserva_ibfk_2` FOREIGN KEY (`num_reserva`) REFERENCES `reserva` (`num_reserva`);

--
-- Limitadores para a tabela `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`num_pagamento`) REFERENCES `pagamento` (`num_pagamento`),
  ADD CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`num_funcionario`) REFERENCES `funcionario` (`num_funcionario`),
  ADD CONSTRAINT `reserva_ibfk_3` FOREIGN KEY (`cod_pacote`) REFERENCES `pacotes` (`cod_pacote`);

--
-- Limitadores para a tabela `telefone`
--
ALTER TABLE `telefone`
  ADD CONSTRAINT `telefone_ibfk_1` FOREIGN KEY (`num_cliente`) REFERENCES `cliente` (`num_cliente`);

--
-- Limitadores para a tabela `transporte_pacotes`
--
ALTER TABLE `transporte_pacotes`
  ADD CONSTRAINT `transporte_pacotes_ibfk_1` FOREIGN KEY (`cod_pacote`) REFERENCES `pacotes` (`cod_pacote`),
  ADD CONSTRAINT `transporte_pacotes_ibfk_2` FOREIGN KEY (`cod_transporte`) REFERENCES `transporte` (`cod_transporte`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
