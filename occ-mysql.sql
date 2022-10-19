select 
   date_format(od.vstdate, '%d/%m/%Y') as date_dx
 , v.age_y
 , s.name as sex
 , t3.name as tmbpart
 , t2.name as amppart
 , t1.name as chwpart
 , od.diagtype
 , od.icd10
 , st.name as spclty
 from 
 ovstdiag od 
 LEFT OUTER JOIN vn_stat v on v.vn=od.vn    
 LEFT JOIN sex s ON s.code=v.sex 
 LEFT JOIN patient p ON p.hn=od.hn 
 LEFT OUTER JOIN ovst o ON o.vn=od.vn 
 LEFT OUTER JOIN spclty st on st.spclty=o.spclty 
 LEFT OUTER JOIN thaiaddress t1 on t1.chwpart=p.chwpart and t1.amppart='00' and t1.tmbpart='00'  
 LEFT OUTER JOIN thaiaddress t2 on t2.chwpart=p.chwpart and t2.amppart=p.amppart and t2.tmbpart='00' 
 LEFT OUTER JOIN thaiaddress t3 on t3.chwpart=p.chwpart and t3.amppart=p.amppart and t3.tmbpart=p.tmbpart  
 where od.vstdate >= '2017-01-01'
 and od.icd10 regexp '^I6|^I2|^I4[89]|^R00|^J4[34]|^J441|^J45|^I24|^I2[23]|^J4[56]|^J[01]|^H1|^C34|^L[23]|^Y96|^Y97|^Z581'
