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
dimension: Date_Transaction{
  type: date_day_of_month
  sql: ${TABLE}.date ;;
}

dimension: Customer_Age {
  type: number
  sql: ${TABLE}.customer_age ;;
}

dimension: Kelompok_Usia {
  type: string
  sql: CASE WHEN ${TABLE}.customer_age BETWEEN 17 AND 25 THEN "REMAJA"
  WHEN customer_age BETWEEN 26 AND 50 then "DEWASA"
  WHEN customer_age >= 51 then "LANSIA"
  END
  ;;
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