int StartingConditional()
{
    int iResult;
    object oPC = GetLastSpeaker();
    if(GetLevelByClass(CLASS_TYPE_DRUID ,oPC) >= 1 || GetLevelByClass(CLASS_TYPE_RANGER ,oPC) >= 1 )
    {
    return TRUE;
    }
    return FALSE;
}
