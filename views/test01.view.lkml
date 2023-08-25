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


  parameter: param_2month {
    type: string
    allowed_value: {
      value: "This_Month"
    }
    allowed_value: {
      value: "Not_this_month"
    }

  }
  dimension: days_until_next_order {
    label: "Month Until Next Order"
    type: number
    # view_label: "Repeat Purchase Facts"
    sql: EXTRACT(MONTH FROM current_date())-EXTRACT(MONTH FROM ${order_date}) ;;
  }

  dimension: This_Month {
    type: yesno
    sql: ${days_until_next_order} <=1 AND ${days_until_next_order} >= 0;;
  }
  dimension: Not_this_month{
    type: yesno
    sql:  ${days_until_next_order} <= 2 AND ${days_until_next_order} > 0;;
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
    sql: CASE
          WHEN {% parameter param_2month %} = "This_Month" THEN ${Avg_This_Month}
          WHEN {% parameter param_2month %} = "Not_this_month" THEN ${Avg_Not_this_month}
          END;;
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
  }
  dimension: year {
    type: string
    sql: CASE
            WHEN {% parameter Include_ongoing_Month %} = "2014" THEN ${order_year}
            WHEN {% parameter Include_ongoing_Month %}-1 = "2014" THEN ${order_year} -1
          END;;
  }

  }
