import Lake
open Lake DSL

package «AQARION» where
  -- depend on the local Mathlib fork, not external master
  -- (place this package inside the forked mathlib4 tree)

require mathlib from "../.."

@[default_target]
lean_lib «AQARION» where
  roots := #[`AQARION]
