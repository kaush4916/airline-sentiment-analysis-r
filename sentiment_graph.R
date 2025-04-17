# Load necessary libraries
library(ggplot2)
library(tidyr)
library(dplyr)

# Assuming 'sentiments' is the data frame with sentiment scores
# Reshape the data to long format for easier plotting
sentiments_long <- sentiments %>%
  pivot_longer(cols = everything(), names_to = "Sentiment_Type", values_to = "Score")

# Create a bar graph for individual sentiment scores
ggplot(sentiments_long, aes(x = Sentiment_Type, y = Score, fill = Sentiment_Type)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Sentiment Scores for Reviews",
       x = "Sentiment Type",
       y = "Score") +
  scale_fill_brewer(palette = "Set1") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
