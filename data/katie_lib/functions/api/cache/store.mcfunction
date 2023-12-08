#> katie_lib:api/cache/store
#
# Stores a command into a persistent cache slot using the permission levels of the executor. The command should be 
# given as a macro argument named `command`.
#
# @input storage katie_lib:api 
#   command: string
#     The command to store.
#
# @output score cache.slot katie_lib.api
#   The slot the command was assigned to. This can be passed to `cache/execute` to execute the stored command. If this
#   value is negative it indicates an error condition. 
#
#   Current error conditions:
#   * -1 indicates that there is no slots left to store the command into.

# Find a new, empty slot to store in.
scoreboard players operation cache.slot katie_lib.api = #cache_state.next_slot katie_lib.temp
scoreboard players add #cache_state.next_slot katie_lib.temp 1

# Store the command into storage along with the ID.
data modify storage katie_lib:temp cache_state.new_entry set value {}
data modify storage katie_lib:temp cache_state.new_entry.command set from storage katie_lib:api command
execute store result storage katie_lib:temp cache_state.new_entry.slot int 1 run scoreboard players get cache.slot katie_lib.api

data modify storage katie_lib:temp cache_state.cached append from storage katie_lib:temp cache_state.new_entry

# Locate the relevant cache slot.
scoreboard players operation #cache_state.slot_fn katie_lib.temp = cache.slot katie_lib.api
scoreboard players operation #cache_state.slot_fn katie_lib.temp /= 8 katie_lib.const

execute if score #cache_state.slot_fn katie_lib.temp >= #cache_state.slot_fn_count katie_lib.temp run scoreboard players set cache.slot katie_lib.api -1
execute if score #cache_state.slot_fn katie_lib.temp < #cache_state.slot_fn_count katie_lib.temp run function katie_lib:impl/cache/do_store