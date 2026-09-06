/-
  Generic lemmas about finite‑dimensional projections and rank.
  Used in the proofs of Theorems A–C.
-/
import Mathlib.LinearAlgebra.FiniteDimensional
import Mathlib.LinearAlgebra.Projection

namespace AQARION

open FiniteDimensional

lemma rank_subspace_restrict {V W : Type*} [AddCommGroup V] [Module ℚ V] [AddCommGroup W] [Module ℚ W]
    (f : V →ₗ[ℚ] W) (U : Subspace ℚ V) [FiniteDimensional ℚ U] :
  finrank ℚ (LinearMap.range (f ∘ₗ U.subtype)) =
    finrank ℚ U - finrank ℚ (LinearMap.ker (f ∘ₗ U.subtype)) :=
by sorry

lemma rank_defect_restrict_eq : -- specific to DΠ
  finrank ℚ (LinearMap.range ((D_Π T).restrict (V_Π X Π))) =
    m - (LinearMap.ker ((D_Π T).restrict (V_Π X Π))).finrank :=
sorry

end AQARION
