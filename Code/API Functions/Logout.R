Logout <- function(sessionId) {
  
  xmlString <- paste0("<Envelope>"
                      ,"<Body>"
                      ,"<Logout/>"
                      ,"</Body>"
                      ,"</Envelope>")
  
  return(GetPostResponse(xmlString, sessionId))
}