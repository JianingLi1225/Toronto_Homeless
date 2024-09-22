#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Jianing Li
# Date: 6 April 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

#### Workspace setup ####
library(tidyverse)

# Read the data
cleaned_shelter_data <- read_csv("/Users/liz/Downloads/starter_folder-main/data/raw_data/shelter_raw_data.csv") %>%
  
  # Filter data to keep only 'All Population' and 'Chronic' rows
  filter(population_group %in% c('All Population', 'Chronic')) %>%
  
  # Remove unnecessary columns
  select(-returned_from_housing, -returned_to_shelter, -newly_identified, 
         -moved_to_housing, -became_inactive) %>%
  
  # Rename columns
  rename(
    ID = X_id,
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
    Transgender_Non_Binary_Count = gender_transgender.non.binary_or_two_spirit,
    Population_Group_Percentage = population_group_percentage)


#### Save data ####
write_csv(cleaned_shelter_data, "/Users/liz/Downloads/starter_folder-main/data/analysis_data/shelter_analysis_data.csv")

