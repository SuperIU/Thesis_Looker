# The name of this view in Looker is "Park Species"
view: park_species {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `national_parks.park_species`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Abundance" in Explore.

  dimension: abundance {
    type: string
    sql: ${TABLE}.Abundance ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.Category ;;
  }

  dimension: common_names {
    type: string
    sql: ${TABLE}.Common_Names ;;
  }

  dimension: family {
    type: string
    sql: ${TABLE}.Family ;;
  }

  dimension: nativeness {
    type: string
    sql: ${TABLE}.Nativeness ;;
  }

  dimension: occurrence {
    type: string
    sql: ${TABLE}.Occurrence ;;
  }

  dimension: park_name {
    type: string
    sql: ${TABLE}.Park_Name ;;
  }

  dimension: record_status {
    type: string
    sql: ${TABLE}.Record_Status ;;
  }

  dimension: scientific_name {
    type: string
    sql: ${TABLE}.Scientific_Name ;;
  }

  dimension: species_id {
    type: string
    sql: ${TABLE}.Species_ID ;;
  }

  dimension: species_order {
    type: string
    sql: ${TABLE}.Species_Order ;;
  }

  measure: count {
    type: count
    drill_fields: [park_name, scientific_name]
  }
}
