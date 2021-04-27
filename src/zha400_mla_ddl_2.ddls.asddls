@AbapCatalog.sqlViewName: 'ZHA400_MLA_SQL_2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'HA400 - CDS View 2'
define view ZHA400_MLA_DDL_2
  as select from scarr as a
  association [0..*] to sbook as b on  a.carrid    =  b.carrid
                                   and b.cancelled <> 'X'

{
  a.carrid,
  a.carrname,
  a.currcode,
  sum(
          case b.class
          when 'F' then b.loccuram
          else 0
          end
     ) as revenue_first,
  sum(
          case b.class
          when 'C' then b.loccuram
          else 0
          end
     ) as revenue_business,
  sum(
          case b.class
          when 'Y' then b.loccuram
          else 0
          end
     ) as revenue_economy
}
group by
  a.carrid,
  a.carrname,
  a.currcode
