# Create Lookup List for Functions
functionList <- list()

functionList[["ExportList"]] <- list(
  inputElements   = c("LIST_ID"
                      ,"EMAIL"
                      ,"EXPORT_TYPE"
                      ,"EXPORT_FORMAT"
                      ,"FILE_ENCODING"
                      ,"ADD_TO_STORED_FILES"
                      ,"DATE_START"
                      ,"DATE_END"
                      ,"USE_CREATED_DATE"
                      ,"INCLUDE_LEAD_SOURCE"
                      ,"LIST_DATE_FORMAT"
                      ,"EXPORT_COLUMNS")
  ,xpath          = c("//RESULT")
  ,xmlConfig      = "flat")

functionList[["GetAggregateTrackingForMailing"]] <- list(
  inputElements   = c("MAILING_ID"
                      ,"REPORT_ID"
                      ,"TOP_DOMAIN"
                      ,"INBOX_MONITORING"
                      ,"PER_CLICK")
  ,outputElements = NULL
  ,xpath          = c("//Mailing")
  ,xmlConfig      = "flat")

functionList[["GetAggregateTrackingForOrg"]] <- list(
  inputElements   = c("DATE_START"
                      ,"DATE_END"
                      ,"PRIVATE"
                      ,"SHARED"
                      ,"SCHEDULED"
                      ,"SENT"
                      ,"SENDING"
                      ,"OPTIN_CONFIRMATION"
                      ,"PROFILE_CONFIRMATION"
                      ,"AUTOMATED"
                      ,"CAMPAIGN_ACTIVE"
                      ,"CAMPAIGN_COMPLETED"
                      ,"CAMPAIGN_CANCELLED"
                      ,"TOP_DOMAIN"
                      ,"INBOX_MONITORING"
                      ,"PER_CLICK"
                      ,"EXCLUDE_TEST_MAILINGS")
  ,outputElements = NULL
  ,xpath          = c("//Mailing")
  ,xmlConfig      = "flat")

functionList[["GetAggregateTrackingForUser"]] <- list(
  inputElements   = c("DATE_START"
                      ,"DATE_END"
                      ,"OPTIONALUSER"
                      ,"PRIVATE"
                      ,"SHARED"
                      ,"SCHEDULED"
                      ,"SENT"
                      ,"SENDING"
                      ,"OPTIN_CONFIRMATION"
                      ,"PROFILE_CONFIRMATION"
                      ,"AUTOMATED"
                      ,"CAMPAIGN_ACTIVE"
                      ,"CAMPAIGN_COMPLETED"
                      ,"CAMPAIGN_CANCELLED"
                      ,"TOP_DOMAIN"
                      ,"INBOX_MONITORING"
                      ,"PER_CLICK"
                      ,"EXCLUDE_TEST_MAILINGS")
  ,outputElements = NULL
  ,xpath          = c("//Mailing")
  ,xmlConfig      = "flat")

functionList[["GetContactMailingDetails"]] <- list(
  inputElements   = c("SURE_FROM_CODE"
                      ,"ORGANIZATION_ID")
  ,outputElements = NULL
  ,xpath          = c("//Mailing")
  ,xmlConfig      = "flat")

functionList[["GetListMetaData"]] <- list(
  inputElements   = c("LIST_ID")
  ,xpath          = c("//RESULT"
                      ,"//COLUMN")
  ,xmlConfig      = "nested")

functionList[["GetLists"]] <- list(
  inputElements   = c("VISIBILITY"
                      ,"LIST_TYPE"
                      ,"FOLDER_ID"
                      ,"INCLUDE_ALL_LISTS"
                      ,"INCLUDE_TAGS")
  ,xpath          = c("//LIST")
  ,xmlConfig        = "flat")

functionList[["GetMailingTemplates"]] <- list(
  inputElements   = c("VISIBILITY"
                      ,"IS_CRM_ENABLED"
                      ,"LAST_MODIFIED_START_DATE"
                      ,"LAST_MODIFIED_END_DATE")
  ,xpath          = c("//MAILING_TEMPLATE")
  ,xmlConfig      = "flat")

functionList[["GetMessageGroupDetails"]] <- list(
  inputElements   = c("MESSAGE_GROUP_ID")
  ,xpath          = c("//RESULT")
  ,xmlConfig        = "flat")

functionList[["GetPrograms"]] <- list(
  inputElements   = c("INCLUDE_ACTIVE"
                      ,"INCLUDE_INACTIVE"
                      ,"CREATED_DATE_RANGE"
                      ,"LIST_ID"
                      ,"APPROVED_FOR_SALES"
                      ,"INCLUDE_TAGS")
  ,xpath          = c("//RESULT"
                      ,"//PROGRAM")
  ,xmlConfig      = "nested")

functionList[["GetProgramsByContact"]] <- list(
  inputElements   = c("LIST_ID"
                      ,"INCLUDE_ACTIVE"
                      ,"INCLUDE_INACTIVE"
                      ,"CONTACT_ID"
                      ,"VISITOR_KEY"
                      ,"INCLUDE_HISTORY"
                      ,"CREATED_DATE_RANGE"
                      ,"APPROVED_FOR_SALES"
                      ,"INCLUDE_TAGS"
                      ,"INCLUDE_TRACK"
                      ,"INCLUDE_STEP")
  ,xpath          = c("//RESULT"
                      ,"//PROGRAM")
  ,xmlConfig      = "nested")

functionList[["GetReportIdByDate"]] <- list(
  inputElements   = c("MAILING_ID"
                      ,"DATE_START"
                      ,"DATE_END")
  ,outputElements = NULL
  ,xpath          = c("//Mailing")
  ,xmlConfig      = "flat")

functionList[["GetSentMailingsForList"]] <- list(
  inputElements   = c("LIST_ID"
                      ,"INCLUDE_CHILDREN"
                      ,"DATE_START"
                      ,"DATE_END"
                      ,"PRIVATE"
                      ,"SHARED"
                      ,"SCHEDULED"
                      ,"SENT"
                      ,"SENDING"
                      ,"OPTIN_CONFIRMATION"
                      ,"PROFILE_CONFIRMATION"
                      ,"AUTOMATED"
                      ,"CAMPAIGN_ACTIVE"
                      ,"CAMPAIGN_COMPLETED"
                      ,"CAMPAIGN_CANCELLED"
                      ,"CAMPAIGN_SCRAPE_TEMPLATE"
                      ,"INCLUDE_TAGS"
                      ,"EXCLUDE_ZERO_SENT"
                      ,"MAILING_COUNT_ONLY"
                      ,"EXCLUDE_TEST_MAILINGS")
  ,outputElements = NULL
  ,xpath          = c("//Mailing")
  ,xmlConfig      = "flat")

functionList[["GetSentMailingsForOrg"]] <- list(
  inputElements   = c("DATE_START"
                      ,"DATE_END"
                      ,"PRIVATE"
                      ,"SHARED"
                      ,"SCHEDULED"
                      ,"SENT"
                      ,"SENDING"
                      ,"OPTIN_CONFIRMATION"
                      ,"PROFILE_CONFIRMATION"
                      ,"AUTOMATED"
                      ,"CAMPAIGN_ACTIVE"
                      ,"CAMPAIGN_COMPLETED"
                      ,"CAMPAIGN_CANCELLED"
                      ,"CAMPAIGN_SCRAPE_TEMPLATE"
                      ,"INCLUDE_TAGS"
                      ,"EXCLUDE_ZERO_SENT"
                      ,"MAILING_COUNT_ONLY"
                      ,"EXCLUDE_TEST_MAILINGS")
  ,outputElements = NULL
  ,xpath          = c("//Mailing")
  ,xmlConfig      = "flat")   

functionList[["GetSentMailingsForUser"]] <- list(
  inputElements   = c("DATE_START"
                      ,"DATE_END"
                      ,"OPTIONALUSER"
                      ,"PRIVATE"
                      ,"SHARED"
                      ,"SCHEDULED"
                      ,"SENT"
                      ,"SENDING"
                      ,"OPTIN_CONFIRMATION"
                      ,"PROFILE_CONFIRMATION"
                      ,"AUTOMATED"
                      ,"CAMPAIGN_ACTIVE"
                      ,"CAMPAIGN_COMPLETED"
                      ,"CAMPAIGN_CANCELLED"
                      ,"CAMPAIGN_SCRAPE_TEMPLATE"
                      ,"INCLUDE_TAGS"
                      ,"EXCLUDE_ZERO_SENT"
                      ,"MAILING_COUNT_ONLY"
                      ,"EXCLUDE_TEST_MAILINGS")
  ,outputElements = NULL
  ,xpath          = c("//Mailing")
  ,xmlConfig      = "flat")

functionList[["GetScoringModels"]] <- list(
  inputElements   = NULL
  ,xpath          = c("//RESULT"
                      ,"//PROGRAM")
  ,xmlConfig      = "nested")

functionList[["ListRecipientMailings"]] <- list(
  inputElements   = c("LIST_ID"
                      ,"RECIPIENT_ID")
  ,outputElements = NULL
  ,xpath          = c("//Mailing")
  ,xmlConfig      = "flat")

functionList[["PreviewMailing"]] <- list(
  inputElements   = c("MAILINGID"
                      ,"RECIPIENTEMAIL")
  ,outputElements = NULL
  ,xpath          = c("//PreviewMailing")
  ,xmlConfig      = "flat")

functionList[["RawRecipientDataExport"]] <- list(
  inputElements   = c("MAILING_ID"
                      ,"REPORT_ID"
                      ,"CAMPAIGN_ID"
                      ,"LIST_ID"
                      ,"INCLUDE_CHILDREN"
                      ,"ALL_NON_EXPORTED"
                      ,"EVENT_DATE_START"
                      ,"EVENT_DATE_END"
                      ,"SEND_DATE_START"
                      ,"SEND_DATE_END"
                      ,"EXPORT_FORMAT"
                      ,"FILE_ENCODING"
                      ,"EXPORT_FILE_NAME"
                      ,"EMAIL"
                      ,"MOVE_TO_FTP"
                      ,"PRIVATE"
                      ,"SHARED"
                      ,"SENT_MAILINGS"
                      ,"SENDING"
                      ,"OPTIN_CONFIRMATION"
                      ,"PROFILE_CONFIRMATION"
                      ,"AUTOMATED"
                      ,"CAMPAIGN_ACTIVE"
                      ,"CAMPAIGN_COMPLETED"
                      ,"CAMPAIGN_CANCELLED"
                      ,"CAMPAIGN_SCRAPE_TEMPLATE"
                      ,"INCLUDE_TEST_MAILINGS"
                      ,"ALL_EVENT_TYPES"
                      ,"SENT"
                      ,"SUPPRESSED"
                      ,"OPENS"
                      ,"CLICKS"
                      ,"OPTINS"
                      ,"OPTOUTS"
                      ,"FORWARDS"
                      ,"ATTACHMENTS"
                      ,"CONVERSIONS"
                      ,"CLICKSTREAMS"
                      ,"HARD_BOUNCES"
                      ,"SOFT_BOUNCES"
                      ,"REPLY_ABUSE"
                      ,"REPLY_COA"
                      ,"REPLY_OTHER"
                      ,"MAIL_BLOCKS"
                      ,"MAILING_RESTRICTIONS"
                      ,"SMS_ERROR"
                      ,"SMS_REJECT"
                      ,"SMS_OPTOUT"
                      ,"INCLUDE_SEEDS"
                      ,"INCLUDE_FORWARDS"
                      ,"INCLUDE_INBOX_MONITORING"
                      ,"CODED_TYPE_FIELDS"
                      ,"EXCLUDE_DELETED"
                      ,"FORWARDS_ONLY"
                      ,"RETURN_MAILING_NAME"
                      ,"RETURN_SUBJECT"
                      ,"RETURN_CRM_CAMPAIGN_ID"
                      ,"COLUMNS")
  ,outputElements = NULL
  ,xpath          = c("//MAILING")
  ,xmlConfig      = "flat")

functionList[["SelectRecipientData"]] <- list(
  inputElements   = c("LIST_ID"
                      ,"EMAIL"
                      ,"RECIPIENT_ID"
                      ,"ENCODED_RECIPIENT_ID"
                      ,"VISITOR_KEY"
                      ,"RETURN_CONTACT_LISTS"
                      ,"COLUMN")
  ,outputElements = NULL
  ,xpath          = c("//RESULT")
  ,xmlConfig      = "nested")





CheckElements <- function(){
  
  # List: function_list(function$input_elements = c(), $output_elements = c(), $xpath = c())
  
  
  
  
  
}

GetValidElements <- function(){
  
  # Give user ability to access valid elements for a given function. Calls "CheckElements"
  
}


