xmlToDF <- function(doc, xpath, isXML = TRUE
                    ,usewhich = TRUE, verbose = FALSE) {     
  
  # get the records for that form
  nodeSet <- getNodeSet(doc, xpath)
  
  # get the field names
  varNames <- lapply(nodeSet, names)
  
  # get the total fields that are in any record
  fields <- unique(unlist(varNames))

  # extract the values from all fields
  dl <- lapply(fields, function(x) {
    if (verbose)
      print(paste0("  ", x))
    xpathSApply(doc, paste0(xpath, "/", x), xmlValue)
  })
  
  # make logical matrix whether each record had that field
  nameMatrix <- t(sapply(varNames, function(x) fields %in% x))
  df <- data.frame(matrix(NA
                          ,nrow = nrow(nameMatrix)
                          ,ncol = ncol(nameMatrix)))
  names(df) <- fields
  
  # fill in that data.frame
  for (icol in 1:ncol(nameMatrix)) {
    repRows <- nameMatrix[, icol]
    if (usewhich) {
      repRows <- which(repRows)
    }
    df[repRows, icol] = dl[[icol]]
  }
  
  return(df)
}