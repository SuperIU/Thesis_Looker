view: cities {
# # You can specify the table name if it's different from the view name:
  sql_table_name:biodiversity_in_parks.cities ;;

  dimension: city {
    type:  string
    sql: ${TABLE}.city ;;
  }

  dimension: state_id {
    type:  string
    sql: ${TABLE}.state_id ;;
  }

  dimension: state_name {
    type:  string
    sql: ${TABLE}.state_name ;;
  }

  dimension: latitude {
    hidden:  yes
    type: number
    sql: ${TABLE}.lat ;;
  }

  dimension: longitude {
    hidden:  yes
    type: number
    sql: ${TABLE}.lng ;;
  }

  dimension: location {
    description: "Location in lat,long coordinates"
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }

  dimension: city_state {
    type:  string
    sql: CONCAT(${city}, ", ", ${state_id}) ;;
  }
}
