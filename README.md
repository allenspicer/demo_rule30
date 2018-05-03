# demo_rule30
A demonstration of the elementary cellular automaton rule known as "rule 30"

Rule 30 is a set of rules used to describe the behavior of cellular automata and postulated by Stephen Wolfram to explain how a simple set of rules create random behavior in nature. 

This application shows black and white cells, building a grid in a seemingly random pattern. The app displays a grid of cells in one of two states: true (black) or false (white). The grid begins with a row of cells which are false (white) except for one true cell (black) in the middle. 

Each row after the first is generated with the set of instructions provided by Rule 30 which take in the previous row and return the boolean value of each new cell. 

Two sets of data are used in the model. The model data (modelDataDictionary) allows us to calculate the values of a large grid of cells. The display data (displayDataDictionary) allows us to display a central portion of these cells. This removes interference from the edges of the view and displays the central randomized cells.


This application is built for iOS using Swift 4 and Xcode 9.3

Sources: 

https://en.wikipedia.org/wiki/Rule_30

https://en.wikipedia.org/wiki/Cellular_automaton

https://en.wikipedia.org/wiki/Stephen_Wolfram

