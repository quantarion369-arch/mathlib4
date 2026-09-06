/-
  Provenance manifest and governance safeguards for the AQARION verification.
  This file is not part of the mathematical content but records the audit trail.
-/

-- PIN_REQUIRED: actual Lean version and Mathlib commit must be recorded here.
def lean_version : String := "leanprover/lean4:nightly-2026-09-01"
def mathlib_revision : String := "PIN_REQUIRED"   -- to be filled after M0

-- C4 BLOCKED until compiler certificate is obtained.
def C4_status : String := "BLOCKED"

-- The following `#print axioms` should be run on each theorem to ensure no unsound axioms.
-- Currently deferred.
#exit
