view: order_list {
  sql_table_name: dwh_dla_acl.order_lists ;;

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
 }

dimension: Customer_name {
  type: string
  sql: ${TABLE}.customer_name ;;
}


  dimension: sdwa {
    type: string
    sql: ${TABLE}.customer_name ;;
  }
}
