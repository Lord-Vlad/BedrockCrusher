scoreboard players add @s bcCounter 1
execute as @s at @s run tp ^ ^ ^0.5
execute if block ~ ~ ~ stonecutter run tag @s add bcPlaced
execute if entity @s[tag=bcPlaced] run tag @s remove bcPlace
execute as @s at @s unless score @s bcCounter matches 10.. unless block ~ ~ ~ stonecutter unless entity @s[tag=bcPlaced] run function bc:test
