UnpackWeapon()
{
    Upgradeweapon = self getcurrentweapon();
    Upgrade = maps\mp\zombies\_zm_weapons::get_base_weapon_name(Upgradeweapon, 1);
    if( IsDefined(Upgrade))
    {
        self takeweapon(Upgradeweapon);
        self giveweapon(Upgrade, 0, self maps\mp\zombies\_zm_weapons::get_pack_a_punch_weapon_options(Upgrade));
        self switchtoweapon(Upgrade);
        self givemaxammo(Upgrade);
		self iprintln("Weapon Has Been ^1Unpacked");
    }
}

get_upgrade( weaponname )
{
	if ( isDefined( level.zombie_weapons[ weaponname ] ) && isDefined( level.zombie_weapons[ weaponname ].upgrade_name ) )
	{
		return maps\mp\zombies\_zm_weapons::get_upgrade_weapon( weaponname, 0 );
	}
	else
	{
		return maps\mp\zombies\_zm_weapons::get_upgrade_weapon( weaponname, 1 );
	}
}
