view: test_partition_derivedtable {
  derived_table: {
    explore_source: superstore_datasets {
      column: date {
        field: superstore_datasets.order_date
      }
      column: category {
        field: superstore_datasets.category
      }
      column: sub_category {
        field: superstore_datasets.sub_category
      }
      column: region {
        field: superstore_datasets.region
      }
      column: total_profit {
        field: superstore_datasets.total_profit
      }
    }
    # partition_keys: ["date"]
    # cluster_keys: ["category","region"]
    # sql_trigger_value: superstore_project_default_datagroup ;;
  }


  dimension: category {
    description: "Unique ID for each user that has ordered"
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: sub_category {
    description: "Unique ID for each user that has ordered"
    type: string
    sql: ${TABLE}.sub_category ;;
  }

  dimension: region {
    description: "The total number of orders for each user"
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: date {
    description: "The date when each user last ordered"
    type: date
    # timeframes: [date, week, month, year]
    sql: ${TABLE}.date ;;
  }

  measure: total_profit {
    description: "Use this for counting lifetime orders across many users"
    type: sum
    sql: ${TABLE}.total_profit ;;
  }

  measure: avg_profit {
    description: "Use this for counting lifetime orders across many users"
    type: average
    sql: ${TABLE}.total_profit ;;
  }

  # filter: filter_profit {
  #   type: string
  #   # suggest_dimension: region
  # }

  # measure: show_profit {
  #   type: number
  #   sql: case
  #       when {% condition filter_profit %} = 'TEST' THEN ${total_profit}
  #       ELSE ${avg_profit}
  #       END;;
  # }
  measure: FI1 {
    type: sum
    sql: ${TABLE}.total_profit ;;
  }

  measure: FI2 {
    type: average
    sql: ${TABLE}.total_profit ;;
  }

  parameter: param_provit {
    type: string
    allowed_value: {
      value: "FI1"
      label: "Profit SUM"
    }
    allowed_value: {
      value: "FI2"
      label: "Profit AVG"
    }
  }

  measure: show_provit {
    type: number
    sql:
        CASE
          WHEN {% parameter param_provit %} = "FI1" THEN ${FI1}
          WHEN {% parameter param_provit %} = "FI2" THEN ${FI2}
        END ;;
  }
}
