view: checkg {
  derived_table: {
    sql: SELECT * FROM  dwh_dla_acl.customers_360_datasets a
    ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }
  dimension: profit {
    type: number
    sql: ${TABLE}.profit ;;
  }
  dimension: gmv {
    type: number
    sql: ${TABLE}.gmv ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }
  dimension: Status {
    type: string
    sql: case when ${TABLE}.profit >= 75 then "success"
      when ${TABLE}.profit <= 74 then "Fail"
      end;;
  }
  dimension: total_gmv {
    type: number
    sql: ${TABLE}.total_gmv ;;
  }
  dimension: mtotal_profit {
    type: number
    sql: ${TABLE}.total_profit ;;
  }
  measure: MTotal_gmv{
    type: sum
    sql: ${total_gmv} ;;
  }
  measure: MTotal_profit {
    type: sum
    sql: ${mtotal_profit} ;;
  }
}
