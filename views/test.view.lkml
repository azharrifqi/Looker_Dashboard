view: test {

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

  dimension: city2 {
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
    primary_key: yes
  }

  dimension: country_action {
    action: {
      label: "Action"
      url: "https://hooks.zapier.com/hooks/catch/15553329/3h99xvt/"
      icon_url: "https://looker.com/favicon.ico"
      form_url: "https://example.com/ping/{{ value }}/form.json"
      param: {
        name: "name string"
        value: "value string"
      }
      form_param: {
        name: "name string"
        type: string
        label: "possibly-localized-string"
        option: {
          name: "name string"
          label: "possibly-localized-string"
        }
        required: no
        description: "possibly-localized-string"
        default: "string"
      }
      user_attribute_param: {
        user_attribute: country
        name: "name_for_json_payload"
      }
    }
    link: {
      label: "success"
      url: "https://datalabs.cloud.looker.com/embed/dashboards/34?City={{value}}"
      icon_url: "https://cdn.iconscout.com/icon/free/png-512/free-check-verified-successful-accept-tick-yes-success-2516.png?f=avif&w=256"
    }
    sql: ${country} ;;
  }


  dimension: countries {
    type: string
    map_layer_name: countries
    drill_fields: [category,region]
    sql: ${TABLE}.country ;;
  }

  # drill_fields: [region, country, city]


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

  dimension: product_image {
    sql: ${sub_category} ;;
    html: <img src="https://www.altostrat.com/product_images/{{ value }}.jpg" /> ;;
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
    label: "Total Profit"
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
    sql: sum(${mtotal_profit}) over() ;;
  }

  measure: show_total_not_over {
    type: number
    label: "Total Profit"
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
    sql: sum(${total_profit}) ;;
  }

  measure: show_profit {
    type: number
    label: "Profit"
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
    sql: sum(${profit});;
  }

  measure: count {
    type: count
    drill_fields: [region, ship_mode, mtotal_profit]
  }

  measure: mtotal_profit {
    type: sum
    sql: ${total_profit} ;;
    drill_fields: [category, region, country, ship_mode, mtotal_profit]
  }

  measure: mtotal_gmv {
    type: sum
    sql: ${total_gmv} ;;
  }

  measure: total_order {
    type: count_distinct
    sql: ${order_id} ;;
    drill_fields: [order_date, total_profit]
    link: {
      label: "Show as scatter plot"
      url: "
      {% assign vis_config = '{
      \"stacking\" : \"\",
      \"show_value_labels\" : false,
      \"label_density\" : 25,
      \"legend_position\" : \"center\",
      \"x_axis_gridlines\" : true,
      \"y_axis_gridlines\" : true,
      \"show_view_names\" : false,
      \"limit_displayed_rows\" : false,
      \"y_axis_combined\" : true,
      \"show_y_axis_labels\" : true,
      \"show_y_axis_ticks\" : true,
      \"y_axis_tick_density\" : \"default\",
      \"y_axis_tick_density_custom\": 5,
      \"show_x_axis_label\" : false,
      \"show_x_axis_ticks\" : true,
      \"x_axis_scale\" : \"auto\",
      \"y_axis_scale_mode\" : \"linear\",
      \"show_null_points\" : true,
      \"point_style\" : \"circle\",
      \"ordering\" : \"none\",
      \"show_null_labels\" : false,
      \"show_totals_labels\" : false,
      \"show_silhouette\" : false,
      \"totals_color\" : \"#808080\",
      \"type\" : \"looker_scatter\",
      \"interpolation\" : \"linear\",
      \"series_types\" : {},
      \"colors\": [
      \"palette: Santa Cruz\"
      ],
      \"series_colors\" : {},
      \"x_axis_datetime_tick_count\": null,
      \"trend_lines\": [
      {
      \"color\" : \"#000000\",
      \"label_position\" : \"left\",
      \"period\" : 30,
      \"regression_type\" : \"average\",
      \"series_index\" : 1,
      \"show_label\" : true,
      \"label_type\" : \"string\",
      \"label\" : \"30 day moving average\"
      }
      ]
      }' %}
      {{ link }}&vis_config={{ vis_config | encode_uri }}&toggle=dat,pik,vis&limit=5000"
    }
  }

  measure: prev_profit {
    type: sum
    sql: ${total_profit} ;;
    filters: [order_date: "10 year ago"]
  }

  measure: prev11_profit {
    type: sum
    sql: ${total_profit} ;;
    filters: [order_date: "11 year ago"]
  }

  measure: provit_growth {
    type: number
    sql: (${prev_profit}-${prev11_profit})/${prev_profit} ;;
  }

  dimension: max_date {
    type: date
    sql: MAX(${order_date}) ;;
  }

  measure: filter_max_date {
    type: yesno
    sql: ${order_date}=MAX(${order_date})  ;;
  }

  dimension: view {
    type: string
    sql: ${city} ;;
    html: <div style="font-size:10px; text-transform:capitalize;"><br>
          <Link href="https://datalabs.cloud.looker.com/looks/2">
          <div>;;
  }
  measure: total_gross_margin {
    type: sum
    value_format_name: decimal_2
    sql: ${total_profit} ;;
    html: {{ rendered_value }} | {{value}} of total | <li> dialect: {{ _dialect._name }} </li>
    <li> user attribute: {{ _user_attributes }} </li>;;
  }

  measure: Test {
    type: sum
    sql: ${total_profit} ;;
  }

  # measure: TestHide {
  #   type: sum
  #   required_access_grants: []
  #   hidden: yes
  #   sql: ${total_profit} ;;
  # }
  measure: TestTest {
    required_access_grants: [admin_only]
    type: sum
    # hidden: yes
    sql: ${total_profit} ;;
  }

  measure: percentage {
    type: number
    sql: (sum(${profit})/SUM(${total_profit}))*100 ;;
    drill_fields: [country, show_profit, show_total_not_over]
  }

  measure: test_action_measure {
    action: {
      label: "Action"
      url: "https://hooks.zapier.com/hooks/catch/15553329/3h99xvt/"
      icon_url: "https://looker.com/favicon.ico"
      form_url: "https://example.com/ping/{{ value }}/form.json"
      param: {
        name: "name string"
        value: "value string"
      }
      form_param: {
        name: "name string"
        type: select
        label: "possibly-localized-string"
        option: {
          name: "name string"
          label: "possibly-localized-string"
        }
        required: no
        description: "possibly-localized-string"
        default: "string"
      }
      user_attribute_param: {
        user_attribute: country
        name: "name_for_json_payload"
      }
    }
    sql: ${Test} ;;
  }

  measure: test_ADI {
    type: number
    sql: ${Test} ;;
  }
  measure: check_new_measure {
    type: number
    sql: ${test_ADI} ;;
  }

}
