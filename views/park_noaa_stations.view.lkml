# The name of this view in Looker is "Park Noaa Stations"
view: park_noaa_stations {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `national_parks.park_noaa_stations`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Closest Station" in Explore.

  dimension: closest_station {
    type: yesno
    sql: ${TABLE}.closest_station ;;
  }

  dimension: distance {
    type: number
    sql: ${TABLE}.distance ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_distance {
    type: sum
    sql: ${distance} ;;
  }

  measure: average_distance {
    type: average
    sql: ${distance} ;;
  }

  dimension: park_name {
    type: string
    sql: ${TABLE}.park_name ;;
  }

  dimension: station_id {
    type: string
    sql: ${TABLE}.station_id ;;
  }

  dimension: station_name {
    type: string
    sql: ${TABLE}.station_name ;;
  }

  measure: count {
    type: count
    drill_fields: [station_name, park_name]
  }
}
