library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Titanic Survival Calculator"),
  sidebarPanel(    
    h4("Find out the chances of surviving the Titanic sinking"),
    p("Select information about passengers:"),
    selectInput("c", label =h4("Passenger class:"), list("1st Class Passenger" = "1st","2nd Class Passenger" = "2nd", "3rd Class Passenger" = "3rd")),
    radioButtons("s", label = h4("Sex:"),
                 choices = list("Male" = "Male", "Female" = "Female"), 
                 selected = "Female"),
    radioButtons("a", label = h4("Age:"),
                 choices = list("Child" = "Child", "Adult" = "Adult"),
                 selected = "Adult")),
  mainPanel(        
    tabsetPanel(
      tabPanel("Prediction", 
         tags$br(),
         h4("Survival Probability:"),
         tags$br(),
         h4(textOutput("prob"), align = "center"),
         tags$br(),
         tags$br(),
         p("This is the estimated probability using real historical data, but it does not necessarily reflect a true survival chance.")

      ), 
      tabPanel("Documentation",
        br(), 
        tags$p("Select the options on the left to predict the probability of a person on the Titanic surviving based on those values."),
        tags$p("The form is reactive, so you do not need to manually submit the data. The results will automatically appear in the 'Prediction' tab."),
        tags$p("The result is a prediction value from a model trained on actual data of RMS Titanic's passengers. It uses several variables to predict the probability of survival from a trained linear model. Only the survivors' chances are predicted and not the crew's. A more detailed descripton of the data is", a("here",href = "http://www.public.iastate.edu/~hofmann/data/titanic.html"), ".")         
    )
  ),
    h6("Use the form on the left to find the chances of survival.")
  )
  )
)
