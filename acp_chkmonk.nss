#include "prc_class_const"

int StartingConditional()
{
    object speaker = GetPCSpeaker();

    return (GetLevelByClass(CLASS_TYPE_MONK, speaker) > 0 || GetLevelByClass(CLASS_TYPE_BRAWLER, speaker) > 0);
}
