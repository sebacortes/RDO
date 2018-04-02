/********************
Author: Inquisidor
Descripcion: genera un encuentro tal que el 80% del poder es una banshee, y el 20% restante compuesto por uno a siete undeads cualesquiera.
Ubicacion: Bosque de los susurros centro sur
*********************/
#include "RS_FGE_inc"
#include "RS_ADE"


void main() {
    struct RS_DatosSGE datosSGE = RS_getDatosSGE();
    RS_generarSolitario( RS_getDatosSGE(0.3,0.2), ADE_Undead_Banshees_get() );
    float faeCasters = RS_generarGrupo( datosSGE, ADE_Undead_EsqueletoH_getCaster(), 0.3, 0.15, 0 );
    RS_generarGrupo( datosSGE, FGE_Esqueletos_get(), 1.0 - faeCasters );
}
