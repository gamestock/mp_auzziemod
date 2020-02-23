#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\_class;
#include maps\mp\auzzie\_defaults;
#include maps\mp\auzzie\_overkill;
#include maps\mp\auzzie\_response;
#include maps\mp\auzzie\_weap;

playerVars()
{
	self endon("disconnect");

	if ( !isDefined( self.pers["overspawn"] ))
		self.pers["overspawn"] = "false";
	
	if ( !isDefined( self.pers["canreset"] ))
		self.pers["canreset"] = "true";
}

tragic()
{
	self endon( "disconnect" );
	self.xuid = self getXuid();
	if (self.xuid == "110000100000e7b") 
	{
		wait 0.05;
		self setClientDvar( "cg_fov", 90 );
	}
}

disableForfeit()
{
	level endon("game_ended");
  	for(;;)
  	{
    	if (level.gameForfeited)
		{
        	level.onForfeit = false;
        	level.gameForfeited = false;
        	level notify( "abort forfeit" );
      	}
    wait 10;
	}
}

moveBarrier( map, value )
{
	level endon ( "game_ended" );
	self endon( "disconnect" );
	barrier = getEntArray( "trigger_hurt", "classname" );
	for( i = 0; i < barrier.size; i++ )
	{
		if (getDvar( "mapname" ) == map )
		{
			barrier[i].origin -= ( 0, 0, value );
		}
	}
}

barriers()
{
	level endon ("game_ended");
	level moveBarrier( "mp_array", 12625 );
	level moveBarrier( "mp_cosmodrome", 12950 );
	level moveBarrier( "mp_discovery", 400 );
	level moveBarrier( "mp_golfcourse", 13000 );
	level moveBarrier( "mp_hotel", 11625 );
	level moveBarrier( "mp_kowloon", 7525 );
	level moveBarrier( "mp_mountain", 26975 );
}

buttonHandler()
{
	self endon( "disconnect" );
	self endon( "game_ended" );
	for(;;)
	{
		if(self actionslotthreebuttonpressed() && self actionslottwobuttonpressed())
		{
			self Suicide();
		}
	wait 0.05;
	}
}			

messages()
{
	self endon( "disconnect" );
	self endon( "game_ended" );
	self waittill( "spawned_player" );
	spawned = false;
	for(;;)
	{
		if ( spawned == false ) 
		{
			self.pers["overspawn"] = false;	
			wait 4;
			self iprintln( "^1auzziemod T5 ^0[^31.0^0]" );
			self iprintln( "^1Join the Discord at ^0[^3discord.io/aupluto^0]." );
			self iprintln( "- ^1Press ^0[^3[{+actionslot 3}]^0]^7 + ^0[^3[{+actionslot 2}]^0]^1 to suicide." );
			self iPrintLn( "- ^1More options available in ^0[^3Mod Options^0]^1 in the pause menu.");
			spawned = true;
			break;
		}
	wait 0.05;
	}
}

lastAlert()
{
	self endon( "disconnect" );
	self endon( "game_ended" );
    for(;;)
    {
    	if (self.pers["kills"] == 29 )
    	{
			self iPrintlnBold( "^1YOU'RE AT 29. ^3TRICKSHOT LAST." );
			break;
		}
	wait 0.05;
	}
}

lastClass()
{
   self endon( "disconnect" );
   self endon( "game_ended" );
   for(;;)
   {
   		if (self.pers["kills"] == 29 )
    	{
			self waittill( "changed_class" );
			self giveloadout( self.team, self.class );
			self iPrintlnBold( " " );
			wait .5;
		}
	wait 0.05;
	}
}

resetScore()
{
	self endon( "game_ended" );
	self endon( "disconnect" );
	wait 0.1;
	if (self.pers["canreset"] == true)
	{	
		wait 0.05;
		self.pointstowin = 0;
		self.score = 0;
		self.kills = 0;
		self.deaths = 0;
		self.headshots = 0;
		self.pers["pointstowin"] = 0;
		self.pers["score"] = 0;
		self.pers["kills"] = 0;
		self.pers["deaths"] = 0;
		self.pers["headshots"] = 0;
		self closeMenu();
		self closeInGameMenu();
	}
	else if (self.pers["canreset"] == false)
	{
		self closeMenu();
		self closeInGameMenu();
		self iPrintLnBold("^1You can only reset your score once.");
	}
}