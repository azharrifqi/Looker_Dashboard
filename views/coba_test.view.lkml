view: coba_test {
  sql_table_name: dwh_dla_acl.customers_360_datasets ;;

dimension: Customer_id  {
  type: number
  sql: ${TABLE}.customer_id ;;
}
dimension: customer_type {
  type: string
  sql: ${TABLE}.customer_type ;;
}

dimension: Customer_Age {
  type: number
  sql: ${TABLE}.customer_age ;;
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
