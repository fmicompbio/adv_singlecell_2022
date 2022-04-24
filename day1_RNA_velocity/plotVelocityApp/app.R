source("plot_abundances.R")

ui <- fluidPage(
    titlePanel("Plot spliced and unspliced abundances"),
    sidebarLayout(
        sidebarPanel(
            numericInput(inputId = "beta",
                         label = "beta",
                         value = 1,
                         min = 1,
                         max = 1),
            
            numericInput(inputId = "gamma",
                         label = "gamma",
                         value = 0.75,
                         min = 0.01, 
                         max = 10,
                         step = 0.05),
            
            selectInput(inputId = "alphatype",
                        label = "alpha type",
                        choices = c("constant", "two states",
                                    "periodic"),
                        selected = "constant", 
                        multiple = FALSE, 
                        selectize = TRUE),
            
            numericInput(inputId = "alphaswap",
                         label = "state changepoint (only if alpha type = 'two states')",
                         value = 5,
                         min = 0.5, 
                         max = 20,
                         step = 0.5),
            
            numericInput(inputId = "alphalength",
                         label = "length of state (only if alpha type = 'periodic')",
                         value = 3,
                         min = 0.5, 
                         max = 10,
                         step = 0.5),
            
            numericInput(inputId = "alpha",
                         label = "alpha",
                         value = 20,
                         min = 1,
                         max = 40,
                         step = 1),
            
            textInput(inputId = "slim",
                      label = "axis max s(t)",
                      value = "auto"),
            
            textInput(inputId = "ulim",
                      label = "axis max u(t)",
                      value = "auto")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            withMathJax(includeMarkdown("velocity_for_app.md")),
            plotOutput("veloplot")
        )
    )
)


server <- function(input, output) {
    output$veloplot <- renderPlot({
        if (input$alphatype == "constant") {
            tf <- data.frame(t = seq(0, 30, by = 0.01)) %>%
                dplyr::mutate(k = ifelse(t == 0, 0, 1)) %>%
                dplyr::mutate(alpha = ifelse(k == 1, input$alpha, 0)) %>%
                dplyr::mutate(beta = input$beta, 
                              gamma = input$gamma) %>%
                dplyr::mutate(u = 0, s = 0)
        } else if (input$alphatype == "two states") {
            tf <- data.frame(t = seq(0, 30, by = 0.01)) %>%
                dplyr::mutate(k = ifelse(t == 0, 0, 
                                         ifelse(t < input$alphaswap, 1, 2))) %>%
                dplyr::mutate(alpha = ifelse(k == 1, input$alpha, 0)) %>%
                dplyr::mutate(beta = input$beta, 
                              gamma = input$gamma) %>%
                dplyr::mutate(u = 0, s = 0)
        } else if (input$alphatype == "periodic") {
            tf <- data.frame(t = seq(0, 30, by = 0.01)) %>%
                dplyr::mutate(k = ifelse(t == 0, 0, ceiling(t/input$alphalength))) %>%
                dplyr::mutate(alpha = ifelse(k %% 2 == 1, input$alpha, 0)) %>%
                dplyr::mutate(beta = input$beta, 
                              gamma = input$gamma) %>%
                dplyr::mutate(u = 0, s = 0)
        }
        plot_abundances(tf, slim = input$slim, ulim = input$ulim)
        
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
