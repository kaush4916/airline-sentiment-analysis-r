# Convert reviews column to a corpus
corpus <- Corpus(VectorSource(air_japan_data$Review_Title))

# Text cleaning
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, removeWords, stopwords("en"))
corpus <- tm_map(corpus, stripWhitespace)
# Create a term-document matrix
tdm <- TermDocumentMatrix(corpus)
tdm_matrix <- as.matrix(tdm)

# Get word frequency
word_freq <- sort(rowSums(tdm_matrix), decreasing = TRUE)

# Create word cloud
wordcloud(names(word_freq), word_freq, max.words = 200, colors = brewer.pal(20, "Dark2"))

