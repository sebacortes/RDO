#include "prc_inc_spells"

int StartingConditional()
{
    object speaker = GetPCSpeaker();

    return GetArcanePRCLevels(speaker) > 20;
}
