#> katie_lib:impl/cache/do_execute_2
data modify storage katie_lib:temp args set value {}
data modify storage katie_lib:temp args.c set from storage katie_lib:temp cache_state.found.command

scoreboard players set #cache_state.storing katie_lib.temp 0
$function katie_lib:impl/cache/slots/$(function) with storage katie_lib:temp args