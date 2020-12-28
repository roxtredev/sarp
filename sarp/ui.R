#  Developing Data Products- Course Project
#  The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile
#  design and performance for 32 automobiles (1973-74 models).
#  Final Project
#  Roxana Trejos Ramirez



library(shiny)

shinyUI(fluidPage(

    titlePanel("Vehicle Performance - Comparision. The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973-74 models)"),

    # Sidebar

    sidebarLayout(
        sidebarPanel(
            helpText("Select options :"),


            sliderInput('hp',
                        'Gross horsepower',
                        min=1,
                        max=1000,
                        value=c(1,1000),
                        step=5),

            sliderInput('qsec',
                        '1/4 mile time',
                        min=1,
                        max=100,
                        value=c(1,100),
                        step=1),

            sliderInput('avg',
                        'Miles/(US) gallon',
                        min=1,
                        max=100,
                        value=c(1,100),
                        step=10),


            checkboxGroupInput('am',
                               'Transmission (0 = automatic, 1 = manual)',
                               c("Automatic"=0, "Manual"=1),
                               selected = c(0,1)),

            checkboxGroupInput('cyl',
                               'Number of cylinders',
                               c("Four"=4, "Six"=6, "Eight"=8),
                               selected = c(4,6,8)),


            checkboxGroupInput('carb',
                               'Number of carburetors:',
                               c("One"=1, "Two"=2, "Three"=3, "Four"=4),
                               selected = c(1,2,3,4)),


            submitButton("Submit")
        ),

        mainPanel(
            dataTableOutput('table'))
    )
)
)
