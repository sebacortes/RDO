#include "cib_registro"

const string ReconstruccionTemplo_DB    = "rtemplo";
const string ReconstruccionTemplo_DONACIONES = "donaciones";


// Realiza una donacion al templo. Esta donacion se descuenta de la balanza de intercambio
void ReconstruccionTemplo_donar( object oPC, object clerigo, int donacion );
void ReconstruccionTemplo_donar( object oPC, object clerigo, int donacion )
{
    string mensaje = "";
    if (GetGold(oPC) >= donacion) {

        TakeGoldFromCreature(donacion, oPC, TRUE);

        int caja = GetCampaignInt(ReconstruccionTemplo_DB, ReconstruccionTemplo_DONACIONES);
        SetCampaignInt(ReconstruccionTemplo_DB, ReconstruccionTemplo_DONACIONES, caja+donacion);

        struct CIB_Balance balanceDonante = CIB_getBalance( GetName(oPC, TRUE) );

        CIB_registrarPerdida( balanceDonante, donacion );

        int balancePorcentual = CIB_getBalancePorcentual( balanceDonante.recibido - balanceDonante.dado, GetHitDice(oPC) );
        SendMessageToPC( oPC, "Tu balanza de intercambio baja a " + IntToString(balancePorcentual) + "%" );

        if (donacion >= 50000) {
            mensaje = "El dios del lamento agradece tu generosa oferta.";
        } else {
            mensaje = "Gracias por tu generosa oferta! El templo no olvidara tu accion.";
        }

    } else {
        mensaje = "No tienes esa cantidad de oro. Sal de aqui antes de que ofendas a los enfermos que no tienen un techo!";
    }
    AssignCommand(clerigo, ActionSpeakString(mensaje));
}
