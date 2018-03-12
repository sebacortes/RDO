void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC)) {
        JumpToLocation(GetLocation(GetWaypointByTag("resuzone")));
    }
}
