GetPostResponse <- function(xmlString) {
  
  postContent <- paste0("xml=", URLencode(xmlString))
  
  url <- baseURL
  
  myHeader <- c('Content-Type'  = "application/x-www-form-urlencoded",
                'Authorization' = paste("Bearer", accessToken, sep=" "))
  
  #if (!is.null(sessionID)) url <- paste0(url,";jsessionID=",sessionID)
  
  data <-  getURL(url             = url
                  ,postfields     = postContent
                  ,httpheader     = myHeader
                  ,ssl.verifypeer = FALSE
                  ,verbose        = TRUE)
  
  doc <- xmlParse(data)
  
  return(doc)
}