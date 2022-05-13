/* Criando uma nova base de dados */
CREATE database dinossauros;

/* Criando as tabelas era, descobridor, grupo e dinossauro */
CREATE TABLE `Era` (
  `id` int not null auto_increment,
  `nome` varchar(20) not null,
  `ano_inicio` int not null,
  `ano_fim` int not null,
  PRIMARY KEY (`id`)
);

CREATE TABLE `Descobridor` (
  `id` int not null auto_increment,
  `nome` varchar(50) not null,
  PRIMARY KEY (`id`)
);

CREATE TABLE `Grupo` (
  `id` int not null auto_increment,
  `nome` varchar(20) not null,
  PRIMARY KEY (`id`)
);

CREATE TABLE `Dinossauro` (
  `id` int not null auto_increment,
  `nome` varchar(50) not null,
  `fk_descobridor` int not null,
  `fk_era` int not null,
  `fk_grupo` int not null,
  `país` varchar(20),
  `ano_inicio` int not null,
  `ano_fim` int not null,
  `toneladas` int not null,
  `ano_descoberta` int not null,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`fk_descobridor`) REFERENCES `Descobridor`(`id`),
  FOREIGN KEY (`fk_era`) REFERENCES `Era`(`id`),
  FOREIGN KEY (`fk_grupo`) REFERENCES `Grupo`(`id`)
);

/* Inserindo os valores nas respectivas tabelas */
INSERT INTO era (nome, ano_inicio, ano_fim) VALUES ('Cretáceo', 145, 66);
INSERT INTO era (nome, ano_inicio, ano_fim) VALUES ('Jurássico', 201, 145);

INSERT INTO descobridor (nome) VALUE ('Maryanska');
INSERT INTO descobridor (nome) VALUE ('John Bell Hatcher');
INSERT INTO descobridor (nome) VALUE ('Cientistas Alemães');
INSERT INTO descobridor (nome) VALUE ('Museu Americano de História Natural');
INSERT INTO descobridor (nome) VALUE ('Othniel Charles Marsh');
INSERT INTO descobridor (nome) VALUE ('Barnum Brown');

INSERT INTO grupo (nome) VALUE ('Anquilossauros');
INSERT INTO grupo (nome) VALUE ('Ceratopsídeos');
INSERT INTO grupo (nome) VALUE ('Estegossauros');
INSERT INTO grupo (nome) VALUE ('Terápodes');

SELECT * FROM descobridor;
SELECT * FROM era;
SELECT * FROM grupo;
SELECT * FROM dinossauro;

INSERT INTO  dinossauro (nome, país, toneladas, ano_descoberta, ano_inicio, ano_fim, fk_descobridor, fk_era, fk_grupo) 
VALUES ('Saichania', 'Mongólia', 4, 1977, 145, 66, 1, 1, 1);
INSERT INTO  dinossauro (nome, país, toneladas, ano_descoberta, ano_inicio, ano_fim, fk_descobridor, fk_era, fk_grupo) 
VALUES ('Tricerátops', 'Canadá', 6, 1887, 145, 66, 2, 1, 2);
INSERT INTO  dinossauro (nome, país, toneladas, ano_descoberta, ano_inicio, ano_fim, fk_descobridor, fk_era, fk_grupo) 
VALUES ('Kentrossauro', 'Tanzânia', 2, 1909, 201, 145, 3, 2, 3);
INSERT INTO  dinossauro (nome, país, toneladas, ano_descoberta, ano_inicio, ano_fim, fk_descobridor, fk_era, fk_grupo) 
VALUES ('Pinacossauro', 'China', 6, 1999, 85, 75, 4, 1, 1);
INSERT INTO  dinossauro (nome, país, toneladas, ano_descoberta, ano_inicio, ano_fim, fk_descobridor, fk_era, fk_grupo) 
VALUES ('Alossauro', 'América do Norte', 3, 1877, 201, 145, 5, 2, 4);
INSERT INTO  dinossauro (nome, país, toneladas, ano_descoberta, ano_inicio, ano_fim, fk_descobridor, fk_era, fk_grupo) 
VALUES ('Torossauro', 'USA', 8, 1891, 145, 66, 2, 1, 2);
INSERT INTO  dinossauro (nome, país, toneladas, ano_descoberta, ano_inicio, ano_fim, fk_descobridor, fk_era, fk_grupo) 
VALUES ('Anquilossauro', 'América do Norte', 8, 1906, 145, 66, 6, 1, 1);


/*  Consulta relacionando os dados dos dinossauros em ordem alfabética de nome */
SELECT dinossauro.nome as 'Nome',  dinossauro.país as 'País', dinossauro.ano_inicio as 'Início Existência (Milhões)', 
dinossauro.ano_fim as 'Fim Existência (Milhões)', dinossauro.toneladas as 'Toneladas', dinossauro.ano_descoberta as 'Ano de Descoberta',
grupo.nome as 'Grupo',
era.nome as 'Era', era.ano_inicio as 'Inicio Era (Milhões)', era.ano_fim as 'Fim Era (Milhões)',
descobridor.nome as 'Descobridor'
from dinossauro, grupo, era, descobridor
where dinossauro.fk_descobridor = descobridor.id
and dinossauro.fk_era = era.id 
and dinossauro.fk_grupo = grupo.id
order by dinossauro.nome;


/* Consulta relacionando os dados dos dinossauros em ordem alfabética de descobridor */ 
SELECT descobridor.nome as 'Descobridor',
dinossauro.nome as 'Nome',  dinossauro.país as 'País', dinossauro.ano_inicio as 'Início Existência (Milhões)', 
dinossauro.ano_fim as 'Fim Existência (Milhões)', dinossauro.toneladas as 'Toneladas', dinossauro.ano_descoberta as 'Ano de Descoberta',
grupo.nome as 'Grupo',
era.nome as 'Era', era.ano_inicio as 'Inicio Era (Milhões)', era.ano_fim as 'Fim Era (Milhões)'
from dinossauro, grupo, era, descobridor
where dinossauro.fk_descobridor = descobridor.id
and dinossauro.fk_era = era.id 
and dinossauro.fk_grupo = grupo.id
order by descobridor.nome;


/* Consulta relacionando os dados dos dinossauros do grupo anquilossauros em ordem de ano de descoberta */
SELECT dinossauro.ano_descoberta as 'Ano de Descoberta',
dinossauro.nome as 'Nome',  dinossauro.país as 'País', dinossauro.ano_inicio as 'Início Existência (Milhões)', 
dinossauro.ano_fim as 'Fim Existência (Milhões)', dinossauro.toneladas as 'Toneladas', 
grupo.nome as 'Grupo',
era.nome as 'Era', era.ano_inicio as 'Inicio Era (Milhões)', era.ano_fim as 'Fim Era (Milhões)',
descobridor.nome as 'Descobridor'
from dinossauro, grupo, era, descobridor
where dinossauro.fk_descobridor = descobridor.id
and dinossauro.fk_era = era.id 
and dinossauro.fk_grupo = grupo.id
and dinossauro.fk_grupo = 1
order by dinossauro.ano_descoberta;

SELECT * FROM grupo;
/* Consulta relacionando os dados disponíveis dos dinossauros Ceratopsídeos ou anquilossauros descobertos entre 1900 e 1999 */
SELECT dinossauro.nome as 'Nome',  
dinossauro.país as 'País', dinossauro.ano_inicio as 'Início Existência (Milhões)', 
dinossauro.ano_fim as 'Fim Existência (Milhões)', dinossauro.toneladas as 'Toneladas', dinossauro.ano_descoberta as 'Ano de Descoberta',
grupo.nome as 'Grupo',
era.nome as 'Era', era.ano_inicio as 'Inicio Era (Milhões)', era.ano_fim as 'Fim Era (Milhões)',
descobridor.nome as 'Descobridor'
from dinossauro, grupo, era, descobridor
where dinossauro.fk_descobridor = descobridor.id
and dinossauro.fk_era = era.id 
and dinossauro.fk_grupo = grupo.id
and (dinossauro.fk_grupo = 1 or dinossauro.fk_grupo = 2)
and (dinossauro.ano_descoberta >= 1900 and dinossauro.ano_descoberta <= 1999)
order by dinossauro.nome;
