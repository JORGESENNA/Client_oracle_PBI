select *  from pcpedc
where numped='543031958'


select * from pcpraca
where codpraca=81

select * from pcempr
select * from pcpedi 
select ESTCOB,CEPCOB, from PCCLIENT
SELECT * FROM PCMOV


select  * from pcpedi p
left join PCPRODUT pr on p.codprod = pr.codprod
left join PCCLIENT c on  p.codcli = c.codcli

SELECT * FROM PCMOV P
left join PCCLIENT c on  p.codcli = c.codcli











SELECT DISTINCT 
LPAD (1, 2, 0) || '|' ||
'VENDAS' || '|' ||
LPAD (50, 3, 0) || '|' ||
:SEQUENCIA || '|' ||
TO_CHAR(SYSDATE-1,'YYYYMMDD')|| '|' ||
TO_CHAR(SYSDATE-1,'YYYYMMDD')|| '|' ||
TO_CHAR(SYSDATE-1,'YYYYMMDD') || '|' ||
'16731862000124' || '|' ||
'07216054000138'
FROM DUAL
union all
SELECT DISTINCT 
LPAD (2, 2, 0) || '|' ||
LPAD (1, 2, 0) || '|' ||
P.NUMNOTA || '|' ||
LPAD (1, 2, 0) || '|' ||
LPAD (1, 2, 0) || '|' ||
TO_CHAR(P.DTMOV,'YYYYMMDD')|| '|' ||
REPLACE(REPLACE(CGCENT,'-',''),'.','')|| '|' ||
'RJ' || '|' ||
'21010410' || '|' ||
C.ESTCOB || '|' ||
C.CEPCOB || '|' ||
'CIF' || '|' ||
LPAD (1, 2, 0)
FROM PCMOV P
left join PCCLIENT c on  p.codcli = c.codcli
wHERE 
P.CODOPER='S' AND
P.DTMOV >=:DTINI AND
P.DTMOV <=:DTFIM
UNION ALL

SELECT DISTINCT 
LPAD (3, 2, 0) || '|' ||
P.NUMNOTA || '|' ||
LPAD (1, 2, 0) || '|' ||
P.CODPROD || '|' ||
P.QT || '|' ||
REPLACE(P.PUNIT,',','.') || '|' ||
LPAD (0, 1, 0) || '|' ||
LPAD (0, 2, 0) || '|' ||
LPAD (0, 2, 0) || '|' ||
LPAD (0, 2, 0) || '|' ||
LPAD (0, 2, 0) || '|' ||
LPAD (0, 2, 0) || '|' ||
LPAD (0, 2, 0)
FROM PCMOV P
left join PCCLIENT c on  p.codcli = c.codcli
wHERE 
P.CODOPER='S' AND
P.DTMOV >=:DTINI AND
P.DTMOV <=:DTFIM






























SELECT DISTINCT 
LPAD (2, 2, 0) || '|' ||
LPAD (1, 2, 0) || '|' ||
P.NUMNOTA || '|' ||
LPAD (1, 2, 0) || '|' ||
LPAD (1, 2, 0) || '|' ||
TO_CHAR(P.DTMOV,'YYYYMMDD')|| '|' ||
REPLACE(REPLACE(CGCENT,'-',''),'.','')|| '|' ||
'RJ' || '|' ||
'21010410' || '|' ||
C.ESTCOB || '|' ||
C.CEPCOB || '|' ||
'CIF' || '|' ||
LPAD (1, 2, 0) 

FROM PCMOV P
left join PCCLIENT c on  p.codcli = c.codcli
wHERE 
P.CODOPER='S' AND
P.DTMOV >=:DTINI AND
P.DTMOV <=:DTFIM


