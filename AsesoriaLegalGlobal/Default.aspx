<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AsesoriaLegalGlobal.Default" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="ContentPrincipal" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="hero">
    <asp:Image ID="ImagenHero" runat="server" ImageUrl="~/Imagenes/logo-secundario.png" 
               AlternateText="Logo Asesoría Legal Global" CssClass="hero-imagen" />
    <h1>Bienvenido a Asesoría Legal Global</h1>
    <p class="hero-subtitle">
        Brindamos servicios profesionales de consultoría legal con más de 20 años de experiencia.
        Confíe en nosotros para gestionar sus asuntos legales con total seguridad y profesionalismo.
    </p>
    <asp:HyperLink ID="LinkRegistrarse" runat="server" NavigateUrl="~/Registro.aspx" CssClass="btn-primario">
        Registrarse ahora
    </asp:HyperLink>
</section>

    <section class="servicios">
        <h2>Nuestros servicios</h2>
        <div class="servicios-grid">
            <div class="servicio-card">
                <h3>📋 Asesoramiento Corporativo</h3>
                <p>Constitución de sociedades, contratos comerciales y compliance empresarial.</p>
            </div>
            <div class="servicio-card">
                <h3>⚖️ Derecho Laboral</h3>
                <p>Defensa de empresas y empleados en conflictos laborales y previsionales.</p>
            </div>
            <div class="servicio-card">
                <h3>🏠 Derecho Civil</h3>
                <p>Sucesiones, contratos, propiedad horizontal y resolución de conflictos.</p>
            </div>
            <div class="servicio-card">
                <h3>🔒 Gestión Documental</h3>
                <p>Sistema seguro para almacenar y gestionar sus documentos legales en línea.</p>
            </div>
        </div>
    </section>

    <section class="cta">
        <h2>¿Listo para comenzar?</h2>
        <p>Registrate y accedé a tu espacio personal de gestión de documentos.</p>
        <asp:HyperLink ID="LinkRegistro2" runat="server" NavigateUrl="~/Registro.aspx" CssClass="btn-primario">
            Crear mi cuenta
        </asp:HyperLink>
    </section>

</asp:Content>