# Define the database connection to be used for this model.
connection: "national_parks"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: balcazar_thesis_national_parks_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: balcazar_thesis_national_parks_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Balcazar Thesis National Parks"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: detailed_weather {}

explore: detailed_visits {}

explore: climbing {}

explore: park_climate {}

explore: guides {}

explore: park_noaa_stations {}

explore: monthly_visits {}

explore: detailed_climate {}

explore: parks {
  join: guides {
    type: left_outer
    sql_on: ${parks.park_code} = ${guides.park} ;;
    relationship: many_to_one
  }

  join: monthly_visits {
    type: left_outer
    sql_on: ${parks.park_name} = ${monthly_visits.park} ;;
    relationship: many_to_one
  }

  join: climbing {
    type: left_outer
    sql_on: ${parks.park_name} = ${climbing.park} ;;
    relationship: many_to_one
  }

  join: detailed_visits {
    type: left_outer
    sql_on: ${parks.park_name} = ${detailed_visits.park} ;;
    relationship: many_to_one
  }

  join: park_climate {
    type: left_outer
    sql_on: ${parks.park_name} = ${park_climate.park} ;;
    relationship: many_to_one
  }

  join: park_species {
    type: left_outer
    sql_on: ${parks.park_name} = ${park_species.park_name} ;;
    relationship: many_to_one
  }

  join: get_your_location {
    type:  cross
    sql_on: ${get_your_location.state_id} = ${parks.state} ;;
    relationship: many_to_one
  }
}

explore: trails {}

explore: park_species {}

explore: cities {}
