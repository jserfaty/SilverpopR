Login <- function(username, password) {
  
  # Construct Envelope
  envelope <- newXMLNode("Envelope")
  body <- newXMLNode("Body", parent = envelope)
  
  # Functional Node
  fNode <- newXMLNode("Login", parent = body)  
  
  # Required Nodes
  newXMLNode("USERNAME", username, parent = fNode)
  newXMLNode("PASSWORD", password, parent = fNode)
  
  # Optional Nodes
  
  
  # Convert Envelope XML to String
  xmlString <- toString.XMLNode(envelope)
  
  return(GetPostResponse(xmlString, NULL))
}