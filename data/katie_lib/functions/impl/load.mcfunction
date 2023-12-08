#> katie_lib:impl/load
#
# Callback for `#minecraft:load`
scoreboard objectives add katie_lib.temp dummy
scoreboard players set #cache_state.slot_fn_count katie_lib.temp 8

scoreboard objectives add katie_lib.api dummy

scoreboard objectives add katie_lib.const dummy
scoreboard players set 8 katie_lib.const 8

# Reset cache state (the game clears this on `/reload` and server restart).
scoreboard players set #cache_state.next_slot katie_lib.temp 0
data remove storage katie_lib:temp cache_state