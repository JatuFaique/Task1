df2


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

"Our data is now clean and ready to be used for analysis.
At this point you can do anything with the data. 
We shall build a matrix with term frequencies to help us 
identify the most common terms. 
It is called a term document matrix."

dtm <- TermDocumentMatrix(mydata)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 20)





