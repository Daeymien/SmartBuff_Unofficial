-------------------------------------------------------------------------------
-- Spanish Localization
-- Big thanks to Chusina
-------------------------------------------------------------------------------

if (GetLocale() == "esES") then

-- Weapon types
SMARTBUFF_WEAPON_STANDARD = {"Dagas", "Hachas", "Espadas", "Mazas", "Bastones", "Armas de pu\195\177o", "Lanzas", "Arma arrojadiza"};
SMARTBUFF_WEAPON_BLUNT = {"Mazas", "Bastones", "Armas de pu\195\177o"};
SMARTBUFF_WEAPON_BLUNT_PATTERN = "^Contrapeso %a+";
SMARTBUFF_WEAPON_SHARP = {"Dagas", "Hachas", "Espadas", "Lanzas"};
SMARTBUFF_WEAPON_SHARP_PATTERN = "^Piedra de afilar %a+";

-- Creature types
SMARTBUFF_HUMANOID  = "Humanoide";
SMARTBUFF_DEMON     = "Demonio";
SMARTBUFF_BEAST     = "Bestia";
SMARTBUFF_ELEMENTAL = "Elemental";
SMARTBUFF_DEMONTYPE = "Diablillo";
SMARTBUFF_UNDEAD    = "No-muerto";

-- Classes
SMARTBUFF_CLASSES = {"Druida", "Cazador", "Mago", "Palad\195\173n", "Sacerdote", "P\195\173caro", "Cham\195\161n", "Brujo", "Guerrero", "Caballero de la Muerte", "Monje", "Cazador de demonios", "Mascota de cazador", "Mascota de brujo", "Mascota de caballero de la Muerte", "Tanque", "Sanador", "Infligir da\195\177o"};

-- Templates and Instances
SMARTBUFF_TEMPLATES = {"Solo", "Grupo", "Banda", "Campos de batalla", "Arena", "CCH", "PdC", "Ulduar", "MC", "Ony", "BWL", "Naxx", "AQ", "ZG", "Custom 1", "Custom 2", "Custom 3", "Custom 4", "Custom 5"};
SMARTBUFF_INSTANCES = {"Ciudadela de la Corona de Hielo", "Prueba del Cruzado", "Ulduar", "N\195\186cleo de Magma", "Guarida de Onyxia", "Guarida alanegra", "Naxxramas", "Ahn'Qiraj", "Zul'Gurub"};

-- Mount
SMARTBUFF_MOUNT = "Aumenta la velocidad en un (%d+)%%.";

-- Bindings
BINDING_NAME_SMARTBUFF_BIND_TRIGGER = "Disparador";
BINDING_NAME_SMARTBUFF_BIND_TARGET  = "Objetivo";
BINDING_NAME_SMARTBUFF_BIND_OPTIONS = "Men\195\186 de opciones";
BINDING_NAME_SMARTBUFF_BIND_RESETBUFFTIMERS = "Restaurar temporizador de buffs";

-- Options Frame Text
SMARTBUFF_OFT                = "SmartBuff On/Off";
SMARTBUFF_OFT_MENU           = "Mostrar/Ocultar men\195\186 de opciones";
SMARTBUFF_OFT_AUTO           = "Recordatorio";
SMARTBUFF_OFT_AUTOTIMER      = "Revisar temporizador";
SMARTBUFF_OFT_AUTOCOMBAT     = "en combate";
SMARTBUFF_OFT_AUTOCHAT       = "Chat";
SMARTBUFF_OFT_AUTOSPLASH     = "Splash";
SMARTBUFF_OFT_AUTOSOUND      = "Sonido";
SMARTBUFF_OFT_AUTOREST       = "Desactivar en ciudades";
SMARTBUFF_OFT_HUNTERPETS     = "Buffar mascotas de Cazador";
SMARTBUFF_OFT_WARLOCKPETS    = "Buffar mascotas de Brujo";
SMARTBUFF_OFT_ARULES         = "Reglas avanzadas";
SMARTBUFF_OFT_GRP            = "Subgrupos de Banda para buffar";
SMARTBUFF_OFT_SUBGRPCHANGED  = "Abrir men\195\186 de opciones";
SMARTBUFF_OFT_BUFFS          = "Buffs/Habilidades";
SMARTBUFF_OFT_TARGET         = "Buffar el objetivo seleccionado";
SMARTBUFF_OFT_DONE           = "Hecho";
SMARTBUFF_OFT_APPLY          = "Aplicar";
SMARTBUFF_OFT_GRPBUFFSIZE    = "Tama\195\177o del grupo";
SMARTBUFF_OFT_CLASSBUFFSIZE  = "Tama\195\177o de clase";
SMARTBUFF_OFT_MESSAGES       = "Desactivar im\195\161genes";
SMARTBUFF_OFT_MSGNORMAL      = "normal";
SMARTBUFF_OFT_MSGWARNING     = "aviso";
SMARTBUFF_OFT_MSGERROR       = "error";
SMARTBUFF_OFT_HIDEMMBUTTON   = "Ocultar bot\195\179n de minimapa";
SMARTBUFF_OFT_REBUFFTIMER    = "Temporizador de Rebuff";
SMARTBUFF_OFT_AUTOSWITCHTMP  = "Cambiar plantilla";
SMARTBUFF_OFT_SELFFIRST      = "Primero uno mismo";
SMARTBUFF_OFT_SCROLLWHEELUP  = "Buffar con scroll arriba";
SMARTBUFF_OFT_SCROLLWHEELDOWN= "abajo";
SMARTBUFF_OFT_TARGETSWITCH   = "cambio de objetivo";
SMARTBUFF_OFT_BUFFTARGET     = "Buffar objetivo";
SMARTBUFF_OFT_BUFFPVP        = "Buffar en JcJ";
SMARTBUFF_OFT_AUTOSWITCHTMPINST = "Instancias";
SMARTBUFF_OFT_CHECKCHARGES   = "Comprobar cargas";
SMARTBUFF_OFT_RBT            = "Restaurar BT";
SMARTBUFF_OFT_BUFFINCITIES   = "Buffar en ciudades";
SMARTBUFF_OFT_UISYNC         = "Sincronizar con UI";
SMARTBUFF_OFT_BLDURATION     = "Lista Negra";
SMARTBUFF_OFT_COMPMODE       = "Modo Comp.";
SMARTBUFF_OFT_MINIGRP        = "Mini grupo";
SMARTBUFF_OFT_ANTIDAZE       = "Anti aturdimiento";
SMARTBUFF_OFT_HIDESABUTTON   = "Ocultar bot\195\179n de acci\195\179n";
SMARTBUFF_OFT_INCOMBAT       = "en combate";
SMARTBUFF_OFT_SMARTDEBUFF    = "SmartDebuff";
SMARTBUFF_OFT_INSHAPESHIFT   = "Shapeshift";
SMARTBUFF_OFT_LINKGRPBUFFCHECK  = "Grp link";
SMARTBUFF_OFT_LINKSELFBUFFCHECK = "Self link";
SMARTBUFF_OFT_RESETALL       = "Reset All";
SMARTBUFF_OFT_RESETLIST      = "Reset List";
SMARTBUFF_OFT_YES            = "Yes";
SMARTBUFF_OFT_NO             = "No";
SMARTBUFF_OFT_PURGE_DATA     = "Are you sure you want to reset ALL SmartBuff data?\nThis action will force a reload of the UI!";

-- Options Frame Tooltip Text
SMARTBUFF_OFTT               = "Alterna SmartBuff On/Off";
SMARTBUFF_OFTT_AUTO          = "Alterna el recordatorio de buff On/Off";
SMARTBUFF_OFTT_AUTOTIMER     = "Retraso en segundos entre dos comprobaciones.";
SMARTBUFF_OFTT_AUTOCOMBAT    = "Ejecutar comprobaci\195\179n tambi\195\169n en combate.";
SMARTBUFF_OFTT_AUTOCHAT      = "Muestra los buffs perdidos como mensajes en el chat.";
SMARTBUFF_OFTT_AUTOSPLASH    = "Muestra los buffs perdidos como mensajes en medio de la pantalla.";
SMARTBUFF_OFTT_AUTOSOUND     = "Toca un sonido cuando se pierden los buffs.";
SMARTBUFF_OFTT_AUTOREST      = "Desactiva el recordatorio en las ciudades principales";
SMARTBUFF_OFTT_HUNTERPETS    = "Buffar la mascota del cazador tambi\195\169n.";
SMARTBUFF_OFTT_WARLOCKPETS   = "Buffar la mascota del brujo tambi\195\169n, excepto el " .. SMARTBUFF_DEMONTYPE .. ".";
SMARTBUFF_OFTT_ARULES        = "No lanzar:\n- Espinas en Magos, Sacerdotes y Brujos\n- Intelecto Arcano en unidades sin Man\195\161\n- Esp\195\173ritu divino en unidades sin Man\195\161";
SMARTBUFF_OFTT_SUBGRPCHANGED = "Abrir autom\195\161ticamente el men\195\186 de opciones,\ncuando has cambiado de subgrupo.";
SMARTBUFF_OFTT_GRPBUFFSIZE   = "A cu\195\161ntos jugadores con el buff de grupo\nperdido y que deber\195\173an estar en el grupo,\n va a buffar el buff de grupo.";
SMARTBUFF_OFTT_HIDEMMBUTTON  = "Oculta el bot\195\179n de SmartBuff del minimapa.";
SMARTBUFF_OFTT_REBUFFTIMER   = "Cu\195\161ntos segundos antes de que el buff expire,\nte debe alertar el recordatorio.\n0 = Desactivado";
SMARTBUFF_OFTT_SELFFIRST     = "Buffar tu personaje antes que los dem\195\161s.";
SMARTBUFF_OFTT_SCROLLWHEELUP = "Lanzar buffs cuando muevas tu\nrueda del rat\195\179n adelante.";
SMARTBUFF_OFTT_SCROLLWHEELDOWN = "Lanzar buffs cuando muevas tu\nrueda del rat\195\179n atr\195\161s.";
SMARTBUFF_OFTT_TARGETSWITCH  = "Lanzar buffs cuando cambias de objetivo.";
SMARTBUFF_OFTT_BUFFTARGET    = "Buffar primero el objetivo actual,\nsi es amigable.";
SMARTBUFF_OFTT_BUFFPVP       = "Buffar jugadores con JcJ activo,\naunque t\195\186 no lo tengas activado.";
SMARTBUFF_OFTT_AUTOSWITCHTMP = "Cambiar autom\195\161ticamente la plantilla,\nsi el tipo de grupo cambia.";
SMARTBUFF_OFTT_AUTOSWITCHTMPINST = "Cambiar autom\195\161ticamente la plantilla,\nsi la instancia cambia.";
SMARTBUFF_OFTT_CHECKCHARGES  = "Muestra cantidad baja de \ncargas en un buff.\n0 = Desactivado";
SMARTBUFF_OFTT_BUFFINCITIES  = "Buffar tambi\195\169n si est\195\161s en una ciudad principal.\nSi tienes activado el JcJ, buffar igualmente.";
SMARTBUFF_OFTT_UISYNC        = "Activar sincronizaci\195\179n con la UI\npara recuperar el tiempo de buff restante de otros jugadores.";
SMARTBUFF_OFTT_BLDURATION    = "Cuantos segundos est\195\161n los jugadores en la lista negra.\n0 = Desactivado";
SMARTBUFF_OFTT_COMPMODE      = "Modo compatible\nAtenci\195\179n!!!\nUsar este modo s\195\179lo si est\195\161s\nteniendo problemas para lanzarte buffs a t\195\173 mismo.";
SMARTBUFF_OFTT_MINIGRP       = "Mostrar los ajustes del subgrupo de banda en un\nmarco propio movible";
SMARTBUFF_OFTT_ANTIDAZE      = "Autom\195\161ticamente cancela el\naspecto del mono/manada\nsi alguien est\195\161 aturdido\n(\195\169l mismo o el grupo).";
SMARTBUFF_OFTT_SPLASHSTYLE   = "Cambia la fuente de\nlos mensajes de buff.";
SMARTBUFF_OFTT_HIDESABUTTON  = "Oculta el bot\195\179n de acci\195\179n de SmartBuff.";
SMARTBUFF_OFTT_INCOMBAT      = "De momento s\195\179lo funciona sobre t\195\173 mismo.\nEl primer buff que marcas para combate,\nse establecer\195\161 en el bot\195\179n antes del combate\ny puede ser usado en combate.\nAviso! Toda l\195\179gica se inutiliza en combate";
SMARTBUFF_OFTT_SMARTDEBUFF   = "Muestra la pesta\195\177a de SmartDeBuff";
SMARTBUFF_OFTT_SPLASHDURATION= "Cu\195\161ntos segundos estar\195\161 en pantalla el\nmensaje,\nantes de atenuarse.";
SMARTBUFF_OFTT_INSHAPESHIFT  = "Cast buffs also if you\nare shapeshifted.";
SMARTBUFF_OFTT_LINKGRPBUFFCHECK  = "Checks if a buff of an other\nclass with similar effect\nis already active.";
SMARTBUFF_OFTT_LINKSELFBUFFCHECK = "Checks if a self buff is active,\nwhose only one can be\nactive at a time.";

-- Buffsetup Frame Text
SMARTBUFF_BST_SELFONLY       = "Uno mismo s\195\179lo";
SMARTBUFF_BST_SELFNOT        = "No a uno mismo";
SMARTBUFF_BST_COMBATIN       = "En combate";
SMARTBUFF_BST_COMBATOUT      = "Fuera de combate";
SMARTBUFF_BST_MAINHAND       = "Mano principal";
SMARTBUFF_BST_OFFHAND        = "Una mano";
SMARTBUFF_BST_RANGED         = "Arma arrojadiza";
SMARTBUFF_BST_REMINDER       = "Notificaci\195\179n";
SMARTBUFF_BST_MANALIMIT      = "M\195\173nimo obligado";

-- Buffsetup Frame Tooltip Text
SMARTBUFF_BSTT_SELFONLY      = "Buffar s\195\179lo tu personaje.";
SMARTBUFF_BSTT_SELFNOT       = "Buffar todas las clases seleccionadas excepto tu personaje.";
SMARTBUFF_BSTT_COMBATIN      = "Buffar si est\195\161s en combate.";
SMARTBUFF_BSTT_COMBATOUT     = "Buffar si est\195\161s fuera de combate.";
SMARTBUFF_BSTT_MAINHAND      = "Buffar Mano principal.";
SMARTBUFF_BSTT_OFFHAND       = "Buffar Una mano.";
SMARTBUFF_BSTT_RANGED        = "Buffs the ranged slot.";
SMARTBUFF_BSTT_REMINDER      = "Visualizar mensaje recordatorio.";
SMARTBUFF_BSTT_REBUFFTIMER   = "Cu\195\161ntos segundos antes de que el buff expire,\ndebe el recordatorio avisarte.\n0 = temporizador de rebuff global";
SMARTBUFF_BSTT_MANALIMIT     = "Umbral de Man\195\161/Ira/Energ\195\173a\nSi tienes menos de este valor\nno se lanzar\195\161 el buff";

-- Playersetup Frame Tooltip Text
SMARTBUFF_PSTT_RESIZE        = "Minimiza/maximiza\nla ventana principal de opciones";

-- Messages
SMARTBUFF_MSG_LOADED         = "cargado";
SMARTBUFF_MSG_DISABLED       = "SmartBuff est\195\161 deshabilitado!";
SMARTBUFF_MSG_SUBGROUP       = "Te has unido a un nuevo subgrupo, por favor comprueba las opciones!";
SMARTBUFF_MSG_NOTHINGTODO    = "Nada que hacer";
SMARTBUFF_MSG_BUFFED         = "buffado";
SMARTBUFF_MSG_OOR            = "est\195\161 fuera de rango para lanzar el buff!";
--SMARTBUFF_MSG_CD             = "est\195\161 recargando!";
SMARTBUFF_MSG_CD             = "Recarga global!";
SMARTBUFF_MSG_CHAT           = "no es posible en el modo chat!";
SMARTBUFF_MSG_SHAPESHIFT     = "No se puede lanzar con la forma cambiada!";
SMARTBUFF_MSG_NOACTIONSLOT   = "necesita un hueco en la barra de acci\195\179n para funcionar correctamente!";
SMARTBUFF_MSG_GROUP          = "Grupo";
SMARTBUFF_MSG_NEEDS          = "necesitas";
SMARTBUFF_MSG_OOM            = "No hay suficiente man\195\161/ira/energ\195\173a!";
SMARTBUFF_MSG_STOCK          = "No tienes stock";
SMARTBUFF_MSG_NOREAGENT      = "Sin reagente:";
SMARTBUFF_MSG_DEACTIVATED    = "desactivado!";
SMARTBUFF_MSG_REBUFF         = "Rebuff";
SMARTBUFF_MSG_LEFT           = "tiempo restante";
SMARTBUFF_MSG_CLASS          = "Clase";
SMARTBUFF_MSG_CHARGES        = "cargas";
SMARTBUFF_MSG_SPECCHANGED    = "Spec changed (%s), loading buff templates...";

-- Support
SMARTBUFF_MINIMAP_TT         = "Click izquierdo: men\195\186 de opciones\nClick derecho: On/Off\nAlt-Click izquierdo: SmartDebuff\nMay\195\186scuals arrastrar: Mover bot\195\179n";
SMARTBUFF_TITAN_TT           = "Click izquierdo: Abrir opciones\nClick derecho: On/Off\nAlt-Click izquierdo: SmartDebuff";
SMARTBUFF_FUBAR_TT           = "\nClick izquierdo: Abrir opciones\nMay\195\186sulas-Click izquierdo: On/Off\nAlt-Click izquierdo: SmartDebuff";

SMARTBUFF_DEBUFF_TT          = "May\195\186sculas-arrastrar bot\195\179n izquierdo: Mover marco\n|cff20d2ff- S bot\195\179n -|r\nClick izquierdo: Mostrar por clases\nMay\195\186sculas-Click izquierdo: Clases por colores\nAlt-Click izquierdo: Destacar L/R\n|cff20d2ff- P bot\195\179n -|r\nLeft click: Hide pets on/off";

end
