import Mathlib.Combinatorics.SimpleGraph.Basic
import Mathlib.Combinatorics.SimpleGraph.Connectivity
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.Data.Fintype.Basic
import Mathlib.Data.Finset.Basic

namespace AQARION

variable {X : Type*} [Fintype X] [DecidableEq X]

/-- A partition of a finite set as a function to block indices. -/
structure Partition (X : Type*) [Fintype X] where
  numBlocks : ℕ
  blockOf   : X → Fin numBlocks
  -- surjectivity can be added later if needed

/-- Block-constant functions (V_Π). -/
def V_Pi (Π : Partition X) : Submodule ℝ (X → ℝ) :=
  { carrier := {f | ∀ x y, Π.blockOf x = Π.blockOf y → f x = f y}
    zero_mem' := by simp
    add_mem' := by intro f g hf hg x y h; simp [hf x y h, hg x y h]
    smul_mem' := by intro r f hf x y h; simp [hf x y h] }

/-- Koopman operator (composition with T). -/
def K (T : X → X) : (X → ℝ) →ₗ[ℝ] (X → ℝ) :=
  { toFun := fun f x => f (T x)
    map_add' := by intros; ext; rfl
    map_smul' := by intros; ext; rfl }

/-- Defect operator D_Π = (I - P_Π) K P_Π (definitional form). -/
-- Concrete matrix realisation left for later; the abstract form is sufficient for the kernel theorem.

/-- Right-side co-occurrence graph on blocks. -/
def cooccurrenceGraph (Π : Partition X) (T : X → X) : SimpleGraph (Fin Π.numBlocks) :=
  { Adj := fun j k =>
      j ≠ k ∧ ∃ i : Fin Π.numBlocks,
        (∃ x, Π.blockOf x = i ∧ Π.blockOf (T x) = j) ∧
        (∃ y, Π.blockOf y = i ∧ Π.blockOf (T y) = k)
    symm := by
      intro j k ⟨hne, i, hx, hy⟩
      exact ⟨hne.symm, i, hy, hx⟩
    loopless := by
      intro j ⟨hne, _⟩
      exact hne rfl }

/-- Connected components of the right co-occurrence graph. -/
abbrev RightComponents (Π : Partition X) (T : X → X) :=
  (cooccurrenceGraph Π T).ConnectedComponent

/-- Functions constant on right components (ConstRightComp). -/
def ConstRightComp (Π : Partition X) (T : X → X) : Submodule ℝ (X → ℝ) :=
  { carrier := {f |
      f ∈ V_Pi Π ∧
      ∀ (j k : Fin Π.numBlocks),
        (cooccurrenceGraph Π T).Reachable j k →
        ∀ x y, Π.blockOf x = j → Π.blockOf y = k → f x = f y}
    zero_mem' := by
      refine ⟨by simp [V_Pi], ?_⟩
      intros; simp
    add_mem' := by
      intro f g hf hg
      refine ⟨add_mem hf.1 hg.1, ?_⟩
      intros j k hr x y hx hy
      exact congr_arg₂ (· + ·) (hf.2 j k hr x y hx hy) (hg.2 j k hr x y hx hy)
    smul_mem' := by
      intro r f hf
      refine ⟨smul_mem _ _ hf.1, ?_⟩
      intros j k hr x y hx hy
      simp [hf.2 j k hr x y hx hy] }

end AQARION
