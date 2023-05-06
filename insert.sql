INSERT INTO Citta (nome, nazione) VALUES
('Milano', 'Italia'),
('Roma', 'Italia'),
('Barcellona', 'Spagna'),
('Parigi', 'Francia'),
('Londra', 'Regno Unito'),
('Berlino', 'Germania');

INSERT INTO Istituti (citta, nome, via, nCivico) VALUES
(1, 'Liceo Classico "Giuseppe Parini"', 'Via Mancinelli', 5),
(1, 'Liceo Scientifico "Albert Einstein"', 'Via Paravia', 15),
(1, 'Istituto Tecnico Industriale "Leonardo da Vinci"', 'Via Tucidide', 12),
(2, 'Liceo Classico "Julius Caesar"', 'Via Appia', 10),
(2, 'Liceo Scientifico "Enrico Fermi"', 'Via del Castello', 23),
(2, 'Istituto Tecnico Agrario "Giacomo Matteotti"', 'Via delle Vigne', 7),
(3, 'Liceo Classico "Antonio Machado"', 'Calle de Alcalá', 20),
(3, 'Liceo Scientifico "Pablo Picasso"', 'Plaça de les Glòries Catalanes', 17),
(3, 'Istituto Tecnico Commerciale "Ramon Llull"', 'Carrer de Balmes', 45),
(4, 'Liceo Classico "Victor Hugo"', 'Avenue Victor Hugo', 5),
(4, 'Liceo Scientifico "Marie Curie"', 'Avenue des Gobelins', 24),
(4, 'Istituto Tecnico Industriale "Gustave Eiffel"', 'Rue de la Fédération', 18),
(5, 'Liceo Classico "William Shakespeare"', 'Southwark Street', 12),
(5, 'Liceo Scientifico "Stephen Hawking"', 'Queen Mary''s Road', 25),
(5, 'Istituto Tecnico Commerciale "John Maynard Keynes"', 'Kingsway', 40),
(6, 'Liceo Classico "Friedrich Schiller"', 'Schillerstraße', 5),
(6, 'Liceo Scientifico "Max Planck"', 'Hardenbergstraße', 34),
(6, 'Istituto Tecnico Agrario "Johann Wolfgang von Goethe"', 'Schönhauser Allee', 45);

INSERT INTO SediSportive (citta, nome, via, nCivico) VALUES
(1, 'Palazzetto dello Sport', 'Via dei Campioni', 12),
(1, 'Stadio San Siro', 'Piazzale Angelo Moratti', 1),
(2, 'Stadio Olimpico', 'Piazzale del Foro Italico', 1),
(3, 'Palau Sant Jordi', 'Passeig Olímpic', 5),
(3, 'Camp Nou', 'Carrer d''Aristides Maillol', 12),
(4, 'Stade de France', 'Zac du Cornillon Nord', 16),
(4, 'Parc des Princes', '24 Rue du Commandant Guilbaud', 24),
(5, 'The O2 Arena', 'Peninsula Square', 1),
(5, 'Wembley Stadium', 'Wembley Park, Wembley', 1),
(6, 'Olympiastadion', 'Olympischer Platz 3', 1),
(6, 'Velodrom', 'Paul-Heyse-Straße 26', 1);

INSERT INTO Discipline (nome) VALUES
('Atletica leggera'),
('Pallavolo'),
('Calcio'),
('Basket'),
('Pallamano'),
('Tennis'),
('Nuoto'),
('Atletica pesante');

INSERT INTO GareSquadre (citta, SedeSportiva, ora, giorno, disciplina, fase) VALUES 
(1, 'Palazzetto dello Sport', '14:30:00', '2023-06-10', 'Pallavolo', 'provinciale'),
(2, 'Stadio Olimpico', '16:00:00', '2023-06-12', 'Calcio', 'regionale'),
(3, 'Palau Sant Jordi', '15:00:00', '2023-06-15', 'Basket', 'nazionale'),
(4, 'Stade de France', '18:00:00', '2023-06-18', 'Pallamano', 'provinciale'),
(5, 'The O2 Arena', '20:00:00', '2023-06-21', 'Pallavolo', 'regionale'),
(6, 'Olympiastadion', '19:00:00', '2023-06-25', 'Atletica leggera', 'nazionale');

INSERT INTO GareSingole (citta, SedeSportiva, ora, giorno, disciplina, fase) VALUES
(1, 'Palazzetto dello Sport', '10:00:00', '2023-06-10', 'Atletica leggera', 'regionale'),
(1, 'Palazzetto dello Sport', '14:00:00', '2023-06-10', 'Tennis', 'provinciale'),
(1, 'Palazzetto dello Sport', '18:00:00', '2023-06-10', 'Nuoto', 'nazionale'),
(2, 'Stadio Olimpico', '16:00:00', '2023-06-12', 'Atletica leggera', 'nazionale'),
(2, 'Stadio Olimpico', '20:00:00', '2023-06-12', 'Tennis', 'regionale'),
(3, 'Palau Sant Jordi', '17:00:00', '2023-06-15', 'Nuoto', 'nazionale'),
(4, 'Stade de France', '20:00:00', '2023-06-18', 'Atletica leggera', 'provinciale'),
(4, 'Stade de France', '22:00:00', '2023-06-18', 'Tennis', 'nazionale'),
(5, 'The O2 Arena', '22:00:00', '2023-06-21', 'Atletica leggera', 'nazionale'),
(5, 'The O2 Arena', '00:00:00', '2023-06-22', 'Nuoto', 'nazionale'),
(6, 'Olympiastadion', '21:00:00', '2023-06-25', 'Atletica leggera', 'nazionale'),
(6, 'Olympiastadion', '23:00:00', '2023-06-25', 'Tennis', 'nazionale');

INSERT INTO Gruppi (nome, disciplina, eta_media) VALUES 
('Olimpia Volley', 'Pallavolo', 25),
('Inter Milan', 'Calcio', 27),
('Lakers', 'Basket', 29),
('Paris Handball', 'Pallamano', 26),
('Red Star Belgrade', 'Calcio', 28),
('Barcelona Voleibol', 'Pallavolo', 24);

INSERT INTO Atleti (nome, Cognome, eta, disciplina, citta_fk, istituto, gruppo) VALUES
('Mario', 'Rossi', 20, 'Pallavolo', 1, 'Liceo Classico "Giuseppe Parini"', 'Olimpia Volley'),
('Giulia', 'Bianchi', 22, 'Pallavolo', 1, 'Liceo Scientifico "Albert Einstein"', 'Olimpia Volley'),
('Luigi', 'Verdi', 18, 'Calcio', 2, 'Liceo Classico "Julius Caesar"', 'Inter Milan'),
('Maria', 'Neri', 21, 'Basket', 3, 'Liceo Scientifico "Enrico Fermi"', 'Lakers'),
('Marco', 'Russo', 23, 'Pallamano', 4, 'Liceo Classico "Giuseppe Parini"', 'Paris Handball'),
('Chiara', 'Esposito', 19, 'Calcio', 5, 'Liceo Scientifico "Albert Einstein"', 'Red Star Belgrade'),
('Alessandro', 'Ferrari', 24, 'Pallavolo', 6, 'Liceo Classico "Julius Caesar"', 'Barcelona Voleibol'),
('Sara', 'Ricci', 25, 'Pallamano', 1, 'Liceo Scientifico "Enrico Fermi"', 'Paris Handball'),
('Davide', 'Costa', 26, 'Basket', 2, 'Liceo Classico "Giuseppe Parini"', 'Lakers'),
('Giovanna', 'Moretti', 27, 'Pallavolo', 3, 'Liceo Scientifico "Albert Einstein"', 'Olimpia Volley');

INSERT INTO CompetizioniSingole (atleta, citta, sede_sportiva, ora, giorno, punteggio) VALUES
(1, 1, 'Palazzetto dello Sport', '10:00:00', '2023-06-10', 10),
(2, 1, 'Palazzetto dello Sport', '10:00:00', '2023-06-10', 8),
(3, 2, 'Stadio Olimpico', '9:00:00', '2023-06-12', 2),
(4, 3, 'Palau Sant Jordi', '11:00:00', '2023-06-15', 15),
(5, 4, 'Stade de France', '16:00:00', '2023-06-18', 7),
(6, 5, 'The O2 Arena', '19:00:00', '2023-06-21', 12),
(7, 6, 'Olympiastadion', '17:00:00', '2023-06-25', 20),
(8, 1, 'Palazzetto dello Sport', '10:00:00', '2023-06-10', 5),
(9, 2, 'Stadio Olimpico', '9:00:00', '2023-06-12', 10),
(10, 3, 'Palau Sant Jordi', '11:00:00', '2023-06-15', 8);

INSERT INTO CompetizioniGruppo (squadra, citta, sede_sportiva, ora, giorno, punteggio) VALUES
('Olimpia Volley', 1, 'Palazzetto dello Sport', '14:30:00', '2023-06-10', 20),
('Inter Milan', 2, 'Stadio Olimpico', '16:00:00', '2023-06-12', 2),
('Lakers', 3, 'Palau Sant Jordi', '15:00:00', '2023-06-15', 18),
('Paris Handball', 4, 'Stade de France', '18:00:00', '2023-06-18', 12),
('Barcelona Voleibol', 6, 'Olympiastadion', '19:00:00', '2023-06-25', 15);

