#include "tiendadm_inc"

void main()
{
    object oDM = GetPlaceableLastClickedBy();

    if (GetIsDM(oDM)) {
        SetLocalString(oDM, TiendaDM_tiendaActiva_VN, "tiendaDM_sastre");

        ActionStartConversation(oDM, TiendaDM_conversacion_RN, TRUE, FALSE);
    }
}
