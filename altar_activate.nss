#include "muerte_inc"
#include "x0_i0_position"

void main()
{
    object oPC = GetPlaceableLastClickedBy();

    location sitioResurreccion = GetAheadLocation(OBJECT_SELF);

    SetLocalLocation(oPC, Muerte_altarActivo_VN, sitioResurreccion);

    int altarVFX = GetLocalInt(OBJECT_SELF, "altarVFX");
    if (altarVFX > 0) {
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(altarVFX), GetLocation(OBJECT_SELF));
    }
}
