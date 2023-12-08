#> katie_lib:impl/cache/execute_find
scoreboard players set cache.error katie_lib.api 0

data remove storage katie_lib:temp cache_state.found
$execute store success score #success katie_lib.temp run data modify storage katie_lib:temp cache_state.found set from storage katie_lib:temp cache_state.cached[{slot:$(slot)}]
execute unless score #success katie_lib.temp matches 0 store result score cache.error katie_lib.api run function katie_lib:impl/cache/do_execute
execute if score #success katie_lib.temp matches 0 run scoreboard players set cache.error katie_lib.api 1