//::///////////////////////////////////////////////
//:: Death Ward
//:: NW_S0_DeaWard.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The target creature is protected from the instant
    death effects for the duration of the spell
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: July 27, 2001
//:://////////////////////////////////////////////
//:: Update Pass By: Preston W, On: July 27, 2001


//:: modified by mr_bumpkin Dec 4, 2003
#include "spinc_common"

void main()
{
DeleteLocalInt(OBJECT_SELF, "X2_L_LAST_SPELLSCHOOL_VAR");
SetLocalInt(OBJECT_SELF, "X2_L_LAST_SPELLSCHOOL_VAR", SPELL_SCHOOL_NECROMANCY);
/*
  Spellcast Hook Code
  Added 2003-06-23 by GeorgZ
  If you want to make changes to all spells,
  check x2_inc_spellhook.nss to find out more

*/

    if (!X2PreSpellCastCode())
    {
    // If code within the PreSpellCastHook (i.e. UMD) reports FALSE, do not run this spell
        return;
    }

// End of Spell Cast Hook


    //Declare major variables
    object oTarget = GetSpellTargetObject();
    effect eDeath = EffectImmunity(IMMUNITY_TYPE_DEATH);
    effect eVis = EffectVisualEffect(VFX_IMP_DEATH_WARD);
    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);
    effect eLink = EffectLinkEffects(eDeath, eDur);

    int CasterLvl = PRCGetCasterLevel(OBJECT_SELF);
    int nDuration = CasterLvl;

    int nMetaMagic = GetMetaMagicFeat();
    //Fire cast spell at event for the specified target
    SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_DEATH_WARD, FALSE));
    //Enter Metamagic conditions
    if (CheckMetaMagic(nMetaMagic, METAMAGIC_EXTEND))
    {
        nDuration = nDuration *2;   //Duration is +100%
    }
    if( !GetIsPC(OBJECT_SELF) || GetIsDMPossessed(OBJECT_SELF) || GetGold(OBJECT_SELF) >= 10 )
    {
        TakeGoldFromCreature(10, OBJECT_SELF, TRUE);
        //Apply VFX impact and death immunity effect
        SPApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, HoursToSeconds(nDuration),TRUE,-1,CasterLvl);
        SPApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);

     }
    DeleteLocalInt(OBJECT_SELF, "X2_L_LAST_SPELLSCHOOL_VAR");
    // Getting rid of the local integer storing the spellschool name
}
