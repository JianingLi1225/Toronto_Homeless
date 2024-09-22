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

#### Clean data ####
#### Workspace setup ####
library(tidyverse)

# Read the data and remove unnecessary columns
cleaned_shelter_data <- read_csv("/Users/liz/Downloads/starter_folder-main/data/raw_data/shelter_raw_data.csv") %>%
  select(-returned_from_housing, 
         -returned_to_shelter, 
         -newly_identified, 
         -moved_to_housing, 
         -became_inactive) %>%
  
  # Rename the columns
  rename(
    date = date.mmm.yy.,
    group = population_group,
    homeless_count = actively_homeless,
    age_under_16 = ageunder16,
    age_16_24 = age16.24,
    age_25_34 = age25.34,
    age_35_44 = age35.44,
    age_45_54 = age45.54,
    age_55_64 = age55.64,
    age_65_over = age65over,
    male_count = gender_male,
    female_count = gender_female,
    transgender_non_binary_count = gender_transgender.non.binary_or_two_spirit,
    pop_group_pct = population_group_percentage
  )

# Preview the cleaned and renamed data
head(cleaned_shelter_data)

#### Save data ####
write_csv(cleaned_shelter_data, "/Users/liz/Downloads/starter_folder-main/data/analysis_data/analysis_data.csv")

