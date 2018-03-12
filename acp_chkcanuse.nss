#include "phenos_inc"

int StartingConditional()
{
    object speaker = GetPCSpeaker();

    return GetCanUseCombatAnimation(speaker);
}
