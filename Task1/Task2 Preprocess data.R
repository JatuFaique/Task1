df2

library(dplyr)

#Creating a function to preprocess
#our target data we derived earlier

pre_process <- function(df2)
{
  #convert data to UTF
  newdata<- df2
  #extract text from the data frame build your own corpus(a corpus is a collection of text files)
  mydata <- Corpus(VectorSource(newdata))
  # convert to lower case
  mydata <- tm_map(mydata, content_transformer(tolower))
  #remove ������ what would be emojis
  mydata<-tm_map(mydata, content_transformer(gsub), pattern="\\W",replace=" ")
  # remove URLs
  removeURL <- function(x) gsub("http[^[:space:]]*", "", x)
  mydata <- tm_map(mydata, content_transformer(removeURL))
  # remove anything other than English letters or space
  removeNumPunct <- function(x) gsub("[^[:alpha:][:space:]]*", "", x)
  mydata <- tm_map(mydata, content_transformer(removeNumPunct))
  # remove stopwords
  mydata <<- tm_map(mydata, removeWords, stopwords("english"))
  return(mydata)
}

pre_process(df2)
