/******************* HandlersList **********************
package: Utilities - HandlersList
Autor: Inquisidor
Descripcion: HandlersList es un contenedor de una lista de handlers, los cuales pueden ejecutarse en el orden en que determina la lista.
*******************************************************************************/

// agrega el 'handler' al comienzo de 'this' lista de handlers
// Devuelva la lista modificada
// RECOMENDACION: poner los .ncs correspondientes a los handlers en el scrit cache
string HL_addFront( string this, string handler );
string HL_addFront( string this, string handler ) {
    handler = GetStringLeft(handler,16);
    return this + handler + GetStringLeft( "                 ", 17-GetStringLength(handler) );
}

// agrega el 'handler' al final de 'this' lista de handlers
// Devuelva la lista modificada
// RECOMENDACION: poner los .ncs correspondientes a los handlers en el scrit cache
string HL_addBack( string this, string handler );
string HL_addBack( string this, string handler ) {
    handler = GetStringLeft(handler,16);
    return handler + GetStringLeft("                 ", 17-GetStringLength(handler) ) + this;
}

// quita el 'handler' al comienzo de 'this' lista de handlers
// Devuelva la lista modificada
string HL_removeFront( string this );
string HL_removeFront( string this ) {
    return GetStringLeft( this, GetStringLength(this)-17 );
}

// quita el 'handler' al final de 'this' lista de handlers
// Devuelva la lista modificada
string HL_removeBack( string this );
string HL_removeBack( string this ) {
    return GetStringRight( this, GetStringLength(this)-17 );
}


// Ejecuta todos los handlers de 'this' lista de handler, en orden desde el primero hasta el último.
void HL_fire( string this, object actionSubject );
void HL_fire( string this, object actionSubject ) {
//    SendMessageToPC( GetFirstPC(), "HL_fire: this=["+this+"], length="+IntToString(GetStringLength(this)) );
    int handlerPos = GetStringLength( this );
    while( handlerPos > 0 ) {
        handlerPos -= 17;
        string handler = GetSubString( this, handlerPos, 17 );
        handler = GetStringLeft( handler, FindSubString( handler, " " ) );
//        SendMessageToPC( GetFirstPC(), "HL_fire: handler=["+handler+"], length="+IntToString(GetStringLength(handler)) );
        ExecuteScript( handler, actionSubject );
    }
}


