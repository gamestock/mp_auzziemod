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
	if(self.overspawn == false)
	{
		self thread setSpawnClass();
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
	self endon("game_ended");
	self endon("disconnect");
	if (self.overspawn == true)
	{
		self endon( "disableoverspawn" );
		wait 0.01;
		self takeAllWeapons();
		self giveWeapon( self.overweap, 0, self calcWeaponOptions ( randomIntRange( 0, 15 ), 0, 0, 0, 0 ));
		self giveWeapon( self.weap, 0, self calcWeaponOptions ( randomIntRange( 0, 15 ), 0, 0, 0, 0 ));
		self giveWeapon( self.nade );
		self giveWeapon( "knife_mp" );
		self giveWeapon( "concussion_grenade_mp" );
    	self givemaxammo( "concussion_grenade_mp" );
		self switchToWeapon( self.weap );
		self thread maps\mp\auzzie\_custom::replacepro();
		self thread giveEqu();
	}
	else
	{
		self maps\mp\gametypes\_class::giveloadout( self.team, self.class );
		self thread maps\mp\auzzie\_custom::replacepro();
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

overkill()
{
	self endon("game_ended");
	self endon("disconnect");
	self endon("disconnect");
	for(;;)
	{
		self waittill("menuresponse", menu, response);
		if(menu == game["modopt"])
		{
			if(response == "menuSui")
			{
				self Suicide();
			}
		}
		if(menu == game["overkill_save"])
		{
			if(response == "saveClass")
			{
				self.overspawn = true;
				self iPrintLn( "- ^1Now spawning with ^0[^3OVERKILL^0]^1 class." );
			}
			if(response == "dontsaveClass")
			{
				self.overspawn = false;
				self iPrintLn( "- ^1Now spawning with ^0[^3ORIGINAL^0]^1 class." );				
			}
		}
	/*camo changer*/
		if(menu == game["camos"])
		{
			if(response == "camoNONE")
			{
				self camoChanger( 0 );
			}
			if(response == "camoDUSTY")
			{
				self camoChanger( 1 );
			}
			if(response == "camoICE")
			{
				self camoChanger( 2 );
			}
			if(response == "camoRED")
			{
				self camoChanger( 3 );
			}
			if(response == "camoOLIVE")
			{
				self camoChanger( 4 );
			}
			if(response == "camoNEVADA")
			{
				self camoChanger( 5 );
			}
			if(response == "camoSAHARA")
			{
				self camoChanger( 6 );
			}
			if(response == "camoERDL")
			{
				self camoChanger( 7 );
			}
			if(response == "camoTIGER")
			{
				self camoChanger( 8 );
			}
			if(response == "camoBERLIN")
			{
				self camoChanger( 9 );
			}
			if(response == "camoWARSAW")
			{
				self camoChanger( 10 );
			}
			if(response == "camoSIBERIA")
			{
				self camoChanger( 11 );
			}
			if(response == "camoYUKON")
			{
				self camoChanger( 12 );
			}
			if(response == "camoWOODLAND")
			{
				self camoChanger( 13 );
			}
			if(response == "camoFLORA")
			{
				self camoChanger( 14 );
			}
			if(response == "camoGOLD")
			{
				self camoChanger( 15 );
			}
		}


	/*submachine guns*/
		if(menu == game["overkill_mp5k"])
		{
			if(response == "giveMP5K")
			{
				giveWeap( "mp5k_mp" );
			}
			if(response == "giveMP5KEXT")
			{
				giveWeap( "mp5k_extclip_mp");
			}
			if(response == "giveMP5KACOG")
			{
				giveWeap( "mp5k_acog_mp");
			}
			if(response == "giveMP5KRDS")
			{
				giveWeap( "mp5k_elbit_mp");
			}
			if(response == "giveMP5KRFLX")
			{
				giveWeap( "mp5k_reflex_mp");
			}
			if(response == "giveMP5KSUP")
			{
				giveWeap( "mp5k_silencer_mp");
			}
			if(response == "giveMP5KRF")
			{
				giveWeap( "mp5k_rf_mp");
			}
		}
		if(menu == game["overkill_skorpion"])
		{
			if(response == "giveSKORPION")
			{
				giveWeap( "skorpion_mp" );
			}
			if(response == "giveSKORPIONEXT")
			{
				giveWeap( "skorpion_extclip_mp");
			}
			if(response == "giveSKORPIONGRIP")
			{
				giveWeap( "skorpion_grip_mp");
			}
			if(response == "giveSKORPIONDW")
			{
				giveWeap( "skorpiondw_mp");
			}
			if(response == "giveSKORPIONSUP")
			{
				giveWeap( "skorpion_silencer_mp");
			}
			if(response == "giveSKORPIONRF")
			{
				giveWeap( "skorpion_rf_mp");
			}
		}
		if(menu == game["overkill_mac11"])
		{
			if(response == "giveMAC11")
			{
				giveWeap( "mac11_mp" );
			}
			if(response == "giveMAC11EXT")
			{
				giveWeap( "mac11_extclip_mp");
			}
			if(response == "giveMAC11RDS")
			{
				giveWeap( "mac11_elbit_mp");
			}
			if(response == "giveMAC11RFLX")
			{
				giveWeap( "mac11_reflex_mp");
			}
			if(response == "giveMAC11GRIP")
			{
				giveWeap( "mac11_grip_mp");
			}
			if(response == "giveMAC11DW")
			{
				giveWeap( "mac11dw_mp");
			}
			if(response == "giveMAC11SUP")
			{
				giveWeap( "mac11_silencer_mp");
			}
			if(response == "giveMAC11RF")
			{
				giveWeap( "mac11_rf_mp");
			}
		}
		if(menu == game["overkill_ak74u"])
		{
			if(response == "giveAK74U")
			{
				giveWeap( "ak74u_mp" );
			}
			if(response == "giveAK74UEXT")
			{
				giveWeap( "ak74u_extclip_mp");
			}
			if(response == "giveAK74UDUAL")
			{
				giveWeap( "ak74u_dualclip_mp");
			}
			if(response == "giveAK74UACOG")
			{
				giveWeap( "ak74u_acog_mp");
			}
			if(response == "giveAK74URDS")
			{
				giveWeap( "ak74u_elbit_mp");
			}
			if(response == "giveAK74URFLX")
			{
				giveWeap( "ak74u_reflex_mp");
			}
			if(response == "giveAK74UGRIP")
			{
				giveWeap( "ak74u_grip_mp");
			}
			if(response == "giveAK74USUP")
			{
				giveWeap( "ak74u_silencer_mp");
			}
			if(response == "giveAK74UGL")
			{
				giveWeap( "ak74u_gl_mp");
			}
			if(response == "giveAK74URF")
			{
				giveWeap( "ak74u_rf_mp");
			}
		}
		if(menu == game["overkill_uzi"])
		{
			if(response == "giveUZI")
			{
				giveWeap( "uzi_mp" );
			}
			if(response == "giveUZIEXT")
			{
				giveWeap( "uzi_extclip_mp");
			}
			if(response == "giveUZIACOG")
			{
				giveWeap( "uzi_acog_mp");
			}
			if(response == "giveUZIRDS")
			{
				giveWeap( "uzi_elbit_mp");
			}
			if(response == "giveUZIRFLX")
			{
				giveWeap( "uzi_reflex_mp");
			}
			if(response == "giveUZIGRIP")
			{
				giveWeap( "uzi_grip_mp");
			}
			if(response == "giveUZISUP")
			{
				giveWeap( "uzi_silencer_mp");
			}
			if(response == "giveUZIRF")
			{
				giveWeap( "uzi_rf_mp");
			}
		}
		if(menu == game["overkill_pm63"])
		{
			if(response == "givePM63")
			{
				giveWeap( "pm63_mp" );
			}
			if(response == "givePM63EXT")
			{
				giveWeap( "pm63_extclip_mp");
			}
			if(response == "givePM63GRIP")
			{
				giveWeap( "pm63_grip_mp");
			}
			if(response == "givePM63DW")
			{
				giveWeap( "pm63dw_mp");
			}
			if(response == "givePM63RF")
			{
				giveWeap( "pm63_rf_mp");
			}
		}
		if(menu == game["overkill_mpl"])
		{
			if(response == "giveMPL")
			{
				giveWeap( "mpl_mp" );
			}
			if(response == "giveMPLDUAL")
			{
				giveWeap( "mpl_dualclip_mp");
			}
			if(response == "giveMPLACOG")
			{
				giveWeap( "mpl_acog_mp");
			}
			if(response == "giveMPLRDS")
			{
				giveWeap( "mpl_elbit_mp");
			}
			if(response == "giveMPLRFLX")
			{
				giveWeap( "mpl_reflex_mp");
			}
			if(response == "giveMPLGRIP")
			{
				giveWeap( "mpl_grip_mp");
			}
			if(response == "giveMPLSUP")
			{
				giveWeap( "mpl_silencer_mp");
			}
			if(response == "giveMPLRF")
			{
				giveWeap( "mpl_rf_mp");
			}
		}
		if(menu == game["overkill_spectre"])
		{
			if(response == "giveSPECTRE")
			{
				giveWeap( "spectre_mp" );
			}
			if(response == "giveSPECTREEXT")
			{
				giveWeap( "spectre_extclip_mp");
			}
			if(response == "giveSPECTREACOG")
			{
				giveWeap( "spectre_acog_mp");
			}
			if(response == "giveSPECTRERDS")
			{
				giveWeap( "spectre_elbit_mp");
			}
			if(response == "giveSPECTRERFLX")
			{
				giveWeap( "spectre_reflex_mp");
			}
			if(response == "giveSPECTREGRIP")
			{
				giveWeap( "spectre_grip_mp");
			}
			if(response == "giveSPECTRESUP")
			{
				giveWeap( "spectre_silencer_mp");
			}
			if(response == "giveSPECTRERF")
			{
				giveWeap( "spectre_rf_mp");
			}
		}
		if(menu == game["overkill_kiparis"])
		{
			if(response == "giveKIPARIS")
			{
				giveWeap( "kiparis_mp" );
			}
			if(response == "giveKIPARISEXT")
			{
				giveWeap( "kiparis_extclip_mp");
			}
			if(response == "giveKIPARISACOG")
			{
				giveWeap( "kiparis_acog_mp");
			}
			if(response == "giveKIPARISRDS")
			{
				giveWeap( "kiparis_elbit_mp");
			}
			if(response == "giveKIPARISRFLX")
			{
				giveWeap( "kiparis_reflex_mp");
			}
			if(response == "giveKIPARISGRIP")
			{
				giveWeap( "kiparis_grip_mp");
			}
			if(response == "giveKIPARISDW")
			{
				giveWeap( "kiparisdw_mp");
			}
			if(response == "giveKIPARISSUP")
			{
				giveWeap( "kiparis_silencer_mp");
			}
			if(response == "giveKIPARISRF")
			{
				giveWeap( "kiparis_rf_mp");
			}
		}
		if(menu == game["overkill_MP40"])
		{
			if(response == "giveMP40")
			{
				giveWeap( "mp40_mp" );
			}
		}
	/*assault rifles*/
		if(menu == game["overkill_m16"])
		{
			if(response == "giveM16")
			{
				giveWeap( "m16_mp" );
			}
			if(response == "giveM16EXT")
			{
				giveWeap( "m16_extclip_mp");
			}
			if(response == "giveM16DUAL")
			{
				giveWeap( "m16_dualclip_mp");
			}
			if(response == "giveM16ACOG")
			{
				giveWeap( "m16_acog_mp");
			}
			if(response == "giveM16RDS")
			{
				giveWeap( "m16_elbit_mp");
			}
			if(response == "giveM16RFLX")
			{
				giveWeap( "m16_reflex_mp");
			}
			if(response == "giveM16MK")
			{
				giveWeap( "m16_mk_mp");
			}
			if(response == "giveM16FT")
			{
				giveWeap( "m16_ft_mp");
			}
			if(response == "giveM16IR")
			{
				giveWeap( "m16_ir_mp");
			}
			if(response == "giveM16SUP")
			{
				giveWeap( "m16_silencer_mp");
			}
			if(response == "giveM16GL")
			{
				giveWeap( "m16_gl_mp");
			}
		}
		if(menu == game["overkill_enfield"])
		{
			if(response == "giveENFIELD")
			{
				giveWeap( "enfield_mp" );
			}
			if(response == "giveENFIELDEXT")
			{
				giveWeap( "enfield_extclip_mp");
			}
			if(response == "giveENFIELDDUAL")
			{
				giveWeap( "enfield_dualclip_mp");
			}
			if(response == "giveENFIELDACOG")
			{
				giveWeap( "enfield_acog_mp");
			}
			if(response == "giveENFIELDRDS")
			{
				giveWeap( "enfield_elbit_mp");
			}
			if(response == "giveENFIELDRFLX")
			{
				giveWeap( "enfield_reflex_mp");
			}
			if(response == "giveENFIELDMK")
			{
				giveWeap( "enfield_mk_mp");
			}
			if(response == "giveENFIELDFT")
			{
				giveWeap( "enfield_ft_mp");
			}
			if(response == "giveENFIELDIR")
			{
				giveWeap( "enfield_ir_mp");
			}
			if(response == "giveENFIELDSUP")
			{
				giveWeap( "enfield_silencer_mp");
			}
			if(response == "giveENFIELDGL")
			{
				giveWeap( "enfield_gl_mp");
			}
		}
		if(menu == game["overkill_m14"])
		{
			if(response == "giveM14")
			{
				giveWeap( "m14_mp" );
			}
			if(response == "giveM14EXT")
			{
				giveWeap( "m14_extclip_mp");
			}
			if(response == "giveM14ACOG")
			{
				giveWeap( "m14_acog_mp");
			}
			if(response == "giveM14RDS")
			{
				giveWeap( "m14_elbit_mp");
			}
			if(response == "giveM14RFLX")
			{
				giveWeap( "m14_reflex_mp");
			}
			if(response == "giveM14GRIP")
			{
				giveWeap( "m14_grip_mp");
			}
			if(response == "giveM14MK")
			{
				giveWeap( "m14_mk_mp");
			}
			if(response == "giveM14FT")
			{
				giveWeap( "m14_ft_mp");
			}
			if(response == "giveM14IR")
			{
				giveWeap( "m14_ir_mp");
			}
			if(response == "giveM14SUP")
			{
				giveWeap( "m14_silencer_mp");
			}
			if(response == "giveM14GL")
			{
				giveWeap( "m14_gl_mp");
			}
		}
		if(menu == game["overkill_famas"])
		{
			if(response == "giveFAMAS")
			{
				giveWeap( "famas_mp" );
			}
			if(response == "giveFAMASEXT")
			{
				giveWeap( "famas_extclip_mp");
			}
			if(response == "giveFAMASDUAL")
			{
				giveWeap( "famas_dualclip_mp");
			}
			if(response == "giveFAMASACOG")
			{
				giveWeap( "famas_acog_mp");
			}
			if(response == "giveFAMASRDS")
			{
				giveWeap( "famas_elbit_mp");
			}
			if(response == "giveFAMASRFLX")
			{
				giveWeap( "famas_reflex_mp");
			}
			if(response == "giveFAMASMK")
			{
				giveWeap( "famas_mk_mp");
			}
			if(response == "giveFAMASFT")
			{
				giveWeap( "famas_ft_mp");
			}
			if(response == "giveFAMASIR")
			{
				giveWeap( "famas_ir_mp");
			}
			if(response == "giveFAMASSUP")
			{
				giveWeap( "famas_silencer_mp");
			}
			if(response == "giveFAMASGL")
			{
				giveWeap( "famas_gl_mp");
			}
		}
		if(menu == game["overkill_galil"])
		{
			if(response == "giveGALIL")
			{
				giveWeap( "galil_mp" );
			}
			if(response == "giveGALILEXT")
			{
				giveWeap( "galil_extclip_mp");
			}
			if(response == "giveGALILDUAL")
			{
				giveWeap( "galil_dualclip_mp");
			}
			if(response == "giveGALILACOG")
			{
				giveWeap( "galil_acog_mp");
			}
			if(response == "giveGALILRDS")
			{
				giveWeap( "galil_elbit_mp");
			}
			if(response == "giveGALILRFLX")
			{
				giveWeap( "galil_reflex_mp");
			}
			if(response == "giveGALILMK")
			{
				giveWeap( "galil_mk_mp");
			}
			if(response == "giveGALILFT")
			{
				giveWeap( "galil_ft_mp");
			}
			if(response == "giveGALILIR")
			{
				giveWeap( "galil_ir_mp");
			}
			if(response == "giveGALILSUP")
			{
				giveWeap( "galil_silencer_mp");
			}
			if(response == "giveGALILGL")
			{
				giveWeap( "galil_gl_mp");
			}
		}
		if(menu == game["overkill_aug"])
		{
			if(response == "giveAUG")
			{
				giveWeap( "aug_mp" );
			}
			if(response == "giveAUGEXT")
			{
				giveWeap( "aug_extclip_mp");
			}
			if(response == "giveAUGDUAL")
			{
				giveWeap( "aug_dualclip_mp");
			}
			if(response == "giveAUGACOG")
			{
				giveWeap( "aug_acog_mp");
			}
			if(response == "giveAUGRDS")
			{
				giveWeap( "aug_elbit_mp");
			}
			if(response == "giveAUGRFLX")
			{
				giveWeap( "aug_reflex_mp");
			}
			if(response == "giveAUGMK")
			{
				giveWeap( "aug_mk_mp");
			}
			if(response == "giveAUGFT")
			{
				giveWeap( "aug_ft_mp");
			}
			if(response == "giveAUGIR")
			{
				giveWeap( "aug_ir_mp");
			}
			if(response == "giveAUGSUP")
			{
				giveWeap( "aug_silencer_mp");
			}
			if(response == "giveAUGGL")
			{
				giveWeap( "aug_gl_mp");
			}
		}
		if(menu == game["overkill_fnfal"])
		{
			if(response == "giveFNFAL")
			{
				giveWeap( "fnfal_mp" );
			}
			if(response == "giveFNFALEXT")
			{
				giveWeap( "fnfal_extclip_mp");
			}
			if(response == "giveFNFALDUAL")
			{
				giveWeap( "fnfal_dualclip_mp");
			}
			if(response == "giveFNFALACOG")
			{
				giveWeap( "fnfal_acog_mp");
			}
			if(response == "giveFNFALRDS")
			{
				giveWeap( "fnfal_elbit_mp");
			}
			if(response == "giveFNFALRFLX")
			{
				giveWeap( "fnfal_reflex_mp");
			}
			if(response == "giveFNFALMK")
			{
				giveWeap( "fnfal_mk_mp");
			}
			if(response == "giveFNFALFT")
			{
				giveWeap( "fnfal_ft_mp");
			}
			if(response == "giveFNFALIR")
			{
				giveWeap( "fnfal_ir_mp");
			}
			if(response == "giveFNFALSUP")
			{
				giveWeap( "fnfal_silencer_mp");
			}
			if(response == "giveFNFALGL")
			{
				giveWeap( "fnfal_gl_mp");
			}
		}
		if(menu == game["overkill_ak47"])
		{
			if(response == "giveAK47")
			{
				giveWeap( "ak47_mp" );
			}
			if(response == "giveAK47EXT")
			{
				giveWeap( "ak47_extclip_mp");
			}
			if(response == "giveAK47DUAL")
			{
				giveWeap( "ak47_dualclip_mp");
			}
			if(response == "giveAK47ACOG")
			{
				giveWeap( "ak47_acog_mp");
			}
			if(response == "giveAK47RDS")
			{
				giveWeap( "ak47_elbit_mp");
			}
			if(response == "giveAK47RFLX")
			{
				giveWeap( "ak47_reflex_mp");
			}
			if(response == "giveAK47MK")
			{
				giveWeap( "ak47_mk_mp");
			}
			if(response == "giveAK47FT")
			{
				giveWeap( "ak47_ft_mp");
			}
			if(response == "giveAK47IR")
			{
				giveWeap( "ak47_ir_mp");
			}
			if(response == "giveAK47SUP")
			{
				giveWeap( "ak47_silencer_mp");
			}
			if(response == "giveAK47GL")
			{
				giveWeap( "ak47_gl_mp");
			}
		}
		if(menu == game["overkill_commando"])
		{
			if(response == "giveCOMMANDO")
			{
				giveWeap( "commando_mp" );
			}
			if(response == "giveCOMMANDOEXT")
			{
				giveWeap( "commando_extclip_mp");
			}
			if(response == "giveCOMMANDODUAL")
			{
				giveWeap( "commando_dualclip_mp");
			}
			if(response == "giveCOMMANDOACOG")
			{
				giveWeap( "commando_acog_mp");
			}
			if(response == "giveCOMMANDORDS")
			{
				giveWeap( "commando_elbit_mp");
			}
			if(response == "giveCOMMANDORFLX")
			{
				giveWeap( "commando_reflex_mp");
			}
			if(response == "giveCOMMANDOMK")
			{
				giveWeap( "commando_mk_mp");
			}
			if(response == "giveCOMMANDOFT")
			{
				giveWeap( "commando_ft_mp");
			}
			if(response == "giveCOMMANDOIR")
			{
				giveWeap( "commando_ir_mp");
			}
			if(response == "giveCOMMANDOSUP")
			{
				giveWeap( "commando_silencer_mp");
			}
			if(response == "giveCOMMANDOGL")
			{
				giveWeap( "commando_gl_mp");
			}
		}
		if(menu == game["overkill_g11"])
		{
			if(response == "giveG11")
			{
				giveWeap( "g11_mp" );
			}
			if(response == "giveG11LOW")
			{
				giveWeap( "g11_lps_mp");
			}
			if(response == "giveG11VAR")
			{
				giveWeap( "g11_vzoom_mp");
			}
		}
	/*shotguns*/
		if(menu == game["overkill_olympia"])
		{
			if(response == "giveOLYMPIA")
			{
				giveWeap( "rottweil72_mp" );
			}
		}
		if(menu == game["overkill_STAKEOUT"])
		{
			if(response == "giveSTAKEOUT")
			{
				giveWeap( "ithaca_mp" );
			}
			if(response == "giveSTAKEOUTGRIP")
			{
				giveWeap( "ithaca_grip_mp");
			}
		}
		if(menu == game["overkill_SPAS12"])
		{
			if(response == "giveSPAS12")
			{
				giveWeap( "spas_mp" );
			}
			if(response == "giveSPAS12SUP")
			{
				giveWeap( "spas_silencer_mp");
			}
		}
		if(menu == game["overkill_HS10"])
		{
			if(response == "giveHS10")
			{
				giveWeap( "hs10_mp" );
			}
			if(response == "giveHS10DW")
			{
				giveWeap( "hs10dw_mp");
			}
		}
		if(menu == game["overkill_M1897"])
		{
			if(response == "giveM1897")
			{
				giveWeap( "trenchgun_mp" );
			}
		}
	/*light machine guns*/
		if(menu == game["overkill_hk21"])
		{
			if(response == "giveHK21")
			{
				giveWeap( "hk21_mp" );
			}
			if(response == "giveHK21EXT")
			{
				giveWeap( "hk21_extclip_mp");
			}
			if(response == "giveHK21ACOG")
			{
				giveWeap( "hk21_acog_mp");
			}
			if(response == "giveHK21RDS")
			{
				giveWeap( "hk21_elbit_mp");
			}
			if(response == "giveHK21RFLX")
			{
				giveWeap( "hk21_reflex_mp");
			}
			if(response == "giveHK21IR")
			{
				giveWeap( "hk21_ir_mp");
			}
		}
		if(menu == game["overkill_rpk"])
		{
			if(response == "giveRPK")
			{
				giveWeap( "rpk_mp" );
			}
			if(response == "giveRPKEXT")
			{
				giveWeap( "rpk_extclip_mp");
			}
			if(response == "giveRPKDUAL")
			{
				giveWeap( "rpk_dualclip_mp");
			}
			if(response == "giveRPKACOG")
			{
				giveWeap( "rpk_acog_mp");
			}
			if(response == "giveRPKRDS")
			{
				giveWeap( "rpk_elbit_mp");
			}
			if(response == "giveRPKRFLX")
			{
				giveWeap( "rpk_reflex_mp");
			}
			if(response == "giveRPKIR")
			{
				giveWeap( "rpk_ir_mp");
			}
		}
		if(menu == game["overkill_m60"])
		{
			if(response == "giveM60")
			{
				giveWeap( "m60_mp" );
			}
			if(response == "giveM60EXT")
			{
				giveWeap( "m60_extclip_mp");
			}
			if(response == "giveM60ACOG")
			{
				giveWeap( "m60_acog_mp");
			}
			if(response == "giveM60RDS")
			{
				giveWeap( "m60_elbit_mp");
			}
			if(response == "giveM60RFLX")
			{
				giveWeap( "m60_reflex_mp");
			}
			if(response == "giveM60GRIP")
			{
				giveWeap( "m60_grip_mp");
			}
			if(response == "giveM60IR")
			{
				giveWeap( "m60_ir_mp");
			}
		}
		if(menu == game["overkill_stoner63"])
		{
			if(response == "giveSTONER63")
			{
				giveWeap( "stoner63_mp" );
			}
			if(response == "giveSTONER63EXT")
			{
				giveWeap( "stoner63_extclip_mp");
			}
			if(response == "giveSTONER63ACOG")
			{
				giveWeap( "stoner63_acog_mp");
			}
			if(response == "giveSTONER63RDS")
			{
				giveWeap( "stoner63_elbit_mp");
			}
			if(response == "giveSTONER63RFLX")
			{
				giveWeap( "stoner63_reflex_mp");
			}
			if(response == "giveSTONER63IR")
			{
				giveWeap( "stoner63_ir_mp");
			}
		}
	/*sniper rifles*/
		if(menu == game["overkill_dragunov"])
		{
			if(response == "giveDRAGUNOV")
			{
				giveWeap( "dragunov_mp" );
			}
			if(response == "giveDRAGUNOVEXT")
			{
				giveWeap( "dragunov_extclip_mp");
			}
			if(response == "giveDRAGUNOVACOG")
			{
				giveWeap( "dragunov_acog_mp");
			}
			if(response == "giveDRAGUNOVIR")
			{
				giveWeap( "dragunov_ir_mp");
			}
			if(response == "giveDRAGUNOVSUP")
			{
				giveWeap( "dragunov_silencer_mp");
			}
			if(response == "giveDRAGUNOVVAR")
			{
				giveWeap( "dragunov_vzoom_mp");
			}
		}
		if(menu == game["overkill_wa2000"])
		{
			if(response == "giveWA2000")
			{
				giveWeap( "wa2000_mp" );
			}
			if(response == "giveWA2000EXT")
			{
				giveWeap( "wa2000_extclip_mp");
			}
			if(response == "giveWA2000ACOG")
			{
				giveWeap( "wa2000_acog_mp");
			}
			if(response == "giveWA2000IR")
			{
				giveWeap( "wa2000_ir_mp");
			}
			if(response == "giveWA2000SUP")
			{
				giveWeap( "wa2000_silencer_mp");
			}
			if(response == "giveWA2000VAR")
			{
				giveWeap( "wa2000_vzoom_mp");
			}
		}
		if(menu == game["overkill_l96a1"])
		{
			if(response == "giveL96A1")
			{
				giveWeap( "l96a1_mp" );
			}
			if(response == "giveL96A1EXT")
			{
				giveWeap( "l96a1_extclip_mp");
			}
			if(response == "giveL96A1ACOG")
			{
				giveWeap( "l96a1_acog_mp");
			}
			if(response == "giveL96A1IR")
			{
				giveWeap( "l96a1_ir_mp");
			}
			if(response == "giveL96A1SUP")
			{
				giveWeap( "l96a1_silencer_mp");
			}
			if(response == "giveL96A1VAR")
			{
				giveWeap( "l96a1_vzoom_mp");
			}
		}
		if(menu == game["overkill_psg1"])
		{
			if(response == "givePSG1")
			{
				giveWeap( "psg1_mp" );
			}
			if(response == "givePSG1EXT")
			{
				giveWeap( "psg1_extclip_mp");
			}
			if(response == "givePSG1ACOG")
			{
				giveWeap( "psg1_acog_mp");
			}
			if(response == "givePSG1IR")
			{
				giveWeap( "psg1_ir_mp");
			}
			if(response == "givePSG1SUP")
			{
				giveWeap( "psg1_silencer_mp");
			}
			if(response == "givePSG1VAR")
			{
				giveWeap( "psg1_vzoom_mp");
			}
		}
		if(menu == game["overkill_m40a3"])
		{
			if(response == "giveM40A3")
			{
				giveWeap( "m40a3_mp" );
			}
			if(response == "giveM40A3ACOG")
			{
				giveWeap( "m40a3_acog_mp" );
			}
		}
		if(menu == game["overkill_r700"])
		{
			if(response == "giveR700")
			{
				giveWeap( "remington700_mp" );
			}
			if(response == "giveR700ACOG")
			{
				giveWeap( "remington700_acog_mp" );
			}
		}
		if(menu == game["overkill_KAR98"])
		{
			if(response == "giveKAR98")
			{
				giveWeap( "kar98_mp" );
			}
			if(response == "giveKAR98S")
			{
				giveWeap( "kar98_scoped_mp" );
			}
		}
		if(menu == game["overkill_ARISAKA"])
		{
			if(response == "giveARISAKA")
			{
				giveWeap( "type99_mp" );
			}
			if(response == "giveARISAKAS")
			{
				giveWeap( "type99_scoped_mp" );
			}
		}
		if(menu == game["overkill_PTRS"])
		{
			if(response == "givePTRS")
			{
				giveWeap( "ptrs41_mp" );
			}
		}
		if(menu == game["overkill_BARRETT"])
		{
			if(response == "giveBARRETT")
			{
				giveWeap( "barrettm82_mp" );
			}
		}
	/*misc weapons*/
		if(menu == game["overkill_misc"])
		{
			if(response == "giveDEFWEAPON")
			{
				giveWeap( "defaultweapon_mp" );
			}
		}
		wait 0.1;
	}
}