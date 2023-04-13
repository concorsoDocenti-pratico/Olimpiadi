
CREATE TABLE Citta(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL ,
    nome CHAR(20) NOT NULL,
    nazione CHAR(20) NOT NULL 
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO  Citta () VALUES(1,'forli', 'italia') ,(2,'cesena','italia'), (3,'rimini', 'italia');

CREATE TABLE Istituti(
    citta INT NOT NULL,
    nome CHAR(30) NOT NULL,
    via CHAR(40) NOT NULL,
    nCivico INT NOT NULL,
    FOREIGN KEY (citta) REFERENCES Citta (id),
    PRIMARY KEY (citta,nome)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
INSERT INTO Istituti (  ) VALUES(1,'A righi', 'fratelli argiulli',22),
 (1,'A. saffi', 'gemelli angeli',45),(2,'Monti', 'gurgietta deconcini',90),(3,'Blaise Pascal', 'giacomo Gialdini',56),
(3,'G. Verdi', 'garibaldi',44);

CREATE TABLE SediSportive(
    citta INT NOT NULL,
    nome CHAR(30) NOT NULL,
    via CHAR(40) NOT NULL,
    nCivico INT NOT NULL,
    FOREIGN KEY (citta) REFERENCES Citta (id),
    PRIMARY KEY (citta,nome) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
INSERT INTO SediSportive()
VALUES(1,'consoli romani', 'fratelli argiulli',42),
(1,'para bellum', 'gemelli angeli',30),
(2,'Bolt', 'gurgietta deconcini',30),
(3,'Simone Giannelli', 'giacomo Gialdini',26),
(3,'libertas', 'garibaldi',11);
CREATE TABLE Discipline(
    nome CHAR(30) NOT NULL PRIMARY KEY
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
INSERT INTO Discipline (  ) VALUES('tennis'), ('calcio'), ('pallavolo'), ('beach volley'), ('beach tennis');

CREATE TABLE GareSquadre(
    citta INT NOT NULL,
    SedeSportiva CHAR(30) NOT NULL,
    ora TIME NOT NULL,
    giorno DATE NOT NULL,
    disciplina CHAR(30), 
    fase CHAR(20) DEFAULT 'provinciale',
    FOREIGN KEY (citta, SedeSportiva) REFERENCES SediSportive(citta, nome),
    FOREIGN KEY (disciplina)  REFERENCES Discipline (nome),
    PRIMARY KEY (citta, SedeSportiva, ora, giorno)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO GareSquadre (citta, SedeSportiva, ora, giorno, disciplina, fase) VALUES
(1,'consoli romani', '10:00:00', '2023-04-20', 'tennis', 'provinciale'),
(1,'para bellum', '11:00:00', '2023-04-21', 'calcio', 'provinciale'),
(2,'Bolt', '12:00:00', '2023-04-22', 'pallavolo', 'provinciale'),
(3,'Simone Giannelli', '13:00:00', '2023-04-23', 'beach volley', 'provinciale'),
(3,'libertas', '14:00:00', '2023-04-24', 'beach tennis', 'provinciale');

CREATE TABLE GareSingole(
    citta INT NOT NULL,
    SedeSportiva CHAR(30) NOT NULL,
    ora TIME NOT NULL,
    giorno DATE NOT NULL,
    fase CHAR(20) DEFAULT 'provinciale',
    disciplina CHAR(30), 
    FOREIGN KEY (citta, SedeSportiva) REFERENCES SediSportive(citta, nome),
    FOREIGN KEY (disciplina)  REFERENCES Discipline (nome),
    PRIMARY KEY (citta, SedeSportiva, ora, giorno)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE Atleti(
    cod_tessera int NOT NULL PRIMARY KEY,
    nome CHAR(20),
    Cognome char(30),
    eta int NOT NULL,
    disciplina CHAR(30),
    citta_fk INT NOT NULL,
    istituto CHAR(30) NOT NULL,
    FOREIGN KEY (citta_fk,istituto) REFERENCES Istituti(citta,nome),
    FOREIGN KEY (disciplina) REFERENCES Discipline(nome)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Gruppi (
    nome CHAR(30)NOT NULL PRIMARY KEY,
    disciplina CHAR(30) NOT NULL,
    eta_media INT NOT NULL,
    FOREIGN KEY (disciplina) REFERENCES Discipline(nome)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE CompetizioniSingole(
	atleta int NOT NULL,
    citta INT NOT NULL,
    sede_sportiva CHAR(30) NOT NULL,
    ora TIME NOT NULL,
    giorno DATE NOT NULL,
    punteggio INT DEFAULT 0,
    FOREIGN KEY (atleta) REFERENCES Atleti(cod_tessera),
    FOREIGN KEY (citta , sede_sportiva, ora, giorno) REFERENCES GareSingole(citta,SedeSportiva,ora,giorno),
    PRIMARY KEY (atleta,citta, sede_sportiva, ora, giorno)
)ENGINE= INNODB;

CREATE TABLE CompetizioniGruppo(
    squadra char(30) NOT NULL,
    citta INT NOT NULL,
    sede_sportiva CHAR(30) NOT NULL,
    ora TIME NOT NULL,
    giorno DATE NOT NULL,
    punteggio INT  DEFAULT 0,
    FOREIGN KEY (squadra) REFERENCES Gruppi(nome),
    FOREIGN KEY (citta , sede_sportiva, ora, giorno) REFERENCES GareSquadre(citta,SedeSportiva,ora,giorno),
    PRIMARY KEY (squadra,citta, sede_sportiva, ora, giorno)
)ENGINE=INNODB;