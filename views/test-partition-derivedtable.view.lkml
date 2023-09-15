view: test_partition_derivedtable {
  derived_table: {
    explore_source: superstore_datasets {
      column: date {
        field: superstore_datasets.order_date
      }
      column: category {
        field: superstore_datasets.category
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

}