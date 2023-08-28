# Define the database connection to be used for this model.
connection: "dla-acl"

# include all the views
include: "/views/**/*.view"
include: "/*.dashboard"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: superstore_project_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

access_grant: admin_only {
  user_attribute: test_viewer
  allowed_values: ["Can"]
}

persist_with: superstore_project_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Superstore Project"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: superstore_datasets {
  persist_with: superstore_project_default_datagroup
  access_filter: {
    field: superstore_datasets.country
    user_attribute: country
  }
}

explore: test {
  always_filter: {
    filters: [total_cost : ">=50"]
  }
}
explore: coba_test {}
explore: order_details {}
explore: order_list {}
explore: checkg {
  join: status_fail {
    type: left_outer
    relationship: many_to_many
    sql_on: ${checkg.city} = ${status_fail.city} ;;
  }
  join: status_success {
    type: left_outer
    relationship: many_to_many
    sql_on: select * FROM order_list join order_details
    on order_list.id = order_details.id;;
  }
}
explore: status_success {
  sql_always_where: ${Status}="success";;
}
explore: status_fail {
  sql_always_where: ${Status}="Fail";;
}

explore: test01 {
  join: test2 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${test01.sub_category} = ${test2.sub_category} ;;
  }
}

explore: test_partition_derivedtable {}
