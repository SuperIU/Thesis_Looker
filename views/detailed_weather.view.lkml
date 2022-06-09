# The name of this view in Looker is "Detailed Weather"
view: detailed_weather {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `national_parks.detailed_weather`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Count Dewp" in Explore.

  dimension: count_dewp {
    type: number
    description: "Number of observations used in calculating mean dew point"
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
    description: "Number of observations used in calculating mean sea level pressure"
    sql: ${TABLE}.count_slp ;;
  }

  dimension: count_stp {
    type: number
    description: "Number of observations used in calculating mean station pressure"
    sql: ${TABLE}.count_stp ;;
  }

  dimension: count_temp {
    type: number
    description: "Number of observations used in calculating mean temperature"
    sql: ${TABLE}.count_temp ;;
  }

  dimension: count_visib {
    type: number
    description: "Number of observations used in calculating mean visibility"
    sql: ${TABLE}.count_visib ;;
  }

  dimension: count_wdsp {
    type: number
    description: "Number of observations used in calculating mean wind speed"
    sql: ${TABLE}.count_wdsp ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date {
    type: time
    description: "Date of the weather observations"
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
    description: "Mean dew point for the day in degrees Fahrenheit to tenths."
    sql: ${TABLE}.dewp ;;
  }

  dimension: flag_max {
    type: yesno
    description: "true indicates max temp was derived from the hourly data (i.e., highest hourly or synoptic-reported temperature)"
    sql: ${TABLE}.flag_max ;;
  }

  dimension: flag_min {
    type: yesno
    description: "true indicates min temp was derived from the hourly data (i.e., lowest hourly or synoptic-reported temperature)"
    sql: ${TABLE}.flag_min ;;
  }

  dimension: flag_prcp {
    type: string
    description: "A = 1 report of 6-hour precipitation amount B = Summation of 2 reports of 6-hour precipitation amount C = Summation of 3 reports of 6-hour precipitation amount D = Summation of 4 reports of 6-hour precipitation amount E = 1 report of 12-hour precipitation amount F = Summation of 2 reports of 12-hour precipitation amount G = 1 report of 24-hour precipitation amount H = Station reported '0' as the amount for the day (eg, from 6-hour reports), but also reported at least one occurrence of precipitation in hourly observations--this could indicate a trace occurred, but should be considered as incomplete data for the day. I = Station did not report any precip data for the day and did not report any occurrences of precipitation in its hourly observations--it's still possible that precip occurred but was not reported"
    sql: ${TABLE}.flag_prcp ;;
  }

  dimension: fog {
    type: yesno
    description: "fog occurrence during the day"
    sql: ${TABLE}.fog ;;
  }

  dimension: gust {
    type: number
    description: "Maximum wind gust reported for the day in knots to tenths."
    sql: ${TABLE}.gust ;;
  }

  dimension: hail {
    type: yesno
    description: "hail occurrence during the day"
    sql: ${TABLE}.hail ;;
  }

  dimension: max {
    type: number
    description: "Maximum temperature reported during the day in Fahrenheit to tenths--time of max temp report varies by country and region, so this will sometimes not be the max for the calendar day."
    sql: ${TABLE}.max ;;
  }

  dimension: min {
    type: number
    description: "Minimum temperature reported during the day in Fahrenheit to tenths--time of min temp report varies by country and region, so this will sometimes not be the min for the calendar day."
    sql: ${TABLE}.min ;;
  }

  dimension: mxpsd {
    type: number
    description: "Maximum sustained wind speed reported for the day in knots to tenths."
    sql: ${TABLE}.mxpsd ;;
  }

  dimension: prcp {
    type: number
    description: "Total precipitation (rain and/or melted snow) reported during the day in inches and hundredths; will usually not end with the midnight observation--i.e., may include latter part of previous day. .00 indicates no measurable precipitation (includes a trace). Note: a station may only report a 6-hour amount for the period during which rain fell. See Flag field for source of data"
    sql: ${TABLE}.prcp ;;
  }

  dimension: rain_drizzle {
    type: yesno
    description: "rain or drizzle occurrence during the day"
    sql: ${TABLE}.rain_drizzle ;;
  }

  dimension: slp {
    type: number
    description: "Mean sea level pressure for the day in millibars to tenths."
    sql: ${TABLE}.slp ;;
  }

  dimension: sndp {
    type: number
    description: "Snow depth in inches to tenths--last report for the day if reported more than once."
    sql: ${TABLE}.sndp ;;
  }

  dimension: snow_ice_pellets {
    type: yesno
    description: "snow or ice pellets occurrence during the day"
    sql: ${TABLE}.snow_ice_pellets ;;
  }

  dimension: stn {
    type: string
    description: "Cloud - GSOD NOAA"
    sql: ${TABLE}.stn ;;
  }

  dimension: stp {
    type: number
    description: "Mean station pressure for the day in millibars to tenths."
    sql: ${TABLE}.stp ;;
  }

  dimension: temp {
    type: number
    description: "Mean temperature for the day in degrees Fahrenheit to tenths."
    sql: ${TABLE}.temp ;;
  }

  dimension: thunder {
    type: yesno
    description: "thunder occurrence during the day"
    sql: ${TABLE}.thunder ;;
  }

  dimension: tornado_funnel_cloud {
    type: yesno
    description: "tornado / funnel cloud occurrence during the day"
    sql: ${TABLE}.tornado_funnel_cloud ;;
  }

  dimension: visib {
    type: number
    description: "Mean visibility for the day in miles to tenths."
    sql: ${TABLE}.visib ;;
  }

  dimension: wban {
    type: string
    description: "WBAN number where applicable--this is the historical \"Weather Bureau Air Force Navy\" number - with WBAN being the acronym"
    sql: ${TABLE}.wban ;;
  }

  dimension: wdsp {
    type: number
    description: "Mean wind speed for the day in knots to tenths."
    sql: ${TABLE}.wdsp ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
