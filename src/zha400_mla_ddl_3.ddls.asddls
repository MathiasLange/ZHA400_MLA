@AbapCatalog.sqlViewName: 'ZHA400_MLA_SQL_3'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'HA400 - CDS View 3 with parameters'
define view ZHA400_MLA_DDL_3
  with parameters
    language : spras
  as select from ZHA400_MLA_DDL_2 as v
  association to tcurt on v.currcode = tcurt.waers
{
  v.carrid,
  v.carrname,
  v.currcode,
  v.revenue_first,
  v.revenue_business,
  v.revenue_economy,
  coalesce( tcurt[ spras = :language ].ltext,
            tcurt[ spras = 'E' ].ltext ) as ltext
}
