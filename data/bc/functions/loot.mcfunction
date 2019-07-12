
execute as @s at @s if score @s bcLoot matches 1201.. run scoreboard players set @s bcLoot 1
execute as @s at @s run scoreboard players add @s bcLoot 1
execute as @s at @s if score @s bcLoot matches 1200 run loot insert ~ ~-1 ~ loot bc:general
