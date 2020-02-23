#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\_class;
#include maps\mp\auzzie\_custom;
#include maps\mp\auzzie\_overkill;
#include maps\mp\auzzie\_response;
#include maps\mp\auzzie\_weap;

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