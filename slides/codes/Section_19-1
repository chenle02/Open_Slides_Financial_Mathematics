#!/usr/bin/env python3
# By Le Chen
# chenle02@gmail.com / le.chen@auburn.edu
"""
    codes.Section_19-1
    ~~~~~~~~~~~~~~~~~~

    DESCRIPTION
    This is to use the simulation to compute the European Call via Binomial tree.

    :copyright: (c) 2021 by Le Chen (chenle02@gamil.com).
    :license: Creative Commons Licence, see LICENSE for more details.
    :created at Tue 19 Oct 2021 02:58:13 PM CDT
"""

import numpy as np

def main():# {{{
    n = 3
    T = 1
    sigma = 0.30
    delta = 0.00
    r = 0.08
    h = 1/3
    Payoff = [34.678, 12.814, 0, 0]
    # Compute risk-neutral probability
    u = np.exp((r-delta)*h + sigma * np.sqrt(h))
    d = np.exp((r-delta)*h - sigma * np.sqrt(h))
    p = (np.exp((r-delta)*h)-d)/(u-d)
    print("Risk-neutral probability is equal to {:4.6f}".format(p))
    # Compute the option price from the formula
    FormulaValue = np.exp(-r*T)*(Payoff[0]*pow(p, 3)+Payoff[1]*3*p*p*(1-p))
    print("Formula gives the option price: {:4.6f}".format(FormulaValue))
    # Now simulation
    NumSample = 1000
    Sample = np.random.binomial(n, 1 - p, NumSample)
    for i in range(4):
        count = (Sample == i).sum()
        print("Bin number {:} contributes {:4.4%}".format(i+1, count/NumSample))
    # print(Sample)
    OptionCall = np.exp(-r*T) * sum(Payoff[i] for i in Sample) / NumSample
    print("Simulation with {:} samples gives the option price: {:4.6f}".format(NumSample, OptionCall))
    # }}}

if __name__ == "__main__":
    main()
