#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;

onPlayerDamage( einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, psoffsettime )
{
	if(isSubStr(sweapon, "l96a1_") || isSubStr(sweapon, "wa2000_") || isSubStr(sweapon, "psg1_"))
	{
		idamage = self.maxhealth + 99999; 
	}
	else if(isSubStr(sweapon, "concussion_grenade_") || isSubStr(sweapon, "proximity_grenade_"))
	{
		idamage = 0.001; 
	}
	else if(isSubStr(sweapon, "airstrike_") // damage restriction table
		|| isSubStr(sweapon, "ak47_") 
		|| isSubStr(sweapon, "ak74u_") 
		|| isSubStr(sweapon, "asp_") 
		|| isSubStr(sweapon, "aspdw_") 
		|| isSubStr(sweapon, "asplh_") 
		|| isSubStr(sweapon, "aug_") 
		|| isSubStr(sweapon, "auto_") 
		|| isSubStr(sweapon, "autoturret_") 
		|| isSubStr(sweapon, "berlinwall_") 
		|| isSubStr(sweapon, "bomber_") 
		|| isSubStr(sweapon, "briefcase_") 
		|| isSubStr(sweapon, "china_lake_")
		|| isSubStr(sweapon, "claymore_")
		|| isSubStr(sweapon, "cobra_")
		|| isSubStr(sweapon, "commando_")
		|| isSubStr(sweapon, "crossbow_")
		|| isSubStr(sweapon, "cz75_")
		|| isSubStr(sweapon, "cz75dw_")
		|| isSubStr(sweapon, "cz75lh_")
		|| isSubStr(sweapon, "fiveseven_")
		|| isSubStr(sweapon, "fnp45_")
		|| isSubStr(sweapon, "frag_grenade_")
		|| isSubStr(sweapon, "gl_")
		|| isSubStr(sweapon, "hamr_")
		|| isSubStr(sweapon, "heli_gunner_rockets_")
		|| isSubStr(sweapon, "helicopter_")
		|| isSubStr(sweapon, "hk416_")
		|| isSubStr(sweapon, "insas_")
		|| isSubStr(sweapon, "inventory_")
		|| isSubStr(sweapon, "judge_")
		|| isSubStr(sweapon, "kard_")
		|| isSubStr(sweapon, "killstreak_")
		|| isSubStr(sweapon, "knife_held_")
		|| isSubStr(sweapon, "knife_mp")
		|| isSubStr(sweapon, "ksg_")
		|| isSubStr(sweapon, "littlebird_guard_minigun_")
		|| isSubStr(sweapon, "lsat_")
		|| isSubStr(sweapon, "m32_")
		|| isSubStr(sweapon, "microwave_turret_")
		|| isSubStr(sweapon, "microwaveturret_")
		|| isSubStr(sweapon, "minigun_")
		|| isSubStr(sweapon, "missile_drone_")
		|| isSubStr(sweapon, "missile_swarm_")
		|| isSubStr(sweapon, "mk48_")
		|| isSubStr(sweapon, "mp7_")
		|| isSubStr(sweapon, "pdw57_")
		|| isSubStr(sweapon, "peacekeeper_")
		|| isSubStr(sweapon, "planemortar_")
		|| isSubStr(sweapon, "qbb95_")
		|| isSubStr(sweapon, "qcw05_")
		|| isSubStr(sweapon, "qrdrone_turret_")
		|| isSubStr(sweapon, "rc_car_weapon_")
		|| isSubStr(sweapon, "rcbomb_")
		|| isSubStr(sweapon, "remote_missile_")
		|| isSubStr(sweapon, "riotshield_")
		|| isSubStr(sweapon, "sa58_")
		|| isSubStr(sweapon, "saiga12_")
		|| isSubStr(sweapon, "saritch_")
		|| isSubStr(sweapon, "satchel_charge_")
		|| isSubStr(sweapon, "scar_")
		|| isSubStr(sweapon, "sensor_grenade_")
		|| isSubStr(sweapon, "sf_")
		|| isSubStr(sweapon, "sig556_")
		|| isSubStr(sweapon, "smaw_")
		|| isSubStr(sweapon, "srm1216_")
		|| isSubStr(sweapon, "sticky_grenade_")
		|| isSubStr(sweapon, "straferun_")
		|| isSubStr(sweapon, "svu_")
		|| isSubStr(sweapon, "tar21_")
		|| isSubStr(sweapon, "turret_drop_")
		|| isSubStr(sweapon, "type95_")
		|| isSubStr(sweapon, "usrpg_")
		|| isSubStr(sweapon, "vector_")
		|| isSubStr(sweapon, "xm8_")
		|| isSubStr(smeansofdeath, "MOD_MELEE"))
	{
		idamage = 0;
	}
	return idamage;
}

itemBans()
{
	self endon ( "death" );
	self endon( "game_ended" );
	self endon( "disconnect" );
	for(;;)
	{
		currentweapon = self getCurrentWeapon();
		if(isSubStr(currentweapon, "as50_mp+acog"))
		{
			self iPrintLnBold( "^6THIS WEAPON IS ^3RESTRICTED");
			wait 1;
			self takeWeapon( currentweapon );
    		self giveWeapon( "knife_held_mp" );
    		self switchToWeapon( "knife_held_mp" );
		}
	wait 0.05;
	}
}

weaponRegen()
{
	self endon ("death");
	self endon( "game_ended" );
	self endon( "disconnect" );
    self waittill( "weapon_fired" );
    for(;;)
    {
        wait 8;
        currentWeapon = self getcurrentweapon();
        self setweaponammostock( currentWeapon, weaponmaxammo(currentWeapon) );
    }
    wait 0.05;
}

lethalRegen()
{
	self endon ( "death" );
	self endon( "game_ended" );
	self endon( "disconnect" );
	self waittill( "grenade_fire" );
	for(;;)
	{
		lethal = self getcurrentoffhand();
		self.pers["equ"] = lethal;
    	if( self getweaponammoclip( lethal ) == 0 )
		{
			wait 8;
			self setweaponammoclip( lethal, 1 );
		}
    wait 0.05;
    }
}

tacticalRegen()
{
	self endon ( "death" );
	self endon( "game_ended" );
	self endon( "disconnect" );
	self waittill( "grenade_fire" );
	for(;;)
	{
		tactical = self getcurrentoffhand();
		self.pers["equSpec"] = tactical;
    	if( self getweaponammoclip( tactical ) == 0 )
		{
			wait 8;
			self setweaponammoclip( tactical, 1 );
		}
    wait 0.05;
    }
}

buttonHandler()
{
	self endon ( "disconnect" );
	self endon( "game_ended" );
	for(;;)
	{
		if(self actionslotthreebuttonpressed() && self actionslotonebuttonpressed())
		{
			self notify ( "canswap" );
		}
		else if(self actionslotthreebuttonpressed() && self actionslottwobuttonpressed())
		{
			self notify ( "suicide" );
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
			self iprintln( "^1auzziemod T5 ^0[^31.0^0]" );
			self iprintln( "^1Join the Discord at ^0[^3discord.io/aupluto^0]." );
			self iprintln( "- ^1Press ^0[^3[{+actionslot 3}]^0]^7 + ^0[^3[{+actionslot 1}]^0]^1 for a canswap." );
			self iprintln( "- ^1Press ^0[^3[{+actionslot 3}]^0]^7 + ^0[^3[{+actionslot 2}]^0]^1 to suicide." );
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
			self iPrintlnBold( "^1YOU'RE AT 29. ^3TRICKSHOT OR BE KICKED." );
			break;
		}
	wait 0.05;
	}
}


canswap()
{
	self endon( "disconnect" );
	self endon( "death" );
	self endon( "game_ended" );
	for(;;) 
	{
		self waittill ( "canswap" );
		wait 0.2;
		self.weap = self getcurrentweapon();
		self TakeWeapon( self getcurrentweapon());
		wait 0.3;
		self giveWeapon( self.weap );	
	wait 0.05;
	}
}

suicide()
{
	self endon( "death" );
	self endon( "disconnect" );
	self endon( "game_ended" );
	for(;;) 
	{
		self waittill ( "suicide" );
		wait 0.3;
		self suicide();
	wait 0.05;
	}
}
