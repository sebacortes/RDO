#include "tiendadm_inc"
#include "store_basic"

const int NIVEL_TIENDA = 20;

void main()
{
    object tienda = GetNearestObjectByTag(GetLocalString(GetPCSpeaker(), TiendaDM_tiendaActiva_VN));

    if (GetLocalInt(tienda, Store_itemsExpectedQuality_PN) != NIVEL_TIENDA) {
        TiendaDM_reset( tienda );
        SetLocalInt(tienda, Store_itemsExpectedQuality_PN, NIVEL_TIENDA);
    }
}
