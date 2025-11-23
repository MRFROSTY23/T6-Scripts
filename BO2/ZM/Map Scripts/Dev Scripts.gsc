//This Should Give You An Idea How To Open Doors
zombie_devgui_open_sesame()
{
	setdvar( "zombie_unlock_all", 1 );
	common_scripts\utility::flag_set( "power_on" );
	players = maps\mp\_utility::get_players();
	common_scripts\utility::array_thread( players, maps\mp\zombies\_zm_devgui::zombie_devgui_give_money );
	zombie_doors = getentarray( "zombie_door", "targetname" );
	i = 0;
	while ( i < zombie_doors.size )
	{
		zombie_doors[ i ] notify( "trigger" );
		if ( is_true( zombie_doors[ i ].power_door_ignore_flag_wait ) )
		{
			zombie_doors[ i ] notify( "power_on" );
		}
		wait 0.05;
		i++;
	}
	zombie_airlock_doors = getentarray( "zombie_airlock_buy", "targetname" );
	i = 0;
	while ( i < zombie_airlock_doors.size )
	{
		zombie_airlock_doors[ i ] notify( "trigger" );
		wait 0.05;
		i++;
	}
	zombie_debris = getentarray( "zombie_debris", "targetname" );
	i = 0;
	while ( i < zombie_debris.size )
	{
		zombie_debris[ i ] notify( "trigger" );
		wait 0.05;
		i++;
	}
	zombie_devgui_build( undefined );
	level notify( "open_sesame" );
	wait 1;
	setdvar( "zombie_unlock_all", 0 );
}
