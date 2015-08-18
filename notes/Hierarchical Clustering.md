# Hierarchical Cluster
--------------------------------------------
visualize high demensional large data

* agglomerative approach
  1. find closest two thing
  2. put them together
  3. find next closest

* Distance or Similarity
  1. continuous: euclidean distance
  2. continuous: correlation similarity
  3. binary: manhattan distance: |A1-A2|+|B1-B2|+...+|Z1-Z2|, base on grid
* how to merg pts
  1. merge approach
  2. linkage/average 

* R
  1. hclust: default=euclidean
  2. prettier dendrograms(on course web)
  3. heatmap: visualize large data : run hierarchical cluster on row and col of table
