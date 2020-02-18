#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\_class;

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

spawntoggle()
{
	self endon("game_ended");
	self endon("disconnect");
	self waittill("spawned_player");
	if(self.overspawn == false)
	{
		self.overspawn = true;		
	}
	else
	{
		self notify( "disableoverspawn" );
		self.overspawn = false;
	}
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
	if (self.overspawn == true)
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
}

menuCont()
{
	self endon("game_ended");
	self endon("disconnect");
	for(;;)
	{
		self waittill("menuresponse", menu, response);
		switch( menu )
		{
/* suicide */
			case "modopt":
				switch( response )
				{
					case "menuSui":
						self Suicide();
						break;
				}
/* overkill spawn settings */
			case "overkill_save":
				switch( response )
				{
					case "saveClass":
						self.overspawn = true;
						self iPrintLn( "- ^1Now spawning with ^0[^3OVERKILL^0]^1 class." );
						break;
					case "dontsaveClass":
						self.overspawn = false;
						self iPrintLn( "- ^1Now spawning with ^0[^3ORIGINAL^0]^1 class." );
						break;
				}
/* camo changer */
			case "camos":
				switch( response )
				{
					case "camoNONE":
						self camoChanger( 0 );
						break;
					case "camoDUSTY":
						self camoChanger( 1 );
						break;
					case "camoICE":
						self camoChanger( 2 );
						break;
					case "camoRED":
						self camoChanger( 3 );
						break;
					case "camoOLIVE":
						self camoChanger( 4 );
						break;
					case "camoNEVADA":
						self camoChanger( 5 );
						break;
					case "camoSAHARA":
						self camoChanger( 6 );
						break;
					case "camoERDL":
						self camoChanger( 7 );
						break;
					case "camoTIGER":
						self camoChanger( 8 );
						break;
					case "camoBERLIN":
						self camoChanger( 9 );
						break;
					case "camoWARSAW":
						self camoChanger( 10 );
						break;
					case "camoSIBERIA":
						self camoChanger( 11 );
						break;
					case "camoYUKON":
						self camoChanger( 12 );
						break;
					case "camoWOODLAND":
						self camoChanger( 13 );
						break;
					case "camoFLORA":
						self camoChanger( 14 );
						break;
					case "camoGOLD":
						self camoChanger( 15 );
						break;
				}
/* submachine guns */
	/* mp5k */
			case "overkill_mp5k":
				switch( response )
				{
					case "giveMP5K":
						giveWeap( "mp5k_mp" );
						break;
					case "giveMP5KEXT":
						giveWeap( "mp5k_extclip_mp" );
						break;
					case "giveMP5KACOG":
						giveWeap( "mp5k_acog_mp" );
						break;
					case "giveMP5KRDS":
						giveWeap( "mp5k_elbit_mp" );
						break;
					case "giveMP5KRFLX":
						giveWeap( "mp5k_reflex_mp" );
						break;
					case "giveMP5KSUP":
						giveWeap( "mp5k_silencer_mp" );
						break;
					case "giveMP5KRF":
						giveWeap( "mp5k_rf_mp" );
						break;
				}
	/* skorpion */
			case "overkill_skorpion":
				switch( response )
				{
					case "giveSKORPION":
						giveWeap( "skorpion_mp" );
						break;
					case "giveSKORPIONEXT":
						giveWeap( "skorpion_extclip_mp" );
						break;
					case "giveSKORPIONGRIP":
						giveWeap( "skorpion_grip_mp" );
						break;
					case "giveSKORPIONDW":
						giveWeap( "skorpiondw_mp" );
						break;
					case "giveSKORPIONSUP":
						giveWeap( "skorpion_silencer_mp" );
						break;
					case "giveSKORPIONRF":
						giveWeap( "skorpion_rf_mp" );
						break;
				}
	/* mac11 */
			case "overkill_mac11":
				switch( response )
				{
					case "giveMAC11":
						giveWeap( "mac11_mp" );
						break;
					case "giveMAC11EXT":
						giveWeap( "mac11_extclip_mp" );
						break;
					case "giveMAC11RDS":
						giveWeap( "mac11_elbit_mp" );
						break;
					case "giveMAC11RFLX":
						giveWeap( "mac11_reflex_mp" );
						break;
					case "giveMAC11GRIP":
						giveWeap( "mac11_grip_mp" );
						break;
					case "giveMAC11DW":
						giveWeap( "mac11dw_mp" );
						break;
					case "giveMAC11SUP":
						giveWeap( "mac11_silencer_mp" );
						break;
					case "giveMAC11RF":
						giveWeap( "mac11_rf_mp" );
						break;
				}
	/* ak74u */
			case "overkill_ak74u":
				switch( response )
				{
					case "giveAK74U":
						giveWeap( "ak74u_mp" );
						break;
					case "giveAK74UEXT":
						giveWeap( "ak74u_extclip_mp" );
						break;
					case "giveAK74UDUAL":
						giveWeap( "ak74u_dualclip_mp" );
						break;
					case "giveAK74UACOG":
						giveWeap( "ak74u_acog_mp" );
						break;
					case "giveAK74URDS":
						giveWeap( "ak74u_elbit_mp" );
						break;
					case "giveAK74URFLX":
						giveWeap( "ak74u_reflex_mp" );
						break;
					case "giveAK74UGRIP":
						giveWeap( "ak74u_grip_mp" );
						break;
					case "giveAK74USUP":
						giveWeap( "ak74u_silencer_mp" );
						break;
					case "giveAK74UGL":
						giveWeap( "ak74u_gl_mp" );
						break;
					case "giveAK74URF":
						giveWeap( "ak74u_rf_mp" );
						break;
				}
	/* uzi */
			case "overkill_uzi":
				switch( response )
				{
					case "giveUZI":
						giveWeap( "uzi_mp" );
						break;
					case "giveUZIEXT":
						giveWeap( "uzi_extclip_mp" );
						break;
					case "giveUZIACOG":
						giveWeap( "uzi_acog_mp" );
						break;
					case "giveUZIRDS":
						giveWeap( "uzi_elbit_mp" );
						break;
					case "giveUZIRFLX":
						giveWeap( "uzi_reflex_mp" );
						break;
					case "giveUZIGRIP":
						giveWeap( "uzi_grip_mp" );
						break;
					case "giveUZISUP":
						giveWeap( "uzi_silencer_mp" );
						break;
					case "giveUZIRF":
						giveWeap( "uzi_rf_mp" );
						break;
				}
	/* pm63 */
			case "overkill_pm63":
				switch( response )
				{
					case "givePM63":
						giveWeap( "pm63_mp" );
						break;
					case "givePM63EXT":
						giveWeap( "pm63_extclip_mp" );
						break;
					case "givePM63GRIP":
						giveWeap( "pm63_grip_mp" );
						break;
					case "givePM63DW":
						giveWeap( "pm63dw_mp" );
						break;
					case "givePM63RF":
						giveWeap( "pm63_rf_mp" );
						break;
				}
	/* mpl */
			case "overkill_mpl":
				switch( response )
				{
					case "giveMPL":
						giveWeap( "mpl_mp" );
						break;
					case "giveMPLDUAL":
						giveWeap( "mpl_dualclip_mp" );
						break;
					case "giveMPLACOG":
						giveWeap( "mpl_acog_mp" );
						break;
					case "giveMPLRDS":
						giveWeap( "mpl_elbit_mp" );
						break;
					case "giveMPLRFLX":
						giveWeap( "mpl_reflex_mp" );
						break;
					case "giveMPLGRIP":
						giveWeap( "mpl_grip_mp" );
						break;
					case "giveMPLSUP":
						giveWeap( "mpl_silencer_mp" );
						break;
					case "giveMPLRF":
						giveWeap( "mpl_rf_mp" );
						break;
				}
	/* spectre */
			case "overkill_spectre":
				switch( response )
				{
					case "giveSPECTRE":
						giveWeap( "spectre_mp" );
						break;
					case "giveSPECTREEXT":
						giveWeap( "spectre_extclip_mp" );
						break;
					case "giveSPECTREACOG":
						giveWeap( "spectre_acog_mp" );
						break;
					case "giveSPECTRERDS":
						giveWeap( "spectre_elbit_mp" );
						break;
					case "giveSPECTRERFLX":
						giveWeap( "spectre_reflex_mp" );
						break;
					case "giveSPECTREGRIP":
						giveWeap( "spectre_grip_mp" );
						break;
					case "giveSPECTRESUP":
						giveWeap( "spectre_silencer_mp" );
						break;
					case "giveSPECTRERF":
						giveWeap( "spectre_rf_mp" );
						break;
				}
	/* kiparis */
			case "overkill_kiparis":
				switch( response )
				{
					case "giveKIPARIS":
						giveWeap( "kiparis_mp" );
						break;
					case "giveKIPARISEXT":
						giveWeap( "kiparis_extclip_mp" );
						break;
					case "giveKIPARISACOG":
						giveWeap( "kiparis_acog_mp" );
						break;
					case "giveKIPARISRDS":
						giveWeap( "kiparis_elbit_mp" );
						break;
					case "giveKIPARISRFLX":
						giveWeap( "kiparis_reflex_mp" );
						break;
					case "giveKIPARISGRIP":
						giveWeap( "kiparis_grip_mp" );
						break;
					case "giveKIPARISDW":
						giveWeap( "kiparisdw_mp" );
						break;
					case "giveKIPARISSUP":
						giveWeap( "kiparis_silencer_mp" );
						break;
					case "giveKIPARISRF":
						giveWeap( "kiparis_rf_mp" );
						break;
				}
	/* mp40 */
			case "overkill_MP40":
				switch( response )
				{
					case "giveMP40":
						giveWeap( "mp40_mp" );
						break;
				}
/* assault rifles */
	/* m16 */
			case "overkill_m16":
				switch( response )
				{
					case "giveM16":
						giveWeap( "m16_mp" );
						break;
					case "giveM16EXT":
						giveWeap( "m16_extclip_mp" );
						break;
					case "giveM16DUAL":
						giveWeap( "m16_dualclip_mp" );
						break;
					case "giveM16ACOG":
						giveWeap( "m16_acog_mp" );
						break;
					case "giveM16RDS":
						giveWeap( "m16_elbit_mp" );
						break;
					case "giveM16RFLX":
						giveWeap( "m16_reflex_mp" );
						break;
					case "giveM16MK":
						giveWeap( "m16_mk_mp" );
						break;
					case "giveM16FT":
						giveWeap( "m16_ft_mp" );
						break;
					case "giveM16IR":
						giveWeap( "m16_ir_mp" );
						break;
					case "giveM16SUP":
						giveWeap( "m16_silencer_mp" );
						break;
					case "giveM16GL":
						giveWeap( "m16_gl_mp" );
						break;
				}
	/* enfield */
			case "overkill_enfield":
				switch( response )
				{
					case "giveENFIELD":
						giveWeap( "enfield_mp" );
						break;
					case "giveENFIELDEXT":
						giveWeap( "enfield_extclip_mp" );
						break;
					case "giveENFIELDDUAL":
						giveWeap( "enfield_dualclip_mp" );
						break;
					case "giveENFIELDACOG":
						giveWeap( "enfield_acog_mp" );
						break;
					case "giveENFIELDRDS":
						giveWeap( "enfield_elbit_mp" );
						break;
					case "giveENFIELDRFLX":
						giveWeap( "enfield_reflex_mp" );
						break;
					case "giveENFIELDMK":
						giveWeap( "enfield_mk_mp" );
						break;
					case "giveENFIELDFT":
						giveWeap( "enfield_ft_mp" );
						break;
					case "giveENFIELDIR":
						giveWeap( "enfield_ir_mp" );
						break;
					case "giveENFIELDSUP":
						giveWeap( "enfield_silencer_mp" );
						break;
					case "giveENFIELDGL":
						giveWeap( "enfield_gl_mp" );
						break;
				}
	/* m14 */
			case "overkill_m14":
				switch( response )
				{
					case "giveM14":
						giveWeap( "m14_mp" );
						break;
					case "giveM14EXT":
						giveWeap( "m14_extclip_mp" );
						break;
					case "giveM14ACOG":
						giveWeap( "m14_acog_mp" );
						break;
					case "giveM14RDS":
						giveWeap( "m14_elbit_mp" );
						break;
					case "giveM14RFLX":
						giveWeap( "m14_reflex_mp" );
						break;
					case "giveM14GRIP":
						giveWeap( "m14_grip_mp" );
						break;
					case "giveM14MK":
						giveWeap( "m14_mk_mp" );
						break;
					case "giveM14FT":
						giveWeap( "m14_ft_mp" );
						break;
					case "giveM14IR":
						giveWeap( "m14_ir_mp" );
						break;
					case "giveM14SUP":
						giveWeap( "m14_silencer_mp" );
						break;
					case "giveM14GL":
						giveWeap( "m14_gl_mp" );
						break;
				}
	/* famas */
			case "overkill_famas":
				switch( response )
				{
					case "giveFAMAS":
						giveWeap( "famas_mp" );
						break;
					case "giveFAMASEXT":
						giveWeap( "famas_extclip_mp" );
						break;
					case "giveFAMASDUAL":
						giveWeap( "famas_dualclip_mp" );
						break;
					case "giveFAMASACOG":
						giveWeap( "famas_acog_mp" );
						break;
					case "giveFAMASRDS":
						giveWeap( "famas_elbit_mp" );
						break;
					case "giveFAMASRFLX":
						giveWeap( "famas_reflex_mp" );
						break;
					case "giveFAMASMK":
						giveWeap( "famas_mk_mp" );
						break;
					case "giveFAMASFT":
						giveWeap( "famas_ft_mp" );
						break;
					case "giveFAMASIR":
						giveWeap( "famas_ir_mp" );
						break;
					case "giveFAMASSUP":
						giveWeap( "famas_silencer_mp" );
						break;
					case "giveFAMASGL":
						giveWeap( "famas_gl_mp" );
						break;
				}
	/* galil */
			case "overkill_galil":
				switch( response )
				{
					case "giveGALIL":
						giveWeap( "galil_mp" );
						break;
					case "giveGALILEXT":
						giveWeap( "galil_extclip_mp" );
						break;
					case "giveGALILDUAL":
						giveWeap( "galil_dualclip_mp" );
						break;
					case "giveGALILACOG":
						giveWeap( "galil_acog_mp" );
						break;
					case "giveGALILRDS":
						giveWeap( "galil_elbit_mp" );
						break;
					case "giveGALILRFLX":
						giveWeap( "galil_reflex_mp" );
						break;
					case "giveGALILMK":
						giveWeap( "galil_mk_mp" );
						break;
					case "giveGALILFT":
						giveWeap( "galil_ft_mp" );
						break;
					case "giveGALILIR":
						giveWeap( "galil_ir_mp" );
						break;
					case "giveGALILSUP":
						giveWeap( "galil_silencer_mp" );
						break;
					case "giveGALILGL":
						giveWeap( "galil_gl_mp" );
						break;
				}
	/* aug */
			case "overkill_aug":
				switch( response )
				{
					case "giveAUG":
						giveWeap( "aug_mp" );
						break;
					case "giveAUGEXT":
						giveWeap( "aug_extclip_mp" );
						break;
					case "giveAUGDUAL":
						giveWeap( "aug_dualclip_mp" );
						break;
					case "giveAUGACOG":
						giveWeap( "aug_acog_mp" );
						break;
					case "giveAUGRDS":
						giveWeap( "aug_elbit_mp" );
						break;
					case "giveAUGRFLX":
						giveWeap( "aug_reflex_mp" );
						break;
					case "giveAUGMK":
						giveWeap( "aug_mk_mp" );
						break;
					case "giveAUGFT":
						giveWeap( "aug_ft_mp" );
						break;
					case "giveAUGIR":
						giveWeap( "aug_ir_mp" );
						break;
					case "giveAUGSUP":
						giveWeap( "aug_silencer_mp" );
						break;
					case "giveAUGGL":
						giveWeap( "aug_gl_mp" );
						break;
				}
	/* fn fal */
			case "overkill_fnfal":
				switch( response )
				{
					case "giveFNFAL":
						giveWeap( "fnfal_mp" );
						break;
					case "giveFNFALEXT":
						giveWeap( "fnfal_extclip_mp" );
						break;
					case "giveFNFALDUAL":
						giveWeap( "fnfal_dualclip_mp" );
						break;
					case "giveFNFALACOG":
						giveWeap( "fnfal_acog_mp" );
						break;
					case "giveFNFALRDS":
						giveWeap( "fnfal_elbit_mp" );
						break;
					case "giveFNFALRFLX":
						giveWeap( "fnfal_reflex_mp" );
						break;
					case "giveFNFALMK":
						giveWeap( "fnfal_mk_mp" );
						break;
					case "giveFNFALFT":
						giveWeap( "fnfal_ft_mp" );
						break;
					case "giveFNFALIR":
						giveWeap( "fnfal_ir_mp" );
						break;
					case "giveFNFALSUP":
						giveWeap( "fnfal_silencer_mp" );
						break;
					case "giveFNFALGL":
						giveWeap( "fnfal_gl_mp" );
						break;
				}
	/* ak47 */
			case "overkill_ak47":
				switch( response )
				{
					case "giveAK47":
						giveWeap( "ak47_mp" );
						break;
					case "giveAK47EXT":
						giveWeap( "ak47_extclip_mp" );
						break;
					case "giveAK47DUAL":
						giveWeap( "ak47_dualclip_mp" );
						break;
					case "giveAK47ACOG":
						giveWeap( "ak47_acog_mp" );
						break;
					case "giveAK47RDS":
						giveWeap( "ak47_elbit_mp" );
						break;
					case "giveAK47RFLX":
						giveWeap( "ak47_reflex_mp" );
						break;
					case "giveAK47MK":
						giveWeap( "ak47_mk_mp" );
						break;
					case "giveAK47FT":
						giveWeap( "ak47_ft_mp" );
						break;
					case "giveAK47IR":
						giveWeap( "ak47_ir_mp" );
						break;
					case "giveAK47SUP":
						giveWeap( "ak47_silencer_mp" );
						break;
					case "giveAK47Gl":
						giveWeap( "ak47_gl_mp" );
						break;
				}
	/* commando */
			case "overkill_commando":
				switch( response )
				{
					case "giveCOMMANDO":
						giveWeap( "commando_mp" );
						break;
					case "giveCOMMANDOEXT":
						giveWeap( "commando_extclip_mp" );
						break;
					case "giveCOMMANDODUAL":
						giveWeap( "commando_dualclip_mp" );
						break;
					case "giveCOMMANDOACOG":
						giveWeap( "commando_acog_mp" );
						break;
					case "giveCOMMANDORDS":
						giveWeap( "commando_elbit_mp" );
						break;
					case "giveCOMMANDORFLX":
						giveWeap( "commando_reflex_mp" );
						break;
					case "giveCOMMANDOMK":
						giveWeap( "commando_mk_mp" );
						break;
					case "giveCOMMANDOFT":
						giveWeap( "commando_ft_mp" );
						break;
					case "giveCOMMANDOIR":
						giveWeap( "commando_ir_mp" );
						break;
					case "giveCOMMANDOSUP":
						giveWeap( "commando_silencer_mp" );
						break;
					case "giveCOMMANDOGL":
						giveWeap( "commando_gl_mp" );
						break;
				}
	/* g11 */
			case "overkill_g11":
				switch( response )
				{
					case "giveG11":
						giveWeap( "g11_mp" );
						break;
					case "giveG11LOW":
						giveWeap( "g11_lps_mp" );
						break;
					case "giveG11VAR":
						giveWeap( "g11_vzoom_mp" );
						break;
				}
/* shotguns */
	/* olympia */
			case "overkill_olympia":
				switch( response )
				{
					case "giveOLYMPIA":
						giveWeap( "rottweil72_mp" );
						break;
				}
	/* stakeout */
			case "overkill_STAKEOUT":
				switch( response )
				{
					case "giveSTAKEOUT":
						giveWeap( "ithaca_mp" );
						break;
					case "giveSTAKEOUTGRIP":
						giveWeap( "ithaca_grip_mp" );
						break;
				}
	/* spas-12 */
			case "overkill_SPAS12":
				switch( response )
				{
					case "giveSPAS12":
						giveWeap( "spas_mp" );
						break;
					case "giveSPAS12SUP":
						giveWeap( "spas_silencer_mp" );
						break;
				}
	/* hs10 */
			case "overkill_HS10":
				switch( response )
				{
					case "giveHS10":
						giveWeap( "hs10_mp" );
						break;
					case "giveHS10DW":
						giveWeap( "hs10dw_mp" );
						break;
				}
	/* m1897 trench gun */
			case "overkill_M1897":
				switch( response )
				{
					case "giveM1897":
						giveWeap( "trenchgun_mp" );
						break;
				}
/* light machine guns */
	/* hk21 */
			case "overkill_hk21":
				switch( response )
				{
					case "giveHK21":
						giveWeap( "hk21_mp" );
						break;
					case "giveHK21EXT":
						giveWeap( "hk21_extclip_mp" );
						break;
					case "giveHK21ACOG":
						giveWeap( "hk21_acog_mp" );
						break;
					case "giveHK21RDS":
						giveWeap( "hk21_elbit_mp" );
						break;
					case "giveHK21RFLX":
						giveWeap( "hk21_reflex_mp" );
						break;
					case "giveHK21IR":
						giveWeap( "hk21_ir_mp" );
						break;
				}
	/* rpk */
			case "overkill_rpk":
				switch( response )
				{
					case "giveRPK":
						giveWeap( "rpk_mp" );
						break;
					case "giveRPKEXT":
						giveWeap( "rpk_extclip_mp" );
						break;
					case "giveRPKDUAL":
						giveWeap( "rpk_dualclip_mp" );
						break;
					case "giveRPKACOG":
						giveWeap( "rpk_acog_mp" );
						break;
					case "giveRPKRDS":
						giveWeap( "rpk_elbit_mp" );
						break;
					case "giveRPKRFLX":
						giveWeap( "rpk_reflex_mp" );
						break;
					case "giveRPKIR":
						giveWeap( "rpk_ir_mp" );
						break;
				}
	/* m60 */
			case "overkill_m60":
				switch( response )
				{
					case "giveM60":
						giveWeap( "m60_mp" );
						break;
					case "giveM60EXT":
						giveWeap( "m60_extclip_mp" );
						break;
					case "giveM60ACOG":
						giveWeap( "m60_acog_mp" );
						break;
					case "giveM60RDS":
						giveWeap( "m60_elbit_mp" );
						break;
					case "giveM60RFLX":
						giveWeap( "m60_reflex_mp" );
						break;
					case "giveM60GRIP":
						giveWeap( "m60_grip_mp" );
						break;
					case "giveM60IR":
						giveWeap( "m60_ir_mp" );
						break;
				}
	/* stoner63 */
			case "overkill_stoner63":
				switch( response )
				{
					case "giveSTONER63":
						giveWeap( "stoner63_mp" );
						break;
					case "giveSTONER63EXT":
						giveWeap( "stoner63_extclip_mp" );
						break;
					case "giveSTONER63ACOG":
						giveWeap( "stoner63_acog_mp" );
						break;
					case "giveSTONER63RDS":
						giveWeap( "stoner63_elbit_mp" );
						break;
					case "giveSTONER63RFLX":
						giveWeap( "stoner63_reflex_mp" );
						break;
					case "giveSTONER63IR":
						giveWeap( "stoner63_ir_mp" );
						break;
				}
/* sniper rifles */
	/* dragunov */
			case "overkill_dragunov":
				switch( response )
				{
					case "giveDRAGUNOV":
						giveWeap( "dragunov_mp" );
						break;
					case "giveDRAGUNOVEXT":
						giveWeap( "dragunov_extclip_mp" );
						break;
					case "giveDRAGUNOVACOG":
						giveWeap( "dragunov_acog_mp" );
						break;
					case "giveDRAGUNOVIR":
						giveWeap( "dragunov_ir_mp" );
						break;
					case "giveDRAGUNOVSUP":
						giveWeap( "dragunov_silencer_mp" );
						break;
					case "giveDRAGUNOVVAR":
						giveWeap( "dragunov_vzoom_mp" );
						break;
				}
	/* wa2000 */
			case "overkill_wa2000":
				switch( response )
				{
					case "giveWA2000":
						giveWeap( "wa2000_mp" );
						break;
					case "giveWA2000EXT":
						giveWeap( "wa2000_extclip_mp" );
						break;
					case "giveWA2000ACOG":
						giveWeap( "wa2000_acog_mp" );
						break;
					case "giveWA2000IR":
						giveWeap( "wa2000_ir_mp" );
						break;
					case "giveWA2000SUP":
						giveWeap( "wa2000_silencer_mp" );
						break;
					case "giveWA2000VAR":
						giveWeap( "wa2000_vzoom_mp" );
						break;
				}
	/* l96a1 */
			case "overkill_l96a1":
				switch( response )
				{
					case "giveL96A1":
						giveWeap( "l96a1_mp" );
						break;
					case "giveL96A1EXT":
						giveWeap( "l96a1_extclip_mp" );
						break;
					case "giveL96A1ACOG":
						giveWeap( "l96a1_acog_mp" );
						break;
					case "giveL96A1IR":
						giveWeap( "l96a1_ir_mp" );
						break;
					case "giveL96A1SUP":
						giveWeap( "l96a1_silencer_mp" );
						break;
					case "giveL96A1VAR":
						giveWeap( "l96a1_vzoom_mp" );
						break;
				}
	/* psg1 */
			case "overkill_psg1":
				switch( response )
				{
					case "givePSG1":
						giveWeap( "psg1_mp" );
						break;
					case "givePSG1EXT":
						giveWeap( "psg1_extclip_mp" );
						break;
					case "givePSG1ACOG":
						giveWeap( "psg1_acog_mp" );
						break;
					case "givePSG1IR":
						giveWeap( "psg1_ir_mp" );
						break;
					case "givePSG1SUP":
						giveWeap( "psg1_silencer_mp" );
						break;
					case "givePSG1VAR":
						giveWeap( "psg1_vzoom_mp" );
						break;
				}
	/* m40a3 */
			case "overkill_m40a3":
				switch( response )
				{
					case "giveM40A3":
						giveWeap( "m40a3_mp" );
						break;
					case "giveM40A3ACOG":
						giveWeap( "m40a3_acog_mp" );
						break;
				}
	/* r700 */
			case "overkill_r700":
				switch( response )
				{
					case "giveR700":
						giveWeap( "remington700_mp" );
						break;
					case "giveR700ACOG":
						giveWeap( "remington700_acog_mp" );
						break;
				}
	/* kar98 */
			case "overkill_KAR98":
				switch( response )
				{
					case "giveKAR98":
						giveWeap( "kar98_mp" );
						break;
					case "giveKAR98S":
						giveWeap( "kar98_scoped_mp" );
						break;
				}
	/* arisaka */
			case "overkill_ARISAKA":
				switch( response )
				{
					case "giveARISAKA":
						giveWeap( "type99_mp" );
						break;
					case "giveARISAKAS":
						giveWeap( "type99_scoped_mp" );
						break;
				}
	/* ptrs */
			case "overkill_PTRS":
				switch( response )
				{
					case "givePTRS":
						giveWeap( "ptrs41_mp" );
						break;
				}
	/* barrett m82 */
			case "overkill_BARRETT":
				switch( response )
				{
					case "giveBARRETT":
						giveWeap( "barrettm82_mp" );
						break;
				}

/*other weapons*/
	/* default weapon */
			case "overkill_misc":
				switch( response )
				{
					case "giveDEFWEAPON":
						giveWeap( "defaultweapon_mp" );
						break;
				}
		}
	}
}