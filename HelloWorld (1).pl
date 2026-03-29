:- initialization(main).
% Tell the compiler to run the 'main' rule automatically when loaded.
:- initialization(main).

% ==========================================
% FACTS: The Knowledge Base
% ==========================================

% Base prices based on location
base_price(downtown, 500000).
base_price(suburbs,  350000).
base_price(rural,    200000).

% Multipliers based on house size
size_factor(small,  0.8).  
size_factor(medium, 1.0).  
size_factor(large,  1.4).  
size_factor(mansion, 2.5). 

% Multipliers based on house condition
condition_factor(needs_work, 0.7).
condition_factor(good,       1.0).
condition_factor(renovated,  1.3).

% Multipliers based on market trend
market_trend(buyer_market,  0.9).
market_trend(neutral,       1.0).
market_trend(seller_market, 1.15).

% ==========================================
% RULES: The Logic Engine
% ==========================================

% The core rule to estimate the price.
estimate_price(Location, Size, Condition, Market, FinalPrice) :-
    base_price(Location, Base),
    size_factor(Size, SizeMult),
    condition_factor(Condition, CondMult),
    market_trend(Market, MarketMult),
    FinalPrice is Base * SizeMult * CondMult * MarketMult.

% ==========================================
% INITIALIZATION: The starting point
% ==========================================

main :-
    write('--- House Price Prediction Expert System ---'), nl,
    write('Running an automated test case...'), nl,
    nl,
    write('House Profile:'), nl,
    write('- Location: Suburbs'), nl,
    write('- Size: Large'), nl,
    write('- Condition: Renovated'), nl,
    write('- Market: Seller Market'), nl,
    nl,
    
    % Run the prediction with hardcoded values to guarantee output
    estimate_price(suburbs, large, renovated, seller_market, Price),
    
    write('===================================='), nl,
    write('Predicted House Price: $'), write(Price), nl,
    write('===================================='), nl,
    
    % Halt stops the compiler from hanging indefinitely (useful for online IDEs)
    halt.