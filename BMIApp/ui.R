library(shiny)

# Define UI for application that calculates the BMI
shinyUI(fluidPage(
    
    # Application title
    titlePanel("BMI Calculator"),
    
    # Sidebar with Weight and Height inputs
    sidebarLayout(
        sidebarPanel(
            p("Please enter your weight and height, then click OK."),
            numericInput('weight', 'Weight (kg)', 88.3, min = 0),  #using average American male weight, 88.3kg, as default
            numericInput('height', 'Height (cm)', 178.2, min = 0), #using average American male height, 178.2cm, as default
            actionButton("okButton", "OK"),
            br(), hr(),
            p("The height, weight, and BMI of an average US male are displayed as defaults.  Your BMI and its catergory will display on the right after you click OK.")
        ),
        
        # Show the BMI numeric result and its category
        mainPanel(
            h3("Your Body Mass Index (BMI) is:"),
            textOutput("bmiNum"),
            br(),
            h3("Your BMI Category* is: "),
            textOutput("bmiCat"),
            br(),
            hr(),
            p("* BMI Category according to the World Health Organization,"),
            a("http://apps.who.int/bmi/index.jsp?introPage=intro_3.htm", href="http://apps.who.int/bmi/index.jsp?introPage=intro_3.htm"),
            p("accessed Nov 20, 2015"),
            p('a BMI of 18.5 - 25 is considered to be in the "normal" category.')

        )
    )
))