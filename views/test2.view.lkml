view: test2 {

    derived_table: {
      sql: SELECT sum(total_profit)total_profit, sub_category  FROM `dla-data-warehouse.dwh_dla_acl.superstore_datasets`
        group by sub_category ;;
    }
    measure: Fixed {
      type: sum
      sql: ${TABLE}.total_profit ;;
    }
    dimension: sub_category {
      type: string
      sql: ${TABLE}.sub_category ;;
      primary_key: yes

  }

}
