using System;
using System.Web;

namespace AsesoriaLegalGlobal
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void ButtonRegistrar_Click(object sender, EventArgs e)
        {
            
            if (this.IsValid)
            {
                // ========================================
                // ALMACENAMIENTO según consigna:
                // - Contraseña en una COOKIE
                // - Nombre de usuario en una SESSION
                // ========================================

                // 1) Guardar el nombre de usuario en variable de sesión
                this.Session["usuario"] = TextBoxUsuario.Text;

                // 2) Guardar la contraseña en una cookie
                HttpCookie cookieClave = new HttpCookie("clave", TextBoxClave.Text);
                cookieClave.Expires = DateTime.Now.AddDays(7); // expira en 7 días
                this.Response.Cookies.Add(cookieClave);

                // 3) (Adicional, útil para mostrar nombre completo)
                this.Session["nombreCompleto"] = TextBoxNombre.Text + " " + TextBoxApellido.Text;
                this.Session["correo"] = TextBoxCorreo.Text;

                // 4) Redireccionar al espacio personal del usuario
                this.Response.Redirect("MisDocumentos.aspx");
            }
        }
    }
}