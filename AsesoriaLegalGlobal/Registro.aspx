<%@ Page Title="Registro de Usuario" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="AsesoriaLegalGlobal.Registro" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="ContentPrincipal" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="formulario-container">
        <h1>Crear cuenta</h1>
        <p class="subtitulo">Completá los datos para registrarte y acceder a tu espacio de gestión de documentos.</p>

        <%-- ============================================
             CAMPO: Correo electrónico
             ============================================ --%>
        <div class="form-group">
            <asp:Label ID="LabelCorreo" runat="server" Text="Correo electrónico:" AssociatedControlID="TextBoxCorreo"></asp:Label>
            <asp:TextBox ID="TextBoxCorreo" runat="server" TextMode="Email" CssClass="form-input"></asp:TextBox>

            <asp:RequiredFieldValidator ID="RFV_Correo" runat="server"
                ControlToValidate="TextBoxCorreo"
                ErrorMessage="El correo electrónico es obligatorio."
                Text="* Obligatorio"
                CssClass="error-msg"
                Display="Dynamic">
            </asp:RequiredFieldValidator>

            <asp:RegularExpressionValidator ID="REV_Correo" runat="server"
                ControlToValidate="TextBoxCorreo"
                ErrorMessage="El formato del correo no es válido."
                Text="* Formato inválido"
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                CssClass="error-msg"
                Display="Dynamic">
            </asp:RegularExpressionValidator>
        </div>

        <%-- ============================================
             CAMPO: Nombre de usuario
             ============================================ --%>
        <div class="form-group">
            <asp:Label ID="LabelUsuario" runat="server" Text="Nombre de usuario:" AssociatedControlID="TextBoxUsuario"></asp:Label>
            <asp:TextBox ID="TextBoxUsuario" runat="server" CssClass="form-input"></asp:TextBox>

            <asp:RequiredFieldValidator ID="RFV_Usuario" runat="server"
                ControlToValidate="TextBoxUsuario"
                ErrorMessage="El nombre de usuario es obligatorio."
                Text="* Obligatorio"
                CssClass="error-msg"
                Display="Dynamic">
            </asp:RequiredFieldValidator>
        </div>

        <%-- ============================================
             CAMPO: Nombre
             ============================================ --%>
        <div class="form-group">
            <asp:Label ID="LabelNombre" runat="server" Text="Nombre:" AssociatedControlID="TextBoxNombre"></asp:Label>
            <asp:TextBox ID="TextBoxNombre" runat="server" CssClass="form-input"></asp:TextBox>

            <asp:RequiredFieldValidator ID="RFV_Nombre" runat="server"
                ControlToValidate="TextBoxNombre"
                ErrorMessage="El nombre es obligatorio."
                Text="* Obligatorio"
                CssClass="error-msg"
                Display="Dynamic">
            </asp:RequiredFieldValidator>
        </div>

        <%-- ============================================
             CAMPO: Apellido
             ============================================ --%>
        <div class="form-group">
            <asp:Label ID="LabelApellido" runat="server" Text="Apellido:" AssociatedControlID="TextBoxApellido"></asp:Label>
            <asp:TextBox ID="TextBoxApellido" runat="server" CssClass="form-input"></asp:TextBox>

            <asp:RequiredFieldValidator ID="RFV_Apellido" runat="server"
                ControlToValidate="TextBoxApellido"
                ErrorMessage="El apellido es obligatorio."
                Text="* Obligatorio"
                CssClass="error-msg"
                Display="Dynamic">
            </asp:RequiredFieldValidator>
        </div>

        <%-- ============================================
             CAMPO: Edad (numérico y mayor a 15)
             ============================================ --%>
        <div class="form-group">
            <asp:Label ID="LabelEdad" runat="server" Text="Edad:" AssociatedControlID="TextBoxEdad"></asp:Label>
            <asp:TextBox ID="TextBoxEdad" runat="server" TextMode="Number" CssClass="form-input"></asp:TextBox>

            <asp:RequiredFieldValidator ID="RFV_Edad" runat="server"
                ControlToValidate="TextBoxEdad"
                ErrorMessage="La edad es obligatoria."
                Text="* Obligatorio"
                CssClass="error-msg"
                Display="Dynamic">
            </asp:RequiredFieldValidator>

            <asp:RangeValidator ID="RV_Edad" runat="server"
                ControlToValidate="TextBoxEdad"
                ErrorMessage="Debe ser mayor de 15 años."
                Text="* Debe ser mayor de 15 años"
                MinimumValue="16"
                MaximumValue="120"
                Type="Integer"
                CssClass="error-msg"
                Display="Dynamic">
            </asp:RangeValidator>
        </div>

        <%-- ============================================
             CAMPO: Contraseña
             ============================================ --%>
        <div class="form-group">
            <asp:Label ID="LabelClave" runat="server" Text="Contraseña:" AssociatedControlID="TextBoxClave"></asp:Label>
            <asp:TextBox ID="TextBoxClave" runat="server" TextMode="Password" CssClass="form-input"></asp:TextBox>

            <asp:RequiredFieldValidator ID="RFV_Clave" runat="server"
                ControlToValidate="TextBoxClave"
                ErrorMessage="La contraseña es obligatoria."
                Text="* Obligatorio"
                CssClass="error-msg"
                Display="Dynamic">
            </asp:RequiredFieldValidator>
        </div>

        <%-- ============================================
             CAMPO: Confirmar Contraseña
             ============================================ --%>
        <div class="form-group">
            <asp:Label ID="LabelClave2" runat="server" Text="Confirmar contraseña:" AssociatedControlID="TextBoxClave2"></asp:Label>
            <asp:TextBox ID="TextBoxClave2" runat="server" TextMode="Password" CssClass="form-input"></asp:TextBox>

            <asp:RequiredFieldValidator ID="RFV_Clave2" runat="server"
                ControlToValidate="TextBoxClave2"
                ErrorMessage="Debe confirmar la contraseña."
                Text="* Obligatorio"
                CssClass="error-msg"
                Display="Dynamic">
            </asp:RequiredFieldValidator>

            <asp:CompareValidator ID="CV_Clave" runat="server"
                ControlToValidate="TextBoxClave2"
                ControlToCompare="TextBoxClave"
                ErrorMessage="Las contraseñas no coinciden."
                Text="* Las contraseñas no coinciden"
                Operator="Equal"
                Type="String"
                CssClass="error-msg"
                Display="Dynamic">
            </asp:CompareValidator>
        </div>

        <%-- ============================================
             RESUMEN DE ERRORES + BOTÓN
             ============================================ --%>
        <asp:ValidationSummary ID="VS_Resumen" runat="server"
            HeaderText="Por favor, corregí los siguientes errores antes de continuar:"
            CssClass="validation-summary"
            DisplayMode="BulletList" />

        <div class="form-actions">
            <asp:Button ID="ButtonRegistrar" runat="server" Text="Registrar"
                        OnClick="ButtonRegistrar_Click"
                        CssClass="btn-primario" />
        </div>

        <asp:Label ID="LabelMensaje" runat="server" Text="" CssClass="mensaje-resultado"></asp:Label>

    </section>

</asp:Content>