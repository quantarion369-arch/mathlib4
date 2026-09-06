/-
  Bridge to Mathlib's graph theory.
  Provides definitions for:
    - connected components of a simple graph
    - cycle rank (β₁ = |E| - |V| + c)
    - incidence graph construction
-/
import Mathlib.Combinatorics.SimpleGraph.Basic
import Mathlib.Combinatorics.SimpleGraph.Connectivity
import Mathlib.Combinatorics.SimpleGraph.Incidence

namespace AQARION

open SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V]

-- Export relevant definitions
abbrev Components (G : SimpleGraph V) := G.ConnectedComponents

def cycleRank (G : SimpleGraph V) : ℕ :=
  G.edgeFinset.card - G.vertexFinset.card + G.connectedComponents.card

end AQARION
