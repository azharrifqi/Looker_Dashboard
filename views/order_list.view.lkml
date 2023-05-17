view: order_list {
  sql_table_name: dwh_dla_acl.customers_360_datasets ;;

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
 }

dimension: Customer_name {
  type: string
  sql: ${TABLE}.customer_name ;;
}
}
