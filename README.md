# SAT-Maude

SAT-Maude is a program written entirely in Maude to study and compare 
different techniques and heuristics in modern SAT solvers.

This project contains 6 different strategies:

1. Classic DPLL 

2. Modern DPLL

3. Watch literal DPLL

4. Watch literal DPLL with JW heuristic

5. Watch literal DPLL with VSIDS heuristic

6. Berkmin Solver

More details in how these strategies work will be included in a near future.

## Installation

### 1. Download Core Maude 3.0

Download the source code from [Maude official site](http://maude.cs.illinois.edu/w/index.php/Maude_download_and_installation)

Aditional requirements may be needed to run Maude.

## Run examples

To execute SAT-Maude, run the following command inside the folder *code*:

1. Run an example from *examples* folder using Maude:
```
Maude-executable < ../examples/example.txt
```

For instance, if Maude executable is found in `../../Maude-3.0+yices2-linux/maude-Yices2.linux64` and
we want to execute example `../examples/vsids-unsat.txt`, then we use the following command:

```
../../Maude-3.0+yices2-linux/maude-Yices2.linux64 < ../examples/vsids-unsat.txt 
```

## Generate Maude instances

You can generate your own instances to analyze in Maude using executable file in
*parser* folder. These instances must follow [DIMACS CNF format](https://www.domagoj-babic.com/uploads/ResearchProjects/Spear/dimacs-cnf.pdf).

This executable must be called with three arguments: file that contains
the strategy, module that contains strategy call and name of strategy call. There are
six different possibilities for these arguments:

1. *Classic DPLL system*: classic-dpll-strat CLASSIC-DPLL-STRATEGY classic-dpll-strat

2. *Basic DPLL system with learning*: basic-dpll-strat BASIC-DPLL-STRATEGY basic-dpll-strat

3. *Watch literal DPLL system*: watch-literal-dpll-strat WATCH-LITERAL-DPLL-STRATEGY watch-literal-dpll-strat

4. *Watch literal DPLL system with JW heuristic*: jw-heuristic-strat JW-HEURISTIC-STRATEGY jw-heuristic-strat

5. *Watch literal DPLL system with VSIDS heuristic*: vsids-heuristic-strat VSIDS-HEURISTIC-STRATEGY vsids-heuristic-strat

6. *Berkmin Solver*: berkmin-strat BERKMIN-STRATEGY berkmin-strat

For instance, if we want to generate the Maude file `../examples/berkmin-20-01.txt` from instance 
`../instances/sat/uf20-01.cnf`
using *Berkmin Solver* strategy, we use the following command in folder *tools*:

``` 
./parser berkmin-strat BERKMIN-STRATEGY berkmin-strat < ../instances/sat/uf20-01.cnf > ../examples/berkmin-20-01.txt
```

Instances in *instances* folder represent 3-SAT random formulas that have been taken directly from [SATLIB](https://www.cs.ubc.ca/~hoos/SATLIB/benchm.html).

## Scripts

A script has been included to analyze all files in a folder using the same strategy and store the
results in another folder. This script has been included in folder *scripts* and it needs Maude path and the
path of folder where results are stored.