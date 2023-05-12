view: coba_test {
  sql_table_name: dwh_dla_acl.customers_360_datasets ;;

measure: Total_Customer {
  type: count_distinct
  sql: customer_id ;;
}
}
