GetFTPContents <- function(ftpURL, ftpUsername, ftpPassword){
    
  ftpCredentials <- paste0(ftpUsername,":",ftpPassword)
  
  ftpFiles <- getURL(url = ftpURL
                       ,userpwd = ftpCredentials
                       ,ftp.use.epsv = FALSE
                       ,dirlistonly = TRUE)
  
  fileNames <- strsplit(ftpFiles, "\r*\n")[[1]]
  
  return(fileNames)
}