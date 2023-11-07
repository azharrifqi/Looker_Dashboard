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
  # persist_with: superstore_project_default_datagroup
  access_filter: {
    field: superstore_datasets.country
    user_attribute: country
  }
  required_access_grants: [admin_only]
}

explore: test {
  join: test_partition_derivedtable {
    type: left_outer
    relationship: many_to_many
    sql_on: ${test_partition_derivedtable.category} = ${test.category} ;;
  }
  # always_filter: {
  #   filters: [total_cost : ">=50"]
  # }
  required_access_grants: [admin_only]
}

explore: coba_test {
  required_access_grants: [admin_only]
}
explore: order_details {
  required_access_grants: [admin_only]
}
explore: order_list {
  required_access_grants: [admin_only]
}
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
  required_access_grants: [admin_only]
}
explore: status_success {
  sql_always_where: ${Status}="success";;
  required_access_grants: [admin_only]
}
explore: status_fail {
  sql_always_where: ${Status}="Fail";;
  required_access_grants: [admin_only]
}

explore: test01 {
  join: test2 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${test01.sub_category} = ${test2.sub_category} ;;
  }
}

explore: test_partition_derivedtable {
  required_access_grants: [admin_only]
  join: test2 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${test_partition_derivedtable.sub_category} = ${test2.sub_category};;
  }
  join: coba_join {
    type: left_outer
    relationship: many_to_one
    sql_on: ${test_partition_derivedtable.category} = ${coba_join.category};;
  }
}
