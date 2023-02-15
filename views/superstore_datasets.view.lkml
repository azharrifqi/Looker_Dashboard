# The name of this view in Looker is "Superstore Datasets"
view: superstore_datasets {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `dwh_dla_acl.superstore_datasets`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Category" in Explore.

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }


  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_cost {
    type: sum
    sql: ${cost} ;;
  }

  measure: average_cost {
    type: average
    sql: ${cost} ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}.customer_name ;;
  }

  dimension: gmv {
    type: number
    sql: ${TABLE}.gmv ;;
  }

  dimension: lat {
    type: number
    sql: ${TABLE}.lat ;;
  }

  dimension: lon {
    type: number
    sql: ${TABLE}.lon ;;
  }

  dimension: latlong {
    type: location
    sql_latitude: ${lat} ;;
    sql_longitude: ${lon} ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

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

  dimension: order_id {
    type: string
    sql: ${TABLE}.order_id ;;
  }

  dimension: profit {
    type: number
    sql: ${TABLE}.profit ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: segment {
    type: string
    sql: ${TABLE}.segment ;;
  }

  dimension_group: ship {
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
    sql: ${TABLE}.ship_date ;;
  }

  dimension: ship_mode {
    type: string
    sql: ${TABLE}.ship_mode ;;
  }

  dimension: sub_category {
    type: string
    sql: ${TABLE}.sub_category ;;
  }

  # dimension: total_cost {
  #   type: number
  #   sql: ${TABLE}.total_cost ;;
  # }

  dimension: total_gmv {
    type: number
    sql: ${TABLE}.total_gmv ;;
  }

  dimension: total_profit {
    type: number
    sql: ${TABLE}.total_profit ;;
  }

  measure: show_total {
    type: number
    sql: sum(${mtotal_profit}) over() ;;
  }

  measure: count {
    type: count
    drill_fields: [customer_name]
  }

  measure: mtotal_profit {
    type: sum
    sql: ${total_profit} ;;
  }

  measure: mtotal_gmv {
    type: sum
    sql: ${total_gmv} ;;
  }

  measure: total_order {
    type: count_distinct
    sql: ${order_id} ;;
  }

  measure: prev_profit {
    type: sum
    sql: ${total_profit} ;;
    filters: [order_date: "10 year ago"]
  }

  measure: prev1_profit {
    type: sum
    sql: ${total_profit} ;;
    filters: [order_date: "11 year ago"]
  }

  measure: provit_growth {
    type: number
    sql: (${prev_profit}-${prev1_profit})/${prev_profit} ;;
  }

  measure: max_date {
    type: date
    sql: MAX(${order_date}) ;;
  }

  dimension: view {
    type: string
    sql: ${city} ;;
    html: <div style="font-size:10px; text-transform:capitalize;"><br>
    <Link href="https://datalabs.cloud.looker.com/looks/2">
    <div>;;
  }
}
