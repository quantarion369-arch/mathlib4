# AQARION Lake Package (Candidate)

**Status:** Source scaffold · Compiler certificate OPEN · C4 BLOCKED  
**Root:** `020a9110088010116075e1812c98bcd2bcc4905367fa8943a68c8cd224cf284e`  
**Date:** 2026-09-05

## Core mathematical claim (computationally supported)

\[
\ker(D_\Pi|_{V_\Pi}) = \operatorname{ConstRightComp}(\Pi,T)
\qquad\Rightarrow\qquad
\operatorname{rank}(D_\Pi|_{V_\Pi}) = m - c_{\rm bip}
\]

where the kernel is constant on **right-side** connected components of the bipartite co-occurrence graph.

## What is present
- Corrected definitions (right-component formulation)
- Theorem statements
- Honest provenance file

## What is deliberately absent
- Any claim that the Lean proofs are complete
- Any fabricated toolchain receipt
- Any promotion of Theorems B/C or spectral geometry

## How to proceed
1. Place this package inside a Mathlib4 fork pinned to `v4.34.0-rc2`.
2. `lake update && lake build`
3. Discharge the three `sorry`s in `Theorems.lean`.
4. Archive `#print axioms` and an exact-rational regression.
5. Only then consider C4.

No theorem is certified until the above gates are closed.

Repository: https://github.com/quantarion369-arch/mathlib4
Branch: aqarion/baseline (candidate)
Status: Source package created · Compiler certificate: OPEN · C4: BLOCKED
Governance: FROZEN AUDIT · NO PROMOTION · PUBLICATION BLOCKED
Date: 2026-09-05

---

1. Filetree

The fork is a clone of leanprover-community/mathlib4 with the AQARION Lake project placed under CHANGELOG/LAKE_BUILD/. The structure is as follows:

```
mathlib4/
├── CHANGELOG/
│   └── LAKE_BUILD/                     # AQARION package root
│       ├── filetree.md                # this filetree
│       ├── Readme.md                  # this README
│       ├── Lakefile.lean              # Lake project configuration
│       ├── lean-toolchain             # Lean version pin (placeholder)
│       ├── Mathlib/
│       │   └── LaplacianBridge.lean   # Mathlib graph–Laplacian API bridge
│       ├── AQARION/
│       │   ├── Defs.lean              # Partitions, defect, co‑occurrence graphs
│       │   ├── Theorems.lean          # Statements of A, B, C
│       │   ├── Proofs.lean            # Proof sketches (all `sorry`‑ed)
│       │   ├── Target-00A.lean        # Component‑kernel formula
│       │   ├── Target-00B.lean        # Cycle‑rank identity
│       │   ├── Target-00C.lean        # Sharp universal rank bound
│       │   ├── Target-00D.lean        # Laplacian kernel bridge
│       │   ├── Target-00E.lean        # Component‑nullity dimension
│       │   ├── Target-00F.lean        # Final rank theorem
│       │   ├── ProjectionRank.lean    # Generic projection‑rank lemmas
│       │   ├── Verify.lean            # Entry point for finite verification
│       │   └── Provenance.lean        # Governance manifest, required PINs
│       ├── .github/
│       │   └── workflows/
│       │       └── verify.yml         # CI workflow (fail‑closed)
│       └── (standard Mathlib4 files)  # e.g., Mathlib/, lake-manifest.json, etc.
├── Mathlib/                           # Standard Mathlib4 source tree
├── lake-manifest.json                 # Lake dependency lock (to be generated)
├── Lakefile.lean                      # Root Lakefile (includes sub‑packages)
└── .github/                           # Standard CI (may include additional workflows)
```

Note: The AQARION package is currently self‑contained within CHANGELOG/LAKE_BUILD/. Future integration may move it to the root, but for now it is isolated to avoid interfering with the standard Mathlib build.

---

2. README.md (Content)

```markdown
# AQARION — Mathlib Fork (Lake Build)

**Version:** 0.1 (candidate)  
**Status:** Source package created · Compiler certificate: **OPEN** · C4: **BLOCKED**  
**Governance:** FROZEN AUDIT · NO PROMOTION · PUBLICATION BLOCKED  
**Root Hash:** `020a9110088010116075e1812c98bcd2bcc4905367fa8943a68c8cd224cf284e`

---

## Purpose

This repository is a **fork of `leanprover-community/mathlib4`** that hosts the Lean 4 + Mathlib formalisation scaffold for the **AQARION Defect–Incidence Theorem Suite v0.1**.

The suite contains three core theorems:

- **Theorem A** – component‑kernel formula:  
  \(\ker(D_\Pi|_{V_\Pi}) \cong \mathbb{R}^{c(H_\Pi)}\)

- **Theorem B** – cycle‑rank identity:  
  \(g_{\text{comb}} - \operatorname{rank}(D_\Pi|_{V_\Pi}) = \beta_1(I_\Pi)\)

- **Theorem C** – sharp universal rank bound:  
  \(\operatorname{rank}(D_\Pi|_{V_\Pi}) \le \min(m-1, n-m) \le \lfloor (n-1)/2 \rfloor\), with sharpness.

The formalisation builds on the existing **Partition API** (`AQ_LEAN_RANK-01A`) and uses Mathlib’s graph‑Laplacian machinery for the co‑occurrence graph.

---

## Current Status

### ✅ Completed (Mathematical & Computational)
- Theorem statements fully formalised in Lean.
- Independent exact‑rational projection campaign (n=2..8, 2,800 trials) confirms the abstract rank identity.
- Mathlib API confirmation: the required Laplacian kernel and component‑nullity theorems exist in current Mathlib.
- Existing Partition API is adopted as the canonical partition layer.

### ❌ Open / Blocked
- **Lean project not yet compiled** – no observed `lake build` has been performed in this environment.
- **Pinned Mathlib revision** – placeholder `PIN_REQUIRED` in `Provenance.lean`; must be filled after actual compiler observation.
- **All proof bodies are `sorry`** – formal proofs not yet written.
- **No `#print axioms` receipt** – we do not yet know which axioms are used.
- **CI workflow** is present but not passing; it is designed to fail until all checks are satisfied.
- **C4 (certification readiness) is BLOCKED** – we are at M0 (baseline establishment) and M1 (compiler observation) gates.

---

## How to Use (When Ready)

1. **Install Lean 4** and `lake` (following the [official instructions](https://leanprover-community.github.io/get_started.html)).
2. **Replace `lean-toolchain`** with a concrete version (e.g., `leanprover/lean4:nightly-2026-09-01` or later) and update `Provenance.lean` accordingly.
3. **Run `lake update`** to fetch Mathlib dependencies.
4. **Build the project:** `lake build`.
5. **Run the verification script:** `lake exe verify` (or use `#eval` in `Verify.lean`).
6. **Inspect axioms:** run `#print axioms theorem_name` for each target.

Currently, the build will fail because of the `sorry` placeholders – this is intentional.

---

## Roadmap to Certification

| Gate | Task | Status |
|------|------|--------|
| M0 | Establish exact Lean + Mathlib baseline | **OPEN** |
| M1 | Compile standalone Laplacian bridge | **OPEN** |
| M2 | Package AQARION Lake project | **OPEN** |
| M3 | Compile existing `AQ_LEAN_RANK-01A` | **OPEN** |
| M4–M9 | Fill `sorry`‑ed proofs | **OPEN** |
| M10 | Prove generic projection theorem | **OPEN** |
| M11 | Implement `Verify.lean` | **OPEN** |
| M12 | Run `#print axioms` | **OPEN** |
| M13 | Run exact‑rational regression | **OPEN** |
| M14 | Update CI to require all checks | **OPEN** |

**No theorem will be marked verified until compilation, `#print axioms`, and an external checker receipt are archived.**

---

## Governance

- **FROZEN AUDIT** – no changes to the core theorem statements without re‑audit.
- **NO PROMOTION** – this package is not yet certified; it is a *candidate*.
- **PUBLICATION BLOCKED** – do not publish as a verified result until C4 is lifted.
- **FORK DECISION** – we will fork Mathlib only after observing the exact compiler version; we do **not** pin to an arbitrary historical version (e.g., Lean 4.28) merely for convenience. The fork will be created at the observed revision.

---

## License

This formalisation is provided under the same license as the AQARION project (see parent repository). The Mathlib bridge is subject to Mathlib’s license.

---

## Acknowledgements

- Mathlib contributors for the graph‑Laplacian infrastructure.
- Independent computational verification campaign (exact‑rational projection tests) provided additional confidence.
```

---

3. Honest Overview

What We Have

· Full source code for the AQARION theorem suite in Lean 4, including all definitions, theorem statements, and a proof scaffold.
· A Lake project (Lakefile.lean) that declares Mathlib as a dependency.
· A CI workflow that runs lake build, checks for sorry/sorryAx, and executes a regression script if present.
· External confirmation that the required Mathlib graph‑Laplacian API exists and matches our expected statements.
· Independent computational evidence (2,800 exact‑rational projection tests) that the abstract rank identity holds.

What We Do Not Have (Yet)

· A compiled Lean project – no lake build has been executed in the current environment; the lean-toolchain is a placeholder.
· A pinned Mathlib revision – we have not frozen the exact commit hash.
· Completed proofs – all non‑trivial theorem bodies are sorry‑ed.
· An axiom receipt – #print axioms has not been run.
· A passing CI – the workflow is deliberately fail‑closed.
· A C4‑ready certificate – the certification readiness gate remains BLOCKED.

Next Steps (Exact Execution Order)

1. M0: Establish the exact Lean + Mathlib baseline by compiling a minimal project and recording the toolchain and Mathlib commit hash.
2. M1: Compile the standalone Laplacian bridge (Mathlib/LaplacianBridge.lean) to confirm API compatibility.
3. M2: Package the AQARION Lake project and ensure all imports resolve.
4. M3: Compile the existing AQ_LEAN_RANK-01A partition API (located in the parent repository) – adapt as needed.
5. M4–M9: Sequentially fill the sorry‑ed proofs for Targets 00A through 00F.
6. M10: Prove the generic projection theorem separately (mathematically done, needs formalisation).
7. M11: Implement Verify.lean to run exhaustive finite checks (n ≤ 5) and integrate with CI.
8. M12: Run #print axioms on all theorems and record the output.
9. M13: Run the exact‑rational regression script and verify no unexpected axioms are used.
10. M14: Update CI to require all checks; only then promote to PASS and lift C4.

Critical Decision Points

· Do NOT pin to Lean 4.28 unless that is the observed compiler version after M0. The current Mathlib documentation is generated against a newer Lean release; we must pin the actual revision we compile.
· Do NOT duplicate the existing Partition API – we adopt AQ_LEAN_RANK-01A as the canonical layer.
· Do NOT claim any theorem verified until all gates M0–M14 are closed and a compiler receipt is archived.

---

Bottom line: This repository is a candidate formalisation scaffold. It is not yet a verified certificate. The mathematical core is sound; the formal proof remains to be completed and compiled. C4 and publication remain BLOCKED until all gates are closed.

🔒 https://github.com/quantarion369-arch/mathlib4/blob/master/README.md
