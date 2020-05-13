
#normalize the vectors
norm_eucl <- function(m) m/apply(m, MARGIN=1, FUN=function(x) sum(x^2)^.5)
m_norm <- norm_eucl(m)


##Cluster the data into 10 clusters
set.seed(100)
km <- kmeans(m_norm, 10)
table(km$cluster)


for(k in 1:length(km$withinss))
  
{
  wordstodocument <- TermDocumentMatrix(mod_corpus)
  wordsmatrix <-as.matrix(wordstodocument)
  word_freq<- sort(rowSums(wordsmatrix[km$cluster == k, ]),decreasing = TRUE)
  count <- as.vector(unlist(attributes(word_freq))) 
  freqdisp  <-data.frame(word_freq, count, stringsAsFactors = FALSE)
  
  
  
  if (k == 1)
  {
    x <- data.frame(k, length(which(data1$Cluster == k )), freqdisp$word_freq[1:5], 
                    freqdisp$count[1:5], as.numeric(rownames(x))[1:5])
    colnames(x) = c("Loggroup", "Logcount", "word Count", "Top Words", "Counter")
    
  } 
  
  else
    
  {
    y <- data.frame(k, length(which(data1$Cluster == k )), freqdisp$word_freq[1:5],
                    freqdisp$count[1:5], as.numeric(rownames(x))[1:5]) 
    colnames(y) = c("Loggroup", "Logcount", "word Count", "Top Words", "Counter")
    x <<- rbind(x, y)
  }
  
}

#output top 5 words in each cluster to Topwords.csv
write.csv(x, file = "Topwords.csv", row.names=FALSE)


