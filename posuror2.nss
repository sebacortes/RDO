//::///////////////////////////////////////////////
//:: Name: Pony del Sur Ornal
//:: FileName: PoSurOr2
//:: Quest Pony Sur Ornal, Entregan carta para Bria
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: Lobofiel
//:: Created On:
//:://////////////////////////////////////////////
/*   Script generated by
Lilac Soul's NWN Script Generator, v. 2.3

For download info, please visit:
http://nwvault.ign.com/View.php?view=Other.Detail&id=4683&id=625    */

//Put this on action taken in the conversation editor
void main()
{

object oPC = GetPCSpeaker();

CreateItemOnObject("posurorbri", oPC);

}
