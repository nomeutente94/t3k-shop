/**creo il database*/
create schema t3kshop;
use t3kshop;

/**creo la tabella Cliente*/
create table Cliente(username varchar(12) primary key, password varchar(12) not null, nome varchar(30) not null, cognome varchar(30) not null, indirizzo varchar(150), cap varchar(8) not null, città varchar(10) not null, stato varchar(15) not null, dataNascita date not null, telefono varchar(15) not null, email varchar(50) not null);

/**creo la tabella Amministratore*/
create table Amministratore(username varchar(12) primary key, password varchar(12) not null, nome varchar(30) not null, cognome varchar(30) not null, telefono varchar(15) not null, email varchar(50) not null);

/**creo la tabella Prodotto*/
create table Prodotto(id numeric(10) primary key, nome varchar(200) not null, modello varchar(50) not null, marca varchar(15) not null, categoria character(30) not null, immagine varchar(10), brevedescrizione text(300), descrizione text(1500) not null, quantita numeric(7) not null default 0, prezzo decimal(10,2) not null, nvolteacquistato numeric(5) not null default 0);

/**creo la tabella Ordine*/
create table Ordine(id numeric(10) primary key, idCliente varchar(10) references Cliente(id) on update cascade, indirizzoConsegna text(400) not null, dataEffettuazione date not null, orarioEffettuazione time not null);

/**creo la tabella Articolo*/
create table Articolo(id numeric(10) primary key, idProdotto numeric(10) references Prodotto(id) on update cascade, quantita numeric(7) not null default 0, prezzo decimal(10,2) not null);

/**creo la tabella ArticoliOrdine*/
create table ComposizioneOrdine(idOrdine numeric(10) references Ordine(id) on update cascade, idArticolo varchar(10) references Articolo(id) on update cascade, PRIMARY KEY(idArticolo, idOrdine));
