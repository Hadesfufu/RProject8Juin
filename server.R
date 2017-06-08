library(shiny)

function(input, output) {
  output$contents <- renderTable({
      inFile <- input$file1
      if (is.null(inFile))
        return(NULL)
    
      filedata <- read.csv(inFile$datapath, header=input$header, sep=input$sep, 
             quote=input$quote)
      firstRow <- as.numeric(filedata[,1])
      lastRow <- as.numeric(filedata[,2])
      if(input$func == 'varcomp'){
        varfr <- var(firstRow)
        varlr <- var(lastRow)
        vart <- var.test(firstRow, lastRow)
        outputdata <- data.frame(c(varfr), c(varlr), c(vart))
      }
      else if(input$func == 'moycomp'){
        moyfr <- mean(firstRow)
        moylr <- mean(lastRow)
        moyt <- t.test(firstRow,lastRow)
        outputdata <- data.frame(c(moyfr), c(moylr), c(moyt))
      }
      else{
        outputdata <- data.frame(c(firstRow), c(lastRow)) 
      }
      outputdata
  })
}

