view: coba_test {
  sql_table_name: dwh_dla_acl.customers_360_datasets ;;

dimension: Customer_id  {
  type: number
  sql: ${TABLE}.customer_id ;;
}

measure: Total_Customer {
  type: count_distinct
  sql: customer_id ;;
}
measure: bulan {
  type: string
  sql: EXTRACT(MONTH FROM date) ;;
}
}
