view: checkg {
  sql_table_name: `dwh_dla_acl.superstore_datasets` ;;

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
  # dimension: Status {
  #   type: string
  #   sql: case when ${TABLE}.profit >= 75 then "success"
  #     when ${TABLE}.profit <= 74 then "Fail"
  #     end;;
  # }
  dimension: sub_category {
    type: string
    sql: status_fail.sub_category ;;
  }
}
