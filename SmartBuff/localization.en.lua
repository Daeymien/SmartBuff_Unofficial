-------------------------------------------------------------------------------
-- English localization (Default)
-------------------------------------------------------------------------------

-- Whats new info
SMARTBUFF_WHATSNEW = "|cffffffffWhats new:|r\n\n"
  .."- Added many Legion and BfA toys\n\n"
  .."- Fixed issued with scroll frame and massive amoutn of buffs nwo existing.\n\n"
  
  --[[
  .."- Thanks for donation:\n"
  .."  Maik M.\n"
  .."  Chris S.\n"
  .."  Glenn J.\n"
  .."  Jennyfer H.\n"
  .."  Jon B.\n"
  .."  Michael Z.\n"
  .."  :)"
  --]]
  ;


-- Weapon types
SMARTBUFF_WEAPON_STANDARD = {"Daggers", "Axes", "Swords", "Maces", "Staves", "Fist Weapons", "Polearms", "Thrown"};
SMARTBUFF_WEAPON_BLUNT = {"Maces", "Staves", "Fist Weapons"};
SMARTBUFF_WEAPON_BLUNT_PATTERN = "Weightstone$";
SMARTBUFF_WEAPON_SHARP = {"Daggers", "Axes", "Swords", "Polearms"};
SMARTBUFF_WEAPON_SHARP_PATTERN = "Sharpening Stone$";

-- Creature types
SMARTBUFF_HUMANOID  = "Humanoid";
SMARTBUFF_DEMON     = "Demon";
SMARTBUFF_BEAST     = "Beast";
SMARTBUFF_ELEMENTAL = "Elemental";
SMARTBUFF_DEMONTYPE = "Imp";
SMARTBUFF_UNDEAD    = "Undead";

-- Classes
SMARTBUFF_CLASSES = {"Druid", "Hunter", "Mage", "Paladin", "Priest", "Rogue", "Shaman", "Warlock", "Warrior", "Death Knight", "Monk", "Demon Hunter", "Hunter Pet", "Warlock Pet", "Death Knight Pet", "Tank", "Healer", "Damage Dealer"};

-- Templates and Instances
SMARTBUFF_TEMPLATES = {"Solo", "Party", "Raid", "Battleground", "Arena", "ICC", "TOC", "Ulduar", "MC", "Ony", "BWL", "Naxx", "AQ", "ZG", "Custom 1", "Custom 2", "Custom 3", "Custom 4", "Custom 5"};
SMARTBUFF_INSTANCES = {"Icecrown Citadel", "Trial of the Crusader", "Ulduar", "Molten Core", "Onyxia's Lair", "Blackwing Lair", "Naxxramas", "Ahn'Qiraj", "Zul'Gurub"};

-- Mount
SMARTBUFF_MOUNT = "Increases speed by (%d+)%%.";

-- Abbreviations
SMARTBUFF_ABBR_CHARGES_OL = "%d c";

-- Bindings
BINDING_NAME_SMARTBUFF_BIND_TRIGGER = "Trigger";
BINDING_NAME_SMARTBUFF_BIND_TARGET  = "Target";
BINDING_NAME_SMARTBUFF_BIND_OPTIONS = "Option menu";
BINDING_NAME_SMARTBUFF_BIND_RESETBUFFTIMERS = "Reset buff timers";

-- Options Frame Text
SMARTBUFF_OFT                = "SmartBuff On/Off";
SMARTBUFF_OFT_MENU           = "Show/hide options menu";
SMARTBUFF_OFT_AUTO           = "Reminder";
SMARTBUFF_OFT_AUTOTIMER      = "Check timer";
SMARTBUFF_OFT_AUTOCOMBAT     = "in combat";
SMARTBUFF_OFT_AUTOCHAT       = "Chat";
SMARTBUFF_OFT_AUTOSPLASH     = "Splash";
SMARTBUFF_OFT_AUTOSOUND      = "Sound";
SMARTBUFF_OFT_AUTOREST       = "Disable in cities";
SMARTBUFF_OFT_HUNTERPETS     = "Buff Hunter pets";
SMARTBUFF_OFT_WARLOCKPETS    = "Buff Warlock pets";
SMARTBUFF_OFT_ARULES         = "Advance rules";
SMARTBUFF_OFT_BUFFS          = "Buffs/Abilities";
SMARTBUFF_OFT_TARGET         = "Buffs the selected target";
SMARTBUFF_OFT_DONE           = "Done";
SMARTBUFF_OFT_APPLY          = "Apply";
SMARTBUFF_OFT_CLASSBUFFSIZE  = "Class size";
SMARTBUFF_OFT_MESSAGES       = "Disable messages";
SMARTBUFF_OFT_MSGNORMAL      = "normal";
SMARTBUFF_OFT_MSGWARNING     = "warning";
SMARTBUFF_OFT_MSGERROR       = "error";
SMARTBUFF_OFT_HIDEMMBUTTON   = "Hide minimap button";
SMARTBUFF_OFT_REBUFFTIMER    = "Rebuff Timer";
SMARTBUFF_OFT_AUTOSWITCHTMP  = "Switch template";
SMARTBUFF_OFT_SELFFIRST      = "Self first";
SMARTBUFF_OFT_SCROLLWHEELUP  = "Buff on scrollwheel up";
SMARTBUFF_OFT_SCROLLWHEELDOWN= "down";
SMARTBUFF_OFT_TARGETSWITCH   = "target change";
SMARTBUFF_OFT_BUFFTARGET     = "Buff target";
SMARTBUFF_OFT_BUFFPVP        = "Buff PvP";
SMARTBUFF_OFT_AUTOSWITCHTMPINST = "Instances";
SMARTBUFF_OFT_CHECKCHARGES   = "Check charges";
SMARTBUFF_OFT_RBT            = "Reset BT";
SMARTBUFF_OFT_BUFFINCITIES   = "Buff in cities";
SMARTBUFF_OFT_BLDURATION     = "Blacklisted";
SMARTBUFF_OFT_ANTIDAZE       = "Anti daze";
SMARTBUFF_OFT_HIDESABUTTON   = "Hide action button";
SMARTBUFF_OFT_INCOMBAT       = "in combat";
SMARTBUFF_OFT_SMARTDEBUFF    = "SmartDebuff";
SMARTBUFF_OFT_INSHAPESHIFT   = "Shapeshift";
SMARTBUFF_OFT_LINKGRPBUFFCHECK  = "Grp link";
SMARTBUFF_OFT_LINKSELFBUFFCHECK = "Self link";
SMARTBUFF_OFT_RESETALL       = "Reset All";
SMARTBUFF_OFT_RESETLIST      = "Reset List";
SMARTBUFF_OFT_YES            = "Yes";
SMARTBUFF_OFT_NO             = "No";
SMARTBUFF_OFT_PURGE_DATA     = "Are you sure you want to reset ALL SmartBuff data?\nThis action will force a reload of the UI!";
SMARTBUFF_OFT_SPLASHICON     = "Show Icon";
SMARTBUFF_OFT_SPLASHMSGSHORT = "Short Message";
SMARTBUFF_OFT_FONTSTYLE      = "Font";
SMARTBUFF_OFT_FONTSIZE       = "Font Size";
SMARTBUFF_OFT_ICONSIZE       = "Icon Size";


-- Options Frame Tooltip Text
SMARTBUFF_OFTT               = "Toggles SmartBuff On/Off";
SMARTBUFF_OFTT_AUTO          = "Toggles the buff reminder On/Off";
SMARTBUFF_OFTT_AUTOTIMER     = "Delay in seconds between two checks.";
SMARTBUFF_OFTT_AUTOCOMBAT    = "Run the check also in combat.";
SMARTBUFF_OFTT_AUTOCHAT      = "Displays missing buffs as chat message.";
SMARTBUFF_OFTT_AUTOSPLASH    = "Displays missing buffs as splash message\nin the middle of the screen.";
SMARTBUFF_OFTT_AUTOSOUND     = "Plays a sound if buffs are missing.";
SMARTBUFF_OFTT_AUTOREST      = "Disable reminder in capital cities";
SMARTBUFF_OFTT_HUNTERPETS    = "Buff the Hunter pets as well.";
SMARTBUFF_OFTT_WARLOCKPETS   = "Buff the Warlock pets as well, except the " .. SMARTBUFF_DEMONTYPE .. ".";
SMARTBUFF_OFTT_ARULES        = "Does not cast:\n- Thorns on Mages, Priests and Warlocks\n- Arcane Intellect on units without Mana\n- Divine Spirit on units without Mana";
SMARTBUFF_OFTT_HIDEMMBUTTON  = "Hides the SmartBuff minimap button.";
SMARTBUFF_OFTT_REBUFFTIMER   = "How many seconds before a buff expires,\nthe reminder should alert you.\n0 = Deactivated";
SMARTBUFF_OFTT_SELFFIRST     = "Buffs your character first of all others.";
SMARTBUFF_OFTT_SCROLLWHEELUP = "Cast buffs when you roll your\nscrollwheel forward.";
SMARTBUFF_OFTT_SCROLLWHEELDOWN = "Cast buffs when you roll your\nscrollwheel backward.";
SMARTBUFF_OFTT_TARGETSWITCH  = "Cast buffs when you switch your target.";
SMARTBUFF_OFTT_BUFFTARGET    = "Buffs first the current target,\nif it is friendly.";
SMARTBUFF_OFTT_BUFFPVP       = "Buff PvP flagged players,\nalso if you are not PvP flagged.";
SMARTBUFF_OFTT_AUTOSWITCHTMP = "Automatically switches the template,\nif the group type changes.";
SMARTBUFF_OFTT_AUTOSWITCHTMPINST = "Automatically switches the template,\nif the instance changes.";
SMARTBUFF_OFTT_CHECKCHARGES  = "Displays low amount of\ncharges on a buff.\n0 = Deactivated";
SMARTBUFF_OFTT_BUFFINCITIES  = "Buffs also if you are in capital cities.\nIf you are PvP flagged, it buffs in any case.";
SMARTBUFF_OFTT_BLDURATION    = "How many seconds, players will be blacklisted.\n0 = Deactivated";
SMARTBUFF_OFTT_ANTIDAZE      = "Automatically cancels the\naspect of the cheetah/pack\nif someone gets dazed\n(self or group).";
SMARTBUFF_OFTT_SPLASHSTYLE   = "Changes the fontstyle of\nthe buff messages.";
SMARTBUFF_OFTT_HIDESABUTTON  = "Hides the SmartBuff action button.";
SMARTBUFF_OFTT_INCOMBAT      = "At the moment it only works on yourself.\nThe first buff you mark as in combat,\nwill set on the button before combat\nand you can use it in combat.\n!!! Warning !!!\nAll logic is disabled in combat!";
SMARTBUFF_OFTT_SMARTDEBUFF   = "Shows the SmartDebuff frame.";
SMARTBUFF_OFTT_SPLASHDURATION= "How many seconds the splash\nmessage will displayed,\nbefore it fades.";
SMARTBUFF_OFTT_INSHAPESHIFT  = "Cast buffs also if you\nare shapeshifted.";
SMARTBUFF_OFTT_LINKGRPBUFFCHECK  = "Checks if a buff of an other\nclass with similar effect\nis already active.";
SMARTBUFF_OFTT_LINKSELFBUFFCHECK = "Checks if a self buff is active,\nwhose only one can be\nactive at a time.";

-- Buffsetup Frame Text
SMARTBUFF_BST_SELFONLY       = "Myself only";
SMARTBUFF_BST_SELFNOT        = "Myself not";
SMARTBUFF_BST_COMBATIN       = "In combat";
SMARTBUFF_BST_COMBATOUT      = "Out of combat";
SMARTBUFF_BST_MAINHAND       = "Main Hand";
SMARTBUFF_BST_OFFHAND        = "Off Hand";
SMARTBUFF_BST_RANGED         = "Thrown";
SMARTBUFF_BST_REMINDER       = "Notification";
SMARTBUFF_BST_MANALIMIT      = "Lower bound";

-- Buffsetup Frame Tooltip Text
SMARTBUFF_BSTT_SELFONLY      = "Buffs only your character.";
SMARTBUFF_BSTT_SELFNOT       = "Buffs all other selected classes,\nexcept your character.";
SMARTBUFF_BSTT_COMBATIN      = "Buffs if you are in combat.";
SMARTBUFF_BSTT_COMBATOUT     = "Buffs if you are out of combat.";
SMARTBUFF_BSTT_MAINHAND      = "Buffs the Main Hand.";
SMARTBUFF_BSTT_OFFHAND       = "Buffs the Off Hand.";
SMARTBUFF_BSTT_RANGED        = "Buffs the ranged slot.";
SMARTBUFF_BSTT_REMINDER      = "Display reminder message.";
SMARTBUFF_BSTT_REBUFFTIMER   = "How many seconds before a buff expires,\nthe reminder should alert you.\n0 = global rebuff timer";
SMARTBUFF_BSTT_MANALIMIT     = "Mana/Rage/Energy threshold\nIf you are below this value\nit will not cast the buff.";

-- Playersetup Frame Tooltip Text
SMARTBUFF_PSTT_RESIZE        = "Minimize/maximize\nthe main options frame";

-- Messages
SMARTBUFF_MSG_LOADED         = "loaded";
SMARTBUFF_MSG_DISABLED       = "SmartBuff is disabled!";
SMARTBUFF_MSG_SUBGROUP       = "You've joined a new subgroup, please check the options!";
SMARTBUFF_MSG_NOTHINGTODO    = "Nothing to do";
SMARTBUFF_MSG_BUFFED         = "buffed";
SMARTBUFF_MSG_OOR            = "is out of range to buff!";
--SMARTBUFF_MSG_CD             = "has cooldown!";
SMARTBUFF_MSG_CD             = "Global cooldown!";
SMARTBUFF_MSG_CHAT           = "not possible in chat mode!";
SMARTBUFF_MSG_SHAPESHIFT     = "Casting is not allowed in shapeshift form!";
SMARTBUFF_MSG_NOACTIONSLOT   = "needs a slot in an actionbar to working properly!";
SMARTBUFF_MSG_GROUP          = "Group";
SMARTBUFF_MSG_NEEDS          = "needs";
SMARTBUFF_MSG_OOM            = "Not enough mana/rage/energy!";
SMARTBUFF_MSG_STOCK          = "Actual stock of";
SMARTBUFF_MSG_NOREAGENT      = "Out of reagent:";
SMARTBUFF_MSG_DEACTIVATED    = "deactivated!";
SMARTBUFF_MSG_REBUFF         = "Rebuff";
SMARTBUFF_MSG_LEFT           = "left";
SMARTBUFF_MSG_CLASS          = "Class";
SMARTBUFF_MSG_CHARGES        = "charges";
SMARTBUFF_MSG_SPECCHANGED    = "Spec changed (%s), loading buff templates...";

-- Support
SMARTBUFF_MINIMAP_TT         = "Left click: options menu\nRight click: On/Off\nAlt-Left Click: SmartDebuff\nShift drag: Move button";
SMARTBUFF_TITAN_TT           = "Left Click: Open options\nRight Click: On/Off\nAlt-Left Click: SmartDebuff";
SMARTBUFF_FUBAR_TT           = "\nLeft Click: Open options\nShift-Left Click: On/Off\nAlt-Left Click: SmartDebuff";

SMARTBUFF_DEBUFF_TT          = "Shift-Left drag: Move frame\n|cff20d2ff- S button -|r\nLeft click: Show by classes\nShift-Left click: Class colors\nAlt-Left click: Highlight L/R\n|cff20d2ff- P button -|r\nLeft click: Hide pets on/off";


-- Code table
-- à : \195\160    è : \195\168    ì : \195\172    ò : \195\178    ù : \195\185
-- á : \195\161    é : \195\169    í : \195\173    ó : \195\179    ú : \195\186
-- â : \195\162    ê : \195\170    î : \195\174    ô : \195\180    û : \195\187
-- ã : \195\163    ë : \195\171    ï : \195\175    õ : \195\181    ü : \195\188
-- ä : \195\164                    ñ : \195\177    ö : \195\182
-- æ : \195\166                                    ø : \195\184
-- ç : \195\167                                    œ : \197\147
-- 
-- Ä : \195\132
-- Ö : \195\150
-- Ü : \195\156
-- ß : \195\159

