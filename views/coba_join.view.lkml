view: coba_join {
  derived_table: {
    sql: SELECT
          *
        FROM `dla-data-warehouse.dwh_dla_acl.superstore_datasets`
        WHERE
        {% condition order_region %} region {% endcondition %};;
  }

  filter: order_region {
    type: string
    sql: {% condition order_region %} ${region} {% endcondition %} ;;
  }
  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }
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
    # drill_fields: [region, country, total_cost]
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

 }
