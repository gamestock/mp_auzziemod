/*==========================================

Bounce Mod

_Credits:
    JoeyB     - Author/creator/revising all bounce coords (most were raised too high).
    Avail     - Idea/Coordinates of bounces/request.
    xShadou - Coordinates.

_Adding a bounce:
        level.bounces["mapname"] = [];
        level.bounces["mapname"][bounceNum] = (X, Y, Z);

    raise/lower I according to the amount of bounces already for that map.
    I.E: adding one more bounce to afghan

        level.bounces["mp_afghan"][6] = (x, y, z);

    would be added after:
        level.bounces["mp_afghan"][5] = (-1231, 1813, 123);

_Changing a multiplier/radius
    _Multiplier:

        level.bounces["mapname"]["multiplier"][bounceNum] = bMultiplier;

    I.E.:
        level.bounces["mp_quarry"]["multiplier"][3] = -0.71;

    _Radius:

        level.bounces["mapname"]["radius"][bounceNum] = bMultiplier;

    I.E.:
        level.bounces["mp_quarry"]["radius"][3] = 20;

==========================================
*/

#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\auzzie\_custom;
#include maps\mp\auzzie\_defaults;
#include maps\mp\auzzie\_overkill;
#include maps\mp\auzzie\_response;
#include maps\mp\auzzie\_weap;

init()
{
    level.CurMap = getDvar("mapname");

    level thread BouncePos();

    thread doBounce();
}

BouncePos()
{
    switch(level.CurMap) // To keep from defining unused variables.
    {
        case "mp_nuked":
            level.bounces["mp_nuked"]        =    []; 
            level.bounces["mp_nuked"][0] = (-642, 0, 36);
            level.bounces["mp_nuked"][1] = (-292, 482, 126);
            level.bounces["mp_nuked"][2] = (-1350, 1011, 56);
        	break;
		case "mp_array":
			level.bounces["mp_array"]        =    []; 
        	break;
		case "mp_cracked":
			level.bounces["mp_cracked"]        =    []; 
        	break;
		case "mp_crisis":
			level.bounces["mp_crisis"]        =    []; 
        	break;
		case "mp_firingrange":
			level.bounces["mp_firingrange"]        =    []; 
        	break;
		case "mp_duga":
			level.bounces["mp_duga"]        =    []; 
        	break;
		case "mp_hanoi":
			level.bounces["mp_hanoi"]        =    []; 
        	break;
		case "mp_cairo":
			level.bounces["mp_cairo"]        =    []; 
        	break;
		case "mp_cosmodrome":
			level.bounces["mp_cosmodrome"]        =    []; 
        	break;
		case "mp_radiation":
			level.bounces["mp_radiation"]        =    []; 
        	break;
		case "mp_mountain":
			level.bounces["mp_mountain"]        =    []; 
        	break;
		case "mp_villa":
			level.bounces["mp_villa"]        =    []; 
        	break;
		case "mp_russianbase":
			level.bounces["mp_russianbase"]        =    []; 
        	break;
		case "mp_berlinwall2":
			level.bounces["mp_berlinwall2"]        =    []; 
        	break;
		case "mp_discovery":
			level.bounces["mp_discovery"]        =    []; 
        	break;
		case "mp_kowloon":
			level.bounces["mp_kowloon"]        =    []; 
        	break;
		case "mp_stadium":
			level.bounces["mp_stadium"]        =    []; 
        	break;
		case "mp_gridlock":
			level.bounces["mp_gridlock"]        =    []; 
        	break;
		case "mp_hotel":
			level.bounces["mp_hotel"]        =    []; 
        	break;
		case "mp_outskirts":
			level.bounces["mp_outskirts"]        =    []; 
        	break;
		case "mp_zoo":
			level.bounces["mp_zoo"]        =    []; 
        	break;
		case "mp_drivein":
			level.bounces["mp_drivein"]        =    []; 
        	break;
		case "mp_area51":
			level.bounces["mp_area51"]        =    []; 
        	break;
		case "mp_golfcourse":
			level.bounces["mp_golfcourse"]        =    []; 
        	break;
		case "mp_silo":
			level.bounces["mp_silo"]        =    []; 
        	break;
    }
}

doBounce()
{
    level endon("game_ended");
    level waittill("prematch_over");

    while(isDefined(level.bounces[level.CurMap]))
    {
        wait 0.01;

        for ( i = 0; i < level.players.size; i++ )
		{
            player = level.players[i];
            player.vel = player getVelocity();

            if(!isDefined(player.CanBounce)) // Ehh; works for now anyways. -- removed ->  || player.vel[2] >= -10 && player.vel[2] <= 10
                player.CanBounce = 1;

            if( player isOnGround() || player isOnLadder() || !isAlive( player ) || player.vel[2] > 0) // bounces won't affect people walking, climbing a ladder, dead, or people jumping UP instead of DOWN
                continue;

            for( bCount = 0; bCount < level.bounces[level.CurMap].size; bCount++ )
            {
                if(!isDefined(level.bounces[level.CurMap][bCount])) // incase you forgot to change the array's number when removing a bounce, this will stop various errors/bugs.
                    continue; // You /should/ up the digit though; there will be errors still (I.E. some bounces won't be counted)

                if(isDefined(level.bounces[level.CurMap]["radius"][bCount])) // check for custom radius
                {
                    player.bRadius = level.bounces[level.CurMap]["radius"][bCount];
                } else { // if error or no custom radius then we assign the 'default'.
                    level.bounces[level.CurMap]["radius"][bCount] = 80;
                    player.bRadius = level.bounces[level.CurMap]["radius"][bCount];
                }

                if(distance(player.origin, level.bounces[level.CurMap][bCount]) <= player.bRadius && player.canBounce == 1 && player.origin[2] - level.bounces[level.CurMap][bCount][2] <= 25) {

                    if(isDefined(level.bounces[level.CurMap]["multiplier"][bCount])) // check for custom multiplier
                    {
                        player.bMultiplier = level.bounces[level.CurMap]["multiplier"][bCount];
                    } else { // if error or no custom multiplier we assign default
                        level.bounces[level.CurMap]["multiplier"][bCount] = -1.215; //Standard: -1.215
                        player.bMultiplier = level.bounces[level.CurMap]["multiplier"][bCount];
                    }

                    player setVelocity( ( player.vel[0], player.vel[1], player.vel[2] * player.bMultiplier ) ); // -1.215 is the 'multiplier' of the bounce; lower number (remember its negative) = higher bounce
                    player.CanBounce = 0;
                    player thread resetBounce();
                }
            }
        }
    }
}


resetBounce() // mere work around for player.canBounce -- works slightly better for now anyways
{
    self endon("disconnect");
    self endon("finishReset");
    wait 5;
    self.canBounce = 1;
    self notify("finishReset");
}