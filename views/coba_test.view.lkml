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

  dimension: Customer_Age2 {
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
  action: {
    label: "test"
    url: "https://hooks.zapier.com/hooks/catch/15647510/3hic4fv/"
  }
}

measure: coba {
  type: number
  sql: case when ${Customer_Age} then ${Customer_2020} end  ;;
}
measure: Customer_2020 {
  type: count_distinct
  sql: customer_id ;;
}

dimension_group: Date {
  type: time
  timeframes: [
    date,
    month,
    year
  ]
}
  measure: customer_2021 {
    type: count_distinct
    sql: customer_id ;;

  }

  measure: count {
    type: count
    drill_fields: []
  }

measure: total {
  type: number
  sql: count(${Customer_id});;
}
  measure: total2 {
    type: count_distinct
    sql: customer_id ;;
  }
  measure: last_update {
    type: date
    value_format: "YYYYMMM"
    sql: MAX(${Date_date}) ;;
  }
  measure: total_revenue {
    type: number
    sql: ${TABLE}.total_revenue ;;
  }
  measure: min_total_revenue {
    type: number
    sql: min(${total_revenue}) ;;
  }
  measure: max_total_revenue {
    type: number
    sql: max(${total_revenue}) ;;
  }
  measure: man_total_revenue {
    type: number
    sql: min(${total_revenue}) ;;
  }

}
