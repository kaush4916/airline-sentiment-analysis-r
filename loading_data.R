# Load the data (if not already loaded)
airline_data <- read.csv("C:/Users/srina/Downloads/Airline_review.csv", stringsAsFactors = FALSE)
library(dplyr)
library(ggplot2)
# View the first few rows to confirm the data
head(airline_data)
selected_airlines <- c("Air Mauritius", "Air Serbia","Air India","Easy Jet","Emirates"," EVA Air","Fiji Airways","Finnair","GoAir","Japan Airlines")
filtered_data <- airline_data %>%
  filter(Airline.Name %in% selected_airlines)
air_japan_data <- airline_data %>%
  filter(Airline.Name == "Japan Airlines")  # Filter for Air Mauritius

