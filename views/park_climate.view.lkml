# The name of this view in Looker is "Park Climate"
view: park_climate {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `national_parks.park_climate`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Avg Barometric Pressure" in Explore.

  dimension: avg_barometric_pressure {
    type: number
    sql: ${TABLE}.avg_barometric_pressure ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_avg_barometric_pressure {
    type: sum
    sql: ${avg_barometric_pressure} ;;
  }

  measure: average_avg_barometric_pressure {
    type: average
    sql: ${avg_barometric_pressure} ;;
  }

  dimension: avg_cloud_cover {
    type: number
    sql: ${TABLE}.avg_cloud_cover ;;
  }

  dimension: avg_dry_days {
    type: number
    sql: ${TABLE}.avg_dry_days ;;
  }

  dimension: avg_fog_days {
    type: number
    sql: ${TABLE}.avg_fog_days ;;
  }

  dimension: avg_humidity {
    type: number
    sql: ${TABLE}.avg_humidity ;;
  }

  dimension: avg_precip_days {
    type: number
    sql: ${TABLE}.avg_precip_days ;;
  }

  dimension: avg_precipitation {
    type: number
    sql: ${TABLE}.avg_precipitation ;;
  }

  dimension: avg_snow_days {
    type: number
    sql: ${TABLE}.avg_snow_days ;;
  }

  dimension: avg_sun_hours {
    type: number
    sql: ${TABLE}.avg_sun_hours ;;
  }

  dimension: avg_tmp_high {
    type: number
    sql: ${TABLE}.avg_tmp_high ;;
  }

  dimension: avg_tmp_low {
    type: number
    sql: ${TABLE}.avg_tmp_low ;;
  }

  dimension: avg_uv_index {
    type: number
    sql: ${TABLE}.avg_uv_index ;;
  }

  dimension: avg_wind_mph {
    type: number
    sql: ${TABLE}.avg_wind_mph ;;
  }

  dimension: month {
    type: string
    sql: ${TABLE}.month ;;
  }

  dimension: park {
    type: string
    sql: ${TABLE}.park ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
