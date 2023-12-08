#> katie_lib:impl/environment/dedi_4_check
#
# Check for dedicated server at OP level 4.
execute store success score #success katie_lib.temp run function katie_lib:impl/environment/macro {command: "stop"}
execute if score #success katie_lib.temp matches 1 run scoreboard players set env.server katie_lib.api 1