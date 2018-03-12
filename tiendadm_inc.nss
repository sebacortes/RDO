const string TiendaDM_tiendaActiva_VN = "tiendaDMactiva";

const string TiendaDM_conversacion_RN = "tiendadm_conv";

void TiendaDM_reset( object tienda );
void TiendaDM_reset( object tienda )
{
    object itemIterator = GetFirstItemInInventory( tienda );
    while( GetIsObjectValid(itemIterator) ) {
        DestroyObject( itemIterator );
        itemIterator = GetNextItemInInventory( tienda );
    }
}
