/********************** MercenariosSpawn_onEnter ******************************
Package: Generador de mercenarios - area onEnter handler
Autore: Inquisidor
Descripcion: Genera los mercenarios de la taberna "Salty Dog".
*****************************************************************************/

#include "Mercenario_inc"
#include "SPC_inc"
#include "RS_onEnter"
#include "PCT_area_inc"
#include "Horses_inc"
#include "Skills_sinergy"
#include "Mod_inc"
#include "Muerte_inc"
#include "DeadMagic_inc"

const string ENTRADA_WAYPOINT_TAG  = "Merc4a";
const string WALK_WAYPOINT_TAG     = "MercBenzor";
const int WALK_WAYPOINT_CANTIDAD = 5;


void main() {
    object enteringObject = GetEnteringObject();
    if( GetIsPC(enteringObject) ) {
        Mod_onPcEntersArea( enteringObject ); // debe ser lo primero que se ejecuta cuando un Pc entra a un área.
        RS_onPcEntersArea( enteringObject );

        if( !GetIsDM( enteringObject ) ) {
            SisPremioCombate_onPjEnterArea( enteringObject );

            Muerte_onPjEntersArea( enteringObject );

            Skills_Sinergy_areaOnEnter( enteringObject );

            PerceptionSys_onPjEnterArea( enteringObject );

            if (GetLocalInt(OBJECT_SELF, "seguro") == TRUE)
                SendMessageToPC(enteringObject, "Este area es segura para desloguear");

            Mercenario_onPjEntersTavern( ENTRADA_WAYPOINT_TAG, WALK_WAYPOINT_TAG, WALK_WAYPOINT_CANTIDAD );
        }
    }

    MagiaMuerta_onAreaEnter( enteringObject );

    Horses_areaOnEnter( enteringObject );
}
