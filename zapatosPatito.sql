/*Crear tablas*/

CREATE TABLE color (
  id_color SMALLINT NOT NULL AUTO_INCREMENT,
  color VARCHAR(30),
  PRIMARY KEY id_color(id_color)
);

CREATE TABLE marca (
  id_marca SMALLINT NOT NULL AUTO_INCREMENT,
  marca VARCHAR(30),
  PRIMARY KEY id_marca(id_marca)
); 

CREATE TABLE tipo_zapato (
  id_tipo_zapato SMALLINT NOT NULL AUTO_INCREMENT,
  tipo VARCHAR(30),
  PRIMARY KEY id_tipo_zapato(id_tipo_zapato)
);
 
CREATE TABLE genero (
  id_genero SMALLINT NOT NULL AUTO_INCREMENT,
  genero VARCHAR(30),
  PRIMARY KEY id_genero(id_genero)
);

CREATE TABLE zapato(
    numero_serie VARCHAR(60) NOT NULL,
    talla SMALLINT NOT NULL,
    valor DECIMAL(6,2) NOT NULL,
    tiene_cordon VARCHAR(2) NOT NULL,
    fila varchar(1) NOT NULL, /*A-D*/
    columna SMALLINT NOT NULL, /*1.5*/
    
    tipo_id SMALLINT NOT NULL,
    color_id SMALLINT NOT NULL,
    marca_id SMALLINT NOT NULL,
    genero_id SMALLINT NOT NULL,
    
    PRIMARY KEY numero_serie(numero_serie),
    FOREIGN KEY (tipo_id) REFERENCES tipo_zapato(id_tipo_zapato),
    FOREIGN KEY (color_id) REFERENCES color(id_color),
    FOREIGN KEY (marca_id) REFERENCES marca(id_marca),
    FOREIGN KEY (genero_id) REFERENCES genero(id_genero)
);

/*
INSERTAR DATOS
Se deben de llenar con 25 datos para la tabla principal y 5 para cada tabla secundaria
*/

INSERT INTO tipo_zapato values(null, 'mocasin');
INSERT INTO tipo_zapato values(null, 'deportivo');
INSERT INTO tipo_zapato values(null, 'normal');
INSERT INTO tipo_zapato values(null, 'bota');
INSERT INTO tipo_zapato values(null, 'sandalia');

INSERT INTO color values(null, 'negro');
INSERT INTO color values(null, 'azul');
INSERT INTO color values(null, 'rojo');
INSERT INTO color values(null, 'blanco');
INSERT INTO color values(null, 'gris');
 
INSERT INTO marca values(null, 'adidas');
INSERT INTO marca values(null, 'nike'); 
INSERT INTO marca values(null, 'puma');
INSERT INTO marca values(null, 'rebook');
INSERT INTO marca values(null, 'prescott');

INSERT INTO genero values(null, 'hombre');
INSERT INTO genero values(null, 'mujer');
INSERT INTO genero values(null, 'unisex');

INSERT INTO zapato values("0oMBMMnFC5Nd4Bz2B2d4", 33, 59, "NO", "D", 1,  5, 3, 4, 2);

INSERT INTO zapato values("6d5wsN6U601fGNo5B5nE", 36, 17, "SI", "E", 3,  1, 5, 2, 1);

INSERT INTO zapato values("jd22HPdiEfddif4f2sds", 42, 17, "NO", "C", 4,  5, 3, 4, 3);

INSERT INTO zapato values("3Pj6gH67nMDs6d652xzE", 39, 49, "SI", "E", 1,  3, 3, 5, 1);

INSERT INTO zapato values("22A0Mzif6zGDfd6Oz0dO", 38, 99, "NO", "B", 4,  5, 5, 4, 3);

INSERT INTO zapato values("Hjd1H13614fzsIN41Df7", 40, 44, "NO", "A", 1,  5, 4, 1, 3);

INSERT INTO zapato values("Ds2n6fB2d5iE57jfA76N", 42, 119, "SI", "E", 2,  3, 3, 1, 1);

INSERT INTO zapato values("O0f7GU5jx6U12As2EBiw", 36, 37, "NO", "A", 4,  4, 2, 2, 2);

INSERT INTO zapato values("MdM19ozoANCos31fdzEB", 30, 112, "NO", "D", 5,  2, 4, 5, 2);

INSERT INTO zapato values("z0jnU5sO1EfjdHodPsdd", 32, 70, "SI", "D", 2,  3, 5, 1, 1);

INSERT INTO zapato values("g0xM3s9DzBnx402U6fC3", 39, 20, "NO", "B", 2,  5, 3, 2, 2);

INSERT INTO zapato values("U2DnsI6dz574nMIf4D0s", 30, 83, "SI", "C", 1,  2, 1, 1, 1);

INSERT INTO zapato values("7CnsMnwnw050005sA2E0", 32, 83, "SI", "A", 4,  3, 4, 1, 3);

INSERT INTO zapato values("O2FdnfsjnABg2f5d7wDN", 37, 90, "NO", "D", 3,  2, 2, 1, 1);

INSERT INTO zapato values("n0fGGx3G3nzU70w56199", 38, 25, "SI", "D", 5,  1, 3, 5, 2);

INSERT INTO zapato values("1Ndfz66Nfii096s0s6Cx", 39, 17, "NO", "D", 5,  3, 4, 2, 2);

INSERT INTO zapato values("z2so661NUN1zNnCs2025", 33, 25, "SI", "C", 5,  4, 2, 2, 3);

INSERT INTO zapato values("1nMn7z1sgF2DsI1sz9UM", 36, 70, "NO", "C", 3,  2, 4, 3, 3);

INSERT INTO zapato values("Es0MBF0fBjdd12gMiz75", 30, 100, "SI", "B", 4,  3, 3, 5, 2);

INSERT INTO zapato values("xssAgn9sE0zfF37DE0Of", 36, 115, "SI", "A", 5,  4, 4, 1, 1);

INSERT INTO zapato values("72s0gIBH2sM2GE4DdsF5", 37, 88, "NO", "C", 5,  2, 3, 3, 1);

INSERT INTO zapato values("s62j1943sfUd22dEOfz0", 36, 33, "NO", "B", 1,  2, 2, 1, 1);

INSERT INTO zapato values("6sdMPIBo3jsHjisfdz0f", 41, 54, "NO", "A", 1,  2, 2, 1, 3);

INSERT INTO zapato values("561jCIs0IDUoz6120A2B", 35, 30, "SI", "B", 3,  2, 2, 3, 3);

INSERT INTO zapato values("ziO6Dsig6IAdsE3E9D7D", 36, 112, "SI", "D", 2,  3, 4, 4, 2);
/*
Una vez realizada la base se debe de realizar las siguientes consultas:
*/

/* a) Se desean saber el número de zapatos de color rojo y de talla 36. */

select count(*) as NumeroZapatosRojosTalla36 from zapato where zapato.color_id = 3 and zapato.talla = 36;

/* b) Se desea saber la posición de todos los zapatos que tienen cordones, que son de tipo mocasín, y cuyo valor se encuentre entre 25 a 100 dólares. */

select zapato.numero_serie, zapato.fila, zapato.columna, zapato.valor from zapato where zapato.tiene_cordon = "SI" and zapato.tipo_id = 1 and zapato.valor >= 25 and zapato.valor <= 100;

/* c) Se desea saber el valor mínimo de los zapatos que se encuentran en la columna 4. */

select min(zapato.valor) as ValorMinimoColumna4 from zapato where zapato.columna = 4;

/* d) Se desea los 5 primeros valores de precio, ordenados ascendentemente, de todos los zapatos de la marca Puma. */

select * from zapato where zapato.marca_id = 3 order by zapato.valor asc limit 5;

/* e) Se desea contar todos los zapatos que sean de las marcas Puma, Adidas y Nike. */

select count(*) as TotalZapatos from zapato where zapato.marca_id in (1,2,3);

/* f) Se desea saber el color, el tipo, la fila y la columna de todos los zapatos cuyo tipo comience con N. */

select color.color, tipo_zapato.tipo, zapato.fila, zapato.columna from zapato join color on zapato.color_id = color.id_color join tipo_zapato on zapato.tipo_id = tipo_zapato.id_tipo_zapato where tipo_zapato.tipo like "N%";

/* g) Se desea saber el color, el tipo, la fila y la columna de todos los zapatos cuyo tipo termine con A y que tenga de precio entre 35 y 65 dolares */

select color.color, tipo_zapato.tipo, zapato.fila, zapato.columna, zapato.valor from zapato join color on zapato.color_id = color.id_color join tipo_zapato on zapato.tipo_id = tipo_zapato.id_tipo_zapato where tipo_zapato.tipo like "%A" and zapato.valor >= 35 and zapato.valor <= 65;

/* h) Se requiere la sumatoria de todos los zapatos que se encuentran en la fila A y que sean de tipo bota */
select sum(zapato.valor) as SumatoriaZapatos from zapato where zapato.tipo_id = 4 and zapato.fila = 'A';
