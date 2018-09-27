# Factorio Recipe Graph

The generated graph is here: [PNG](https://raw.githubusercontent.com/wuyongzheng/factorio-recipe-graph/master/recipe-graph.png) or [SVG](https://github.com/wuyongzheng/factorio-recipe-graph/blob/master/recipe-graph.svg).

To clean the graph from too many edges, common ingredients such as
iron-gear-wheel and advanced-circuit is abbreviated as G and C2 in product
names instead of represent them using edges.
As you have probably already figured out, fluid nodes are in dashed line ovals,
while other items are in solid line ovals.
Some items, such as light-oil and uranium-238, can be created through more than
one process.
All the processes are in the graph.

To reproduce the graph:

1. `lua parse-recipe.lua > recipe.csv`
1. `gawk -f csv2dot.awk recipe.csv > recipe-graph.dot`
1. Either
   `dot -Tpng recipe-graph.dot > recipe-graph.png`
   or
   `dot -Tsvg recipe-graph.dot > recipe-graph.svg`
