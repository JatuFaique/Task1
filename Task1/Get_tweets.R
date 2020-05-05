library(twitteR)

consumer_key <- "1CmDGAv9GKVK8jpq7RyN4MbNv"

consumer_key_secret <- "urqSMn7Q2Oquw0IirU21TIEYIOTvrR4Co3WwQoaubjc4ZzLd8M"

access_token <- "3224456528-pPGzt66TapKaPWcbRAoP6krK5vAg5wnRGNKQNsI"
access_token_secret <- "oH1ZU78KFXhWIOObZZgMz7whLPZPN5pECjJRqXhOrgU7u"

setup_twitter_oauth(consumer_key, consumer_key_secret,
                    access_token,access_token_secret)

read_hashtag_tweets <- function()
{ 
  tag <- readline(prompt="Enter an hashtag: ")
  hash <-"#"
  tag_1 <<- paste(hash, tag , sep = "")
  return(as.character(tag_1))
}
read_hashtag_tweets()

tweets <<- twitteR::searchTwitter(tag_1,n =1000,lang ="en",since = '2020-01-01')

df <- twListToDF(tweets)


