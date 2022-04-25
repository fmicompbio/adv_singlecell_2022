suppressPackageStartupMessages({
    library(shiny)
    library(dplyr)
    library(ggplot2)
    library(cowplot)
})

plot_abundances <- function(tf, slim = "auto", ulim = "auto") {
    ## The code below assumes that beta and gamma are constant over time
    stopifnot(length(unique(tf$beta)) == 1,
              length(unique(tf$gamma)) == 1)
    
    ## Check that time points are increasing
    stopifnot(all(diff(tf$t) > 0))
    
    ## Check that we don't go back to a previous state after being in another one
    stopifnot(all(sapply(split(seq_len(nrow(tf)), 
                               f = factor(tf$k)), function(w) {
                                   all(diff(w) == 1)
                               })))
    
    ## Calculate u(t) and s(t) for each time t > 0
    for (i in 2:nrow(tf)) {
        ## Initial conditions for the current state
        u0 <- tf$u[min(which(tf$k == tf$k[i])) - 1]
        s0 <- tf$s[min(which(tf$k == tf$k[i])) - 1]
        tau <- tf$t[i] - tf$t[min(which(tf$k == tf$k[i])) - 1]
        
        ## Get u(t) and s(t) from the analytical solution of the system of ODEs
        tf$u[i] <- u0 * exp(-tf$beta[i] * tau) + 
            tf$alpha[i]/tf$beta[i] * (1 - exp(-tf$beta[i] * tau))
        tf$s[i] <- s0 * exp(-tf$gamma[i] * tau) + 
            tf$alpha[i]/tf$gamma[i] * (1 - exp(-tf$gamma[i] * tau)) + 
            (tf$alpha[i] - tf$beta[i] * u0) /
            (tf$gamma[i] - tf$beta[i]) * (exp(-tf$gamma[i] * tau) - 
                                              exp(-tf$beta[i] * tau))
    }
    
    ## Convert the state column to a factor for plotting
    tf$k <- factor(tf$k)
    
    ## Plot u(t) and s(t) against t
    g1 <- ggplot(tf %>% tidyr::gather(key = type, value = abundance, u, s),
                 aes(x = t, y = abundance, color = type)) + 
        geom_line(size = 1.5) + theme_bw() + 
        scale_color_manual(values = c(u = "blue", s = "red")) + 
        theme(legend.position = c(1, 1),
              legend.justification = c("right", "top"),
              legend.box.just = "right", 
              legend.title = element_blank(),
              legend.margin = margin(1, 5, 1, 1),
              legend.background = element_rect(color = "black"))
    
    ## Plot alpha(t) against t
    g2 <- ggplot(tf, aes(x = t, y = alpha, color = k)) + 
        geom_line(size = 1.5) + theme_bw() + ylab(expr(alpha(t))) + 
        theme(legend.position = "none")
    
    ## Plot u(t) against s(t)
    lab <- bquote(paste("k = ", gamma/beta, " = ", .(tf$gamma[1]/tf$beta[1])))
    g3 <- ggplot(tf, aes(x = s, y = u, color = k)) + 
        geom_abline(intercept = 0, slope = tf$gamma[1]/tf$beta[1], 
                    linetype = "dashed") + 
        geom_point(alpha = 0.5, 
                   position = position_jitter(width = 0.1, height = 0.1)) +
        theme_bw() + theme(legend.position = "none") + 
        xlab(expr(s(t))) + ylab(expr(u(t))) + 
        annotate(geom = "text", x = 0, y = Inf, label = lab, parse = FALSE,
                 hjust = 0, vjust = 1.5)
    if (slim != "auto" && ulim != "auto") {
        g3 <- g3 + coord_cartesian(xlim = c(0, as.numeric(slim)),
                                   ylim = c(0, as.numeric(ulim)))
    } else if (slim == "auto" && ulim != "auto") {
        g3 <- g3 + coord_cartesian(ylim = c(0, as.numeric(ulim)))
    } else if (slim != "auto" && ulim == "auto") {
        g3 <- g3 + coord_cartesian(xlim = c(0, as.numeric(slim)))
    }

    ## Combine plots
    suppressWarnings({
        cowplot::plot_grid(
            cowplot::plot_grid(g1, g2, ncol = 1, rel_heights = c(1, 0.5),
                               align = "v", axis = "lr"),
            g3, nrow = 1, rel_widths = c(1, 1)
        )
    })
}
