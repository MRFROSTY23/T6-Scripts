
//Allows You To Use Hex Color Values EX:0x6527F5 = Purple
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

//Thread On Init Like This level thread DevExit();
DevExit()
{
    level common_scripts\utility::waittill_any("game_ended", "end_game");
    ExitLevel(0);
}

getName()
{
    name = self.name;

    if(name[0] != "[")
        return name;

    for(a = (name.size - 1); a >= 0; a--)
        if(name[a] == "]")
            break;

    return GetSubStr(name, (a + 1));
}

//Credits To Serious
bool(variable)
{
    return isdefined(variable) && int(variable);
}

//Credits To Serious
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

//The ilog Function Works For Infinity Loader Only
//Prints Your Location To The Debugger
PrintCurrentLoc()
{
   ilog( "Your Position: ^2" + ( self.origin + "^7." ) );
}

doNewOrigin(origin)
{
	self setOrigin(origin);
}

//Prints Off Your Xuid Code To Your Screen Allows You To Lock or Do Certain Things To Players
printoffxuid(player)
{
    if(player getxuid() == "")
    playerXUID = self getxuid();
    self iprintlnbold(self getxuid(0));
}

array_contains(array, value)
{
	for(i = 0; i < array.size; i++)
	{
		if(array[i] == value)
			return true;
	}
	return false;
}

array_randomize( array )
{
    for ( i = 0; i < array.size; i++ )
    {
        j = randomint( array.size );
        temp = array[i];
        array[i] = array[j];
        array[j] = temp;
    }

    return array;
}

divideColor(c1,c2,c3,ignore)
{
    if(isDefined(ignore))
        return (c1, c2, c3);
    return (c1 /255, c2 /255, c3 /255);
}
