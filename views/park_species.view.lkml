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
    description: "Type of Species: Mammals, Birds, Reptiles, etc"
    type: string
    sql: ${TABLE}.Category ;;
    link: {
      label: "Google Search"
      url: "https://www.google.com/search?q= {{ category_formatted._value }}"
    }
    drill_fields: [scientific_name, common_names, park_name]
  }

  dimension: category_formatted {
    hidden:  yes
    type:  string
    sql: REPLACE(category, "/", "_" );;
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
    html:
    {{ linked_value }}
    <a href="https://www.google.com/search?q={{ value }}" target="_new">
    <img src="https://upload.wikimedia.org/wikipedia/commons/1/1d/US-NationalParkService-Logo.svg" height=15 width=12> </a> ;;
  }

  dimension: record_status {
    type: string
    sql: ${TABLE}.Record_Status ;;
  }

  dimension: scientific_name {
    type: string
    sql: ${TABLE}.Scientific_Name ;;
    html:
    {{ linked_value }}
    <a href="https://www.google.com/search?q={{ value }}" target="_new">
    <img scr="https://www.pngitem.com/pimgs/m/109-1099315_deer-deer-icon-png-transparent-png.png" height=15 width=12> </a> ;;
    }

  dimension: sci_name_formatted {
    hidden:  yes
    type:  string
    sql: REPLACE(scientific_name,' ', '+') ;;
  }

  dimension: species_id {
    primary_key: yes
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

# CUSTOM DIMENSION
  dimension: kingdom {
    sql:
      CASE
        WHEN ${category} = 'Vascular Plant' THEN 'Plant'
        WHEN ${category} = 'Nonvascular Plant' THEN 'Plant'
        WHEN ${category} = 'Bird' THEN 'Animal'
        WHEN ${category}= 'Insect' THEN 'Bugs'
        WHEN ${category} = 'Fungi' THEN 'Fungi'
        WHEN ${category} = 'Fish' THEN 'Animal'
        WHEN ${category} = 'Mammal' THEN 'Animal'
        WHEN ${category} = 'Invertebrate' THEN 'Invertebrate'
        WHEN ${category} = 'Reptile' THEN 'Animal'
        WHEN ${category} = 'Algae' THEN 'Plant'
        WHEN ${category} = 'Slug/Snail' THEN 'Bugs'
        WHEN ${category} = 'Spider/Scorpion' THEN 'Bugs'
        WHEN ${category} = 'Amphibian' THEN 'Animal'
        WHEN ${category} = 'Crab/Lobster/Shrimp' THEN 'Animal'
        ELSE
        ${category}
       END
      ;;
  }

# CUSTOM MEASURE
  measure: count_distinct {
    type: count_distinct
    sql: ${species_id} ;;
  }
}
