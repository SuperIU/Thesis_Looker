# The name of this view in Looker is "Parks"
view: parks {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `national_parks.parks`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Acres" in Explore.

  dimension: acres {
    type: number
    sql: ${TABLE}.Acres ;;
  }

  dimension: relative_size {
    description: "The amount of football fields that fit in this park"
    type: number
    sql: round(${acres}/1.32, 0) ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_acres {
    type: sum
    sql: ${acres} ;;
  }

  measure: average_acres {
    type: average
    sql: ${acres} ;;
  }

  dimension: art {
    type: string
    sql: ${TABLE}.Art ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: est_annual_visitors {
    type: number
    sql: ${TABLE}.est_annual_visitors ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: established {
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
    sql: ${TABLE}.established ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.Latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.Longitude ;;
  }

  dimension: park_code {
    primary_key: yes
    type: string
    sql: ${TABLE}.Park_Code ;;
  }

  dimension: park_name {
    type: string
    sql: ${TABLE}.park_name ;;
    html:
    {{ linked_value }}
    <a href="/dashboards/90?={{ value | url_encode }}&Park%20Name= {{ value }}" target="_new">
    <img src="/images/qr-graph-line@2x.png" height=20 width=20> </a>
    <a href="https://www.google.com/search?q={{ value }}" target="_new">
    <img src="https://upload.wikimedia.org/wikipedia/commons/2/2d/Google-favicon-2015.png" height=15 width=15> </a> ;;
  }
# Revisar el número de dashboard después
  dimension: state {
    map_layer_name: us_states
    type: string
    sql: ${TABLE}.State ;;
  }

  dimension: region {
    description: "US National Park Services"
    case: {
      when: {
        sql: ${state} in ('AK') ;;
        label: "Alaska"
      }
      when: {
        sql: ${state} in ('AZ','CO','MT','NM','OK','TX','UT','WY','WY, MT, ID') ;;
        label: "Intermountain"
      }
      when: {
        sql: ${state} in ('AR','IL','IN','IA','KS','MI','MN','MO','NE','ND','OH','SD','WI') ;;
        label: "Midwest"
      }
      when: {
        sql: ${state} in ('MD','VA','WV') ;;
        label: "National Capital"
      }
      when: {
        sql: ${state} in ('CT','DE','MA','ME','NH','NJ','NY','PA','RI','VT') ;;
        label: "Northeast"
      }
      when: {
        sql: ${state} in ('CA','HI','ID','NV','OR','WA','CA, NV') ;;
        label: "Pacific"
      }
      when: {
        sql: ${state} in ('AL','FL','GA','KY','LA','MS','NC','SC','TN','TN, NC') ;;
        label: "Southeast"
      }
      else: "Unknown"
    }
  }

  dimension: location {
    description: "Location in lat,long coordinates"
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
    map_layer_name: us_states
  }

  dimension: world_heritage_site {
    type: yesno
    sql: ${TABLE}.world_heritage_site ;;
  }

  measure: count {
    type: count
    drill_fields: [park_name]
  }
}
