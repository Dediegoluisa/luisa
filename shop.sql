-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-05-2024 a las 07:38:38
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `shop`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`, `imagen`, `estado`) VALUES
(7, 'ANALGÈSICO', '20231028024649.jpg', 1),
(8, 'ANTIBIÒTICOS', '20231028040329.jpg', 1),
(9, 'ANTICONCEPTIVO', '20231028045254.jpg', 1),
(10, 'ANSIOLITICO', '20231028045510.jpg', 0),
(11, 'ANTIDEPRESIVOS', '20231028045753.jpg', 1),
(12, 'ANTIINFLAMATORIO', '20231028050041.jpg', 1),
(13, 'ANTIVIRALES', '20231028050211.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `whatsapp` varchar(20) DEFAULT NULL,
  `direccion` varchar(255) NOT NULL,
  `host_smtp` varchar(100) NOT NULL,
  `user_smtp` varchar(100) NOT NULL,
  `pass_smtp` varchar(100) NOT NULL,
  `puerto_smtp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id`, `nombre`, `telefono`, `correo`, `whatsapp`, `direccion`, `host_smtp`, `user_smtp`, `pass_smtp`, `puerto_smtp`) VALUES
(1, 'FarmaSalud', '3115865714', 'bermudezluisa970@gmail.com', '3115865714', 'QUIBDO_CHOCO', 'smtp.gmail.com', 'luisa.farma1999@gmail.com', 'ikhnyjislfpyzhgj', 465);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ventas`
--

CREATE TABLE `detalle_ventas` (
  `id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `producto` varchar(255) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_ventas`
--

INSERT INTO `detalle_ventas` (`id`, `cantidad`, `precio`, `producto`, `id_producto`, `id_venta`) VALUES
(1, 1, 19.50, 'AGUA MICELAR NIVEA EFECTO MATE 400 mL', 40, 1),
(2, 1, 150.30, 'EFFACLAR MAT HIDRATANTE ROSTRO 40 mL', 41, 1),
(3, 1, 169.00, 'HELIOCARE 360 GEL OIL FREE FPS 50 50 mL', 42, 1),
(4, 1, 10.20, 'JABON ALTEX BARRA ANTIBRILLO 90 g', 39, 1),
(5, 1, 22.00, ' GEL RELAJANTE CON EXTRACTOS NATURALES DERMANAT 300 g', 32, 1),
(6, 1, 24.00, 'DOLOTRIN GEL TUBO 30 g', 31, 2),
(7, 1, 22.00, ' GEL RELAJANTE CON EXTRACTOS NATURALES DERMANAT 300 g', 32, 2),
(8, 1, 20.00, 'CYCLOFEMINA AMPOLLA + JERINGA', 26, 2),
(9, 1, 31.00, 'DEMTRIS UNGÜENTO 30 g', 28, 3),
(10, 1, 8.00, 'TRAZIDEX OFTENO 5 mL', 30, 3),
(11, 1, 15.00, 'Dolex', 45, 4),
(12, 1, 20.00, 'Lovastatina', 46, 4),
(13, 1, 12.00, 'Acetaminofén 500 mg ', 44, 4),
(14, 1, 10.00, 'Acetaminofen', 43, 4),
(15, 1, 26.00, 'HELIOCARE 360 GEL OIL FREE FPS 50 50 mL', 42, 5),
(16, 1, 15.00, 'EFFACLAR MAT HIDRATANTE ROSTRO 40 mL', 41, 5),
(17, 1, 19.00, 'AGUA MICELAR NIVEA EFECTO MATE 400 mL', 40, 5),
(18, 1, 10.00, 'JABON ALTEX BARRA ANTIBRILLO 90 g', 39, 5),
(19, 1, 26.00, 'HELIOCARE 360 GEL OIL FREE FPS 50 50 mL', 42, 6),
(20, 1, 15.00, 'EFFACLAR MAT HIDRATANTE ROSTRO 40 mL', 41, 6),
(21, 1, 19.00, 'AGUA MICELAR NIVEA EFECTO MATE 400 mL', 40, 6),
(22, 1, 10.00, 'JABON ALTEX BARRA ANTIBRILLO 90 g', 39, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `ventas` int(11) NOT NULL DEFAULT 0,
  `imagen` varchar(150) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `cantidad`, `ventas`, `imagen`, `estado`, `id_categoria`) VALUES
(8, 'IBUPROFENO', 'sirbebnsnjskj', 11.00, 100, 0, '20231028024805.jpg', 1, 7),
(9, 'AMOXICILINA 500 MG', 'La amoxicilina se usa para tratar ciertas infecciones causadas por bacterias, como la neumonía, la bronquitis (infección de las vías respiratorias que van a los pulmones) y las infecciones de los oídos, la nariz, la garganta, las vías urinarias y la piel.', 12.00, 200, 0, '20231028042110.jpg', 1, 8),
(10, 'AZITROMICINA', 'La azitromicina es un antibiótico de amplio espectro del grupo de macrólidos que actúa contra varias bacterias grampositivas y gramnegativas', 5.00, 50, 0, '20231028042449.jpg', 1, 8),
(11, 'CIPROFLOXACINO 500 mg', 'El ciprofloxacino​ es un antibiótico del grupo de las fluoroquinolonas con efectos bactericidas. Su modo de acción consiste en paralizar la replicación bacterial del ADN al unirse con una enzima llamada ADN girasa, que queda bloqueada', 16.00, 100, 0, '20231028042854.jpg', 1, 8),
(12, 'PENICILINA', '', 12.00, 150, 0, '20231028043219.jpg', 1, 8),
(13, 'DOXICILINA 100 mg', '', 2.50, 26, 0, '20231028043558.jpg', 1, 8),
(14, 'CLARITROMICINA  ', '', 9.50, 20, 0, '20231028044009.jpg', 1, 8),
(15, 'METONIDAZOL ', '', 10.00, 63, 0, '20231028044200.jpg', 1, 8),
(19, 'PARACETAMOL 500MG', 'Es un analgésico y antipirético eficaz para el control del dolor leve o moderado causado por afecciones articulares, otalgias, cefaleas, dolor odontogénico, neuralgias, procedimientos quirúrgicos menores etc.', 5.00, 400, 0, '20231029205433.jpg', 1, 7),
(20, 'NAPROXENO', 'El naproxeno es un medicamento antiinflamatorio no esteroideo que se emplea en el tratamiento del dolor leve a moderado, la fiebre, la inflamación y la rigidez provocados por afecciones como artrosis, artritis psoriásica, espondilitis anquilosante, tendinitis y bursitis', 12.00, 120, 0, '20231029205635.jpg', 1, 7),
(21, 'TRAMADOL', 'Es un analgésico opioide atípico que alivia el dolor actuando sobre células nerviosas específicas de la médula espinal y del cerebro.', 7.00, 200, 0, '20231029210542.jpg', 1, 7),
(22, 'MORFINA', 'La morfina pertenece a una clase de medicamentos llamados analgésicos opioides (narcóticos). Su acción consiste en cambiar la manera en que el cerebro y el sistema nervioso responden al dolor.', 19.00, 300, 0, '20231029211258.jpg', 1, 7),
(23, 'POSTDAY', 'Anticonceptivo de emergencia que puede evitar el embarazo siempre que sea utilizado dentro de las 72 horas después del coito sin protección.', 15.00, 320, 0, '20231029213608.jpg', 1, 9),
(24, ' today  Comparar producto PRESERVATIVO TODAY REAL SENSATION 3 UNIDADES', 'Un preservativo, profiláctico o condón es un dispositivo de barrera con forma de funda utilizado durante una relación sexual para reducir la probabilidad de embarazo o el contagio de infecciones de transmisión sexual.​ ', 10.00, 100, 0, '20231029214823.jpg', 1, 9),
(25, 'MICROGYNON FACE 21 TABLETAS', 'MICROGYNON FACE 2MG+0.03MG 21 TABLETAS', 43.00, 29, 0, '20231029215248.jpg', 1, 9),
(26, 'CYCLOFEMINA AMPOLLA + JERINGA', 'CYCLOFEMINA AMPOLLA + JERINGA\r\n\r\nPrincipio Activo: MEDROXIPROGESTERONA-CIPIONATO ESTRADIOL\r\n\r\nRegistro Sanitario: INVIMA 2016M-0011233-R1\r\n\r\nES UN MEDICAMENTO. NO EXCEDER SU CONSUMO. LEER INDICACIONES Y CONTRAINDICACIONES. SI LOS SÍNTOMAS PERSISTEN, CONSULTAR AL MÉDICO.', 20.00, 39, 1, '20231029215725.jpg', 1, 9),
(27, 'BELLAFACE® 21 TABLETAS', 'BELLAFACE® 21 TABLETAS\r\n\r\nPrincipio Activo: DIENOGEST-ETINILESTRADIOL\r\n\r\nRegistro Sanitario: INVIMA 2018M-0009470-R1\r\n\r\nES UN MEDICAMENTO. NO EXCEDER SU CONSUMO. LEER INDICACIONES Y CONTRAINDICACIONES. SI LOS SÍNTOMAS PERSISTEN, CONSULTAR AL MÉDICO.', 60.00, 123, 0, '20231029220536.jpg', 1, 9),
(28, 'DEMTRIS UNGÜENTO 30 g', 'DEMTRIS UNGÜENTO 30 g\r\n\r\nPrincipio Activo: NISTATINA-TRIAMCINOLONA\r\n\r\nRegistro Sanitario:\r\n\r\nES UN MEDICAMENTO. NO EXCEDER SU CONSUMO. LEER INDICACIONES Y CONTRAINDICACIONES. SI LOS SÍNTOMAS PERSISTEN, CONSULTAR AL MÉDICO.', 31.00, 36, 1, '20231029222231.jpg', 1, 11),
(29, 'CIPROFLOXACINO 500 mg 10 TABLETAS LA SANTE', 'CIPROFLOXACINO 500 mg 10 TABLETAS LA SANTE\r\n\r\nPrincipio Activo: CIPROFLOXACINA\r\n\r\nRegistro Sanitario: 2016M-0011422-R1\r\n\r\nPRODUCTOS DE PRESCRIPCIÓN MÉDICA. POR SU SEGURIDAD NO SE AUTOMEDIQUE.', 9.00, 78, 0, '20231029223057.jpg', 1, 11),
(30, 'TRAZIDEX OFTENO 5 mL', 'TRAZIDEX OFTENO 5 mL\r\n\r\nPrincipio Activo: TOBRAMICINA-DEXAMETASONA\r\n\r\nRegistro Sanitario:\r\n\r\nES UN MEDICAMENTO. NO EXCEDER SU CONSUMO. LEER INDICACIONES Y CONTRAINDICACIONES. SI LOS SÍNTOMAS PERSISTEN, CONSULTAR AL MÉDICO.', 8.00, 56, 1, '20231029223238.jpg', 1, 11),
(31, 'DOLOTRIN GEL TUBO 30 g', 'Antiinflamatorio tópico. Está indicado en el control del dolor en artritis, esguinces grado I y II, contracturas y espasmos musculares (lumbalgia, cervicalgia), traumatismos tipo contusión, antes y después de hacer ejercicio, tendinitis, bursitis, lesiones del manguito rotador y otras lesiones deportivas.', 24.00, 49, 1, '20231029223602.jpg', 1, 12),
(32, ' GEL RELAJANTE CON EXTRACTOS NATURALES DERMANAT 300 g', 'GEL RELAJANTE CON EXTRACTOS NATURALES DERMANAT 300 GR\r\n\r\nMezcla de extractos naturales con propiedades relajantes y anti-inflamatorias.\r\n\r\nActúa como relajante muscular, aliviando dolores y tensiones.\r\n\r\nHidrata y suaviza la piel.\r\n\r\nFacilita la circulación sanguínea.', 22.00, 454, 2, '20231029223733.jpg', 1, 12),
(33, 'ABSORB-K CLARIFICANTE 45 g FAGRON', 'CARACTERÍSTICAS\r\n• Absorb-K se constituye en un eficaz tratamiento para la prevención de hematomas en cirugía dermatológica y estética.\r\n\r\nBENEFICIOS:\r\n• Acelera la resolución de la extravasación sanguínea, gracias a sus principales componentes. Contiene Árnica más Caléndula, que brindan sus propiedades antiinflamatorias, descongestionantes y tonificantes.\r\n\r\n• Gracias a la presencia de ADN vegetal, vitamina E y alantoína, se refuerza la acción antiinflamatoria y antioxidante.', 17.00, 65, 0, '20231029223953.jpg', 1, 12),
(38, 'NEODOLAREN GEL TOPICO 45 g', 'NEODOLAREN GEL TOPICO 45 g\r\n\r\nPrincipio Activo:\r\n\r\nRegistro Sanitario:\r\n\r\nES UN MEDICAMENTO. NO EXCEDER SU CONSUMO. LEER INDICACIONES Y CONTRAINDICACIONES. SI LOS SÍNTOMAS PERSISTEN, CONSULTAR AL MÉDICO.', 30.00, 56, 0, '20231029224627.jpg', 1, 12),
(39, 'JABON ALTEX BARRA ANTIBRILLO 90 g', 'JABON ALTEX BARRA ANTIBRILLO 90 g\r\n\r\nCon Extracto Natural de Árbol de Te.\r\n\r\nLimpia profundamente y elimina el exceso de grasa.', 10.00, 97, 3, '20231029224827.jpg', 1, 13),
(40, 'AGUA MICELAR NIVEA EFECTO MATE 400 mL', 'AGUA MICELAR NIVEA EFECTO MATE 400ML\r\n\r\nLas micelas funcionan como un imán que atrapa eficientemente el maquillaje ligero a base de agua, suciedad y grasa.\r\n\r\nSu efectiva fórmula puede ser utilizada en cara, ojos y labios. Sin perfume. Suave con las pestañas.', 19.00, 20, 3, '20231029225139.jpg', 1, 13),
(41, 'EFFACLAR MAT HIDRATANTE ROSTRO 40 mL', 'EFFACLAR MAT HIDRATANTE ROSTRO 40 mL\r\n\r\nHIDRATANTE SEBO-REGULADORA MATIFICANTE. ANTI-BRILLO, ANTI-POROS DILATADOS.\r\n\r\nReduce los poros y el flujo de sebo, manteniendo la piel mate. Ideal para piel grasa con brillo persistente.\r\n\r\nTEXTURA Y APLICACIÓN\r\n\r\nAplicar por la mañana o por la noche en todo el rostro. Evitar el contorno de los ojos. Excelente base de maquillaje.', 15.00, 47, 3, '20231029225312.jpg', 1, 13),
(42, 'HELIOCARE 360 GEL OIL FREE FPS 50 50 mL', 'HELIOCARE 360 GEL OIL FREE FPS 50 50 mL\r\n\r\nIncorpora una importante novedad dirigida a las pieles grasas, con el lanzamiento de su fórmula en gel con doble sistema antibrillos por su acción seborreguladora y matificante. Brinda un factor de protección 50, con una cobertura completa frente a las radiaciones conocidas: UVB, UVA, IR-A y Radiación Visible. Su fórmula con la tecnología desarrollada por IFC,Fernblock, proporciona adicionalmente un potente sistema antioxidante, además de reparar del daño celular por sus roxisomas añadidos.', 26.00, 4, 3, '20231029225439.jpg', 1, 13),
(43, 'Acetaminofen', '', 10.00, 1999, 1, '20240526055528.jpg', 1, 7),
(44, 'Acetaminofén 500 mg ', '', 12.00, 999, 1, '20240526055637.jpg', 1, 7),
(45, 'Dolex', '', 15.00, 399, 1, '20240526055735.jpg', 1, 7),
(46, 'Lovastatina', '', 20.00, 3999, 1, '20240526055818.jpg', 1, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE `tipo` (
  `id` int(11) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `clave` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`id`, `correo`, `nombre`, `tipo`, `clave`) VALUES
(1, 'a@gmail.com', 'hernan', 'administrador', '12312'),
(2, '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `correo` varchar(150) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `clave` varchar(100) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `tipo` int(11) NOT NULL,
  `perfil` varchar(100) DEFAULT NULL,
  `verify` int(11) NOT NULL DEFAULT 0,
  `token` varchar(100) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `correo`, `nombre`, `apellido`, `clave`, `direccion`, `tipo`, `perfil`, `verify`, `token`, `estado`) VALUES
(1, 'ana.info1999@gmail.com', 'admin', 'ADMINISTRADOR', '$2y$10$YJPEpg7HtOh4dkGwyi2HeeZokS6oJcwi4ttaav/pSDecXaXyuFIGi', 'Colombia', 1, NULL, 0, NULL, 1),
(5, 'info@gmail.com', 'Ana Lopez', NULL, '$2y$10$IU0DrPBACYGug8YsXmKZyONddMoPawVy0XoRqSmW90Tqh7GEHfHD.', NULL, 2, NULL, 0, NULL, 1),
(6, 'yuli@gmail.com', 'Yuli Lopez', NULL, '$2y$10$1Q3quBslnwBhbuQ1QLJlPOfe92s57H94769tfr2G.YYUL.a8BC132', NULL, 2, NULL, 0, NULL, 1),
(7, 'yuliasencios@gmail.com', 'Yuli Asencios', NULL, '$2y$10$m68Aty7PfV8Rr5uak01byOoh6tZJucKn7W8Vx4UuLPRZGNhzMmqcu', NULL, 2, NULL, 0, NULL, 0),
(8, 'yampier19es@gmail.com', 'oscar', NULL, '$2y$10$DznN1c/FoYXtE4.5FzCWNuoOdj88splT9B66GJLvw5jTaSH3CueEi', NULL, 2, NULL, 0, NULL, 1),
(9, 'andresramos@gmail.com', 'admin', 'administrador', '$2y$10$v6q6YmQkvXgUrWYJB2f5/eK9wYsNC2HZwyyEt7cAL5XTvOBZO8tWC', 'bolivia', 1, NULL, 0, NULL, 1),
(10, 'virgo13alexa@gmail.com', 'Andrea', NULL, '$2y$10$nslhkvepnIn3.X6wn32Yy.lm9IEUTQRqQGbseDrE/YFdJrH/QjZJ2', NULL, 2, NULL, 0, NULL, 1),
(11, 'fernanda@gmail.com', 'LUISA', NULL, '$2y$10$N9CJ/3udXdPk3QOMd81JxuI7NUYLzB3UGx.l6CWt.7JmPprDIvjA6', NULL, 2, NULL, 0, NULL, 1),
(12, 'cordoba lopez', 'fidel', NULL, '$2y$10$IXeUJp08LGukhI5KKibNeeoz4tGMNFuci7GIwhumGNi5/gClrOU2m', NULL, 2, NULL, 0, NULL, 1),
(13, 'fenanda@gmail.com', 'luisa', NULL, '$2y$10$LwyAUvXp9NcZwMhboYs8Re4WytjhvsAHzvxVMDbytWDzIyiGTc/QW', NULL, 2, NULL, 0, NULL, 1),
(14, 'hggg', 'felife', NULL, '$2y$10$mpIUJvhKNOywIx97vSMSjeYKWv5YT1lqPumwOEqrF6awH4NRWn3lu', NULL, 2, NULL, 0, NULL, 1),
(15, 'fernanda@10', 'fernanda', NULL, '$2y$10$aN/.k5Thx1046X/rnm0I4e2Cd3gKG1OkDRRNPhGXov2ayUnMVjvGW', NULL, 2, NULL, 0, NULL, 1),
(16, 'hernanchito.sm@gmail.com', 'hernan', 'sanchez', '$2y$10$OGQ.HUjHFdRZmrPy7hQQ8us8MFqKaj3eJjrIuEVr10V/gz/qfTrHa', 'calle26a#14-21', 1, NULL, 0, NULL, 1),
(17, 'bermudezluisa970@gmail.com', 'LUISA', 'BERMUDEZ', '$2y$10$rbeQpDKupU8PNANbRR5ZIeskDkeHAkqOIRWc5.UqHOCgORHPauicC', 'B// POBLADO', 1, NULL, 0, NULL, 1),
(18, 'fidel10@gmail.com', 'fidel', NULL, '$2y$10$5JudC6vTAZ6RWF9zvjFtlOnBwtgO/9uTVrAr/boWfU0BIKpIRSlGK', NULL, 2, NULL, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `transaccion` varchar(100) DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `pago` decimal(10,2) NOT NULL DEFAULT 0.00,
  `nombre` varchar(150) DEFAULT NULL,
  `apellido` varchar(150) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL,
  `cod` varchar(20) DEFAULT NULL,
  `envio` decimal(10,2) DEFAULT 0.00,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `proceso` int(11) NOT NULL DEFAULT 1,
  `tipo` int(11) NOT NULL DEFAULT 1,
  `estado` int(11) NOT NULL DEFAULT 1,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `transaccion`, `total`, `pago`, `nombre`, `apellido`, `direccion`, `telefono`, `ciudad`, `pais`, `cod`, `envio`, `fecha`, `proceso`, `tipo`, `estado`, `id_usuario`) VALUES
(4, '13N18783F3349041A', 57.00, 0.00, 'LUISA', 'BERMUDEZ', 'POBLADO', '312323', 'CALI', 'COLOMBIA', '2344', 0.00, '2024-05-26 05:20:53', 1, 1, 1, 17),
(5, '143148075C999250U', 70.00, 0.00, 'fer', 'dediego', 'medrano', '32212', 'cali', 'colombia', '2233', 0.00, '2024-05-26 05:26:01', 2, 1, 1, 15),
(6, '1NM135209L841780D', 70.00, 0.00, 'jj', 'njn', 'mm', '32234', 'kkk', 'jjjj', '5656', 0.00, '2024-05-26 05:34:16', 1, 1, 1, 15);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_venta` (`id_venta`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `tipo`
--
ALTER TABLE `tipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
