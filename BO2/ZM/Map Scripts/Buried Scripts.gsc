DrawWeaponWallbuys()
{
    self updateMenu("Draw All Chalks: Enabled");
    locations = ["bank", "bar", "church", "courthouse", "generalstore", "mansion", "morgue", "prison", "stables", "stablesroof", "toystore", "candyshop"];
    
    for(a = 0; a < level.buildable_wallbuy_weapons.size; a++)
    {
        locations = array_randomize(locations);
        
        DrawWallbuy(locations[0], level.buildable_wallbuy_weapons[a]);
        locations = ArrayRemove(locations, locations[0]);
        
        if(isDefined(level.chalk_pieces[a]))
            level.chalk_pieces[a] maps\mp\zombies\_zm_buildables::piece_unspawn();
    }
}

DrawWallbuy(location, weaponname)
{
    foreach(key in GetArrayKeys(level.chalk_builds))
    {
        stub    = level.chalk_builds[key];
        wallbuy = common_scripts\utility::GetStruct(stub.target, "targetname");
        
        if(isDefined(wallbuy.script_location) && wallbuy.script_location == location)
        {
            if(!isDefined(wallbuy.script_noteworthy) || IsSubStr(wallbuy.script_noteworthy, level.scr_zm_ui_gametype + "_" + level.scr_zm_map_start_location))
            {
                maps\mp\zombies\_zm_weapons::add_dynamic_wallbuy(weaponname, wallbuy.targetname, 1);
                thread wait_and_remove(stub, stub.buildablezone.pieces[0]);
            }
        }
    }
}

wait_and_remove(stub, piece)
{
    wait 0.1;
    self maps\mp\zombies\_zm_buildables::buildablestub_remove();
    thread maps\mp\zombies\_zm_unitrigger::unregister_unitrigger(stub);
    piece maps\mp\zombies\_zm_buildables::piece_unspawn();
}

ArrayRemove(arr, value)
{
    if (!isDefined(arr) || !isDefined(value))
        return [];

    newArray = [];

    for (i = 0; i < arr.size; i++)
    {
        if (arr[i] != value)
            newArray[newArray.size] = arr[i];
    }

    return newArray;
}

DestroyFountain()
{
    t_damage = GetEnt("maze_fountain_trigger", "targetname");
    
    if(isDefined(t_damage))
        t_damage notify("damage", 1000, self, undefined, undefined, "MOD_PROJECTILE");
    
    level notify("courtyard_fountain_open");
}
