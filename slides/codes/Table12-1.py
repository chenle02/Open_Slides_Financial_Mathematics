#!/usr/bin/env python3
"""
    codes.Table12-1.py
    ~~~~~~~~~~~~~~~

    DESCRIPTION
    This is for Table 12.1 (ref. Figure 10.3).
    Input: None
    Output: European Call Option Premium.

    :copyright: (c) 2021 by Le Chen (chenle02@gamil.com).
    :license: LICENSE_NAME, see LICENSE for more details.
    :created at Tue 12 Oct 2021 12:18:13 PM CDT
"""
import numpy as np

# Load parameters {{{
S = 41
K = 40
r = 0.08
delta = 0.00
sigma = 0.30
T = 1
# }}}

for n in [1, 4, 10, 50, 100, 500, 1000, 3000]:
    h = 1/n
    u = np.exp((r-delta) * h + sigma * np.sqrt(h))
    d = np.exp((r-delta) * h - sigma * np.sqrt(h))
    # Construct the tree{{{
    StockTree = np.zeros((n+1, n+1))
    StockTree[0][0] = S
    for i in range(n+1):
        for j in range(n+1-i):
            StockTree[i][i+j] = S * pow(u, j) * pow(d, i)
    # }}}
    # First comput the end leaves{{{
    EuropeanCall = np.zeros((n+1, n+1))
    for i in range(n+1):
        EuropeanCall[i][n] = max(StockTree[i][n]-K, 0)
    # }}}
    # Now compute the inner leaves{{{
    for j in range(n-1, -1, -1):
        for i in range(j+1):
            # EuropeanCall[i][j] = j
            Delta = np.exp(-delta*h) * (EuropeanCall[i][j+1] - EuropeanCall[i+1][j+1])/(StockTree[i][j+1] - StockTree[i+1][j+1])
            B = np.exp(-r*h) * (u * EuropeanCall[i+1][j+1] - d * EuropeanCall[i][j+1])/(u - d)
            EuropeanCall[i][j] = Delta * StockTree[i][j] + B
    # }}}
    print("Number of iterations: {:}, and option price is {:4.4f}".format(n, EuropeanCall[0][0]))
