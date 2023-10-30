view: test01 {
    sql_table_name:`dwh_dla_acl.superstore_datasets` ;;

  dimension: order_id {
    type: string
    sql: ${TABLE}.order_id ;;
  }

  dimension: total_profit1 {
    type: number
    sql: ${TABLE}.total_profit ;;
  }

  dimension: orde_date {
    type: date
    sql: ${TABLE}.order_date ;;
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
      drill_fields: [sub_category]
      link: {
        label: "success"
        url: "https://datalabs.cloud.looker.com/embed/dashboards/34?Category={{value}}"
        icon_url: "https://cdn.iconscout.com/icon/free/png-512/free-check-verified-successful-accept-tick-yes-success-2516.png?f=avif&w=256"
      }
      link: {
        label: "Fail"
        url: "https://datalabs.cloud.looker.com/embed/dashboards/36?Category={{value}}"
        icon_url: "https://cdn.iconscout.com/icon/premium/png-512-thumb/fail-5156466-4302609.png?f=avif&w=256"
      }
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
    measure: Januari {
      type: sum
      sql: ${TABLE}.total_profit  ;;
      filters: [Month_order_date: "1"]
    }
    measure: Febuary {
      type: sum
      sql: ${TABLE}.total_profit;;
      filters: [Month_order_date: "2"]
    }
    measure: March {
      type: sum
      sql: ${TABLE}.total_profit ;;
      filters: [Month_order_date: "3"]
    }
    measure: April {
      type: sum
      sql: ${TABLE}.total_profit  ;;
      filters: [Month_order_date: "4"]
    }
    measure: May {
      type: sum
      sql: ${TABLE}.total_profit  ;;
      filters: [Month_order_date: "5"]
    }
    measure: June {
      type: sum
      sql: ${TABLE}.total_profit  ;;
      filters: [Month_order_date: "6"]
    }
    measure: July {
      type: sum
      sql: ${TABLE}.total_profit  ;;
      filters: [Month_order_date: "7"]
    }
    measure: August {
      type: sum
      sql: ${TABLE}.total_profit  ;;
      filters: [Month_order_date: "8"]
    }
    measure: September {
      type: sum
      sql: ${TABLE}.total_profit  ;;
      filters: [Month_order_date: "9"]
    }
    measure: October {
      type: sum
      sql: ${TABLE}.total_profit  ;;
      filters: [Month_order_date: "10"]
    }
    measure: November {
      type: sum
      sql: ${TABLE}.total_profit  ;;
      filters: [Month_order_date: "11"]
    }
    measure: December {
      type: sum
      sql: ${TABLE}.total_profit ;;
      filters: [Month_order_date: "12"]
    }
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


  parameter: param_2month {
    type: string
    allowed_value: {
      value: "This_Month"
    }
    allowed_value: {
      value: "Not_this_month"
    }

  }

  dimension: month_until_next_order {
    label: "Month Until Next Order"
    type: number
    # view_label: "Repeat Purchase Facts"
    sql: EXTRACT(MONTH FROM current_date())-EXTRACT(MONTH FROM ${order_date}) ;;
  }

  dimension: This_Month {
    type: yesno
    sql: ${month_until_next_order} <=1 AND ${month_until_next_order} >= 0;;
  }
  dimension: Not_this_month{
    type: yesno
    sql:  ${month_until_next_order} <= 2 AND ${month_until_next_order} > 0;;
  }

  measure: count_This_Month {
    type: sum
    sql: ${TABLE}.total_profit ;;

    filters: {
      field: This_Month
      value: "Yes"
    }
  }

  measure: count_Not_this_month {
    type: sum
    sql: ${TABLE}.total_profit ;;

    filters: {
      field: Not_this_month
      value: "Yes"
    }
  }
  measure: Total_2Bulan{
    type: number
    sql: CASE
          WHEN {% parameter param_2month %} = "This_Month" THEN ${count_This_Month}
          WHEN {% parameter param_2month %} = "Not_this_month" THEN ${count_Not_this_month}
          END;;
  }

  measure: Avg_This_Month {
    type: average
    sql: ${TABLE}.total_profit ;;

    filters: {
      field: This_Month
      value: "Yes"
    }
  }

  measure: Avg_Not_this_month {
    type: average
    sql: ${TABLE}.total_profit ;;

    filters: {
      field: Not_this_month
      value: "Yes"
    }
  }
  measure: Avg_2Bulan{
    type: number
    sql: ${Total_2Bulan}/2;;
  }
  parameter: Include_ongoing_Month{
    type: unquoted
    allowed_value: {
      label: "2014"
      value: "2014"
    }
    allowed_value: {
      label: "2013"
      value: "2013"
    }
    allowed_value: {
      label: "2012"
      value: "2012"
    }
  }
  dimension: year {
    type: string
    sql: CASE
            WHEN {% parameter Include_ongoing_Month %} =  ${order_year} THEN {% parameter Include_ongoing_Month %}
            WHEN {% parameter Include_ongoing_Month %}-1 = ${order_year} THEN {% parameter Include_ongoing_Month %} -1
          END;;
  }
  measure: test {
    type: number
    sql: sum(${total_profit})/ EXTRACT(MONTH FROM current_date()) ;;
  }
  measure: avg_last_2_months {
    type: average
    sql: ${order_date} >= (current_date() - interval '2 months') ;;
  }
  measure: avg_12bulan {
    type: number
    sql: ${total_profit}/12 ;;
    value_format: "#,###.00"
  }
  measure: total_profit {
    type: sum
    sql: ${TABLE}.total_profit ;;
  }

  dimension: category_with_liquid {
    type: string
    sql: ${category} ;;
    link: {
      label: "success"
      url: "https://datalabs.cloud.looker.com/embed/dashboards/34?category={{value}}"
      icon_url: "https://cdn.iconscout.com/icon/free/png-512/free-check-verified-successful-accept-tick-yes-success-2516.png?f=avif&w=256"
    }
    link: {
      label: "Fail"
      url: "https://datalabs.cloud.looker.com/embed/dashboards/36?category={{value}}"
      icon_url: "https://cdn.iconscout.com/icon/premium/png-512-thumb/fail-5156466-4302609.png?f=avif&w=256"
    }
  }

  # ========================================= #
  dimension: wtd_only {
    group_label: "To-Date Filters"
    label: "WTD"
    view_label: "_PoP"
    type: yesno
    sql:  (EXTRACT(DAYOFWEEK FROM ${order_raw}) < EXTRACT(DAYOFWEEK FROM CURRENT_DATE())
                    OR
                (EXTRACT(DAYOFWEEK FROM ${order_raw}) = EXTRACT(DAYOFWEEK FROM CURRENT_DATE()) AND
                EXTRACT(HOUR FROM ${order_raw}) < EXTRACT(HOUR FROM CURRENT_DATE()))
                    OR
                (EXTRACT(DAYOFWEEK FROM ${order_raw}) = EXTRACT(DAYOFWEEK FROM CURRENT_DATE()) AND
                EXTRACT(HOUR FROM ${order_raw}) <= EXTRACT(HOUR FROM CURRENT_DATE()) AND
                EXTRACT(MINUTE FROM ${order_raw}) < EXTRACT(MINUTE FROM CURRENT_DATE())))  ;;
  }

  dimension: mtd_only {
    group_label: "To-Date Filters"
    label: "MTD"
    view_label: "_PoP"
    type: yesno
    sql:  (EXTRACT(DAY FROM ${order_raw}) < EXTRACT(DAY FROM CURRENT_DATE())
                    OR
                (EXTRACT(DAY FROM ${order_raw}) = EXTRACT(DAY FROM CURRENT_DATE()) AND
                EXTRACT(HOUR FROM ${order_raw}) < EXTRACT(HOUR FROM CURRENT_DATE()))
                    OR
                (EXTRACT(DAY FROM ${order_raw}) = EXTRACT(DAY FROM CURRENT_DATE()) AND
                EXTRACT(HOUR FROM ${order_raw}) <= EXTRACT(HOUR FROM CURRENT_DATE()) AND
                EXTRACT(MINUTE FROM ${order_raw}) < EXTRACT(MINUTE FROM CURRENT_DATE())))  ;;
  }

  dimension: ytd_only {
    group_label: "To-Date Filters"
    label: "YTD"
    view_label: "_PoP"
    type: yesno
    sql:  (EXTRACT(DOY FROM ${order_raw}) < EXTRACT(DOY FROM CURRENT_DATE())
                    OR
                (EXTRACT(DOY FROM ${order_raw}) = EXTRACT(DOY FROM CURRENT_DATE()) AND
                EXTRACT(HOUR FROM ${order_raw}) < EXTRACT(HOUR FROM CURRENT_DATE()))
                    OR
                (EXTRACT(DOY FROM ${order_raw}) = EXTRACT(DOY FROM CURRENT_DATE()) AND
                EXTRACT(HOUR FROM ${order_raw}) <= EXTRACT(HOUR FROM CURRENT_DATE()) AND
                EXTRACT(MINUTE FROM ${order_raw}) < EXTRACT(MINUTE FROM CURRENT_DATE())))  ;;
  }

  measure: count {
    label: "Count of order_items"
    type: count
    hidden: yes
  }
  measure: count_orders {
    label: "Count of orders"
    type: count_distinct
    sql: ${order_id} ;;
    hidden: yes
  }

  measure: total_sale_price {
    label: "Total Sales"
    view_label: "_PoP"
    type: sum
    sql: ${total_profit} ;;
    value_format_name: usd
    drill_fields: [order_date]
  }

}
