GetListMetaData <- function(..., asXML = TRUE, asDF = TRUE){
  
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
  if ("COLUMNS" %in% suppliedElements) {
    if (elements[grep("COLUMNS",names(elements)
                      ,ignore.case=TRUE,value=TRUE)] == TRUE) {
      xpath <- "//COLUMNS/COLUMN"
      xmlConfig <- "flat"
    }
  } else if ("KEY_COLUMNS" %in% suppliedElements) {
    if (elements[grep("KEY_COLUMNS",names(elements)
                      ,ignore.case=TRUE,value=TRUE)] == TRUE) {
      xpath <- "//KEY_COLUMNS/COLUMN"
      xmlConfig <- "flat"
    }
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