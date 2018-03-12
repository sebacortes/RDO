#include "templo_il"

void main()
{
    int monedas = GetCampaignInt(ReconstruccionTemplo_DB, ReconstruccionTemplo_DONACIONES);
    SetCustomToken(123, IntToString(monedas));
}
