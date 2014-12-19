GenerateToken <- function(tokenURL, clientId, clientSecret, refreshToken) {
  
  postContent <- URLencode(paste0("grant_type=refresh_token"
                                  ,"&client_id=", clientId
                                  ,"&client_secret=", clientSecret
                                  ,"&refresh_token=", refreshToken))
  
  myHeader <- c('Content-Type' = "application/x-www-form-urlencoded")
  
  data <-  getURL(url             = tokenURL
                  ,postfields     = postContent
                  ,httpheader     = myHeader
                  ,ssl.verifypeer = FALSE
                  ,verbose        = TRUE)
  
  return(fromJSON(data))
}