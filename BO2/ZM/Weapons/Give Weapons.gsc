GiveWeapons(f)
{
    self takeweapon(self getcurrentweapon());
    self maps\mp\zombies\_zm_weapons::weapon_give(f);
    self switchtoweapon(f);
    self givemaxammo(f);
}
