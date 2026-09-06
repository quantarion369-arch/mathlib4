import AQARION.Defs

namespace AQARION

open LinearMap

variable {X : Type*} [Fintype X] [DecidableEq X] (T : X → X) (Π : Finset (Set X))
  (hΠ : Π.PairwiseDisjoint id) (hΠ_cover : Π.toFinset = Set.univ)
  (m := Π.card) (n := Fintype.card X)

-- Theorem A
theorem theorem_A_ker_dim :
  LinearMap.ker (D_Π T) ∩ V_Π X Π =
    { f ∈ V_Π X Π | ∀ (B B' : Set X) (hB : B ∈ Π) (hB' : B' ∈ Π),
      (ConnectedComponent H_Π T Π B) = (ConnectedComponent H_Π T Π B') → f B = f B' } :=
sorry

theorem theorem_A_dim_ker : finrank ℚ (LinearMap.ker (D_Π T) ∩ V_Π X Π) =
  (H_Π T Π).connectedComponents.card := sorry

theorem theorem_A_rank : finrank ℚ (LinearMap.range ((D_Π T).restrict (V_Π X Π))) =
  m - (H_Π T Π).connectedComponents.card := sorry

-- Theorem B
theorem theorem_B_cycle_rank_identity :
  let E := (I_Π T Π).edgeFinset.card
  let m := Π.card
  let c := (I_Π T Π).connectedComponents.card
  let β₁ := E - (2 * m) + c
  (Σ B ∈ Π, ((R_i T Π B).card - 1)) - finrank ℚ (LinearMap.range ((D_Π T).restrict (V_Π X Π))) =
    β₁ :=
sorry

-- Theorem C
theorem theorem_C_sharp_bound :
  finrank ℚ (LinearMap.range ((D_Π T).restrict (V_Π X Π))) ≤
    Nat.min (m - 1) (n - m) :=
sorry

theorem theorem_C_sharpness :
  ∃ T' : X → X, ∃ Π' : Finset (Set X), -- construct with alternating path
    finrank ℚ (LinearMap.range ((D_Π' T').restrict (V_Π' X Π'))) =
      Nat.floor ((n - 1) / 2) :=
sorry

end AQARION
