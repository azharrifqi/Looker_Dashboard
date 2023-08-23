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
      label: "Repeat Orders within 2 Month"
      value: "count_with_repeat_purchase_within_60d"
    }
    allowed_value: {
      label: "Repeat Orders within 6 Month"
      value: "count_with_repeat_purchase_within_6m"
    }
  }

  }
