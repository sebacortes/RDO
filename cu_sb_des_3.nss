#include "cu_spells"
void main()
{
    int nSpellId = GetLocalInt(OBJECT_SELF, "View_Spell_Id_3");
    string sDesRes = CU_Get2DAString("spells", "SpellDesc", nSpellId);
    string sDes = GetStringByStrRef(StringToInt(sDesRes));
    SetCustomToken(850, sDes);
    SetCustomToken(849, CU_GetSpellName(nSpellId));
}
