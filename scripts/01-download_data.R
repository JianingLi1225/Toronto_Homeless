#### Preamble ####
# Purpose: Downloads the data from the opendatatoronto package (Gelfand 2022)
# and saves the dataset.
# Author: Jianing Li
# Date: September 23, 2024
# Contact: lijianing.li@mail.utoronto.ca
# License: MIT
# Pre-requisites: Install the opendatatoronto (Gelfand 2022) and
# tidyverse (Wickham et al. 2019) packages.
# Any other information needed? None


#### Workspace setup ####
# install.packages("opendatatoronto")
# install.packages("tidyverse")
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

write_csv(shelter_system_statistics, "/Users/liz/Downloads/starter_folder-main/data/raw_data/raw_data.csv")
