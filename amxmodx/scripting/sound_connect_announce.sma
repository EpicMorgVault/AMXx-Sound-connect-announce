/*
Plugin made by papyrus_kn.
Visit: http://www.amxmodxbg.org - The official site for AMX Mod X in Bulgaria
Special thaks to:
	Heavy - for the plugin idea
	He3aBuCuM - for fixing the code
	Burton - for testing
	radko412 - for testing	
	hateYou - for new order of the code
	EpicMorg Team - fixes
*/

#include <amxmodx> 

#define ADMIN_FLAG ADMIN_LEVEL_A // Flag for admin sound
#define MEMBER_FLAG ADMIN_BAN // Flag for member sound

#define PLAYER_MUSIC "misc/player.wav" // Player sound
#define MEMBER_MUSIC "misc/member.wav" // Member sound, fixed
#define ADMIN_MUSIC "misc/admin.wav" // Admin sound, fixed

public plugin_precache()
{ 
	precache_sound(PLAYER_MUSIC) 
	precache_sound(MEMBER_MUSIC) 
	precache_sound(ADMIN_MUSIC) 
} 

public plugin_init() 
{
	register_plugin("Sound connect announce", "1.1.1", "papyrus_kn, EpicMorg") 
	register_cvar("sca_version", "1.1.1", FCVAR_SERVER|FCVAR_SPONLY)
}

public client_putinserver(id)
{ 
	if(get_user_flags(id) & ADMIN_USER) 
		client_cmd(0,"spk %s", PLAYER_MUSIC) 
		
	else if(get_user_flags(id) & MEMBER_FLAG) 
		client_cmd(0,"spk %s", MEMBER_MUSIC) 
		
	else if(get_user_flags(id) & ADMIN_FLAG) 
		client_cmd(0,"spk %s", ADMIN_MUSIC)
} 

public client_disconnect(id)
{ 
	if(get_user_flags(id) & ADMIN_USER)
		client_cmd(0,"spk %s", PLAYER_MUSIC)

	else if(get_user_flags(id) & MEMBER_FLAG)
		client_cmd(0,"spk %s", MEMBER_MUSIC)

	else if(get_user_flags(id) & ADMIN_FLAG)
		client_cmd(0,"spk %s", ADMIN_MUSIC)
}
