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
