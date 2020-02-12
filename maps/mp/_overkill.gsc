#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\_class;

/*TODO:
	- Give player back their weapon with their existing camo
	- Add attachments
	- Add get overkill class on spawn switch
*/

giveWeap( weapon )
{
	self.weap = self getcurrentweapon();
	self.nade = self getcurrentoffhand();
	self takeAllWeapons();
	wait 0.05;
	self giveWeapon( weapon, 0, self calcWeaponOptions ( randomIntRange( 0, 15 ), 0, 0, 0, 0 ));
	self giveWeapon( self.weap, 0, self calcWeaponOptions ( randomIntRange( 0, 15 ), 0, 0, 0, 0 ));
	self giveWeapon( self.nade );
	self giveWeapon( "concussion_grenade_mp" );
    self givemaxammo( "concussion_grenade_mp" );
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
			if(response == "giveSKORPION")
			{
				giveWeap( "skorpion_mp" );
			}
			if(response == "giveMAC11")
			{
				giveWeap( "mac11_mp" );
			}
			if(response == "giveAK74U")
			{
				giveWeap( "ak74u_mp" );
			}
			if(response == "giveUZI")
			{
				giveWeap( "uzi_mp" );
			}
			if(response == "givePM63")
			{
				giveWeap( "pm63_mp" );
			}
			if(response == "giveMPL")
			{
				giveWeap( "mpl_mp" );
			}
			if(response == "giveSPECTRE")
			{
				giveWeap( "spectre_mp" );
			}
			if(response == "giveKIPARIS")
			{
				giveWeap( "kiparis_mp" );
			}
		}
		if(menu == game["overkill_ar"])
		{
			if(response == "giveM16")
			{
				giveWeap( "m16_mp" );
			}
			if(response == "giveENFIELD")
			{
				giveWeap( "enfield_mp" );
			}
			if(response == "giveM14")
			{
				giveWeap( "m14_mp" );
			}
			if(response == "giveFAMAS")
			{
				giveWeap( "famas_mp" );
			}
			if(response == "giveGALIL")
			{
				giveWeap( "galil_mp" );
			}
			if(response == "giveAUG")
			{
				giveWeap( "aug_mp" );
			}
			if(response == "giveFNFAL")
			{
				giveWeap( "fnfal_mp" );
			}
			if(response == "giveAK47")
			{
				giveWeap( "ak47_mp" );
			}
			if(response == "giveCOMMANDO")
			{
				giveWeap( "commando_mp" );
			}
			if(response == "giveG11")
			{
				giveWeap( "g11_mp" );
			}
		}
		if(menu == game["overkill_sg"])
		{
			if(response == "giveOLYMPIA")
			{
				giveWeap( "rottweil72_mp" );
			}
			if(response == "giveSTAKEOUT")
			{
				giveWeap( "ithaca_mp" );
			}
			if(response == "giveSPAS12")
			{
				giveWeap( "spas_mp" );
			}
			if(response == "giveHS10")
			{
				giveWeap( "hs10_mp" );
			}
		}
		if(menu == game["overkill_lmg"])
		{
			if(response == "giveHK21")
			{
				giveWeap( "hk21_mp" );
			}
			if(response == "giveRPK")
			{
				giveWeap( "rpk_mp" );
			}
			if(response == "giveM60")
			{
				giveWeap( "m60_mp" );
			}
			if(response == "giveSTONER63")
			{
				giveWeap( "stoner63_mp" );
			}
		}
		if(menu == game["overkill_sr"])
		{
			if(response == "giveDRAGUNOV")
			{
				giveWeap( "dragunov_mp" );
			}
			if(response == "giveWA2000")
			{
				giveWeap( "wa2000_mp" );
			}
			if(response == "giveL96A1")
			{
				giveWeap( "l96a1_mp" );
			}
			if(response == "givePSG1")
			{
				giveWeap( "psg1_mp" );
			}
		}
		if(menu == game["overkill_save"])
		{
			if(response == "saveClass")
			{
				self iPrintLnBold ("test");
			}
			if(response == "dontsaveClass")
			{
				self iPrintLnBold ("test");
			}
		}

		/*attachments*/
		if(menu == game["overkill_wa2000"])
		{
			if(response == "giveWA2000ACOG")
			{
				giveWeap( "wa2000_acog_mp");
			}
		}
		wait 0.05;
	}
}