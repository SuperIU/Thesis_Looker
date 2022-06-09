# The name of this view in Looker is "Detailed Visits"
view: detailed_visits {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `national_parks.detailed_visits`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Backcountry Campers" in Explore.

  dimension: backcountry_campers {
    type: number
    sql: ${TABLE}.backcountry_campers ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_backcountry_campers {
    type: sum
    sql: ${backcountry_campers} ;;
  }

  measure: average_backcountry_campers {
    type: average
    sql: ${backcountry_campers} ;;
  }

  dimension: comments {
    type: string
    sql: ${TABLE}.comments ;;
  }

  dimension: concession_camping {
    type: number
    sql: ${TABLE}.concession_camping ;;
  }

  dimension: concession_lodging {
    type: number
    sql: ${TABLE}.concession_lodging ;;
  }

  dimension: misc_campers {
    type: number
    sql: ${TABLE}.misc_campers ;;
  }

  dimension: month {
    type: string
    sql: ${TABLE}.month ;;
  }

  dimension: non_recreation_hours {
    type: number
    sql: ${TABLE}.non_recreation_hours ;;
  }

  dimension: non_recreation_overnight_stays {
    type: number
    sql: ${TABLE}.non_recreation_overnight_stays ;;
  }

  dimension: non_recreation_visitors {
    type: number
    sql: ${TABLE}.non_recreation_visitors ;;
  }

  dimension: park {
    type: string
    sql: ${TABLE}.park ;;
  }

  dimension: recreation_hours {
    type: number
    sql: ${TABLE}.recreation_hours ;;
  }

  dimension: recreation_visitors {
    type: number
    sql: ${TABLE}.recreation_visitors ;;
  }

  dimension: rv_campers {
    type: number
    sql: ${TABLE}.rv_campers ;;
  }

  dimension: tent_campers {
    type: number
    sql: ${TABLE}.tent_campers ;;
  }

  dimension: total_overnight_stays {
    type: number
    sql: ${TABLE}.total_overnight_stays ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
