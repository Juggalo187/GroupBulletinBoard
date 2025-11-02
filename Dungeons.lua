local _, GBB = GroupBulletinBoard_Loader.Main()

local function getSeasonalDungeons()
  local events = {}

  for eventName, eventData in pairs( GBB.Seasonal ) do
    table.insert( events, eventName )
    if GBB.Tool.InDateRange( eventData.startDate, eventData.endDate ) then
      GBB.SeasonalActiveEvents[ eventName ] = true
    end
  end
  return events
end

function GBB.GetDungeonNames()
  local DefaultEnGB = {
    [ "RFC" ] = "Ragefire Chasm",
    [ "DM" ] = "The Deadmines",
    [ "WC" ] = "Wailing Caverns",
    [ "SFK" ] = "Shadowfang Keep",
    [ "STOCKS" ] = "The Stockade",
    [ "BFD" ] = "Blackfathom Deeps",
    [ "GNOMER" ] = "Gnomeregan",
    [ "RFK" ] = "Razorfen Kraul",
    [ "SM2" ] = "Scarlet Monastery",
    [ "GY" ] = "Scarlet Monastery: Graveyard",
    [ "LIB" ] = "Scarlet Monastery: Library",
    [ "ARMS" ] = "Scarlet Monastery: Armory",
    [ "CATH" ] = "Scarlet Monastery: Cathedral",
    [ "RFD" ] = "Razorfen Downs",
    [ "ULDA" ] = "Uldaman",
    [ "ZF" ] = "Zul'Farrak",
    [ "MARA" ] = "Maraudon",
    [ "ST" ] = "The Sunken Temple",
    [ "BRD" ] = "Blackrock Depths",
    [ "DM2" ] = "Dire Maul",
    [ "DME" ] = "Dire Maul: East",
    [ "DMN" ] = "Dire Maul: North",
    [ "DMW" ] = "Dire Maul: West",
    [ "STRAT" ] = "Stratholme",
    [ "SCHOLO" ] = "Scholomance",
    [ "LBRS" ] = "Lower Blackrock Spire",
    [ "UBRS" ] = "Upper Blackrock Spire (10)",
    [ "RAMPS" ] = "Hellfire Citadel: Ramparts",
    [ "BF" ] = "Hellfire Citadel: Blood Furnace",
    [ "SP" ] = "Coilfang Reservoir: Slave Pens",
    [ "UB" ] = "Coilfang Reservoir: Underbog",
    [ "MT" ] = "Auchindoun: Mana Tombs",
    [ "AC" ] = "Auchindoun: Auchenai Crypts",
    [ "SH" ] = "Auchindoun: Sethekk Halls",
    [ "OHF" ] = "Caverns of Time: Old Hillsbrad",
    [ "MECHA" ] = "Tempest Keep: The Mechanar",
    [ "BM" ] = "Caverns of Time: Black Morass",
    [ "MGT" ] = "Magisters' Terrace",
    [ "SHH" ] = "Hellfire Citadel: Shattered Halls",
    [ "BOTA" ] = "Tempest Keep: Botanica",
    [ "SL" ] = "Auchindoun: Shadow Labyrinth",
    [ "SV" ] = "Coilfang Reservoir: Steamvault",
    [ "ARCA" ] = "Tempest Keep: The Arcatraz",
    [ "KARA" ] = "Karazhan",
    [ "GRUULS" ] = "Gruul's Lair",
    [ "MAGS" ] = "Hellfire Citadel: Magtheridon's Lair",
    [ "SSC" ] = "Coilfang Reservoir: Serpentshrine Cavern",
    [ "EYE" ] = "Tempest Keep: The Eye",
    [ "ZA" ] = "Zul-Aman",
    [ "HYJAL" ] = "The Battle For Mount Hyjal",
    [ "BT" ] = "Black Temple",
    [ "SWP" ] = "Sunwell Plateau",
    [ "ONY" ] = "Onyxia's Lair (25)",
    [ "MC" ] = "Molten Core (25)",
    [ "ZG" ] = "Zul'Gurub (20)",
    [ "AQ20" ] = "Ruins of Ahn'Qiraj (20)",
    [ "BWL" ] = "Blackwing Lair (25)",
    [ "AQ40" ] = "Temple of Ahn'Qiraj (25)",
    [ "NAXX" ] = "Naxxramas (25)",
    [ "WSG" ] = "Warsong Gulch (PvP)",
    [ "AB" ] = "Arathi Basin (PvP)",
    [ "AV" ] = "Alterac Valley (PvP)",
    [ "EOTS" ] = "Eye of the Storm (PvP)",
    [ "ARENA" ] = "Arena (PvP)",
    [ "MISC" ] = "Miscellaneous",
    [ "TRADE" ] = "Trade",
    [ "DEBUG" ] = "DEBUG INFO",
    [ "BAD" ] = "DEBUG BAD WORDS - REJECTED",
    [ "BREW" ] = "Brewfest - Coren Direbrew",
    [ "HOLLOW" ] = "Hallow's End - Headless Horseman",
	[ "LOVE" ] = "Love is in the Air",
	[ "NOBLEGARDEN" ] = "Noblegarden",
	[ "MIDSUMMER" ] = "Midsummer Fire Festival",
	[ "HARVEST" ] = "Harvest Festival",
	[ "WINTERVEIL" ] = "Feast of Winter Veil",
	[ "UK"] = "Utgarde Keep",
	[ "UP"] = "Utgarde Pinnacle", 
	[ "NEX"] = "The Nexus",
	[ "AN"] = "Azjol-Nerub",
	[ "AK"] = "Ahn'kahet: The Old Kingdom",
	[ "DTK"] = "Drak'Tharon Keep",
	[ "VH"] = "The Violet Hold",
	[ "GUN"] = "Gundrak",
	[ "HOL"] = "Halls of Stone",
	[ "HOS"] = "Halls of Lightning",
	[ "COS"] = "The Culling of Stratholme",
	[ "OCC"] = "The Oculus",
	[ "FOS"] = "The Forge of Souls",
	[ "POS"] = "Pit of Saron",
	[ "HOR"] = "Halls of Reflection",
	[ "EOE"] = "The Eye of Eternity (25)",
	[ "OS"] = "The Obsidian Sanctum (25)", 
	[ "VOA"] = "Vault of Archavon (25)",
	[ "ULDUAR"] = "Ulduar (25)",
	[ "TOC"] = "Trial of the Crusader (25)",
	[ "TOGC"] = "Trial of the Grand Crusader (25)",
	[ "ICC"] = "Icecrown Citadel (25)",
	[ "RS"] = "The Ruby Sanctum (25)",
    }

  local dungeonNamesLocales = {
    deDE = {
      [ "RFC" ] = "Flammenschlund",
      [ "DM" ] = "Die Todesminen",
      [ "WC" ] = "Die Höhlen des Wehklagens",
      [ "SFK" ] = "Burg Schattenfang",
      [ "STOCKS" ] = "Das Verlies",
      [ "BFD" ] = "Die Tiefschwarze Grotte",
      [ "GNOMER" ] = "Gnomeregan",
      [ "RFK" ] = "Kral der Klingenhauer",
      [ "SM2" ] = "Scharlachrotes Kloster",
      [ "GY" ] = "Scharlachrotes Kloster: Friedhof",
      [ "LIB" ] = "Scharlachrotes Kloster: Bibliothek",
      [ "ARMS" ] = "Scharlachrotes Kloster: Waffenkammer",
      [ "CATH" ] = "Scharlachrotes Kloster: Kathedrale",
      [ "RFD" ] = "Hügel der Klingenhauer",
      [ "ULDA" ] = "Uldaman",
      [ "ZF" ] = "Zul'Farrak",
      [ "MARA" ] = "Maraudon",
      [ "ST" ] = "Der Tempel von Atal'Hakkar",
      [ "BRD" ] = "Die Schwarzfels-Tiefen",
      [ "DM2" ] = "Düsterbruch",
      [ "DME" ] = "Düsterbruch: Ost",
      [ "DMN" ] = "Düsterbruch: Nord",
      [ "DMW" ] = "Düsterbruch: West",
      [ "STRAT" ] = "Stratholme",
      [ "SCHOLO" ] = "Scholomance",
      [ "LBRS" ] = "Die Untere Schwarzfelsspitze",
      [ "UBRS" ] = "Obere Schwarzfelsspitze (10)",
      [ "RAMPS" ] = "Höllenfeuerzitadelle: Höllenfeuerbollwerk",
      [ "BF" ] = "Höllenfeuerzitadelle: Der Blutkessel",
      [ "SP" ] = "Echsenkessel: Die Sklavenunterkünfte",
      [ "UB" ] = "Echsenkessel: Der Tiefensumpf",
      [ "MT" ] = "Auchindoun: Die Managruft",
      [ "AC" ] = "Auchindoun: Die Auchenaikrypta",
      [ "SH" ] = "Auchindoun: Sethekkhallen",
      [ "OHF" ] = "Höhlen der Zeit: Flucht von Durnholde",
      [ "MECHA" ] = "Festung der Stürme: Die Mechanar",
      [ "BM" ] = "Höhlen der Zeit: Der Schwarze Morast",
      [ "MGT" ] = "Die Terrasse der Magister",
      [ "SHH" ] = "Höllenfeuerzitadelle: Die Zerschmetterten Hallen",
      [ "BOTA" ] = "Festung der Stürme: Botanica",
      [ "SL" ] = "Auchindoun: Schattenlabyrinth",
      [ "SV" ] = "Echsenkessel: Die Dampfkammer",
      [ "ARCA" ] = "Festung der Stürme: Die Arcatraz",
      [ "KARA" ] = "Karazhan",
      [ "GRUULS" ] = "Gruuls Unterschlupf",
      [ "MAGS" ] = "Höllenfeuerzitadelle: Magtheridons Kammer",
      [ "SSC" ] = "Echsenkessel: Höhle des Schlangenschreins",
      [ "EYE" ] = "Das Auge des Sturms",
      [ "ZA" ] = "Zul-Aman",
      [ "HYJAL" ] = "Schlacht um den Berg Hyjal",
      [ "BT" ] = "Der Schwarze Tempel",
      [ "SWP" ] = "Sonnenbrunnenplateau",
      [ "ONY" ] = "Onyxias Hort (25)",
      [ "MC" ] = "Geschmolzener Kern (25)",
      [ "ZG" ] = "Zul'Gurub (20)",
      [ "AQ20" ] = "Ruinen von Ahn'Qiraj (20)",
      [ "BWL" ] = "Pechschwingenhort (25)",
      [ "AQ40" ] = "Tempel von Ahn'Qiraj (25)",
      [ "NAXX" ] = "Naxxramas (25)",
      [ "WSG" ] = "Warsongschlucht (PVP)",
      [ "AV" ] = "Alteractal (PVP)",
      [ "AB" ] = "Arathibecken (PVP)",
      [ "EOTS" ] = "Auge des Sturms (PvP)",
      [ "ARENA" ] = "Arena (PvP)",
      [ "MISC" ] = "Verschiedenes",
      [ "TRADE" ] = "Handel",
	  [ "DEBUG" ] = "DEBUG-INFO",
	  [ "BAD" ] = "DEBUG UNERWÜNSCHTE WÖRTER - ABGELEHNT",
	  [ "BREW" ] = "Braufest - Coren Düsterbräu",
	  [ "HOLLOW" ] = "Schlotternacht - Der kopflose Reiter",
	  [ "LOVE" ] = "Liebe liegt in der Luft",
	  [ "NOBLEGARDEN" ] = "Garten des Adels",
	  [ "MIDSUMMER" ] = "Sonnenwendfest",
	  [ "HARVEST" ] = "Erntedankfest",
	  [ "WINTERVEIL" ] = "Winterhauchfest",
	  [ "UK"] = "Feste Utgarde",
	  [ "UP"] = "Turm Utgarde",
	  [ "NEX"] = "Der Nexus",
	  [ "AN"] = "Azjol-Nerub",
	  [ "AK"] = "Ahn'kahet: Das Alte Königreich",
	  [ "DTK"] = "Drak'Tharon Keep",
	  [ "VH"] = "Die Violette Festung",
	  [ "GUN"] = "Gundrak",
	  [ "HOL"] = "Die Hallen des Steins",
	  [ "HOS"] = "Die Hallen des Blitzes",
	  [ "COS"] = "Das Ausmerzen von Stratholme",
	  [ "OCC"] = "Das Oculus",
	  [ "FOS"] = "Die Seelenschmiede",
	  [ "POS"] = "Grube von Saron",
	  [ "HOR"] = "Hallen der Reflexion",
	  [ "EOE"] = "Das Auge der Ewigkeit (25)",
	  [ "OS"] = "Das Obsidiansanktum (25)",
	  [ "VOA"] = "Gewölbe des Archavon (25)",
	  [ "ULDUAR"] = "Ulduar (25)",
	  [ "TOC"] = "Prüfung des Kreuzfahrers (25)",
	  [ "TOGC"] = "Prüfung des Obersten Kreuzfahrers (25)",
	  [ "ICC"] = "Eiskronenzitadelle (25)",
	  [ "RS"] = "Das Rubinsanktum (25)",
    },
    frFR = {
      [ "RFC" ] = "Gouffre de Ragefeu",
      [ "DM" ] = "Les Mortemines",
      [ "WC" ] = "Cavernes des lamentations",
      [ "SFK" ] = "Donjon d'Ombrecroc",
      [ "STOCKS" ] = "La Prison",
      [ "BFD" ] = "Profondeurs de Brassenoire",
      [ "GNOMER" ] = "Gnomeregan",
      [ "RFK" ] = "Kraal de Tranchebauge",
      [ "SM2" ] = "Monastère écarlate",
      [ "GY" ] = "Monastère écarlate: Cimetière",
      [ "LIB" ] = "Monastère écarlate: Bibliothèque",
      [ "ARMS" ] = "Monastère écarlate: Armurerie",
      [ "CATH" ] = "Monastère écarlate: Cathédrale",
      [ "RFD" ] = "Souilles de Tranchebauge",
      [ "ULDA" ] = "Uldaman",
      [ "ZF" ] = "Zul'Farrak",
      [ "MARA" ] = "Maraudon",
      [ "ST" ] = "Le temple d'Atal'Hakkar",
      [ "BRD" ] = "Profondeurs de Blackrock",
      [ "DM2" ] = "Hache-tripes",
      [ "DME" ] = "Hache-tripes: Est",
      [ "DMN" ] = "Hache-tripes: Nord",
      [ "DMW" ] = "Hache-tripes: Ouest",
      [ "STRAT" ] = "Stratholme",
      [ "SCHOLO" ] = "Scholomance",
      [ "LBRS" ] = "Pic Blackrock",
      [ "UBRS" ] = "Pic Blackrock (10)",
      [ "RAMPS" ] = "Citadelle des Flammes Infernales: Remparts des Flammes infernales",
      [ "BF" ] = "Citadelle des Flammes Infernales: La Fournaise du sang",
      [ "SP" ] = "Réservoir de Glissecroc : Les enclos aux esclaves",
      [ "UB" ] = "Réservoir de Glissecroc : La Basse-tourbière",
      [ "MT" ] = "Auchindoun: Tombes-mana",
      [ "AC" ] = "Auchindoun: Cryptes Auchenaï",
      [ "SH" ] = "Auchindoun: Les salles des Sethekk",
      [ "OHF" ] = "Grottes du Temps: Contreforts de Hautebrande d'antan",
      [ "MECHA" ] = "Donjon de la Tempête: Le Méchanar",
      [ "BM" ] = "Grottes du Temps: Le Noir Marécage",
      [ "MGT" ] = "Terrasse des Magistères",
      [ "SHH" ] = "Citadelle des Flammes Infernales: Les Salles brisées",
      [ "BOTA" ] = "Donjon de la Tempête: Botanica",
      [ "SL" ] = "Auchindoun: Labyrinthe des ombres",
      [ "SV" ] = "Réservoir de Glissecroc : Le Caveau de la vapeur",
      [ "ARCA" ] = "Donjon de la Tempête: L'Arcatraz",
      [ "KARA" ] = "Karazhan",
      [ "GRUULS" ] = "Repaire de Gruul",
      [ "MAGS" ] = "Citadelle des Flammes Infernales: Le repaire de Magtheridon",
      [ "SSC" ] = "Réservoir de Glissecroc : Caverne du sanctuaire du Serpent",
      [ "EYE" ] = "L'Œil du cyclone",
      [ "ZA" ] = "Zul-Aman",
      [ "HYJAL" ] = "Sommet d'Hyjal",
      [ "BT" ] = "Temple noir",
      [ "SWP" ] = "Plateau du Puits de soleil",
      [ "ONY" ] = "Repaire d'Onyxia (25)",
      [ "MC" ] = "Cœur du Magma (25)",
      [ "ZG" ] = "Zul'Gurub (20)",
      [ "AQ20" ] = "Ruines d'Ahn'Qiraj (20)",
      [ "BWL" ] = "Repaire de l'Aile noire (25)",
      [ "AQ40" ] = "Ahn'Qiraj (25)",
      [ "NAXX" ] = "Naxxramas (25)",
      [ "ARENA" ] = "Arena (PvP)",
	  [ "DEBUG" ] = "INFO DÉBOGAGE",
	  [ "BAD" ] = "MOTS INDÉSIRABLES DÉBOGAGE - REJETÉ",
	  [ "BREW" ] = "Fête des Brasseurs - Coren Navrebière",
	  [ "HOLLOW" ] = "Sanssaint - Le Cavalier sans tête",
	  [ "LOVE" ] = "De l'amour dans l'air",
	  [ "NOBLEGARDEN" ] = "Jardins des Nobles",
	  [ "MIDSUMMER" ] = "Fête du Feu du solstice d'été",
	  [ "HARVEST" ] = "Fête des Moissons",
	  [ "WINTERVEIL" ] = "Voile d'hiver",
	  [ "UK"] = "Donjon d'Utgarde",
	  [ "UP"] = "Cime d'Utgarde",
	  [ "NEX"] = "Le Nexus",
	  [ "AN"] = "Azjol-Nérub",
	  [ "AK"] = "Ahn'kahet : l'Ancien royaume",
	  [ "DTK"] = "Donjon de Drak'Tharon",
	  [ "VH"] = "Le fort Pourpre",
	  [ "GUN"] = "Gundrak",
	  [ "HOL"] = "Les salles de Pierre",
	  [ "HOS"] = "Les salles de Foudre",
	  [ "COS"] = "L'Épuration de Stratholme",
	  [ "OCC"] = "L'Oculus",
	  [ "FOS"] = "La Forge des Âmes",
	  [ "POS"] = "Fosse de Saron",
	  [ "HOR"] = "Salles des Reflets",
	  [ "EOE"] = "L'Œil de l'éternité (25)",
	  [ "OS"] = "Le sanctum Obsidien (25)",
	  [ "VOA"] = "Caveau d'Archavon (25)",
	  [ "ULDUAR"] = "Ulduar (25)",
	  [ "TOC"] = "L'épreuve du croisé (25)",
	  [ "TOGC"] = "L'épreuve du grand croisé (25)",
	  [ "ICC"] = "Citadelle de la Couronne de glace (25)",
	  [ "RS"] = "Le sanctum Rubis (25)",
    },
    esMX = {
      [ "RFC" ] = "Sima Ígnea",
      [ "DM" ] = "Las Minas de la Muerte",
      [ "WC" ] = "Cuevas de los Lamentos",
      [ "SFK" ] = "Castillo de Colmillo Oscuro",
      [ "STOCKS" ] = "Las Mazmorras",
      [ "BFD" ] = "Cavernas de Brazanegra",
      [ "GNOMER" ] = "Gnomeregan",
      [ "RFK" ] = "Horado Rajacieno",
      [ "SM2" ] = "Monasterio Escarlata",
      [ "GY" ] = "Monasterio Escarlata: Friedhof",
      [ "LIB" ] = "Monasterio Escarlata: Bibliothek",
      [ "ARMS" ] = "Monasterio Escarlata: Waffenkammer",
      [ "CATH" ] = "Monasterio Escarlata: Kathedrale",
      [ "RFD" ] = "Zahúrda Rojocieno",
      [ "ULDA" ] = "Uldaman",
      [ "ZF" ] = "Zul'Farrak",
      [ "MARA" ] = "Maraudon",
      [ "ST" ] = "El Templo de Atal'Hakkar",
      [ "BRD" ] = "Profundidades de Roca Negra	",
      [ "DM2" ] = "La Masacre",
      [ "DME" ] = "La Masacre: Ost",
      [ "DMN" ] = "La Masacre: Nord",
      [ "DMW" ] = "La Masacre: West",
      [ "STRAT" ] = "Stratholme",
      [ "SCHOLO" ] = "Scholomance",
      [ "LBRS" ] = "Cumbre de Roca Negra",
      [ "UBRS" ] = "Cumbre de Roca Negra (10)",
      [ "RAMPS" ] = "Hellfire Citadel: Ramparts",
      [ "BF" ] = "Hellfire Citadel: Blood Furnace",
      [ "SP" ] = "Coilfang Reservoir: Slave Pens",
      [ "UB" ] = "Coilfang Reservoir: Underbog",
      [ "MT" ] = "Auchindoun: Mana Tombs",
      [ "AC" ] = "Auchindoun: Auchenai Crypts",
      [ "SH" ] = "Auchindoun: Sethekk Halls",
      [ "OHF" ] = "Caverns of Time: Old Hillsbrad",
      [ "MECHA" ] = "Tempest Keep: The Mechanar",
      [ "BM" ] = "Caverns of Time: Black Morass",
      [ "MGT" ] = "Magisters' Terrace",
      [ "SHH" ] = "Hellfire Citadel: Shattered Halls",
      [ "BOTA" ] = "Tempest Keep: Botanica",
      [ "SL" ] = "Auchindoun: Shadow Labyrinth",
      [ "SV" ] = "Coilfang Reservoir: Steamvault",
      [ "ARCA" ] = "Tempest Keep: The Arcatraz",
      [ "KARA" ] = "Karazhan",
      [ "GRUULS" ] = "Gruul's Lair",
      [ "MAGS" ] = "Hellfire Citadel: Magtheridon's Lair",
      [ "SSC" ] = "Coilfang Reservoir: Serpentshrine Cavern",
      [ "EYE" ] = "The Eye",
      [ "ZA" ] = "Zul-Aman",
      [ "HYJAL" ] = "The Battle For Mount Hyjal",
      [ "BT" ] = "Black Temple",
      [ "SWP" ] = "Sunwell Plateau",
      [ "ONY" ] = "Guarida de Onyxia (25)",
      [ "MC" ] = "Núcleo de Magma (25)",
      [ "ZG" ] = "Zul'Gurub (20)",
      [ "AQ20" ] = "Ruinas de Ahn'Qiraj (20)",
      [ "BWL" ] = "Guarida Alanegra (25)",
      [ "AQ40" ] = "Ahn'Qiraj (25)",
      [ "NAXX" ] = "Naxxramas (25)",
      [ "ARENA" ] = "Arena (PvP)",
	  [ "DEBUG" ] = "INFORMACIÓN DE DEPURACIÓN",
	  [ "BAD" ] = "PALABRAS INAPROPIADAS EN DEPURACIÓN - RECHAZADO",
	  [ "BREW" ] = "Fiesta de la Cerveza - Ceren Pezuñaamarga",
	  [ "HOLLOW" ] = "Halloween - El Jinete Decapitado",
	  [ "LOVE" ] = "Amor en el Aire",
	  [ "NOBLEGARDEN" ] = "Jardín de los Nobles",
	  [ "MIDSUMMER" ] = "Festival del Fuego del Solsticio de Verano",
	  [ "HARVEST" ] = "Festival de la Cosecha",
	  [ "WINTERVEIL" ] = "Festival de Invierno",
	  [ "UK"] = "Fortaleza de Utgarde",
	  [ "UP"] = "Pináculo de Utgarde",
	  [ "NEX"] = "El Nexo",
	  [ "AN"] = "Azjol-Nerub",
	  [ "AK"] = "Ahn'kahet: El Reino Antiguo",
	  [ "DTK"] = "Fortaleza de Drak'Tharon",
	  [ "VH"] = "El Bastión Violeta",
	  [ "GUN"] = "Gundrak",
	  [ "HOL"] = "Cámaras de Piedra",
	  [ "HOS"] = "Cámaras de Relámpagos",
	  [ "COS"] = "La Matanza de Stratholme",
	  [ "OCC"] = "El Oculus",
	  [ "FOS"] = "La Forja de Almas",
	  [ "POS"] = "Fosa de Saron",
	  [ "HOR"] = "Cámaras de Reflexión",
	  [ "EOE"] = "El Ojo de la Eternidad (25)",
	  [ "OS"] = "El Santuario de Obsidiana (25)",
	  [ "VOA"] = "Cámara de Archavon (25)",
	  [ "ULDUAR"] = "Ulduar (25)",
	  [ "TOC"] = "Prueba del Cruzado (25)",
	  [ "TOGC"] = "Prueba del Gran Cruzado (25)",
	  [ "ICC"] = "Ciudadela de la Corona de Hielo (25)",
	  [ "RS"] = "El Santuario Rubí (25)",

    },
    ruRU = {
      [ "AB" ] = "Низина Арати (PvP)",
      [ "AQ20" ] = "Руины Ан'Киража (20)",
      [ "AQ40" ] = "Ан'Кираж (25)",
      [ "AV" ] = "Альтеракская Долина (PvP)",
      [ "BAD" ] = "ОТЛАДКА ПЛОХИЕ СЛОВА - ОТКЛОНЕН",
      [ "BFD" ] = "Непроглядная Пучина",
      [ "BRD" ] = "Глубины Черной горы",
      [ "BWL" ] = "Логово Крыла Тьмы (25)",
      [ "DEBUG" ] = "ИНФОРМАЦИЯ О ОТЛАДКАХ",
      [ "DM" ] = "Мертвые копи",
      [ "DM2" ] = "Забытый Город",
      [ "DME" ] = "Забытый Город: Восток",
      [ "DMN" ] = "Забытый Город: Север",
      [ "DMW" ] = "Забытый Город: Запад",
      [ "GNOMER" ] = "Гномреган",
      [ "LBRS" ] = "Низ Вершины Черной горы",
      [ "MARA" ] = "Мародон",
      [ "MC" ] = "Огненные Недра (25)",
      [ "MISC" ] = "Прочее",
      [ "NAXX" ] = "Наксрамас (25)",
      [ "RAMPS" ] = "Цитадель Адского Пламени: Бастионы",
      [ "BF" ] = "Цитадель Адского Пламени: Кузня Крови",
      [ "SP" ] = "Резервуар Кривого Клыка: Узилище",
      [ "UB" ] = "Резервуар Кривого Клыка: Нижетопь",
      [ "MT" ] = "Аукиндон: Гробницы Маны",
      [ "AC" ] = "Аукиндон: Аукенайские гробницы",
      [ "SH" ] = "Аукиндон: Сетеккские залы",
      [ "OHF" ] = "Пещеры Времени: Старые предгорья Хилсбрада",
      [ "MECHA" ] = "Крепость Бурь: Механар",
      [ "BM" ] = "Пещеры Времени: Черные топи",
      [ "MGT" ] = "Терраса магистров",
      [ "SHH" ] = "Цитадель Адского Пламени: Разрушенные залы",
      [ "BOTA" ] = "Крепость Бурь: Ботаника",
      [ "SL" ] = "Аукиндон: Темный лабиринт",
      [ "SV" ] = "Резервуар Кривого Клыка: Паровое подземелье",
      [ "ARCA" ] = "Крепость Бурь: Аркатрац",
      [ "KARA" ] = "Каражан",
      [ "GRUULS" ] = "Логово Груула",
      [ "MAGS" ] = "Цитадель Адского Пламени: Логово Магтеридона",
      [ "SSC" ] = "Резервуар Кривого Клыка: Змеиное святилище",
      [ "EYE" ] = "Крепость Бурь: Око",
      [ "ZA" ] = "Зул'Аман",
      [ "HYJAL" ] = "Пещеры Времени: Вершина Хиджала",
      [ "BT" ] = "Черный Храм",
      [ "SWP" ] = "Плато Солнечного Колодца",
      [ "ONY" ] = "Логово Ониксии (25)",
      [ "RFC" ] = "Огненная пропасть",
      [ "RFD" ] = "Курганы Иглошкурых",
      [ "RFK" ] = "Лабиринты Иглошкурых",
      [ "SCHOLO" ] = "Некроситет",
      [ "SFK" ] = "Крепость Темного Клыка",
      [ "SM2" ] = "Монастырь Алого ордена",
      [ "ARMS" ] = "Монастырь Алого ордена: Оружейная",
      [ "CATH" ] = "Монастырь Алого ордена: Собор",
      [ "GY" ] = "Монастырь Алого ордена: Кладбище",
      [ "LIB" ] = "Монастырь Алого ордена: Библиотека",
      [ "ST" ] = "Затонувший Храм",
      [ "STOCKS" ] = "Тюрьма",
      [ "STRAT" ] = "Стратхольм",
      [ "TRADE" ] = "Торговля",
      [ "UBRS" ] = "Верх Вершины Черной горы (10)",
      [ "ULDA" ] = "Ульдаман",
      [ "WC" ] = "Пещеры Стенаний",
      [ "WSG" ] = "Ущелье Песни Войны (PvP)",
      [ "EOTS" ] = "Око Бури (PvP)",
      [ "ARENA" ] = "Arena (PvP)",
      [ "ZF" ] = "Зул'Фаррак",
      [ "ZG" ] = "Зул'Гуруб (20)",
	  [ "DEBUG" ] = "ОТЛАДОЧНАЯ ИНФОРМАЦИЯ",
	  [ "BAD" ] = "ОТЛАДКА ПЛОХИХ СЛОВ - ОТКЛОНЕНО",
	  [ "BREW" ] = "Хмельной фестиваль - Корен Хмуродёрн",
	  [ "HOLLOW" ] = "Тыквовин - Всадник без головы",
	  [ "LOVE" ] = "Любовная лихорадка",
	  [ "NOBLEGARDEN" ] = "Праздник Весны",
	  [ "MIDSUMMER" ] = "Огненный солнцеворот",
	  [ "HARVEST" ] = "Неделя урожая",
	  [ "WINTERVEIL" ] = "Пир Зимнего Покрова",
	  [ "UK"] = "Крепость Утгард",
	  [ "UP"] = "Вершина Утгард",
	  [ "NEX"] = "Нексус",
	  [ "AN"] = "Азжол-Неруб",
	  [ "AK"] = "Ан'кахет: Старое Королевство",
	  [ "DTK"] = "Крепость Драк'Тарон",
	  [ "VH"] = "Аметистовая крепость",
	  [ "GUN"] = "Гундрак",
	  [ "HOL"] = "Залы Камня",
	  [ "HOS"] = "Залы Молний",
	  [ "COS"] = "Очищение Стратхольма",
	  [ "OCC"] = "Окулус",
	  [ "FOS"] = "Кузня Душ",
	  [ "POS"] = "Яма Сарона",
	  [ "HOR"] = "Залы Отражений",
	  [ "EOE"] = "Око Вечности (25)",
	  [ "OS"] = "Обсидиановое святилище (25)",
	  [ "VOA"] = "Свод Аркавона (25)",
	  [ "ULDUAR"] = "Ульдуар (25)",
	  [ "TOC"] = "Испытание крестоносца (25)",
	  [ "TOGC"] = "Испытание Верховного крестоносца (25)",
	  [ "ICC"] = "Цитадель Ледяной Короны (25)",
	  [ "RS"] = "Рубиновое святилище (25)",
    },
    zhTW = {
      [ "RFC" ] = "怒焰裂谷",
      [ "DM" ] = "死亡礦坑",
      [ "WC" ] = "哀嚎洞穴",
      [ "SFK" ] = "影牙城堡",
      [ "STOCKS" ] = "監獄",
      [ "BFD" ] = "黑暗深淵",
      [ "GNOMER" ] = "諾姆瑞根",
      [ "RFK" ] = "剃刀沼澤",
      [ "SM2" ] = "血色修道院",
      [ "GY" ] = "血色修道院: 墓地",
      [ "LIB" ] = "血色修道院: 圖書館",
      [ "ARMS" ] = "血色修道院: 軍械庫",
      [ "CATH" ] = "血色修道院: 大教堂",
      [ "RFD" ] = "剃刀高地",
      [ "ULDA" ] = "奧達曼",
      [ "ZF" ] = "祖爾法拉克",
      [ "MARA" ] = "瑪拉頓",
      [ "ST" ] = "阿塔哈卡神廟",
      [ "BRD" ] = "黑石深淵",
      [ "DM2" ] = "厄運之槌",
      [ "DME" ] = "厄運之槌: 東",
      [ "DMN" ] = "厄運之槌: 北",
      [ "DMW" ] = "厄運之槌: 西",
      [ "STRAT" ] = "斯坦索姆",
      [ "SCHOLO" ] = "通靈學院",
      [ "LBRS" ] = "黑石塔下層",
      [ "UBRS" ] = "黑石塔上層 (10)",
      [ "RAMPS" ] = "地獄火壁壘",
      [ "BF" ] = "血熔爐",
      [ "SP" ] = "奴隸監獄",
      [ "UB" ] = "深幽泥沼",
      [ "MT" ] = "法力墓地",
      [ "AC" ] = "奧奇奈地穴",
      [ "SH" ] = "塞司克大廳",
      [ "OHF" ] = "希爾斯布萊德丘陵舊址",
      [ "MECHA" ] = "麥克納爾",
      [ "BM" ] = "黑色沼澤",
      [ "MGT" ] = "博學者殿堂",
      [ "SHH" ] = "破碎大廳",
      [ "BOTA" ] = "波塔尼卡",
      [ "SL" ] = "暗影迷宮",
      [ "SV" ] = "蒸氣洞穴",
      [ "ARCA" ] = "亞克崔茲",
      [ "KARA" ] = "卡拉贊 (10)",
      [ "GRUULS" ] = "戈魯爾之巢 (25)",
      [ "MAGS" ] = "瑪瑟里頓的巢穴 (25)",
      [ "SSC" ] = "毒蛇神殿洞穴 (25)",
      [ "EYE" ] = "風暴要塞 (25)",
      [ "ZA" ] = "祖阿曼 (10)",
      [ "HYJAL" ] = "海加爾山 (25)",
      [ "BT" ] = "黑暗神廟 (25)",
      [ "SWP" ] = "太陽之井高地 (25)",
      [ "ONY" ] = "奧妮克希亞的巢穴 (25)",
      [ "MC" ] = "熔火之心 (25)",
      [ "ZG" ] = "祖爾格拉布 (20)",
      [ "AQ20" ] = "安其拉廢墟 (20)",
      [ "BWL" ] = "黑翼之巢 (25)",
      [ "AQ40" ] = "安其拉 (25)",
      [ "NAXX" ] = "納克薩瑪斯 (25)",
      [ "WSG" ] = "戰歌峽谷 (PvP)",
      [ "AB" ] = "阿拉希盆地 (PvP)",
      [ "AV" ] = "奧特蘭克山谷 (PvP)",
      [ "EOTS" ] = "暴風之眼 (PvP)",
      [ "MISC" ] = "未分類",
      [ "TRADE" ] = "交易",
	  [ "DEBUG" ] = "除錯資訊",
	  [ "BAD" ] = "除錯不良詞語 - 已拒絕",
	  [ "BREW" ] = "啤酒節 - 科倫·恐酒",
	  [ "HOLLOW" ] = "萬鬼節 - 無頭騎士",
	  [ "LOVE" ] = "愛就在身邊",
	  [ "NOBLEGARDEN" ] = "貴族花園",
	  [ "MIDSUMMER" ] = "仲夏火焰節",
	  [ "HARVEST" ] = "收穫節",
	  [ "WINTERVEIL" ] = "冬幕節",
	  [ "UK"] = "俄特加德之巔",
	  [ "UP"] = "俄特加德之巔",
	  [ "NEX"] = "奧核之心",
	  [ "AN"] = "阿茲歐-奈幽",
	  [ "AK"] = "安卡罕特：古王國",
	  [ "DTK"] = "德拉克薩隆要塞",
	  [ "VH"] = "紫羅蘭堡",
	  [ "GUN"] = "剛德拉克",
	  [ "HOL"] = "石之大廳",
	  [ "HOS"] = "雷光大廳",
	  [ "COS"] = "斯坦索姆的抉擇",
	  [ "OCC"] = "奧核之眼",
	  [ "FOS"] = "眾魂熔爐",
	  [ "POS"] = "薩倫之淵",
	  [ "HOR"] = "倒影大廳",
	  [ "EOE"] = "永恆之眼 (25)",
	  [ "OS"] = "黑曜聖所 (25)",
	  [ "VOA"] = "亞夏梵穹殿 (25)",
	  [ "ULDUAR" ] = "奧杜亞 (25)",
	  [ "TOC"] = "十字軍試煉 (25)",
	  [ "TOGC"] = "大十字軍試煉 (25)",
	  [ "ICC"] = "冰冠城塞 (25)",
	  [ "RS"] = "晶紅聖所 (25)",
    },
  }



  local dungeonNames = dungeonNamesLocales[ GetLocale() ] or {}

  if GroupBulletinBoardDB and GroupBulletinBoardDB.CustomLocalesDungeon and type( GroupBulletinBoardDB.CustomLocalesDungeon ) == "table" then
    for key, value in pairs( GroupBulletinBoardDB.CustomLocalesDungeon ) do
      if value ~= nil and value ~= "" then
        dungeonNames[ key .. "_org" ] = dungeonNames[ key ] or DefaultEnGB[ key ]
        dungeonNames[ key ] = value
      end
    end
  end


  setmetatable( dungeonNames, { __index = DefaultEnGB } )

  dungeonNames[ "DEADMINES" ] = dungeonNames[ "DM" ]

  return dungeonNames
end

local function Union( a, b )
  local result = {}
  for k, v in pairs( a ) do
    result[ k ] = v
  end
  for k, v in pairs( b ) do
    result[ k ] = v
  end
  return result
end

GBB.VanillaDungeonLevels = {
  [ "RFC" ] = { 13, 18 },
  [ "DM" ] = { 18, 23 },
  [ "WC" ] = { 15, 25 },
  [ "SFK" ] = { 22, 30 },
  [ "STOCKS" ] = { 22, 30 },
  [ "BFD" ] = { 24, 32 },
  [ "GNOMER" ] = { 29, 38 },
  [ "RFK" ] = { 30, 40 },
  [ "GY" ] = { 28, 38 },
  [ "LIB" ] = { 29, 39 },
  [ "ARMS" ] = { 32, 42 },
  [ "CATH" ] = { 35, 45 },
  [ "RFD" ] = { 40, 50 },
  [ "ULDA" ] = { 42, 52 },
  [ "ZF" ] = { 44, 54 },
  [ "MARA" ] = { 46, 55 },
  [ "ST" ] = { 50, 60 },
  [ "BRD" ] = { 52, 60 },
  [ "LBRS" ] = { 55, 60 },
  [ "DME" ] = { 58, 60 },
  [ "DMN" ] = { 58, 60 },
  [ "DMW" ] = { 58, 60 },
  [ "STRAT" ] = { 58, 60 },
  [ "SCHOLO" ] = { 58, 60 },
  [ "UBRS" ] = { 58, 60 },
  [ "ONY" ] = { 60, 60 },
  [ "MC" ] = { 60, 60 },
  [ "ZG" ] = { 60, 60 },
  [ "AQ20" ] = { 60, 60 },
  [ "BWL" ] = { 60, 60 },
  [ "AQ40" ] = { 60, 60 },
  [ "WSG" ] = { 10, 70 },
  [ "AB" ] = { 20, 70 },
  [ "AV" ] = { 51, 70 },
  [ "MISC" ] = { 0, 100 },
  [ "DEBUG" ] = { 0, 100 },
  [ "BAD" ] = { 0, 100 },
  [ "TRADE" ] = { 0, 100 },
  [ "SM2" ] = { 28, 42 },
  [ "DM2" ] = { 58, 60 },
  [ "DEADMINES" ] = { 18, 23 },
}

GBB.PostTbcDungeonLevels = {
  [ "RFC" ] = { 13, 20 },
  [ "DM" ] = { 16, 24 },
  [ "WC" ] = { 16, 24 },
  [ "SFK" ] = { 17, 25 },
  [ "STOCKS" ] = { 21, 29 },
  [ "BFD" ] = { 20, 28 },
  [ "GNOMER" ] = { 24, 40 },
  [ "RFK" ] = { 23, 31 },
  [ "GY" ] = { 28, 34 },
  [ "LIB" ] = { 30, 38 },
  [ "ARMS" ] = { 32, 42 },
  [ "CATH" ] = { 35, 44 },
  [ "RFD" ] = { 33, 41 },
  [ "ULDA" ] = { 36, 44 },
  [ "ZF" ] = { 42, 50 },
  [ "MARA" ] = { 40, 52 },
  [ "ST" ] = { 45, 54 },
  [ "BRD" ] = { 48, 60 },
  [ "LBRS" ] = { 54, 60 },
  [ "DME" ] = { 54, 61 },
  [ "DMN" ] = { 54, 61 },
  [ "DMW" ] = { 54, 61 },
  [ "STRAT" ] = { 56, 61 },
  [ "SCHOLO" ] = { 56, 61 },
  [ "UBRS" ] = { 53, 61 },
  [ "ONY" ] = { 60, 60 },
  [ "MC" ] = { 60, 60 },
  [ "ZG" ] = { 60, 60 },
  [ "AQ20" ] = { 60, 60 },
  [ "BWL" ] = { 60, 60 },
  [ "AQ40" ] = { 60, 60 },
  [ "NAXX" ] = { 60, 60 },
  [ "WSG" ] = { 10, 70 },
  [ "AB" ] = { 20, 70 },
  [ "AV" ] = { 51, 70 },
  [ "MISC" ] = { 0, 100 },
  [ "DEBUG" ] = { 0, 100 },
  [ "BAD" ] = { 0, 100 },
  [ "TRADE" ] = { 0, 100 },
  [ "SM2" ] = { 28, 42 },
  [ "DM2" ] = { 58, 60 },
  [ "DEADMINES" ] = { 16, 24 },
}

GBB.TbcDungeonLevels     = {
  [ "RAMPS" ] = { 60, 62 },
  [ "BF" ] = { 61, 63 },
  [ "SP" ] = { 62, 64 },
  [ "UB" ] = { 63, 65 },
  [ "MT" ] = { 64, 66 },
  [ "AC" ] = { 65, 67 },
  [ "SH" ] = { 67, 69 },
  [ "OHF" ] = { 66, 68 },
  [ "MECHA" ] = { 69, 70 },
  [ "BM" ] = { 69, 70 },
  [ "MGT" ] = { 70, 70 },
  [ "SHH" ] = { 70, 70 },
  [ "BOTA" ] = { 70, 70 },
  [ "SL" ] = { 70, 70 },
  [ "SV" ] = { 70, 70 },
  [ "ARCA" ] = { 70, 70 },
  [ "KARA" ] = { 70, 70 },
  [ "GRUULS" ] = { 70, 70 },
  [ "MAGS" ] = { 70, 70 },
  [ "SSC" ] = { 70, 70 },
  [ "EYE" ] = { 70, 70 },
  [ "ZA" ] = { 70, 70 },
  [ "HYJAL" ] = { 70, 70 },
  [ "BT" ] = { 70, 70 },
  [ "SWP" ] = { 70, 70 },
  [ "EOTS" ] = { 15, 70 },
  [ "BREW" ] = { 65, 70 },
  [ "HOLLOW" ] = { 65, 70 },
}

GBB.WotlkDungeonLevels = {
    -- Normal Dungeons
    [ "UK"] = { 58, 80 },
    [ "NEX"] = { 59, 80 },
    [ "AN"] = { 60, 80 },
    [ "AK"] = { 61, 80 },
    [ "DTK"] = { 62, 80 },
    [ "VH"] = { 63, 80 },
    [ "GUN"] = { 64, 80 },
	[ "HOS"] = { 65, 80 },
    [ "HOL"] = { 67, 80 },
    [ "OCC"] = { 67, 80 },
    [ "UP"] = { 67, 80 },
    [ "COS"] = { 68, 80 },
    [ "UK_H"] = { 80, 80 },
    [ "NEX_H"] = { 80, 80 },
    [ "AN_H"] = { 80, 80 },
    [ "AK_H"] = { 80, 80 },
    [ "DTK_H"] = { 80, 80 },
    [ "VH_H"] = { 80, 80 },
    [ "GUN_H"] = { 80, 80 },
    [ "HOL_H"] = { 80, 80 },
    [ "HOS_H"] = { 80, 80 },
    [ "COS_H"] = { 80, 80 },
    [ "OCC_H"] = { 80, 80 },
    [ "UP_H"] = { 80, 80 },
    [ "FOS"] = { 70, 80 },
    [ "POS"] = { 70, 80 },
    [ "HOR"] = { 70, 80 },
    [ "EOE"] = { 80, 80 },
	[ "NAXX" ] = { 80, 80 },
    [ "OS"] = { 80, 80 },
    [ "VOA"] = { 80, 80 },
    [ "ULDUAR"] = { 80, 80 },
    [ "TOC"] = { 68, 80 },
    [ "TOGC"] = { 80, 80 },
    [ "ICC"] = { 80, 80 },
    [ "RS"] = { 80, 80 },
	[ "LOVE" ] = { 1, 80 },
	[ "NOBLEGARDEN" ] = { 1, 80 },
	[ "MIDSUMMER" ] = { 1, 80 },
	[ "HARVEST" ] = { 1, 80 },
	[ "HALLOW" ] = { 1, 80 },
	[ "WINTERVEIL" ] = { 1, 80 },
	[ "ARENA" ] = { 80, 80 },
}

GBB.WotlkDungeonNames = {
    "UK", "NEX", "AN", "AK", "DTK", "VH", "GUN", "HOL", "HOS", "COS", "OCC", "UP",
    "UK_H", "NEX_H", "AN_H", "AK_H", "DTK_H", "VH_H", "GUN_H", "HOL_H", "HOS_H", "COS_H", "OCC_H", "UP_H",
    "FOS", "POS", "HOR",
}

GBB.TbcDungeonNames      = {
  "RAMPS", "BF", "SHH", "MAGS", "SP", "UB", "SV", "SSC", "MT", "AC",
  "SH", "SL", "OHF", "BM", "MECHA", "BOTA", "ARCA", "EYE", "MGT", "KARA",
  "GRUULS", "ZA", "HYJAL", "BT", "SWP",
}

GBB.VanillDungeonNames   = {
  "RFC", "WC", "DM", "SFK", "STOCKS", "BFD", "GNOMER",
  "RFK", "GY", "LIB", "ARMS", "CATH", "RFD", "ULDA",
  "ZF", "MARA", "ST", "BRD", "LBRS", "DME", "DMN",
  "DMW", "STRAT", "SCHOLO", "UBRS", "ONY", "MC", "ZG",
  "AQ20", "BWL", "AQ40", "NAXX",
}


GBB.PvpNames = {
  "WSG", "AB", "AV", "EOTS", "ARENA",
}

GBB.Misc = { "MISC", "TRADE", }

GBB.DebugNames = {
  "DEBUG", "BAD", "NIL",
}

GBB.Raids = {
  "ONY", "MC", "ZG", "AQ20", "BWL", "AQ40",
  "KARA", "GRUULS", "MAGS", "SSC", "EYE", "ZA", "HYJAL",
  "BT", "SWP", "ARENA", "WSG", "AV", "AB", "EOTS",
  "BREW", "HOLLOW", "LOVE", "NOBLEGARDEN", "MIDSUMMER", "HARVEST", "WINTERVEIL", "EOE", "OS", "VOA", "ULDUAR", "TOC", "TOGC", "ICC", "RS",
}

GBB.WotlkRaidNames = {
    "NAXX", "EOE", "OS", "VOA", "ULDUAR", "TOC", "TOGC", "ICC", "RS"
}

GBB.Seasonal = {
  -- Classic/TBC Events
  [ "BREW" ] = { startDate = "09/19", endDate = "10/07" },
  [ "HOLLOW" ] = { startDate = "10/16", endDate = "11/01" },
  
  -- WotLK Events
  [ "LOVE" ] = { startDate = "02/05", endDate = "02/20" }, -- Love is in the Air
  [ "NOBLEGARDEN" ] = { startDate = "04/22", endDate = "05/05" }, -- Noblegarden
  [ "MIDSUMMER" ] = { startDate = "06/21", endDate = "07/05" }, -- Midsummer Fire Festival
  [ "HARVEST" ] = { startDate = "09/26", endDate = "10/07" }, -- Harvest Festival
  [ "WINTERVEIL" ] = { startDate = "12/15", endDate = "01/02" } -- Feast of Winter Veil
}

GBB.SeasonalActiveEvents = {}
GBB.Events = getSeasonalDungeons()

function GBB.GetRaids()
  local arr = {}
  for _, v in pairs( GBB.Raids ) do
    arr[ v ] = 1
  end
  return arr
end

-- Needed because Lua sucks, Blizzard switch to Python please <- LMFAO
-- Takes in a list of dungeon lists, it will then concatenate the lists into a single list
-- it will put the dungeons in an order and give them a value incremental value that can be used for sorting later
-- ie one list "Foo" which contains "Bar" and "FooBar" and a second list "BarFoo" which contains "BarBar"
-- the output would be single list with "Bar" = 1, "FooBar" = 2, "BarFoo" = 3, "BarBar" = 4
local function ConcatenateLists( Names )
  local result = {}
  local index = 1
  for k, nameLists in pairs( Names ) do
    for _, v in pairs( nameLists ) do
      result[ v ] = index
      index = index + 1
    end
  end
  return result, index
end

function GBB.GetDungeonSort()
    -- Separate seasonal events by expansion
    local classicEvents = {}
    local wotlkEvents = {}
    
    for eventName, eventData in pairs(GBB.Seasonal) do
        if GBB.Tool.InDateRange(eventData.startDate, eventData.endDate) then
            -- Classic/TBC events go with TBC dungeons
            if eventName == "BREW" or eventName == "HOLLOW" then
                table.insert(classicEvents, eventName)
            else
                -- WotLK events go with WotLK dungeons
                table.insert(wotlkEvents, eventName)
            end
        else
            table.insert(GBB.DebugNames, 1, eventName)
        end
    end
    
    -- Add events to their respective expansion sections
    for _, event in ipairs(classicEvents) do
        table.insert(GBB.TbcDungeonNames, 1, event)
    end
    
    for _, event in ipairs(wotlkEvents) do
        table.insert(GBB.WotlkDungeonNames, 1, event)
    end

    local dungeonOrder = { GBB.VanillDungeonNames, GBB.TbcDungeonNames, GBB.WotlkDungeonNames, GBB.WotlkRaidNames, GBB.PvpNames, GBB.Misc, GBB.DebugNames }

    -- Calculate sizes for each expansion
    local vanillaDungeonSize = #GBB.VanillDungeonNames
    local tbcDungeonSize = #GBB.TbcDungeonNames
    local wotlkDungeonSize = #GBB.WotlkDungeonNames
    local wotlkRaidSize = #GBB.WotlkRaidNames
    local pvpSize = #GBB.PvpNames
    local miscSize = #GBB.Misc
    local debugSize = #GBB.DebugNames

    -- Set expansion boundaries
    GBB.TBCDUNGEONSTART = vanillaDungeonSize + 1
    GBB.WOTLKDUNGEONSTART = vanillaDungeonSize + tbcDungeonSize + 1
    GBB.WOTLKRAIDSTART = GBB.WOTLKDUNGEONSTART + wotlkDungeonSize
    GBB.PVPSTART = GBB.WOTLKRAIDSTART + wotlkRaidSize
    GBB.MISCSTART = GBB.PVPSTART + pvpSize
    
    GBB.MAXDUNGEON = vanillaDungeonSize + tbcDungeonSize + wotlkDungeonSize + wotlkRaidSize + pvpSize + miscSize
    
    -- For TBC filter panel (exclude WotLK content)
    GBB.TBCMAXDUNGEON = GBB.WOTLKDUNGEONSTART - 1
    
    -- For WotLK filter panel
    GBB.WOTLKMAXDUNGEON = GBB.PVPSTART - 1
    
    -- Split points for 2-column layout
    GBB.DUNGEONBREAK = 25  -- Vanilla split
    GBB.TBCDUNGEONBREAK = GBB.TBCDUNGEONSTART + math.floor((GBB.TBCMAXDUNGEON - GBB.TBCDUNGEONSTART) / 2)  -- TBC split
    GBB.WOTLKDUNGEONBREAK = GBB.WOTLKDUNGEONSTART + math.floor((GBB.WOTLKMAXDUNGEON - GBB.WOTLKDUNGEONSTART) / 2)  -- WotLK split

    local tmp_dsort, concatenatedSize = ConcatenateLists(dungeonOrder)
    local dungeonSort = {}

    for dungeon, nb in pairs(tmp_dsort) do
        dungeonSort[nb] = dungeon
        dungeonSort[dungeon] = nb
    end

    -- Need to do this because I don't know I am too lazy to debug the use of SM2, DM2, and DEADMINES
    dungeonSort["SM2"] = 10.5
    dungeonSort["DM2"] = 19.5
    dungeonSort["DEADMINES"] = 99

    return dungeonSort
end

local function DetermineVanillDungeonRange()
  return GBB.PostTbcDungeonLevels
end

GBB.dungeonLevel = Union(Union(DetermineVanillDungeonRange(), GBB.TbcDungeonLevels), GBB.WotlkDungeonLevels)
