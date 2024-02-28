-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.1.13-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para systemtcc
CREATE DATABASE IF NOT EXISTS `systemtcc` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `systemtcc`;

-- Copiando estrutura para tabela systemtcc.eletrica
CREATE TABLE IF NOT EXISTS `eletrica` (
  `cod_eletrica` int(11) NOT NULL AUTO_INCREMENT,
  `voltagem` int(11) NOT NULL DEFAULT '0',
  `comodo` varchar(50) DEFAULT NULL,
  `tempo` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_eletrica`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela systemtcc.eletrica: ~0 rows (aproximadamente)
DELETE FROM `eletrica`;
/*!40000 ALTER TABLE `eletrica` DISABLE KEYS */;
INSERT INTO `eletrica` (`cod_eletrica`, `voltagem`, `comodo`, `tempo`) VALUES
	(1, 110, NULL, NULL);
/*!40000 ALTER TABLE `eletrica` ENABLE KEYS */;

-- Copiando estrutura para tabela systemtcc.gas
CREATE TABLE IF NOT EXISTS `gas` (
  `cod_gas` int(11) NOT NULL AUTO_INCREMENT,
  `deteccao` varchar(100) NOT NULL DEFAULT '0',
  `comodo` varchar(50) NOT NULL DEFAULT '0',
  `tempo` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_gas`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela systemtcc.gas: ~0 rows (aproximadamente)
DELETE FROM `gas`;
/*!40000 ALTER TABLE `gas` DISABLE KEYS */;
INSERT INTO `gas` (`cod_gas`, `deteccao`, `comodo`, `tempo`) VALUES
	(3, 'vazamento', '0', NULL);
/*!40000 ALTER TABLE `gas` ENABLE KEYS */;

-- Copiando estrutura para tabela systemtcc.incendio
CREATE TABLE IF NOT EXISTS `incendio` (
  `cod_incendio` int(11) NOT NULL AUTO_INCREMENT,
  `temperatura` double NOT NULL DEFAULT '0',
  `comodo` varchar(50) DEFAULT NULL,
  `tempo` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_incendio`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela systemtcc.incendio: ~2 rows (aproximadamente)
DELETE FROM `incendio`;
/*!40000 ALTER TABLE `incendio` DISABLE KEYS */;
INSERT INTO `incendio` (`cod_incendio`, `temperatura`, `comodo`, `tempo`) VALUES
	(1, 30, NULL, '2023-09-14 11:30:00');
/*!40000 ALTER TABLE `incendio` ENABLE KEYS */;

-- Copiando estrutura para tabela systemtcc.proximidade
CREATE TABLE IF NOT EXISTS `proximidade` (
  `cod_proximidade` int(11) NOT NULL AUTO_INCREMENT,
  `deteccao` varchar(50) NOT NULL DEFAULT '0',
  `comodo` varchar(50) DEFAULT NULL,
  `tempo` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_proximidade`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela systemtcc.proximidade: ~0 rows (aproximadamente)
DELETE FROM `proximidade`;
/*!40000 ALTER TABLE `proximidade` DISABLE KEYS */;
INSERT INTO `proximidade` (`cod_proximidade`, `deteccao`, `comodo`, `tempo`) VALUES
	(2, 'detectado', NULL, NULL);
/*!40000 ALTER TABLE `proximidade` ENABLE KEYS */;

-- Copiando estrutura para tabela systemtcc.registros
CREATE TABLE IF NOT EXISTS `registros` (
  `cod_registro` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) NOT NULL DEFAULT '0',
  `mensagem` varchar(100) NOT NULL DEFAULT '0',
  `descricao` varchar(100) NOT NULL DEFAULT '0',
  `tempo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reg_gas_cod` int(11) DEFAULT NULL,
  `reg_incendio_cod` int(11) DEFAULT NULL,
  `reg_proximidade_cod` int(11) DEFAULT NULL,
  `reg_eletrica_cod` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_registro`),
  KEY `FK_registros_gas` (`reg_gas_cod`),
  KEY `FK_registros_proximidade` (`reg_proximidade_cod`),
  KEY `FK_registros_incendio` (`reg_incendio_cod`),
  KEY `FK_registros_eletrica` (`reg_eletrica_cod`),
  CONSTRAINT `FK_registros_eletrica` FOREIGN KEY (`reg_eletrica_cod`) REFERENCES `eletrica` (`cod_eletrica`),
  CONSTRAINT `FK_registros_gas` FOREIGN KEY (`reg_gas_cod`) REFERENCES `gas` (`cod_gas`),
  CONSTRAINT `FK_registros_incendio` FOREIGN KEY (`reg_incendio_cod`) REFERENCES `incendio` (`cod_incendio`),
  CONSTRAINT `FK_registros_proximidade` FOREIGN KEY (`reg_proximidade_cod`) REFERENCES `proximidade` (`cod_proximidade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela systemtcc.registros: ~0 rows (aproximadamente)
DELETE FROM `registros`;
/*!40000 ALTER TABLE `registros` DISABLE KEYS */;
/*!40000 ALTER TABLE `registros` ENABLE KEYS */;

-- Copiando estrutura para tabela systemtcc.residencia
CREATE TABLE IF NOT EXISTS `residencia` (
  `cod_residencia` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `rua` varchar(50) DEFAULT NULL,
  `tempo` datetime DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `comodos` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cod_residencia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela systemtcc.residencia: ~0 rows (aproximadamente)
DELETE FROM `residencia`;
/*!40000 ALTER TABLE `residencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `residencia` ENABLE KEYS */;

-- Copiando estrutura para tabela systemtcc.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `cod_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `cpf` int(20) NOT NULL DEFAULT '0',
  `nome` varchar(50) NOT NULL DEFAULT '0',
  `senha` int(11) NOT NULL DEFAULT '0',
  `telefone` int(11) NOT NULL DEFAULT '0',
  `estado` varchar(50) NOT NULL DEFAULT '0',
  `cidade` varchar(50) NOT NULL DEFAULT '0',
  `bairro` varchar(50) NOT NULL DEFAULT '0',
  `rua` varchar(50) NOT NULL DEFAULT '0',
  `numero` int(11) NOT NULL DEFAULT '0',
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cod_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela systemtcc.usuario: ~0 rows (aproximadamente)
DELETE FROM `usuario`;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`cod_usuario`, `cpf`, `nome`, `senha`, `telefone`, `estado`, `cidade`, `bairro`, `rua`, `numero`, `email`) VALUES
	(1, 56456, 'taks', 123, 45454, 'sp', 'regis', 'asdasd', 'asdasd', 0, 'tak@');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
