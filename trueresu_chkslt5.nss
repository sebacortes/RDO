#include "sp_resu_inc"

const string CURRENT_SLOT = "5";

int StartingConditional()
{
    return GetIsObjectValid( GetLocalObject(GetPCSpeaker(), TrueResurrection_deadPlayerSlot_VN_PREFIX+CURRENT_SLOT) );
}
