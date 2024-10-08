#### Preamble ####
# Purpose: Cleans the raw dataset obtained from the
# "Toronto Shelter System Flow" dataset in the file "01-download_data.R".
# Author: Jianing Li
# Date: September 23, 2024
# Contact: lijianing.li@mail.utoronto.ca
# License: MIT
# Pre-requisites: Run the file "01-download_data.R".
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)

# Read the data
cleaned_shelter_data <- read_csv(here::here("data", "raw_data", "raw_data.csv")) %>%
  # Filter data to keep only 'All Population' and 'Chronic' rows
  filter(population_group %in% c("All Population", "Chronic")) %>%
  # Remove unnecessary columns
  select(
    -returned_from_housing, -returned_to_shelter, -newly_identified,
    -moved_to_housing, -became_inactive, -population_group_percentage, -X_id
  ) %>%
  # Rename columns
  rename(
    Date = date.mmm.yy.,
    Population_Group = population_group,
    Homeless_Count = actively_homeless,
    Age_Under_16 = ageunder16,
    Age_16_24 = age16.24,
    Age_25_34 = age25.34,
    Age_35_44 = age35.44,
    Age_45_54 = age45.54,
    Age_55_64 = age55.64,
    Age_65_Over = age65over,
    Male_Count = gender_male,
    Female_Count = gender_female,
    Transgender_Non_Binary_Count = gender_transgender.non.binary_or_two_spirit
  )

#### Save data ####
write_csv(cleaned_shelter_data, here::here("data", "analysis_data", "analysis_data.csv"))
