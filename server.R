# This shiny app is based on the LifeCycleSavings datase from the
# datasets package.
# 
# This app enables a user to choose which independent variable(s) 
# to include in a model that predicts the aggregate personal savings
# divided by disposable income ('sr') for 50 countries.

# Load the required libraries
library(shiny)
library(datasets)
library(Metrics)

# Define server logic required to draw scatterplot and rmse outputs
shinyServer(function(input, output){
  
  output$savePlot <- renderPlot({
    
    ifelse(input$population15, pop15 <- LifeCycleSavings$pop15,
           pop15 <- rep(0, 50))
    ifelse(input$population75, pop75 <- LifeCycleSavings$pop75,
           pop75 <- rep(0, 50))
    ifelse(input$dispInc, dpi <- LifeCycleSavings$dpi,
           dpi <- rep(0, 50))
    ifelse(input$ddispInc, ddpi <- LifeCycleSavings$ddpi,
           ddpi <- rep(0, 50))
    sr <- LifeCycleSavings$sr
    
    modelData <- cbind.data.frame(sr, pop15, pop75, dpi, ddpi)
    
    model <- lm(sr ~ ., data = modelData)
    prediction <- predict(model)
    
    plot(prediction, pch = 19, col = "blue",
         main = "Savings Rates - actual vs predicted",
         ylab = "Personal Savings Rate", xlab = "Country Index",
         ylim = c(0, 20))
    
    
    points(LifeCycleSavings$sr, pch = 19, col = "red")
    
  })
  
  output$rmse <- renderText({
    
    ifelse(input$population15, pop15 <- LifeCycleSavings$pop15,
           pop15 <- rep(0, 50))
    ifelse(input$population75, pop75 <- LifeCycleSavings$pop75,
           pop75 <- rep(0, 50))
    ifelse(input$dispInc, dpi <- LifeCycleSavings$dpi,
           dpi <- rep(0, 50))
    ifelse(input$ddispInc, ddpi <- LifeCycleSavings$ddpi,
           ddpi <- rep(0, 50))
    sr <- LifeCycleSavings$sr
    
    modelData <- cbind.data.frame(sr, pop15, pop75, dpi, ddpi)
    
    model <- lm(sr ~ ., data = modelData)
    
    prediction <- predict(model)
    rmse(LifeCycleSavings$sr, prediction)
    
  })
  
})
