function autoplace(resource)
  peaks = {
    -- Inside the starting area
    {
      influence = 0.3,
      starting_area_weight_optimal = 1,
      starting_area_weight_range = 0,
      starting_area_weight_max_range = 2,
    },
    {
      influence = 0.55,
      noise_layer = resource,
      noise_octaves_difference = -2.3,
      noise_persistence = 0.4,
      starting_area_weight_optimal = 1,
      starting_area_weight_range = 0,
      starting_area_weight_max_range = 2,
    },

    -- Outside the starting area
    {
      influence = 0.20,

      starting_area_weight_optimal = 0,
      starting_area_weight_range = 0,
      starting_area_weight_max_range = 2,
    },
    {
      influence = 0.65,
      noise_layer = resource,
      noise_octaves_difference = -0.00,
      noise_persistence = 0.3,

      starting_area_weight_optimal = 0,
      starting_area_weight_range = 0,
      starting_area_weight_max_range = 2,
    },

  }

  for i, other in ipairs({"iron-ore", "copper-ore", "stone", "coal"}) do
    if resource ~= other then
      table.insert(peaks, {
          influence = -0.2,
          max_influence = 0,
          noise_layer = other,
          noise_octaves_difference = -0.4,
          noise_persistence = 0.45,
      })
    end
  end

  return {
    control = resource,
    sharpness = 1,
    richness_base = 1000000/25,
    richness_multiplier = 15000,
    size_control_multiplier = 0.06,
    peaks = peaks,
  }
end

for i, resource in ipairs({"iron-ore", "copper-ore", "stone", "coal"}) do
  data.raw["resource"][resource].autoplace = autoplace(resource)
end

data.raw["resource"]["crude-oil"].autoplace = {
  control = "crude-oil",
  sharpness = 1,
  max_probability = 0.04,
  richness_multiplier = 150000,
  richness_base = 5000000,
  size_control_multiplier = 0.06,
  peaks =
  {
    {
      influence = 0.1
    },
    {
      influence = 0.105,
      starting_area_weight_optimal = 1,
      starting_area_weight_range = 0,
      starting_area_weight_max_range = 2,
    },
    {
      influence = 0.67,
      noise_layer = "crude-oil",
      noise_octaves_difference = -2.7,
      noise_persistence = 0.3
    }
  }
}
