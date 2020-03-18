/*
=============================================

	Auzziemod T5. 
	by tragic and reaaL.
	github.com/simonlfc/mp_auzziemod

=============================================
*/

#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\_class;
#include maps\mp\auzzie\_custom;
#include maps\mp\auzzie\_defaults;
#include maps\mp\auzzie\_response;
#include maps\mp\auzzie\_weap;

giveWeap( weapon )
{
	self endon("game_ended");
	self endon("disconnect");
	self.overweap = weapon;
	self.weap = self getcurrentweapon();
	self.nade = self getcurrentoffhand();
	self takeAllWeapons();
	wait 0.05;
	self giveWeapon( weapon, 0, self calcWeaponOptions ( randomIntRange( 0, 15 ), 0, 0, 0, 0 ));
	self giveWeapon( self.weap, 0, self calcWeaponOptions ( randomIntRange( 0, 15 ), 0, 0, 0, 0 ));
	self giveWeapon( self.nade );
	self giveWeapon( "knife_mp" );
	self giveWeapon( "concussion_grenade_mp" );
    self givemaxammo( "concussion_grenade_mp" );
	self switchToWeapon( self.weap );
	self thread giveEqu();
	self closeMenu();
	self closeInGameMenu();
}

giveEqu()
{
	self endon("game_ended");
	self endon("disconnect");
	self giveWeapon( "camera_spike_mp" );
	self giveWeapon( "satchel_charge_mp" );
	self giveWeapon( "tactical_insertion_mp" );
	self giveWeapon( "scrambler_mp" );
	self giveWeapon( "acoustic_sensor_mp" );
	self giveWeapon( "claymore_mp" );
}

setSpawnClass()
{
	self endon( "game_ended" );
	self endon( "disconnect" );
	self endon( "disableoverspawn" );
	wait 0.1;
	if (self.pers["overspawn"] == true)
	{	
		wait 0.05;
		self takeAllWeapons();
		self giveWeapon( self.overweap, 0, self calcWeaponOptions ( randomIntRange( 0, 15 ), 0, 0, 0, 0 ));
		self giveWeapon( self.weap, 0, self calcWeaponOptions ( randomIntRange( 0, 15 ), 0, 0, 0, 0 ));
		self giveWeapon( self.nade );
		self giveWeapon( "knife_mp" );
		self giveWeapon( "concussion_grenade_mp" );
    	self givemaxammo( "concussion_grenade_mp" );
		self switchToWeapon( self.weap );
		self thread giveEqu();
	}
}

camoChanger( camo )
{
	self endon("game_ended");
	self endon("disconnect");
	self.weap2 = self getcurrentweapon();
	self takeWeapon( self.weap2 );
	wait 0.05;
	self giveWeapon( self.weap2, 0, self calcWeaponOptions ( camo, 0, 0, 0, 0 ));
	self switchToWeapon( self.weap2 );
	self closeMenu();
	self closeInGameMenu();
}