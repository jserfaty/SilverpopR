xmlToDF <- function(doc, xpath, xmlConfig, isXML = TRUE
                    ,usewhich = TRUE, verbose = FALSE) {     
  
  if (xmlConfig == "flat") {
    # Get the records for that node
    nodeSet <- getNodeSet(doc, xpath)
    
    # Get the field names
    varNames <- lapply(nodeSet, names)
    
    # Get the total fields that are in any record
    fields <- unique(unlist(varNames))
  
    # Extract the values from all fields
    dl <- lapply(fields, function(x) {
      if (verbose)
        print(paste0("  ", x))
      xpathSApply(doc, paste0(xpath, "/", x), xmlValue)
    })
    
    # Make logical matrix whether each record had that field
    nameMatrix <- t(sapply(varNames, function(x) fields %in% x))
    df <- data.frame(matrix(NA
                            ,nrow = nrow(nameMatrix)
                            ,ncol = ncol(nameMatrix)))
    names(df) <- fields
    
    # Fill in data.frame
    for (icol in 1:ncol(nameMatrix)) {
      repRows <- nameMatrix[, icol]
      if (usewhich) {
        repRows <- which(repRows)
      }
      df[repRows, icol] = dl[[icol]]
    }
    
    return(df)
  } else if (xmlConfig == "nested"){
    # Initialize DF list
    dataFrameList <- list()
    dataFrameListLength <- 0
    
    # Extract Flat Nodes as a data.frame
    # Get all nodes that don't have children 
    flatNodeSet <- getNodeSet(doc,"//RESULT/*[not(*)]")
    
    # Get varNames
    flatVarNames <- names.XMLNode(flatNodeSet)
    
    # Remove "SUCCESS" node
    flatVarNames <- flatVarNames[flatVarNames != "SUCCESS"]  
    
    if (length(flatVarNames) > 0) {
      # Get the unique Field Names
      flatFields <- unique(unlist(flatVarNames))
      
      # Extract Values from Fields
      flatDl <- lapply(flatVarNames, function(x) {
        if (verbose)
          print(paste0("  ", x))
        xpathSApply(doc, paste0("//RESULT", "/", x), xmlValue)
      })
      
      # Make logical matrix whether each record had that field
      flatNameMatrix <- t(sapply(flatVarNames, function(x) flatFields %in% x))
      flatDf <- data.frame(matrix(NA
                                  ,nrow = 1
                                  ,ncol = ncol(flatNameMatrix)))
      
      names(flatDf) <- flatFields
      
      # Fill in data.frame
      for (icol in 1:ncol(flatNameMatrix)) {
        flatDf[1, icol] <- flatDl[[icol]]
      }
      
      if (!is.null(flatDf)) {
        dataFrameList[[1]] <- flatDf
      }
      
      dataFrameListLength <- 1
    }
    
    # Extract Each Nested Node as a data.frame  
    nestedNodeSet <- getNodeSet(doc,"//RESULT/*[(*)]")
    
    # Get each unique node: to become node of new data.frame
    nestedNodeNames <- unique(names.XMLNode(nestedNodeSet))
    
    # Get number of unique nodes, to become number of new data.frames
    nestedNodeNumber <- length(nestedNodeNames)
    
    for (i in 1:nestedNodeNumber) {
      xpath <- paste0("//RESULT/",nestedNodeNames[i],"/*[(*)]")
      
      # Get the records for that node
      nodeSet <- getNodeSet(doc, xpath)
      
      # Get the field names
      varNames <- lapply(nodeSet, names)
      
      # Get the total fields that are in any record
      fields <- unique(unlist(varNames))
      
      # Extract the values from all fields
      dl <- lapply(fields, function(x) {
        if (verbose)
          print(paste0("  ", x))
        xpathSApply(doc, paste0(xpath, "/", x), xmlValue)
      })
      
      # Make logical matrix whether each record had that field
      nameMatrix <- t(sapply(varNames, function(x) fields %in% x))
      df <- data.frame(matrix(NA
                              ,nrow = nrow(nameMatrix)
                              ,ncol = ncol(nameMatrix)))
      names(df) <- fields
      
      # Fill in data.frame
      for (icol in 1:ncol(nameMatrix)) {
        repRows <- nameMatrix[, icol]
        if (usewhich) {
          repRows <- which(repRows)
        }
        df[repRows, icol] <- dl[[icol]]
      }
      
      dataFrameList[[i+dataFrameListLength]] <- df
      
    }
    
    return(dataFrameList)
  }
  
}