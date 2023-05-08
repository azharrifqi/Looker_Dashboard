- dashboard: test_v_look_ml_02
  title: TEST V.Look ML
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 8eYbEEjEDshUr4rfpfguVW
  elements:
  - title: TEST VLook ML
    name: TEST VLook ML
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
    series_types: {}
    series_colors:
      Furniture - superstore_datasets.mtotal_gmv: "#7CB342"
      Office Supplies - superstore_datasets.mtotal_gmv: "#1A73E8"
      Technology - superstore_datasets.mtotal_gmv: "#E8710A"
    series_labels: {}
    label_color: []
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
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 12
  - name: ss
    type: text
    title_text: ss
    subtitle_text: ''
    body_text: ''
    row: 12
    col: 0
    width: 8
    height: 6
