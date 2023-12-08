#> katie_lib:impl/environment/any_3_check
#
# Checks for OP level 3 in any environment.
execute store success score #success katie_lib.temp run function katie_lib:impl/environment/macro {command: "kick ."}
execute if score #success katie_lib.temp matches 1 run scoreboard players set env.server katie_lib.api 2