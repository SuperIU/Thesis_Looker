view: get_your_location {
  derived_table: {
    sql: SELECT
         city, lat, lng, state_id, CONCAT(city, ", ", state_id) AS city_state
      FROM `lookerdata.biodiversity_in_parks.cities`
      WHERE {% condition select_your_location %} CONCAT(city, ", ", state_id) {% endcondition %}
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: lat {
    type: number
    sql: ${TABLE}.lat ;;
  }

  dimension: lng {
    type: number
    sql: ${TABLE}.lng ;;
  }

  dimension: state_id {
    type: string
    sql: ${TABLE}.state_id ;;
  }

  dimension: city_state {
    type: string
    sql: ${TABLE}.city_state ;;
  }

  dimension: location {
    type: location
    sql_latitude: ${TABLE}.lat ;;
    sql_longitude: ${TABLE}.lng ;;
  }

  set: detail {
    fields: [
      city,
      lat,
      lng,
      state_id,
      city_state,
      location
    ]
  }

  filter: select_your_location {
    type:  string
    suggest_explore: cities
    suggest_dimension: cities.city_state
  }

}
