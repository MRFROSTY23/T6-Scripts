
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

//Some Useful Stuff //Credits To xeirh For This
is_value( value )
{
    return isdefined( value ) && ( isint( value ) || isfloat( value ) );
}

is_valid() 
{
    if( isdefined( self ) || isalive( self ) || isplayer( self ) || self.sessionstate != "spectator" || self.sessionstate != "intermission" )
        return true;

    return false;
}

is_explosive_damage( mod )
{
    if( mod == "MOD_GRENADE" || mod == "MOD_GRENADE_SPLASH" || mod == "MOD_PROJECTILE" || mod == "MOD_PROJECTILE_SPLASH" || mod == "MOD_EXPLOSIVE" )
        return true;

    return false;
}

get_name()
{
    name = self.name;
    if( name[ 0 ] != "[" )
        return name;

    for( a = ( name.size - 1 ); a >= 0; a-- )
    {
        if( name[ a ] == "]" )
            break;
    }

    return getsubstr( name, ( a + 1 ) );
}

clean_text( text )
{
    if( !isdefined( text ) || text == "" )
        return;

    if( text[ 0 ] == toupper( text[ 0 ] ) )
    {
        if( issubstr( text, " " ) && !issubstr( text, "_" ) )
            return text;
    }

    text       = strtok( tolower( text ), "_" );
    new_string = "";
    for( a = 0; a < text.size; a++ )
    {
        illegal     = array( "specialty", "player", "weapon", "wpn", "viewmodel", "camo" );
        replacement = " ";
        if( isinarray( illegal, text[ a ] ) )
        {
            for( b = 0; b < text[ a ].size; b++ )
            {
                if( b != 0 )
                    new_string += text[ a ][ b ];
                else
                    new_string += toupper( text[ a ][ b ] );
            }

            if( a != ( text.size - 1 ) )
                new_string += replacement;
        }
    }

    return new_string;
}

clean_name( name )
{
    if( !isdefined( name ) || name == "" )
        return;

    illegal    = array( "^A", "^B", "^F", "^H", "^I", "^0", "^1", "^2", "^3", "^4", "^5", "^6", "^7", "^8", "^9" );
    new_string = "";
    for( a = 0; a < name.size; a++ )
    {
        if( a < ( name.size - 1 ) )
        {
            if( isinarray( illegal, ( name[ a ] + name[ ( a + 1 ) ] ) ) )
            {
                a += 2;
                if( a >= name.size )
                    break;
            }
        }

        if( isdefined( name[ a ] ) && a < name.size )
            new_string += name[ a ];
    }

    return new_string;
}

calculate_distance( origin, destination, velocity )
{
    return ( distance( origin, destination ) / velocity );
}

//Checks If Its Defined
is_true( check )
{
	if ( isDefined( check ) )
	{
		return check;
	}
}

//Checks If Its Undefined
is_false( check )
{
	if ( isDefined( check ) )
	{
		return !check;
	}
}
