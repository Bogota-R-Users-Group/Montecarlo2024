
# Truncated Distro --------------------------------------------------------


n <- 1000
X <- truncdist::rtrunc(spec = "norm", n, a = 1, b = 3, mean = 2, sd = 0.5)
hist(X)


# Correalcion -------------------------------------------------------------

n <- 200 # number of samples
nvars <- 2 # number of variables

# correlation matrix (symmetric!)
sigma <- matrix(rep(0, nvars*nvars), nrow = nvars, ncol = nvars) # uncorrelated
sigma[1,] <- c(1.0, 0.8) 
sigma[2,] <- c(0.8, 1.0)


set.seed(123)
corrLHS <- pse::LHS(factors = nvars, N = n, method = "HL", opts = list(COR = sigma, eps = 0.05))

XX <- pse::get.data(corrLHS)
plot(XX)


df <- data.frame(var1 = qunif(XX[, 1], 0, 10),
                 var2 = qnorm(XX[, 2], 5, 0.5))

psych::pairs.panels(df, 
                    method = "spearman", # correlation method
                    hist.col = "#00AFBB",
                    density = TRUE,  # show density plots
                    ellipses = TRUE) # show correlation ellipses



# corr 3 vars -------------------------------------------------------------


n <- 200 # number of samples
nvars <- 3 # number of variables

# correlation matrix (symmetric!)
sigma <- matrix(rep(0, nvars*nvars), nrow = nvars, ncol = nvars) # uncorrelated
sigma[1,] <- c(1.0, 0.8, 0.25) 
sigma[2,] <- c(0.8, 1.0, 0)
sigma[3,] <- c(0.25, 0,1.0)


set.seed(123)
corrLHS <- pse::LHS(factors = nvars, N = n, method = "HL", opts = list(COR = sigma, eps = 0.05))

XX <- pse::get.data(corrLHS)
plot(XX)


df <- data.frame(var1 = qunif(XX[, 1], 0, 10),
                 var2 = qnorm(XX[, 2], 5, 0.5), 
                 var3 = qbeta(XX[, 3], 1, 2))

psych::pairs.panels(df, 
                    method = "spearman", # correlation method
                    hist.col = "#00AFBB",
                    density = TRUE,  # show density plots
                    ellipses = TRUE) # show correlation ellipses


# PI approx -------------------------------------------------------------

nn <- 1e3

experiment <- data_frame(N = 1:nn) %>% 
  mutate(X = runif(nn, -1, 1),
         Y = runif(nn, -1, 1),
         D = sqrt(X^2 + Y^2), # distance from origin
         circle = if_else(D <= 1, TRUE, FALSE))

head(experiment, 3)

experiment %>% 
  summarize(pi_estimate = 4 * sum(circle) / n()) %>% 
  pull(pi_estimate)


# PI approx / disgtribucion equivocada ---------------------------------------

nn <- 1e4

experiment <- data_frame(N = 1:nn) %>% 
  mutate(X = rnorm(nn, 0, 0.5),
         Y = rnorm(nn, 0, 0.5),
         D = sqrt(X^2 + Y^2), # distance from origin
         circle = if_else(D <= 1, TRUE, FALSE))


experiment %>% 
  summarize(pi_estimate = 4 * sum(circle) / n()) %>% 
  pull(pi_estimate)

# integral ----------------------------------------------------------------

library(rmontecarlo)

ff <- "x * sin(x^2)"
x_range <- c(0, 2 * sqrt(pi))
nn <- 1e4
set.seed(123)
integrate_mc(ff, x_range, n = nn)



ff <- "2*x-1"
x_range <- c(0, 2)
nn <- 1e4
set.seed(123)
integrate_mc(ff, x_range, n = nn)






