#load the necessary libraries
 library(wordcloud)
 library(RColorBrewer)
 #draw the word cloud
 set.seed(1234)
 wordcloud(words = d$word, freq = d$freq, min.freq = 10,
           max.words=500, random.order=FALSE,scale = c(3, 0.5),
           colors = rainbow(50))
