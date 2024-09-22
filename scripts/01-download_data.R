#### Preamble ####
# Purpose: Downloads and saves the data from [...UPDATE THIS...]
# Author: Jianing Li
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
packages <- list_packages(500)
packages

shelter_system_packages <- search_packages("Toronto Shelter System Flow")
shelter_system_packages

shelter_system_resources <- shelter_system_packages %>%
  list_package_resources()
shelter_system_resources

#### Download data ####
shelter_system_statistics <- shelter_system_resources[2, ] %>%
  get_resource()
shelter_system_statistics

#### Save data ####
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(shelter_system_statistics, "/Users/liz/Downloads/starter_folder-main/data/raw_data/shelter_raw_data.csv")
