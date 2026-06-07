<%@ Page Title="Mis Documentos" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="MisDocumentos.aspx.cs" Inherits="AsesoriaLegalGlobal.MisDocumentos" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="ContentPrincipal" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="area-privada">

        <%-- ============================================
             ENCABEZADO PERSONALIZADO (Session)
             ============================================ --%>
        <div class="bienvenida-usuario">
            <h1>📁 Mis Documentos</h1>
            <asp:Label ID="LabelBienvenida" runat="server" CssClass="saludo"></asp:Label>
        </div>

        <hr />

        <%-- ============================================
             CARGA DE DOCUMENTOS (FileUpload)
             ============================================ --%>
        <div class="upload-container">
            <h2>Subir un documento</h2>
            <p class="upload-info">
                Seleccioná el archivo que querés subir a tu espacio personal.
                Tamaño máximo: 4 MB. Formatos admitidos: PDF, DOC, DOCX, JPG, PNG.
            </p>

            <div class="form-group">
                <asp:Label ID="LabelArchivo" runat="server" Text="Seleccionar archivo:" AssociatedControlID="FileUploadDocumento"></asp:Label>
                <asp:FileUpload ID="FileUploadDocumento" runat="server" CssClass="form-input" />
            </div>

            <%-- Validador: campo obligatorio --%>
            <asp:RequiredFieldValidator ID="RFV_Archivo" runat="server"
                ControlToValidate="FileUploadDocumento"
                ErrorMessage="Debe seleccionar un archivo."
                Text="* Debe seleccionar un archivo"
                CssClass="error-msg"
                Display="Dynamic"
                ValidationGroup="Upload">
            </asp:RequiredFieldValidator>

            <div class="form-actions">
                <asp:Button ID="ButtonSubir" runat="server" Text="Subir documento"
                            OnClick="ButtonSubir_Click"
                            ValidationGroup="Upload"
                            CssClass="btn-primario" />
            </div>

            <asp:Label ID="LabelMensaje" runat="server" Text="" CssClass="mensaje-resultado"></asp:Label>
        </div>

        <hr />

        <%-- ============================================
             LISTADO DE DOCUMENTOS SUBIDOS
             ============================================ --%>
        <div class="lista-documentos">
            <h2>Documentos almacenados</h2>
            <asp:Label ID="LabelListado" runat="server"></asp:Label>
        </div>

        <hr />

        <%-- ============================================
             CERRAR SESIÓN
             ============================================ --%>
        <div class="logout-container">
            <asp:Button ID="ButtonLogout" runat="server" Text="Cerrar sesión"
                        OnClick="ButtonLogout_Click"
                        CausesValidation="false"
                        CssClass="btn-secundario" />
        </div>

    </section>

</asp:Content>