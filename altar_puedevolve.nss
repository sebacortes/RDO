#include "muerte_inc"

int StartingConditional()
{
    return GetIsObjectValid(GetAreaFromLocation( GetLocalLocation(GetPCSpeaker(), Muerte_altarActivo_VN) ));
}
