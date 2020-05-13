
"Our data is now clean and ready to be used for analysis.
At this point you can do anything with the data. 
We shall build a matrix with term frequencies to help us 
identify the most common terms. 
It is called a term document matrix."

dtm <- TermDocumentMatrix(mydata)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
#head(d, 20)
d
#Setting min freq as 100
#d_cloud <- filter(d , freq>120)
#head(d, 20)
