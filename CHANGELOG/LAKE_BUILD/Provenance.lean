/-!
# AQARION Provenance & Governance Manifest

Root hash: 020a9110088010116075e1812c98bcd2bcc4905367fa8943a68c8cd224cf284e
Date: 2026-09-05

## Status
- Mathematical rank identity (right-component form): computationally verified
- Lean formalisation: OPEN (all proof bodies contain `sorry`)
- Compiler certificate: OPEN
- C4 / Publication: BLOCKED

## Toolchain
Authoritative pin (root fork): leanprover/lean4:v4.34.0-rc2

## Required external receipts before any promotion
1. Successful `lake build` of this package
2. `#print axioms` on `kernel_eq_constRightComp`, `dim_constRightComp_eq_c_bip`, `defect_rank_identity`
3. Exact-rational regression matching the 3975-case census
4. Independent external checker receipt

No theorem is marked verified until the above exist.
-/
