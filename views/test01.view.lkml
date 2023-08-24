view: test01 {
    sql_table_name:`dwh_dla_acl.superstore_datasets` ;;


    dimension: total_profit {
      type: number
      sql: ${TABLE}.total_profit ;;
    }

    dimension: Year_order_date {
      type: number
      sql: EXTRACT(YEAR FROM ${TABLE}.order_date) ;;
    }
    dimension_group: order {
      type: time
      timeframes: [
        raw,
        date,
        week,
        month,
        quarter,
        year
      ]
      convert_tz: no
      datatype: date
      sql: ${TABLE}.order_date ;;
    }

    dimension: category {
      type: string
      sql: ${TABLE}.category ;;
    }
    dimension: sub_category {
      type: string
      sql: ${TABLE}.sub_category ;;
      primary_key: yes
    }

    dimension: Month_order_date {
      type: number
      sql: EXTRACT(MONTH FROM ${TABLE}.order_date) ;;
    }
    # measure: Januari {
    #   type: sum
    #   sql: ${total_profit}  ;;
    #   filters: [Month_order_date: "1"]
    # }
    # measure: Febuary {
    #   type: sum
    #   sql: ${total_profit};;
    #   filters: [Month_order_date: "2"]
    # }
    # measure: March {
    #   type: sum
    #   sql: ${total_profit} ;;
    #   filters: [Month_order_date: "3"]
    # }
    # measure: April {
    #   type: sum
    #   sql: ${TABLE}.total_profit  ;;
    #   filters: [Month_order_date: "4"]
    # }
    # measure: May {
    #   type: sum
    #   sql: ${total_profit}  ;;
    #   filters: [Month_order_date: "5"]
    # }
    # measure: June {
    #   type: sum
    #   sql: ${total_profit}  ;;
    #   filters: [Month_order_date: "6"]
    # }
    # measure: July {
    #   type: sum
    #   sql: ${total_profit}  ;;
    #   filters: [Month_order_date: "7"]
    # }
    # measure: August {
    #   type: sum
    #   sql: ${total_profit}  ;;
    #   filters: [Month_order_date: "8"]
    # }
    # measure: September {
    #   type: sum
    #   sql: ${total_profit}  ;;
    #   filters: [Month_order_date: "9"]
    # }
    # measure: October {
    #   type: sum
    #   sql: ${total_profit}  ;;
    #   filters: [Month_order_date: "10"]
    # }
    # measure: November {
    #   type: sum
    #   sql: ${total_profit}  ;;
    #   filters: [Month_order_date: "11"]
    # }
    # measure: December {
    #   type: sum
    #   sql: ${total_profit} ;;
    #   filters: [Month_order_date: "12"]
    # }
    # measure: Total_Omzet{
    #   type: sum
    #   sql: ${total_profit};;
    # }
    # measure: AVG_12Bulan {
    #   type: average
    #   sql: ${total_profit} ;;
    # }
    # measure: Groupby{
    #   type: sum
    #   sql: sum(${total_profit}) OVER (PARTITION BY ${category});;
    #   # drill_fields: [category]
    # }

    measure: Fixed {
      type: number
      sql: ${test2.groupby};;
    }

  parameter: param2m {
    type: string
    allowed_value: {
      label: "Yes"
      value: "This_Month"
    }
    allowed_value: {
      label: "No"
      value: "Not_this_month"
    }
  }
  dimension: days_until_next_order {
    label: "Month Until Next Order"
    type: number
    # view_label: "Repeat Purchase Facts"
    sql: EXTRACT(MONTH FROM current_date())-EXTRACT(MONTH FROM ${order_date}) ;;
  }
  dimension: repeat_orders_within_60d {
    label: "Repeat Orders within End Date"
    type: yesno
    # view_label: "Repeat Purchase Facts"
    sql: ${days_until_next_order} <=1 AND ${days_until_next_order} >= 0;;
  }
  dimension: repeat_orders_within_2m{
    label: "Repeat Orders within 2 Month"
    type: yesno
    sql:  ${days_until_next_order} <= 2 AND ${days_until_next_order} > 0;;
  }
  measure: count_with_repeat_purchase_within_60d {
    label: "Count with Repeat Purchase within 2 Month"
    type: sum
    sql: ${TABLE}.total_profit ;;
    # view_label: "Repeat Purchase Facts"

    filters: {
      field: repeat_orders_within_60d
      value: "Yes"
    }
  }
  measure: count_with_repeat_purchase_within_2m {
    label: "Count with Repeat Purchase within 2 Month"
    type: sum
    sql: ${TABLE}.total_profit ;;
    # view_label: "Repeat Purchase Facts"

    filters: {
      field: repeat_orders_within_2m
      value: "Yes"
    }
  }
  measure: Total_2Bulan {
    label: "Total_2Bulan"
    type: number
    sql: CASE
          WHEN {% parameter param2m %} = "count_with_repeat_purchase_within_60d" THEN ${count_with_repeat_purchase_within_60d}
          WHEN {% parameter param2m %} = "count_with_repeat_purchase_within_2m" THEN ${count_with_repeat_purchase_within_2m}
          END;;
          # value_format_name: "usd"
    }

  parameter: paramyear {
    type: unquoted
    # allowed_value: {
    #   label: "2011"
    #   value: "2011"
    # }
    # allowed_value: {
    #   label: "2012"
    #   value: "2012"
    # }
    allowed_value: {
      label: "2013"
      value: "2013"
    }
    allowed_value: {
      label: "2014"
      value: "2014"
    }
  }

  dimension: paramyear_2_year{
    label: "Year2"
    type: yesno
    # view_label: "Repeat Purchase Facts"
    sql: ${year} Is NOT NULL ;;
  }

  dimension: year {
    type: string
    sql: CASE
            WHEN {% parameter paramyear %} = ${order_year} THEN {% parameter paramyear %}
            WHEN {% parameter paramyear %}-1 = ${order_year} THEN {% parameter paramyear %}-1
          END;;
  }

  }
