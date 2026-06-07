using System;
using System.IO;
using System.Web;

namespace AsesoriaLegalGlobal
{
    public partial class MisDocumentos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // ========================================
            // VERIFICACIÓN DE SESIÓN
            // Si no hay usuario en sesión, redirigir a Registro
            // ========================================
            if (this.Session["usuario"] == null)
            {
                this.Response.Redirect("Registro.aspx");
                return;
            }

            // Saludo personalizado al usuario
            if (!IsPostBack)
            {
                string nombreCompleto = Session["nombreCompleto"] != null
                    ? Session["nombreCompleto"].ToString()
                    : Session["usuario"].ToString();

                LabelBienvenida.Text = "Bienvenido, <strong>" + nombreCompleto + "</strong>";

                // Mostrar el listado de documentos ya subidos
                MostrarListadoDocumentos();
            }
        }

        protected void ButtonSubir_Click(object sender, EventArgs e)
        {
            // Verificar que IsValid (validador obligatorio del archivo)
            if (!IsValid)
            {
                return;
            }

            try
            {
                // Obtener nombre del archivo y construir ruta destino
                string nombreArchivo = FileUploadDocumento.FileName;
                string rutaCarpeta = Server.MapPath("~/Documentos/");
                string rutaCompleta = rutaCarpeta + nombreArchivo;

                // Validar duplicado (Clase 8: usar File.Exists)
                if (File.Exists(rutaCompleta))
                {
                    LabelMensaje.Text = "⚠ Ya existe un archivo con ese nombre. Cambialo y volvé a intentar.";
                    LabelMensaje.ForeColor = System.Drawing.Color.Orange;
                    return;
                }

                // Validar tamaño máximo (4 MB)
                int tamanioBytes = FileUploadDocumento.PostedFile.ContentLength;
                int tamanioMB = tamanioBytes / (1024 * 1024);
                if (tamanioMB > 4)
                {
                    LabelMensaje.Text = "⚠ El archivo supera el tamaño máximo de 4 MB.";
                    LabelMensaje.ForeColor = System.Drawing.Color.Orange;
                    return;
                }

                // Guardar archivo en el servidor
                FileUploadDocumento.SaveAs(rutaCompleta);

                // Mensaje de éxito con detalles del archivo
                LabelMensaje.Text = "✅ Archivo subido correctamente.<br/>" +
                                    "<b>Nombre:</b> " + nombreArchivo + "<br/>" +
                                    "<b>Tamaño:</b> " + tamanioBytes + " bytes<br/>" +
                                    "<b>Tipo:</b> " + FileUploadDocumento.PostedFile.ContentType;
                LabelMensaje.ForeColor = System.Drawing.Color.Green;

                // Refrescar el listado
                MostrarListadoDocumentos();
            }
            catch (Exception ex)
            {
                LabelMensaje.Text = "Error al subir el archivo: " + ex.Message;
                LabelMensaje.ForeColor = System.Drawing.Color.Red;
            }
        }

        private void MostrarListadoDocumentos()
        {
            string rutaCarpeta = Server.MapPath("~/Documentos/");

            // Si la carpeta no existe, crearla
            if (!Directory.Exists(rutaCarpeta))
            {
                Directory.CreateDirectory(rutaCarpeta);
            }

            // Listar archivos
            string[] archivos = Directory.GetFiles(rutaCarpeta);

            if (archivos.Length == 0)
            {
                LabelListado.Text = "<p><em>Aún no subiste ningún documento.</em></p>";
            }
            else
            {
                string html = "<ul class='documentos-lista'>";
                foreach (string ruta in archivos)
                {
                    string nombre = Path.GetFileName(ruta);
                    FileInfo info = new FileInfo(ruta);
                    string tamanio = (info.Length / 1024).ToString() + " KB";
                    string fecha = info.LastWriteTime.ToString("dd/MM/yyyy HH:mm");

                    html += "<li>📄 <a href='Documentos/" + nombre + "' target='_blank'>" + nombre + "</a> " +
                            "<span class='archivo-meta'>(" + tamanio + " · subido " + fecha + ")</span></li>";
                }
                html += "</ul>";
                LabelListado.Text = html;
            }
        }

        protected void ButtonLogout_Click(object sender, EventArgs e)
        {
            // Limpiar la sesión y la cookie de la contraseña
            this.Session.Clear();
            this.Session.Abandon();

            if (this.Request.Cookies["clave"] != null)
            {
                HttpCookie cookieClave = new HttpCookie("clave");
                cookieClave.Expires = DateTime.Now.AddDays(-1); // expira en el pasado = se borra
                this.Response.Cookies.Add(cookieClave);
            }

            // Redirigir al inicio
            this.Response.Redirect("Default.aspx");
        }
    }
}