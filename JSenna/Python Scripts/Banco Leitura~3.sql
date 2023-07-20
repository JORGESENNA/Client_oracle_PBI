select 
    pcmovendpend.NUMPED, 
    pcpedc.origemped,
    pcpedc.data,   
    pcpedc.dtentrega,
    pcpedc.dtlibera,
    pcpedc.codfunclibera ,
    (select nome from pcempr where matricula = pcpedc.codfunclibera) nomefunclibera,
    pcpedc.motivoposicao,  
    case pcpedc.motivoposicao 
    when 'B' then 'Bloqueado' 
    when 'C' then 'Cancelado'
    else 'Liberado' end as posicaomed,
    pcpedc.motivoposicao,
    pcpedc.hora, 
    pcpedc.minuto, 
    pcpedc.dtwms as dtwms_1757 ,
    pcmovendpend.datageracao as datageracao_1752,
    case pcmovendpend.posicao 
    when 'C' then 'Concluido' 
    when 'P' then 'Pendente'
    else 'Aguardando' end as Le_Pos,
    pcmovendpend.posicao,
    pcmovendpend.codfuncger ,
    pcclient.CLIENTE, 
    pcpedc.codcob,
--tag 1942022 VANESSA BAPTISTA
    pcpedc.codusur,
    (select nome from pcusuari where codusur = pcpedc.codusur) RCA, 

    pcpedc.vltotal, 
    pcpraca.PRACA 
from pcmovendpend, 
   pcpedc, 
   pcclient, 
   pcpraca 
where 1 = 1
and pcpedc.CODCLI = pcclient.CODCLI
and pcpedc.CODPRACA = pcpraca.CODPRACA
and pcpedc.NUMPED = pcmovendpend.NUMPED
--AND pcmovendpend.DATA BETWEEN :DTLANCINI AND :DTLANCFIM
and pcmovendpend.DTESTORNO is null
--and pcmovendpend.POSICAO=:POSICAO
AND pcmovendpend.TIPOOS In ('13','20','22')
group by pcmovendpend.NUMPED, pcpedc.origemped,pcpedc.data, pcpedc.hora, pcpedc.minuto, pcpedc.dtlibera, pcpedc.codfunclibera  ,pcpedc.dtentrega, pcpedc.dtwms, pcmovendpend.datageracao,pcmovendpend.posicao, pcmovendpend.codfuncger ,pcclient.CLIENTE, pcpedc.codcob, pcpedc.codusur,  pcpedc.vltotal, pcpraca.PRACA, pcpedc.motivoposicao
