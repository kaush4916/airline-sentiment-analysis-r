# Get sentiment scores
sentiments <- get_nrc_sentiment(air_mauritius_data$Review_Title)

# Add sentiment to the main data
air_mautitius_data <- cbind(air_mauritius_data, sentiments)

# Assuming 'sentiments' is a data frame containing sentiment scores for each review
# with columns like 'positive', 'trust', 'joy', 'anticipation', 'negative', 'fear', 'sadness', and 'disgust'

# Create a new column in air_japan_data to categorize sentiment
air_mauritius_data$sentiment_type <- ifelse(
  rowSums(sentiments[, c("positive", "trust", "joy", "anticipation")]) > 
    rowSums(sentiments[, c("negative", "fear", "sadness", "disgust")]),
  "Positive",
  ifelse(
    rowSums(sentiments[, c("positive", "trust", "joy", "anticipation")]) < 
      rowSums(sentiments[, c("negative", "fear", "sadness", "disgust")]),
    "Negative",
    "Neutral"  # Assign "Neutral" if scores are equal
  )
)

# Display the first few rows of the updated air_japan_data to verify
head(air_mauritius_data)



