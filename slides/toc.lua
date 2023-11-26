#!/usr/bin/env lua

local all={}
local d={}
local i=0

i=i+1
all[i] = {}
all[i]['Number']= 1
all[i]['Name'] = 'Introduction to Derivatives'
all[i]['Sections'] = {}
all[i]['Sections'][1] = 'What is a derivative?'
all[i]['Sections'][2] = 'An overview of financial markets'
all[i]['Sections'][3] = 'The use of derivatives'
all[i]['Sections'][4] = 'Buying and short-selling financial assets'
all[i]['Sections'][5] = 'Problems'

i=i+1
all[i] = {}
all[i]['Number']= 2
all[i]['Name'] = 'An Introduction to Forwards and Options'
all[i]['Sections'] = {}
all[i]['Sections'][1] = 'Forward contracts'
all[i]['Sections'][2] = 'Call options'
all[i]['Sections'][3] = 'Put options'
all[i]['Sections'][4] = 'Options are insurance'
all[i]['Sections'][5] = 'Summary of forward and option positions'
all[i]['Sections'][6] = 'Problems'

i=i+1
all[i] = {}
all[i]['Number']= 3
all[i]['Name'] = 'Insurance, Collars, and Other Strategies'
all[i]['Sections'] = {}
all[i]['Sections'][1] = 'Basic insurance strategies'
all[i]['Sections'][2] = 'Put-call parity'
all[i]['Sections'][3] = 'Spreads and collars'
all[i]['Sections'][4] = 'Speculating on volatility'
all[i]['Sections'][5] = 'Problems'

i=i+1
all[i] = {}
all[i]['Number']= 5
all[i]['Name'] = 'Financial Forwards and Futures'
all[i]['Sections'] = {}
all[i]['Sections'][1] = 'Alternative ways to buy a stock'
all[i]['Sections'][2] = 'Prepaid forward contracts on stock'
all[i]['Sections'][3] = 'Forward contracts on stock'
all[i]['Sections'][4] = 'Futures contracts'
all[i]['Sections'][5] = 'Problems'

i=i+1
all[i] = {}
all[i]['Number']= 9
all[i]['Name'] = 'Parity and other option relationships'
all[i]['Sections'] = {}
all[i]['Sections'][1] = 'Put-call parity'
all[i]['Sections'][2] = 'Generalized parity and exchange options'
all[i]['Sections'][3] = 'Comparing options with respect to style, maturity, and strike'
all[i]['Sections'][4] = 'Problems'

i=i+1
all[i] = {}
all[i]['Number']= 10
all[i]['Name'] = 'Binomial Option Pricing: Basic Concepts'
all[i]['Sections'] = {}
all[i]['Sections'][1] = 'A one-period Binomial tree'
all[i]['Sections'][2] = 'Constructing a Binomial tree'
all[i]['Sections'][3] = 'Two or more binomial periods'
all[i]['Sections'][4] = 'Put options'
all[i]['Sections'][5] = 'American options'
all[i]['Sections'][6] = 'Options on other assets'
all[i]['Sections'][7] = 'Problems'

i=i+1
all[i] = {}
all[i]['Number']= 11
all[i]['Name'] = 'Binomial Option Pricing: Selected Topics'
all[i]['Sections'] = {}
all[i]['Sections'][1] = 'Understanding Early Exercise'
all[i]['Sections'][2] = 'Understanding risk-neutral pricing'
all[i]['Sections'][3] = 'The Binomial tree and lognormality'
all[i]['Sections'][4] = 'Problems'

i=i+1
all[i] = {}
all[i]['Number']= 12
all[i]['Name'] = 'The Black-Scholes Formula'
all[i]['Sections'] = {}
all[i]['Sections'][1] = 'Introduction to the Black-Scholes formula'
all[i]['Sections'][2] = 'Applying the formula to other assets'
all[i]['Sections'][3] = 'Option Greeks'
all[i]['Sections'][4] = 'A. The standard normal distribution'
all[i]['Sections'][5] = 'B. Formulas for option Greeks'
all[i]['Sections'][6] = 'Problems'

i=i+1
all[i] = {}
all[i]['Number']= 13
all[i]['Name'] = 'Market-Making and Delta-Hedging'
all[i]['Sections'] = {}
all[i]['Sections'][1] = 'What do market-makers do?'
all[i]['Sections'][2] = 'Market-maker risk'
all[i]['Sections'][3] = 'Delta-Hedging'
all[i]['Sections'][4] = 'The mathematics of Delta-hedging'
all[i]['Sections'][5] = 'The Black-Scholes analysis'
all[i]['Sections'][6] = 'Market-Making as insurance'
all[i]['Sections'][7] = 'Problems'

i=i+1
all[i] = {}
all[i]['Number']= 14
all[i]['Name'] = 'Exotic Options: I'
all[i]['Sections'] = {}
all[i]['Sections'][1] = 'Introduction'
all[i]['Sections'][2] = 'Asian options'
all[i]['Sections'][3] = 'Barrier options'
all[i]['Sections'][4] = 'Compound options'
all[i]['Sections'][5] = 'Gap options'
all[i]['Sections'][6] = 'Exchange options'
all[i]['Sections'][7] = 'Problems'

i=i+1
all[i] = {}
all[i]['Number']= 18
all[i]['Name'] = 'The Lognormal Distribution'
all[i]['Sections'] = {}
all[i]['Sections'][1] = 'The normal distribution'
all[i]['Sections'][2] = 'The lognormal distribution'
all[i]['Sections'][3] = 'A lognormal model of stock prices'
all[i]['Sections'][4] = 'Lognormal probability calculations'
all[i]['Sections'][5] = 'A. The expectation of a lognormal variable'
all[i]['Sections'][6] = 'B. Constructing a normal probability'
all[i]['Sections'][7] = 'Problems'

i=i+1
all[i] = {}
all[i]['Number']= 19
all[i]['Name'] = 'Monte Carlo Valuation'
all[i]['Sections'] = {}
all[i]['Sections'][1] = 'Computing the option price as a discounted expected value'
all[i]['Sections'][2] = 'Computing random numbers'
all[i]['Sections'][3] = 'Simulating lognormal stock prices'
all[i]['Sections'][4] = 'Monte Carlo valuation'
all[i]['Sections'][5] = 'Efficient Monte Carlo valuation'
all[i]['Sections'][6] = 'Valuation of American options'
all[i]['Sections'][7] = 'The Poisson distribution'
all[i]['Sections'][8] = 'Simulating jumps with the Poisson distribution'
all[i]['Sections'][9] = 'Simulating correlated stock prices'
all[i]['Sections'][10] = 'Problems'

i=i+1
all[i] = {}
all[i]['Number']= 20
all[i]['Name'] = 'Brownian Motion and Ito Lemma'
all[i]['Sections'] = {}
all[i]['Sections'][1] = 'The Black-Scholes assumption about stock prices'
all[i]['Sections'][2] = 'Brownian motion'
all[i]['Sections'][3] = 'Geometric Brownian motion'
all[i]['Sections'][4] = 'The Ito formula'
all[i]['Sections'][5] = 'The Sharpe ratio'
all[i]['Sections'][6] = 'Risk-neutral valuation'
all[i]['Sections'][7] = 'Problems'


loadfile("./saveTable.lua")(all,"toc.table")

