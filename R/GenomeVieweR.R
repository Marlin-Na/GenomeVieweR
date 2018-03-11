#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
GenomeVieweR <- function(message, width = NULL, height = NULL, elementId = NULL) {

    # forward options using x
    x = list(
        message = message
    )

    # create widget
    htmlwidgets::createWidget(
        name = 'GenomeVieweR',
        x,
        width = width,
        height = height,
        package = 'GenomeVieweR',
        elementId = elementId
    )
}

#' Shiny bindings for GenomeVieweR
#'
#' Output and render functions for using GenomeVieweR within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a GenomeVieweR
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name GenomeVieweR-shiny
#'
#' @export
GenomeVieweROutput <- function(outputId, width = '100%', height = '400px'){
    htmlwidgets::shinyWidgetOutput(outputId, 'GenomeVieweR', width, height, package = 'GenomeVieweR')
}

#' @rdname GenomeVieweR-shiny
#' @export
renderGenomeVieweR <- function(expr, env = parent.frame(), quoted = FALSE) {
    if (!quoted) { expr <- substitute(expr) } # force quoted
    htmlwidgets::shinyRenderWidget(expr, GenomeVieweROutput, env, quoted = TRUE)
}
