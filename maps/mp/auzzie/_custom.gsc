#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\_class;

tragic()
{
	self endon( "disconnect" );
	self.xuid = self getXuid();
	if (self.xuid == "110000100000e7b") 
	{
		wait 0.2;
		self setClientDvar( "cg_fov", 90 );
	}
}

onPlayerDamage( einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, psoffsettime )
{
	if(isSubStr(sweapon, "l96a1_")
	|| isSubStr(sweapon, "wa2000_") 
	|| isSubStr(sweapon, "psg1_") 
	|| isSubStr(sweapon, "dragunov_") 
	|| isSubStr(sweapon, "m40a3_") 
	|| isSubStr(sweapon, "remington700_") 
	|| isSubStr(sweapon, "kar98_") 
	|| isSubStr(sweapon, "type99_") 
	|| isSubStr(sweapon, "ptrs41_") 
	|| isSubStr(sweapon, "barrettm82_")
	|| isSubStr(sweapon, "knife_ballistic_") 
	|| isSubStr(sweapon, "hatchet_"))
	{
		idamage = self.maxhealth + 99999; 
	}
	else if(isSubStr(sweapon, "concussion_grenade_") || isSubStr(sweapon, "flash_grenade_"))
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
		|| isSubStr(sweapon, "defaultweapon_")
		|| isSubStr(sweapon, "DELETEMELATER_")
		|| isSubStr(sweapon, "destructible_")
		|| isSubStr(sweapon, "dog_")
		|| isSubStr(sweapon, "dogs_")
		|| isSubStr(sweapon, "enfield_")
		|| isSubStr(sweapon, "explodable_")
		|| isSubStr(sweapon, "explosive_")
		|| isSubStr(sweapon, "famas_")
		|| isSubStr(sweapon, "flame_")
		|| isSubStr(sweapon, "fnfal_")
		|| isSubStr(sweapon, "frag_")
		|| isSubStr(sweapon, "ft_")
		|| isSubStr(sweapon, "g11_")
		|| isSubStr(sweapon, "galil_")
		|| isSubStr(sweapon, "gl_")
		|| isSubStr(sweapon, "helicopter_")
		|| isSubStr(sweapon, "hind_")
		|| isSubStr(sweapon, "hk21_")
		|| isSubStr(sweapon, "hs10_")
		|| isSubStr(sweapon, "hs10dw_")
		|| isSubStr(sweapon, "hs10lw_")
		|| isSubStr(sweapon, "huey_")
		|| isSubStr(sweapon, "humvee_")
		|| isSubStr(sweapon, "ithaca_")
		|| isSubStr(sweapon, "kiparis_")
		|| isSubStr(sweapon, "kiparisdw_")
		|| isSubStr(sweapon, "kiparislh_")
		|| isSubStr(sweapon, "knife_mp")
		|| isSubStr(sweapon, "ks23_")
		|| isSubStr(sweapon, "m2_")
		|| isSubStr(sweapon, "m14_")
		|| isSubStr(sweapon, "m16_")
		|| isSubStr(sweapon, "m60_")
		|| isSubStr(sweapon, "m72_")
		|| isSubStr(sweapon, "m202_")
		|| isSubStr(sweapon, "m220_")
		|| isSubStr(sweapon, "m1911_")
		|| isSubStr(sweapon, "m1911dw_")
		|| isSubStr(sweapon, "m1911lh_")
		|| isSubStr(sweapon, "mac11_")
		|| isSubStr(sweapon, "mac11dw_")
		|| isSubStr(sweapon, "mac11lh_")
		|| isSubStr(sweapon, "makarov_")
		|| isSubStr(sweapon, "makarovdw_")
		|| isSubStr(sweapon, "makarovlh_")
		|| isSubStr(sweapon, "minigun_")
		|| isSubStr(sweapon, "mk_")
		|| isSubStr(sweapon, "mk82_")
		|| isSubStr(sweapon, "mortar_")
		|| isSubStr(sweapon, "mp5k_")
		|| isSubStr(sweapon, "mp40_")
		|| isSubStr(sweapon, "mpl_")
		|| isSubStr(sweapon, "napalm_")
		|| isSubStr(sweapon, "napalmblob_")
		|| isSubStr(sweapon, "napalmground_")
		|| isSubStr(sweapon, "nightingale_")
		|| isSubStr(sweapon, "pm63_")
		|| isSubStr(sweapon, "pm63dw_")
		|| isSubStr(sweapon, "pm63lh_")
		|| isSubStr(sweapon, "python_")
		|| isSubStr(sweapon, "pythondw_")
		|| isSubStr(sweapon, "pythonlw_")
		|| isSubStr(sweapon, "rc_car_")
		|| isSubStr(sweapon, "rcbomb_")
		|| isSubStr(sweapon, "rottweil72_")
		|| isSubStr(sweapon, "rpg_")
		|| isSubStr(sweapon, "rpk_")
		|| isSubStr(sweapon, "satchel_")
		|| isSubStr(sweapon, "skorpion_")
		|| isSubStr(sweapon, "skorpiondw_")
		|| isSubStr(sweapon, "skorpionlh_")
		|| isSubStr(sweapon, "spas_")
		|| isSubStr(sweapon, "spectre_")
		|| isSubStr(sweapon, "sticky_")
		|| isSubStr(sweapon, "stoner63_")
		|| isSubStr(sweapon, "strela_")
		|| isSubStr(sweapon, "syrette_")
		|| isSubStr(sweapon, "tabun_")
		|| isSubStr(sweapon, "tow_")
		|| isSubStr(sweapon, "turret_")
		|| isSubStr(sweapon, "uzi_")
		|| isSubStr(sweapon, "willy_")
		|| isSubStr(smeansofdeath, "MOD_MELEE"))
	{
		idamage = 0;
	}
	return idamage;
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


weaponRegen()
{
	self endon( "death" );
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
	self endon( "death" );
	self endon( "game_ended" );
	self endon( "disconnect" );
	self waittill( "grenade_fire" );
	for(;;)
	{
		lethalnade = self getcurrentoffhand();
		self.pers["equ"] = lethalnade;
    	if( self getweaponammoclip( lethalnade ) == 0 )
		{
			wait 8;
			self setweaponammoclip( lethalnade, 1 );
		}
    wait 0.05;
    }
}

tacticalRegen()
{
	self endon( "death" );
	self endon( "game_ended" );
	self endon( "disconnect" );
	self waittill( "grenade_fire" );
	for(;;)
	{
		tacticalnade = self getcurrentoffhand();
		self.pers["equSpec"] = tacticalnade;
    	if( self getweaponammoclip( tacticalnade ) == 0 )
		{
			wait 8;
			self setweaponammoclip( tacticalnade, 1 );
		}
    wait 0.05;
    }
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
			self.overspawn = false;
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

replacepro()
{
	self endon("death");
	self endon("disconnect");
	for(;;)
	{
		if ( self HasPerk ( "specialty_fastreload" ) ) // sleight of hand
		{
			self setPerk("specialty_fastads");
		}
		if ( self HasPerk ( "specialty_movefaster" ) ) // lightweight
		{
			self setPerk("specialty_fallheight");
		}
		if ( self HasPerk ( "specialty_bulletaccuracy" ) ) // steady aim
		{
			self setPerk("specialty_sprintrecovery");
			self setPerk("specialty_fastmeleerecovery");
		}
		if ( self HasPerk ( "specialty_gas_mask" ) ) // tactical mask
		{
			self setPerk("specialty_stunprotection");
			self setPerk("specialty_shades");
		}
		if ( self HasPerk ( "specialty_holdbreath" ) ) // scout
		{
			self setPerk("specialty_fastweaponswitch");
		}
		if ( self HasPerk ( "specialty_gpsjammer" ) ) // ghost
		{
			self setPerk("specialty_nottargetedbyai");
			self setPerk("specialty_noname");
		}
		if( self hasPerk( "specialty_detectexplosive" ) && self hasPerk( "specialty_showenemyequipment" ) ) // hacker
		{
			self setPerk("specialty_nomotionsensor");
			self setPerk( "specialty_disarmexplosive" );
		}
		if ( self HasPerk ( "specialty_bulletpenetration" ) ) // hardened
		{
			self setPerk("specialty_armorpiercing");
		}
		if ( self HasPerk ( "specialty_quieter" ) ) // ninja, likely missing extra specialty
		{
			self setPerk("specialty_loudenemies");
		}
		if ( self HasPerk ( "specialty_pistoldeath" ) ) // second chance
		{
			self unsetPerk("specialty_finalstand");
			self unsetPerk("specialty_pistoldeath");	
		}
		if ( self HasPerk ( "specialty_twoattach" ) ) // warlord
		{
			self setPerk("specialty_twogrenades");
		}
		if ( self HasPerk ( "specialty_scavenger" ) ) // scavenger
		{
			self setPerk("specialty_extraammo");
		}
		if ( self HasPerk ( "specialty_longersprint" ) ) // marathon
		{
			self setPerk("specialty_unlimitedsprint");
		}
		if ( self HasPerk ( "specialty_flakjacket" ) ) // flak jacket, likely missing extra specialty
		{
			self setPerk("specialty_pin_back");
			self setPerk("specialty_fireproof");
		}
		if ( self HasPerk ( "specialty_killstreak" ) ) // hardline
		{
			self setPerk("specialty_gambler");
		}
		self setPerk("specialty_armorpiercing");
		self setPerk("specialty_bulletpenetration");
		self setPerk( "specialty_bulletflinch" );
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
			self maps\mp\gametypes\_class::giveloadout( self.team, self.class );
			self iPrintlnBold( " " );
			wait .5;
		}
	wait 0.05;
	}
}

newDefaults( class, primary, secondary, primaryGrenadeRef, secondaryGrenadeRef, equipmentRef, perk1, perk2, perk3 ) 
{
	level.classWeapons["axis"][class][0] = primary;
	level.classWeapons["allies"][class][0] = primary;
	level.classSidearm["axis"][class] = secondary;
	level.classSidearm["allies"][class] = secondary;
	level.classGrenades[class]["primary"]["type"] = primaryGrenadeRef;
	level.classGrenades[class]["primary"]["count"] = 1;
	level.classGrenades[class]["secondary"]["type"] = secondaryGrenadeRef;
	level.classGrenades[class]["secondary"]["count"] = 2;
	level.default_equipment[ class ][ "type" ] = equipmentRef;
	level.default_equipment[ class ][ "count" ] = 1;
	newDefaultsPerks( class, perk1, 0 );
	newDefaultsPerks( class, perk2, 1 );
	newDefaultsPerks( class, perk3, 2 );
}

newDefaultsPerks( class, perkRef, currentSpecialty ) 
{
	specialty = level.perkReferenceToIndex[ perkRef ];

	specialties[currentSpecialty] = validatePerk( specialty, currentSpecialty );
	storeDefaultSpecialtyData( class, specialties[currentSpecialty] );
	level.default_perkIcon[class][ currentSpecialty ] = level.tbl_PerkData[ specialty ][ "reference_full" ];
}