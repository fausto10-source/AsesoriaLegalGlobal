# ⚖️ Asesoría Legal Global — Sistema de Registro y Gestión Documental

**Parcial 2 — Laboratorio de Programación 3**  
ISSD Desarrollo de Software · 2026  
Docente: Prof. Mansilla Christian Eduardo

---

## 📋 Descripción

Sitio web para una empresa de consultoría legal que permite:
- Registro de usuarios con validaciones completas de cada campo.
- Almacenamiento de credenciales mediante **cookies** y **variables de sesión**.
- Espacio personal post-login para la **carga y gestión de documentos**.

Desarrollado con **ASP.NET Web Forms** (.NET Framework 4.7.2), aplicando los conceptos de las Clases 7 (validadores), 8 (FileUpload), 9 (Cookies y Session) y 11 (Master Page).

---

## 🛠️ Tecnologías utilizadas

- **Lenguaje:** C#
- **Framework:** ASP.NET Web Forms (.NET Framework 4.7.2)
- **IDE:** Visual Studio 2022
- **Estilos:** CSS3 con fuente Inter (Google Fonts)
- **Servidor de desarrollo:** IIS Express
- **Persistencia:** Cookies + Session (sin base de datos, según consigna)

---

## 📂 Estructura del proyecto

```
AsesoriaLegalGlobal/
├── Documentos/                    ← Carpeta donde se almacenan los archivos subidos
├── Imagenes/                      ← Logos e imágenes de la empresa
│   ├── logo.png
│   ├── logo-secundario.png
│   └── banner.png
├── MasterPage.master              ← Plantilla común (navbar + footer)
├── Default.aspx                   ← Página de inicio (hero + servicios + CTA)
├── Registro.aspx                  ← Formulario de registro con validadores
├── MisDocumentos.aspx             ← Área privada con FileUpload (requiere login)
├── Estilos.css                    ← Hoja de estilos del sitio
├── Global.asax                    ← Configuración global (UnobtrusiveValidationMode)
├── Web.config                     ← Configuración del proyecto
├── README.md                      ← Este archivo
└── .gitignore
```

---

## ✅ Cumplimiento de consignas

### Estructura de la Página Maestra (30 pts)

| Subcriterio | Pts | Implementación |
|---|---|---|
| Master Page | 10 | `MasterPage.master` con `<asp:ContentPlaceHolder>` |
| Navbar | 10 | Cabecera con logo + 3 HyperLinks (Inicio, Registro, Mis Documentos) |
| Footer | 10 | Pie con info de contacto, copyright y banner de la empresa |

### Formulario de Registro de Usuarios (40 pts)

| Subcriterio | Pts | Implementación |
|---|---|---|
| Campos requeridos | 15 | Correo, Usuario, Nombre, Apellido, Edad, Contraseña, Confirmar contraseña |
| Validaciones | 15 | `RequiredFieldValidator`, `RegularExpressionValidator` (email), `RangeValidator` (edad >15), `CompareValidator` (contraseñas), `ValidationSummary` |
| Almacenamiento | 10 | `Session["usuario"]` + `HttpCookie("clave")` con expiración a 7 días |

### Sistema de Gestión de Documentos (30 pts)

| Subcriterio | Pts | Implementación |
|---|---|---|
| Redirección post-login | 15 | `Response.Redirect("MisDocumentos.aspx")` y verificación de `Session["usuario"]` |
| Cargar Documentos | 15 | `FileUpload` con `SaveAs`, validación de duplicados con `File.Exists` y tamaño máximo 4 MB |

### Bonos (+20 pts)

| Subcriterio | Pts | Implementación |
|---|---|---|
| Diseño Responsivo | +10 | CSS con `@media queries` para móvil (480px) y tablet (768px) |
| Imágenes de la empresa | +10 | 3 imágenes integradas: logo en navbar, hero principal y banner en footer |

**Total: 120/120 puntos posibles**

---

## 🔐 Flujo de uso

1. **Acceso inicial:** el usuario llega a `Default.aspx` (página pública).
2. **Registro:** completa el formulario en `Registro.aspx` con todos los campos validados.
3. **Almacenamiento:** al hacer clic en "Registrar":
   - Nombre de usuario → `Session["usuario"]`
   - Contraseña → `HttpCookie("clave")` con expiración a 7 días
   - Datos adicionales en `Session["nombreCompleto"]` y `Session["correo"]`
4. **Redirección automática:** a `MisDocumentos.aspx` (área privada).
5. **Control de acceso:** si alguien intenta acceder a `MisDocumentos.aspx` sin sesión activa, es redirigido a `Registro.aspx`.
6. **Carga de archivos:** subida segura con validación de existencia y tamaño máximo.
7. **Logout:** botón "Cerrar sesión" que limpia `Session.Clear()` + `Session.Abandon()` + expira la cookie.

---

## 🎨 Identidad visual

Paleta de colores profesional adaptada al rubro legal:

- **Azul oscuro principal:** `#0A2540` (navbar, botones primarios, footer)
- **Azul corporativo:** `#1E40AF` (hover, focus, acentos)
- **Celeste pálido:** `#E8F1F8` (fondos sutiles, hero)
- **Dorado discreto:** `#B8860B` (tagline, títulos del footer, CTA destacado)
- **Tipografía:** Inter (Google Fonts)

Diseño responsivo con tres breakpoints: desktop, tablet (≤768px) y mobile (≤480px).

---

## 🚀 Cómo ejecutar el proyecto

1. Clonar el repositorio:
```bash
   git clone https://github.com/fausto10-source/AsesoriaLegalGlobal.git
```
2. Abrir la solución `AsesoriaLegalGlobal.sln` en Visual Studio 2022.
3. Restaurar paquetes NuGet (Visual Studio lo hace automáticamente).
4. Compilar (`Ctrl+Shift+B`) y ejecutar con IIS Express (botón ▶).

**No requiere base de datos.** Los datos del usuario se almacenan exclusivamente en cookies y sesión, según la consigna del parcial.

---

## 📝 Notas técnicas

- **`Global.asax`** desactiva `UnobtrusiveValidationMode` para evitar dependencia de jQuery en los validadores de ASP.NET.
- **Carpeta `Documentos/`** se crea automáticamente si no existe (`Directory.CreateDirectory`).
- **Validación cliente + servidor:** los validadores funcionan en el navegador (sin recarga) y también en el servidor (`if (this.IsValid)`).

---

## 👤 Autor

**Fausto Echeverría** — Estudiante de Desarrollo de Software, ISSD  
Año lectivo 2026