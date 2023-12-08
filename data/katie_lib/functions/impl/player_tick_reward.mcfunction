#> katie_lib:impl/player_tick_reward
advancement revoke @s only katie_lib:impl/tick

# If there is multiple loop runners, remove the tag from all of them.
execute store result score #count katie_lib.temp if entity @a[tag=katie_lib.player_tick_runner]
execute if score #count katie_lib.temp matches 2.. run tag @a remove katie_lib.player_tick_runner

# If there is no tick runner, allocate ourselves.
execute unless entity @a[tag=katie_lib.player_tick_runner] run tag @s add katie_lib.player_tick_runner

# If we are the tick runner, run the loop.
execute if entity @s[tag=katie_lib.player_tick_runner] run function #katie_lib:api/player_tick