using System;
using System.Web.UI;

namespace AsesoriaLegalGlobal
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            // Desactivar UnobtrusiveValidationMode para los validadores
            // (evita la dependencia de jQuery sin perder funcionalidad)
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }
    }
}