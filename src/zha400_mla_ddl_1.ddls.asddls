@AbapCatalog.sqlViewName: 'ZHA400_MLA_SQL_1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'HA400 - CDS View 1'
define view ZHA400_MLA_DDL_1
  as select from scarr as a
    inner join   sbook as b on a.carrid = b.carrid
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
where
     cancelled <> 'X'
  or cancelled is null
group by
  a.carrid,
  a.carrname,
  a.currcode
