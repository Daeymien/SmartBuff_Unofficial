local _;
local S = SMARTBUFF_GLOBALS;

SMARTBUFF_PLAYERCLASS = nil;
SMARTBUFF_BUFFLIST = nil;

-- Buff types
SMARTBUFF_CONST_ALL       = "ALL";
SMARTBUFF_CONST_GROUP     = "GROUP";
SMARTBUFF_CONST_GROUPALL  = "GROUPALL";
SMARTBUFF_CONST_SELF      = "SELF";
SMARTBUFF_CONST_FORCESELF = "FORCESELF";
SMARTBUFF_CONST_TRACK     = "TRACK";
SMARTBUFF_CONST_WEAPON    = "WEAPON";
SMARTBUFF_CONST_INV       = "INVENTORY";
SMARTBUFF_CONST_FOOD      = "FOOD";
SMARTBUFF_CONST_SCROLL    = "SCROLL";
SMARTBUFF_CONST_POTION    = "POTION";
SMARTBUFF_CONST_STANCE    = "STANCE";
SMARTBUFF_CONST_ITEM      = "ITEM";
SMARTBUFF_CONST_ITEMGROUP = "ITEMGROUP";
SMARTBUFF_CONST_TOY       = "TOY";

S.CheckPet = "CHECKPET";
S.CheckPetNeeded = "CHECKPETNEEDED";
S.CheckFishingPole = "CHECKFISHINGPOLE";
S.NIL = "x";
S.Toybox = { };

local function GetItems(items)
  local t = { };
  for _, id in pairs(items) do
    local name = GetItemInfo(id);
    if (name) then
      --print("Item found: "..id..", "..name);
      tinsert(t, name);
    end
  end
  return t;
end

local function InsertItem(t, type, itemId, spellId, duration, link)
  local item = GetItemInfo(itemId);
  local spell = GetSpellInfo(spellId);
  if (item and spell) then
    --print("Item found: "..item..", "..spell);
    tinsert(t, {item, duration, type, nil, spell, link});
  end
end

local function AddItem(itemId, spellId, duration, link)
  InsertItem(SMARTBUFF_SCROLL, SMARTBUFF_CONST_SCROLL, itemId, spellId, duration, link);
end

local function LoadToys()
	C_ToyBox.SetCollectedShown(true)
	C_ToyBox.SetAllSourceTypeFilters(true)
	C_ToyBox.SetFilterString("")
	
	local nTotal = C_ToyBox.GetNumTotalDisplayedToys();
	local nLearned = C_ToyBox.GetNumLearnedDisplayedToys() or 0;
	if (nLearned <= 0) then
	  return;
	end
	
	for i = 1, nTotal do
		local num = C_ToyBox.GetToyFromIndex(i);
		local id, name, icon = C_ToyBox.GetToyInfo(num);
		if (id) then
		  if (PlayerHasToy(id)) then
		    S.Toybox[tostring(name)] = {id, icon};
		  end
		end
	end

  SMARTBUFF_AddMsgD("Toys initialized");
end

function SMARTBUFF_InitItemList()  
  -- Stones and oils
  SMARTBUFF_HEALTHSTONE         = GetItemInfo(5512);  --"Healthstone"
  SMARTBUFF_MANAGEM             = GetItemInfo(36799); --"Mana Gem"
  SMARTBUFF_BRILLIANTMANAGEM    = GetItemInfo(81901); --"Brilliant Mana Gem"
  SMARTBUFF_SSROUGH             = GetItemInfo(2862);  --"Rough Sharpening Stone"
  SMARTBUFF_SSCOARSE            = GetItemInfo(2863);  --"Coarse Sharpening Stone"
  SMARTBUFF_SSHEAVY             = GetItemInfo(2871);  --"Heavy Sharpening Stone"
  SMARTBUFF_SSSOLID             = GetItemInfo(7964);  --"Solid Sharpening Stone"
  SMARTBUFF_SSDENSE             = GetItemInfo(12404); --"Dense Sharpening Stone"
  SMARTBUFF_SSELEMENTAL         = GetItemInfo(18262); --"Elemental Sharpening Stone"
  SMARTBUFF_SSFEL               = GetItemInfo(23528); --"Fel Sharpening Stone"
  SMARTBUFF_SSADAMANTITE        = GetItemInfo(23529); --"Adamantite Sharpening Stone"
  SMARTBUFF_WSROUGH             = GetItemInfo(3239);  --"Rough Weightstone"
  SMARTBUFF_WSCOARSE            = GetItemInfo(3240);  --"Coarse Weightstone"
  SMARTBUFF_WSHEAVY             = GetItemInfo(3241);  --"Heavy Weightstone"
  SMARTBUFF_WSSOLID             = GetItemInfo(7965);  --"Solid Weightstone"
  SMARTBUFF_WSDENSE             = GetItemInfo(12643); --"Dense Weightstone"
  SMARTBUFF_WSFEL               = GetItemInfo(28420); --"Fel Weightstone"
  SMARTBUFF_WSADAMANTITE        = GetItemInfo(28421); --"Adamantite Weightstone"
  SMARTBUFF_SHADOWOIL           = GetItemInfo(3824);  --"Shadow Oil"
  SMARTBUFF_FROSTOIL            = GetItemInfo(3829);  --"Frost Oil"
  SMARTBUFF_MANAOIL1            = GetItemInfo(20745); --"Minor Mana Oil"
  SMARTBUFF_MANAOIL2            = GetItemInfo(20747); --"Lesser Mana Oil"
  SMARTBUFF_MANAOIL3            = GetItemInfo(20748); --"Brilliant Mana Oil"
  SMARTBUFF_MANAOIL4            = GetItemInfo(22521); --"Superior Mana Oil"
  SMARTBUFF_WIZARDOIL1          = GetItemInfo(20744); --"Minor Wizard Oil"
  SMARTBUFF_WIZARDOIL2          = GetItemInfo(20746); --"Lesser Wizard Oil"
  SMARTBUFF_WIZARDOIL3          = GetItemInfo(20750); --"Wizard Oil"
  SMARTBUFF_WIZARDOIL4          = GetItemInfo(20749); --"Brilliant Wizard Oil"
  SMARTBUFF_WIZARDOIL5          = GetItemInfo(22522); --"Superior Wizard Oil"
  
  -- Food
  SMARTBUFF_SAGEFISHDELIGHT     = GetItemInfo(21217); --"Sagefish Delight"
  SMARTBUFF_BUZZARDBITES        = GetItemInfo(27651); --"Buzzard Bites"
  SMARTBUFF_RAVAGERDOG          = GetItemInfo(27655); --"Ravager Dog"
  SMARTBUFF_FELTAILDELIGHT      = GetItemInfo(27662); --"Feltail Delight"
  SMARTBUFF_CLAMBAR             = GetItemInfo(30155); --"Clam Bar"
  SMARTBUFF_BROILEDBLOODFIN     = GetItemInfo(33867); --"Broiled Bloodfin"
  SMARTBUFF_BLACKENEDSPOREFISH  = GetItemInfo(27663); --"Blackened Sporefish"
  SMARTBUFF_BLACKENEDBASILISK   = GetItemInfo(27657); --"Blackened Basilisk"
  SMARTBUFF_GRILLEDMUDFISH      = GetItemInfo(27664); --"Grilled Mudfish"
  SMARTBUFF_POACHEDBLUEFISH     = GetItemInfo(27665); --"Poached Bluefish"
  SMARTBUFF_ROASTEDCLEFTHOOF    = GetItemInfo(27658); --"Roasted Clefthoof"
  SMARTBUFF_SPICYHOTTALBUK      = GetItemInfo(33872); --"Spicy Hot Talbuk"
  SMARTBUFF_SKULLFISHSOUP       = GetItemInfo(33825); --"Skullfish Soup"
  SMARTBUFF_WARPBURGER          = GetItemInfo(27659); --"Warp Burger"
  SMARTBUFF_TALBUKSTEAK         = GetItemInfo(27660); --"Talbuk Steak"
  SMARTBUFF_GOLDENFISHSTICKS    = GetItemInfo(27666); --"Golden Fish Sticks"
  SMARTBUFF_CRUNCHYSERPENT      = GetItemInfo(31673); --"Crunchy Serpent"
  SMARTBUFF_MOKNATHALSHORTRIBS  = GetItemInfo(31672); --"Mok'Nathal Shortribs"
  SMARTBUFF_SPICYCRAWDAD        = GetItemInfo(27667); --"Spicy Crawdad"
  --SMARTBUFF_FISHERMANSFEAST     = GetItemInfo(33052); --"Fisherman's Feast"
  --SMARTBUFF_HOTAPPLECIDER       = GetItemInfo(34411); --"Hot Apple Cider"
  SMARTBUFF_SALTPEPPERSHANK = GetItemInfo(133557); --"Salt & Pepper Shank"
  SMARTBUFF_PICKLEDSTORMRAY = GetItemInfo(133562); --"Pickled Stormray"
  SMARTBUFF_DROGBARSTYLESALMON = GetItemInfo(133569); --"Drogbar-Style Salmon"
  SMARTBUFF_BARRACUDAMRGLGAGH = GetItemInfo(133567); --"Barracuda Mrglgagh"
  SMARTBUFF_FIGHTERCHOW = GetItemInfo(133577); --"Fighter Chow"
  SMARTBUFF_FARONAARFIZZ = GetItemInfo(133563); --"Faronaar Fizz"
  SMARTBUFF_BEARTARTARE = GetItemInfo(133576); --"Bear Tartare"
  SMARTBUFF_LEGIONCHILI = GetItemInfo(118428); --"Legion Chili"
  SMARTBUFF_DEEPFRIEDMOSSGILL = GetItemInfo(133561); --"Deep-Fried Mossgill"
  SMARTBUFF_MONDAZI = GetItemInfo(154885); --"Mon'Dazi"
  SMARTBUFF_KULTIRAMISU = GetItemInfo(154881); --"Kul Tiramisu"
  SMARTBUFF_GRILLEDCATFISH = GetItemInfo(154889); --"Grilled Catfish"
  SMARTBUFF_LOALOAF = GetItemInfo(154887); --"Loa Loaf"
  SMARTBUFF_HONEYHAUNCHES = GetItemInfo(154882); --"Honey-Glazed Haunches"
  SMARTBUFF_RAVENBERRYTARTS = GetItemInfo(154883); --"Ravenberry Tarts"
  SMARTBUFF_SWAMPFISHNCHIPS = GetItemInfo(154884); --"Swamp Fish 'n Chips"
  SMARTBUFF_SEASONEDLOINS = GetItemInfo(154891); --"Seasoned Loins"
  SMARTBUFF_SAILORSPIE = GetItemInfo(154888); --"Sailor's Pie"
  SMARTBUFF_SPICEDSNAPPER = GetItemInfo(154886); --"Spiced Snapper"
  SMARTBUFF_HEARTSBANEHEXWURST = GetItemInfo(163781); --"Heartsbane Hexwurst"

  
  -- Food item IDs
  S.FoodItems = GetItems({
    -- WotLK
    39691, 34125, 42779, 42997, 42998, 42999, 43000, 34767, 42995, 34769, 34754, 34758, 34766, 42994, 42996, 34756, 34768, 42993, 34755, 43001, 34757, 34752, 34751, 34750, 34749, 34764, 34765, 34763, 34762, 42942, 43268, 34748,
    -- CT
    62651, 62652, 62653, 62654, 62655, 62656, 62657, 62658, 62659, 62660, 62661, 62662, 62663, 62664, 62665, 62666, 62667, 62668, 62669, 62670, 62671, 62649,
    -- MoP
    74645, 74646, 74647, 74648, 74649, 74650, 74652, 74653, 74655, 74656, 86069, 86070, 86073, 86074, 81400, 81401, 81402, 81403, 81404, 81405, 81406, 81408, 81409, 81410, 81411, 81412, 81413, 81414,
 	-- WoD
 	111431, 111432, 111433, 111434, 111435, 111436, 111437, 111438, 111439, 111440, 11441, 111442, 111443, 111444, 111445, 111446, 111447, 111448, 111449, 111450, 111451, 111452, 111453, 111454,127991, 111457, 111458, 118576,
  });
  
  -- Conjured mage food IDs
  SMARTBUFF_CONJUREDMANA        = GetItemInfo(113509); --"Conjured Mana Buns"
  S.FoodMage = GetItems({113509, 80618, 80610, 65499, 43523, 43518, 34062, 65517, 65516, 65515, 65500, 42955});
  
  --SMARTBUFF_BCPETFOOD1          = GetItemInfo(33874); --"Kibler's Bits (Pet food)"
  --SMARTBUFF_WOTLKPETFOOD1       = GetItemInfo(43005); --"Spiced Mammoth Treats (Pet food)"
  
  -- Scrolls
  SMARTBUFF_SOAGILITY1          = GetItemInfo(3012);  --"Scroll of Agility I"
  SMARTBUFF_SOAGILITY2          = GetItemInfo(1477);  --"Scroll of Agility II"
  SMARTBUFF_SOAGILITY3          = GetItemInfo(4425);  --"Scroll of Agility III"
  SMARTBUFF_SOAGILITY4          = GetItemInfo(10309); --"Scroll of Agility IV"
  SMARTBUFF_SOAGILITY5          = GetItemInfo(27498); --"Scroll of Agility V"
  SMARTBUFF_SOAGILITY6          = GetItemInfo(33457); --"Scroll of Agility VI"
  SMARTBUFF_SOAGILITY7          = GetItemInfo(43463); --"Scroll of Agility VII"
  SMARTBUFF_SOAGILITY8          = GetItemInfo(43464); --"Scroll of Agility VIII"
  SMARTBUFF_SOAGILITY9          = GetItemInfo(63303); --"Scroll of Agility IX"
  SMARTBUFF_SOINTELLECT1        = GetItemInfo(955);   --"Scroll of Intellect I"
  SMARTBUFF_SOINTELLECT2        = GetItemInfo(2290);  --"Scroll of Intellect II"
  SMARTBUFF_SOINTELLECT3        = GetItemInfo(4419);  --"Scroll of Intellect III"
  SMARTBUFF_SOINTELLECT4        = GetItemInfo(10308); --"Scroll of Intellect IV"
  SMARTBUFF_SOINTELLECT5        = GetItemInfo(27499); --"Scroll of Intellect V"
  SMARTBUFF_SOINTELLECT6        = GetItemInfo(33458); --"Scroll of Intellect VI"
  SMARTBUFF_SOINTELLECT7        = GetItemInfo(37091); --"Scroll of Intellect VII"
  SMARTBUFF_SOINTELLECT8        = GetItemInfo(37092); --"Scroll of Intellect VIII"
  SMARTBUFF_SOINTELLECT9        = GetItemInfo(63305); --"Scroll of Intellect IX"
  SMARTBUFF_SOSTAMINA1          = GetItemInfo(1180);  --"Scroll of Stamina I"
  SMARTBUFF_SOSTAMINA2          = GetItemInfo(1711);  --"Scroll of Stamina II"
  SMARTBUFF_SOSTAMINA3          = GetItemInfo(4422);  --"Scroll of Stamina III"
  SMARTBUFF_SOSTAMINA4          = GetItemInfo(10307); --"Scroll of Stamina IV"
  SMARTBUFF_SOSTAMINA5          = GetItemInfo(27502); --"Scroll of Stamina V"
  SMARTBUFF_SOSTAMINA6          = GetItemInfo(33461); --"Scroll of Stamina VI"
  SMARTBUFF_SOSTAMINA7          = GetItemInfo(37093); --"Scroll of Stamina VII"
  SMARTBUFF_SOSTAMINA8          = GetItemInfo(37094); --"Scroll of Stamina VIII"
  SMARTBUFF_SOSTAMINA9          = GetItemInfo(63306); --"Scroll of Stamina IX"
  SMARTBUFF_SOSPIRIT1           = GetItemInfo(1181);  --"Scroll of Spirit I"
  SMARTBUFF_SOSPIRIT2           = GetItemInfo(1712);  --"Scroll of Spirit II"
  SMARTBUFF_SOSPIRIT3           = GetItemInfo(4424);  --"Scroll of Spirit III"
  SMARTBUFF_SOSPIRIT4           = GetItemInfo(10306); --"Scroll of Spirit IV"
  SMARTBUFF_SOSPIRIT5           = GetItemInfo(27501); --"Scroll of Spirit V"
  SMARTBUFF_SOSPIRIT6           = GetItemInfo(33460); --"Scroll of Spirit VI"
  SMARTBUFF_SOSPIRIT7           = GetItemInfo(37097); --"Scroll of Spirit VII"
  SMARTBUFF_SOSPIRIT8           = GetItemInfo(37098); --"Scroll of Spirit VIII"
  SMARTBUFF_SOSPIRIT9           = GetItemInfo(63307); --"Scroll of Spirit IX"
  SMARTBUFF_SOSTRENGHT1         = GetItemInfo(954);   --"Scroll of Strength I"
  SMARTBUFF_SOSTRENGHT2         = GetItemInfo(2289);  --"Scroll of Strength II"
  SMARTBUFF_SOSTRENGHT3         = GetItemInfo(4426);  --"Scroll of Strength III"
  SMARTBUFF_SOSTRENGHT4         = GetItemInfo(10310); --"Scroll of Strength IV"
  SMARTBUFF_SOSTRENGHT5         = GetItemInfo(27503); --"Scroll of Strength V"
  SMARTBUFF_SOSTRENGHT6         = GetItemInfo(33462); --"Scroll of Strength VI"
  SMARTBUFF_SOSTRENGHT7         = GetItemInfo(43465); --"Scroll of Strength VII"
  SMARTBUFF_SOSTRENGHT8         = GetItemInfo(43466); --"Scroll of Strength VIII"
  SMARTBUFF_SOSTRENGHT9         = GetItemInfo(63304); --"Scroll of Strength IX"
  SMARTBUFF_SOPROTECTION9       = GetItemInfo(63308); --"Scroll of Protection IX"
  
  SMARTBUFF_MiscItem1           = GetItemInfo(71134);  --"Celebration Package"
  SMARTBUFF_MiscItem2           = GetItemInfo(44986);  --"Warts-B-Gone Lip Balm"
  SMARTBUFF_MiscItem3           = GetItemInfo(69775);  --"Vrykul Drinking Horn"
  SMARTBUFF_MiscItem4           = GetItemInfo(86569);  --"Crystal of Insanity"
  SMARTBUFF_MiscItem5           = GetItemInfo(85500);  --"Anglers Fishing Raft"
  SMARTBUFF_MiscItem6           = GetItemInfo(85973);  --"Ancient Pandaren Fishing Charm"
  SMARTBUFF_MiscItem7           = GetItemInfo(94604);  --"Burning Seed"
  SMARTBUFF_MiscItem8           = GetItemInfo(35275);  --"Orb of the Sin'dorei"
  SMARTBUFF_MiscItem9           = GetItemInfo(92738);  --"Safari Hat"
  SMARTBUFF_MiscItem10          = GetItemInfo(110424); --"Savage Safari Hat"
  SMARTBUFF_MiscItem11          = GetItemInfo(118922); --"Oralius' Whispering Crystal"
  SMARTBUFF_MiscItem12          = GetItemInfo(129192); --"Inquisitor's Menacing Eye"
  SMARTBUFF_MiscItem13          = GetItemInfo(129210); --"Fel Crystal Fragments"
  SMARTBUFF_MiscItem14          = GetItemInfo(128475); --"Empowered Augment Rune"
  SMARTBUFF_MiscItem15          = GetItemInfo(128482); --"Empowered Augment Rune"
  SMARTBUFF_MiscItem16          = GetItemInfo(122298); --"Bodyguard Miniaturization Device"
  SMARTBUFF_MiscItem17          = GetItemInfo(147707); --"Repurposed Fel Focuser"
  
  SMARTBUFF_FLASK1              = GetItemInfo(46377);  --"Flask of Endless Rage"
  SMARTBUFF_FLASK2              = GetItemInfo(46376);  --"Flask of the Frost Wyrm"
  SMARTBUFF_FLASK3              = GetItemInfo(46379);  --"Flask of Stoneblood"
  SMARTBUFF_FLASK4              = GetItemInfo(46378);  --"Flask of Pure Mojo"
  SMARTBUFF_FLASKCT1            = GetItemInfo(58087);  --"Flask of the Winds"
  SMARTBUFF_FLASKCT2            = GetItemInfo(58088);  --"Flask of Titanic Strength"
  SMARTBUFF_FLASKCT3            = GetItemInfo(58086);  --"Flask of the Draconic Mind"
  SMARTBUFF_FLASKCT4            = GetItemInfo(58085);  --"Flask of Steelskin"
  SMARTBUFF_FLASKCT5            = GetItemInfo(67438);  --"Flask of Flowing Water"
  SMARTBUFF_FLASKCT7            = GetItemInfo(65455);  --"Flask of Battle"
  SMARTBUFF_FLASKMOP1           = GetItemInfo(75525);  --"Alchemist's Flask"
  SMARTBUFF_FLASKMOP2           = GetItemInfo(76087);  --"Flask of the Earth"
  SMARTBUFF_FLASKMOP3           = GetItemInfo(76086);  --"Flask of Falling Leaves"
  SMARTBUFF_FLASKMOP4           = GetItemInfo(76084);  --"Flask of Spring Blossoms"
  SMARTBUFF_FLASKMOP5           = GetItemInfo(76085);  --"Flask of the Warm Sun"
  SMARTBUFF_FLASKMOP6           = GetItemInfo(76088);  --"Flask of Winter's Bite"
  SMARTBUFF_FLASKWOD1           = GetItemInfo(109152); --"Draenic Stamina Flask"
  SMARTBUFF_FLASKWOD2           = GetItemInfo(109148); --"Draenic Strength Flask"
  SMARTBUFF_FLASKWOD3           = GetItemInfo(109147); --"Draenic Intellect Flask"
  SMARTBUFF_FLASKWOD4           = GetItemInfo(109145); --"Draenic Agility Flask"				
  SMARTBUFF_GRFLASKWOD1         = GetItemInfo(109160); --"Greater Draenic Stamina Flask"
  SMARTBUFF_GRFLASKWOD2         = GetItemInfo(109156); --"Greater Draenic Strength Flask"
  SMARTBUFF_GRFLASKWOD3         = GetItemInfo(109155); --"Greater Draenic Intellect Flask"
  SMARTBUFF_GRFLASKWOD4         = GetItemInfo(109153); --"Greater Draenic Agility Flask"  
  SMARTBUFF_FLASKLEG1           = GetItemInfo(127850); --"Flask of Ten Thousand Scars"
  SMARTBUFF_FLASKLEG2           = GetItemInfo(127849); --"Flask of the Countless Armies"
  SMARTBUFF_FLASKLEG3           = GetItemInfo(127847); --"Flask of the Whispered Pact"
  SMARTBUFF_FLASKLEG4           = GetItemInfo(127848); --"Flask of the Seventh Demon"

  SMARTBUFF_ELIXIR1             = GetItemInfo(39666);  --"Elixir of Mighty Agility"
  SMARTBUFF_ELIXIR2             = GetItemInfo(44332);  --"Elixir of Mighty Thoughts"
  SMARTBUFF_ELIXIR3             = GetItemInfo(40078);  --"Elixir of Mighty Fortitude"
  SMARTBUFF_ELIXIR4             = GetItemInfo(40073);  --"Elixir of Mighty Strength"
  SMARTBUFF_ELIXIR5             = GetItemInfo(40072);  --"Elixir of Spirit"
  SMARTBUFF_ELIXIR6             = GetItemInfo(40097);  --"Elixir of Protection"
  SMARTBUFF_ELIXIR7             = GetItemInfo(44328);  --"Elixir of Mighty Defense"
  SMARTBUFF_ELIXIR8             = GetItemInfo(44331);  --"Elixir of Lightning Speed"
  SMARTBUFF_ELIXIR9             = GetItemInfo(44329);  --"Elixir of Expertise"
  SMARTBUFF_ELIXIR10            = GetItemInfo(44327);  --"Elixir of Deadly Strikes"
  SMARTBUFF_ELIXIR11            = GetItemInfo(44330);  --"Elixir of Armor Piercing"
  SMARTBUFF_ELIXIR12            = GetItemInfo(44325);  --"Elixir of Accuracy"
  SMARTBUFF_ELIXIR13            = GetItemInfo(40076);  --"Guru's Elixir"
  SMARTBUFF_ELIXIR14            = GetItemInfo(9187);   --"Elixir of Greater Agility"
  SMARTBUFF_ELIXIR15            = GetItemInfo(28103);  --"Adept's Elixir"
  SMARTBUFF_ELIXIR16            = GetItemInfo(40070);  --"Spellpower Elixir"  
  SMARTBUFF_ELIXIRCT1           = GetItemInfo(58148);  --"Elixir of the Master"
  SMARTBUFF_ELIXIRCT2           = GetItemInfo(58144);  --"Elixir of Mighty Speed"
  SMARTBUFF_ELIXIRCT3           = GetItemInfo(58094);  --"Elixir of Impossible Accuracy"
  SMARTBUFF_ELIXIRCT4           = GetItemInfo(58143);  --"Prismatic Elixir"
  SMARTBUFF_ELIXIRCT5           = GetItemInfo(58093);  --"Elixir of Deep Earth"
  SMARTBUFF_ELIXIRCT6           = GetItemInfo(58092);  --"Elixir of the Cobra"
  SMARTBUFF_ELIXIRCT7           = GetItemInfo(58089);  --"Elixir of the Naga"
  SMARTBUFF_ELIXIRCT8           = GetItemInfo(58084);  --"Ghost Elixir"
  SMARTBUFF_ELIXIRMOP1          = GetItemInfo(76081);  --"Elixir of Mirrors"
  SMARTBUFF_ELIXIRMOP2          = GetItemInfo(76079);  --"Elixir of Peace"
  SMARTBUFF_ELIXIRMOP3          = GetItemInfo(76080);  --"Elixir of Perfection"
  SMARTBUFF_ELIXIRMOP4          = GetItemInfo(76078);  --"Elixir of the Rapids"
  SMARTBUFF_ELIXIRMOP5          = GetItemInfo(76077);  --"Elixir of Weaponry"
  SMARTBUFF_ELIXIRMOP6          = GetItemInfo(76076);  --"Mad Hozen Elixir"
  SMARTBUFF_ELIXIRMOP7          = GetItemInfo(76075);  --"Mantid Elixir"
  SMARTBUFF_ELIXIRMOP8          = GetItemInfo(76083);  --"Monk's Elixir"
  
  _, _, _, _, _, _, S.FishingPole = GetItemInfo(6256);  --"Fishing Pole"
  
  --SMARTBUFF_ELIXIR1             = GetItemInfo(39666);  --"Elixir"
  
  --SMARTBUFF_ = GetItemInfo(xxx); --""
  
  SMARTBUFF_AddMsgD("Item list initialized");
  
  LoadToys();
end


function SMARTBUFF_InitSpellIDs()
  SMARTBUFF_TESTSPELL       = GetSpellInfo(774);
  
  -- Druid  
  SMARTBUFF_DRUID_CAT       = GetSpellInfo(768);   --"Cat Form"
  SMARTBUFF_DRUID_TREE      = GetSpellInfo(33891); --"Incarnation: Tree of Life"
  SMARTBUFF_DRUID_TREANT    = GetSpellInfo(114282);--"Treant Form"
  SMARTBUFF_DRUID_MOONKIN   = GetSpellInfo(24858); --"Moonkin Form"
  --SMARTBUFF_DRUID_MKAURA    = GetSpellInfo(24907); --"Moonkin Aura"
  SMARTBUFF_DRUID_TRACK     = GetSpellInfo(5225);  --"Track Humanoids"
  --SMARTBUFF_MOTW            = GetSpellInfo(1126);  --"Mark of the Wild"
  SMARTBUFF_BARKSKIN        = GetSpellInfo(22812); --"Barkskin"
  SMARTBUFF_TIGERSFURY      = GetSpellInfo(5217);  --"Tiger's Fury"
  SMARTBUFF_SAVAGEROAR      = GetSpellInfo(52610); --"Savage Roar"
  SMARTBUFF_CENARIONWARD    = GetSpellInfo(102351);--"Cenarion Ward"
  SMARTBUFF_DRUID_BEAR      = GetSpellInfo(5487);  --"Bear Form"

  -- Priest
  SMARTBUFF_PWF             = GetSpellInfo(21562); --"Power Word: Fortitude"
  SMARTBUFF_PWS             = GetSpellInfo(17);    --"Power Word: Shield"
  --SMARTBUFF_FEARWARD        = GetSpellInfo(6346);  --"Fear Ward"
  SMARTBUFF_RENEW           = GetSpellInfo(139);   --"Renew"
  SMARTBUFF_LEVITATE        = GetSpellInfo(1706);  --"Levitate"
  SMARTBUFF_SHADOWFORM      = GetSpellInfo(232698); --"Shadowform"
  SMARTBUFF_VAMPIRICEMBRACE = GetSpellInfo(15286); --"Vampiric Embrace"
  --SMARTBUFF_LIGHTWELL       = GetSpellInfo(724);   --"Lightwell"
  --SMARTBUFF_CHAKRA1         = GetSpellInfo(81206)  --"Chakra Sanctuary"
  --SMARTBUFF_CHAKRA2         = GetSpellInfo(81208)  --"Chakra Serenity"
  --SMARTBUFF_CHAKRA3         = GetSpellInfo(81209)  --"Chakra Chastise"
  -- Priest buff links
  S.LinkPriestChakra        = { SMARTBUFF_CHAKRA1, SMARTBUFF_CHAKRA2, SMARTBUFF_CHAKRA3 }; 
  
  -- Mage
  SMARTBUFF_AB              = GetSpellInfo(1459);  --"Arcane Intellect"
  SMARTBUFF_DALARANB        = GetSpellInfo(61316); --"Dalaran Brilliance"
  SMARTBUFF_FROSTARMOR      = GetSpellInfo(7302);  --"Frost Armor"
  SMARTBUFF_MAGEARMOR       = GetSpellInfo(6117);  --"Mage Armor"
  --SMARTBUFF_MOLTENARMOR     = GetSpellInfo(30482); --"Molten Armor"
  SMARTBUFF_MANASHIELD      = GetSpellInfo(35064); --"Mana Shield"
  --SMARTBUFF_ICEWARD         = GetSpellInfo(111264);--"Ice Ward"
  SMARTBUFF_ICEBARRIER      = GetSpellInfo(11426); --"Ice Barrier"
  --SMARTBUFF_COMBUSTION      = GetSpellInfo(11129); --"Combustion"
  SMARTBUFF_ARCANEPOWER     = GetSpellInfo(12042); --"Arcane Power"
  SMARTBUFF_PRESENCEOFMIND  = GetSpellInfo(205025); --"Presence of Mind"
  SMARTBUFF_ICYVEINS        = GetSpellInfo(12472); --"Icy Veins"
  SMARTBUFF_SUMMONWATERELE  = GetSpellInfo(31687); --"Summon Water Elemental"
  SMARTBUFF_SLOWFALL        = GetSpellInfo(130);   --"Slow Fall"
  SMARTBUFF_REFRESHMENT     = GetSpellInfo(42955); --"Conjure Refreshment"
  SMARTBUFF_TEMPSHIELD      = GetSpellInfo(198111);--"Temporal Shield"
  --SMARTBUFF_AMPMAGIC        = GetSpellInfo(159916);--"Amplify Magic"
  SMARTBUFF_PRISBARRIER     = GetSpellInfo(235450);--"Prismatic Barrier"
  SMARTBUFF_BLAZBARRIER     = GetSpellInfo(235313);--"Blazing Barrier"
  SMARTBUFF_ARCANEFAMILIAR  = GetSpellInfo(205022);--"Arcane Familiar"
  
  -- Mage buff links
  S.ChainMageArmor = { SMARTBUFF_FROSTARMOR, SMARTBUFF_MAGEARMOR, SMARTBUFF_MOLTENARMOR };
  
  -- Warlock
  SMARTBUFF_DARKINTENT      = GetSpellInfo(183582);--"Dark Intent"  
  SMARTBUFF_UNENDINGBREATH  = GetSpellInfo(5697);  --"Unending Breath"
  SMARTBUFF_SOULLINK        = GetSpellInfo(108447);--"Soul Link"
  SMARTBUFF_LIFETAP         = GetSpellInfo(1454);  --"Life Tap"
  SMARTBUFF_CREATEHS        = GetSpellInfo(6201);  --"Create Healthstone"
  SMARTBUFF_SOULSTONE       = GetSpellInfo(20707); --"Soulstone"
  SMARTBUFF_GOSACRIFICE     = GetSpellInfo(108503);--"Grimoire of Sacrifice"
  --SMARTBUFF_BLOODHORROR     = GetSpellInfo(111397);--"Blood Horror"
  
  -- Hunter
  SMARTBUFF_TRUESHOTAURA    = GetSpellInfo(193526); --"Trueshot Aura" (P)
  SMARTBUFF_VOLLEY          = GetSpellInfo(194386); --"Volley"
  SMARTBUFF_RAPIDFIRE       = GetSpellInfo(3045);  --"Rapid Fire"
  SMARTBUFF_FOCUSFIRE       = GetSpellInfo(82692); --"Focus Fire"
  --SMARTBUFF_TRAPLAUNCHER    = GetSpellInfo(77769); --"Trap Launcher"
  --SMARTBUFF_CAMOFLAUGE      = GetSpellInfo(51753); --"Camoflauge"
  SMARTBUFF_AOTC            = GetSpellInfo(186257);  --"Aspect of the Cheetah"
  --SMARTBUFF_AOTP            = GetSpellInfo(13159); --"Aspect of the Pack"
  --SMARTBUFF_AOTF            = GetSpellInfo(172106); --"Aspect of the Fox"
  SMARTBUFF_AOTW			= GetSpellInfo(193530);	--"Aspect of the Wild"
  SMARTBUFF_AMMOI           = GetSpellInfo(162536); --"Incendiary Ammo"
  SMARTBUFF_AMMOP           = GetSpellInfo(162537); --"Poisoned Ammo"
  SMARTBUFF_AMMOF           = GetSpellInfo(162539); --"Frozen Ammo"
  --SMARTBUFF_LW1             = GetSpellInfo(160200); --"Lone Wolf: Ferocity of the Raptor"
  --SMARTBUFF_LW2             = GetSpellInfo(160203); --"Lone Wolf: Haste of the Hyena"
  --SMARTBUFF_LW3             = GetSpellInfo(160198); --"Lone Wolf: Grace of the Cat"
  --SMARTBUFF_LW4             = GetSpellInfo(160206); --"Lone Wolf: Power of the Primates"
  --SMARTBUFF_LW5             = GetSpellInfo(160199); --"Lone Wolf: Fortitude of the Bear"
  --SMARTBUFF_LW6             = GetSpellInfo(160205); --"Lone Wolf: Wisdom of the Serpent"
  --SMARTBUFF_LW7             = GetSpellInfo(172967); --"Lone Wolf: Versatility of the Ravager"
  --SMARTBUFF_LW8             = GetSpellInfo(172968); --"Lone Wolf: Quickness of the Dragonhawk"
  -- Hunter buff links
  S.LinkAspects  = { SMARTBUFF_AOTF, SMARTBUFF_AOTC, SMARTBUFF_AOTP, SMARTBUFF_AOTW };
  S.LinkAmmo     = { SMARTBUFF_AMMOI, SMARTBUFF_AMMOP, SMARTBUFF_AMMOF };
  S.LinkLoneWolf = { SMARTBUFF_LW1, SMARTBUFF_LW2, SMARTBUFF_LW3, SMARTBUFF_LW4, SMARTBUFF_LW5, SMARTBUFF_LW6, SMARTBUFF_LW7, SMARTBUFF_LW8 };
  
  -- Shaman
  SMARTBUFF_LIGHTNINGSHIELD = GetSpellInfo(192106); --"Lightning Shield"
 -- SMARTBUFF_WATERSHIELD     = GetSpellInfo(52127);  --"Water Shield"
  SMARTBUFF_EARTHSHIELD     = GetSpellInfo(974);    --"Earth Shield"
  SMARTBUFF_WATERWALKING    = GetSpellInfo(546);    --"Water Walking"
  SMARTBUFF_EMASTERY        = GetSpellInfo(16166);  --"Elemental Mastery"
  --SMARTBUFF_UNLEASHFLAME    = GetSpellInfo(165462); --"Unleash Flame"
  SMARTBUFF_ASCENDANCE_ELE      = GetSpellInfo(114050); --"Ascendance (Elemental)"
  SMARTBUFF_ASCENDANCE_ENH      = GetSpellInfo(114051); --"Ascendance (Enhancement)"
  SMARTBUFF_ASCENDANCE_RES      = GetSpellInfo(114052); --"Ascendance (Restoration)"
  --SMARTBUFF_GRACEOFAIR      = GetSpellInfo(116956); --"Grace of Air" (P)
  -- Shaman buff links
  S.ChainShamanShield = { SMARTBUFF_LIGHTNINGSHIELD, SMARTBUFF_WATERSHIELD, SMARTBUFF_EARTHSHIELD };
  
  -- Warrior
  SMARTBUFF_BATTLESHOUT     = GetSpellInfo(6673);   --"Battle Shout"
  SMARTBUFF_COMMANDINGSHOUT = GetSpellInfo(97462);    --"Reallying Cry"
  SMARTBUFF_BERSERKERRAGE   = GetSpellInfo(18499);  --"Berserker Rage"
  --SMARTBUFF_BATSTANCE       = GetSpellInfo(2457);   --"Battle Stance"
  SMARTBUFF_DEFSTANCE       = GetSpellInfo(197690);     --"Defensive Stance"
  --SMARTBUFF_GLADSTANCE      = GetSpellInfo(156291); --"Gladiator Stance"
  SMARTBUFF_SHIELDBLOCK     = GetSpellInfo(2565);   --"Shield Block"
  -- Warrior buff links
  S.ChainWarriorStance = { SMARTBUFF_BATSTANCE, SMARTBUFF_DEFSTANCE, SMARTBUFF_GLADSTANCE };
  S.ChainWarriorShout  = { SMARTBUFF_BATTLESHOUT, SMARTBUFF_COMMANDINGSHOUT };

  -- Rogue
  SMARTBUFF_STEALTH         = GetSpellInfo(1784);  --"Stealth"
  SMARTBUFF_BLADEFLURRY     = GetSpellInfo(13877); --"Blade Flurry"
  SMARTBUFF_SAD             = GetSpellInfo(5171);  --"Slice and Dice"
  SMARTBUFF_EVASION         = GetSpellInfo(5277);  --"Evasion"
  SMARTBUFF_HUNGERFORBLOOD  = GetSpellInfo(60177); --"Hunger For Blood"
  SMARTBUFF_TRICKS          = GetSpellInfo(57934); --"Tricks of the Trade"
  SMARTBUFF_RECUPERATE      = GetSpellInfo(185311); --"Crimson Vial
  -- Poisons
  SMARTBUFF_WOUNDPOISON       = GetSpellInfo(8679);  --"Wound Poison"
  SMARTBUFF_CRIPPLINGPOISON   = GetSpellInfo(3408);  --"Crippling Poison"
  SMARTBUFF_DEADLYPOISON      = GetSpellInfo(2823);  --"Deadly Poison"
  SMARTBUFF_LEECHINGPOISON    = GetSpellInfo(108211);--"Leeching Poison"
--  SMARTBUFF_INSTANTPOISON     = GetSpellInfo(157607);--"Instant Poison"
--  SMARTBUFF_AGONIZINGPOISON   = GetSpellInfo(200802);--"Agonizing Poison"
  -- Rogue buff links
  S.ChainRoguePoisonsLethal    = { SMARTBUFF_DEADLYPOISON, SMARTBUFF_WOUNDPOISON, SMARTBUFF_INSTANTPOISON, SMARTBUFF_AGONIZINGPOISON };
  S.ChainRoguePoisonsNonLethal = { SMARTBUFF_CRIPPLINGPOISON, SMARTBUFF_LEECHINGPOISON };
  
  -- Paladin
  SMARTBUFF_RIGHTEOUSFURY         = GetSpellInfo(25780);  --"Righteous Fury"
--  SMARTBUFF_HOLYSHIELD            = GetSpellInfo(20925);  --"Sacred Shield"
  SMARTBUFF_BOK                   = GetSpellInfo(203538); --"Greater Blessing of Kings"  
--  SMARTBUFF_BOM                   = GetSpellInfo(203528); --"Greater Blessing of Might"
  SMARTBUFF_BOW                   = GetSpellInfo(203539); --"Greater Blessing of Wisdom"
  SMARTBUFF_HOF                   = GetSpellInfo(1044);   --"Blessing of Freedom"  
  SMARTBUFF_HOP                   = GetSpellInfo(1022);   --"Blessing of Protection"
  SMARTBUFF_HOSAL                 = GetSpellInfo(204013); --"Blessing of Salvation"
--  SMARTBUFF_SOJUSTICE             = GetSpellInfo(20164);  --"Seal of Justice"
--  SMARTBUFF_SOINSIGHT             = GetSpellInfo(20165);  --"Seal of Insight"
--  SMARTBUFF_SORIGHTEOUSNESS       = GetSpellInfo(20154);  --"Seal of Righteousness"
--  SMARTBUFF_SOTRUTH               = GetSpellInfo(31801);  --"Seal of Truth"
--  SMARTBUFF_SOCOMMAND             = GetSpellInfo(105361); --"Seal of Command"
  SMARTBUFF_AVENGINGWARTH         = GetSpellInfo(31884);  --"Avenging Wrath"
  SMARTBUFF_BEACONOFLIGHT         = GetSpellInfo(53563);  --"Beacon of Light"
  SMARTBUFF_BEACONOFAITH          = GetSpellInfo(156910); --"Beacon of Faith"
  -- Paladin buff links
  S.ChainPaladinSeal     = { SMARTBUFF_SOCOMMAND, SMARTBUFF_SOTRUTH, SMARTBUFF_SOJUSTICE, SMARTBUFF_SOINSIGHT, SMARTBUFF_SORIGHTEOUSNESS };
  S.ChainPaladinBlessing = { SMARTBUFF_BOK, SMARTBUFF_BOM, SMARTBUFF_BOW};
  
  -- Death Knight
  SMARTBUFF_DANCINGRW         = GetSpellInfo(49028); --"Dancing Rune Weapon"
--  SMARTBUFF_BLOODPRESENCE     = GetSpellInfo(48263); --"Blood Presence"
--  SMARTBUFF_FROSTPRESENCE     = GetSpellInfo(48266); --"Frost Presence"
--  SMARTBUFF_UNHOLYPRESENCE    = GetSpellInfo(48265); --"Unholy Presence"  
  SMARTBUFF_PATHOFFROST       = GetSpellInfo(3714);  --"Path of Frost"
--  SMARTBUFF_BONESHIELD        = GetSpellInfo(49222); --"Bone Shield"
  SMARTBUFF_HORNOFWINTER      = GetSpellInfo(57330); --"Horn of Winter"
  SMARTBUFF_RAISEDEAD         = GetSpellInfo(46584); --"Raise Dead"
--  SMARTBUFF_POTGRAVE          = GetSpellInfo(155522); --"Power of the Grave" (P)
  -- Death Knight buff links
  S.ChainDKPresence = { SMARTBUFF_BLOODPRESENCE, SMARTBUFF_FROSTPRESENCE, SMARTBUFF_UNHOLYPRESENCE };
  
  -- Monk
--  SMARTBUFF_LOTWT           = GetSpellInfo(116781); --"Legacy of the White Tiger"
--  SMARTBUFF_LOTE            = GetSpellInfo(115921); --"Legacy of the Emperor"
  SMARTBUFF_BLACKOX         = GetSpellInfo(115315); --"Summon Black Ox Statue"
  SMARTBUFF_JADESERPENT     = GetSpellInfo(115313); --"Summon Jade Serpent Statue"
  SMARTBUFF_SOTFIERCETIGER  = GetSpellInfo(103985); --"Stance of the Fierce Tiger"
  SMARTBUFF_SOTSTURDYOX     = GetSpellInfo(115069); --"Stagger"
--  SMARTBUFF_SOTWISESERPENT  = GetSpellInfo(115070); --"Stance of the Wise Serpent"
--  SMARTBUFF_SOTSPIRITEDCRANE= GetSpellInfo(154436); --"Stance of the Spirited Crane"
  -- Monk buff links
  S.ChainMonkStatue = { SMARTBUFF_BLACKOX, SMARTBUFF_JADESERPENT };  
  S.ChainMonkStance = { SMARTBUFF_SOTFIERCETIGER, SMARTBUFF_SOTSTURDYOX, SMARTBUFF_SOTWISESERPENT, SMARTBUFF_SOTSPIRITEDCRANE };

  -- Demon Hunter

  
  -- Tracking
  SMARTBUFF_FINDMINERALS    = GetSpellInfo(2580);  --"Find Minerals"
  SMARTBUFF_FINDHERBS       = GetSpellInfo(2383);  --"Find Herbs"
  SMARTBUFF_FINDTREASURE    = GetSpellInfo(2481);  --"Find Treasure"
  SMARTBUFF_TRACKHUMANOIDS  = GetSpellInfo(19883); --"Track Humanoids"
  SMARTBUFF_TRACKBEASTS     = GetSpellInfo(1494);  --"Track Beasts"
  SMARTBUFF_TRACKUNDEAD     = GetSpellInfo(19884); --"Track Undead"
  SMARTBUFF_TRACKHIDDEN     = GetSpellInfo(19885); --"Track Hidden"
  SMARTBUFF_TRACKELEMENTALS = GetSpellInfo(19880); --"Track Elementals"
  SMARTBUFF_TRACKDEMONS     = GetSpellInfo(19878); --"Track Demons"
  SMARTBUFF_TRACKGIANTS     = GetSpellInfo(19882); --"Track Giants"
  SMARTBUFF_TRACKDRAGONKIN  = GetSpellInfo(19879); --"Track Dragonkin"

  -- Racial
  SMARTBUFF_STONEFORM       = GetSpellInfo(20594); --"Stoneform"
  SMARTBUFF_BLOODFURY       = GetSpellInfo(20572); --"Blood Fury" 33697, 33702
  SMARTBUFF_BERSERKING      = GetSpellInfo(26297); --"Berserking"
  SMARTBUFF_WOTFORSAKEN     = GetSpellInfo(7744);  --"Will of the Forsaken"
  SMARTBUFF_WarStomp        = GetSpellInfo(20549); --"War Stomp"
  
  -- Food
  SMARTBUFF_FOOD_AURA       = GetSpellInfo(46899); --"Well Fed"
  SMARTBUFF_FOOD_SPELL      = GetSpellInfo(433);   --"Food"
  SMARTBUFF_DRINK_SPELL     = GetSpellInfo(430);   --"Drink"
  
  -- Misc
  SMARTBUFF_KIRUSSOV        = GetSpellInfo(46302); --"K'iru's Song of Victory"
  SMARTBUFF_FISHING         = GetSpellInfo(7620) or GetSpellInfo(111541); --"Fishing"
  
  -- Scroll
  SMARTBUFF_SBAGILITY       = GetSpellInfo(8115);   --"Scroll buff: Agility"
  SMARTBUFF_SBINTELLECT     = GetSpellInfo(8096);   --"Scroll buff: Intellect"
  SMARTBUFF_SBSTAMINA       = GetSpellInfo(8099);   --"Scroll buff: Stamina"
  SMARTBUFF_SBSPIRIT        = GetSpellInfo(8112);   --"Scroll buff: Spirit"
  SMARTBUFF_SBSTRENGHT      = GetSpellInfo(8118);   --"Scroll buff: Strength"
  SMARTBUFF_SBPROTECTION    = GetSpellInfo(89344);  --"Scroll buff: Armor"
  SMARTBUFF_BMiscItem1      = GetSpellInfo(150986); --"WoW's 10th Anniversary"
  SMARTBUFF_BMiscItem2      = GetSpellInfo(62574);  --"Warts-B-Gone Lip Balm"
  SMARTBUFF_BMiscItem3      = GetSpellInfo(98444);  --"Vrykul Drinking Horn"
  SMARTBUFF_BMiscItem4      = GetSpellInfo(127230); --"Visions of Insanity"
  SMARTBUFF_BMiscItem5      = GetSpellInfo(124036); --"Anglers Fishing Raft"
  SMARTBUFF_BMiscItem6      = GetSpellInfo(125167); --"Ancient Pandaren Fishing Charm"
  SMARTBUFF_BMiscItem7      = GetSpellInfo(138927); --"Burning Essence"
  SMARTBUFF_BMiscItem8      = GetSpellInfo(160331); --"Blood Elf Illusion"
  SMARTBUFF_BMiscItem9      = GetSpellInfo(158486); --"Safari Hat"
  SMARTBUFF_BMiscItem10     = GetSpellInfo(158474); --"Savage Safari Hat"
  SMARTBUFF_BMiscItem11     = GetSpellInfo(176151); --"Whispers of Insanity"
  SMARTBUFF_BMiscItem12     = GetSpellInfo(193456); --"Gaze of the Legion"
  SMARTBUFF_BMiscItem13     = GetSpellInfo(193547); --"Fel Crystal Infusion"
  SMARTBUFF_BMiscItem14     = GetSpellInfo(190668); --"Empower"
  SMARTBUFF_BMiscItem14_1   = GetSpellInfo(175457); --"Focus Augmentation"
  SMARTBUFF_BMiscItem14_2   = GetSpellInfo(175456); --"Hyper Augmentation"
  SMARTBUFF_BMiscItem14_3   = GetSpellInfo(175439); --"Stout Augmentation
  SMARTBUFF_BMiscItem16     = GetSpellInfo(181642); --"Bodyguard Miniaturization Device"
  SMARTBUFF_BMiscItem17     = GetSpellInfo(242551); --"Fel Focus"
  
  S.LinkSafariHat           = { SMARTBUFF_BMiscItem9, SMARTBUFF_BMiscItem10 };
  S.LinkAugment             = { SMARTBUFF_BMiscItem14, SMARTBUFF_BMiscItem14_1, SMARTBUFF_BMiscItem14_2, SMARTBUFF_BMiscItem14_3 };
  
  -- Flasks & Elixirs
  SMARTBUFF_BFLASK1         = GetSpellInfo(53760);  --"Flask of Endless Rage"
  SMARTBUFF_BFLASK2         = GetSpellInfo(53755);  --"Flask of the Frost Wyrm"
  SMARTBUFF_BFLASK3         = GetSpellInfo(53758);  --"Flask of Stoneblood"
  SMARTBUFF_BFLASK4         = GetSpellInfo(54212);  --"Flask of Pure Mojo"
  SMARTBUFF_BFLASKCT1       = GetSpellInfo(79471);  --"Flask of the Winds"
  SMARTBUFF_BFLASKCT2       = GetSpellInfo(79472);  --"Flask of Titanic Strength"
  SMARTBUFF_BFLASKCT3       = GetSpellInfo(79470);  --"Flask of the Draconic Mind"
  SMARTBUFF_BFLASKCT4       = GetSpellInfo(79469);  --"Flask of Steelskin"
  SMARTBUFF_BFLASKCT5       = GetSpellInfo(94160);  --"Flask of Flowing Water"
  SMARTBUFF_BFLASKCT7       = GetSpellInfo(92679);  --"Flask of Battle"
  SMARTBUFF_BFLASKMOP1      = GetSpellInfo(105617); --"Alchemist's Flask"
  SMARTBUFF_BFLASKMOP2      = GetSpellInfo(105694); --"Flask of the Earth"
  SMARTBUFF_BFLASKMOP3      = GetSpellInfo(105693); --"Flask of Falling Leaves"
  SMARTBUFF_BFLASKMOP4      = GetSpellInfo(105689); --"Flask of Spring Blossoms"
  SMARTBUFF_BFLASKMOP5      = GetSpellInfo(105691); --"Flask of the Warm Sun"
  SMARTBUFF_BFLASKMOP6      = GetSpellInfo(105696); --"Flask of Winter's Bite"
  SMARTBUFF_BFLASKCT61      = GetSpellInfo(79640);  --"Enhanced Intellect"
  SMARTBUFF_BFLASKCT62      = GetSpellInfo(79639);  --"Enhanced Agility"
  SMARTBUFF_BFLASKCT63      = GetSpellInfo(79638);  --"Enhanced Strength"
  SMARTBUFF_BFLASKWOD1      = GetSpellInfo(156077); --"Draenic Stamina Flask"
  SMARTBUFF_BFLASKWOD2      = GetSpellInfo(156071); --"Draenic Strength Flask"
  SMARTBUFF_BFLASKWOD3      = GetSpellInfo(156070); --"Draenic Intellect Flask"
  SMARTBUFF_BFLASKWOD4      = GetSpellInfo(156073); --"Draenic Agility Flask"
  SMARTBUFF_BGRFLASKWOD1    = GetSpellInfo(156084); --"Greater Draenic Stamina Flask"
  SMARTBUFF_BGRFLASKWOD2    = GetSpellInfo(156080); --"Greater Draenic Strength Flask"
  SMARTBUFF_BGRFLASKWOD3    = GetSpellInfo(156079); --"Greater Draenic Intellect Flask"
  SMARTBUFF_BGRFLASKWOD4    = GetSpellInfo(156064); --"Greater Draenic Agility Flask"  
  SMARTBUFF_BFLASKLEG1      = GetSpellInfo(188035); --"Flask of Ten Thousand Scars"
  SMARTBUFF_BFLASKLEG2      = GetSpellInfo(188034); --"Flask of the Countless Armies"
  SMARTBUFF_BFLASKLEG3      = GetSpellInfo(188031); --"Flask of the Whispered Pact"
  SMARTBUFF_BFLASKLEG4      = GetSpellInfo(188033); --"Flask of the Seventh Demon"
  
  S.LinkFlaskCT7            = { SMARTBUFF_BFLASKCT1, SMARTBUFF_BFLASKCT2, SMARTBUFF_BFLASKCT3, SMARTBUFF_BFLASKCT4, SMARTBUFF_BFLASKCT5 };
  S.LinkFlaskMoP            = { SMARTBUFF_BFLASKCT61, SMARTBUFF_BFLASKCT62, SMARTBUFF_BFLASKCT63, SMARTBUFF_BFLASKMOP2, SMARTBUFF_BFLASKMOP3, SMARTBUFF_BFLASKMOP4, SMARTBUFF_BFLASKMOP5, SMARTBUFF_BFLASKMOP6 };
  S.LinkFlaskWoD            = { SMARTBUFF_BFLASKWOD1, SMARTBUFF_BFLASKWOD2, SMARTBUFF_BFLASKWOD3, SMARTBUFF_BFLASKWOD4, SMARTBUFF_BGRFLASKWOD1, SMARTBUFF_BGRFLASKWOD2, SMARTBUFF_BGRFLASKWOD3, SMARTBUFF_BGRFLASKWOD4 };
  S.LinkFlaskLeg            = { SMARTBUFF_BFLASKLEG1, SMARTBUFF_BFLASKLEG2, SMARTBUFF_BFLASKLEG3, SMARTBUFF_BFLASKLEG4 };
  
  SMARTBUFF_BELIXIR1        = GetSpellInfo(28497);  --"Mighty Agility" B
  SMARTBUFF_BELIXIR2        = GetSpellInfo(60347);  --"Mighty Thoughts" G
  SMARTBUFF_BELIXIR3        = GetSpellInfo(53751);  --"Elixir of Mighty Fortitude" G
  SMARTBUFF_BELIXIR4        = GetSpellInfo(53748);  --"Mighty Strength" B
  SMARTBUFF_BELIXIR5        = GetSpellInfo(53747);  --"Elixir of Spirit" B
  SMARTBUFF_BELIXIR6        = GetSpellInfo(53763);  --"Protection" G
  SMARTBUFF_BELIXIR7        = GetSpellInfo(60343);  --"Mighty Defense" G
  SMARTBUFF_BELIXIR8        = GetSpellInfo(60346);  --"Lightning Speed" B
  SMARTBUFF_BELIXIR9        = GetSpellInfo(60344);  --"Expertise" B
  SMARTBUFF_BELIXIR10       = GetSpellInfo(60341);  --"Deadly Strikes" B
  SMARTBUFF_BELIXIR11       = GetSpellInfo(80532);  --"Armor Piercing"
  SMARTBUFF_BELIXIR12       = GetSpellInfo(60340);  --"Accuracy" B
  SMARTBUFF_BELIXIR13       = GetSpellInfo(53749);  --"Guru's Elixir" B
  SMARTBUFF_BELIXIR14       = GetSpellInfo(11334);  --"Elixir of Greater Agility" B
  SMARTBUFF_BELIXIR15       = GetSpellInfo(54452);  --"Adept's Elixir" B
  SMARTBUFF_BELIXIR16       = GetSpellInfo(33721);  --"Spellpower Elixir" B
  SMARTBUFF_BELIXIRCT1      = GetSpellInfo(79635);  --"Elixir of the Master" B
  SMARTBUFF_BELIXIRCT2      = GetSpellInfo(79632);  --"Elixir of Mighty Speed" B
  SMARTBUFF_BELIXIRCT3      = GetSpellInfo(79481);  --"Elixir of Impossible Accuracy" B
  SMARTBUFF_BELIXIRCT4      = GetSpellInfo(79631);  --"Prismatic Elixir" G
  SMARTBUFF_BELIXIRCT5      = GetSpellInfo(79480);  --"Elixir of Deep Earth" G
  SMARTBUFF_BELIXIRCT6      = GetSpellInfo(79477);  --"Elixir of the Cobra" B
  SMARTBUFF_BELIXIRCT7      = GetSpellInfo(79474);  --"Elixir of the Naga" B
  SMARTBUFF_BELIXIRCT8      = GetSpellInfo(79468);  --"Ghost Elixir" B
  SMARTBUFF_BELIXIRMOP1     = GetSpellInfo(105687); --"Elixir of Mirrors" G
  SMARTBUFF_BELIXIRMOP2     = GetSpellInfo(105685); --"Elixir of Peace" B
  SMARTBUFF_BELIXIRMOP3     = GetSpellInfo(105686); --"Elixir of Perfection" B
  SMARTBUFF_BELIXIRMOP4     = GetSpellInfo(105684); --"Elixir of the Rapids" B
  SMARTBUFF_BELIXIRMOP5     = GetSpellInfo(105683); --"Elixir of Weaponry" B
  SMARTBUFF_BELIXIRMOP6     = GetSpellInfo(105682); --"Mad Hozen Elixir" B
  SMARTBUFF_BELIXIRMOP7     = GetSpellInfo(105681); --"Mantid Elixir" G
  SMARTBUFF_BELIXIRMOP8     = GetSpellInfo(105688); --"Monk's Elixir" B
  
  --if (SMARTBUFF_GOTW) then
  --  SMARTBUFF_AddMsgD(SMARTBUFF_GOTW.." found");
  --end
  
  -- Buff map
  S.LinkStats = { SMARTBUFF_BOK, SMARTBUFF_MOTW, SMARTBUFF_LOTE, SMARTBUFF_LOTWT,
                  GetSpellInfo(159988), -- Bark of the Wild
                  GetSpellInfo(203538), -- Greater Blessing of Kings
                  GetSpellInfo(90363),  -- Embrace of the Shale Spider
                  GetSpellInfo(160077)  -- Strength of the Earth
                };
  
  S.LinkSta   = { SMARTBUFF_PWF, SMARTBUFF_COMMANDINGSHOUT, SMARTBUFF_BLOODPACT,
                  GetSpellInfo(50256),  -- Invigorating Roar
                  GetSpellInfo(90364),  -- Qiraji Fortitude
                  GetSpellInfo(160014), -- Sturdiness
                  GetSpellInfo(160003)  -- Savage Vigor
                };
  
  S.LinkAp    = { SMARTBUFF_HORNOFWINTER, SMARTBUFF_BATTLESHOUT, SMARTBUFF_TRUESHOTAURA };
  
  S.LinkMa    = { SMARTBUFF_BOM, SMARTBUFF_DRUID_MKAURA, SMARTBUFF_GRACEOFAIR, SMARTBUFF_POTGRAVE,
                  GetSpellInfo(93435),  -- Roar of Courage
                  GetSpellInfo(160039), -- Keen Senses
                  GetSpellInfo(128997), -- Spirit Beast Blessing
                  GetSpellInfo(160073)  -- Plainswalking
                };
  
  S.LinkInt   = { SMARTBUFF_BOW, SMARTBUFF_AB, SMARTBUFF_DALARANB };
  
  --S.LinkSp    = { SMARTBUFF_DARKINTENT, SMARTBUFF_AB, SMARTBUFF_DALARANB, SMARTBUFF_STILLWATER };
  
  --SMARTBUFF_AddMsgD("Spell IDs initialized");
end


function SMARTBUFF_InitSpellList()
  if (SMARTBUFF_PLAYERCLASS == nil) then return; end
  
  --if (SMARTBUFF_GOTW) then
  --  SMARTBUFF_AddMsgD(SMARTBUFF_GOTW.." found");
  --end
  
  -- Druid
  if (SMARTBUFF_PLAYERCLASS == "DRUID") then
    SMARTBUFF_BUFFLIST = {
      {SMARTBUFF_DRUID_MOONKIN, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_DRUID_TREANT, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_DRUID_BEAR, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_DRUID_CAT, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_DRUID_TREE, 0.5, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_MOTW, 60, SMARTBUFF_CONST_GROUP, {30}, "WPET;DKPET"},
      {SMARTBUFF_CENARIONWARD, 0.5, SMARTBUFF_CONST_GROUP, {1}, "WARRIOR;DRUID;SHAMAN;HUNTER;ROGUE;MAGE;PRIEST;PALADIN;WARLOCK;DEATHKNIGHT;MONK;DEMONHUNTER"},
      {SMARTBUFF_BARKSKIN, 0.25, SMARTBUFF_CONST_FORCESELF},
      {SMARTBUFF_TIGERSFURY, 0.1, SMARTBUFF_CONST_SELF, nil, SMARTBUFF_DRUID_CAT},
      {SMARTBUFF_SAVAGEROAR, 0.15, SMARTBUFF_CONST_SELF, nil, SMARTBUFF_DRUID_CAT}
    };
  end
  
  -- Priest
  if (SMARTBUFF_PLAYERCLASS == "PRIEST") then
    SMARTBUFF_BUFFLIST = {
      {SMARTBUFF_SHADOWFORM, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_VAMPIRICEMBRACE, 30, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_PWF, 60, SMARTBUFF_CONST_GROUP, {14}, "HPET;WPET;DKPET", S.LinkSta},
      {SMARTBUFF_PWS, 0.5, SMARTBUFF_CONST_GROUP, {6}, "MAGE;WARLOCK;ROGUE;PALADIN;WARRIOR;DRUID;HUNTER;SHAMAN;DEATHKNIGHT;MONK;DEMONHUNTER;HPET;WPET;DKPET"},
      {SMARTBUFF_FEARWARD, 3, SMARTBUFF_CONST_GROUP, {54}, "HPET;WPET;DKPET"},
      {SMARTBUFF_LEVITATE, 2, SMARTBUFF_CONST_GROUP, {34}, "HPET;WPET;DKPET"},
      {SMARTBUFF_CHAKRA1, 0.5, SMARTBUFF_CONST_SELF, nil, nil, S.LinkPriestChakra},
      {SMARTBUFF_CHAKRA2, 0.5, SMARTBUFF_CONST_SELF, nil, nil, S.LinkPriestChakra},
      {SMARTBUFF_CHAKRA3, 0.5, SMARTBUFF_CONST_SELF, nil, nil, S.LinkPriestChakra},
      {SMARTBUFF_LIGHTWELL, 3, SMARTBUFF_CONST_SELF}
    };
  end
  
  -- Mage
  if (SMARTBUFF_PLAYERCLASS == "MAGE") then
    SMARTBUFF_BUFFLIST = {
      {SMARTBUFF_AB, 60, SMARTBUFF_CONST_GROUP, {1,14,28,42,56,70,80}, nil, S.LinkInt, S.LinkInt},
      {SMARTBUFF_DALARANB, 60, SMARTBUFF_CONST_GROUP, {80,80,80,80,80,80,80}, nil, S.LinkInt, S.LinkInt},
      {SMARTBUFF_TEMPSHIELD, 0.067, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_AMPMAGIC, 0.1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_SUMMONWATERELE, -1, SMARTBUFF_CONST_SELF, nil, S.CheckPet},
      {SMARTBUFF_FROSTARMOR, -1, SMARTBUFF_CONST_SELF, nil, nil, nil, S.ChainMageArmor},
      {SMARTBUFF_MAGEARMOR, -1, SMARTBUFF_CONST_SELF, nil, nil, nil, S.ChainMageArmor},
      {SMARTBUFF_MOLTENARMOR, -1, SMARTBUFF_CONST_SELF, nil, nil, nil, S.ChainMageArmor},
      {SMARTBUFF_SLOWFALL, 0.5, SMARTBUFF_CONST_GROUP, {32}, "HPET;WPET;DKPET"},
      {SMARTBUFF_MANASHIELD, 0.5, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_ICEWARD, 0.5, SMARTBUFF_CONST_GROUP, {45}, "HPET;WPET;DKPET"},
      {SMARTBUFF_ICEBARRIER, 1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_COMBUSTION, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_ICYVEINS, 0.333, SMARTBUFF_CONST_SELF},
	  {SMARTBUFF_ARCANEFAMILIAR, 60, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_ARCANEPOWER, 0.25, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_PRESENCEOFMIND, 0.165, SMARTBUFF_CONST_SELF},
	  {SMARTBUFF_PRISBARRIER, 1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_BLAZBARRIER, 1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_REFRESHMENT, 0.03, SMARTBUFF_CONST_ITEM, nil, SMARTBUFF_CONJUREDMANA, nil, S.FoodMage},
--	  {SMARTBUFF_ARCANEINTELLECT, 60, SMARTBUFF_CONST_GROUP, {32}, "HPET;WPET;DKPET"}
    };
  end
  
  -- Warlock
  if (SMARTBUFF_PLAYERCLASS == "WARLOCK") then
    SMARTBUFF_BUFFLIST = {
      {SMARTBUFF_DARKINTENT, 60, SMARTBUFF_CONST_GROUP, nil, "WARRIOR;HUNTER;ROGUE"},
      {SMARTBUFF_SOULLINK, -1, SMARTBUFF_CONST_SELF, nil, S.CheckPetNeeded},
      {SMARTBUFF_UNENDINGBREATH, 10, SMARTBUFF_CONST_GROUP, {16}, "HPET;WPET;DKPET"},
      {SMARTBUFF_LIFETAP, 0.025, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_GOSACRIFICE, 60, SMARTBUFF_CONST_SELF, nil, S.CheckPetNeeded},
      {SMARTBUFF_BLOODHORROR, 1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_SOULSTONE, 15, SMARTBUFF_CONST_GROUP, {18}, "WARRIOR;DRUID;SHAMAN;HUNTER;ROGUE;MAGE;PRIEST;PALADIN;WARLOCK;DEATHKNIGHT;MONK;DEMONHUNTER;HPET;WPET;DKPET"},
      {SMARTBUFF_CREATEHS, 0.03, SMARTBUFF_CONST_ITEM, nil, SMARTBUFF_HEALTHSTONE}
    };
  end

  -- Hunter
  if (SMARTBUFF_PLAYERCLASS == "HUNTER") then
    SMARTBUFF_BUFFLIST = {
      {SMARTBUFF_RAPIDFIRE, 0.2, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_FOCUSFIRE, 0.25, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_TRAPLAUNCHER, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_VOLLEY, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_CAMOFLAUGE, 1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_AMMOI, 60, SMARTBUFF_CONST_SELF, nil, nil, S.LinkAmmo},
      {SMARTBUFF_AMMOP, 60, SMARTBUFF_CONST_SELF, nil, nil, S.LinkAmmo},
      {SMARTBUFF_AMMOF, 60, SMARTBUFF_CONST_SELF, nil, nil, S.LinkAmmo},
      {SMARTBUFF_LW1, -1, SMARTBUFF_CONST_SELF, nil, nil, S.LinkLoneWolf},
      {SMARTBUFF_LW2, -1, SMARTBUFF_CONST_SELF, nil, nil, S.LinkLoneWolf},
      {SMARTBUFF_LW3, -1, SMARTBUFF_CONST_SELF, nil, nil, S.LinkLoneWolf},
      {SMARTBUFF_LW4, -1, SMARTBUFF_CONST_SELF, nil, nil, S.LinkLoneWolf},
      {SMARTBUFF_LW5, -1, SMARTBUFF_CONST_SELF, nil, nil, S.LinkLoneWolf},
      {SMARTBUFF_LW6, -1, SMARTBUFF_CONST_SELF, nil, nil, S.LinkLoneWolf},
      {SMARTBUFF_LW7, -1, SMARTBUFF_CONST_SELF, nil, nil, S.LinkLoneWolf},
      {SMARTBUFF_LW8, -1, SMARTBUFF_CONST_SELF, nil, nil, S.LinkLoneWolf},
      {SMARTBUFF_AOTF, 0.1, SMARTBUFF_CONST_SELF, nil, nil, S.LinkAspects},
      {SMARTBUFF_AOTC, -1, SMARTBUFF_CONST_SELF, nil, nil, S.LinkAspects},
      {SMARTBUFF_AOTP, -1, SMARTBUFF_CONST_SELF, nil, nil, S.LinkAspects},
      {SMARTBUFF_AOTW, -1, SMARTBUFF_CONST_SELF, nil, nil, S.LinkAspects}
    };
  end

  -- Shaman
  if (SMARTBUFF_PLAYERCLASS == "SHAMAN") then
    SMARTBUFF_BUFFLIST = {
      {SMARTBUFF_LIGHTNINGSHIELD, 60, SMARTBUFF_CONST_SELF, nil, nil, nil, S.ChainShamanShield},
      {SMARTBUFF_WATERSHIELD, 60, SMARTBUFF_CONST_SELF, nil, nil, nil, S.ChainShamanShield},
      {SMARTBUFF_EARTHSHIELD, 10, SMARTBUFF_CONST_GROUP, {50,60,70,75,80}, "WARRIOR;DEATHKNIGHT;DRUID;SHAMAN;HUNTER;ROGUE;MAGE;PRIEST;PALADIN;WARLOCK;MONK;DEMONHUNTER;HPET;WPET;DKPET"},
      {SMARTBUFF_UNLEASHFLAME, 0.333, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_ASCENDANCE_ELE, 0.25, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_ASCENDANCE_ENH, 0.25, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_ASCENDANCE_RES, 0.25, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_EMASTERY, 0.5, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_WATERWALKING, 10, SMARTBUFF_CONST_GROUP, {28}}
    };
  end

  -- Warrior
  if (SMARTBUFF_PLAYERCLASS == "WARRIOR") then
    SMARTBUFF_BUFFLIST = {
      {SMARTBUFF_BATTLESHOUT, 60, SMARTBUFF_CONST_SELF, nil, nil, S.LinkAp, S.ChainWarriorShout},
      {SMARTBUFF_COMMANDINGSHOUT, 60, SMARTBUFF_CONST_SELF, nil, nil, S.LinkSta, S.ChainWarriorShout},
      {SMARTBUFF_BERSERKERRAGE, 0.165, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_SHIELDBLOCK, 0.1666, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_BATSTANCE, -1, SMARTBUFF_CONST_STANCE, nil, nil, nil, S.ChainWarriorStance},
      {SMARTBUFF_DEFSTANCE, -1, SMARTBUFF_CONST_SELF, nil, nil, nil, S.ChainWarriorStance},
      {SMARTBUFF_GLADSTANCE, -1, SMARTBUFF_CONST_STANCE, nil, nil, nil, S.ChainWarriorStance}
    };
  end
  
  -- Rogue
  if (SMARTBUFF_PLAYERCLASS == "ROGUE") then
    SMARTBUFF_BUFFLIST = {
      {SMARTBUFF_STEALTH, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_BLADEFLURRY, -1, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_SAD, 0.2, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_TRICKS, 0.5, SMARTBUFF_CONST_GROUP, {75}, "WARRIOR;DEATHKNIGHT;DRUID;SHAMAN;HUNTER;ROGUE;MAGE;PRIEST;PALADIN;WARLOCK;MONK;DEMONHUNTER;HPET;WPET;DKPET"},
      {SMARTBUFF_HUNGERFORBLOOD, 0.5, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_RECUPERATE, 0.5, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_EVASION, 0.2, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_DEADLYPOISON, 60, SMARTBUFF_CONST_SELF, nil, S.CheckFishingPole, nil, S.ChainRoguePoisonsLethal},
      {SMARTBUFF_WOUNDPOISON, 60, SMARTBUFF_CONST_SELF, nil, S.CheckFishingPole, nil, S.ChainRoguePoisonsLethal},
      {SMARTBUFF_AGONIZINGPOISON, 60, SMARTBUFF_CONST_SELF, nil, S.CheckFishingPole, nil, S.ChainRoguePoisonsLethal},
      {SMARTBUFF_LEECHINGPOISON, 60, SMARTBUFF_CONST_SELF, nil, S.CheckFishingPole, nil, S.ChainRoguePoisonsNonLethal},
      {SMARTBUFF_CRIPPLINGPOISON, 60, SMARTBUFF_CONST_SELF, nil, S.CheckFishingPole, nil, S.ChainRoguePoisonsNonLethal}
    };
  end

  -- Paladin
  if (SMARTBUFF_PLAYERCLASS == "PALADIN") then
    SMARTBUFF_BUFFLIST = {
      {SMARTBUFF_RIGHTEOUSFURY, 30, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_HOLYSHIELD, 0.166, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_AVENGINGWARTH, 0.333, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_BOK, 60, SMARTBUFF_CONST_GROUP, {20}, nil, S.LinkStats},
      {SMARTBUFF_BOM, 60, SMARTBUFF_CONST_GROUP, {20}, nil, S.LinkMa},
      {SMARTBUFF_BOW, 60, SMARTBUFF_CONST_GROUP, {20}, nil, S.LinkInt},     
      {SMARTBUFF_HOF, 0.1, SMARTBUFF_CONST_GROUP, {52}, "WARRIOR;DEATHKNIGHT;DRUID;SHAMAN;HUNTER;ROGUE;MAGE;PRIEST;PALADIN;WARLOCK;MONK;DEMONHUNTER;HPET;WPET;DKPET"},
      {SMARTBUFF_HOSAL, 0.1, SMARTBUFF_CONST_GROUP, {66}, "WARRIOR;DEATHKNIGHT;DRUID;SHAMAN;HUNTER;ROGUE;MAGE;PRIEST;PALADIN;WARLOCK;MONK;DEMONHUNTER;HPET;WPET;DKPET"},
      {SMARTBUFF_BEACONOFLIGHT, 5, SMARTBUFF_CONST_GROUP, {39}, "WARRIOR;DRUID;SHAMAN;HUNTER;ROGUE;MAGE;PRIEST;PALADIN;WARLOCK;DEATHKNIGHT;MONK;DEMONHUNTER;HPET;WPET;DKPET"},
      {SMARTBUFF_BEACONOFAITH, 5, SMARTBUFF_CONST_GROUP, {39}, "WARRIOR;DRUID;SHAMAN;HUNTER;ROGUE;MAGE;PRIEST;PALADIN;WARLOCK;DEATHKNIGHT;MONK;DEMONHUNTER;HPET;WPET;DKPET"},
      {SMARTBUFF_SOTRUTH, -1, SMARTBUFF_CONST_STANCE, nil, nil, nil, S.ChainPaladinSeal},
      {SMARTBUFF_SORIGHTEOUSNESS, -1, SMARTBUFF_CONST_STANCE, nil, nil, nil, S.ChainPaladinSeal},
      {SMARTBUFF_SOJUSTICE, -1, SMARTBUFF_CONST_STANCE, nil, nil, nil, S.ChainPaladinSeal},
      {SMARTBUFF_SOINSIGHT, -1, SMARTBUFF_CONST_STANCE, nil, nil, nil, S.ChainPaladinSeal},
      {SMARTBUFF_SOCOMMAND, -1, SMARTBUFF_CONST_STANCE, nil, nil, nil, S.ChainPaladinSeal}
    };
  end
  
  -- Deathknight
  if (SMARTBUFF_PLAYERCLASS == "DEATHKNIGHT") then
    SMARTBUFF_BUFFLIST = {
      {SMARTBUFF_DANCINGRW, 0.2, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_BLOODPRESENCE, -1, SMARTBUFF_CONST_STANCE, nil, nil, nil, S.ChainDKPresence},
      {SMARTBUFF_FROSTPRESENCE, -1, SMARTBUFF_CONST_STANCE, nil, nil, nil, S.ChainDKPresence},
      {SMARTBUFF_UNHOLYPRESENCE, -1, SMARTBUFF_CONST_STANCE, nil, nil, nil, S.ChainDKPresence},
      {SMARTBUFF_HORNOFWINTER, 60, SMARTBUFF_CONST_SELF, nil, nil, S.LinkAp},
      {SMARTBUFF_BONESHIELD, 5, SMARTBUFF_CONST_SELF},
      {SMARTBUFF_RAISEDEAD, 1, SMARTBUFF_CONST_SELF, nil, S.CheckPet},
      {SMARTBUFF_PATHOFFROST, -1, SMARTBUFF_CONST_SELF}
    };
  end
  
  -- Monk
  if (SMARTBUFF_PLAYERCLASS == "MONK") then
    SMARTBUFF_BUFFLIST = {
      {SMARTBUFF_LOTWT, 60, SMARTBUFF_CONST_GROUP, {81}},
      {SMARTBUFF_LOTE, 60, SMARTBUFF_CONST_GROUP, {22}, nil, S.LinkStats},
      {SMARTBUFF_SOTFIERCETIGER, -1, SMARTBUFF_CONST_STANCE, nil, nil, nil, S.ChainMonkStance},
      {SMARTBUFF_SOTSTURDYOX, -1, SMARTBUFF_CONST_STANCE, nil, nil, nil, S.ChainMonkStance},
      {SMARTBUFF_SOTWISESERPENT, -1, SMARTBUFF_CONST_STANCE, nil, nil, nil, S.ChainMonkStance},
      {SMARTBUFF_SOTSPIRITEDCRANE, -1, SMARTBUFF_CONST_STANCE, nil, nil, nil, S.ChainMonkStance},
      {SMARTBUFF_BLACKOX, 15, SMARTBUFF_CONST_SELF, nil, nil, nil, S.ChainMonkStatue},
      {SMARTBUFF_SMARTBUFF_JADESERPENT, 15, SMARTBUFF_CONST_SELF, nil, nil, nil, S.ChainMonkStatue}
    };
  end

  -- Demon Hunter
  if (SMARTBUFF_PLAYERCLASS == "DEMONHUNTER") then
    SMARTBUFF_BUFFLIST = {
    };
  end

  -- Stones and oils
  SMARTBUFF_WEAPON = {
    {SMARTBUFF_SSROUGH, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_SSCOARSE, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_SSHEAVY, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_SSSOLID, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_SSDENSE, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_SSELEMENTAL, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_SSFEL, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_SSADAMANTITE, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_WSROUGH, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_WSCOARSE, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_WSHEAVY, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_WSSOLID, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_WSDENSE, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_WSFEL, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_WSADAMANTITE, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_SHADOWOIL, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_FROSTOIL, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_MANAOIL4, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_MANAOIL3, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_MANAOIL2, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_MANAOIL1, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_WIZARDOIL5, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_WIZARDOIL4, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_WIZARDOIL3, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_WIZARDOIL2, 60, SMARTBUFF_CONST_INV},
    {SMARTBUFF_WIZARDOIL1, 60, SMARTBUFF_CONST_INV}
  };

  -- Tracking
  SMARTBUFF_TRACKING = {
    {SMARTBUFF_FINDMINERALS, -1, SMARTBUFF_CONST_TRACK},
    {SMARTBUFF_FINDHERBS, -1, SMARTBUFF_CONST_TRACK},
    {SMARTBUFF_FINDTREASURE, -1, SMARTBUFF_CONST_TRACK},
    {SMARTBUFF_TRACKHUMANOIDS, -1, SMARTBUFF_CONST_TRACK},
    {SMARTBUFF_TRACKBEASTS, -1, SMARTBUFF_CONST_TRACK},
    {SMARTBUFF_TRACKUNDEAD, -1, SMARTBUFF_CONST_TRACK},
    {SMARTBUFF_TRACKHIDDEN, -1, SMARTBUFF_CONST_TRACK},
    {SMARTBUFF_TRACKELEMENTALS, -1, SMARTBUFF_CONST_TRACK},
    {SMARTBUFF_TRACKDEMONS, -1, SMARTBUFF_CONST_TRACK},
    {SMARTBUFF_TRACKGIANTS, -1, SMARTBUFF_CONST_TRACK},
    {SMARTBUFF_TRACKDRAGONKIN, -1, SMARTBUFF_CONST_TRACK}
  };

  -- Racial
  SMARTBUFF_RACIAL = {
    {SMARTBUFF_STONEFORM, 0.133, SMARTBUFF_CONST_SELF},  -- Dwarv
    --{SMARTBUFF_PRECEPTION, 0.333, SMARTBUFF_CONST_SELF}, -- Human
    {SMARTBUFF_BLOODFURY, 0.416, SMARTBUFF_CONST_SELF},  -- Orc
    {SMARTBUFF_BERSERKING, 0.166, SMARTBUFF_CONST_SELF}, -- Troll
    {SMARTBUFF_WOTFORSAKEN, 0.083, SMARTBUFF_CONST_SELF}, -- Undead
    {SMARTBUFF_WarStomp, 0.033, SMARTBUFF_CONST_SELF} -- Tauer
  };

  -- FOOD
    SMARTBUFF_FOOD = {
    {SMARTBUFF_MONDAZI, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_KULTIRAMISU, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_GRILLEDCATFISH, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_LOALOAF, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_HONEYHAUNCHES, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_RAVENBERRYTARTS, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_SWAMPFISHNCHIPS, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_SEASONEDLOINS, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_SAILORSPIE, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_SPICEDSNAPPER, 60, SMARTBUFF_CONST_FOOD},
--    {SMARTBUFF_HEARTSBANEHEXWURST, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_SALTPEPPERSHANK, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_PICKLEDSTORMRAY, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_DROGBARSTYLESALMON, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_BARRACUDAMRGLGAGH, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_FIGHTERCHOW, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_FARONAARFIZZ, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_BEARTARTARE, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_LEGIONCHILI, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_DEEPFRIEDMOSSGILL, 60, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_SPICYCRAWDAD, 30, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_MOKNATHALSHORTRIBS, 30, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_CRUNCHYSERPENT, 30, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_GOLDENFISHSTICKS, 30, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_SPICYHOTTALBUK, 30, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_SKULLFISHSOUP, 30, SMARTBUFF_CONST_FOOD},    
    {SMARTBUFF_TALBUKSTEAK, 30, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_WARPBURGER, 30, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_ROASTEDCLEFTHOOF, 30, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_POACHEDBLUEFISH, 30, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_GRILLEDMUDFISH, 30, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_BLACKENEDBASILISK, 30, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_BLACKENEDSPOREFISH, 30, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_BROILEDBLOODFIN, 30, SMARTBUFF_CONST_FOOD},    
    {SMARTBUFF_CLAMBAR, 30, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_FELTAILDELIGHT, 30, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_RAVAGERDOG, 30, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_BUZZARDBITES, 30, SMARTBUFF_CONST_FOOD},
    {SMARTBUFF_SAGEFISHDELIGHT, 15, SMARTBUFF_CONST_FOOD}
  };
  
  for n, name in pairs(S.FoodItems) do
    if (name) then
      --print("Adding: "..n..". "..name);
      tinsert(SMARTBUFF_FOOD, 1, {name, 60, SMARTBUFF_CONST_FOOD});
    end
  end
  
  --[[
  for _, v in pairs(SMARTBUFF_FOOD) do
    if (v and v[1]) then
      print("List: "..v[1]);
    end
  end
  ]]--
  

  -- Scrolls
  SMARTBUFF_SCROLL = {
    {SMARTBUFF_MiscItem17, 60, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_BMiscItem17, S.LinkFlaskLeg},
    {SMARTBUFF_MiscItem16, 60, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_BMiscItem16},
    {SMARTBUFF_MiscItem15, 60, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_BMiscItem14, S.LinkAugment},
    {SMARTBUFF_MiscItem14, 60, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_BMiscItem14, S.LinkAugment},
    {SMARTBUFF_MiscItem13, 10, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_BMiscItem13},
    {SMARTBUFF_MiscItem12, 60, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_BMiscItem12},
    {SMARTBUFF_MiscItem11, 60, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_BMiscItem11, S.LinkFlaskWoD},
    {SMARTBUFF_MiscItem10, -1, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_BMiscItem10, S.LinkSafariHat},
    {SMARTBUFF_MiscItem9, -1, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_BMiscItem9, S.LinkSafariHat},
    {SMARTBUFF_MiscItem1, 60, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_BMiscItem1},
    {SMARTBUFF_MiscItem2, -1, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_BMiscItem2},
    {SMARTBUFF_MiscItem3, 10, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_BMiscItem3},
    {SMARTBUFF_MiscItem4, 60, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_BMiscItem4, S.LinkFlaskMoP},
    {SMARTBUFF_MiscItem5, 10, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_BMiscItem5},
    {SMARTBUFF_MiscItem6, 60, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_BMiscItem6},
    {SMARTBUFF_MiscItem7, 60, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_BMiscItem7},
    {SMARTBUFF_MiscItem8, 5, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_BMiscItem8},
    {SMARTBUFF_SOAGILITY9, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBAGILITY},
    {SMARTBUFF_SOAGILITY8, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBAGILITY},
    {SMARTBUFF_SOAGILITY7, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBAGILITY},
    {SMARTBUFF_SOAGILITY6, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBAGILITY},
    {SMARTBUFF_SOAGILITY5, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBAGILITY},
    {SMARTBUFF_SOAGILITY4, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBAGILITY},
    {SMARTBUFF_SOAGILITY3, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBAGILITY},
    {SMARTBUFF_SOAGILITY2, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBAGILITY},
    {SMARTBUFF_SOAGILITY1, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBAGILITY},
    {SMARTBUFF_SOINTELLECT9, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBINTELLECT},
    {SMARTBUFF_SOINTELLECT8, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBINTELLECT},
    {SMARTBUFF_SOINTELLECT7, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBINTELLECT},
    {SMARTBUFF_SOINTELLECT6, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBINTELLECT},
    {SMARTBUFF_SOINTELLECT5, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBINTELLECT},
    {SMARTBUFF_SOINTELLECT4, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBINTELLECT},
    {SMARTBUFF_SOINTELLECT3, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBINTELLECT},
    {SMARTBUFF_SOINTELLECT2, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBINTELLECT},
    {SMARTBUFF_SOINTELLECT1, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBINTELLECT},
    {SMARTBUFF_SOSTAMINA9, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSTAMINA},
    {SMARTBUFF_SOSTAMINA8, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSTAMINA},
    {SMARTBUFF_SOSTAMINA7, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSTAMINA},
    {SMARTBUFF_SOSTAMINA6, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSTAMINA},
    {SMARTBUFF_SOSTAMINA5, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSTAMINA},
    {SMARTBUFF_SOSTAMINA4, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSTAMINA},
    {SMARTBUFF_SOSTAMINA3, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSTAMINA},
    {SMARTBUFF_SOSTAMINA2, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSTAMINA},
    {SMARTBUFF_SOSTAMINA1, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSTAMINA},
    {SMARTBUFF_SOSPIRIT9, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSPIRIT},
    {SMARTBUFF_SOSPIRIT8, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSPIRIT},
    {SMARTBUFF_SOSPIRIT7, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSPIRIT},
    {SMARTBUFF_SOSPIRIT6, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSPIRIT},
    {SMARTBUFF_SOSPIRIT5, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSPIRIT},
    {SMARTBUFF_SOSPIRIT4, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSPIRIT},
    {SMARTBUFF_SOSPIRIT3, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSPIRIT},
    {SMARTBUFF_SOSPIRIT2, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSPIRIT},
    {SMARTBUFF_SOSPIRIT1, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSPIRIT},
    {SMARTBUFF_SOSTRENGHT9, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSTRENGHT},
    {SMARTBUFF_SOSTRENGHT8, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSTRENGHT},
    {SMARTBUFF_SOSTRENGHT7, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSTRENGHT},
    {SMARTBUFF_SOSTRENGHT6, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSTRENGHT},
    {SMARTBUFF_SOSTRENGHT5, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSTRENGHT},
    {SMARTBUFF_SOSTRENGHT4, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSTRENGHT},
    {SMARTBUFF_SOSTRENGHT3, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSTRENGHT},
    {SMARTBUFF_SOSTRENGHT2, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSTRENGHT},
    {SMARTBUFF_SOSTRENGHT1, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBSTRENGHT},
    {SMARTBUFF_SOPROTECTION9, 30, SMARTBUFF_CONST_SCROLL, nil, SMARTBUFF_SBPROTECTION}
  };
  
  --      ItemId, SpellId, Duration [min]
  AddItem(102463, 148429,  10); -- Fire-Watcher's Oath
  AddItem(116115, 170869,  60); -- Blazing Wings
  AddItem( 43499,  58501,  10); -- Iron Boot Flask
  AddItem( 54653,  75532,  30); -- Darkspear Pride
  AddItem( 54651,  75531,  30); -- Gnomeregan Pride
  AddItem(128807, 192225,  60); -- Coin of Many Faces
  AddItem( 68806,  96312,  30); -- Kalytha's Haunted Locket
  AddItem(153023, 224001,  60); -- Lightforged Augment Rune
  AddItem(129149, 193333,  60); -- Helheim Spirit Memory
  AddItem(122304, 138927,  10); -- Fandral's Seed Pouch
  
  -- Potions
  SMARTBUFF_POTION = {
    {SMARTBUFF_FLASKLEG1, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BFLASKLEG1, S.LinkFlaskLeg},
	{SMARTBUFF_FLASKLEG2, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BFLASKLEG2},
	{SMARTBUFF_FLASKLEG3, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BFLASKLEG3},
    {SMARTBUFF_FLASKLEG4, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BFLASKLEG4},
    {SMARTBUFF_FLASKWOD1, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BFLASKWOD1, S.LinkFlaskWoD},
    {SMARTBUFF_FLASKWOD2, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BFLASKWOD2},
    {SMARTBUFF_FLASKWOD3, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BFLASKWOD3},
    {SMARTBUFF_FLASKWOD4, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BFLASKWOD4},
    {SMARTBUFF_GRFLASKWOD1, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BGRFLASKWOD1},
    {SMARTBUFF_GRFLASKWOD2, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BGRFLASKWOD2},
    {SMARTBUFF_GRFLASKWOD3, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BGRFLASKWOD3},
    {SMARTBUFF_GRFLASKWOD4, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BGRFLASKWOD4},
    {SMARTBUFF_FLASKMOP1, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BFLASKMOP1, S.LinkFlaskMoP},
    {SMARTBUFF_FLASKMOP2, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BFLASKMOP2},
    {SMARTBUFF_FLASKMOP3, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BFLASKMOP3},
    {SMARTBUFF_FLASKMOP4, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BFLASKMOP4},
    {SMARTBUFF_FLASKMOP5, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BFLASKMOP5},
    {SMARTBUFF_FLASKMOP6, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BFLASKMOP6},
    {SMARTBUFF_ELIXIRMOP1, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIRMOP1},
    {SMARTBUFF_ELIXIRMOP2, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIRMOP2},
    {SMARTBUFF_ELIXIRMOP3, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIRMOP3},
    {SMARTBUFF_ELIXIRMOP4, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIRMOP4},
    {SMARTBUFF_ELIXIRMOP5, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIRMOP5},
    {SMARTBUFF_ELIXIRMOP6, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIRMOP6},
    {SMARTBUFF_ELIXIRMOP7, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIRMOP7},
    {SMARTBUFF_ELIXIRMOP8, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIRMOP8},
    {SMARTBUFF_FLASKCT1, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BFLASKCT1},
    {SMARTBUFF_FLASKCT2, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BFLASKCT2},
    {SMARTBUFF_FLASKCT3, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BFLASKCT3},
    {SMARTBUFF_FLASKCT4, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BFLASKCT4},
    {SMARTBUFF_FLASKCT5, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BFLASKCT5},
    {SMARTBUFF_FLASKCT7, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BFLASKCT7, S.LinkFlaskCT7},
    {SMARTBUFF_ELIXIRCT1, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIRCT1},
    {SMARTBUFF_ELIXIRCT2, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIRCT2},
    {SMARTBUFF_ELIXIRCT3, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIRCT3},
    {SMARTBUFF_ELIXIRCT4, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIRCT4},
    {SMARTBUFF_ELIXIRCT5, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIRCT5},
    {SMARTBUFF_ELIXIRCT6, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIRCT6},
    {SMARTBUFF_ELIXIRCT7, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIRCT7},
    {SMARTBUFF_ELIXIRCT8, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIRCT8},
    {SMARTBUFF_FLASK1, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BFLASK1},
    {SMARTBUFF_FLASK2, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BFLASK2},
    {SMARTBUFF_FLASK3, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BFLASK3},
    {SMARTBUFF_FLASK4, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BFLASK4},
    {SMARTBUFF_ELIXIR1,  60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIR1},
    {SMARTBUFF_ELIXIR2,  60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIR2},
    {SMARTBUFF_ELIXIR3,  60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIR3},
    {SMARTBUFF_ELIXIR4,  60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIR4},
    {SMARTBUFF_ELIXIR5,  60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIR5},
    {SMARTBUFF_ELIXIR6,  60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIR6},
    {SMARTBUFF_ELIXIR7,  60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIR7},
    {SMARTBUFF_ELIXIR8,  60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIR8},
    {SMARTBUFF_ELIXIR9,  60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIR9},
    {SMARTBUFF_ELIXIR10, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIR10},
    {SMARTBUFF_ELIXIR11, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIR11},
    {SMARTBUFF_ELIXIR12, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIR12},
    {SMARTBUFF_ELIXIR13, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIR13},
    {SMARTBUFF_ELIXIR14, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIR14},
    {SMARTBUFF_ELIXIR15, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIR15},
    {SMARTBUFF_ELIXIR16, 60, SMARTBUFF_CONST_POTION, nil, SMARTBUFF_BELIXIR16}
  }
  
  SMARTBUFF_AddMsgD("Spell list initialized");
end
