#######
# Compiled from data/test/functions/click.mcscript
# to ./data/test/functions/data/test/functions/mcscript/raycast1.mcfunction
#
# Generated by Minecraft Script for 1.13
######
execute if entity @s[distance=5..] run particle flame

scoreboard players add raycast1 mcscript_raycast 1
execute positioned ^ ^ ^1 unless block ~ ~ ~ air run tag @s add mcscriptStop
execute positioned ^ ^ ^1 if entity @s[tag=!mcscriptStop] if block ~ ~ ~ air if score raycast1 mcscript_raycast matches ..100 run function test:mcscript/raycast1
execute if score raycast1 mcscript_raycast matches ..100 if entity @s[tag=mcscriptStop] positioned ^ ^ ^1 run setblock ~ ~ ~ stone
tag @s[tag=mcscriptStop] remove mcscriptStop
