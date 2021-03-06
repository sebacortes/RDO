//::///////////////////////////////////////////////
//:: Name: Pony del Sur Ornal
//:: FileName: PoSurOr1
//:: Quest Pony Sur Ornal, solo dispara si PJ no tiene cartas que parten de Ornal
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: Lobofiel
//:: Created On:
//:://////////////////////////////////////////////

int GetNumItems(object oTarget,string sItem)
{
int nNumItems = 0;
object oItem = GetFirstItemInInventory(oTarget);
while (GetIsObjectValid(oItem) == TRUE)
{
if (GetTag(oItem) == sItem)
{
nNumItems = nNumItems + GetNumStackedItems(oItem);
}
oItem = GetNextItemInInventory(oTarget);
}
return nNumItems;
}

/*   Script generated by
Lilac Soul's NWN Script Generator, v. 2.3

For download info, please visit:
http://nwvault.ign.com/View.php?view=Other.Detail&id=4683&id=625    */

int StartingConditional()
{
object oPC = GetPCSpeaker();

if (GetNumItems(oPC, "PoSurOrBen") != 0) return FALSE;

if (GetNumItems(oPC, "PoSurOrBri") != 0) return FALSE;

if (d100()>20) return FALSE;

return TRUE;
}


