#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;

giveWeap( weapon )
{
	self.weap = self getcurrentweapon();
	self takeAllWeapons();
	wait 0.05;
	self giveWeapon( weapon, 0, self calcWeaponOptions ( randomIntRange( 0, 15 ), 0, 0, 0, 0 ));
	self giveWeapon( self.weap );
	self switchToWeapon( self.weap );
	self closeMenu();
	self closeInGameMenu();
}

overkill()
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("menuresponse", menu, response);
		
		if(menu == game["overkill_sub"])
		{
			if(response == "giveMP5K")
			{
				giveWeap( "mp5k_mp" );
			}
		}
		wait 0.05;
	}
}