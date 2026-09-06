# AQARION Pass XXI‑C — Lean Verification Package

**Status:** Source package created · Compiler certificate: OPEN · C4: BLOCKED  
**Governance:** FROZEN AUDIT · NO PROMOTION · PUBLICATION BLOCKED  
**Date:** 2026-09-05

---

## Overview

This repository contains the Lean 4 + Mathlib formalisation scaffold for the **AQARION Defect–Incidence Theorem Suite v0.1**, as described in the accompanying [AQARION_Defect_Incidence_Theorem_v01.md](AQARION_Defect_Incidence_Theorem_v01.md).

The suite comprises three core theorems:

- **Theorem A** – component‑kernel formula:  
  \(\ker(D_\Pi|_{V_\Pi}) \cong \mathbb{R}^{c(H_\Pi)}\)

- **Theorem B** – cycle‑rank identity:  
  \(g_{\text{comb}} - \operatorname{rank}(D_\Pi|_{V_\Pi}) = \beta_1(I_\Pi)\)

- **Theorem C** – sharp universal rank bound:  
  \(\operatorname{rank}(D_\Pi|_{V_\Pi}) \le \min(m-1, n-m) \le \lfloor (n-1)/2 \rfloor\), with sharpness.

The formalisation is built on top of an **existing Partition API** (`AQ_LEAN_RANK-01A` in the parent repository) and uses Mathlib’s graph‑Laplacian machinery for the co‑occurrence graph.

---

## Package Contents

| File | Purpose |
|------|---------|
| `lakefile.lean` | Lake project configuration (requires Mathlib) |
| `lean-toolchain` | Lean version pin (currently a placeholder; **must be replaced** with an observed, verifiable toolchain) |
| `Mathlib/LaplacianBridge.lean` | Bridge to Mathlib’s `SimpleGraph.LapMatrix` – exports component‑nullity and Laplacian‑kernel theorems |
| `AQARION/Defs.lean` | Core definitions: partitions, block‑constant subspace, Koopman operator, defect, incidence graphs |
| `AQARION/Theorems.lean` | Statements of Theorems A, B, C |
| `AQARION/Proofs.lean` | Proof sketches (all non‑trivial algebra is `sorry`‑ed pending completion) |
| `AQARION/Target-00A.lean` … `Target-00F.lean` | Sequential verification targets (00A – component kernel, 00B – cycle rank, 00C – sharp bound, 00F – composition) |
| `AQARION/ProjectionRank.lean` | Generic finite‑dimensional projection‑rank lemmas (used in the abstract proof) |
| `AQARION/Verify.lean` | Entry point for exhaustive finite verification (n ≤ 5) – currently a placeholder |
| `AQARION/Provenance.lean` | Governance manifest, required PINs, and audit trail |
| `.github/workflows/verify.yml` | GitHub Actions workflow – currently **fail‑closed** until all checks pass |

---

## Current Status

### ✅ Completed (Mathematical & Computational)
- **Theorem statements** are fully formalised in Lean.
- **Independent exact‑rational projection campaign** (n=2..8, 2,800 trials) confirms the abstract rank identity \(\operatorname{rank}((I-P)KP) = \dim V - \dim(V \cap K^{-1}V)\).
- **Mathlib API confirmation**: the required Laplacian kernel and component‑nullity theorems exist in current Mathlib.
- **Existing Partition API** (from `AQ_LEAN_RANK-01A`) is adopted as the canonical partition layer; no duplicate structures are created.

### ❌ Open / Blocked
- **Lean project not yet compiled** – no observed `lake build` has been performed in this environment.
- **Pinned Mathlib revision** – placeholder `PIN_REQUIRED` in `Provenance.lean`; must be filled after actual compiler observation.
- **All proof bodies are `sorry`** – the formal proofs are not yet written; they are required before certification.
- **No `#print axioms` receipt** – we do not yet know which axioms are used.
- **CI workflow** is present but not passing; it is designed to fail until all checks are satisfied.
- **C4 (certification readiness) is BLOCKED** – we are at M0 (baseline establishment) and M1 (compiler observation) gates.

---

## Roadmap to Certification

The exact next steps are:

1. **M0:** Establish exact Lean + Mathlib baseline – compile a minimal project and record the toolchain and Mathlib commit hash.
2. **M1:** Compile the standalone Laplacian bridge (`Mathlib/LaplacianBridge.lean`) to confirm API compatibility.
3. **M2:** Package the AQARION Lake project and ensure all imports resolve.
4. **M3:** Compile the existing `AQ_LEAN_RANK-01A` partition API (located in the parent repository) – adapt as needed.
5. **M4–M9:** Sequentially fill the `sorry`‑ed proofs for Targets 00A through 00F.
6. **M10:** Prove the generic projection theorem separately (this is already mathematically done, but needs formalisation).
7. **M11:** Implement `Verify.lean` to run exhaustive finite checks (n ≤ 5) and integrate with CI.
8. **M12:** Run `#print axioms` on all theorems and record the output.
9. **M13:** Run the exact‑rational regression script (if any) and verify no unexpected axioms are used.
10. **M14:** Update CI to require all checks; only then promote to `PASS` and lift C4.

**No theorem will be marked verified until compilation, `#print axioms`, and an external checker receipt are archived.**

---

## Governance

- **FROZEN AUDIT** – no changes to the core theorem statements without re‑audit.
- **NO PROMOTION** – this package is not yet certified; it is a *candidate*.
- **PUBLICATION BLOCKED** – do not publish as a verified result until C4 is lifted.
- **FORK DECISION** – we will fork Mathlib only after observing the exact compiler version; we do **not** pin to an arbitrary historical version (e.g., Lean 4.28) merely for convenience. The fork will be created at the observed revision.

---

## How to Use

1. **Install Lean 4** and `lake` (following the [official instructions](https://leanprover-community.github.io/get_started.html)).
2. **Replace `lean-toolchain`** with a concrete version (e.g., `leanprover/lean4:nightly-2026-09-01` or later) and update `Provenance.lean` accordingly.
3. **Run `lake update`** to fetch Mathlib dependencies.
4. **Build the project:** `lake build`.
5. **Run the verification script:** `lake exe verify` (or use `#eval` in `Verify.lean`).
6. **Inspect axioms:** run `#print axioms theorem_name` for each target.

Currently, the build will fail because of the `sorry` placeholders – this is intentional.

---

## Contributing

This is an internal audit package. Contributions are not accepted until the governance status changes. However, bug reports or suggestions regarding the formalisation strategy are welcome via the parent repository’s issue tracker.

---

## License

The formalisation is provided under the same license as the AQARION project (see parent repository). The Mathlib bridge is subject to Mathlib’s license.

---

## Acknowledgements

- Mathlib contributors for the graph‑Laplacian infrastructure.
- Independent computational verification campaign (exact‑rational projection tests) provided additional confidence.

---

**End of README**
