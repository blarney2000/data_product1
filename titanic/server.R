library(shiny)
library(datasets)
data(Titanic)

#coerce to dataframe
titanic.data.orig <- as.data.frame(Titanic)

#Remove rows about crew memebers since we're only predicting passengers
newdf <- titanic.data.orig[ !grepl("Crew", titanic.data.orig$Class) , ]

#train linear model to predict survived variable using 3 most important variables (class, sex, age)
linear.model <- glm(Survived ~ Class + Sex + Age, binomial, titanic.data.orig, titanic.data.orig$Freq)

#Prediction function. Class, sex and age are obtained reactively from online user input
predict_survival <- function(class, sex, age ){
  inputdata <- c(class, sex, age)
  prediction.data <- as.data.frame(t(inputdata))
  colnames(prediction.data) <- c("Class", "Sex", "Age")
  #predict from existing model
  survival.prediction <- predict(linear.model, prediction.data , type = "response" ) 
  return(survival.prediction)
}

shinyServer(
  function(input, output) {
    survival.prob <- renderText({predict_survival(input$c,input$s, input$a)})    
    output$prob <- survival.prob
  })