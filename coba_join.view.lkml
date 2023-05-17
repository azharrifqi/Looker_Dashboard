view: coba_join {
  derived_table: {
    sql: select * from order_list
    cross join Order_details;;
  }
    dimension: order_id {
      type: number
      sql: ${TABLE}.order_id ;;
    }
 }
