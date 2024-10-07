-- Tabla car_innovacion
CREATE TABLE knowledge_map_db.car_innovacion (
  id INT NOT NULL PRIMARY KEY,
  nombre NVARCHAR(45) NOT NULL,
  descripcion NVARCHAR(MAX) NOT NULL,
  tipo NVARCHAR(45) NOT NULL
);


-- Tabla programa_ci
CREATE TABLE knowledge_map_db.programa_ci (
  programa INT NOT NULL,
  car_innovacion INT NOT NULL,
  PRIMARY KEY (programa, car_innovacion),
  CONSTRAINT fk_programa_ci_programa FOREIGN KEY (programa)
    REFERENCES knowledge_map_db.programa (id)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_programa_ci_car_innovacion FOREIGN KEY (car_innovacion)
    REFERENCES knowledge_map_db.car_innovacion (id)
    ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- Tabla practica_estrategia
CREATE TABLE knowledge_map_db.practica_estrategia (
  id INT NOT NULL PRIMARY KEY,
  tipo NVARCHAR(45) NOT NULL,
  nombre NVARCHAR(45) NOT NULL,
  descripcion NVARCHAR(45) NOT NULL
);

-- Tabla enfoque
CREATE TABLE knowledge_map_db.enfoque (
  id INT NOT NULL PRIMARY KEY,
  nombre NVARCHAR(45) NOT NULL,
  descripcion NVARCHAR(45) NOT NULL
);


-- Tabla enfoque_rc
CREATE TABLE knowledge_map_db.enfoque_rc (
  enfoque INT NOT NULL,
  registro_calificado INT NOT NULL,
  PRIMARY KEY (enfoque, registro_calificado),
  CONSTRAINT fk_enfoque_rc_enfoque FOREIGN KEY (enfoque)
    REFERENCES knowledge_map_db.enfoque (id)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_enfoque_rc_registro_calificado FOREIGN KEY (registro_calificado)
    REFERENCES knowledge_map_db.registro_calificado (codigo)
    ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- Tabla aspecto_normativo
CREATE TABLE knowledge_map_db.aspecto_normativo (
  id INT NOT NULL PRIMARY KEY,
  tipo NVARCHAR(45) NOT NULL,
  descripcion NVARCHAR(45) NOT NULL,
  fuente NVARCHAR(45) NOT NULL
);


-- Tabla an_programa
CREATE TABLE knowledge_map_db.an_programa (
  aspecto_normativo INT NOT NULL,
  programa INT NOT NULL,
  PRIMARY KEY (aspecto_normativo, programa),
  CONSTRAINT fk_an_programa_aspecto_normativo FOREIGN KEY (aspecto_normativo)
    REFERENCES knowledge_map_db.aspecto_normativo (id)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_an_programa_programa FOREIGN KEY (programa)
    REFERENCES knowledge_map_db.programa (id)
    ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- Tabla programa_pe
CREATE TABLE knowledge_map_db.programa_pe (
  programa INT NOT NULL,
  practica_estrategia INT NOT NULL,
  PRIMARY KEY (programa, practica_estrategia),
  CONSTRAINT fk_programa_pe_programa FOREIGN KEY (programa)
    REFERENCES knowledge_map_db.programa (id)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_programa_pe_practica_estrategia FOREIGN KEY (practica_estrategia)
    REFERENCES knowledge_map_db.practica_estrategia (id)
    ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- Tabla aa_rc
CREATE TABLE knowledge_map_db.aa_rc (
  activ_academicas_idcurso INT NOT NULL,
  registro_calificado_codigo INT NOT NULL,
  componente NVARCHAR(45) NOT NULL,
  semestre NVARCHAR(45) NOT NULL,
  PRIMARY KEY (activ_academicas_idcurso, registro_calificado_codigo),
  CONSTRAINT fk_aa_rc_activ_academica FOREIGN KEY (activ_academicas_idcurso)
    REFERENCES knowledge_map_db.activ_academica (id)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_aa_rc_registro_calificado FOREIGN KEY (registro_calificado_codigo)
    REFERENCES knowledge_map_db.registro_calificado (codigo)
    ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- Tabla premio
CREATE TABLE knowledge_map_db.premio (
  id INT NOT NULL PRIMARY KEY,
  nombre NVARCHAR(45) NOT NULL,
  descripcion NVARCHAR(45) NOT NULL,
  fecha DATE NOT NULL,
  entidad_otorgante NVARCHAR(45) NOT NULL,
  pais NVARCHAR(45) NOT NULL,
  programa INT NOT NULL,
  CONSTRAINT fk_premio_programa FOREIGN KEY (programa)
    REFERENCES knowledge_map_db.programa (id)
    ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- Tabla activ_academica
CREATE TABLE knowledge_map_db.activ_academica (
  id INT NOT NULL PRIMARY KEY,
  nombre NVARCHAR(45) NOT NULL,
  num_creditos INT NOT NULL,
  tipo NVARCHAR(20) NOT NULL,
  area_formacion NVARCHAR(45) NOT NULL,
  h_acom INT NOT NULL,
  h_indep INT NOT NULL,
  idioma NVARCHAR(45) NOT NULL,
  espejo BIT NOT NULL,
  entidad_espejo NVARCHAR(45) NOT NULL,
  pais_espejo NVARCHAR(45) NOT NULL,
  disenio INT NULL,
  CONSTRAINT fk_activ_academicas_programa FOREIGN KEY (disenio)
    REFERENCES knowledge_map_db.programa (id)
    ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- Tabla registro_calificado
CREATE TABLE knowledge_map_db.registro_calificado (
  codigo INT NOT NULL PRIMARY KEY,
  cant_creditos NVARCHAR(45) NOT NULL,
  hora_acom NVARCHAR(45) NOT NULL,
  hora_ind NVARCHAR(45) NOT NULL,
  metodologia NVARCHAR(45) NOT NULL,
  fecha_inicio DATE NOT NULL,
  fecha_fin DATE NOT NULL,
  duracion_anios NVARCHAR(45) NOT NULL,
  duracion_semestres NVARCHAR(45) NOT NULL,
  tipo_titulacion NVARCHAR(45) NOT NULL,
  programa INT NOT NULL,
  CONSTRAINT fk_registro_calificado_programa FOREIGN KEY (programa)
    REFERENCES knowledge_map_db.programa (id)
    ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- Tabla acreditacion
CREATE TABLE knowledge_map_db.acreditacion (
  resolucion INT NOT NULL PRIMARY KEY,
  tipo NVARCHAR(45) NOT NULL,
  calificacion NVARCHAR(45) NOT NULL,
  fecha_inicio NVARCHAR(45) NOT NULL,
  fecha_fin NVARCHAR(45) NOT NULL,
  programa INT NOT NULL,
  CONSTRAINT fk_acreditacion_programa FOREIGN KEY (programa)
    REFERENCES knowledge_map_db.programa (id)
    ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- Tabla universidad
CREATE TABLE knowledge_map_db.universidad (
  id INT NOT NULL PRIMARY KEY,
  nombre NVARCHAR(60) NOT NULL,
  tipo NVARCHAR(45) NOT NULL,
  ciudad NVARCHAR(45) NOT NULL
);

-- Tabla facultad
CREATE TABLE knowledge_map_db.facultad (
  id INT NOT NULL PRIMARY KEY,
  nombre NVARCHAR(60) NOT NULL,
  tipo NVARCHAR(45) NOT NULL,
  fecha_fun DATE NOT NULL,
  universidad INT NOT NULL,
  CONSTRAINT fk_unidad_sede FOREIGN KEY (universidad)
    REFERENCES knowledge_map_db.universidad (id)
    ON DELETE NO ACTION ON UPDATE NO ACTION
);


-- Tabla programa
CREATE TABLE knowledge_map_db.programa (
  id INT NOT NULL PRIMARY KEY,
  nombre NVARCHAR(60) NOT NULL,
  tipo NVARCHAR(45) NOT NULL,
  nivel NVARCHAR(45) NOT NULL,
  fecha_creacion NVARCHAR(45) NOT NULL,
  fecha_cierre NVARCHAR(45) NULL,
  numero_cohortes NVARCHAR(45) NOT NULL,
  cant_graduados NVARCHAR(45) NOT NULL,
  fecha_actualizacion NVARCHAR(45) NOT NULL,
  ciudad NVARCHAR(45) NOT NULL,
  facultad INT NOT NULL,
  CONSTRAINT fk_programa_facultad FOREIGN KEY (facultad)
    REFERENCES knowledge_map_db.facultad (id)
    ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- Tabla pasantia
CREATE TABLE knowledge_map_db.pasantia (
  id INT NOT NULL PRIMARY KEY,
  nombre NVARCHAR(45) NOT NULL,
  pais NVARCHAR(45) NOT NULL,
  empresa NVARCHAR(45) NOT NULL,
  descripcion NVARCHAR(45) NOT NULL,
  programa INT NOT NULL,
  CONSTRAINT fk_pasantia_programa FOREIGN KEY (programa)
    REFERENCES knowledge_map_db.programa (id)
    ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- Tabla programa_ac
CREATE TABLE knowledge_map_db.programa_ac (
  programa INT NOT NULL,
  area_conocimiento INT NOT NULL,
  PRIMARY KEY (programa, area_conocimiento),
  CONSTRAINT fk_programa_ac_programa FOREIGN KEY (programa)
    REFERENCES knowledge_map_db.programa (id)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_programa_ac_area_conocimiento FOREIGN KEY (area_conocimiento)
    REFERENCES knowledge_map_db.area_conocimiento (id)
    ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- Tabla area_conocimiento
CREATE TABLE knowledge_map_db.area_conocimiento (
  id INT NOT NULL PRIMARY KEY,
  gran_area NVARCHAR(60) NOT NULL,
  area NVARCHAR(60) NOT NULL,
  disciplina NVARCHAR(60) NOT NULL
);



-- Tabla objetivo_desarrollo_sostenible
CREATE TABLE knowledge_map_db.objetivo_desarrollo_sostenible (
  id INT NOT NULL PRIMARY KEY,
  nombre NVARCHAR(60) NOT NULL,
  categoria NVARCHAR(45) NOT NULL
);

-- Tabla area_aplicacion
CREATE TABLE knowledge_map_db.area_aplicacion (
  id INT NOT NULL PRIMARY KEY,
  nombre NVARCHAR(60) NOT NULL
);








