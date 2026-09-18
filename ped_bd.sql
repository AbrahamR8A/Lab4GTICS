DROP DATABASE IF EXISTS pet_adoption;
CREATE DATABASE pet_adoption;
USE pet_adoption;

-- ============================================================
-- 1. SHELTERS: refugios donde se encuentran las mascotas
-- ============================================================
CREATE TABLE shelters (
    shelter_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    address VARCHAR(100) NOT NULL,
    city VARCHAR(40) NOT NULL,
    phone VARCHAR(20) NOT NULL
);

-- ============================================================
-- 2. SPECIES: catálogo de especies
-- ============================================================
CREATE TABLE species (
    species_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    description VARCHAR(120)
);

-- ============================================================
-- 3. PETS: mascotas disponibles para adopción
-- ============================================================
CREATE TABLE pets (
    pet_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    breed VARCHAR(40) NOT NULL,
    age INT NOT NULL,
    sex VARCHAR(10) NOT NULL,
    size VARCHAR(15) NOT NULL,
    status VARCHAR(20) NOT NULL,
    admission_date DATE NOT NULL,
    species_id INT NOT NULL,
    shelter_id INT NOT NULL,
    CONSTRAINT fk_pet_species
        FOREIGN KEY (species_id) REFERENCES species(species_id),
    CONSTRAINT fk_pet_shelter
        FOREIGN KEY (shelter_id) REFERENCES shelters(shelter_id)
);

-- ============================================================
-- 4. ADOPTERS: personas interesadas en adoptar
-- ============================================================
CREATE TABLE adopters (
    adopter_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    email VARCHAR(80) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    city VARCHAR(40) NOT NULL
);

-- ============================================================
-- 5. ADOPTIONS: registro de adopciones
-- ============================================================
CREATE TABLE adoptions (
    adoption_id INT AUTO_INCREMENT PRIMARY KEY,
    adopter_id INT NOT NULL,
    pet_id INT NOT NULL,
    adoption_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    notes VARCHAR(255),
    CONSTRAINT fk_adoption_adopter
        FOREIGN KEY (adopter_id) REFERENCES adopters(adopter_id),
    CONSTRAINT fk_adoption_pet
        FOREIGN KEY (pet_id) REFERENCES pets(pet_id),
    CONSTRAINT uq_adopted_pet UNIQUE (pet_id)
);

-- ============================================================
-- 6. VETERINARIANS: veterinarios que atienden a las mascotas
-- ============================================================
CREATE TABLE veterinarians (
    veterinarian_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    specialty VARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL
);

-- ============================================================
-- 7. MEDICAL_RECORDS: historial médico de cada mascota
-- ============================================================
CREATE TABLE medical_records (
    medical_record_id INT AUTO_INCREMENT PRIMARY KEY,
    pet_id INT NOT NULL,
    veterinarian_id INT NOT NULL,
    visit_date DATE NOT NULL,
    diagnosis VARCHAR(100) NOT NULL,
    treatment VARCHAR(150),
    weight DECIMAL(5,2),
    notes VARCHAR(255),
    CONSTRAINT fk_medical_pet
        FOREIGN KEY (pet_id) REFERENCES pets(pet_id),
    CONSTRAINT fk_medical_veterinarian
        FOREIGN KEY (veterinarian_id) REFERENCES veterinarians(veterinarian_id)
);

-- ============================================================
-- DATA: SHELTERS
-- ============================================================
INSERT INTO shelters (name, address, city, phone) VALUES
('Refugio Huellas de Esperanza', 'Av. Los Olivos 125', 'Lima', '987100201'),
('Casa Animal Sur', 'Jr. Las Flores 480', 'Surco', '986100202'),
('Refugio Patitas Felices', 'Av. Los Cedros 920', 'San Miguel', '985100203'),
('Hogar Cuatro Patas', 'Calle Los Pinos 315', 'La Molina', '984100204');

-- ============================================================
-- DATA: SPECIES
-- ============================================================
INSERT INTO species (name, description) VALUES
('Perro', 'Perros de diferentes tamaños y razas'),
('Gato', 'Gatos domésticos y mestizos'),
('Conejo', 'Conejos domésticos'),
('Cobaya', 'Cobayas o cuyos domésticos');

-- ============================================================
-- DATA: ADOPTERS
-- ============================================================
INSERT INTO adopters (first_name, last_name, email, phone, city) VALUES
('Ana', 'Torres', 'ana.torres@email.com', '987654321', 'Lima'),
('Carlos', 'Mendoza', 'carlos.mendoza@email.com', '986321547', 'Surco'),
('Lucia', 'Ramirez', 'lucia.ramirez@email.com', '985741236', 'Miraflores'),
('Diego', 'Salazar', 'diego.salazar@email.com', '984123765', 'San Miguel'),
('Mariana', 'Vega', 'mariana.vega@email.com', '983456712', 'La Molina'),
('Jorge', 'Castillo', 'jorge.castillo@email.com', '982765431', 'Barranco'),
('Valeria', 'Flores', 'valeria.flores@email.com', '981234567', 'San Borja'),
('Andres', 'Navarro', 'andres.navarro@email.com', '980876543', 'Chorrillos'),
('Sofia', 'Paredes', 'sofia.paredes@email.com', '979123456', 'Pueblo Libre'),
('Miguel', 'Herrera', 'miguel.herrera@email.com', '978654123', 'Magdalena');

-- ============================================================
-- DATA: VETERINARIANS
-- ============================================================
INSERT INTO veterinarians (first_name, last_name, specialty, phone) VALUES
('Patricia', 'Rojas', 'Medicina general', '977100301'),
('Fernando', 'Quispe', 'Medicina interna', '976100302'),
('Elena', 'Vargas', 'Dermatologia veterinaria', '975100303'),
('Ricardo', 'Molina', 'Cirugia veterinaria', '974100304'),
('Camila', 'Santos', 'Medicina felina', '973100305');

-- ============================================================
-- DATA: PETS
-- ============================================================
INSERT INTO pets
(name, breed, age, sex, size, status, admission_date, species_id, shelter_id)
VALUES
('Luna', 'Labrador mestizo', 2, 'Hembra', 'Mediana', 'Disponible', '2026-01-12', 1, 1),
('Max', 'Golden Retriever', 4, 'Macho', 'Grande', 'Adoptado', '2025-11-08', 1, 2),
('Milo', 'Europeo mestizo', 1, 'Macho', 'Pequena', 'Disponible', '2026-02-03', 2, 1),
('Nala', 'Siames', 3, 'Hembra', 'Pequena', 'Adoptado', '2025-10-19', 2, 3),
('Rocky', 'Beagle', 5, 'Macho', 'Mediana', 'Disponible', '2026-01-25', 1, 2),
('Coco', 'Mini Rex', 2, 'Hembra', 'Pequena', 'Disponible', '2026-02-14', 3, 4),
('Simba', 'Atigrado', 2, 'Macho', 'Pequena', 'Disponible', '2026-03-01', 2, 1),
('Kira', 'Pastor mestizo', 1, 'Hembra', 'Grande', 'Adoptado', '2025-12-10', 1, 3),
('Bruno', 'Cocker Spaniel', 6, 'Macho', 'Mediana', 'Disponible', '2026-02-20', 1, 2),
('Mia', 'Angora', 4, 'Hembra', 'Pequena', 'Disponible', '2026-03-05', 2, 4),
('Toby', 'Pug', 3, 'Macho', 'Pequena', 'Disponible', '2026-03-10', 1, 3),
('Canela', 'Mestizo', 2, 'Hembra', 'Mediana', 'Disponible', '2026-03-15', 1, 1),
('Oliver', 'British Shorthair', 3, 'Macho', 'Pequena', 'Disponible', '2026-03-18', 2, 4),
('Pelusa', 'Cobaya americana', 1, 'Hembra', 'Pequena', 'Disponible', '2026-03-20', 4, 4),
('Thor', 'Labrador mestizo', 3, 'Macho', 'Grande', 'Disponible', '2026-03-22', 1, 2);

-- ============================================================
-- DATA: ADOPTIONS
-- ============================================================
INSERT INTO adoptions
(adopter_id, pet_id, adoption_date, status, notes)
VALUES
(2, 2, '2026-01-05', 'Completada', 'Adaptacion favorable en el hogar.'),
(1, 4, '2025-12-01', 'Completada', 'Adopcion realizada sin observaciones.'),
(5, 8, '2026-01-20', 'Completada', 'Cuenta con patio y experiencia previa.');

-- ============================================================
-- DATA: MEDICAL RECORDS
-- ============================================================
INSERT INTO medical_records
(pet_id, veterinarian_id, visit_date, diagnosis, treatment, weight, notes)
VALUES
(1, 1, '2026-01-15', 'Buen estado general', 'Desparasitacion interna', 18.50, 'Control inicial.'),
(1, 2, '2026-02-15', 'Estado saludable', 'Vacunacion anual', 19.10, 'Sin complicaciones.'),
(2, 1, '2025-11-10', 'Dermatitis leve', 'Tratamiento topico', 28.40, 'Revisar en 30 dias.'),
(3, 5, '2026-02-05', 'Buen estado general', 'Desparasitacion', 3.20, 'Gato activo.'),
(4, 5, '2025-10-22', 'Estado saludable', 'Vacunacion', 3.80, 'Control previo a adopcion.'),
(5, 4, '2026-01-27', 'Dolor muscular', 'Reposo y analgesico', 12.70, 'Evitar actividad intensa.'),
(6, 1, '2026-02-16', 'Buen estado general', 'Corte de uñas', 1.80, 'Sin observaciones.'),
(7, 5, '2026-03-03', 'Estado saludable', 'Vacunacion', 4.10, 'Control anual.'),
(8, 1, '2025-12-12', 'Buen estado general', 'Desparasitacion', 24.60, 'Apto para adopcion.'),
(9, 2, '2026-02-22', 'Otitis leve', 'Limpieza y gotas', 13.90, 'Control en dos semanas.'),
(10, 3, '2026-03-07', 'Alergia cutanea', 'Tratamiento dermatologico', 4.20, 'Mejora esperada.'),
(11, 1, '2026-03-12', 'Buen estado general', 'Vacunacion', 7.60, 'Sin observaciones.'),
(12, 1, '2026-03-17', 'Buen estado general', 'Desparasitacion', 15.20, 'Apto para adopcion.'),
(13, 5, '2026-03-20', 'Buen estado general', 'Control preventivo', 4.80, 'Gato saludable.'),
(14, 1, '2026-03-21', 'Buen estado general', 'Control preventivo', 0.95, 'Alimentacion adecuada.'),
(15, 2, '2026-03-23', 'Sobrepeso leve', 'Plan alimenticio', 31.20, 'Control mensual.');

