//Works On Transit | Buried | Die Rise
//Dont Work On Mob | Origins Correctly
zombie_devgui_build( buildable )
{

	player = common_scripts\utility::get_players()[ 0 ];
	i = 0;
	while ( i < level.buildable_stubs.size )
	{
		if ( !isDefined( buildable ) || level.buildable_stubs[ i ].equipname == buildable )
		{
			if ( isDefined( buildable ) || level.buildable_stubs[ i ].persistent != 3 )
			{
				level.buildable_stubs[ i ] maps\mp\zombies\_zm_buildables::buildablestub_finish_build( player );
			}
		}
		i++;
	}
}
