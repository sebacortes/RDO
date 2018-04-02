#include "tiendadm_inc"

void main()
{

// Either open the store with that tag or let the user know that no store exists.
    object oStore = GetNearestObjectByTag(GetLocalString(GetPCSpeaker(), TiendaDM_tiendaActiva_VN));

    if(GetObjectType(oStore) == OBJECT_TYPE_STORE)
        OpenStore(oStore, GetPCSpeaker());
    else
        ActionSpeakStringByStrRef(53090, TALKVOLUME_TALK);
}

