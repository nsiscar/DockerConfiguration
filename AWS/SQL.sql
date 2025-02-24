CREATE TABLE IF NOT EXISTS `viviendas` (
  `id` char(36) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detalle` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_ocupacion` tinyint(1) NOT NULL DEFAULT 0,
  `costo` decimal(10,2) NOT NULL,
  `num_habitaciones` int DEFAULT NULL,
  `tipo_propiedad` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DELETE FROM `viviendas`;
INSERT INTO `viviendas` (`id`, `nombre`, `detalle`, `direccion`, `estado_ocupacion`, `costo`, `num_habitaciones`, `tipo_propiedad`) VALUES
  ('uuid-1', 'Departamento Central', 'Amplio departamento de 3 habitaciones', 'Calle Mayor 10, 2B', 0, 1050.00, 3, 'Apartamento'),
  ('uuid-2', 'Loft Moderno', 'Pequeño pero acogedor, ideal para una persona', 'Avenida Libertad 45, 1A', 0, 600.00, 1, 'Loft');

CREATE TABLE IF NOT EXISTS `clientes` (
  `id` char(36) NOT NULL,
  `clave_api` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DELETE FROM `clientes`;
INSERT INTO `clientes` (`id`, `clave_api`) VALUES
  ('uuid-3', 'abcd-5678-efgh-1234');

CREATE TABLE IF NOT EXISTS `fotos_propiedad` (
  `id` char(36) NOT NULL,
  `vivienda_id` char(36) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_VIVIENDA_ID` (`vivienda_id`),
  CONSTRAINT `FK_FOTOS_VIVIENDA` FOREIGN KEY (`vivienda_id`) REFERENCES `viviendas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DELETE FROM `fotos_propiedad`;
INSERT INTO `fotos_propiedad` (`id`, `vivienda_id`, `url`) VALUES
  ('uuid-4', 'uuid-1', 'https://example.com/imagen1.jpg'),
  ('uuid-5', 'uuid-2', 'https://example.com/imagen2.jpg');

CREATE TABLE IF NOT EXISTS `alquileres` (
  `id` char(36) NOT NULL,
  `vivienda_id` char(36) NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime NOT NULL,
  `cancelada` tinyint(1) NOT NULL DEFAULT 0,
  `fecha_cancelacion` datetime DEFAULT NULL,
  `contacto_reserva` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_ALQUILER_VIVIENDA` (`vivienda_id`),
  CONSTRAINT `FK_ALQUILER_VIVIENDA` FOREIGN KEY (`vivienda_id`) REFERENCES `viviendas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DELETE FROM `alquileres`;
INSERT INTO `alquileres` (`id`, `vivienda_id`, `fecha_inicio`, `fecha_fin`, `cancelada`, `fecha_cancelacion`, `contacto_reserva`) VALUES
  ('uuid-6', 'uuid-1', '2025-02-10 14:00:00', '2025-02-15 12:00:00', 0, NULL, 'maria.lopez@example.com');
