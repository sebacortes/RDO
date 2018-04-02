/*******************************************************
Seguridad de Personaje

Reescrita para que tenga mas mensajes al usuario y se active automaticamente al crear el personaje
*******************************************************/

#include "Colors_inc"

const string Seguridad_DB_NAME      = "Nordock";
const string Seguridad_DB_STATUS    = "SEGURIDAD";
const string Seguridad_DB_CDKEY     = "CDKEY";

const string Seguridad_ITEM_TAG     = "SEGURIDAD";

void Seguridad_alertarDesactivada( object oPC );
void Seguridad_alertarDesactivada( object oPC )
{
    SendMessageToPC(oPC, ColorString( "Tu seguridad se encuentra desactivada!", COLOR_RED ));
}

int Seguridad_getEstaActivada( object oPC );
int Seguridad_getEstaActivada( object oPC )
{
    return (GetCampaignInt(Seguridad_DB_NAME, Seguridad_DB_STATUS, oPC) == 1);
}

void Seguridad_activar( object oPC );
void Seguridad_activar( object oPC )
{
    SetCampaignInt( Seguridad_DB_NAME, Seguridad_DB_STATUS, TRUE, oPC );
    SetCampaignString( Seguridad_DB_NAME, Seguridad_DB_CDKEY, GetPCPublicCDKey(oPC), oPC );
    SendMessageToPC( oPC, "Seguridad Activada!" );
}

void Seguridad_desactivar( object oPC );
void Seguridad_desactivar( object oPC )
{
    SetCampaignInt( Seguridad_DB_NAME, Seguridad_DB_STATUS, FALSE, oPC );
    SendMessageToPC( oPC, "Seguridad Desactivada!" );
}

void Seguridad_conmutar( object oPC );
void Seguridad_conmutar( object oPC )
{
    if (Seguridad_getEstaActivada( oPC ) == TRUE) {
        Seguridad_desactivar( oPC );
    } else {
        Seguridad_activar( oPC );
    }
}

void Seguridad_onAreaEnter( object oPC );
void Seguridad_onAreaEnter( object oPC )
{
    if (!Seguridad_getEstaActivada( oPC )) {
        Seguridad_alertarDesactivada( oPC );
    }
}

void Seguridad_onCrearPersonaje( object oPC );
void Seguridad_onCrearPersonaje( object oPC )
{
    SetCampaignString( Seguridad_DB_NAME, Seguridad_DB_CDKEY, GetPCPublicCDKey(oPC), oPC );
    SendMessageToPC( oPC, "Activando la seguridad por primera vez..." );
    Seguridad_activar( oPC );
}

void Seguridad_onClientEnter( object oPC );
void Seguridad_onClientEnter( object oPC )
{
    int seguridadActivada = GetCampaignInt(Seguridad_DB_NAME, Seguridad_DB_STATUS, oPC);
    if (seguridadActivada != FALSE && seguridadActivada != TRUE) {
        SetCampaignInt(Seguridad_DB_NAME, Seguridad_DB_STATUS, 0, oPC);
        seguridadActivada = FALSE;
    }
    if (seguridadActivada == TRUE) {
        string playerCdKey = GetPCPublicCDKey( oPC );
        if (GetCampaignString( Seguridad_DB_NAME, Seguridad_DB_CDKEY, oPC ) != playerCdKey) {
            
            string playerIpAddress = GetPCIPAddress( oPC );
            SendMessageToAllDMs(playerCdKey + " " + playerIpAddress);
            SendMessageToAllDMs("Anoten eso intento meterse ilegalmente");
            WriteTimestampedLogEntry(playerCdKey + " " + playerIpAddress + " " + "ENTRADA ILEGAL");
            
            if (GetIsObjectValid(oPC)) {
                BootPC(oPC);
            }
        }
    } else {
        Seguridad_alertarDesactivada( oPC );
    }
}