# The name of this view in Looker is "Trails"
view: trails {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `national_parks.trails`
    ;;
  drill_fields: [trail_id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: trail_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.trail_id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called " Geoloc" in Explore.

  dimension: _geoloc {
    type: string
    sql: ${TABLE}._geoloc ;;
  }

  dimension: activities {
    type: string
    sql: ${TABLE}.activities ;;
  }

  dimension: area_name {
    type: string
    sql: ${TABLE}.area_name ;;
  }

  dimension: avg_rating {
    type: number
    sql: ${TABLE}.avg_rating ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_avg_rating {
    type: sum
    sql: ${avg_rating} ;;
  }

  measure: average_avg_rating {
    type: average
    sql: ${avg_rating} ;;
  }

  dimension: city_name {
    type: string
    sql: ${TABLE}.city_name ;;
  }

  dimension: country_name {
    type: string
    sql: ${TABLE}.country_name ;;
  }

  dimension: difficulty_rating {
    type: number
    sql: ${TABLE}.difficulty_rating ;;
  }

  dimension: elevation_gain {
    type: number
    sql: ${TABLE}.elevation_gain ;;
  }

  dimension: features {
    type: string
    sql: ${TABLE}.features ;;
  }

  dimension: length {
    type: number
    sql: ${TABLE}.length ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: num_reviews {
    type: number
    sql: ${TABLE}.num_reviews ;;
  }

  dimension: popularity {
    type: number
    sql: ${TABLE}.popularity ;;
  }

  dimension: route_type {
    type: string
    sql: ${TABLE}.route_type ;;
  }

  dimension: state_name {
    type: string
    sql: ${TABLE}.state_name ;;
  }

  dimension: units {
    type: string
    sql: ${TABLE}.units ;;
  }

  dimension: visitor_usage {
    type: number
    sql: ${TABLE}.visitor_usage ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      trail_id,
      area_name,
      city_name,
      state_name,
      name,
      country_name
    ]
  }
}
