# The name of this view in Looker is "Climbing"
view: climbing {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `national_parks.climbing`
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Area Latitude" in Explore.

  dimension: area_latitude {
    type: number
    sql: ${TABLE}.Area_Latitude ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_area_latitude {
    type: sum
    sql: ${area_latitude} ;;
  }

  measure: average_area_latitude {
    type: average
    sql: ${area_latitude} ;;
  }

  dimension: area_longitude {
    type: number
    sql: ${TABLE}.Area_Longitude ;;
  }

  dimension: avg_stars {
    type: number
    sql: ${TABLE}.Avg_Stars ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: length {
    type: number
    sql: ${TABLE}.Length ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.Location ;;
  }

  dimension: num_votes {
    type: number
    sql: ${TABLE}.num_votes ;;
  }

  dimension: park {
    type: string
    sql: ${TABLE}.park ;;
  }

  dimension: pitches {
    type: number
    sql: ${TABLE}.Pitches ;;
  }

  dimension: protection {
    type: string
    sql: ${TABLE}.protection ;;
  }

  dimension: rating {
    type: string
    sql: ${TABLE}.Rating ;;
  }

  dimension: route {
    type: string
    sql: ${TABLE}.Route ;;
  }

  dimension: route_type {
    type: string
    sql: ${TABLE}.Route_type ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.URL ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
