--stampare l’elenco degli atleti raggruppati per squadre per ogni singola fase
SELECT Atleti.nome, Atleti.Cognome
FROM Atleti RIGHT JOIN (Gruppi RIGHT JOIN (CompetizioniGruppo AS cg
RIGHT JOIN GareSquadre as gs ON gs.citta = cg.citta 
AND gs.sede_sportiva = cg.ora
AND gs.giorno = cg.giorno )ON Gruppi.nome = cg.squadra)
ON Atleti.gruppo = Gruppi.nome
GROUP BY(GareSquadre.fase)
ORDER BY(Altleti.gruppo)


-- dato il nome di un atleta stampare i risultati ottenuti nelle diverse gare alle quali ha partecipato
Select CompetizioniSingole AS cs cs.punteggio
FROM cs
WHERE atleta in (Select  Atleta.cod_tessera
                FROM Atleti
                where Altleti.nome = $nome AND Altleti.cognome = $cognome )
-- stampare il calendario delle gare
SELECT * 
FROM CompetizioniGruppo AND SELECT * FROM CompetizioniSingole

-- stampare una scheda informativa (cognome, nome, istituto scolastico di provenienza, 
--nazionalità) del vincitore e della squadra vincitrice 
-- assumo di aver messo un record punti accumolati nella tabella atleti e gruppi

select Alteti.nome, Atleti.Cognome, Istitituti.nome, Citta.nazione
FROM Atleti JOIN (Istitituti JOIN Citta ON Istitituti.citta = Citta.id) 
ON Atleti.istituto = Istituti.nome AND Alteti.Citta = Istitituti.citta
where Atleti.gruppo = (select TOP(1) Gruppi.nome 
                        FROM Gruppi
                        ORDER BY(Gruppi.punteggio) DESC)
OR Atleti.punteggio = (select TOP(1) Atleti.punteggio
                        FROM Alteti
                        ORDER BY(Atleti.punteggio)DESC)

-- calcolare il punteggio medio ottenuto durante la prima selezione, per ciascun istituto scolastico

SELECT 
