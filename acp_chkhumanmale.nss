int StartingConditional()
{
    object speaker = GetPCSpeaker();

    return GetRacialType(speaker) == RACIAL_TYPE_HUMAN && GetGender(speaker) == GENDER_MALE;
}
