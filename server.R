library(shiny)

function(input, output) {
  output$contents <- renderTable({
      inFile <- input$file1
      if (is.null(inFile))
        return(NULL)
    
      filedata <- read.csv(inFile$datapath, header=input$header, sep=input$sep,
             quote=input$quote)
      firstCol <- as.numeric(filedata[,1])
      lastCol <- as.numeric(filedata[,2])
      if(input$func == 'varcomp'){
        varfc <- var(firstCol)
        varlc <- var(lastCol)
        outputdata <- data.frame(c(varfc), c(varlc))
      }
      else if(input$func == 'moycomp'){
        moyfc <- mean(firstCol)
        moylc <- mean(lastCol)
        outputdata <- t.test(firstCol, lastCol)
        outputdata <- data.frame(c(moyfc), c(moylc))
      }
      else{
        outputdata <- filedata 
      }
      outputdata
  })
}

