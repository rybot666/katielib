#> katie_lib:api/cache/execute
#
# Executes a command previously stored with `cache/store`.
#
# @input score cache.slot katie_lib.api
#   A slot number previously returned by `cache/store` to execute.
#
# @output score cache.error katie_lib.api
#   An error code, if any occur. Current error codes:
#   * 0 indicates success
#   * 1 indicates a failure due to an unknown slot ID
data modify storage katie_lib:temp args set value {}
execute store result storage katie_lib:temp args.slot int 1 run scoreboard players get cache.slot katie_lib.api
function katie_lib:impl/cache/execute_find with storage katie_lib:temp args
