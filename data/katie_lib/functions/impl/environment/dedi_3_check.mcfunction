#> katie_lib:impl/environment/dedi_3_check
#
# Check for dedicated server at OP level 3.
execute store success score #success katie_lib.temp run function katie_lib:impl/environment/macro {command: "ban ."}

execute if score #success katie_lib.temp matches 1 run scoreboard players set env.server katie_lib.api 1
execute unless score #success katie_lib.temp matches 1 run function katie_lib:impl/environment/any_3_check

# If we found a server type, we have OP level 3.
execute unless score env.server katie_lib.api matches 0 run scoreboard players set env.op_level katie_lib.api 3