#> katie_lib:api/environment
# Tests for various properties about the environment.
#
# @output score env.op_level katie_lib.api
#   The OP level this function was executed under. Will be 2, 3 or 4.
#
# @output score env.server katie_lib.api
#   The server type this function was executed under, where:
#   - 0 represents an unknown server type (we can't tell at OP level 2)
#   - 1 represents a dedicated server
#   - 2 represents a singleplayer or LAN world
#
# @output score env.jfr katie_lib.api
#   Whether JFR is available, where:
#   - 0 represents JFR being unavailable
#   - 1 represents JFR being available
#   - 2 represents an unknown state (will be returned if we don't have OP level 4)
scoreboard players set env.op_level katie_lib.api 2
scoreboard players set env.server katie_lib.api 0
scoreboard players set env.jfr katie_lib.api 2

# Flush the macro cache. These commands are never actually executed anyway, but they have to be semantically valid
# (parseable) to get cached.
function katie_lib:impl/environment/macro { command: "msg @s 0" }
function katie_lib:impl/environment/macro { command: "msg @s 1" }
function katie_lib:impl/environment/macro { command: "msg @s 2" }
function katie_lib:impl/environment/macro { command: "msg @s 3" }
function katie_lib:impl/environment/macro { command: "msg @s 4" }
function katie_lib:impl/environment/macro { command: "msg @s 5" }
function katie_lib:impl/environment/macro { command: "msg @s 6" }
function katie_lib:impl/environment/macro { command: "msg @s 7" }

# Tests for singleplayer / LAN at OP level 4.
execute store success score #success katie_lib.temp run function katie_lib:impl/environment/macro {command: "publish"}

execute if score #success katie_lib.temp matches 1 run scoreboard players set env.server katie_lib.api 2
execute unless score #success katie_lib.temp matches 1 run function katie_lib:impl/environment/dedi_4_check

# At this point if we found a server type, we know the OP level is 4. Otherwise, try at OP level 3.
execute if score env.server katie_lib.api matches 0 run function katie_lib:impl/environment/dedi_3_check
execute unless score env.server katie_lib.api matches 0 run scoreboard players set env.op_level katie_lib.api 4

# If we have OP level 4, check for JFR availability.
execute if score env.op_level katie_lib.api matches 4 store success score env.jfr katie_lib.api run function katie_lib:impl/environment/macro {command: "jfr start"}