library(iSEE)
library(iSEEu)
sce <- readRDS("/data/day3_interactive_visualization_iSEE/pbmc3k.rds")

## -----------------------------------------------------------------------------
app <- iSEE(sce)
shiny::runApp(app, launch.browser = TRUE)

## -----------------------------------------------------------------------------
app <- iSEE(sce, initial = list(ReducedDimensionPlot(), 
                                FeatureAssayPlot(),
                                MarkdownBoard(), 
                                DynamicMarkerTable()))
shiny::runApp(app, launch.browser = TRUE)

## -----------------------------------------------------------------------------
tour <- data.frame(
    element = c(
        "#Welcome",
        "#ReducedDimensionPlot1",
        "#ReducedDimensionPlot2",
        "#Conclusion"),
    intro = c(
        "Welcome to this tour!",
        "This is the first reduced dimension plot",
        "And here is the second one",
        "Thank you for taking this tour!"),
    stringsAsFactors = FALSE)

app <- iSEE(sce, initial = list(
    ReducedDimensionPlot(PanelWidth = 6L, Type = "TSNE",
                         ColorBy = "Feature name",
                         ColorByFeatureName = "CD3D"),
    ReducedDimensionPlot(PanelWidth = 6L, Type = "TSNE",
                         ColorBy = "Feature name",
                         ColorByFeatureName = "CD79B")), 
    tour = tour)
shiny::runApp(app, launch.browser = TRUE)

