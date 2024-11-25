library(DiagrammeR)
library(DiagrammeRsvg)

diagram_1 <- grViz("
digraph process {
  rankdir=LR;
  node [shape=box, style=filled, fillcolor=lightblue, fontname=Helvetica];
  
  Step1 [label='Variables'];
  Step2 [label='Calculo'];
  Step3 [label='Resultados'];

  Step1 -> Step2 -> Step3;
}
")

DiagrammeRsvg::export_svg(diagram_1) %>%
  charToRaw() %>%
  rsvg::rsvg_svg("process_diagram_1.svg")


diagram_2 <- grViz("
digraph process {
  rankdir=LR;
  node [shape=box, style=filled, fillcolor=white, fontname=Helvetica];
  
  Var1 [label='N = 10'];
  Var2 [label='Ecuación'];
  Var3 [label='X = 12,5'];

  Var1 -> Var2 -> Var3;

}
")

DiagrammeRsvg::export_svg(diagram_2) %>%
  charToRaw() %>%
  rsvg::rsvg_svg("process_diagram_2.svg")



diagram_3 <- grViz("
digraph process {
  rankdir=LR;
  node [shape=box, style=filled, fillcolor=yellow, fontname=Helvetica];
  
  Var1 [label='N = rnorm(100)'];
  Var2 [label='Ecuación'];
  Var3 [label='hist(X)'];

  Var1 -> Var2 -> Var3;

}
")

DiagrammeRsvg::export_svg(diagram_3) %>%
  charToRaw() %>%
  rsvg::rsvg_svg("process_diagram_3.svg")

