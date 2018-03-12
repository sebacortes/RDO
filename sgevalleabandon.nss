/************* Script Generador de Encuentros - Grupal combinado ***************
template author: Inquisidor
script name: sgeAbandonados
script author: dragoncin
names of the areas this script is asociated with:
Montes Cristal - Valle de los Abandonados
********************************************************************************/
#include "RS_FGE_inc"


void main() {

    struct RS_DatosSGE datosSGE = RS_getDatosSGE();

    int fronteraNorteOeste = Location_dicernirSeccion( GetPositionFromLocation(datosSGE.ubicacionEncuentro), 2, 7 );
    int fronteraSurEste = Location_dicernirSeccion( GetPositionFromLocation(datosSGE.ubicacionEncuentro), 8, 3 );

    //Dentro del pueblo hay fantasmas, afuera hay lo mismo que en el resto de los montes cristal
    if( (fronteraNorteOeste & Location_SECCION_SUR_ESTE) != 0  && (fronteraSurEste & Location_SECCION_NOR_OESTE) != 0 ) {

        if (GetIsNight()) {
            FGE_Undead_Fantasma( datosSGE );
        }

    } else {

        RS_generarMezclado( datosSGE, FGE_Montanas_getVariado() );

    }
}


