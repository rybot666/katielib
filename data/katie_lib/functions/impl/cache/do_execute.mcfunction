#> katie_lib:impl/cache/do_execute

# Calculate the slot function to use.
scoreboard players operation #cache_state.slot_fn katie_lib.temp = cache.slot katie_lib.api
scoreboard players operation #cache_state.slot_fn katie_lib.temp /= 8 katie_lib.const

# Build macro arguments and dispatch.
data modify storage katie_lib:temp args set value {}
execute store result storage katie_lib:temp args.function int 1 run scoreboard players get #cache_state.slot_fn katie_lib.temp

function katie_lib:impl/cache/do_execute_2 with storage katie_lib:temp args
return 0