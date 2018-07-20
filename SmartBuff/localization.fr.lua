-------------------------------------------------------------------------------
-- French localization
-- Last update : 05/06/2006
-- By ( Sasmira, Cosmos Team )
-------------------------------------------------------------------------------

if (GetLocale() == "frFR") then

-- Weapon types
SMARTBUFF_WEAPON_STANDARD = {"Dagues", "Haches", "Ep\195\169es", "Masses", "B\195\162tons", "Armes de pugilat", "Armes d\'hast", "Armes de jet"};
SMARTBUFF_WEAPON_BLUNT = {"Masses", "B\195\162tons", "Armes de pugilat"};
SMARTBUFF_WEAPON_BLUNT_PATTERN = "^Pierre de lest ";
SMARTBUFF_WEAPON_SHARP = {"Dagues", "Haches", "Ep\195\169es", "Armes d\'hast"};
SMARTBUFF_WEAPON_SHARP_PATTERN = "^Pierre \195\160 aiguiser ";

-- Creature types
SMARTBUFF_HUMANOID  = "Humano\195\175de";
SMARTBUFF_DEMON     = "D\195\169mon";
SMARTBUFF_BEAST     = "B\195\170te";
SMARTBUFF_ELEMENTAL = "\195\137l\195\169mentaire";
SMARTBUFF_DEMONTYPE = "Diablotin";
SMARTBUFF_UNDEAD    = "Mort-vivant";

-- Classes
SMARTBUFF_CLASSES = {"Druide", "Chasseur", "Mage", "Paladin", "Pr\195\170tre", "Voleur", "Chaman", "D\195\169moniste", "Guerrier", "Chevalier de la mort", "Moine", "Chasseur de démons", "Chasseur Pet", "D\195\169moniste Pet", "Chevalier de la mort Pet", "Tank", "Gu\195\169risseur", "Sp\195\169cialiste des d\195\169g\195\162ts"};

-- Templates and Instances
SMARTBUFF_TEMPLATES = {"Seul", "Groupe", "Raid", "Champs de Bataille", "Ar\195\168ne", "CCG", "EdC", "Ulduar", "MC", "Ony", "BWL", "Naxx", "AQ", "ZG", "Custom 1", "Custom 2", "Custom 3", "Custom 4", "Custom 5"};
SMARTBUFF_INSTANCES = {"Citadelle de la Couronne de glace", "L\'\195\169preuve du crois\195\169", "Ulduar", "C\197\147ur du Magma", "Repaire d\'Onyxia", "Repaire de l\'Aile noire", "Naxxramas", "Ahn'Qiraj", "Zul'Gurub"};

-- Mount
SMARTBUFF_MOUNT = "Augmente la vitesse de (%d+)%%.";

-- Bindings
BINDING_NAME_SMARTBUFF_BIND_TRIGGER = "D\195\169clencheur";
BINDING_NAME_SMARTBUFF_BIND_TARGET  = "Cible";
BINDING_NAME_SMARTBUFF_BIND_OPTIONS = "Menu d\'Options";
BINDING_NAME_SMARTBUFF_BIND_RESETBUFFTIMERS = "Reset buff timers";

-- Options Frame Text
SMARTBUFF_OFT                = "ON/OFF SmartBuff";
SMARTBUFF_OFT_MENU           = "Afficher/Cacher le menu d\'options";
SMARTBUFF_OFT_AUTO           = "Rappel";
SMARTBUFF_OFT_AUTOTIMER      = "V\195\169rifier";
SMARTBUFF_OFT_AUTOCOMBAT     = "En combat";
SMARTBUFF_OFT_AUTOCHAT       = "Chat";
SMARTBUFF_OFT_AUTOSPLASH     = "Splash";
SMARTBUFF_OFT_AUTOSOUND      = "Son";
SMARTBUFF_OFT_AUTOREST       = "D\195\169sactiver dans les Capitales";
SMARTBUFF_OFT_HUNTERPETS     = "Buff: Pets Chasseur";
SMARTBUFF_OFT_WARLOCKPETS    = "Buff: Pets D\195\169mo.";
SMARTBUFF_OFT_ARULES         = "R\195\168gles avanc\195\169es";
SMARTBUFF_OFT_GRP            = "Sous Groupe Raid \195\160 Buffer";
SMARTBUFF_OFT_SUBGRPCHANGED  = "Ouvrir le menu";
SMARTBUFF_OFT_BUFFS          = "Buffs/Capacit\195\169s";
SMARTBUFF_OFT_TARGET         = "Buffs la cible s\195\169lectionn\195\169e";
SMARTBUFF_OFT_DONE           = "Quitter";
SMARTBUFF_OFT_APPLY          = "Appliquer";
SMARTBUFF_OFT_GRPBUFFSIZE    = "Taille: Groupe";
SMARTBUFF_OFT_CLASSBUFFSIZE  = "Taille: Classe";
SMARTBUFF_OFT_MESSAGES       = "D\195\169sactiver: Message";
SMARTBUFF_OFT_MSGNORMAL      = "Normal";
SMARTBUFF_OFT_MSGWARNING     = "Avertissement";
SMARTBUFF_OFT_MSGERROR       = "Erreur";
SMARTBUFF_OFT_HIDEMMBUTTON   = "Cacher: Bouton Minimap";
SMARTBUFF_OFT_REBUFFTIMER    = "Timer: Rebuff";
SMARTBUFF_OFT_AUTOSWITCHTMP  = "Changer de config";
SMARTBUFF_OFT_SELFFIRST      = "Moi en premier";
SMARTBUFF_OFT_SCROLLWHEELUP  = "Buff avec la Souris en haut";
SMARTBUFF_OFT_SCROLLWHEELDOWN= "en bas";
SMARTBUFF_OFT_TARGETSWITCH   = "Changer de Cible";
SMARTBUFF_OFT_BUFFTARGET     = "Buff sur Cible";
SMARTBUFF_OFT_BUFFPVP        = "JcJ Buff";
SMARTBUFF_OFT_AUTOSWITCHTMPINST = "Instance";
SMARTBUFF_OFT_CHECKCHARGES   = "Charges";
SMARTBUFF_OFT_RBT            = "Reset BT";
SMARTBUFF_OFT_BUFFINCITIES   = "Buff dans les Cap.";
SMARTBUFF_OFT_UISYNC         = "UI sync";
SMARTBUFF_OFT_BLDURATION     = "Liste noire";
SMARTBUFF_OFT_COMPMODE       = "Comp. mode";
SMARTBUFF_OFT_MINIGRP        = "Mini groupe";
SMARTBUFF_OFT_ANTIDAZE       = "Anti daze"; -- NOT TRANSLATED
SMARTBUFF_OFT_HIDESABUTTON   = "Cacher: Bouton action";
SMARTBUFF_OFT_INCOMBAT       = "en combat";
SMARTBUFF_OFT_SMARTDEBUFF    = "SmartDebuff";
SMARTBUFF_OFT_INSHAPESHIFT   = "Shapeshift";
SMARTBUFF_OFT_LINKGRPBUFFCHECK  = "Grp link";
SMARTBUFF_OFT_LINKSELFBUFFCHECK = "Self link";
SMARTBUFF_OFT_RESETALL       = "Reset All";
SMARTBUFF_OFT_RESETLIST      = "Reset List";
SMARTBUFF_OFT_YES            = "Oui";
SMARTBUFF_OFT_NO             = "No";
SMARTBUFF_OFT_PURGE_DATA     = "Are you sure you want to reset ALL SmartBuff data?\nThis action will force a reload of the UI!";

-- Options Frame Tooltip Text
SMARTBUFF_OFTT               = "ON/OFF SmartBuff";
SMARTBUFF_OFTT_AUTO          = "ON/OFF Le rappel de buff";
SMARTBUFF_OFTT_AUTOTIMER     = "D\195\169lai en secondes entre deux v\195\169rifications.";
SMARTBUFF_OFTT_AUTOCOMBAT    = "Lance une v\195\169rification en combat.";
SMARTBUFF_OFTT_AUTOCHAT      = "Affiche dans le chat un message lorsque le buff est expir\195\169.";
SMARTBUFF_OFTT_AUTOSPLASH    = "Affiche un message au milieu de l\'\195\169cran \nlorsque le buff est expir\195\169.";
SMARTBUFF_OFTT_AUTOSOUND     = "Joue un son lorsque les buffs sont expir\195\169s.";
SMARTBUFF_OFTT_AUTOREST      = "D\195\169sactiver le rappel dans les Capitales.";
SMARTBUFF_OFTT_HUNTERPETS    = "Buff les pets de Chasseur.";
SMARTBUFF_OFTT_WARLOCKPETS   = "Buff les pets de D\195\169moniste, except\195\169 le " .. SMARTBUFF_DEMONTYPE .. ".";
SMARTBUFF_OFTT_ARULES        = "Ne peut \195\170tre lanc\195\169:\n- Epines sur Mages, Pr\195\170tres et D\195\169monistes\n- Intelligence des Arcanes sur des unit\195\169s sans Mana\n- Esprit Divin sur des unit\195\169s sans Mana";
SMARTBUFF_OFTT_SUBGRPCHANGED = "Ouvre Automatiquement le menu d\'options de SmartBuff,\nlorsque vous changez de sous groupe.";
SMARTBUFF_OFTT_GRPBUFFSIZE   = "Le nombre de joueurs que vous avez \ndans le groupe pour utiliser le Buff de groupe.";
SMARTBUFF_OFTT_HIDEMMBUTTON  = "Cache le bouton SmartBuff de la Minimap.";
SMARTBUFF_OFTT_REBUFFTIMER   = "Indique le temps en secondes avant que le Buff expire,\nle rappel vous lancera une alerte.\n0 = D\195\169sactiv\195\169";
SMARTBUFF_OFTT_SELFFIRST     = "Buffs votre personnage en premier avant tous les autres.";
SMARTBUFF_OFTT_SCROLLWHEELUP = "Applique les buffs \nlorsque vous utilisez la molette de la souris.";
SMARTBUFF_OFTT_SCROLLWHEELDOWN = "Applique les buffs \nlorsque vous utilisez la molette de la souris.";
SMARTBUFF_OFTT_TARGETSWITCH  = "Lancer les buffs lorsque vous changez votre cible.";
SMARTBUFF_OFTT_BUFFTARGET    = "Buffs en premier la cible courante,\nde la m\195\170me faction.";
SMARTBUFF_OFTT_BUFFPVP       = "JcJ Buff sur les joueurs marqu\195\169s JcJ,\nm\195\170me si vous n\'\195\170tes pas vous aussi en JcJ.";
SMARTBUFF_OFTT_AUTOSWITCHTMP = "Change automatiquement de configuration,\nsi le type de groupe change.";
SMARTBUFF_OFTT_AUTOSWITCHTMPINST = "Change automatiquement de configuration,\nsi l\'instance change.";
SMARTBUFF_OFTT_CHECKCHARGES  = "Affiche un message au quantit\195\169 basse\nde charges que un Buff\n0 = D\195\169sactiv\195\169";
SMARTBUFF_OFTT_BUFFINCITIES  = "Buffs also if you are in capital cities.\nIf you are PvP flagged, it buffs in any case."; -- NOT TRANSLATED
SMARTBUFF_OFTT_UISYNC        = "Activate syncronisation with the UI\nto retrive the bufftime left from other players."; -- NOT TRANSLATED
SMARTBUFF_OFTT_BLDURATION    = "How many seconds, players will be blacklistet.\n0 = Deactivated"; -- NOT TRANSLATED
SMARTBUFF_OFTT_COMPMODE      = "Compatibility mode\nAttention!!!\nUses this mode only, if you are\nfacing problems to cast buffs on yourself.";
SMARTBUFF_OFTT_MINIGRP       = "Show raid subgoup settings in an\nown movable mini group frame."; -- NOT TRANSLATED
SMARTBUFF_OFTT_ANTIDAZE      = "Automatically cancels the\naspect of the cheetah/pack\nif someone gets dazed\n(self or group)."; -- NOT TRANSLATED
SMARTBUFF_OFTT_SPLASHSTYLE   = "Changes the fontstyle of\nthe buff messages."; -- NOT TRANSLATED
SMARTBUFF_OFTT_HIDESABUTTON  = "Cache le bouton SmartBuff de action."; -- NOT TRANSLATED
SMARTBUFF_OFTT_INCOMBAT      = "At the moment it only works on yourself.\nThe first buff you mark as in combat,\nwill set on the button before combat\nand you can use it in combat.\nWarning! All logic is disabled in combat!";
SMARTBUFF_OFTT_SMARTDEBUFF   = "Shows the SmartDebuff frame.";
SMARTBUFF_OFTT_SPLASHDURATION= "How many seconds the splash\nmessage will displayed,\nbefore it fades.";
SMARTBUFF_OFTT_INSHAPESHIFT  = "Cast buffs also if you\nare shapeshifted.";
SMARTBUFF_OFTT_LINKGRPBUFFCHECK  = "Checks if a buff of an other\nclass with similar effect\nis already active.";
SMARTBUFF_OFTT_LINKSELFBUFFCHECK = "Checks if a self buff is active,\nwhose only one can be\nactive at a time.";

-- Buffsetup Frame Text
SMARTBUFF_BST_SELFONLY       = "Sur Soi";
SMARTBUFF_BST_SELFNOT        = "Sur Soi pas";
SMARTBUFF_BST_COMBATIN       = "En combat";
SMARTBUFF_BST_COMBATOUT      = "Hors combat";
SMARTBUFF_BST_MAINHAND       = "Main Principale";
SMARTBUFF_BST_OFFHAND        = "Main Gauche";
SMARTBUFF_BST_RANGED         = "Armes de jet";
SMARTBUFF_BST_REMINDER       = "Notification";
SMARTBUFF_BST_MANALIMIT      = "Lower bound";

-- Buffsetup Frame Tooltip Text
SMARTBUFF_BSTT_SELFONLY      = "Buffs uniquement votre personnage.";
SMARTBUFF_BSTT_SELFNOT       = "Buffs all other selected classes,\nexcept your character."; -- NOT TRANSLATED
SMARTBUFF_BSTT_COMBATIN      = "Buffs si vous \195\170tes en combat.";
SMARTBUFF_BSTT_COMBATOUT     = "Buffs si vous \195\170tes hors combat.";
SMARTBUFF_BSTT_MAINHAND      = "Buffs La Main Principale.";
SMARTBUFF_BSTT_OFFHAND       = "Buffs La Main Gauche.";
SMARTBUFF_BSTT_RANGED        = "Buffs the ranged slot.";
SMARTBUFF_BSTT_REMINDER      = "Afficher le message de rappel.";
SMARTBUFF_BSTT_REBUFFTIMER   = "Indique le temps en secondes avant que le Buff expire,\nle rappel vous lancera une alerte.\n0 = Timer: Rebuff";
SMARTBUFF_BSTT_MANALIMIT     = "Mana/Rage/Energy threshold\nIf you are below this value\nit will not cast the buff.";

-- Playersetup Frame Tooltip Text
SMARTBUFF_PSTT_RESIZE        = "Minimize/maximize\nthe main options frame";

-- Messages
SMARTBUFF_MSG_LOADED         = "lanc\195\169";
SMARTBUFF_MSG_DISABLED       = "SmartBuff est d\195\169sactiv\195\169 !";
SMARTBUFF_MSG_SUBGROUP       = "Vous venez de rejoindre un nouveau sous groupe, merci de v\195\169rifier les options !";
SMARTBUFF_MSG_NOTHINGTODO    = "STOP, IL N\'Y A PLUS RIEN A LANCER !!! Tous les Buffs sont deja lanc\195\169s ;-)";
SMARTBUFF_MSG_BUFFED         = "vient d\'\195\170tre appliqu\195\169(e)";
SMARTBUFF_MSG_OOR            = "est hors de port\195\169e pour \195\170tre buff\195\169 !"
--SMARTBUFF_MSG_CD             = "vient d\'expirer !";
SMARTBUFF_MSG_CD             = "Global d\'expirer !";
SMARTBUFF_MSG_CHAT           = "Impossible en mode chat!";
SMARTBUFF_MSG_SHAPESHIFT     = "Le lancement du sort ne peut pas se faire sous cette forme !";
SMARTBUFF_MSG_NOACTIONSLOT   = "a besoin d\'un emplacement dans une barre d\'action pour fonctionner correctement !";
SMARTBUFF_MSG_GROUP          = "Groupe";
SMARTBUFF_MSG_NEEDS          = "a besoin de";
SMARTBUFF_MSG_OOM            = "Vous n\'avez pas assez de mana/rage/\195\169nergie !";
SMARTBUFF_MSG_STOCK          = "Stock actuel de";
SMARTBUFF_MSG_NOREAGENT      = "Plus assez de r\195\169actif:";
SMARTBUFF_MSG_DEACTIVATED    = "d\195\169sactivat\195\169!";
SMARTBUFF_MSG_REBUFF         = "Rebuff";
SMARTBUFF_MSG_LEFT           = "temps restant";
SMARTBUFF_MSG_CLASS          = "Classe";
SMARTBUFF_MSG_CHARGES        = "charges";
SMARTBUFF_MSG_SPECCHANGED    = "Spec changed (%s), loading buff templates...";

-- Support
SMARTBUFF_MINIMAP_TT         = "Left Click: Menu d\'options\nRight Click: ON/OFF\nAlt-Left Click: SmartDebuff\nShift drag: Move button"; -- NOT TRANSLATED
SMARTBUFF_TITAN_TT           = "Left Click: Menu d\'options\nRight Click: ON/OFF\nAlt-Left Click: SmartDebuff"; -- NOT TRANSLATED
SMARTBUFF_FUBAR_TT           = "\nLeft Click: Menu d\'options\nShift-Left Click: ON/OFF\nAlt-Left Click: SmartDebuff"; -- NOT TRANSLATED

SMARTBUFF_DEBUFF_TT          = "Shift-Left drag: Move frame\n|cff20d2ff- S button -|r\nLeft click: Show by classes\nShift-Left click: Class colors\nAlt-Left click: Highlight L/R\n|cff20d2ff- P button -|r\nLeft click: Hide pets on/off"; -- NOT TRANSLATED

end
