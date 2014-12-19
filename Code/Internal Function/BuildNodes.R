BuildNodes <- function(functionName, ...) {
  
  elements <- c(as.list(environment()), list(...))

  ### Construct Envelope
  envelope <- newXMLNode("Envelope")
  body <- newXMLNode("Body", parent = envelope)
  ###
  
  # Functional Node
  fNode <- newXMLNode(elements$functionName, parent = body) 
  argParent <- fNode
  
  # Argument Nodes
  for (i in 2:length(elements)) {

    if (toupper(names(elements[i])) %in% c("COLUMN")) {
      
      for (j in 1:(length(elements[[i]])/2)) {

        column <- newXMLNode("COLUMN",parent = fNode)
        name <- newXMLNode("NAME"
                           ,elements[[i]][[j*2-1]]
                           ,parent = column)
        value <- newXMLNode("VALUE"
                            ,elements[[i]][[j*2]]
                            ,parent = column)
        }
      }  else if (toupper(names(elements[i])) %in% c("COLUMNS")) {
        
        columns <- newXMLNode("COLUMNS",parent = fNode)
        
        for (j in 1:length(elements[[i]])) {  
          column <- newXMLNode("COLUMN"
                             ,parent = columns)
          name <- newXMLNode("NAME"
                               ,elements[[i]][[j]]
                               ,parent = column)
        }
      }  else if (toupper(names(elements[i])) %in% c("CREATED_DATE_RANGE")) {
            
        dateRange <- newXMLNode("CREATED_DATE_RANGE",parent = fNode)
        beginDate <- newXMLNode("BEGIN_DATE"
                           ,elements[[i]][[1]]
                           ,parent = dateRange)
        endDate <- newXMLNode("END_DATE"
                            ,elements[[i]][[2]]
                            ,parent = dateRange)

      } else if (toupper(names(elements[i])) %in% c("DOMAINS")) {
        
        domains <- newXMLNode("DOMAINS",parent = fNode)
        
        for (j in 1:length(elements[[i]])) {  
          domainId <- newXMLNode("DOMAIN_ID"
                               ,elements[[i]][[j]]
                               ,parent = domains)
        }
      } else if (toupper(names(elements[i])) %in% c("SITES")) {
        
        sites <- newXMLNode("SITES",parent = fNode)
        
        for (j in 1:length(elements[[i]])) {  
          siteId <- newXMLNode("SITE_ID"
                                 ,elements[[i]][[j]]
                                 ,parent = sites)
        }
      } else if (toupper(names(elements[i])) %in% c("EXPORT_COLUMNS")) {
        
        exportColumns <- newXMLNode("EXPORT_COLUMNS",parent = fNode)
        
        for (j in 1:length(elements[[i]])) {  
          columnName <- newXMLNode("COLUMN"
                               ,elements[[i]][[j]]
                               ,parent = exportColumns)
        }
      } else if (toupper(names(elements[i])) %in% c("MAILING_ID","REPORT_ID")
                 & length(elements[[i]]) > 1) {
          for (j in 1:length(elements[[i]])) {
            mailing <- newXMLNode("MAILING",parent = fNode)
        
            newXMLNode(toupper(names(elements[i]))
                   ,elements[[i]][j]
                   ,parent = mailing)
          }
      } else if (elements$functionName == "PreviewMailing") {
        if (toupper(names(elements[i])) == "MAILINGID") {
          newXMLNode("MailingId"
                   ,elements[[i]]
                   ,parent = fNode)  
        } else if (toupper(names(elements[i])) == "RECIPIENTEMAIL"){
          newXMLNode("RecipientEmail"
                     ,elements[[i]]
                     ,parent = fNode)  
        }
      } else {  
        newXMLNode(toupper(names(elements[i]))
                   ,elements[[i]]
                   ,parent = fNode)
      }
  }
  
  print(envelope)
  xmlString <- toString.XMLNode(envelope)
  return(xmlString)
}