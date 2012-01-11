library(SuppDists)

# See Kemp and Kemp (1956) or the Hypergeometric chapter in 'Univariate Discrete
# Distributions' OR One mixed negative binomial distribution with application - 
# Zhaoliang Wang

# The one that seems to be correct using 'Univariate Discrete Distributions'
# 6.2.3

# Figure 1 (left), Wang
x <- 0:15
alpha <- 10
bet <- 5
rs <- c(1, 5, 10)
plot(x, rep(1, length(x)), type = 'n', xlim = c(0, max(x)), ylim = c(0, 0.8),
     ylab = "Probability")
for (r in rs) {
    points(x, dghyper(x, -r, -bet, alpha - 1))
    lines(x, dghyper(x, -r, -bet, alpha - 1))
}

# Figure 1 (right)
x <- 0:15
alphas <- c(10, 20, 50)
bet <- 10
r <- 5
plot(x, rep(1, length(x)), type = 'n', xlim = c(0, max(x)), ylim = c(0, 0.8),
     ylab = "Probability")
for (alph in alphas) {
    points(x, dghyper(x, -r, -bet, alph - 1))
    lines(x, dghyper(x, -r, -bet, alph - 1))
}

# Figure 2, Wang
x <- 0:50
r <- 15
alpha <- 10
bet <- 9
plot(x, rep(1, length(x)), type = 'n', xlim = c(0, max(x)), ylim = c(0, 0.08),
     ylab = "Probability")
points(x, dghyper(x, -r, -bet, alpha - 1))
lines(x, dghyper(x, -r, -bet, alpha - 1))
points(x, dnbinom(x, r, 0.5))
lines(x, dnbinom(x, r, 0.5))

# Verifying the two PDFs are equal.
dbnb <- function(x, r, a, b) {
    (gamma(x + r) * beta(r + a, x + b) ) /
        ( gamma(r) * gamma(x + 1) * beta(a, b) )
}

x <- 0:15
alpha <- 10
bet <- 5
rs <- c(1, 5, 10)
plot(x, rep(1, length(x)), type = 'n', xlim = c(0, max(x)), ylim = c(0, 0.8),
     ylab = "Probability")
for (r in rs) {
    points(x, dbnb(x, r, alpha, bet))
    lines(x, dbnb(x, r, alpha, bet))
}
