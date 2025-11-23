//Credits To xeirh For Showing Me This

player_damage( einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, psoffsettime, boneindex )
{
    if( isdefined( self.GodMode ) && self.GodMode )//self.GodMode Is The Name Of My God Mode Function So Just Change It To Whatever Your True | False Is
        return;
    
    [[ level.player_damage ]]( einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, psoffsettime, boneindex );
}

global_damage( mod, hit_location, hit_origin, player, amount, team )
{
    if( maps\mp\zombies\_zm_utility::is_magic_bullet_shield_enabled( self ) || isdefined( self.marked_for_death ) || !isdefined( player ) || self maps\mp\zombies\_zm_spawner::check_zombie_damage_callbacks( mod, hit_location, hit_origin, player, amount ) )
        return;
    
    [[ level.global_damage ]]( mod, hit_location, hit_origin, player, amount, team );
}

global_damage_ads( mod, hit_location, hit_origin, player, amount, team )
{
    if( maps\mp\zombies\_zm_utility::is_magic_bullet_shield_enabled( self ) || !isdefined( player ) || self maps\mp\zombies\_zm_spawner::check_zombie_damage_callbacks( mod, hit_location, hit_origin, player, amount ) )
        return;
    
    [[ level.global_damage_ads ]]( mod, hit_location, hit_origin, player, amount, team );
}

player_disconnect()
{
    [[ level.player_disconnect ]]();
}
