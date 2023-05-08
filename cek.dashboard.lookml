- dashboard: cek
  title: cek
  layout: newspaper
  width: 600
  height: 400
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: jjwGtzx6om3U0t4M62Whhb
  elements:
  - title: Total Gmv by Category in Quarter
    name: Total Gmv by Category in Quarter
    model: superstore_project
    explore: superstore_datasets
    type: looker_line
    fields: [superstore_datasets.category, superstore_datasets.total_order, superstore_datasets.order_quarter]
    pivots: [superstore_datasets.category]
    fill_fields: [superstore_datasets.order_quarter]
    sorts: [superstore_datasets.category, superstore_datasets.order_quarter desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: superstore_datasets.total_order,
            id: Furniture - superstore_datasets.total_order, name: Furniture}, {axisId: superstore_datasets.total_order,
            id: Office Supplies - superstore_datasets.total_order, name: Office Supplies},
          {axisId: superstore_datasets.total_order, id: Technology - superstore_datasets.total_order,
            name: Technology}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: custom, tickDensityCustom: 25, type: linear}]
    x_axis_label: ''
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hide_legend: false
    font_size: ''
    series_types: {}
    series_colors:
      Furniture - superstore_datasets.mtotal_gmv: "#7CB342"
      Office Supplies - superstore_datasets.mtotal_gmv: "#1A73E8"
      Technology - superstore_datasets.mtotal_gmv: "#E8710A"
      Furniture - superstore_datasets.total_order: "#F9AB00"
      Office Supplies - superstore_datasets.total_order: "#150cc4"
      Technology - superstore_datasets.total_order: "#12B5CB"
    series_labels: {}
    label_color: []
    reference_lines: []
    ordering: asc
    show_null_labels: true
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#80868B"
    column_spacing_ratio: 0.2
    column_group_spacing_ratio:
    value_labels: labels
    label_type: labPer
    inner_radius: 10
    custom_color_enabled: true
    custom_color: "#079c98"
    show_single_value_title: true
    single_value_title: Total Gmv
    value_format: 0.000,, "K"
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: []
    groupBars: true
    labelSize: 10pt
    showLegend: true
    listen: {}
    row: 8
    col: 0
    width: 12
    height: 6
  - name: Total Cost
    title: Total Cost
    model: superstore_project
    explore: superstore_datasets
    type: single_value
    fields: [superstore_datasets.total_cost, superstore_datasets.order_month]
    fill_fields: [superstore_datasets.order_month]
    sorts: [superstore_datasets.order_month desc]
    limit: 500
    total: true
    dynamic_fields: [{category: table_calculation, expression: "${superstore_datasets.total_cost:total}",
        label: Total cost, value_format: !!null '', value_format_name: decimal_0,
        _kind_hint: measure, table_calculation: total_cost, _type_hint: number}, {
        category: table_calculation, label: Percent Change Cost, value_format: !!null '',
        value_format_name: percent_0, calculation_type: percent_difference_from_previous,
        table_calculation: percent_change_cost, args: [superstore_datasets.total_cost],
        _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    custom_color: "#F9AB00"
    single_value_title: Total Cost
    value_format: 0.000,, "K"
    comparison_label: Change from Previous Month
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_fields: [superstore_datasets.total_cost]
    listen: {}
    row: 4
    col: 7
    width: 7
    height: 4
  - title: Custom Color Map
    name: Custom Color Map
    model: superstore_project
    explore: superstore_datasets
    type: looker_map
    fields: [superstore_datasets.latlong, superstore_datasets.mtotal_profit]
    filters:
      superstore_datasets.ship_year: 2010/01/01 to 2012/01/01
    sorts: [superstore_datasets.latlong]
    limit: 20
    dynamic_fields: [{category: dimension, expression: 'concat(${superstore_datasets.lat},
          ", ", ${superstore_datasets.lon})', label: Longlat, value_format: !!null '',
        value_format_name: decimal_4, dimension: longlat, _kind_hint: dimension, _type_hint: string}]
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: streets
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: icon
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    title_hidden: true
    listen: {}
    row: 21
    col: 0
    width: 12
    height: 9
  - title: Total Gmv by Region and Category
    name: Total Gmv by Region and Category
    model: superstore_project
    explore: superstore_datasets
    type: looker_bar
    fields: [superstore_datasets.mtotal_gmv, superstore_datasets.category, superstore_datasets.region]
    pivots: [superstore_datasets.category]
    sorts: [superstore_datasets.mtotal_gmv desc 0, superstore_datasets.category]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: asc
    show_null_labels: true
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#80868B"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    y_axes: [{label: '', orientation: bottom, series: [{axisId: superstore_datasets.mtotal_gmv,
            id: Furniture - superstore_datasets.mtotal_gmv, name: Furniture}, {axisId: superstore_datasets.mtotal_gmv,
            id: Office Supplies - superstore_datasets.mtotal_gmv, name: Office Supplies},
          {axisId: superstore_datasets.mtotal_gmv, id: Technology - superstore_datasets.mtotal_gmv,
            name: Technology}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: ''
    hide_legend: false
    font_size: '12'
    label_value_format: '#.000,, "K"'
    series_types: {}
    series_colors:
      Furniture - superstore_datasets.mtotal_gmv: "#F9AB00"
      Office Supplies - superstore_datasets.mtotal_gmv: "#150cc4"
      Technology - superstore_datasets.mtotal_gmv: "#12B5CB"
    series_labels: {}
    label_color: []
    column_spacing_ratio: 0.2
    value_labels: labels
    label_type: labPer
    inner_radius: 10
    custom_color_enabled: true
    custom_color: "#079c98"
    show_single_value_title: true
    single_value_title: Total Gmv
    value_format: 0.000,, "K"
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: []
    listen: {}
    row: 8
    col: 12
    width: 12
    height: 7
  - title: Pie Total Profit by Category
    name: Pie Total Profit by Category
    model: superstore_project
    explore: superstore_datasets
    type: looker_pie
    fields: [superstore_datasets.category, superstore_datasets.mtotal_profit]
    sorts: [superstore_datasets.mtotal_profit desc]
    limit: 500
    value_labels: labels
    label_type: labPer
    inner_radius: 10
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    series_colors:
      Technology: "#12B5CB"
      Furniture: "#F9AB00"
      Office Supplies: "#150cc4"
    series_labels: {}
    custom_color_enabled: true
    custom_color: "#079c98"
    show_single_value_title: true
    single_value_title: Total Gmv
    value_format: 0.000,, "K"
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    series_types: {}
    show_value_labels: true
    font_size: 12
    listen: {}
    row: 0
    col: 14
    width: 10
    height: 8
  - title: New Tile
    name: New Tile
    model: superstore_project
    explore: superstore_datasets
    type: single_value
    fields: [superstore_datasets.order_month, superstore_datasets.mtotal_gmv]
    fill_fields: [superstore_datasets.order_month]
    sorts: [superstore_datasets.order_month desc]
    limit: 500
    total: true
    dynamic_fields: [{category: table_calculation, expression: "${superstore_datasets.mtotal_gmv:total}",
        label: New Calculation, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, table_calculation: new_calculation, _type_hint: number},
      {category: table_calculation, label: Percent Change Gmv, value_format: !!null '',
        value_format_name: percent_0, calculation_type: percent_difference_from_previous,
        table_calculation: percent_change_gmv, args: [superstore_datasets.mtotal_gmv],
        _kind_hint: measure, _type_hint: number, is_disabled: false}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    custom_color: "#3349fa"
    single_value_title: Total Gmv
    value_format: 0.000,, "K"
    comparison_label: Change Gmv Previous Month
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_fields: [superstore_datasets.mtotal_gmv]
    series_types: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    listen: {}
    row: 0
    col: 7
    width: 7
    height: 4
  - name: Total Profit
    title: Total Profit
    model: superstore_project
    explore: superstore_datasets
    type: single_value
    fields: [superstore_datasets.ship_month, superstore_datasets.show_total, superstore_datasets.mtotal_profit]
    fill_fields: [superstore_datasets.ship_month]
    sorts: [superstore_datasets.show_total desc]
    limit: 500
    dynamic_fields: [{category: table_calculation, label: Total Change, value_format: !!null '',
        value_format_name: percent_0, calculation_type: percent_of_previous, table_calculation: total_change,
        args: [superstore_datasets.mtotal_profit], _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    custom_color: "#18c22c"
    single_value_title: Total Profit
    value_format: 0.000,, "K"
    comparison_label: Change From Previous Month
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_fields: [superstore_datasets.ship_month, superstore_datasets.mtotal_profit]
    listen: {}
    row: 0
    col: 0
    width: 7
    height: 8
  - title: Total Order by date
    name: Total Order by date
    model: superstore_project
    explore: superstore_datasets
    type: looker_line
    fields: [superstore_datasets.total_order, superstore_datasets.order_month]
    fill_fields: [superstore_datasets.order_month]
    sorts: [superstore_datasets.order_month]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    series_colors: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_pivots: {}
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", superstore_datasets.country, superstore_datasets.customer_name,
      superstore_datasets.total_order]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_cell_visualizations:
      superstore_datasets.total_order:
        is_active: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4, options: {steps: 7, reverse: false,
            stepped: true}}, bold: false, italic: false, strikethrough: false, fields: !!null ''},
      {type: along a scale..., value: !!null '', background_color: !!null '', font_color: !!null '',
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    listen: {}
    row: 14
    col: 0
    width: 12
    height: 7
  - title: 'Total GMV by Shipment Mode '
    name: 'Total GMV by Shipment Mode '
    model: superstore_project
    explore: superstore_datasets
    type: looker_bar
    fields: [superstore_datasets.dynamic_sum, superstore_datasets.ship_mode]
    filters:
      superstore_datasets.item_to_add_up: total^_gmv
    sorts: [superstore_datasets.dynamic_sum desc 0]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e
      palette_id: be92eae7-de25-46ae-8e4f-21cb0b69a1f3
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    series_colors:
      superstore_datasets.dynamic_sum: "#12B5CB"
    defaults_version: 1
    listen: {}
    row: 21
    col: 12
    width: 12
    height: 9
  - title: Total Order by Category
    name: Total Order by Category
    model: superstore_project
    explore: superstore_datasets
    type: looker_bar
    fields: [superstore_datasets.dynamic_sum, superstore_datasets.category]
    pivots: [superstore_datasets.category]
    filters:
      superstore_datasets.item_to_add_up: total^_gmv
    sorts: [superstore_datasets.category]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e
      palette_id: be92eae7-de25-46ae-8e4f-21cb0b69a1f3
      options:
        steps: 5
    y_axes: [{label: '', orientation: bottom, series: [{axisId: superstore_datasets.dynamic_sum,
            id: Furniture - superstore_datasets.dynamic_sum, name: Furniture}, {axisId: superstore_datasets.dynamic_sum,
            id: Office Supplies - superstore_datasets.dynamic_sum, name: Office Supplies},
          {axisId: superstore_datasets.dynamic_sum, id: Technology - superstore_datasets.dynamic_sum,
            name: Technology}], showLabels: true, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: false
    font_size: '12'
    series_types: {}
    series_colors:
      superstore_datasets.dynamic_sum: "#12b"
      Furniture - superstore_datasets.dynamic_sum: "#f9ab00"
      Office Supplies - superstore_datasets.dynamic_sum: "#150cc4"
      Technology - superstore_datasets.dynamic_sum: "#12B5CB"
    series_labels:
      superstore_datasets.dynamic_sum: Office Supplies
    column_spacing_ratio: 0.2
    defaults_version: 1
    hidden_pivots: {}
    row: 15
    col: 12
    width: 12
    height: 6
