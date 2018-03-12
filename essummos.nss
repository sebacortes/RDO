int StartingConditional()
{
    int iResult;
    object oPC = GetLastSpeaker();
    if(GetLevelByClass(CLASS_TYPE_BARD ,oPC) >= 1 || GetLevelByClass(CLASS_TYPE_CLERIC ,oPC) >= 1 || GetLevelByClass(CLASS_TYPE_PALADIN ,oPC) >= 1 || GetLevelByClass(CLASS_TYPE_SORCERER ,oPC) >= 1 || GetLevelByClass(CLASS_TYPE_WIZARD ,oPC) >= 1 )
    {
    return TRUE;
    }
    return FALSE;
}
