GetAggregateTrackingForOrg <- function(..., asXML = TRUE, asDF = TRUE){
  
  # Get Function Name
  functionName <- as.character(match.call()[[1]])
  
  # Get Elements
  elements <- c(as.list(environment()), list(...))
  
  # Get Function Values
  validElements <- functionList[[functionName]]$inputElements
  outputElements <- functionList[[functionName]]$outputElements
  xpath <- functionList[[functionName]]$xpath
  xmlConfig <- functionList[[functionName]]$xmlConfig
  
  # Check arguments and stop if at least one is invalid
  suppliedElements <- toupper(names(list(...)))
  invalidElements <- suppliedElements[!(suppliedElements %in% validElements)]
  
  if (length(invalidElements)) {
    stop(sprintf("The following elements are invalid: %s"
                 ,paste0(invalidElements, collapse = ", ")))
  }
  
  # Build XML
  xmlString <- BuildNodes(functionName,...)
  
  # Send XML to API and get results
  doc <- GetPostResponse(xmlString)
  
  # Get Success Result
  successResult <- unlist(xpathApply(doc, "//SUCCESS", xmlValue))
  
  # Error Handler
  if (successResult == "false") {
    errorId <- unlist(xpathApply(doc, "//errorid", xmlValue))
    faultString <- unlist(xpathApply(doc, "//FaultString", xmlValue))
    stop(sprintf("\nSilverpop Error Number: %s\nSilverpop Error Message: %s"
                 ,errorId,faultString))
  }
  
  # Function-specific Exceptions
  if ("PER_CLICK" %in% suppliedElements) {
    if (elements[grep("PER_CLICK",names(elements)
                      ,ignore.case=TRUE,value=TRUE)] == TRUE) {
      xpath <- "//Click"
      xmlConfig <- "flat"
    }
  } else if ("TOP_DOMAIN" %in% suppliedElements) {
    if (elements[grep("TOP_DOMAIN",names(elements)
                      ,ignore.case=TRUE,value=TRUE)] == TRUE) {
      xpath <- "//TopDomain"
      xmlConfig <- "flat"
    }
  } else if ("INBOX_MONITORING" %in% suppliedElements) {
    if (elements[grep("INBOX_MONITORING",names(elements)
                      ,ignore.case=TRUE,value=TRUE)] == TRUE) {
      xpath <- "//InboxMonitored"
      xmlConfig <- "flat"
    }
  }
  
  # Return Results
  if (asXML) {
    print(doc)
  }
  
  if (asDF) {
    if (xmlConfig == "flat") {
      return(xmlToDF(doc, xpath))
    }
    if (xmlConfig == "nested") {
      return(xmlToDFv2(doc, xpath))
    }
  }
}