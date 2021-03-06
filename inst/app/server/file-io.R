# upload
observeEvent(input$upload, {
    # input$upload will be NULL initially.
    # The 'datapath' column will contain the local filenames where the data can be found
    inFile <- input$upload
    # when not NULL
    if (!is.null(inFile)) {
        # Read the new model
        newModel <- readLines(inFile$datapath)
        # Then update AceEditor
        updateAceEditor(session, editorId = "live_code", value = paste(newModel, collapse = "\n"))
    }
})

# download
output$download <- downloadHandler(
    filename = 'model.R',
    content = function(file) {
        if (length(input$live_code) > 0) {
            writeLines(text = input$live_code, con = file)
        }
    }
)
