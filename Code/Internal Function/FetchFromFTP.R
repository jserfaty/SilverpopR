FetchFromFTP <- function(ftpURL, fileName, ftpUsername, ftpPassword, fileType,
                         dest = tempfile()) {
  
  ftpPath <- paste0(ftpURL, fileName)
  
  ftpCredentials <- paste0(ftpUsername, ":", ftpPassword)

  con <-  getCurlHandle(userpwd = ftpCredentials
                        ,ftp.use.epsv = FALSE)
  
  bin <- getBinaryURL(ftpPath, curl = con)

  writeBin(bin,dest)
  
  if (toupper(fileType)=="ZIP") {
    return(read.csv(unzip(dest)))
  } else if (toupper(fileType)=="CSV") {
    return(read.csv(dest))
  }
}