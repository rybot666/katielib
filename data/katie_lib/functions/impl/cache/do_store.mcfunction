#> katie_lib:impl/cache/do_store
data modify storage katie_lib:temp args set value {}
execute store result storage katie_lib:temp args.function int 1 run scoreboard players get #cache_state.slot_fn katie_lib.temp
function katie_lib:impl/cache/do_store_2 with storage katie_lib:temp args