select BI.NUMPED,BI.DATA,B.DTFAT,BI.QT,BI.PVENDA,BI.QT*BI.PVENDA AS VALOR_PORD,BI.CODCLI,B.VLTOTAL,C.CODPROD,
CASE BI.posicao
WHEN 'F' THEN 'FATURADO'
WHEN 'B' THEN 'BLOQUEADO'
WHEN 'L' THEN 'LIBERADO'
ELSE 'CANCELADO' END AS POSICAO,
B.CODCLI
from PCPEDC B
left Join pcpedi bi on b.numped=bi.numped
left join PCPRODUT C ON C.CODPROD = bi.CODPROD
where b.numped in (
select b.numped FROM PCPEDC B
left Join pcpedi bi on b.numped=bi.numped
where
B.data >= '18/10/2022' AND
bi.CODPROD=1430 and
bi.pvenda=19 and
B.CONDVENDA NOT IN (4, 8, 10) and
B.CODFILIAL IN (1,9)
)