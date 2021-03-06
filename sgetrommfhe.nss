/****************** Script Generador de Encuentros - COMPUESTO****************
template author: Inquisidor
script name: sgetrommfhe
script author: Lobofiel
names of the areas this script is asociated with:
Tromel Woods, Forgotten Heros
********************************************************************************/
#include "RS_sgeTools"
#include "RS_ade"


/*****Animales / Aves*/
void Aves() {
    string arregloDVDs = ADE_Animales_AveDiurna_getVariado();
    struct RS_DatosSGE datosSGE = RS_getDatosSGE_sinUbicacion();
    float faeGenerado;
    float faeGeneradoAcumulado = 0.0;
    do {
        datosSGE = RS_generarUbicacionSGE( datosSGE );
        faeGenerado = RS_generarVariado( datosSGE, arregloDVDs, 1.0 - faeGeneradoAcumulado, 0.10 );
        faeGeneradoAcumulado += faeGenerado;
    } while( faeGeneradoAcumulado < 0.9 && faeGenerado != 0.0 );
}


/*****Animales / Lobos*/
void Lobos() {
    string arregloDVDs = ADE_Animales_Lobos_getVariado();
    struct RS_DatosSGE datosSGE = RS_getDatosSGE_sinUbicacion();
    float faeGenerado;
    float faeGeneradoAcumulado = 0.0;
    do {
        datosSGE = RS_generarUbicacionSGE( datosSGE );
        faeGenerado = RS_generarVariado( datosSGE, arregloDVDs, 1.0 - faeGeneradoAcumulado, 0.10 );
        faeGeneradoAcumulado += faeGenerado;
    } while( faeGeneradoAcumulado < 0.9 && faeGenerado != 0.0 );
}


/*****Animales / Osos*/
void Osos() {
    string arregloDVDs = ADE_Animales_Osos_getVariado();
    struct RS_DatosSGE datosSGE = RS_getDatosSGE_sinUbicacion();
    float faeGenerado;
    float faeGeneradoAcumulado = 0.0;
    do {
        datosSGE = RS_generarUbicacionSGE( datosSGE );
        faeGenerado = RS_generarVariado( datosSGE, arregloDVDs, 1.0 - faeGeneradoAcumulado, 0.10 );
        faeGeneradoAcumulado += faeGenerado;
    } while( faeGeneradoAcumulado < 0.9 && faeGenerado != 0.0 );
}


/*****Animales / Serpent Forest*/
void Serpent() {
    string arregloDVDs = ADE_Animales_SerpentJungle_getVariado();
    struct RS_DatosSGE datosSGE = RS_getDatosSGE_sinUbicacion();
    float faeGenerado;
    float faeGeneradoAcumulado = 0.0;
    do {
        datosSGE = RS_generarUbicacionSGE( datosSGE );
        faeGenerado = RS_generarVariado( datosSGE, arregloDVDs, 1.0 - faeGeneradoAcumulado, 0.10 );
        faeGeneradoAcumulado += faeGenerado;
    } while( faeGeneradoAcumulado < 0.9 && faeGenerado != 0.0 );
}


/*****Bestias / Forest Summer*/
void Bestias() {
    string arregloDVDs = ADE_Bestias_ForestS_getVariado();
    struct RS_DatosSGE datosSGE = RS_getDatosSGE_sinUbicacion();
    float faeGenerado;
    float faeGeneradoAcumulado = 0.0;
    do {
        datosSGE = RS_generarUbicacionSGE( datosSGE );
        faeGenerado = RS_generarVariado( datosSGE, arregloDVDs, 1.0 - faeGeneradoAcumulado, 0.10 );
        faeGeneradoAcumulado += faeGenerado;
    } while( faeGeneradoAcumulado < 0.9 && faeGenerado != 0.0 );
}


/*****Giant / Ogre*/

void Ogre() {
    struct RS_DatosSGE datosSGE = RS_getDatosSGE();
    float faeGrupo = RS_generarGrupo( datosSGE, ADE_Giant_Ogro_getMelee() );
}


/*****Insects / Wasp*/
void Wasp() {
    struct RS_DatosSGE datosSGE = RS_getDatosSGE();
    RS_generarMezclado( datosSGE, ADE_Insects_Avispa_getVariado() );
}


/*****Insects / Spider*/
void Spider() {
    string arregloDVDs = ADE_Insect_Spider_getVariado();
    struct RS_DatosSGE datosSGE = RS_getDatosSGE_sinUbicacion();
    float faeGenerado;
    float faeGeneradoAcumulado = 0.0;
    do {
        datosSGE = RS_generarUbicacionSGE( datosSGE );
        faeGenerado = RS_generarVariado( datosSGE, arregloDVDs, 1.0 - faeGeneradoAcumulado, 0.10 );
        faeGeneradoAcumulado += faeGenerado;
    } while( faeGeneradoAcumulado < 0.9 && faeGenerado != 0.0 );
}


/*****Undead / Variado*/

void Undead() {
    struct RS_DatosSGE datosSGE = RS_getDatosSGE();
    float faeGrupo = RS_generarGrupo( datosSGE, ADE_Undead_EsqueletoH_getMelee() );
}


/*****MAIN*/
void main()
{
if (GetIsDay())
    {
    switch( Random(6) ){
        case 1: Aves(  );
            break;
        case 2: Serpent(  );
            break;
        case 3: Lobos(  );
            break;
        case 4: Osos(  );
            break;
        case 5: Ogre(  );
            break;
        case 0: Wasp(  );
            break;  }
    }
if (GetIsNight())
    {
    switch( Random(7) ){
        case 1: Spider(  );
            break;
        case 2: Serpent(  );
            break;
        case 3: Lobos(  );
            break;
        case 4: Osos(  );
            break;
        case 5: Ogre(  );
            break;
        case 6: Undead(  );
            break;
        case 0: Bestias(  );
            break;  }
    }
}
