library(dplyr)
library(stringr)

air_japan_data <- air_japan_data %>%
  mutate(Type.Of.Traveller = ifelse(is.na(Type.Of.Traveller) | str_squish(Type.Of.Traveller) == "", "Others", str_squish(Type.Of.Traveller)))
category_counts <- air_japan_data %>%
  count(Type.Of.Traveller)

# Display the counts
print(category_counts)
# Load necessary packages
library(ggplot2)
library(tidyr)

# Sample code assuming your dataset is stored as 'air_mauritius_data'
# First, gather the data into a long format to make it suitable for plotting

long_data <- air_japan_data %>%
  select(Seat.Comfort, Cabin.Staff.Service, Food...Beverages, Ground.Service, Inflight.Entertainment, Wifi...Connectivity, Value.For.Money) %>%
  gather(key = "Parameter", value = "Rating", Seat.Comfort:Value.For.Money)



ggplot(long_data, aes(x = Parameter, y = Rating, fill = Parameter)) +
  geom_bar(stat = "summary", fun = "mean", position = "dodge") +
  theme_minimal() +
  labs(title = "Average Ratings by Passengers", y = "Average Rating", x = "Parameters") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
