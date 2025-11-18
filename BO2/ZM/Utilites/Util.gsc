bool(variable)
{
    return isdefined(variable) && int(variable);
}

integer(variable)
{
    if(!isdefined(int(variable)))
        return 0;
        
    return int(variable);
}

vector_scale( vec, scale )
{
    vec = ( vec[ 0] * scale, vec[ 1] * scale, vec[ 2] * scale );
    return vec;
}

//Thread On Init Like This level DevExit();
DevExit()
{
    level common_scripts\utility::waittill_any("game_ended", "end_game");
    ExitLevel(0);
}

//Allows You To Use Hex Values like this 0x9D00FF credits to serious
color(value)
{
    /*
        Size constraints comment:
        
        Why is this better than rgb = (r,g,b) => return (r/255, g/255, b/255)?
        
        This will emit PSC, GetInt, align(4), value, SFT, align(1 + pos, 4), 4
        rgb... emits PSC, {GetInt, align(4), value}[3], SFT, align(1 + pos, 4), 4
        Vector emits Vec, align(4), r as float, b as float, g as float 
        
        color:  Min: 14, Max: 17
        rgb:    Min: 30, Max: 33
        vector: Min: 13, Max: 16
    */

    return
    (
    (value & 0xFF0000) / 0xFF0000,
    (value & 0x00FF00) / 0x00FF00,
    (value & 0x0000FF) / 0x0000FF
    );
}
