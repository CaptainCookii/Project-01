/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than eight passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/
// visit VARs
VAR begin_adventure_visited = 0
VAR farm_entrance_visited = 0
    VAR farm_house_visited = 0
    VAR house_inside_visited = 0
VAR beach_entrance_visited = 0

//stats
VAR name = ""
VAR health = 100
VAR strength = 0
VAR speed = 0
VAR int = 0

//items
VAR greatsword = 0
VAR crossbow = 0

//triggers
VAR house_item = 0

-> choose_name

== choose_name ==
What should you be called? (WARNING This will impact your game!)

+ [Evan.]
    ~ name = "Evan"
    ~ strength = 5
    ~ speed = 5
    ~ int = 5
    -> the_start
    
+ [Mikey.]
    ~ name = "Mikey"
    ~ strength = 8
    ~ speed = 2
    ~ int = 2
    -> the_start
    
+ [Sam.]
    ~ name = "Sam"
    ~ strength = 3
    ~ speed = 7
    ~ int = 8
    -> the_start
    
+ [Operator.]
    ~ name = "Evan"
    ~ strength = 999
    ~ speed = 999
    ~ int = 999
    -> the_start

== the_start ==
This is it {name}. The start of your first adventure. You've been preparing for this day for many years and the anticipation is eating you up inside. In front of you are two weapons. A greatsword sharper than any blade you've ever touched, and a intricate crossbow with a quiver of arrows that seems to never run out. You only have room to hold one so you know you'll need to choose wisely.
+ [Pick up the greatsword]
    ~ greatsword = 1
    ~ strength = strength + 6
    ~ speed = speed -3
    -> begin_adventure
+ [Pick up the crossbow]
    ~ crossbow = 1
    ~ speed = speed + 3
    -> begin_adventure
    
== begin_adventure ==
{begin_adventure_visited == 0: {crossbow == 1: Picking up the crossbow made you feel light and quick but without anything close you'll be weak up close.} {greatsword == 1: Picking up the greatsword made you feel powerful, like you could cut down anything in your way. Its weight leaves you feeling slow and sluggish though.} Still an excellent choice. You head down the path and start your adventure. After a bit of walking you come across a crossroads. A sign there lables a few options of where you could go. An arrow pointing to the west labled farm, an arrow pointing east labled beach, and an arrow pointing south labled Lipston, which you know fondly as your home.}
~ begin_adventure_visited = 1
+ [View description again.]
    ~ begin_adventure_visited = 0
    -> begin_adventure
+ [Go to the farm.] -> farm_entrance
// + [Go to the beach.] -> beach_entrance
// + [Go home.] -> go_home

== farm_entrance ==
{farm_entrance_visited == 0: You enter the farm. In every direction as far as you can see stretch fields of wheat. On the path forward there is a lonely farm house and a barn. Both look oddly abandoned despite the flourishing fields of wheat you see around them.}
{farm_entrance_visited == 1: You're at the entrance to the farm.}
~ farm_entrance_visited = 1
+ [View description]
    ~farm_entrance_visited = 0
    -> farm_entrance
+ [Go to the farm house.] -> farm_house
// + [Go to the barn.] -> barn
+ [Go Back] -> begin_adventure

== farm_house ==
{farm_house_visited == 0: You walk up to the house. All the windows and doors are boarded shut. You notice though on the balcony there is a window left unboarded. You also notice the planks over the door are looser and could be broken off.}
{farm_house_visited == 1: You are outside the house}
~ farm_house_visited = 1
+ [View description]
    ~ farm_house_visited = 0
    -> farm_house
+ [Try to get to the balcony.] -> balcony_check
+ [Try to break the planks.] -> planks_check
+ [Go Back.] -> farm_entrance

== balcony_check ==
You take a few steps back, getting ready to make a running jump for the balcony.
{ speed > 6: As you run forward you leap with everything you have and catch the balcony. You crawl up and are able to walk inside the house. -> house_inside}
{ speed <= 6: As you run forawrd you leap with everything you have and completely miss the balcony. Maybe you need more speed before you try that again. -> farm_house}

== planks_check ==
You walk up to the loose planks, mustering your inner strength to get ready and pull them off.
{ strength > 7: You place your hands on the planks and rip as hard as you can, bringing the boards clean off. You walk uncontested into the house. -> house_inside}
{ strength <= 7: You place your hands on the planks and rip as hard as you can, making your shoulder almost pop out of socket as these boards hold tight in place. You'll need to find some way to get stronger to break these off. -> farm_house}
-> DONE

== house_inside ==
{house_inside_visited == 0: Inside the house is very dark. The only light comes from the unboarded window above you. From what you can make out you can see the furniture is tattered and broken, strewn violently around the room. You can also tell the house is a ranch, and that it only contains two rooms, this one, and one in the back.}
{house_inside_visited == 1: You are inside the house.}
~ house_inside_visited = 1
* [Investigate the furniture] -> check_furniture
-> DONE

== check_furniture ==
You investigate the furniture closer. Whatever destroyed the furniture doesn't seem to be human, there are gouge marks like claws all over them. 
{ int > 3: It appears as if it was searching for something. Maybe it didn't find it and you can get it yourself.}
~ house_item = 1
{ strength >= 5: This creature isn't one to be messed with if it did this. You should probably leave lest it's still here}
+ [Go Back] -> house_inside








    
    