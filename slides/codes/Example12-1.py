#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
    codes.Example12-1
    ~~~~~~~~~~~~~~~~~

    For Examples 12.1 and 12.2. Moreover, it compares results from Binomial trees.

    :copyright: (c) 2021 by Le Chen (chenle02@gamil.com).
    :license: LICENSE_NAME, see LICENSE for more details.
    :created at Tue 12 Oct 2021 12:49:51 PM CDT
"""

import numpy as np
from scipy.stats import norm


def BS(S, K, sigma, r, T, delta):
    # {{{ Application of the Black-Scholes formula
    d1 = (np.log(S/K)+(r-delta+pow(sigma, 2)/2)*T)/(sigma * np.sqrt(T))
    d2 = d1 - sigma * np.sqrt(T)
    BS_Call = S * np.exp(-delta * T) * norm.cdf(d1) - K * np.exp(-r * T) * norm.cdf(d2)
    BS_Put = K * np.exp(- r * T) * norm.cdf(-d2) - S * np.exp(-delta * T) * norm.cdf(-d1)
    return(BS_Call, BS_Put)
    # }}}


def BinomialTree(S, K, sigma, r, T, delta, n):
    # Construct the tree{{{
    h = 1/n
    u = np.exp((r-delta) * T * h + sigma * np.sqrt(h * T))
    d = np.exp((r-delta) * T * h - sigma * np.sqrt(h * T))
    StockTree = np.zeros((n+1, n+1))
    StockTree[0][0] = S
    for i in range(n+1):
        for j in range(n+1-i):
            StockTree[i][i+j] = S * pow(u, j) * pow(d, i)
    # }}}
    # EuropeanCall {{{
    EuropeanCall = np.zeros((n+1, n+1))
    for i in range(n+1):
        EuropeanCall[i][n] = max(StockTree[i][n]-K, 0)
    for j in range(n-1, -1, -1):
        for i in range(j+1):
            Delta = np.exp(-delta*h*T) * (EuropeanCall[i][j+1] - EuropeanCall[i+1][j+1])/(StockTree[i][j+1] - StockTree[i+1][j+1])
            B = np.exp(-r*h*T) * (u * EuropeanCall[i+1][j+1] - d * EuropeanCall[i][j+1])/(u - d)
            EuropeanCall[i][j] = Delta * StockTree[i][j] + B
    # }}}
    # EuropeanPut {{{
    EuropeanPut = np.zeros((n+1, n+1))
    for i in range(n+1):
        EuropeanPut[i][n] = max(K - StockTree[i][n], 0)
    for j in range(n-1, -1, -1):
        for i in range(j+1):
            Delta = np.exp(-delta*h*T) * (EuropeanPut[i][j+1] - EuropeanPut[i+1][j+1])/(StockTree[i][j+1] - StockTree[i+1][j+1])
            B = np.exp(-r*h*T) * (u * EuropeanPut[i+1][j+1] - d * EuropeanPut[i][j+1])/(u - d)
            EuropeanPut[i][j] = Delta * StockTree[i][j] + B
    # }}}
    # American Call {{{
    AmericanCall = np.zeros((n+1, n+1))
    for i in range(n+1):
        AmericanCall[i][n] = max(StockTree[i][n]-K, 0)
    for j in range(n-1, -1, -1):
        for i in range(j+1):
            Delta = np.exp(-delta*h*T) * (AmericanCall[i][j+1] - AmericanCall[i+1][j+1])/(StockTree[i][j+1] - StockTree[i+1][j+1])
            B = np.exp(-r*h*T) * (u * AmericanCall[i+1][j+1] - d * AmericanCall[i][j+1])/(u - d)
            AmericanCall[i][j] = max(Delta * StockTree[i][j] + B, StockTree[i][j]-K)
    # }}}
    # American Put {{{
    AmericanPut = np.zeros((n+1, n+1))
    for i in range(n+1):
        AmericanPut[i][n] = max(K - StockTree[i][n], 0)
    for j in range(n-1, -1, -1):
        for i in range(j+1):
            Delta = np.exp(-delta*h*T) * (AmericanPut[i][j+1] - AmericanPut[i+1][j+1])/(StockTree[i][j+1] - StockTree[i+1][j+1])
            B = np.exp(-r*h*T) * (u * AmericanPut[i+1][j+1] - d * AmericanPut[i][j+1])/(u - d)
            AmericanPut[i][j] = max(Delta * StockTree[i][j] + B, K-StockTree[i][j])
    # }}}
    # Return the results{{{
    return(EuropeanCall[0][0], EuropeanPut[0][0], AmericanCall[0][0], AmericanPut[0][0])
    # }}}


def PrintSetup(S, K, sigma, r, T, delta):
    # Print the setup {{{
    print("")
    print("Problem setup:")
    print("Strike price K = {:}".format(K))
    print("Stock price S = {:}".format(S))
    print("Interest rate r = {:0.3f}".format(r))
    print("Expiration date T = {:0.2f}".format(T))
    print("Volatility sigma = {:0.2f}".format(sigma))
    print("")
    # }}}


def main():
    # Input the parameters{{{
    S = 41
    K = 40
    sigma = 0.30
    r = 0.08
    T = 0.25
    delta = 0.00
    # }}}
    PrintSetup(S, K, sigma, r, T, delta)
    # First show Black-Scholes results{{{
    BS_Call, BS_Put = BS(S, K, sigma, r, T, delta)
    print("Option prices for call and put computed by Black-Scholes model for Examples 12.1 and 12.2 are equal to")
    print("{:4.4f} and {:4.4f}, respectively.".format(BS_Call, BS_Put))
    # }}}
    # Secondly, show the Binomial tree:{{{
    for i in [1, 5, 10, 200, 1000]:
        Binomial = BinomialTree(S, K, sigma, r, T, delta, i)
        print("Binomial tree with {:} steps, European Call = {:4.4f} and European put = {:4.4f}".format(i, Binomial[0], Binomial[1]))
    # }}}


if __name__ == "__main__":
    main()
