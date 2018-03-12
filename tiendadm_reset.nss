#include "tiendadm_inc"

void main()
{
    object store = GetNearestObjectByTag(GetLocalString(GetPCSpeaker(), TiendaDM_tiendaActiva_VN));

    TiendaDM_reset(store);
}
