***********************************************************************
SmartBuff
Created by Aeldra (EU-Proudmoore)
***********************************************************************

SmartBuff is a buff addon, to cast buffs ease and quickly. All classes are supported.
Bind a key and it checks if you, a party/raid member, also hunter and warlock pets, needs your buff and cast it.
Use the options menu to configure it you like, as example: buffs, raid subgroups, pets, etc.
Run the mod when ever you wish, if nothing is buffed, there is no penalty or cool down.

FAQ
Q1: How can I cast group/class buffs, instead of single buffs?
A1: Select both checkboxes, assign the classes, use following options the play around "Grp buff check", "Grp range check" and "group size"/"class size" slider
Example, if you set the group/class slider to 3 it will only buff the greater buff if 3 or more units not have it.

Q2: How can I move the frames and buttons?
A2: Use Shift-Left click and drag them arround

Q3: How can I assign a trigger key for buffs?
A3: Use the Blizzard interface -> keyboard layout to define the trigger key for SmartBuff. Open and close the SmartBuff options frame and it will remap this key to the new SecureActionButton

Q4: How can I assign a key for debuffing?
A4: During the new Blizzard secure UI is this not longer possible!

Q5: How can I disable the scrollwheel buffing?
A5: Disable the "Buff on scroll" in the SmartBuff options frame, close it and rebind scrollwheel to whatever you want :)

Q6: How can I cast buffs in combat?
A6: If you want to cast a spell in combat, the you have to check also the "in combat" option in the main options frame (on the right of "Buff on scroll").
Be carfully with this option. In combat is no logic allowed, so SB sets your first "combat"-buff on your key before combat, but in combat it can't do any actions to prevent to cast during the restrictions. It only can show you when do you need a buff, but any time you hit the key in combat it buffs.
Thats also the reason why the "in combat" is per default "off".

Q7: SmartDebuff casts the wrong debuff on a player, is this a bug?
A7: Please watch carfully in which color the debuff button is highlighted, this is very important! You have to click the button with the correct mouse click
Highlighted BLUE = LEFT click
Highlighted RED = RIGHT click

Q8: It does not buff anything, whats wrong?
A8: Please make sure you have selected any buff and the right classes. If you are in resting mode (Cities) SmartBuff is per default in "sleep mode" and does not cast spells, select the option "Buff in cities" to cast buffs in resting mode also.

Q9: Can I use SmartBuff in a macro?
A9: Yes, since the last blizzard added a /click command, use following command:
/click SmartBuff_KeyButton

Q10: It buffs over and over again, splash screen spaming or other strange behaviors, whats going wrong?
A10: It seems that your SmartBuff config has messed up. Please close WoW and delete SmartBuff SavedVariables file, you find it here:
[DriveLetter]:\WorldofWarcraft\WTF\Account\[AccountName]\[ServerName]\[CharacterName]\SavedVariables\SmartBuff.lua


Features:
- Supports all classes
- Supports EN/DE/FR clients
- Checks buffs and rebuff you, raid/party members, raid/party pets
- Setup your own buff templates (Solo, Party, Raid, Battleground, MC, Ony, BWL, AQ, ZG, Custom 1-5)
- Auto switch templates
- Individual setup for each buff
- Supports group buffs: 'Gift of the Wild'/'Arcane Brilliance'/'Prayer of Fortitude'/'Prayer of Spirit', incl. group size and reagence check
- Supports class buffs: all greater blessings of the Paladin
- Supports self buffs
- Supports weapon buffs (individual for main and off hand): Shaman, all poisons (Rogue), all stones and oils, incl. reagence check
- Supports character level based buffs
- Supports tracking abilities
- Reminder if a buff is missing (Splash/chat/sound)
- ReBuff Timer
- Scrollwhell or only one key is needed
- Fast and easy to use
- FuBar support
- Titan Panel support


Usage:
Minimapbutton:
Left click: opens SmartBuff options frame
Right click: enables/disables SmartBuff
Alt-Left click: SmartDebuff
Shift-Left click: move minimap button

Chat:
Type /sbm for options menu in game
Type /sb [command] or /smartbuff [command] in game
- cast buff
toggle - Toggles SmartBuff On/Off
menu - Show/hide options menu
rbt - reset buff timers
sdb - SmartDebuff
rafp - reset all frame positions

Options frame:
Right click on buff checkbox: opens buff setup frame


Please send me a mail or write a comment if you discover Bugs or have Suggestions.

Contact:
aeldra@sonnenkinder.org


***********************************************************************

SmartDebuff
Ein verschiebbares Fenster mit Knöpfen für alle Spieler in Solo/Party/Raid.
Verknüpft deine Debuff Zauber auf links und rechts Klick (Links = Blau, Rechts = Rot) von den Debuff Knöpfen.
Zeigt Debuffs gut sichbar Blau und Rot auf dem Knopf an, diese können dann mit entsprechenden Mausklick despelled werden.

Highligth the target that needs to debuffed and binds your debuff spells to left and right click (left = blue, right = red) on the debuff button


Beschreibung:
SmartBuff ist ein Buff Addon, dass das (Re)Buffen so einfach und schnell wie möglich von statten geht. Es werden alle Klassen unterstützt. Auf Knopfdruck (Bind oder Macro erstelle ein Macro '/sb') wird der Spieler/Gruppe/Raid Sub-Gruppe, auch die Hexer/Jäger Pets, überprüft und wenn nötig gebufft. Über das Optionen Menü kann alles nötige eingestellt werden, wie z.B. Buffs, die zu buffenden Raid Sub-Gruppen, Buffen der Pets, etc.


Features:
- Unterstützt alle Klassen
- Unterstützt EN/DE/FR Clients
- Überprüft die Buffs und bufft dich, Raid/Party Mitglieder, Raid/Party Pets
- Individuelle Einstellungen für jeden Buff
- Erstellen von Buff-Vorlagen möglich (Solo, Party, Raid, Battleground, MC, Ony, BWL, AQ, Naxx, ZG, Custom 1-5)
- Automatischer Vorlagewechsel
- Unterstützt Gruppen-Buffs: 'Gabe der Wildnis'/'Arkane Brillanz'/'Gebet der Seelenstärke'/'Gebet der Willenskraft', inkl. Gruppengrösse und Reagenzien Check
- Unterstützt Klassen-Buffs: Grosse Segen des Paladins
- Unterstützt Selbst-Buffs
- Unterstützt Waffen-Buffs (individuell für Waffen- und Schildhand): des Schamanen, alle Gifte (Schurke), alle Steine und Öle, inkl. Reagenzien Check
- Unterstützt vom Charakter-Level abhängige Buffs
- Unterstützt die Suche nach Kräutern, Erzen, etc.
- Unterstützt Debuffs
- Erinnerung, falls bei jemandem ein Buff fehlt (Splash/Chat/Ton)
- ReBuff Timer
- Buffen mit Mausrad oder alles auf nur einer Taste
- FuBar support
- Titan Panel support


Gebrauch:
Minimap-Knopf:
Links Klick: öffnet das SmartBuff Menü
Rechts Klick: schaltet SmartBuff an/aus
Rechts Klick: schaltet SmartBuff an/aus
Alt-Links Klick: SmartDebuff
Shift-Links Klick: Minimap verschieben

Chat:
Tippt /sbm für das Option-Menü in game
Tippt /sb [command] oder /smartbuff [command] in game
toggle - Toggles SmartBuff An/Aus
menu - Öffnet/versteckt das Options-Menü
rbt - Buff Timer zurücksetzen
sdb - SmartDebuff
rafp - Alle Fensterpositionen zurücksetzen

Optionen-Menü:
Rechtsklick auf die Buff-Checkbox: öffnet das Buffsetup-Menü


Bei Fehler oder Verbesserungsvörschläge meldet euch hier oder schickt mir eine Email.

Kontakt:
aeldra@sonnenkinder.org


***********************************************************************


Changes: 
Rev     Date        Description
------  ----------  -----------------------
8.0f1	2018-08-23	Added many LEgionand BfA toys
					Fixed issue with scroll frame when many buffs/toys were available

8.0f	2018-07-25	Fixes for Battle for Azeroth Pre-Patch
					Updated buffs
					Fixed ToyBox
					Fixed issues with Druid shapeshifting

7.2a    2017-04-13  Updated TOC
                    Updated buff lists
                    Updated item lists
                    Corrected Priest Shadow Form

7.0a    2016-08-16  Updated TOC
                    Added Demon Hunter class
                    Fixed LUA errors
                    Thanks to all who have helped me to keep it alive

6.0c    2014-12-02  Added buffs: Hunter (Munitions, Lone Wolf), Rogue (Instant Poison), Hunter (Camouflage), Warrior (Gladiator Stance)
                    Added items: WoD flasks, Oralius' Whispering Crystal, Fire-Watcher's Oath, Blazing Wings
                    Fix for LUA error: script ran too long

6.0b    2014-10-23  Updated code for Warlords of Draenor
                    Updated buff lists
                    Updated item lists
                    Added toybox support
                    Thanks for donation: Maik M :)
                    
6.0a    2014-10-16  Updated code for Warlords of Draenor
                    Included Broker addon
                    Thanks for donation: Chris S, Glenn J, Jennyfer H, Jon B, Michael Z :)

5.4b    2013-10-30  Fixed LUA errors with RealmName

5.4a    2013-09-12  Fixed LUA errors with sliders
                    Fixed action button position issue
                    Updated TOC

5.3b    2013-06-03  Fixed action button position issue
                    Thanks for donation: Isabela, Ronald G. :)

5.3a    2013-05-23  UI cleanup, removed old raid options
                    Added buffs: Warlock (Blood Horror), Mage (Ice Ward), Hunter (Camouflage)
                    Added items: Burning Seed, Orb of the Sin'dorei
                    Added option to change the buff reminder icon size
                    Added basic help system
                    Fixed battleground LUA error
                    Fixed item cooldown issue
                    Updated TOC
                    Thanks for donation: Ronald G. :)

5.1d    2013-01-08  Fixed Warlock pet based buff issue
                    Fixed Rogue poisons issue if a fishing pole is equiped
                    Updated monk group buffs
                    Updated buff check (player characters)
                    Updated buff timer check for channeled buffs
                    Updated traditional chinese (Taiwan) localization, thanks to reiswind
                    Thanks for donation: reiswind :)

5.1c    2012-12-21  Added buffs: Warlock (Grimoire of Sacrifice), Druid (Symbiosis)
                    Added conjured items: Mage (Conjure Refreshment)
                    Added item: Ancient Pandaren Fishing Charm

5.1b    2012-12-10  Updated support for Water Elemental (Mage)

5.1a    2012-12-06  Fixed battlefield LUA error
                    Auto hide SmartBuff UI elements during pet battles or in vehicles
                    Added item: Anglers Fishing Raft
                    Updated support for Water Elemental (Mage)
                    Updated TOC

5.0h    2012-10-24  Added item: Crystal of Insanity
                    Updated Alchemist's Flask detection/checks
                    Updated linked buffs

5.0g    2012-10-21  Added buffs: Hunter (Trap Launcher), Druid (Cenarion Ward)
                    Added MoP consumables: flasks/elixirs/food
                    Added check to disable buff check during pet combat
                    Updated MoP flask check

5.0f    2012-09-20  Added buffs: Warlock (Soul Link)
                    Fixed conjured items, Mana Gem/Healthstone

5.0e    2012-09-05  Updated chained buff detection: stances/seals/presences/poisons
                    Note: 'Chained' buffs will casted by priority, based on the order in the buff list. You can drag'n'drop the buffs in the list to change the priority.
                    Added linked item detection: Brilliant Mana Gem
                    Updated buffs and items

5.0d    2012-09-01  Fixed possible 'taint' issue in combination with the Glyph UI
                    Thanks for donation: Ulrike L. and Chris R. :)

5.0c    2012-08-31  Updated buffs: Warlock (Dark Intent), Rogue (Poisons), Hunter (Aspects)
                    Added workaround to hopefully fix the 'taint' issue
                    Thanks for donation: shawnknight

5.0b    2012-08-30  Activated item buffs
                    Updated spell detection
                    Updated tracking detection
                    Updated buffs
                    Updated items
                    Autoreset buff list for cleanup

5.0a    2012-08-28  Updated code for Mists of Pandaria
                    Due to I am moving to a new town, my online access and spare time is limited. This release will restore basic functionality, but unfortunately it will not contain all the buff changes, sorry.
                    Please report any missing buffs, thanks!

4.3a    2011-11-30  Added buffs: Paladin (Beacon of Light)
                    Added items: Fortune Cookie, Celebration Package, Warts-B-Gone Lip Balm
                    Updated TOC
                    
4.2a    2011-06-29  Added options: Splash frame 'Show Icon' and 'Short Message'
                    Added buffs: Warrior (Shield Block)
                    Updated TOC
                    
4.1b    2011-06-05  Added spells: Priest (Lightwell), Warlock (Soul Harvest)
                    Added spell icon to the splash message
                    Updated buffs: Deathknight (Pet check for Raise Dead), Paladin (Inquisition holy power check)
                    Updated power threshold check
                    Updated chained and linked buff behavior
                    Updated buff detection

4.1a    2011-04-28  Added buffs: Rogue (Recuperate, Stealth), Hunter (Focus Fire), Paladin (Inquisition), Deathknight (Raise Dead)
                    Added items: Elixir of Greater Agility, Adept's Elixir, Spellpower Elixir
                    Updated linked buffes
                    Updated TOC

4.0g    2011-01-26  Class based spells/items will always displayed in the buff list
                    Updated linked buffes

4.0f    2011-01-11  Added support for conjured items
                    Added buff chain: Priest (Inner Fire, Inner Focus)
                    Added buff: Warlock (Soulstone Resurrection)
                    Added buff: Shaman (Elemental Mastery)
                    Added items: Healstone, Soulstone, Mana Gem, Guru's Elixir
                    Updated linked buffes

4.0e    2010-12-25  Added scrollable buff list, which can be prioritized with drag'n'drop
                    Added support for buff 'chains' (e.g. Paladin Auras), casts the first, selected, not yet buffed spell in the priority list
                    Added support to buff by role
                    Added support for Cataclysm flasks, elixir and food
                    Added new options: 'Grp Link' and 'Self Link', to check for similar buffs or whose only one can be active at a time
                    Added button 'Reset List' to reset buff list to default
                    Added button 'Reset All' to reset all SmartBuff data                    
                    Added buff: Warlock (Nether Ward, Dark Intend)
                    Updated buff detection
                    Fixed Shaman weapon buffs

4.0d    2010-11-22  Updated linked buffs detection
                    Removed items: Spell/Firestones

4.0c    2010-11-10  Added buffs: Warrior (Stances)
                    Updated tracking detection and auto enable
                    Whats new info only on the very first login

4.0b    2010-10-18  Added buff options and check on ranged slot
                    Updated linked buffs detection

4.0a2   2010-10-17  Fixed Rogue poisons
                    Broker plugin LUA error
  
4.0a    2010-10-14  Updated code for Cataclysm
                    Updated buff/spellbook list and detection
                    Updated linked buffs detection

3.3e    2010-08-18  Updated linked buffs detection
                    Fixed minimap button LUA error, if SmartBuff is toggled before it is initialized
                    
3.3d    2010-06-28  Added mage elemental to warlock pets
                    Updated spell range detection
                    Updated battleground/arena detection
                    Updated UI buff synchronization
                    Updated linked buffs detection
                    Fixed battleground/arena auto template switch
                    Fixed LUA error, if SmartBuff is toggled before it is initialized
  
3.3c    2010-01-19  Fixed minimap button behavior with other minimap addons
                    Fixed dual spec change issue

3.3b    2010-01-05  Added buffs: Priest (Vampiric Embrace), Rogue (Tricks of the Trade)
                    Fixed spell check for Arcane/Dalaran Intellect and Arcane/Dalaran Brilliance
                    Updated auto check timer range: 1-60sec 1sec steps, from 5-120sec 5sec steps
                    Updated chat command, new shortcut = /sbo or /sbuff
                    Updated initialization behavior
                    Updated action button behavior
                    Updated minimap button behavior

3.3a    2009-12-09  Added template: Arena and ICC
                    Updated spell range detection
                    Updated location detection
                    Updated instance templates
                    Updated Titan Panel support

3.2b    2009-09-07  Added forms: Druid (Moonkin, Tree), Priest (Shadow)
                    Updated Consumables: Flask of the North
                    Updated buff detection

3.2a    2009-08-06  Added dual spec support
                    Added buffs: Paladin (Hand of Freedom)
                    Added Data Broker support
                    Updated buff list
                    Updated group/raid buff detection
                    Updated flask/elixir buff detection

3.1a    2009-04-15  Added buffs: Paladin (Sacred Shield, Avenging Wrath), Death Knight (Auras), Mage (Slow Fall), Shaman (Water Walking)
                    Added Death Knight pet support
                    Added basic flask and elixir support
                    Added auto spell duration detection, in case of glyphs or whatever
                    Updated spell check for Arcane/Dalaran Intellect and Arcane/Dalaran Brilliance
                    Updated spell: Path of Frost can casted when mounted
                    Updated spells: Paladin (all seals), Priest (Inner Fire, Levitate, Divine Spirit)
  
3.0e    2008-12-03  Added buffs: Warlock (Life Tap), Druid (Savage Roar)
                    Updated spell level check
                    Updated food list

3.0d    2008-11-25  Added Parrot support, warning messages will be forwarded to parrot
                    Added buffs: Mage (Dalaran Intellect/Brilliance), Priest (Levitate)
                    Updated reagents list

3.0c    2008-11-18  Updated spell list and levels
                    Added scroll support
                    Added items: oils, poisons, stones, food
                    Added buffs: Hunter (Aspect of the Dragonhawk), Rogue (Hunger for Blood)
                    
3.0b    2008-10-25  Fixed group buff support
                    Added buffs: Mage (Focus Magic), Warrior (Vigilance)
                    Added items: Warlock (Spellstone, Master Firestone)
                    Updated druids can cast any buff in tree form, no matter if cast 'Shapeshifted' is not set
                    Updated Titan support
                    Updated font size
                    Updated ruRU translation (thanks to Dr. Jet Cheshirsky)
                    Removed buffs: Druid (Omen of Clarity), Rogue (Crippling Poison II, Mind-numbing Poison II & III)
                    Removed option: 'Grp range check'
                     
3.0a    2008-10-15  Updated to patch 3.0
                    Added special crusader aura check, if crusader aura is checked, SB will only buff it if you are mounted or flying
                    Added fishing check, if you are fishing it will not buff
                    Updated battlefield and arena detection for auto template change
                    Updated buff and item detection
                    Fixed wrong spell Id for 'Seal of Righteousness'
                    Fixed Anti-Daze feature

2.4a    2008-09-01  Redesign to the new GetSpellInfo method, localization of the spells and items is not longer needed and SD will now work for every language
                    Fixed mousewheel binding
                    Changed Shaman Earth Shield as group buff (all classes are disabled per default), use the "additional" list to buff your favorite target
                    Added weapon buffs: Fel Sharpening Stone, Adamantite Sharpening Stone, Fel Weightstone, Adamantite Weightstone
                    Added food buffs: Broiled Bloodfin, Spicy Hot Talbuk, Skullfish Soup
                    Added new option: 'Shapshift', if you want to allow buffing in shapeshifted forms
                    Added check to not buff if you are eating/drinking
                    Added check to not buff 'Arcane Intellect' if 'K'iru's Song of Victory' is active
                    Added option to allow cast buffs in shapeshifted forms
                    Added picnic check, if you are eating/drinking it will not buff
                    Fixed lightning shield issue
                    Updated buff and item detection
                    Updated timeleft detection of buffs
                    Updated zhCN translation (thanks to Kurax)

2.3b    2008-01-09  Added new buffs: Mage (Icy Veins), Warrior (Rampage)
                    Updated german localization: Mage (Einäschern), Priest (Göttlicher Wille)
                    Changed order of Warlock buffs

2.3a    2007-11-14  Updated ignore checks for group/class buffs
                    Added new buff: Mage (Presence of Mind)
                    Fixed buff issue in cross-realm battlegrounds
                    Fixed Hunter Trueshot Aura  (thanks to gramg)
                    Fixed Tracking abilities (thanks to gramg)
                    Updated zhtw localization (thanks to spawn)
                    Updated TOC 

2.2a    2007-09-26  Updated buffs: All Paladin blessings
                    Added buffs: Paladin (Seal of Vengeance, Seal of Blood)

2.1a    2007-05-30  Added new option: "UI Sync", activate synchronisation with the UI to retrive the timeleft of your buffs from other players.
                    Removed option: "CTRA Sync"
                    Changed auto template change for battlegrounds and arena
                    Changed: Additional and ignore list are buff and template based
                    Updated buffs: Warlock (Detect Invisibility)
                    Updated food: Talbuk Steak
                    Updated traditional chinese (Taiwan) localization
                    Fixed Priest PW:S
                    Fixed Shaman Ghost Wolf

2.0i    2007-02-18  Added new options: "Buff on scrollup" and "on scrolldown", buff on scollwheel splitted to allow another binding if needed
                    Added new buff option: "Oneself not", buffs all other players, except yourself
                    Added new buffs: Paladin (Crusader Aura), Rogue (Anesthetic Poison)
                    Added new buffs: superior oils and cooked food
                    Added spanish localization, big thanks to Chusina
                    Updated buffs: Priest (Prayer of Shadow Protection), Druid (Gift of the Wild), Troll Priest (Schattenschild)
                    Fixed "Mind-numbing Poison"
                    Fixed Druid buff "Nature's Grasp", can be casted in all forms now
                    Fixed Paladin buff issue in solo mode
                    
2.0h    2007-01-11  Added new option: "Charges", slider to ajust the charge check, set it to 0 to disable it
                    Added new option: "Splash", slider to ajust the duration in seconds of splash messages
                    Added new chat command: "/sb rafp", reset all frame positions
                    Removed option: "Check charges", use the charges slider
                    Removed option: "Disable in cities", only "Buff in cities" is used
                    Fixed LUA error 1074
                    Fixed target frame loss problem

2.0g1   2007-01-04  Hotfix FuBar

2.0g    2007-01-04  Rebuff code rewritten (Reset buff timers)
                    Group buff code optimized
                    Added more splash screen fonts

2.0f    2006-12-21  SmartDebuff outsourced as own addon
                    Added SmartDebuff shows HP, Mana, AFK, offline, feign death
                    Added SmartDebuff options frame: HP, Mana, Invert, Pet, class colors, show L/R, sound, tooltip checkbox
                    Added SmartDebuff options frame: Target mode checkbox, in target mode Left click selects the unit and Right click casts a HoT (Priest/Druid). Use Alt-Left/Right click to debuff.
                    Added SmartDebuff options frame: button width and height slider
                    Added Priest/Druid: Alt-Left click on debuff button casts Renew/Rejuvenation on unit
                    Changed use left click on the "S" style button to toggle class/group view
                    Changed SmartDebuff frame is movable
                    Removed SmartDebuff Pet button
                    Removed SmartDebuff boarder
                    Removed SmartDebuff styles, you can change the button size with the sliders
                    Fixed problem when login and you are in combat
                    Fixed "Self first" option
                    Fixed LUA Error 830
                    

2.0e    2006-12-18  Added SmartDebuff options frame: raid subgroup selection, opacity slides and color selectors
                    Added button "O" on SmartDebuff frame to show/hide the SmartDebuff options frame
                    Added SmartDebuff order by class, use right click on the "S" style button to toggle class/group view (only in raid / BG)
                    Added SmartDebuff show L/R, use alt-left click on the "S" style button to toggle L/R or names if a unit needs debuffed
                    Changed SmartDebuff shows always the name, cut down on button size
                    Fixed Warlock Soul Link when no pet is active
                    Fixed Shaman weapon buffs main/off hand, next try ;)
                    Fixed keybinding problem with other addons that use an own keybinding system
                    Fixed LUA error 4348
                    Fixed LUA error 367

2.0d    2006-12-14  Changed actionbar detection, SmartBuff is not longer needs the buffs on an actionbar to preform checks
                    Optimized range checks for buff and debuffs
                    Units that need debuffed, but are out of range are marked with darker colors
                    Added new option: SmartDebuff (show/hide)
                    Added SmartDebuff class colors, use shift-left click on the "S" style button
                    Added SmartDebuff tooltip
                    Added PvP arena template support
                    Changed SmartDebuff frame is locked by default, shift-left click to drag
                    Changed SmartDebuff frame is hidden when SmartBuff is disabled                    
                    Updated Cosmos support (thanks to Steffen)
                    Fixed Shaman weapon buffs main/off hand
                    Fixed Paladin class buff code                    
                    Fixed druid buff issue in tree-form
                    Fixed BG template auto switch
                    Fixed weapon buffs issue
                    Fixed french localization

2.0c    2006-12-11  Fixed startup problem
                    Fixed popup problem of SmartDebuff, it stays now hidden
                    Fixed keybinding problem
                    Added Shaman debuff spells
                    Debuff code optimized

2.0b    2006-12-10  New Paladin group buff code
                    Added new Paladin slider: Class size, defines the amount of players in that class to use the greater blessings
                    SmartDebuff is sorted by subgroup
                    SmartDebuff shows hunter pets
                    Added new button on SmartDebuff frame to show/hide hunter pets
                    SmartDebuff frame size adjusts dynamicaly on raid size
                    Shift-Left click on the debuff button targets the unit
                    Added new buff: Warlock (Dark Pact)

2.0a1   2006-12-08  Added new SmartDebuff frame styles
                    Added new button on SmartDebuff frame to change the styles
                    Added polymorph as debuff: checks if a player mind controlled
                    Fix in Debuff code

2.0a    2006-12-07  Added SmartDebuff frame: Highligth the target that needs to debuffed and binds your debuff spells to left and right click on the debuff button
                    Added Titan Panel support
                    Added FuBar support
                    Added new buff: Warlock (Fel Armor)
                    Added new buff: Mage (Molten Armor)
                    Added new buff: Hunter (Aspect of the Viper)
                    Added new buff: Warrior (Commanding Shout) 
                    Added new option: (buff) in combat. At the momet it only works on yourself. 
                      The first buff you mark as in combat, will set on the button before combat and you can use it in combat.
                      Warning! Be carfully in combat is during the restrictions of blizzard no logic active and every time you hit the action button (or scrollwheel), it buffs.
                    Added new spell levels ranks
                    Added new reagents on the on the new group buff spell ranks
                    Added new poisons ranks
                    Added new buffs: Shaman (Water Shield, Earth Shield)
                    Added new option: Hide action button
                    Added new buff options: main and off hand on Shaman weapon buffs
                    Changed option: Buff on scrollwheel
                    !!! Attention !!! SmartBuff rebinds the scrollwheel to cast buffs and triggers then the zoom in/out. It stores your old command and apply it if you disable buff on scrollwheel
                    New movable SmartBuff action button (click or keybind), use old keybinding, SmartBuff remaps it to the new button
                    Action button displays the awaiting buff
                    Removed option: Comp. mode
                    Removed option: Buff on target change
                    Fix german localization                    

1.12c   2006/11/13  Added new mini group frame: Shows the raid subgoup settings in an own movable mini frame.
                    Added new optionsframe: Additional and ignore player list (atm the lists are global and the same for all buffs)
                    Added Daze-Protection for Hunters, automatically cancels the aspect of the cheetah/pack if someone gets dazed (self or group)
                    Added new option: Mini group
                    Added new option: Anti daze (hunter only)
                    Added new option: Comp. mode (Compatibility mode), work arround if you are facing problems to cast buffs on yourself.
                    Group buffs can casted in "solo" mode
                    Group size is saved by template
                    Added new weapon buff: Rogue (Deadly Poison Rank V)
                    Added new buffs: Hunter (Aspect of the Cheetah, Aspect of the Pack)
                    Added new instance template: Naxxramas
                    Code optimizations                  
                    Fix in CTRA sync. There is a bug in CTRA, it sends the wrong index! Check implemented to detect, if the sender is using CTRA or oRA2 (or another RA tool)

1.12b   2006/10/24  Fix buff code
                    Fix CTRA sync (only enabled buffs will now updated from CTRA)
                    Fix autoswitch template (zone based)
                    Added new buff: Warlock (Shadow Ward)
                    Added new buffs: Mage (Combustion, Arcane Power)
                    Added new buff option: mana/rage/energy threshold                    
                    Advanced group buff check option, checks also the class
                    SmartBuff uses an own CTRA buff table, snyc with oRA should now also work
                    Internal buff design changed for easier localization                    
                    Workaround for blizzards self buff option

1.12a   2006/10/01  Fix LUA error 1217 
                    Fix for reset buff timers on group buffs 
                    Fix charge check for priest 
                    Fix Moonkin can cast buffs 
                    Added new buff: Rogue (Slice and Dice)
                    Added new buffs: Racial buffs (Dwarv, Human, Orc, Troll, Undead)
                    Added new option: Advanced group buff check (checks also the single buffs)
                    Added new option: Advanced group buff range check (range check on each group member)
                    Added new option: Buff in cities 
                    Added new option: CTRA sync, tries to sync the buff timers from other players over ctra, works only in raids
                    Added new slider: Blacklist, to adjust the blacklist duration 
                    Added new button: "Reset BT" (reset buff timers) button in the option screen
                    Code optimized on target switch based buffing, to speed up buff checks and reduce the amount of target changing (big thanks to sarf)
                    Fixed german localization (Paladin)
                    Traditional chinese (Taiwan) localization

1.11b   2006/07/05  Added new function: Reset buff timers. It allow rebuffing at any time, if the buffs were casted with SB before. Use '/sb rbt' or key binding. Rebufftimer have to be enabled to use this function.
                    Added new buffs: Druid (Tiger's Fury)
                    Fixed charge check for Shaman lighting shield
                    Fixed bugs on startup (LUA error, font set)
                    Fixed buff while player is PvP flaged
                    
1.11a   2006/06/27  Added new option: check charges
                    Fixes for patch 1.11
                    Removed "Dectect traps" (Rogue)
                    Fixes german localization
                    Fixes group buffs
                    Fixes on startup
                    
1.10g   2006/05/05  Added new option: buff on target change
                    Added new buff option: Notification (individual reminder foreach buff)
                    Added new buff option: Rebuff timer (individual timer foreach buff, if zero it takes the global timer)
                    Improved ReBuff timer (group/class buffs)
                    Improved buff check (if not enough mana)
                    Fix for weapon buffs while moving
                    
1.10f2  2006/04/29  Hotfix for the dead spot on screen

1.10f   2006/04/28  Changed option: Autoswitch template group type based
                    Added new option: Autoswitch template instance based
                    Added new option: Buff PvP flagged players
                    Added new buffs: Priest (Inner Focus)
                    Changed buff: Priest (Power Word: Shield)
                    Added new option to move and change the font of the reminder message (drag to move, click outside to change the font) 
                    Improved ReBuff timer (group/class buffs)
                    Improved warning messages (cooldown, shapeshifted)
                    Fixed Druid bug while shapeshifted
                    Fixed Paladin bug with greater blessings
                    Localized template names
                    Fix for NaturalShapeshifter addon (or other addons which modify the shapeshift bar)

1.10e   2006/04/21  Big changes in 1.10e! The way how buff settings will stored has changed. You have to setup your buffs again.
                    Please be carefully with buffs that could overwritten, like blessings of the Paladin. Your running quickly oom, if you activate all of them ;)
                    
                    Added new buff setup frame, individual setup for each buff is now possible (class select, in combat, out of combat, self only, main/off hand)
                    Added buff setup templates (Solo, Party, Raid, Battleground, MC, Ony, BWL, AQ, ZG, Custom 1-5), quick changing of your individual buff setup
                    Added new buffs: Paladin (most of all Blessings, also the greater one)
                    Added new buffs: Mage (Mana Shield, Fire Ward, Frost Ward, Ice Barrier)
                    Added new buffs: Druid (Nature's Grasp)
                    Added new weapon buffs (individual for main and off hand): all poisons (Rogue), all stones and oils, incl. reagence check
                    Added new option: Autoswitch template (group type/instance based)
                    Added new option: Self first (for each template)
                    Added new option: Hook mousewheel to buff
                    Added new option: Buff target first (it doesn't matter if the target is in your group or not)
                    Moved buff hunter pets: pets could now set for each buff
                    Moved buff warlock pets: pets could now set for each buff
                    Moved advance rules: classes could now set for each buff
                    Moved self only: could now set for each buff
                    Improved ReBuff timer (player buffs)
                    Fixed losing target, when not enough Mana/Rage/Energy
                    Fixed Druids can cast tracking abilities while shapeshifted
                    Fixed german localization (Furchtzauberschutz)
                    Fixed french localization (a lot *g*)

1.10d   2006/04/08  ReBuff timer added (starts at the first buff you cast. Time left of buffs you/party/raid already had, when you logged in or changed group can not detected)
                    Added new buffs: Priest (Prayer of Shadow Protection), Hunter (Rapid Fire)
                    Added new option: Rebuff timer, reminds you (0 - 300sec. 0 = timer disabled) before a buff is running out
                    Added new option: Hide minimap button
                    Added new option: Buff only yourself
                    Fixed Shaman weapon buffs
                    Fixed french localization
                    Fixed when options frame open, keyboard is not locked

1.10c   2006/04/04  Added new buffs: Druid (Barkskin), Priest (Power Word: Shield, but only as self cast), Warlock (Soul Link)
                    Added Shaman support (Lightning Shield, Rockbiter/Frostbrand/Flametongue/Windfury Weapon, Water Breathing)
                    Added basic Warrior support (Battle Shout, Berserker Rage, Bloodrage)
                    Added basic Rogue support (Detect Traps, Blade Flurry, Evasion)
                    Added basic Paladin support (Righteous Fury, Holy Shield, all Auras)
                    Added option: Disable messages (normal/warning/error)
                    Right click the minimap button disable/enable SmartBuff
                    Improved cooldown handling
                    Fixed french localization
                    Fixed Minimap bug
                    Fixed tracking bug for druids in cat form
                    
1.10b   2006/04/01  Added new buffs: Mage (Dampen Magic, Amplify Magic)
                    Added new tracking abilities (all)
                    Added Minimap button
                    French localization (Big thanks to Sasmira)
                    New options menu

1.10a   2006/03/30  Added new buffs: Priest (Touch of Weakness, Prayer of Spirit), Warlock (all Detect ... Invisibility)
                    Options frame close on ESC key press
                    Improved buff detection

1.10    2006/03/29  Fixes for patch 1.10

1.10    2006/03/27  Added reagence check for all group buffs
beta4

1.10    2006/03/21  Added advance rules checkbox in the option frame (does not cast: Thorns on Mages/Priests/Warlocks, Arcane Intellect/Divine Spirit on units without Mana) 
beta3               Bugfix for resting check, while you are resting (in capital cities or taverns) the reminder is disabled, except you are pvp flagged
                    Bugfix for Warlock spell "Unending Breath"

1.10b   2006/03/15  Added support for Hunters and Warlocks
beta2               Added new buffs: Priest (race buffs), Mages (all armors)
                    Added mana check
                    While you are resting (in capital cities or taverns) the reminder is disabled

1.10    2006/03/10  REMOVED Autobuff option, during restriction from blizzard in patch 1.10
beta                Added Reminder if a buff is missing, displays a chat/splash message or plays a sound
                    Added character level based casting, it casts the highst possible rank for lower characters
                    Added basic line of sight check (buff needs to be on an actionbar), includes a blacklist
                    Added group buff check, if 4 or more in a group and 4 or more have not the buff, it casts "Gift of the Wild"/"Arcane Brilliance"/"Prayer of Fortitude"
                    Added new keybind/commmand to buff the current target (keybindings changed, please rebind keys)
                    Added new buffs: Priest "Divine Spirit", Druid "Omen of Clarity"
                    Druid buff "Thorns" is no longer casted on Priests/Mages/Warlocks
                    Added tooltips
                    Movable option menu
                    Save variables per character
                    Improved buff detection 
                    Bugfix for Druids in Shapeshift (Travelforms)

1.4     2006/02/21  Bugfix for Druids in Shapeshift

1.3     2006/02/01  Bugfix for messages in autobuff mode
                    check method improved
                    new buffs added (mage/priest)

1.2     2006/01/25  Bugfix druid thorns buff

1.1     2006/01/17  Autobuff (on movement) option added
                    Autobuff timer added
                    Improved buff detection

1.0     2005/11/25  Initial version of SmartBuff
