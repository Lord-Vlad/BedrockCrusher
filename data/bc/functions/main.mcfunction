### Summon Bedrock Crusher ###
execute as @a[scores={bcCutter=1..}] at @s run summon armor_stand ~ ~ ~ {NoGravity:1b,Marker:1b,Tags:["bcPlace","up"]}
execute as @a[scores={bcCutter=1..}] at @s run summon armor_stand ~ ~ ~ {NoGravity:1b,Marker:1b,Tags:["bcPlace","upper"]}
execute as @a[scores={bcCutter=1..}] at @s run tp @e[type=armor_stand,tag=bcPlace,tag=up] ~ ~1.5 ~ ~ ~
execute as @a[scores={bcCutter=1..}] at @s run tp @e[type=armor_stand,tag=bcPlace,tag=upper] ~ ~2 ~ ~ ~

### Test for stonecutter ###
execute as @e[type=armor_stand,tag=bcPlace] at @s unless score @s bcCounter matches 10.. run function bc:test

### If stonecutter was found ###
execute as @e[type=armor_stand,tag=bcPlaced] at @s align xyz run tp ~0.5 ~ ~0.5
execute as @e[type=armor_stand,tag=bcPlaced] at @s run tag @s add bcDone
execute as @e[type=armor_stand,tag=bcPlaced,tag=bcDone] at @s run tag @s remove bcPlaced

### Tp 1 up if too low ###
execute as @e[type=armor_stand,tag=bcDone] at @s unless block ~ ~ ~ stonecutter run tp ~ ~1 ~

### Kill failed armor_stands & reset counter ###
execute as @e[type=armor_stand,tag=bcPlace,scores={bcCounter=10..}] at @s run kill @s
execute as @e[type=armor_stand,tag=bcDone,scores={bcCounter=1..}] at @s run scoreboard players reset @s bcCounter

### Kill armor_stand unless supported ###
execute as @e[type=armor_stand,tag=bcDone] at @s unless block ~ ~ ~ stonecutter run kill @s
execute as @e[type=armor_stand,tag=bcDone] at @s unless block ~ ~1 ~ bedrock run kill @s

### Reset placement score ###
scoreboard players reset @a[scores={bcCutter=1..}] bcCutter
