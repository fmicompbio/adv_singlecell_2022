This app illustrates the solution to the following system of ODEs:

$$\frac{du(t)}{dt} = \alpha_k(t) - \beta u(t)$$
$$\frac{ds(t)}{dt} = \beta u(t) - \gamma s(t)$$
$$u(0) = s(0) = 0$$

as derived by Bergen et al (2019). It assumes that $\beta$ (splicing rate) and $\gamma$ (degradation rate) are constant over the time of the experiment, but that $\alpha$ (transcription) can change according to the state that the cell is in. Three possible models for $\alpha$ are available. 
