# If necessary, uncomment the line below to include explore_source.
# include: "balcazar_thesis_national_parks.model.lkml"

view: climb_trail {
  derived_table: {
    explore_source: parks {
      column: park_name {}
      column: count_climbs { field: climbing.count }
      column: count_trails { field: trails.count }
    }
  }
  dimension: park_name {
    description: ""
  }
  dimension: count_climbs {
    description: "Climbing Routes"
    type: number
  }
  dimension: count_trails {
    description: "Trails Routes"
    type: number
  }

  dimension: filter_climbs {
    type: yesno
    sql: ${climb_trail.count_climbs}>0 ;;
  }

  dimension: filter_trails {
    type: yesno
    sql: ${climb_trail.count_trails}>0 ;;
  }
}
