view: order_details {
  sql_table_name: dwh_dla_acl.customers_360_datasets ;;

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }
  dimension: sales {
    type: number
    sql: ${TABLE}.sales ;;
  }
  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }
 }
