//::///////////////////////////////////////////////
//:: Name           PRC Respawning Door Destroyed event
//:: FileName       door_destroyed
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This handles prevent the door being removed
    
    It should be respawned by sending a userdefined
    event no 500 to the door later
*/
//:://////////////////////////////////////////////
//:: Created By:    Primogenitor
//:: Created On:    08/05/06
//:://////////////////////////////////////////////


void main()
{   
    SetIsDestroyable(FALSE);
}
