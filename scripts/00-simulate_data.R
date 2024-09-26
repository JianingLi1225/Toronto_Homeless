#### Preamble ####
# Purpose: Generates a simulated version of the Toronto Shelter System dataset
# Author: Jianing Li
# Date: September 23, 2024
# Contact: lijianing.li@mail.utoronto.ca
# License: MIT
# Pre-requisites: Install the tidyverse (Wickham et al. 2019) package.
# Any other information needed? None

#### Simulate data ####
library(tidyverse)

# Set random seed to ensure reproducibility
set.seed(500)

# Simulate a date column from January 2018 to August 2024, formatted as "Mon-YY"
dates <- seq(as.Date("2018-01-01"), as.Date("2024-08-01"), by = "month")
formatted_dates <- format(dates, "%b-%y")

# Simulate population groups
population_groups <- c("All Population", "Chronic")

# Generate random homeless counts, ensuring All Population > Chronic
all_population_count <- sample(3000:5000, length(dates), replace = TRUE)
chronic_population_count <- sample(1000:2000, length(dates), replace = TRUE)
homeless_count <- c(rbind(all_population_count, chronic_population_count))

# Function to distribute a total count into proportional parts
distribute_proportionally <- function(total, n) {
  proportions <- runif(n) # Generate random proportions
  proportions <- proportions / sum(proportions) # Normalize to sum to 1
  round(total * proportions) # Scale to total and round
}

# Generate random age group counts, ensuring they sum to Homeless_Count
age_group_counts <- map(homeless_count, ~ distribute_proportionally(.x, 7))
age_under_16 <- map_dbl(age_group_counts, 1)
age_16_24 <- map_dbl(age_group_counts, 2)
age_25_34 <- map_dbl(age_group_counts, 3)
age_35_44 <- map_dbl(age_group_counts, 4)
age_45_54 <- map_dbl(age_group_counts, 5)
age_55_64 <- map_dbl(age_group_counts, 6)
age_65_over <- map_dbl(age_group_counts, 7)

# Generate random gender counts, ensuring they sum to Homeless_Count
gender_counts <- map(homeless_count, ~ distribute_proportionally(.x, 3))
male_count <- map_dbl(gender_counts, 1)
female_count <- map_dbl(gender_counts, 2)
transgender_non_binary_count <- map_dbl(gender_counts, 3)

# Create a simulated data frame with all variables
simulated_data <- data.frame(
  Date = rep(formatted_dates, each = length(population_groups)),
  Population_Group = rep(population_groups, times = length(dates)),
  Homeless_Count = homeless_count,
  Age_Under_16 = age_under_16,
  Age_16_24 = age_16_24,
  Age_25_34 = age_25_34,
  Age_35_44 = age_35_44,
  Age_45_54 = age_45_54,
  Age_55_64 = age_55_64,
  Age_65_Over = age_65_over,
  Male_Count = male_count,
  Female_Count = female_count,
  Transgender_Non_Binary_Count = transgender_non_binary_count
)

# Save the simulated data to the specified path
write_csv(simulated_data, here::here("data", "raw_data", "simulated_shelter_data.csv"))



