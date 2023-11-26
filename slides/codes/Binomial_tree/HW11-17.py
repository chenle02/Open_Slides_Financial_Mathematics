#!/usr/bin/env python3
"""
    Binomial_tree.HW11-17
    ~~~~~~~~~~~~~~~~~~~~~

    This is for Homework 11.17.
    Input: parameters.csv
    Tree: Lognomal tree.
    Output:
        StockTree.csv
        EuropeanCall.csv
        EuropeanPut.csv
        AmericanCall.csv
        AmericanPut.csv


    :copyright: (c) 2021 by Le Chen (chenle02@gamil.com).
    :license: MIT, see MIT-LICENSE for more details.
    :created at Thu 07 Oct 2021 10:04:31 AM CDT
"""

import csv
import numpy as np

# Load parameters from the parameters.csv file{{{
Parameters = {}
with open('./parameters.csv', newline='') as csvfile:
    spamreader = csv.DictReader(csvfile, delimiter=',')
    print(spamreader)
    for row in spamreader:
        print(row['Name'], row['Value'])
        Parameters[row['Abbreviation']] = float(row['Value'])

# print(Parameters)
S = Parameters['S']
K = Parameters['K']
r = Parameters['r']
delta = Parameters['delta']
sigma = Parameters['sigma']
T = Parameters['T']
n = int(Parameters['n'])
h = 1/n

u = np.exp((r-delta-0.5*pow(sigma, 2)) * h + sigma * np.sqrt(h))
d = np.exp((r-delta-0.5*pow(sigma, 2)) * h - sigma * np.sqrt(h))
# print(u)
# print(d)
# }}}
# Construct the tree{{{
StockTree = np.zeros((n+1, n+1))
StockTree[0][0] = S
for i in range(n+1):
    for j in range(n+1-i):
        StockTree[i][i+j] = S * pow(u, j) * pow(d, i)

np.savetxt("StockTree.csv", StockTree, delimiter=",")
# }}}
# Compute the European Call{{{
EuropeanCall = np.zeros((n+1, n+1))
# First comput the end leaves
for i in range(n+1):
    EuropeanCall[i][n] = max(StockTree[i][n]-K, 0)

# Now compute the inner leaves
for j in range(n-1, -1, -1):
    for i in range(j+1):
        # EuropeanCall[i][j] = j
        Delta = np.exp(-delta*h) * (EuropeanCall[i][j+1] - EuropeanCall[i+1][j+1])/(StockTree[i][j+1] - StockTree[i+1][j+1])
        # print(Delta)
        B = np.exp(-r*h) * (u * EuropeanCall[i+1][j+1] - d * EuropeanCall[i][j+1])/(u - d)
        EuropeanCall[i][j] = Delta * StockTree[i][j] + B

np.savetxt("EuropeanCall.csv", EuropeanCall, delimiter=",")
# }}}
# Compute the European Put{{{
EuropeanPut = np.zeros((n+1, n+1))
# First comput the end leaves
for i in range(n+1):
    EuropeanPut[i][n] = max(K - StockTree[i][n], 0)

# Now compute the inner leaves
for j in range(n-1, -1, -1):
    for i in range(j+1):
        # EuropeanPut[i][j] = j
        Delta = np.exp(-delta*h) * (EuropeanPut[i][j+1] - EuropeanPut[i+1][j+1])/(StockTree[i][j+1] - StockTree[i+1][j+1])
        # print(Delta)
        B = np.exp(-r*h) * (u * EuropeanPut[i+1][j+1] - d * EuropeanPut[i][j+1])/(u - d)
        EuropeanPut[i][j] = Delta * StockTree[i][j] + B

np.savetxt("EuropeanPut.csv", EuropeanPut, delimiter=",")
# }}}
# Compute the American Call {{{
AmericanCall = np.zeros((n+1, n+1))
# First comput the end leaves
for i in range(n+1):
    AmericanCall[i][n] = max(StockTree[i][n]-K, 0)

# Now compute the inner leaves
for j in range(n-1, -1, -1):
    for i in range(j+1):
        # AmericanCall[i][j] = j
        Delta = np.exp(-delta*h) * (AmericanCall[i][j+1] - AmericanCall[i+1][j+1])/(StockTree[i][j+1] - StockTree[i+1][j+1])
        # print(Delta)
        B = np.exp(-r*h) * (u * AmericanCall[i+1][j+1] - d * AmericanCall[i][j+1])/(u - d)
        AmericanCall[i][j] = max(Delta * StockTree[i][j] + B, StockTree[i][j]-K)

np.savetxt("AmericanCall.csv", AmericanCall, delimiter=",")
# }}}
# Compute the American Put{{{
AmericanPut = np.zeros((n+1, n+1))
# First comput the end leaves
for i in range(n+1):
    AmericanPut[i][n] = max(K - StockTree[i][n], 0)

# Now compute the inner leaves
for j in range(n-1, -1, -1):
    for i in range(j+1):
        # AmericanPut[i][j] = j
        Delta = np.exp(-delta*h) * (AmericanPut[i][j+1] - AmericanPut[i+1][j+1])/(StockTree[i][j+1] - StockTree[i+1][j+1])
        # print(Delta)
        B = np.exp(-r*h) * (u * AmericanPut[i+1][j+1] - d * AmericanPut[i][j+1])/(u - d)
        AmericanPut[i][j] = max(Delta * StockTree[i][j] + B, K-StockTree[i][j])

np.savetxt("AmericanPut.csv", AmericanPut, delimiter=",")
# }}}
