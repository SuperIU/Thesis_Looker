# The name of this view in Looker is "Detailed Climate"
view: detailed_climate {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `national_parks.detailed_climate`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Count Dewp" in Explore.

  dimension: count_dewp {
    type: number
    sql: ${TABLE}.count_dewp ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_count_dewp {
    type: sum
    sql: ${count_dewp} ;;
  }

  measure: average_count_dewp {
    type: average
    sql: ${count_dewp} ;;
  }

  dimension: count_slp {
    type: number
    sql: ${TABLE}.count_slp ;;
  }

  dimension: count_stp {
    type: number
    sql: ${TABLE}.count_stp ;;
  }

  dimension: count_temp {
    type: number
    sql: ${TABLE}.count_temp ;;
  }

  dimension: count_visib {
    type: number
    sql: ${TABLE}.count_visib ;;
  }

  dimension: count_wdsp {
    type: number
    sql: ${TABLE}.count_wdsp ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: dewp {
    type: number
    sql: ${TABLE}.dewp ;;
  }

  dimension: flag_max {
    type: yesno
    sql: ${TABLE}.flag_max ;;
  }

  dimension: flag_min {
    type: yesno
    sql: ${TABLE}.flag_min ;;
  }

  dimension: flag_prcp {
    type: string
    sql: ${TABLE}.flag_prcp ;;
  }

  dimension: fog {
    type: yesno
    sql: ${TABLE}.fog ;;
  }

  dimension: gust {
    type: number
    sql: ${TABLE}.gust ;;
  }

  dimension: hail {
    type: yesno
    sql: ${TABLE}.hail ;;
  }

  dimension: max {
    type: number
    sql: ${TABLE}.max ;;
  }

  dimension: measurement_id {
    type: string
    sql: ${TABLE}.measurement_id ;;
  }

  dimension: min {
    type: number
    sql: ${TABLE}.min ;;
  }

  dimension: mxpsd {
    type: number
    sql: ${TABLE}.mxpsd ;;
  }

  dimension: prcp {
    type: number
    sql: ${TABLE}.prcp ;;
  }

  dimension: rain_drizzle {
    type: yesno
    sql: ${TABLE}.rain_drizzle ;;
  }

  dimension: slp {
    type: number
    sql: ${TABLE}.slp ;;
  }

  dimension: sndp {
    type: number
    sql: ${TABLE}.sndp ;;
  }

  dimension: snow_ice_pellets {
    type: yesno
    sql: ${TABLE}.snow_ice_pellets ;;
  }

  dimension: stn {
    type: string
    sql: ${TABLE}.stn ;;
  }

  dimension: stp {
    type: number
    sql: ${TABLE}.stp ;;
  }

  dimension: temp {
    type: number
    sql: ${TABLE}.temp ;;
  }

  dimension: thunder {
    type: yesno
    sql: ${TABLE}.thunder ;;
  }

  dimension: tornado_funnel_cloud {
    type: yesno
    sql: ${TABLE}.tornado_funnel_cloud ;;
  }

  dimension: visib {
    type: number
    sql: ${TABLE}.visib ;;
  }

  dimension: wban {
    type: string
    sql: ${TABLE}.wban ;;
  }

  dimension: wdsp {
    type: number
    sql: ${TABLE}.wdsp ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
