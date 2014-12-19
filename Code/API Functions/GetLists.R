GetLists <- function(..., asXML = TRUE, asDF = TRUE){
  
  # VISIBILITY Options
  # 0 – Private
  # 1 – Shared
  #
  # LIST_TYPE Options
  # 0 – Databases
  # 1 – Queries
  # 2 – Databases, Contact Lists and Queries
  # 5 – Test Lists
  # 6 – Seed Lists
  # 13 – Suppression Lists
  # 15 – Relational Tables
  # 18 – Contact Lists
  
  # Get Function Name
  functionName <- as.character(match.call()[[1]])
  
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