select distinct  p.codprod,p.descricao,p.punit,p.dtmov,round(tp.ptabela,2)ptabela,round(tp.pvenda,2)pvenda,
pe.dtultent,
pe.dtultsaida,
PE.DTULTPEDCOMPRA,
pe.qtestger-pe.qtindeniz FILIAL01 ,
(SELECT  case when PD.qtestger-pe.qtindeniz<0 THEN 0 when PD.qtestger-pe.qtindeniz is null THEN 0 else PD.qtestger-pe.qtindeniz end FROM PCEST PD WHERE PD.codprod=p.codprod AND PD.codfilial=4  )FILIAL04,
(SELECT  case when PD2.qtestger-pe.qtindeniz<0 THEN 0 when PD2.qtestger-pe.qtindeniz is null THEN 0 else PD2.qtestger-pe.qtindeniz end  FROM PCEST PD2 WHERE PD2.codprod=p.codprod AND PD2.codfilial=9  )FILIAL09,
(SELECT  case when PD3.qtestger-pe.qtindeniz<0 THEN 0 when PD3.qtestger-pe.qtindeniz is null THEN 0 else PD3.qtestger-pe.qtindeniz end  FROM PCEST PD3 WHERE pD3.codprod=p.codprod AND pD3.codfilial=13  )FILIAL13,
--TO_DATE(SYSDATE, 'DD/MM/YYYY') - TO_DATE(PE.DTULTPEDCOMPRA, 'DD/MM/YYYY')DIASULTIMACOMPRA,
--TO_DATE(SYSDATE, 'DD/MM/YYYY') - TO_DATE(pe.dtultsaida, 'DD/MM/YYYY')DIApeultsaida,
--TO_DATE(SYSDATE, 'DD/MM/YYYY') - TO_DATE(pe.dtultent, 'DD/MM/YYYY')DIAdtultent,
DP.DESCRICAO DEP
from 
 PCmov p
left join PCEST pe on p.codprod=pe.codprod and p.dtmov=pe.dtultent
left join pcprodut po on p.codprod=po.codprod
left join papelex_markup_depto pd on po.codepto=pd.codepto 
left join pctabpr tp on tp.numregiao=pd.numregiao and tp.codprod=po.codprod
LEFT JOIN PCDEPTO DP ON po.codepto=DP.codepto
where 
p.codfilial=1  and
po.dtexclusao is null and 
p.codoper='E'  
and pe.dtultent is not null 
and p.dtcancel is null 


--/*
--SELECT TO_DATE('2000-01-02', 'YYYY-MM-DD') -
--TO_DATE('2000-01-01', 'YYYY-MM-DD') AS DateDiff
--FROM dual
---select to_date('2009-07-06', 'YYYY-MM-DD') 
   --          - to_date('2009-07-07', 'YYYY-MM-DD') AS DateDiff 
    --   from dual;

