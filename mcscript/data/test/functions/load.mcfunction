#######
# Compiled from data/test/functions/load.mcscript
# to .//data/test/functions/load.mcfunction
#
# Generated by Minecraft Script for 1.13
######
function test:mcscript/load

tag @s remove isWall
tellraw @a [{"text":"console => ","color":"aqua"},{"text":"Hello!","color":"white"}]
scoreboard objectives add click minecraft.used:minecraft.carrot_on_a_stick
execute unless entity @e[tag=mcscriptTags] at @p run summon armor_stand ~ ~ ~ {Tags:[mcscriptTags],Invisible:1,Invulnerable:1,NoGravity:1}