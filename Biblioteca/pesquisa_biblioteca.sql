/* Criando a nova base de dados */
CREATE DATABASE nova_biblioteca;


/* Criando as tabelas categoria, autor, livro e editora */
CREATE TABLE `Categoria` (
  `id` int not null auto_increment,
  `nome_categoria` varchar(100) not null,
  PRIMARY KEY (`id`)
);

CREATE TABLE `Editora` (
  `id` int not null auto_increment,
  `nome_editora` varchar(100),
  PRIMARY KEY (`id`)
);

CREATE TABLE `Autor` (
  `id` int not null auto_increment,
  `nome` varchar(100) not null,
  `nacionalidade` varchar(100),
  PRIMARY KEY (`id`)
);

CREATE TABLE `Livro` (
  `isbn` varchar(100) not null,
  `fk_categoria` int,
  `fk_editora` int not null,
  `fk_autor` int not null,
  `titulo` varchar(100) not null,
  `ano` int ,
  PRIMARY KEY (`isbn`),
  FOREIGN KEY (`fk_categoria`) REFERENCES `Categoria`(`id`),
  FOREIGN KEY (`fk_editora`) REFERENCES `Editora`(`id`),
  FOREIGN KEY (`fk_autor`) REFERENCES `Autor`(`id`)
);


/* Inserindo os dados em todas as tabelas */
INSERT INTO `categoria`(`nome_categoria`) VALUE ('Ficção Científica');
INSERT INTO `categoria`(`nome_categoria`) VALUE ('Humor');
INSERT INTO `categoria`(`nome_categoria`) VALUE ('Ação');
INSERT INTO `categoria`(`nome_categoria`) VALUE ('Romance');
INSERT INTO `categoria`(`nome_categoria`) VALUE ('Literatura Juvenil');

insert into autor(nome, nacionalidade) value ('J.K. Rowling', 'Inglaterra');
insert into autor (nome, nacionalidade) value ('Clive Staples Lewis', 'Inglaterra');
insert into autor (nome, nacionalidade) value ('Affonso Solano', 'Brasil');
insert into autor (nome, nacionalidade) value ('Marcos Piangers', 'Brasil');
insert into autor (nome, nacionalidade) value ('Ciro Botelho - Tiririca', 'Brasil');
insert into autor (nome, nacionalidade) value ('Bianca Mól', 'Brasil');

insert into editora (nome_editora) value ('Rocco');
insert into editora (nome_editora) value ('Wmf Martins Fontes');
insert into editora (nome_editora) value ('Casa da Palavra');
insert into editora (nome_editora) value ('Belas Letras');
insert into editora (nome_editora) value ('Matrix');

insert into livro values ('8532511015', 5, 1, 1, 'Harry Potter e A Pedra Filosofal', 2000);
insert into livro values ('9788578270698', 5, 2, 2, 'As Crônicas de Nárnia', 2009);
insert into livro values ('9788577343348', 1, 3, 3, 'O Espadachim de Carvão', 2013);
insert into livro values ('9788581742458', 2, 4, 4, 'O Papai É Pop', 2015);
insert into livro values ('9788582302026', 2, 5, 5, 'Pior Que Tá Não Fica', 2015);
insert into livro values ('8532512062', 5, 1, 1,'Harry Potter e o Prisioneiro de Azkaban', 2000);
insert into livro values ('9788577345670', 5, 3, 6, 'Garota Desdobrável', 2015);


/* Consulta para relacionar os dados dos livros em ordem alfabética de título */
select livro.isbn as 'ISBN', livro.ano as 'Ano', livro.titulo as 'Título', 
autor.nome as 'Autor', autor.nacionalidade as 'País', 
categoria.nome_categoria as 'Categoria', 
editora.nome_editora as 'Editora'
from livro, autor, categoria, editora
where livro.fk_autor = autor.id and livro.fk_categoria = categoria.id and livro.fk_editora = editora.id
order by livro.titulo;


/* Consulta  para relacionar os dados dos livros em ordem alfabética de nome do autor */ 
select livro.isbn as 'ISBN', livro.ano as 'Ano', livro.titulo as 'Título', 
autor.nome as 'Autor', autor.nacionalidade as 'País', 
categoria.nome_categoria as 'Categoria', 
editora.nome_editora as 'Editora'
from livro, autor, categoria, editora
where livro.fk_autor = autor.id and livro.fk_categoria = categoria.id and livro.fk_editora = editora.id
order by autor.nome;


/* Consulta para relacionar todos os dados dos livros da categoria de literatura juvenil em ordem de ano */
select livro.isbn as 'ISBN', livro.ano as 'Ano', livro.titulo as 'Título', 
autor.nome as 'Autor', autor.nacionalidade as 'País', 
categoria.nome_categoria as 'Categoria', 
editora.nome_editora as 'Editora'
from livro, autor, categoria, editora
where livro.fk_autor = autor.id 
and livro.fk_categoria = categoria.id 
and livro.fk_editora = editora.id
and categoria.id = 5
order by livro.ano;


/* Consulta para relacionar todos os dados dos livros de humor ou ficção científica com ano entre 2000 e 2010 */
select livro.isbn as 'ISBN', livro.ano as 'Ano', livro.titulo as 'Título', 
autor.nome as 'Autor', autor.nacionalidade as 'País', 
categoria.nome_categoria as 'Categoria', 
editora.nome_editora as 'Editora'
from livro, autor, categoria, editora
where livro.fk_autor = autor.id 
and livro.fk_categoria = categoria.id 
and livro.fk_editora = editora.id
and (categoria.id = 1 or categoria.id = 2)
and (livro.ano >= 2000 and livro.ano <= 2010)
order by livro.ano;
