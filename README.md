# Factorio Recipe Graph

The generated graph is here: [PNG](https://raw.githubusercontent.com/wuyongzheng/factorio-recipe-graph/master/recipe-graph.png) or [SVG](https://github.com/wuyongzheng/factorio-recipe-graph/blob/master/recipe-graph.svg).

To reproduce the graph:

1. `lua parse-recipe.lua > recipe.csv`
1. `gawk -f csv2dot.awk recipe.csv > recipe-graph.dot`
1. Either
   `dot -Tpng recipe-graph.dot > recipe-graph.png`
   or
   `dot -Tsvg recipe-graph.dot > recipe-graph.svg`
