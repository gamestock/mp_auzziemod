#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\_class;

/*

	TODO:
	- Give player back their weapon with their existing camo
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
		if(menu == game["overkill_save"])
		{
			if(response == "saveClass")
			{
				self iPrintLnBold ("test enable");
			}
			if(response == "dontsaveClass")
			{
				self iPrintLnBold ("test disable");
			}
		}


	/*assault rifles*/
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
		wait 0.05;
	}
}