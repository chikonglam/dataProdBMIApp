library(shiny)

# Define UI for application that calculates the BMI
shinyUI(fluidPage(
    
    # Application title
    titlePanel("BMI Calculator"),
    
    # Sidebar with Weight and Height inputs
    sidebarLayout(
        sidebarPanel(
            p("Please enter your weight and height:"),
            numericInput('weight', 'Weight (kg)', 89, min = 0),  #using average American weight, 89kg, as default
            numericInput('height', 'Height (cm)', 177, min = 0), #using average American height, 177cm, as default
            submitButton('OK')
        ),
        
        # Show the BMI numeric result and its category
        mainPanel(
            h4("Your Body Mass Index (BMI) is:"),
            textOutput("bmiNum"),
            br(),
            h4("Your BMI Category* is: "),
            textOutput("bmiCat"),
            br(),
            hr(),
            p("* BMI Category according to the WHO,"),
            a("http://apps.who.int/bmi/index.jsp?introPage=intro_3.htm", href="http://apps.who.int/bmi/index.jsp?introPage=intro_3.htm"),
            p("accessed Nov 20, 2015")

        )
    )
))