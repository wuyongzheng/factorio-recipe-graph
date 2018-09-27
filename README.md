# Factorio Recipe Graph

The generated graph is here: PNG or SVG.

To reproduce the graph:

1. lua parse-recipe.lua > recipe.csv
1. gawk -f csv2dot.awk recipe.csv > recipe-graph.dot
1. Either
   dot -Tpng recipe-graph.dot > recipe-graph.png
   or
   dot -Tsvg recipe-graph.dot > recipe-graph.svg
