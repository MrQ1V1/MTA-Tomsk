local COLOR = {
	["DOLLAR"] = {
		["RGB"] = {69, 124, 59},
		["HEX"] = "#457C3B"
	},
	["REDDOLLAR"] = {
		["RGB"] = {180, 25, 10},
		["HEX"] = "#B4191D"
	},
	["TEXT"] = {
		["RGB"] = {220, 220, 220},
		["HEX"] = "#DCDCDC"
	},
	["KEY"] = {
		["RGB"] = {160, 160, 160},
		["HEX"] = "#A0A0A0"
	}
}




local NewsPaper = {false, false, false, false}
local GroundMaterial = {}
local ZonesDisplay = {}
local ClosedZones = false
local PedSyncObj = {}
local ObjectInStream = {}
local VehiclesInStream = {}
local VehicleTrunk = {}
local DestroyedBlip = {}
local SkinList,SwitchButtonL,SwitchButtonR,SwitchButtonAccept,PEDChangeSkin = false
local SkinFlag = true
local PlayersMessage = {}
local PlayersAction = {}
local HomeEditor = false
local RobAction = false
local FireTimer = {}
local StreamData = {}
local AnimatedMarker = {}
local VideoMemory = {["HUD"] = {}}

local PData = {
	["Interface"] = {
		["Full"] = true, 
		["WantedLevel"] = true,
		["Inventory"] = true,
		["AreaName"] = true,
		["Collections"] = true
	}, 
	['WantedFlashing'] = false, 
	['Target'] = {}, 
	['blip'] = {}, 
	['DublicateRadar'] = {},
	['AlphaRadar'] = {},
	['ExpText'] = {},
	['stamina'] = 8,
	['LVLUPSTAMINA'] = 10,
	['rage'] = 0, 
	['ShakeLVL'] = 0, 
	['TARR'] = {}, -- Target, по центру, ниже, выше
	['MultipleAction'] = {},
	['LANG'] = "Ru_ru.po", 
	["DisplayCollection"] = {}, -- Отображает на экране количество коллекций в районе
	['infopath'] = {
		["Linden Side"] = false,
		["Las Venturas Airport"] = false,
		["Harry Gold Parkway"] = false,
		["Los Santos International"] = false,
		["Come-A-Lot"] = false,
		["Juniper Hill"] = false,
		["City Hall"] = false,
		["Julius Thruway North"] = false,
		["Montgomery"] = false,
		["El Corona"] = false,
		["Queens"] = false,
		["The High Roller"] = false,
		["K.A.C.C. Military Fuels"] = false,
		["Pilson Intersection"] = false,
		["Vinewood"] = false,
		["Mulholland Intersection"] = false,
		["The Emerald Isle"] = false,
		["Flint County"] = false,
		["El Quebrados"] = false,
		["Tierra Robada"] = false,
		["Linden Station"] = false,
		["Blackfield Chapel"] = false,
		["San Andreas Sound"] = false,
		["Conference Center"] = false,
		["Roca Escalante"] = false,
		["The Camel's Toe"] = false,
		["El Castillo del Diablo"] = false,
		["Lil' Probe Inn"] = false,
		["Martin Bridge"] = false,
		["Beacon Hill"] = false,
		["Battery Point"] = false,
		["Missionary Hill"] = false,
		["The Pink Swan"] = false,
		["Easter Tunnel"] = false,
		["Red County"] = false,
		["Commerce"] = false,
		["Palomino Creek"] = false,
		["Blueberry"] = false,
		["Montgomery Intersection"] = false,
		["Santa Maria Beach"] = false,
		["Las Barrancas"] = false,
		["Regular Tom"] = false,
		["Shady Creeks"] = false,
		["Kincaid Bridge"] = false,
		["Los Flores"] = false,
		["Valle Ocultado"] = false,
		["Julius Thruway West"] = false,
		["Jefferson"] = false,
		["Unknown Bar"] = false,
		["Hashbury"] = false,
		["'The Big Ear'"] = false,
		["Back o Beyond"] = false,
		["Los Santos"] = false,
		["Playa del Seville"] = false,
		["Last Dime Motel"] = false,
		["Temple"] = false,
		["San Fierro"] = false,
		["Rockshore East"] = false,
		["The Mako Span"] = false,
		["Hilltop Farm"] = false,
		["Avispa Country Club"] = false,
		["The Sherman Dam"] = false,
		["Ganton"] = false,
		["Fisher's Lagoon"] = false,
		["Pirates in Men's Pants"] = false,
		["Ocean Flats"] = false,
		["Rockshore West"] = false,
		["Cranberry Station"] = false,
		["Hankypanky Point"] = false,
		["The Clown's Pocket"] = false,
		["Doherty"] = false,
		["Unknown"] = false,
		["Esplanade North"] = false,
		["North Rock"] = false,
		["Bayside Marina"] = false,
		["The Four Dragons Casino"] = false,
		["Richman"] = false,
		["Calton Heights"] = false,
		["The Strip"] = false,
		["Spinybed"] = false,
		["Restricted Area"] = false,
		["Verona Beach"] = false,
		["King's"] = false,
		["Garver Bridge"] = false,
		["Easter Basin"] = false,
		["LVA Freight Depot"] = false,
		["Whetstone"] = false,
		["Aldea Malvada"] = false,
		["Easter Bay Airport"] = false,
		["Fallow Bridge"] = false,
		["Redsands East"] = false,
		["Royal Casino"] = false,
		["Las Brujas"] = false,
		["Dillimore"] = false,
		["Randolph Industrial Estate"] = false,
		["Blueberry Acres"] = false,
		["Willowfield"] = false,
		["Market"] = false,
		["Julius Thruway East"] = false,
		["Palisades"] = false,
		["Bone County"] = false,
		["Leafy Hollow"] = false,
		["Flint Range"] = false,
		["Sherman Reservoir"] = false,
		["Hunter Quarry"] = false,
		["Easter Bay Chemicals"] = false,
		["Sobell Rail Yards"] = false,
		["Yellow Bell Station"] = false,
		["Bayside"] = false,
		["Paradiso"] = false,
		["Verdant Meadows"] = false,
		["Blackfield Intersection"] = false,
		["Hampton Barns"] = false,
		["Chinatown"] = false,
		["Los Santos Inlet"] = false,
		["Bayside Tunnel"] = false,
		["Idlewood"] = false,
		["Rodeo"] = false,
		["Verdant Bluffs"] = false,
		["Foster Valley"] = false,
		["Whitewood Estates"] = false,
		["Marina"] = false,
		["Garcia"] = false,
		["East Los Santos"] = false,
		["Downtown Los Santos"] = false,
		["Juniper Hollow"] = false,
		["Fallen Tree"] = false,
		["Green Palms"] = false,
		["Las Venturas"] = false,
		["Esplanade East"] = false,
		["Gant Bridge"] = false,
		["Mount Chiliad"] = false,
		["Robada Intersection"] = false,
		["Pilgrim"] = false,
		["Glen Park"] = false,
		["Fort Carson"] = false,
		["Julius Thruway South"] = false,
		["Angel Pine"] = false,
		["Mulholland"] = false,
		["Little Mexico"] = false,
		["The Visage"] = false,
		["Financial"] = false,
		["Market Station"] = false,
		["Blackfield"] = false,
		["Yellow Bell Golf Course"] = false,
		["Las Payasadas"] = false,
		["Shady Cabin"] = false,
		["Frederick Bridge"] = false,
		["Octane Springs"] = false,
		["The Panopticon"] = false,
		["East Beach"] = false,
		["Caligula's Palace"] = false,
		["Flint Water"] = false,
		["San Fierro Bay"] = false,
		["Fern Ridge"] = false,
		["Creek"] = false,
		["Las Colinas"] = false,
		["Santa Flora"] = false,
		["Starfish Casino"] = false,
		["Redsands West"] = false,
		["Flint Intersection"] = false,
		["Old Venturas Strip"] = false,
		["Pershing Square"] = false,
		["Arco del Oeste"] = false,
		["Prickle Pine"] = false,
		["Ocean Docks"] = false,
		["Greenglass College"] = false,
		["Unity Station"] = false,
		["Downtown"] = false,
	}, -- Для разработчика
	['changezone'] = {} -- Для разработчика
}
local LangArr = {}
local timers = {}
local timersAction = {}
local backpackid = false
local titleText = ""
local ToolTipText = ""
local ToolTipTimers = false
toggleAllControls(true)
local screenWidth, screenHeight = guiGetScreenSize()
local scale = ((screenWidth/1920)+(screenHeight/1080))
local NewScale = ((screenWidth/1920)+(screenHeight/1080))/2
local scalex = (screenWidth/1920)
local scaley = (screenHeight/1080)
local PrisonSleep = false
local PrisonGavno = false
local dialogActionTimer = false
local dialogTimer = false
local dialogViewTimer = false
local dialogTitle = false
local PlayerChangeSkinTeam = ""
local PlayerChangeSkinTeamRang = ""
local PlayerChangeSkinTeamRespect = ""
local PlayerChangeSkinTeamRespectNextLevel = ""
local OriginalArr = false
local RespectTempFileTimers = false
local GTASound = false
local tuningList = false
local ToC1, ToC2, ToC3, ToC4 = false, false, false, false
local upgrades = false
local TCButton = {}
local TCButton2 = {}
local ServerDate = getRealTime(getElementData(root, "ServerTime"))
local AddITimer = false
local AddITimerText = ""
local usableslot = 1
local SprunkObject = false
local CallPolice = false
local BANKCTL = false
local MovePlayerTo = {} -- x,y,z,rz,mode [silent, fast],action,args
local Targets = {}
local MyHouseBlip = {}
local SpawnPoints = {}
local initializedInv = false
local InventoryWindows = false
local DragElement = false
local DragElementId = false
local DragElementName = false
local DragStart = {}
local DragX = false
local DragY = false
local ShowInfo = false
local MouseX, MouseY = 0, 0
local TrunkWindows = false
local TradeWindows = false
local PBut = {["player"] = {}, ["shop"] = {}, ["backpack"] = {}, ["trunk"] = {}}
local PInv = {["player"] = {}, ["shop"] = {}, ["backpack"] = {}, ["trunk"] = {}}
local InventoryMass = 0
local MaxMass = 0
local MassColor = tocolor(255,255,255,255)
local SleepTimer = false
local ArrestTimerEvent = false
local DrugsTimer = false
local SpunkTimer = false
local GPSObject = {}
local VehicleSpeed = 0
local SlowTahometer = 0
local screenSource = dxCreateScreenSource(screenWidth, screenHeight)
local IDF, NF, RANG, PING = false
local TabScroll = 1
local MAXSCROLL = math.floor((screenHeight/2.8)/dxGetFontHeight(scale/1.8, "default-bold"))
local TABCurrent = 0
local PText = {["biz"] = {}, ["bank"] = {}, ["INVHUD"] = {}, ["LainOS"] = {}, ["HUD"] = {}}
--[[ 
HUD:
	1 - Наше время
	2 - Встать с койки
	3 - ChangeInfo
	4 - ChangeInfoAdv
	5 - helpmessage
	6 - MissionCompleted
	7 - MissionCompleted
	8 - input
	9 - очки ярости
	
	10 - Russian
	11 - English
	12 - Portuguese
	13 - Azerbaijani
	14 - Turkish
--]]
local RespawnTimer = false
local LainOS = false
local LainOSCursorTimer = false
local RespectMsg = false
local LainOSInput = ""
local LainOSDisplay = {}
local LainOSCursorLoad = 1
local LainOSCursorLoadData = {
[1] = " ",
[2] = "█",
}

local BindedKeys = {} --[key] = {TriggerServerEvent(unpack)}



function GetDistance(a,b)
	local x,y,z = getElementPosition(a)
	local x2,y2,z2 = getElementPosition(b)
	return getDistanceBetweenPoints3D(x,y,z,x2,y2,z2)
end



function MinusToPlus(var)
	if(var < 0) then
		var = var-var-var
	end
	return var
end

function Text(text, repl)
	if(LangArr[text]) then
		if(LangArr[text] ~= "") then
			text = LangArr[text]
		end
	end
	if(repl) then
		for i, dat in pairs(repl) do
			text = string.gsub(text, dat[1], dat[2])
		end
	end
	return text
end


local trafficlight = {
	["0"] = "west",
	["1"] = "west",
	["2"] = false,
	["3"] = "north",
	["4"] = "north"
}





 


function dxDrawCircle( posX, posY, radius, width, angleAmount, startAngle, stopAngle, color, postGUI, text)
	if(startAngle == stopAngle) then
		return false
	end
 
	local function clamp( val, lower, upper )
		if ( lower > upper ) then lower, upper = upper, lower end
		return math.max( lower, math.min( upper, val ) )
	end
 
	radius = type( radius ) == "number" and radius or 50
	width = type( width ) == "number" and width or 5
	angleAmount = type( angleAmount ) == "number" and angleAmount or 1
	startAngle = clamp( type( startAngle ) == "number" and startAngle or 0, 0, 360 )
	stopAngle = clamp( type( stopAngle ) == "number" and stopAngle or 360, 0, 360 )
	color = color or tocolor( 255, 255, 255, 200 )
	postGUI = type( postGUI ) == "boolean" and postGUI or false
 
	if ( stopAngle < startAngle ) then
		local tempAngle = stopAngle
		stopAngle = startAngle
		startAngle = tempAngle
	end
 
	local n = 0
	for i = startAngle, stopAngle, angleAmount do
		local startX = math.cos( math.rad( i ) ) * ( radius - width )
		local startY = math.sin( math.rad( i ) ) * ( radius - width )
		local endX = math.cos( math.rad( i ) ) * ( radius + width )
		local endY = math.sin( math.rad( i ) ) * ( radius + width )
		dxDrawLine(startX + posX, startY + posY, endX + posX, endY + posY, color, width, postGUI)
		if(text) then
			dxDrawText(n, (startX/1.17)+posX,(startY/1.17)+posY, (startX/1.17)+posX,(startY/1.17)+posY, tocolor(160,160,160,255), scale/2, "default-bold", "center", "center")
			n=n+1
		end
	end
	return true
end


function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end


function dxDrawBorderedText(text, left, top, right, bottom, color, scale, font, alignX, alignY, clip, wordBreak, postGUI, colorCoded, subPixelPositioning)
	if(text) then
		local r,g,b = bitExtract(color, 0, 8), bitExtract(color, 8, 8), bitExtract(color, 16, 8)
		if(r+g+b >= 100) then r = 0 g = 0 b = 0 else r = 255 g = 255 b = 255 end
		local textb = string.gsub(text, "#%x%x%x%x%x%x", "")
		local locsca = math.round(scale, 0)
		if (locsca == 0) then locsca = 1 end
		for oX = -locsca, locsca do 
			for oY = -locsca, locsca do 
				dxDrawText(textb, left + oX, top + oY, right + oX, bottom + oY, tocolor(r, g, b, bitExtract(color, 24, 8)), scale, font, alignX, alignY, clip, wordBreak,postGUI,false,true)
			end
		end

		dxDrawText(text, left, top, right, bottom, color, scale, font, alignX, alignY, clip, wordBreak, postGUI, true, true)
	end
end




local VehicleType = {
	[441] = "RC", 
	[464] = "RC", 
	[594] = "RC", 
	[501] = "RC", 
	[465] = "RC", 
	[564] = "RC", 
}
function GetVehicleType(theVehicle)
	if(isElement(theVehicle)) then theVehicle = getElementModel(theVehicle) end
	return VehicleType[theVehicle] or getVehicleType(theVehicle)
end




local sens = 0.1

function minusx()
	local x,y,z,rx,ry,rz,r,f = getCameraMatrix()
	setCameraMatrix(x-sens,y,z,rx,ry,rz,r,f )
	outputChatBox((x-4000).." "..(y-4000).." "..z-4000)
end

function minusy()
	local x,y,z,rx,ry,rz,r,f = getCameraMatrix()
	setCameraMatrix(x,y-sens,z,rx,ry,rz,r,f )
	outputChatBox((x-4000).." "..(y-4000).." "..z-4000)
end


function plusx()
	local x,y,z,rx,ry,rz,r,f = getCameraMatrix()
	setCameraMatrix(x+sens,y,z,rx,ry,rz,r,f )
	outputChatBox((x-4000).." "..(y-4000).." "..z-4000)
end

function plusy()
	local x,y,z,rx,ry,rz,r,f = getCameraMatrix()
	setCameraMatrix(x,y+sens,z,rx,ry,rz,r,f )
	outputChatBox((x-4000).." "..(y-4000).." "..z-4000)
end

function plusz()
	local x,y,z,rx,ry,rz,r,f = getCameraMatrix()
	setCameraMatrix(x,y,z+sens,rx,ry,rz,r,f )
	outputChatBox((x-4000).." "..(y-4000).." "..z-4000)
end

function minusz()
	local x,y,z,rx,ry,rz,r,f = getCameraMatrix()
	setCameraMatrix(x,y,z-sens,rx,ry,rz,r,f )
	outputChatBox((x-4000).." "..(y-4000).." "..z-4000)
end






local Collections = {
	[953] = {
		["San Fierro"] = {
			[1] = {-2657, 1564, -6}, 
			[2] = {-1252, 501, -8}, 
			[3] = {-1625, 4, -10}, 
			[4] = {-1484, 1489, -10}, 
			[5] = {-2505.4, 1543.7, -22.6}, 
			[6] = {-2727, -469, -5}, 
			[7] = {-1364, 390, -5}, 
		},
		["The Visage"] = {
			[8] = {2090, 1898, 8}, 
		},
		["Bone County"] = {
			[9] = {796, 2939, -5}, 
		},
		["The Sherman Dam"] = {
			[10] = {-783, 2116, 35}, 
		},
		["Verdant Bluffs"] = {
			[11] = {979, -2210, -3}, 
		},
		["Mount Chiliad"] = {
			[12] = {-2889, -1042, -9}, 
		},
		["Garver Bridge"] = {
			[13] = {-1266, 966, -10}, 
		},
		["Red County"] = {
			[14] = {-1013, 478, -7}, 
			[15] = {486, -253, -4}, 
			[16] = {40, -531, -8}, 
			[17] = {-765, 247, -8}, 
			[18] = {2767, 470, -8}, 
			[19] = {2179, 235, -5}, 
		},
		["Flint County"] = {
			[20] = {-90, -910, -5}, 
			[21] = {26.4, -1320.9, -10}, 
			[22] = {-207, -1682, -8}, 
			[23] = {-1175, -2639, -2.5}, 
			[24] = {-1097, -2858, -8}, 
		},
		["Tierra Robada"] = {
			[25] = {-832, 925, -2}, 
			[26] = {-659, 874, -2}, 
			[27] = {-955, 2628, 35}, 
			[28] = {-1066, 2197, 32}, 
			[29] = {-821, 1374, -8}, 
			[30] = {-2110.5, 2329.7, -7.5}, 
			[31] = {-1538, 1708, -3.3}, 
			[32] = {-2685, 2153, -5}, 
		},
		["Come-A-Lot"] = {
			[33] = {2130, 1152, 7}, 
		},
		["Fisher's Lagoon"] = {
			[34] = {2098, -108, -2}, 
		},
		["Pilgrim"] = {
			[35] = {2531, 1569, 9}, 
		},
		["Pirates in Men's Pants"] = {
			[36] = {2013, 1670, 7}, 
		},
		["Whetstone"] = {
			[37] = {-1672, -1641, -2}, 
		},
		["Marina"] = {
			[38] = {723, -1586, -3}, 
		},
		["Las Venturas"] = {
			[39] = {2998, 2998, -10}, 
		},
		["Glen Park"] = {
			[40] = {1968, -1203, 17}, 
		},
		["Los Santos"] = {
			[41] = {67, -1018, -5}, 
			[42] = {2327, -2662, -5}, 
			[43] = {1249, -2687, -1}, 
		},
		["Santa Maria Beach"] = {
			[44] = {155, -1975, -8}, 
		},
		["Roca Escalante"] = {
			[45] = {2578, 2382, 16}, 
		},
		["Playa del Seville"] = {
			[46] = {2945.1, -2051.9, -3}, 
		},
		["Mulholland"] = {
			[47] = {1279, -806, 85}, 
		},
		["Verona Beach"] = {
			[48] = {725, -1849, -5}, 
		},
		["Ocean Docks"] = {
			[49] = {2750, -2584, -5}, 
			[50] = {2621, -2506, -5}, 
		},
	},
	[954] = {
		["The Four Dragons Casino"] = {
			[1] = {1934.1, 988.8, 22}, 
		},
		["Rockshore East"] = {
			[2] = {2864, 857, 13}, 
		},
		["Greenglass College"] = {
			[3] = {1084, 1076, 11}, 
		},
		["Las Venturas Airport"] = {
			[4] = {1603, 1435, 11}, 
			[5] = {1521, 1690, 10.6}, 
			[6] = {1393, 1832, 12.3}, 
		},
		["Pilson Intersection"] = {
			[7] = {1376, 2304, 15}, 
		},
		["Yellow Bell Golf Course"] = {
			[8] = {1433, 2796, 20}, 
		},
		["Blackfield Chapel"] = {
			[9] = {1526.2, 751, 29}, 
		},
		["The Visage"] = {
			[10] = {2077, 1912, 14}, 
		},
		["Pirates in Men's Pants"] = {
			[11] = {2003, 1672, 12}, 
		},
		["The Emerald Isle"] = {
			[12] = {2035, 2305, 18}, 
			[13] = {2020, 2352, 11}, 
			[14] = {2173, 2465, 11}, 
			[15] = {2031.3, 2207.3, 11}, 
		},
		["LVA Freight Depot"] = {
			[16] = {1462, 936, 10}, 
		},
		["K.A.C.C. Military Fuels"] = {
			[17] = {2626, 2841, 11}, 
		},
		["Whitewood Estates"] = {
			[18] = {919, 2070, 11}, 
			[19] = {970, 1787, 11}, 
		},
		["Rockshore West"] = {
			[20] = {2071, 712, 11}, 
			[21] = {2125.5, 789.2, 11.4}, 
		},
		["Redsands West"] = {
			[22] = {1680.3, 2226.9, 16.1}, 
			[23] = {1582, 2401, 19}, 
		},
		["Redsands East"] = {
			[24] = {1863, 2314, 15}, 
			[25] = {2058.7, 2159.1, 16}, 
		},
		["Royal Casino"] = {
			[26] = {2274, 1507, 24}, 
		},
		["Julius Thruway East"] = {
			[27] = {2706, 1862.5, 24.4}, 
		},
		["Starfish Casino"] = {
			[28] = {2371, 2009, 15}, 
			[29] = {2588, 1902, 15}, 
			[30] = {2215, 1968, 11}, 
		},
		["Randolph Industrial Estate"] = {
			[31] = {1767, 601, 13}, 
		},
		["Blackfield Intersection"] = {
			[32] = {1362.9, 1015.2, 11}, 
		},
		["Las Venturas"] = {
			[33] = {2054, 2434, 166}, 
			[34] = {984, 2563, 12}, 
			[35] = {2493, 922, 16}, 
		},
		["Creek"] = {
			[36] = {2879, 2522, 11}, 
		},
		["Roca Escalante"] = {
			[37] = {2491, 2263, 15}, 
			[38] = {2583, 2387, 16}, 
		},
		["The Camel's Toe"] = {
			[39] = {2323, 1284, 97}, 
			[40] = {2417, 1281, 21}, 
		},
		["Prickle Pine"] = {
			[41] = {1224, 2617, 11}, 
			[42] = {1768, 2847, 9}, 
			[43] = {1881, 2846, 11}, 
		},
		["Come-A-Lot"] = {
			[44] = {2238, 1135, 49}, 
			[45] = {2108, 1003, 46}, 
			[46] = {2509, 1144, 19}, 
		},
		["Julius Thruway North"] = {
			[47] = {2184, 2529, 11}, 
		},
		["Old Venturas Strip"] = {
			[48] = {2612, 2200, -1}, 
			[49] = {2440.1, 2161.1, 20}, 
		},
		["The Clown's Pocket"] = {
			[50] = {2239, 1839, 18}, 
		},
	},
	[1276] = {
		["San Fierro"] = {
			[1] = {-1504.9, 1374.3, 3.9}, 
		},
		["Bone County"] = {
			[2] = {755.7, 2060.3, 6.7}, 
			[3] = {797.2, 1669.3, 5.3}, 
			[4] = {710.4, 1207.6, 13.8}, 
			[5] = {-101.9, 1228.1, 22.4}, 
		},
		["Avispa Country Club"] = {
			[6] = {-2762.7, -262.4, 7.2}, 
		},
		["Juniper Hollow"] = {
			[7] = {-2317.4, 1066.9, 66.7}, 
		},
		["Fisher's Lagoon"] = {
			[8] = {2102.6, -105.7, 2.2}, 
		},
		["Ocean Flats"] = {
			[9] = {-2797.6, -124.2, 7.2}, 
		},
		["Los Santos International"] = {
			[10] = {2197.9, -2619.7, 13.5}, 
			[11] = {1470.3, -2311.9, 13.5}, 
			[12] = {1651, -2266.8, -1.3}, 
			[13] = {1383.5, -2586.2, 13.5}, 
			[14] = {1627.5, -2286.5, 94.1}, 
		},
		["Come-A-Lot"] = {
			[15] = {2365.6, 1006.3, 10.8}, 
		},
		["Cranberry Station"] = {
			[16] = {-1973.1, 114.8, 30.6}, 
		},
		["City Hall"] = {
			[17] = {-2708, 378, 12}, 
		},
		["Mulholland"] = {
			[18] = {1292, -907.4, 42.9}, 
		},
		["Julius Thruway North"] = {
			[19] = {2225, 2529.6, 17.4}, 
		},
		["Montgomery"] = {
			[20] = {1236.8, 374.4, 19.6}, 
		},
		["Queens"] = {
			[21] = {-2494.8, 314.4, 29.2}, 
		},
		["Doherty"] = {
			[22] = {-2060.1, 254.6, 37.1}, 
			[23] = {-2018.1, -104.8, 35}, 
			[24] = {-2222.5, -302, 42.8}, 
		},
		["Bayside Marina"] = {
			[25] = {-2250.1, 2418.2, 2.5}, 
		},
		["Richman"] = {
			[26] = {782.9, -1019.9, 26.4}, 
		},
		["Calton Heights"] = {
			[27] = {-2173.7, 1213.2, 37.3}, 
		},
		["Vinewood"] = {
			[28] = {745.5, -1381.4, 25.7}, 
		},
		["Verona Beach"] = {
			[29] = {836.4, -1855.6, 8.4}, 
		},
		["Mount Chiliad"] = {
			[30] = {-2229.4, -1741.3, 480.9}, 
			[31] = {-2672.1, -980.7, 1.3}, 
		},
		["LVA Freight Depot"] = {
			[32] = {1752.9, 980.5, 12.9}, 
		},
		["El Quebrados"] = {
			[33] = {-1417.3, 2579, 55.8}, 
		},
		["Tierra Robada"] = {
			[34] = {-943.9, 1432.2, 30.1}, 
		},
		["Redsands East"] = {
			[35] = {1980.7, 2166.1, 11.1}, 
			[36] = {1976.3, 2266.9, 27.2}, 
			[37] = {1972.6, 2294.7, 16.5}, 
			[38] = {1939.4, 2375.5, 23.9}, 
			[39] = {1875.3, 2076.4, 16.1}, 
		},
		["Randolph Industrial Estate"] = {
			[40] = {1628.3, 600.6, 1.8}, 
		},
		["Roca Escalante"] = {
			[41] = {2288.3, 2442.9, 10.8}, 
		},
		["The Camel's Toe"] = {
			[42] = {2339.7, 1305, 67.5}, 
		},
		["Leafy Hollow"] = {
			[43] = {-1104.3, -1639.4, 76.4}, 
		},
		["Caligula's Palace"] = {
			[44] = {2406.2, 1681.4, 14.3}, 
		},
		["Market"] = {
			[45] = {1248.3, -1250, 63.7}, 
			[46] = {1073.8, -1303.7, 17.1}, 
		},
		["Missionary Hill"] = {
			[47] = {-2531.8, -704.7, 139.3}, 
		},
		["Restricted Area"] = {
			[48] = {164.1, 1849.9, 33.9}, 
			[49] = {232, 1858.2, 15.8}, 
		},
		["Idlewood"] = {
			[50] = {2070.5, -1549.5, 13.4}, 
		},
		["Commerce"] = {
			[51] = {1363.4, -1794, 36}, 
			[52] = {1720.8, -1473, 13.6}, 
		},
		["Downtown Los Santos"] = {
			[53] = {1511.6, -1363, 13.9}, 
		},
		["Green Palms"] = {
			[54] = {246.8, 1435.2, 23.4}, 
		},
		["Las Venturas"] = {
			[55] = {2044.4, 2377, 143.6}, 
			[56] = {2809.7, 2972.3, 1.2}, 
		},
		["Santa Maria Beach"] = {
			[57] = {153.8, -1954, 47.9}, 
			[58] = {498.5, -1870.7, 4.7}, 
		},
		["Pilgrim"] = {
			[59] = {2454.5, 1499.5, 11.6}, 
		},
		["Angel Pine"] = {
			[60] = {-2155.8, -2352.2, 30.7}, 
		},
		["Glen Park"] = {
			[61] = {1915.3, -1354.9, 23.4}, 
		},
		["Kincaid Bridge"] = {
			[62] = {-1113.2, 845.5, 3.1}, 
		},
		["Yellow Bell Golf Course"] = {
			[63] = {1488.7, 2773.9, 10.8}, 
			[64] = {1432.6, 2751.3, 19.5}, 
		},
		["Las Payasadas"] = {
			[65] = {-242.2, 2712.4, 66.8}, 
		},
		["Valle Ocultado"] = {
			[66] = {-910.2, 2672.3, 42.4}, 
		},
		["Verdant Bluffs"] = {
			[67] = {1690.8, -1966.3, 8.5}, 
			[68] = {1093.3, -2026, 69}, 
		},
		["Flint Intersection"] = {
			[69] = {-91.1, -1577.9, 2.6}, 
		},
		["Prickle Pine"] = {
			[70] = {1265.5, 2609.4, 10.8}, 
		},
		["Flint Range"] = {
			[71] = {-362.9, -1417.4, 29.6}, 
		},
		["San Fierro Bay"] = {
			[72] = {-2415.2, 1554.3, 26}, 
		},
		["Las Venturas Airport"] = {
			[73] = {1715.4, 1313.3, 10.8}, 
			[74] = {1690, 1484, 11.7}, 
			[75] = {1580.7, 1488.9, 17.2}, 
			[76] = {1617.8, 1440, 25.7}, 
			[77] = {1308.1, 1261.4, 14.3}, 
		},
		["Ganton"] = {
			[78] = {2482.7, -1642.6, 23.4}, 
			[79] = {2320.6, -1631.8, 14.7}, 
		},
		["Las Colinas"] = {
			[80] = {2013.8, -962.7, 42.5}, 
			[81] = {2426.5, -1015.3, 54.3}, 
		},
		["The Visage"] = {
			[82] = {2094.8, 1890.3, 10.4}, 
		},
		["Whetstone"] = {
			[83] = {-1848.5, -1708.7, 41.1}, 
			[84] = {-1619.6, -2690.4, 48.7}, 
		},
		["Red County"] = {
			[85] = {875.3, -589.4, 18}, 
		},
		["Palisades"] = {
			[86] = {-2912.9, 1241.7, 1.4}, 
		},
		["Blueberry"] = {
			[87] = {194.1, -234.6, 1.8}, 
		},
		["Los Santos"] = {
			[88] = {1531, -1370.2, 330.1}, 
		},
		["Rodeo"] = {
			[89] = {401.9, -1624.8, 34.2}, 
		},
		["Easter Bay Airport"] = {
			[90] = {-1539.9, -438.1, 6}, 
			[91] = {-1611.1, -697.1, 2}, 
		},
		["Ocean Docks"] = {
			[92] = {2233.4, -2283.1, 14.4}, 
			[93] = {2768.5, -2568.8, 3}, 
		},
		["East Beach"] = {
			[94] = {2666.1, -1438.7, 16.3}, 
			[95] = {2866.2, -1588.5, 22.4}, 
			[96] = {2820.2, -1467.4, 36.1}, 
			[97] = {2680.1, -1807.3, 31.4}, 
		},
		["Juniper Hill"] = {
			[98] = {-2278.6, 629.8, 53.1}, 
			[99] = {-2446.8, 758, 41.3}, 
		},
		["Downtown"] = {
			[100] = {-1970.2, 706, 48}, 
		},
	}
}









function save()
	local x,y,z = getElementPosition(localPlayer)
	local rx,ry,rz = getElementRotation(localPlayer)
	if(getPedOccupiedVehicle(localPlayer)) then
		x,y,z = getElementPosition(getPedOccupiedVehicle(localPlayer))
		outputChatBox(z-getGroundPosition(x,y,z))
		z = getGroundPosition(x,y,z)
		outputChatBox(math.round(x, 1)..", "..math.round(y, 1)..", "..math.round(z, 1)) 
		rx,ry,rz = getElementRotation(getPedOccupiedVehicle(localPlayer))
		outputChatBox(math.round(rz, 0))
	else
		outputChatBox(math.round(x, 1)..", "..math.round(y, 1)..", "..math.round(z, 1)) 
		outputChatBox(math.round(rz, 0))
	end
	triggerServerEvent("saveserver", localPlayer, localPlayer, x,y,z,rx,ry,rz)
end

function saveauto()
	if(PData["Driver"]) then
		helpmessage("Запись начата!")
		setTimer(function() 
			if(PData["Driver"]["Distance"] > 10) then
				PData["Driver"]["Distance"] = 0
				save()
			end
		end, 50, 0)
	else
		ToolTip("Сядь в машину!")
	end
end


function cursor() 
    if isCursorShowing(thePlayer) then
		showCursor(false)
	else
		showCursor(true)
    end

end


if getPlayerName(localPlayer) == "alexaxel705" or getPlayerName(localPlayer) == "Mishel'"  then
	--[[bindKey("num_6", "down", plusx) 
	bindKey("num_4", "down", minusx) 
	bindKey("num_8", "down", plusy) 
	bindKey("num_2", "down", minusy) 
	bindKey("num_7", "down", plusz) 
	bindKey("num_1", "down", minusz) --]]
	bindKey("num_1", "down", saveauto) 
	bindKey("F2", "down", cursor) 
end
bindKey("num_3", "down", save) -- Для всех

local Day = {
	[1] = "ВС",
	[2] = "ПН",
	[3] = "ВТ",
	[4] = "СР",
	[5] = "ЧТ",
	[6] = "ПТ",
	[7] = "СБ"
}
			
local Month = {
	[1] = "Января",
	[2] = "Февраля",
	[3] = "Марта",
	[4] = "Апреля",
	[5] = "Мая",
	[6] = "Июня",
	[7] = "Июля",
	[8] = "Августа",
	[9] = "Сентября",
	[10] = "Октября",
	[11] = "Ноября",
	[12] = "Декабря"
}

function Set(list)
	local set = {}
	for _, l in ipairs(list) do set[l] = true end
	return set
end

--Путь к картинке, Описание, Стаки, Используемый или нет, вес, цена, {связанные предметы}, Выпадаемый, Объединяемый, размер ячейки
local items = {
	["hp"] = {1240, "", 100, false, 0, 0, false, false, false, {1,1}}, 
	["Бронежилет"] = {1242, "Военый бронежилет", 1, "usearmor", 4650, 2520, false, false, true, {1,1}}, 
	["Канистра"] = {1650, "Десяти литровая канистра с бензином", 1, "usekanistra", 10350, 1000, false, false, false, {1,1}}, 
	["Реликвия"] = {1276, "Древняя статуэтка неизвестного происхождения", 1, false, 760, 10000, false, false, false, {1,1}}, 
	["Подкова"] = {954, "Старая подкова, антиквариат", 1, false, 350, 5000, false, false, false, {1,1}}, 
	["Ракушка"] = {953, "Просто ракушка", 1, false, 10, 50, false, false, false, {1,1}}, 
	["Телефон"] = {330, "Телефон", 1, "usecellphone", 350, 1500, false, false, false, {1,1}}, 
	["Рюкзак"] = {3026, "Обычный рюкзак", 1, "SetupBackpack", 2500, 5000, false, true, false, {1,1}}, 
	["Чемодан"] = {1210, "Обычный чемодан", 1, "SetupBackpack", 1000, 1000, false, true, false, {1,1}}, 
	["Пакет"] = {2663, "Обычный пакет", 1, "SetupBackpack", 10, 1, false, true, false, {1,1}}, 
	["АК-47"] = {355, "Автомат Калашникова\nСтрана: СССР", 1, "useinvweapon", 4300, 4500, false, false, true, {4,2}}, 
	["Базука"] = {359, "Просто базука", 1, "useinvweapon", 10000, 24500, false, false, true, {4,2}}, 
	["Граната"] = {342, "Обычная граната", 25, "useinvweapon", 600, 1700, false, false, true, {1,1}}, 
	["Молотов"] = {344, "Коктейль молотова", 25, "useinvweapon", 800, 2200, false, false, true, {1,1}}, 
	["М16"] = {356, "Автомат М16\nСтрана: США", 1, "useinvweapon", 2880, 6000, false, false, true, {4,2}}, 
	["Кольт 45"] = {346, "Кольт 45 9-мм", 1, "useinvweapon", 1120, 1000, false, false, true, {2,2}}, 
	["USP-S"] = {347, "Пистолет USP-S", 1, "useinvweapon", 1043, 1500, false, false, true, {2,2}}, 
	["Deagle"] = {348, "Пистолет Deagle", 1, "useinvweapon", 1950, 5500, false, false, true, {2,2}}, 
	["Кровь"] = {1580, "Используется для лечения больных", 5, false, 450, 800, false, false, true, {1,1}}, 
	["Pissh"] = {1543, "Шотландское пиво Pissh темное", 1, "usedrink", 450, 140, false, false, false, {1,2}}, 
	["Pissh Gold"] = {1544, "Шотландское пиво Pissh светлое", 1, "usedrink", 430, 120, false, false, false, {1,2}}, 
	["KBeer"] = {1950, "3 Литра светлого немецкого пива KBeer", 1, "usedrink", 3084, 615, false, false, false, {1,2}}, 
	["KBeer Dark"] = {1951, "3 Литра темного немецкого пива KBeer", 1, "usedrink", 3084, 735, false, false, false, {1,2}}, 
	["isabella"] = {1669, "Вино", 1, "usedrink", 1043, 515, false, false, false, {1,2}}, 
	["Фекалии"] = {16444, "Для одних - обычное говно\nДля других - сладкий хлебушек", 10, "eatcrap", 150, 0, false, false, true, {1,1}}, 
	["CoK"] = {2670, "Пачка сигарет CoK", 1, "usesmoke", 5, 20, false, false, false, {1,1}}, 
	["Сигарета"] = {3027, "Просто сигарета", 20, "usesmoke", 0.2, 1, {["сигареты"] = {"CoK"}}, false, false, {1,1}}, 
	["Mossberg"] = {349, "Дробовик Mossberg 500", 1, "useinvweapon", 3300, 4700, false, false, true, {1,1}}, 
	["Sawed-Off"] = {350, "Дробовик Sawed-Off", 1, "useinvweapon", 2500, 5500, false, false, true, {1,1}}, 
	["SPAS-12"] = {351, "Дробовик SPAS-12", 1, "useinvweapon", 4400, 6500, false, false, true, {1,1}}, 
	["Узи"] = {352, "Микро Узи", 1, "useinvweapon", 2650, 1750, false, false, true, {1,1}}, 
	["MP5"] = {353, "Просто MP5", 1, "useinvweapon", 2660, 2000, false, false, true, {1,1}}, 
	["Tec-9"] = {372, "Просто Tec-9", 1, "useinvweapon", 1400, 1500, false, false, true, {1,1}}, 
	["ИЖ-12"] = {357, "Просто ИЖ-12", 1, "useinvweapon", 3100, 6500, false, false, true, {5,2}}, 
	["M40"] = {358, "Просто M40", 1, "useinvweapon", 6570, 10000, false, false, true, {5,2}}, 
	["Dildo XXL"] = {321, "Просто Dildo XXL", 1, "useinvweapon", 760, 4350, false, false, true, {1,1}}, 
	["Dildo"] = {322, "Просто Dildo", 1, "useinvweapon", 540, 1600, false, false, true, {1,1}}, 
	["Вибратор"] = {323, "Просто Vibrator", 1, "useinvweapon", 1100, 3000, false, false, true, {1,1}}, 
	["Клюшка"] = {333, "Клюшка для гольфа", 1, "useinvweapon", 2500, 4000, false, false, true, {1,1}}, 
	["Лопата"] = {337, "Обычная лопата", 1, "useinvweapon", 1500, 800, false, false, true, {1,1}}, 
	["Бита"] = {336, "Бейсбольная бита", 1, "useinvweapon", 3000, 2000, false, false, true, {1,1}}, 
	["Дубинка"] = {334, "Полицейская дубинка", 1, "useinvweapon", 2400, 3000, false, false, true, {1,1}}, 
	["Нож"] = {335, "Охотничий нож", 1, "useinvweapon", 160, 450, false, false, true, {1,1}}, 
	["Катана"] = {339, "Катана настоящего якудзы", 1, "useinvweapon", 750, 1350, false, false, true, {1,1}}, 
	["Камера"] = {367, "Обычная любительская фотокамера", 1, "useinvweapon", 570, 12000, false, false, true, {1,1}}, 
	["Огнетушитель"] = {366, "Обычный огнетушитель", 1, "useinvweapon", 5000, 150, false, false, true, {1,1}}, 
	["Спрей"] = {365, "Обычный спрей", 1, "useinvweapon", 340, 250, false, false, true, {1,1}}, 
	["Огнемет"] = {361, "Обычный огнемет", 1, "useinvweapon", 3340, 9250, false, false, true, {1,1}}, 
	["Бензопила"] = {341, "Просто бензопила", 1, "useinvweapon", 12500, 7700, false, false, true, {3,3}}, 

	["Лазерный прицел"] = {"invobject/laser.png", "Лазерный прицел", 1, false, 420, 6800, {["лазер"] = {"M40", "АК-47", "М16", "ИЖ-12", "SPAS-12", "Sawed-Off", "Mossberg", "Tec-9", "MP5", "Узи", "Кольт 45", "USP-S", "Deagle"}}, false, false, {1,1}}, 

	["9-мм"] = {18044, "В настоящий момент используются во: \nВсех пистолетах, узи", 250, false, 6, 5, {["патроны"] = {"Tec-9", "MP5", "Узи", "Кольт 45", "USP-S", "Deagle"}}, false, false, {1,1}}, 
	["5.56-мм"] = {18044, "В настоящий момент используются в М16", 250, false, 3, 7, {["патроны"] = {"М16"}}, false, false, {1,1}}, 
	["7.62-мм"] = {18044, "В настоящий момент используются для снайперской винтовки, АК-47", 250, false, 7, 10, {["патроны"] = {"M40", "АК-47"}}, false, false, {1,1}}, 
	["18.5-мм"] = {18044, "В настоящий момент используются во всех дробовиках и винтовке ИЖ-12", 250, false, 13, 25, {["патроны"] = {"ИЖ-12", "SPAS-12", "Sawed-Off", "Mossberg"}}, false, false, {1,1}}, 
	["Ракета"] = {345, "Используется для обычной базуки", 250, false, 1200, 500, {["патроны"] = {"Базука"}}, false, false, {1,1}}, 

	["Кулак"] = {1666, nil, 1, "useinvweapon", 0, 0, false, false, false, {1,1}}, 

	["Конопля"] = {823, "Сырые листья конопли, могут быть посажены на землю или траву.\nТак же используются для получения шмали.", 100, "CreateCanabis", 260, 760, false, true, false, {1,1}}, 
	["Кока"] = {782, "Кока приобрела широкую известность как сырьё для изготовления кокаина — наркотика из класса стимуляторов", 25, "CreateCoka", 625, 2500, false, true, false, {1,1}}, 
	["Косяк"] = {3027, "Косяк, вызывает зависимость, восстанавливает жизни", 20, "usedrugs", 1, 16000, false, true, true, {1,1}}, 
	["Спанк"] = {1279, "Спанк, вызывает зависимость", 10, "usedrugs", 100, 1000, false, true, true, {1,1}}, 
	["Удочка"] = {338, "Рыболовная удочка", 1, "useinvweapon", 400, 700, false, false, true, {1,1}}, 
	["Рыба"] = {1600, "Рыба", 1, false, 0, 0, false, false, false, {1,1}}, 
	["Черепаха"] = {1609, "Морская черепаха", 1, false, 0, 15700, false, false, false, {1,1}}, 
	["Акула"] = {1608, "Морская акула", 1, false, 0, 9800, false, false, false, {1,1}}, 
	["Дельфин"] = {1607, "Морской дельфин", 1, false, 0, 5300, false, false, false, {1,1}}, 
	["Парашют"] = {371, "Парашют", 1, "useinvweapon", 400, 700, false, true, true, {2,3}}, 
	
	["Запаска"] = {1025, "Запасное автомобильное колесо", 1, "usezapaska", 16300, 5, false, true, true, {1,1}}, 
	["Алкоголь"] = {2900, "Алкоголь", 1, false, 40000, 600, false, true, false, {2,2}}, 
	["Скот"] = {11470, "Скот", 1, false, 90000, 700, false, true, false, {1,1}}, 
	["Мясо"] = {2805, "Мясо", 1, false, 36000, 330, false, true, false, {1,1}}, 
	["Нефть"] = {3632, "Нефть", 1, false, 136000, 1500, false, true, false, {2,3}}, 
	["Пропан"] = {1370, "Пропан", 1, false, 55000, 175, false, true, false, {2,3}}, 
	["Химикаты"] = {1218, "Химикаты", 1, false, 92000, 350, false, true, false, {2,3}}, 
	["Удобрения"] = {1222, "Удобрения", 1, false, 41000, 150, false, true, false, {2,3}}, 
	["Бензин"] = {1225, "Бензин", 1, false, 56000, 250, false, true, false, {2,3}}, 
	["Зерно"] = {1453, "Зерно", 1, false, 2500, 50, false, true, false, {1,1}}, 
	["Газета"] = {2674, "Обычная газета", 1, "usenewspaper", 45, 20, false, false, false, {1,1}}, 
	["Деньги"] = {1212, "Деньги", 99999999, false, 0.01, 1, false, false, false, {1,1}}, 
	["Кредитка"] = {1581, "Банковская кредитная карта", 1, false, 100, 1, false, false, false, {1,1}}, 
}



function getItems()
	return items
end



local WeaponAmmo = {
	[30] = "7.62-мм",
	[31] = "5.56-мм",
	[16] = "Граната",
	[18] = "Молотов",
	[22] = "9-мм",
	[23] = "9-мм",
	[24] = "9-мм",
	[25] = "18.5-мм",
	[26] = "18.5-мм",
	[27] = "18.5-мм",
	[28] = "9-мм",
	[29] = "9-мм",
	[32] = "9-мм",
	[33] = "18.5-мм",
	[34] = "7.62-мм",
	[35] = "Ракета", 
	[46] = "Парашют",
}


local WeaponTiming = {
	[16] = 1500,
	[17] = 1500,
	[18] = 1500
}


local WeaponNamesArr = {
	["АК-47"] = 30,
	["Граната"] = 16,
	["Молотов"] = 18,
	["Кольт 45"] = 22,
	["USP-S"] = 23,
	["Deagle"] = 24,
	["М16"] = 31,
	["Mossberg"] = 25,
	["Sawed-Off"] = 26,
	["SPAS-12"] = 27,
	["Узи"] = 28,
	["MP5"] = 29,
	["Tec-9"] = 32,
	["ИЖ-12"] = 33,
	["M40"] = 34,
	["Dildo XXL"] = 10,
	["Dildo"] = 11,
	["Вибратор"] = 12,
	["Клюшка"] = 2,
	["Бита"] = 5,
	["Дубинка"] = 3,
	["Лопата"] = 6,
	["Камера"] = 43,
	["Огнетушитель"] = 42,
	["Спрей"] = 41,
	["Базука"] = 35,
	["Огнемет"] = 37,
	["Бензопила"] = 9,
	["Нож"] = 4,
	["Катана"] = 8, 
	["Удочка"] = 7,
	["Парашют"] = 46,
	["Рюкзак"] = 3026,
	["Чемодан"] = 1210,
	["Канистра"] = 1650,
	["Пакет"] = 2663,
	["Запаска"] = 1025,
	["Нефть"] = 3632, 
	["Пропан"] = 1370, 
	["Химикаты"] = 1218,
	["Бензин"] = 1225, 
	["Удобрения"] = 1222, 
	["Алкоголь"] = 2900, 
	["Мясо"] = 2805, 
	["Зерно"] = 1453
}



local ColorArray = {"000000","F5F5F5",
"2A77A1","840410",
"263739","86446E",
"D78E10","4C75B7",
"BDBEC6","5E7072",
"46597A","656A79",
"5D7E8D","58595A",
"D6DAD6","9CA1A3",
"335F3F","730E1A",
"7B0A2A","9F9D94",
"3B4E78","732E3E",
"691E3B","96918C",
"515459","3F3E45",
"A5A9A7","635C5A",
"3D4A68","979592",
"421F21","5F272B",
"8494AB","767B7C",
"646464","5A5752",
"252527","2D3A35",
"93A396","6D7A88",
"221918","6F675F",
"7C1C2A","5F0A15",
"193826","5D1B20",
"9D9872","7A7560",
"989586","ADB0B0",
"848988","304F45",
"4D6268","162248",
"272F4B","7D6256",
"9EA4AB","9C8D71",
"6D1822","4E6881",
"9C9C98","917347",
"661C26","949D9F",
"A4A7A5","8E8C46",
"341A1E","6A7A8C",
"AAAD8E","AB988F",
"851F2E","6F8297",
"585853","9AA790",
"601A23","20202C",
"A4A096","AA9D84",
"78222B","0E316D",
"722A3F","7B715E",
"741D28","1E2E32",
"4D322F","7C1B44",
"2E5B20","395A83",
"6D2837","A7A28F",
"AFB1B1","364155",
"6D6C6E","0F6A89",
"204B6B","2B3E57",
"9B9F9D","6C8495",
"4D5D60","AE9B7F",
"406C8F","1F253B",
"AB9276","134573",
"96816C","64686A",
"105082","A19983",
"385694","525661",
"7F6956","8C929A",
"596E87","473532",
"44624F","730A27",
"223457","640D1B",
"A3ADC6","695853",
"9B8B80","620B1C",
"5B5D5E","624428",
"731827","1B376D",
"EC6AAE"}





local SpawnAction = {}
function PlayerSpawn()
	triggerEvent("onClientElementStreamIn", localPlayer)
	local x,y,z = getElementPosition(localPlayer)
	local zone = getZoneName(x,y,z)
	PData["stamina"] = 5+math.floor(getPedStat(localPlayer, 22)/40)
	for v,k in pairs(GPSObject) do
		destroyElement(GPSObject[v])
		GPSObject[v] = nil
		destroyElement(v)
	end
	PInv["player"] = fromJSON(getElementData(localPlayer, "inv"))
	SetupInventory() 
	PData["wasted"] = nil
	SetPlayerHudComponentVisible("all", true)
	
	for i = 1, #SpawnAction do
		triggerEvent(unpack(SpawnAction[i]))
	end
	SpawnAction = {}
end
addEventHandler("onClientPlayerSpawn", getLocalPlayer(), PlayerSpawn)
addEvent("PlayerSpawn", true)
addEventHandler("PlayerSpawn", getRootElement(), PlayerSpawn)


function getArrSize(arr)
	local i = 0
	for _,_ in pairs(arr) do i=i+1 end
	return i
end


function DestroyRadar(name, area)
	local r,g,b,a = getRadarAreaColor(area)
	if(a == 255) then --Анимация
		PData['AlphaRadar'][name] = 255
		PData['DublicateRadar'][name] = setTimer(function(name, area) 
			if(PData['AlphaRadar'][name] == 0) then
				destroyElement(area)
				PData['AlphaRadar'][name] = nil
				PData['DublicateRadar'][name] = nil
			else
				local r,g,b,a = getRadarAreaColor(area)
				setRadarAreaColor(area, r,g,b, PData['AlphaRadar'][name])
				PData['AlphaRadar'][name] = PData['AlphaRadar'][name]-15
			end
		end, 50, 18, name, area)
	else
		destroyElement(area)
	end
end



function SetZoneDisplay(zone)
	if(zone ~= "Unknown") then
		if(zone == "Yellow Bell Station") then zone = "Koyoen Station" end
		
		if(ZonesDisplay[#ZonesDisplay]) then
			if(ZonesDisplay[#ZonesDisplay][3]) then
				if(ZonesDisplay[#ZonesDisplay][3] > 255) then
					ZonesDisplay[#ZonesDisplay][3] = 255 -- Для ускорения
				end
			else
				ZonesDisplay[#ZonesDisplay][3] = "fast"
			end
		end
		ZonesDisplay[#ZonesDisplay+1] = {zone, 0, false}
	end
	
	if(not PData["infopath"][zone]) then
		triggerServerEvent("CreateVehicleNodeMarker", localPlayer, zone)
	end
	
	if(not GroundMaterial[zone]) then
		triggerServerEvent("ZonesGroundPosition", localPlayer, zone)
	end
end
addEvent("SetZoneDisplay", true)
addEventHandler("SetZoneDisplay", getRootElement(), SetZoneDisplay)




function UpdateZones(zones)
	if(zones) then
		if(not ClosedZones) then
			ClosedZones = {}
			local arr = fromJSON(zones)
			for name, v in pairs(arr) do
				if(v[5]) then -- Неизвестные значки
					ClosedZones[name] = createRadarArea(v[1], v[2], v[3], v[4], 0, 0, 0,0)
					for key,theBlips in pairs(PData['blip']) do
						local x,y = getElementPosition(theBlips)
						if(isInsideRadarArea(ClosedZones[name], x, y)) then
							if(not DestroyedBlip[name]) then DestroyedBlip[name] = {} end
							DestroyedBlip[name][#DestroyedBlip[name]+1] = {theBlips, getBlipIcon(theBlips)}
							setBlipIcon(theBlips, 37)
						end
					end
				else
					ClosedZones[name] = createRadarArea(v[1], v[2], v[3], v[4], 0, 0, 0,255)
					for key,theBlips in pairs(PData['blip']) do
						local x,y = getElementPosition(theBlips)
						if(not x) then
							createRadarArea(v[1], v[2], 50,50, 255,0,0,255) 
						end
						if(isInsideRadarArea(ClosedZones[name], x, y)) then
							if(not DestroyedBlip[name]) then DestroyedBlip[name] = {} end
							DestroyedBlip[name][#DestroyedBlip[name]+1] = {getBlipIcon(theBlips), x, y, getElementData(theBlips, 'info')}
							destroyElement(theBlips)
							PData['blip'][key] = nil
						end
					end
				end
			end
		end
	end
end
addEvent("UpdateZones", true)
addEventHandler("UpdateZones", getRootElement(), UpdateZones)














addEventHandler("onClientGUIClick", getResourceRootElement(getThisResource()),  
function()
	local theVehicle = getPedOccupiedVehicle(localPlayer)
	if(getElementData(source, "ped")) then
		playSFX("genrl", 53, 5, false)
		if(getElementData(source, "data") == "SwitchButtonR") then
			NextSkinPlus()
		elseif(getElementData(source, "data") == "SwitchButtonL") then
			NextSkinMinus()
		elseif(getElementData(source, "data") == "SwitchButtonAccept") then
			NextSkinEnter()
		elseif(getElementData(source, "data") == "NewSwitchButtonL") then
			NewNextSkinMinus()
		elseif(getElementData(source, "data") == "NewSwitchButtonAccept") then
			NewNextSkinEnter()
		elseif(getElementData(source, "data") == "NewSwitchButtonR") then
			NewNextSkinPlus()
		end 
	elseif(getElementData(source, "TuningColor1")) then
		OriginVehicleUpgrade(theVehicle)
		local c1,c2,c3,c4 = getVehicleColor(theVehicle)
		if(c1 ~= getElementData(source, "TuningColor1")) then
			setVehicleColor(theVehicle, getElementData(source, "TuningColor1"), c2, c3, c4)
			playSFX("genrl", 53, 5, false)
			helpmessage("Перекрасить\n$500")
		else
			if(getElementData(source, "TuningColor1") ~= ToC1) then
				playSFX("genrl", 53, 6, false)
				triggerServerEvent("BuyColor", localPlayer, c1,c2,c3,c4,500)
			else
				helpmessage("Твой авто уже такого цвета!")
			end
		end
	elseif(getElementData(source, "TuningColor2")) then
		OriginVehicleUpgrade(theVehicle)
		local c1,c2,c3,c4 = getVehicleColor(theVehicle)
		if(c2 ~= getElementData(source, "TuningColor2")) then
			setVehicleColor(theVehicle, c1, getElementData(source, "TuningColor2"), c3, c4)
			playSFX("genrl", 53, 5, false)
			helpmessage("Перекрасить\n$500")
		else
			if(getElementData(source, "TuningColor2") ~= ToC2) then
				playSFX("genrl", 53, 6, false)
				triggerServerEvent("BuyColor", localPlayer, c1,c2,c3,c4,500)
			else
				helpmessage("Твой авто уже такого цвета!")
			end
		end
	end
end)  



function OriginVehicleUpgrade(theVehicle)
	for upgradeKey, upgradeValue in ipairs (getVehicleUpgrades(theVehicle)) do removeVehicleUpgrade(theVehicle, upgradeValue) end
	for upgradeKey, upgradeValue in ipairs (upgrades) do addVehicleUpgrade(theVehicle, upgradeValue) end
	return true
end



local Upgrading = {
	[1] = {
		["text"] = "Двигатель",
		["data"] = {}
	},
	[2] = {
		["text"] = "Турбонаддув",
		["data"] = {}
	},
	[3] = {
		["text"] = "Трансмиссия",
		["data"] = {}
	},
	[4] = {
		["text"] = "Подвеска",
		["data"] = {}
	},
	[5] = {
		["text"] = "Тормоза",
		["data"] = {}
	},
	[6] = {
		["text"] = "Шины",
		["data"] = {}
	},
	[7] = {
		["text"] = "Крыша",
		["data"] = {
			{"Scoop", 1006, 1000},
			{"Alien ver.3", 1032, 10000},
			{"X-Flow ver.1", 1033, 10000},
			{"X-Flow ver.3", 1053, 10000},
			{"Alien ver.5", 1054, 10000},
			{"Alien ver.6", 1055, 10000},
			{"Alien ver.4", 1038, 10000},
			{"X-Flow ver.2", 1035, 10000},
			{"X-Flow ver.4", 1061, 10000},
			{"Alien ver.1", 1067, 10000},
			{"X-Flow ver.5", 1068, 10000},
			{"Covertible", 1103, 10000},
			{"Alien ver.2", 1088, 10000},
			{"X-Flow ver.6", 1091, 10000},
			{"Vinyl Hardtop", 1128, 10000},
			{"Hardtop", 1130, 10000},
			{"Softtop", 1131, 10000}
		}
	},
	[8] = {
		["text"] = "Боковые юбки",
		["data"] = {
			{"noname", 1007, 900},
			{"Alien ver.1", 1026, 10000},
			{"X-Flow ver.1", 1031, 10000},
			{"X-Flow ver.2", 1039, 10000},
			{"Alien ver.2", 1040, 10000},
			{"Chrome ver.1", 1042, 10000},
			{"Alien ver.3", 1047, 10000},
			{"X-Flow ver.3", 1048, 10000},
			{"Alien ver.4", 1056, 10000},
			{"X-Flow ver.4", 1057, 10000},
			{"Alien ver.5", 1069, 10000},
			{"X-Flow ver.5", 1070, 10000},
			{"X-Flow ver.6", 1093, 10000},
			{"Chrome ver.2", 1099, 10000},
			{"Chrome Flames ver.1", 1101, 10000},
			{"Chrome Strip ver.1", 1102, 10000},
			{"Alien ver.6", 1090, 10000},
			{"Chrome Arches", 1106, 10000},
			{"Chrome Strip ver.2", 1107, 10000},
			{"Chrome Trim", 1118, 10000},
			{"Wheelcovers", 1119, 10000},
			{"Chrome Flames ver.2", 1122, 10000},
			{"Chrome Strip ver.3", 1133, 10000},
			{"Chrome Strip ver.4", 1134, 10000},
			{"Chrome Arches", 1124, 10000}
		}
	},
	[9] = {
		["text"] = "Противотуманки",
		["data"] = {
			{"Круглые", 1013, 3500},
			{"Квадратные", 1024, 4500}
		}
	},
	[10] = {
		["text"] = "Выхлопная труба",
		["data"] = {
			{"Upswept", 1018, 2200},
			{"Twin", 1019, 3100},
			{"Large", 1020, 3500},
			{"Medium", 1021, 3000},
			{"Small", 1022, 2500},
			{"Alien ver.1", 1028, 10000},
			{"X-Flow ver.1", 1029, 10000},
			{"Chrome ver.4", 1126, 10000},
			{"Slamin ver.4", 1127, 10000},
			{"Chrome ver.5", 1129, 10000},
			{"Slamin ver.5", 1132, 10000},
			{"Slamin ver.6", 1135, 10000},
			{"Chrome ver.6", 1136, 10000},
			{"Chrome ver.3", 1113, 10000},
			{"Slamin ver.3", 1114, 10000},
			{"Alien ver.2", 1034, 10000},
			{"X-Flow ver.2", 1037, 10000},
			{"Slamin ver.1", 1043, 10000},
			{"Chrome ver.1", 1044, 10000},
			{"X-Flow ver.3", 1045, 10000},
			{"Alien ver.3", 1046, 10000},
			{"X-Flow ver.4", 1059, 10000},
			{"Alien ver.4", 1064, 10000},
			{"Alien ver.5", 1065, 10000},
			{"X-Flow ver.5", 1066, 10000},
			{"Chrome ver.2", 1104, 10000},
			{"Slamin ver.2", 1105, 10000},
			{"Alien ver.6", 1092, 10000},
			{"X-Flow ver.6", 1089, 10000}
		}
	},
	[11] = {
		["text"] = "Колеса",
		["data"] = {
			{"Offroad", 1025, 1000},
			{"Shadow", 1073, 7500},
			{"Mega", 1074, 6000},
			{"Rimshine", 1075, 7000},
			{"Wires", 1076, 7500},
			{"Classic", 1077, 5500},
			{"Twist", 1078, 8500},
			{"Cutter", 1079, 8000},
			{"Switch", 1080, 8300},
			{"Grove", 1081, 6300},
			{"Import", 1082, 11600},
			{"Dollar", 1083, 4500},
			{"Trance", 1084, 3500},
			{"Atomic", 1085, 7200},
			{"Ahab", 1096, 10000},
			{"Virtual", 1097, 10000},
			{"Access", 1098, 10000},
		}
	},
	[12] = {
		["text"] = "Сабвуфер",
		["data"] = {
			{"сабвуфер", 1086, 15000}
		}
	},
	[13] = {
		["text"] = "Гидравлика",
		["data"] = {
			{"гидравлика", 1087, 25000}
		}
	},
	[14] = {
		["text"] = "Винил",
		["data"] = {
			{"Винил 1", 10, 10000},
			{"Винил 2", 11, 10000},
			{"Винил 3", 12, 10000},
			{"Винил 4", 13, 10000}
		}
	},
	[15] = {
		["text"] = "Задний кенгурятник",
		["data"] = {
			{"Chrome", 1109, 10000},
			{"Slamin", 1110, 10000}
		}
	},
	[17] = {
		["text"] = "Нитро",
		["data"] = {
			{"Нитро x2", 1008, 20000},
			{"Нитро x5", 1009, 45000},
			{"Нитро x10", 1010, 78000}
		}
	},
	[16] = {
		["text"] = "Передний кенгурятник",
		["data"] = {
			{"Chrome Grill", 1100, 10000},
			{"Chrome", 1115, 10000},
			{"Slamin", 1116, 10000},
			{"Chrome Bars", 1123, 10000},
			{"Chrome Lights", 1125, 10000}
		}
	},
	[18] = {
		["text"] = "Спойлер",
		["data"] = {
			{"PRO", 1000, 1100},
			{"WIN", 1001, 1200},
			{"Drag", 1002, 1250},
			{"Alpha", 1003, 1400},
			{"Fury", 1023, 1500},
			{"Alien ver.1", 1049, 10000},
			{"X-Flow ver.1", 1050, 10000},
			{"X-Flow ver.2", 1060, 10000},
			{"Alien ver.2", 1058, 10000},
			{"Alien ver.3", 1138, 10000},
			{"X-Flow ver.3", 1139, 10000},
			{"X-Flow ver.4", 1146, 10000},
			{"Alien ver.4", 1147, 10000},
			{"Alien ver.5", 1162, 10000},
			{"X-Flow ver.6", 1163, 10000},
			{"Alien ver.6", 1164, 10000},
			{"X-Flow ver.5", 1158, 10000}
		}
	},
	[19] = {
		["text"] = "Капот",
		["data"] = {
			{"ver.1", 1111, 10000},
			{"ver.2", 1112, 10000},
			{"ver.3", 1142, 10000},
			{"ver.4", 1143, 10000},
			{"ver.5", 1144, 10000},
			{"ver.6", 1145, 10000}
		}
	},
	[20] = {
		["text"] = "Передний бампер",
		["data"] = {
			{"Chrome ver.1", 1117, 10000},
			{"X-Flow ver.1", 1152, 10000},
			{"Alien ver.1", 1153, 10000},
			{"Alien ver.2", 1155, 10000},
			{"X-Flow ver.2", 1157, 10000},
			{"Alien ver.3", 1160, 10000},
			{"X-Flow ver.3", 1165, 10000},
			{"Alien ver.4", 1166, 10000},
			{"Alien ver.5", 1169, 10000},
			{"X-Flow ver.4", 1170, 10000},
			{"Alien ver.6", 1171, 10000},
			{"X-Flow ver.5", 1172, 10000},
			{"X-Flow ver.6", 1173, 10000},
			{"Chrome ver.2", 1174, 10000},
			{"Chrome ver.3", 1176, 10000},
			{"Chrome ver.4", 1179, 10000},
			{"Slamin ver.1", 1181, 10000},
			{"Chrome ver.5", 1182, 10000},
			{"Slamin ver.2", 1185, 10000},
			{"Slamin ver.3", 1188, 10000},
			{"Chrome ver.6", 1189, 10000},
			{"Slamin ver.4", 1190, 10000},
			{"Chrome ver.7", 1191, 10000}
		}
	},
	[21] = {
		["text"] = "Верх",
		["data"] = {
			{"Champ", 1004, 2300},
			{"Fury", 1005, 2250},
			{"Race", 1011, 2300},
			{"Worx", 1012, 2250}
		}
	},
	[22] = {
		["text"] = "Задний бампер",
		["data"] = {
			{"X-Flow ver.1", 1140, 10000},
			{"Alien ver.2", 1141, 10000},
			{"X-Flow ver.2", 1148, 10000},
			{"Alien ver.3", 1149, 10000},
			{"Alien ver.4", 1150, 10000},
			{"X-Flow ver.3", 1151, 10000},
			{"Alien ver.5", 1154, 10000},
			{"X-Flow ver.4", 1156, 10000},
			{"Alien ver.6", 1159, 10000},
			{"X-Flow ver.5", 1161, 10000},
			{"X-Flow ver.6", 1167, 10000},
			{"Alien ver.1", 1168, 10000},
			{"Slamin ver.1", 1175, 10000},
			{"Slamin ver.2", 1177, 10000},
			{"Slamin ver.3", 1178, 10000},
			{"Chrome ver.1", 1180, 10000},
			{"Slamin ver.4", 1183, 10000},
			{"Chrome ver.2", 1184, 10000},
			{"Slamin ver.5", 1186, 10000},
			{"Chrome ver.3", 1187, 10000},
			{"Chrome ver.4", 1192, 10000},
			{"Slamin ver.5", 1193, 10000}
		}
	},
	--[[[23] = {
		["text"] = "Цвет",
		["data"] = {
			{"Цвет 1", "color1", 100},
			{"Цвет 2", "color2", 100},
		}
	}, --]]
}





local OrigX, OrigY, OrigZ = false
function CameraTuning(handl, othercomp)
	local theVehicle = getPedOccupiedVehicle(localPlayer)
	ToC1, ToC2, ToC3, ToC4 = getVehicleColor(theVehicle)
	upgrades = getVehicleUpgrades(theVehicle)
	OrigX, OrigY, OrigZ = getElementPosition(theVehicle)
	setCameraMatrix (OrigX-5, OrigY+4,OrigZ+1, OrigX, OrigY, OrigZ)
	showCursor(true)

	LoadUpgrade(true, handl, othercomp)

	
	local x,y = guiGetScreenSize()
	local S = 60
	local PosX=0
	local PosY=y-((y/S)*13)

	for slot = 1, #ColorArray do
		local r,g,b = hex2rgb(ColorArray[slot])
		if(slot <= 10) then
			TCButton[slot] = guiCreateButton(PosX+((x/S)*(slot-1)), PosY, x/S, y/S, slot, false)
		elseif(slot <= 20) then
			TCButton[slot] = guiCreateButton(PosX+((x/S)*(slot-11)), PosY+(y/S), x/S, y/S, slot, false)
		elseif(slot <= 30) then
			TCButton[slot] = guiCreateButton(PosX+((x/S)*(slot-21)), PosY+(y/S)*2, x/S, y/S, slot, false)
		elseif(slot <= 40) then
			TCButton[slot] = guiCreateButton(PosX+((x/S)*(slot-31)), PosY+(y/S)*3, x/S, y/S, slot, false)
		elseif(slot <= 50) then
			TCButton[slot] = guiCreateButton(PosX+((x/S)*(slot-41)), PosY+(y/S)*4, x/S, y/S, slot, false)
		elseif(slot <= 60) then
			TCButton[slot] = guiCreateButton(PosX+((x/S)*(slot-51)), PosY+(y/S)*5, x/S, y/S, slot, false)
		elseif(slot <= 70) then
			TCButton[slot] = guiCreateButton(PosX+((x/S)*(slot-61)), PosY+(y/S)*6, x/S, y/S, slot, false)
		elseif(slot <= 80) then
			TCButton[slot] = guiCreateButton(PosX+((x/S)*(slot-71)), PosY+(y/S)*7, x/S, y/S, slot, false)
		elseif(slot <= 90) then
			TCButton[slot] = guiCreateButton(PosX+((x/S)*(slot-81)), PosY+(y/S)*8, x/S, y/S, slot, false)
		elseif(slot <= 100) then
			TCButton[slot] = guiCreateButton(PosX+((x/S)*(slot-91)), PosY+(y/S)*9, x/S, y/S, slot, false)
		elseif(slot <= 110) then
			TCButton[slot] = guiCreateButton(PosX+((x/S)*(slot-101)), PosY+(y/S)*10, x/S, y/S, slot, false)
		elseif(slot <= 120) then
			TCButton[slot] = guiCreateButton(PosX+((x/S)*(slot-111)), PosY+(y/S)*11, x/S, y/S, slot, false)
		elseif(slot <= 130) then
			TCButton[slot] = guiCreateButton(PosX+((x/S)*(slot-121)), PosY+(y/S)*12, x/S, y/S, slot, false)
		end
		guiSetAlpha(TCButton[slot], 0)
		setElementData(TCButton[slot], "TuningColor1", slot-1)
	end
	guiSetAlpha(TCButton[ToC1+1], 0.5)
	
	local PosX=0+(x/S*11)

	for slot = 1, #ColorArray do
		local r,g,b = hex2rgb(ColorArray[slot])
		if(slot <= 10) then
			TCButton2[slot] = guiCreateButton(PosX+((x/S)*(slot-1)), PosY, x/S, y/S, slot, false)
		elseif(slot <= 20) then
			TCButton2[slot] = guiCreateButton(PosX+((x/S)*(slot-11)), PosY+(y/S), x/S, y/S, slot, false)
		elseif(slot <= 30) then
			TCButton2[slot] = guiCreateButton(PosX+((x/S)*(slot-21)), PosY+(y/S)*2, x/S, y/S, slot, false)
		elseif(slot <= 40) then
			TCButton2[slot] = guiCreateButton(PosX+((x/S)*(slot-31)), PosY+(y/S)*3, x/S, y/S, slot, false)
		elseif(slot <= 50) then
			TCButton2[slot] = guiCreateButton(PosX+((x/S)*(slot-41)), PosY+(y/S)*4, x/S, y/S, slot, false)
		elseif(slot <= 60) then
			TCButton2[slot] = guiCreateButton(PosX+((x/S)*(slot-51)), PosY+(y/S)*5, x/S, y/S, slot, false)
		elseif(slot <= 70) then
			TCButton2[slot] = guiCreateButton(PosX+((x/S)*(slot-61)), PosY+(y/S)*6, x/S, y/S, slot, false)
		elseif(slot <= 80) then
			TCButton2[slot] = guiCreateButton(PosX+((x/S)*(slot-71)), PosY+(y/S)*7, x/S, y/S, slot, false)
		elseif(slot <= 90) then
			TCButton2[slot] = guiCreateButton(PosX+((x/S)*(slot-81)), PosY+(y/S)*8, x/S, y/S, slot, false)
		elseif(slot <= 100) then
			TCButton2[slot] = guiCreateButton(PosX+((x/S)*(slot-91)), PosY+(y/S)*9, x/S, y/S, slot, false)
		elseif(slot <= 110) then
			TCButton2[slot] = guiCreateButton(PosX+((x/S)*(slot-101)), PosY+(y/S)*10, x/S, y/S, slot, false)
		elseif(slot <= 120) then
			TCButton2[slot] = guiCreateButton(PosX+((x/S)*(slot-111)), PosY+(y/S)*11, x/S, y/S, slot, false)
		elseif(slot <= 130) then
			TCButton2[slot] = guiCreateButton(PosX+((x/S)*(slot-121)), PosY+(y/S)*12, x/S, y/S, slot, false)
		end
		guiSetAlpha(TCButton2[slot], 0)
		setElementData(TCButton2[slot], "TuningColor2", slot-1)
	end
	guiSetAlpha(TCButton2[ToC2+1], 0.5)
end
addEvent("CameraTuning", true )
addEventHandler("CameraTuning", getRootElement(), CameraTuning)


	



local vinyl_vehicles={
    [483] = {0}, 
    [534] = {0,1,2}, 
    [535] = {0,1,2}, 
    [536] = {0,1,2}, 
    [558] = {0,1,2}, 
    [559] = {0,1,2}, 
    [560] = {0,1,2}, 
    [561] = {0,1,2}, 
    [562] = {0,1,2}, 
    [565] = {0,1,2}, 
    [567] = {0,1,2}, 
    [575] = {0,1}, 
    [576] = {0,1,2}, 
}

local TuningSelector = 1


local PartsMultipler = {
	["Tires"] = {
		["RC"] = {[1] = {0.20000000298023, 1.1000000238419}, [2] = {0.75, 0.89999997615814}, [3] = {0.49000000953674, 0.5}}, 
		["Trailer"] = {[1] = {0.44999998807907, 0.44999998807907}, [2] = {0.75, 0.75}, [3] = {0.5, 0.5}}, 
		["Plane"] = {[1] = {0.050000000745058, 1.5}, [2] = {0.80000001192093, 45}, [3] = {0.5, 0.85000002384186}}, 
		["Monster Truck"] = {[1] = {0.64999997615814, 0.77999997138977}, [2] = {0.80000001192093, 0.85000002384186}, [3] = {0.5, 0.55000001192093}}, 
		["Train"] = {[1] = {0.97000002861023, 0.97000002861023}, [2] = {0.76999998092651, 0.76999998092651}, [3] = {0.50999999046326, 0.50999999046326}}, 
		["Boat"] = {[1] = {-3.5, 3.5}, [2] = {3.5, 25}, [3] = {0.40000000596046, 1}}, 
		["Bike"] = {[1] = {1.2000000476837, 1.7999999523163}, [2] = {0.81999999284744, 0.89999997615814}, [3] = {0.46000000834465, 0.50999999046326}}, 
		["Automobile"] = {[1] = {0.5, 2.5}, [2] = {0.64999997615814, 0.9200000166893}, [3] = {0.34999999403954, 0.60000002384186}}, 
		["Quad"] = {[1] = {0.69999998807907, 0.69999998807907}, [2] = {0.89999997615814, 0.89999997615814}, [3] = {0.49000000953674, 0.49000000953674}}, 
	}, 
	["Turbo"] = {
		["Automobile"] = {[1] = {0, 2}, [2] = {0.7000000476837, 1}}, 
	}, 
	["Engines"] = {
		["RC"] = {[1] = {0.40000000596046, 20}, [2] = {0.20000000298023, 120}}, 
		["Trailer"] = {[1] = {7.1999998092651, 7.1999998092651}, [2] = {2, 2}}, 
		["Plane"] = {[1] = {0.68000000715256, 6.4000000953674}, [2] = {4, 20}}, 
		["Monster Truck"] = {[1] = {10, 18}, [2] = {2, 4}}, 
		["Train"] = {[1] = {8, 10}, [2] = {1, 3}}, 
		["Quad"] = {[1] = {10, 10}, [2] = {5, 5}}, 
		["BMX"] = {[1] = {7.1999998092651, 10}, [2] = {5, 7}}, 
		["Boat"] = {[1] = {0.20000000298023, 1.2000000476837}, [2] = {1, 1}}, 
		["Bike"] = {[1] = {12, 24}, [2] = {4, 5}}, 
		["Automobile"] = {[1] = {4.8000001907349, 16}, [2] = {1.3999999761581, 20}}, 
		["Unknown"] = {[1] = {8, 8}, [2] = {5, 5}}, 
		["Helicopter"] = {[1] = {6.4000000953674, 6.4000000953674}, [2] = {0.050000000745058, 0.20000000298023}}, 
	}, 
	["Brakes"] = {
		["RC"] = {[1] = {5.5, 5.5}}, 
		["Trailer"] = {[1] = {8, 8}}, 
		["Plane"] = {[1] = {0.0099999997764826, 1.5}}, 
		["Monster Truck"] = {[1] = {3.1700000762939, 7}}, 
		["Helicopter"] = {[1] = {5, 5}}, 
		["BMX"] = {[1] = {19, 19}}, 
		["Boat"] = {[1] = {0.019999999552965, 0.070000000298023}}, 
		["Bike"] = {[1] = {10, 15}}, 
		["Automobile"] = {[1] = {3.5, 15}}, 
		["Train"] = {[1] = {8.5, 8.5}}, 
	}, 
}





function GetVehiclePower(mass, acceleration) return math.ceil(mass/(140)*(acceleration)) end
function GetVehicleTopSpeed(acceleration, dragcoeff, maxvel)
	local pureMax = math.floor(math.sqrt(3300*acceleration/dragcoeff)*1.18) 
	if(pureMax < maxvel) then
		return (1000/348)*pureMax
	else
		return (1000/348)*maxvel
	end
end --При 26.5


function GetVehicleAcceleration(acceleration, tractionMultiplier) 
	local theVehicleType = GetVehicleType(getPedOccupiedVehicle(localPlayer))
	local minacc = PartsMultipler["Engines"][theVehicleType][1][1]-PartsMultipler["Turbo"][theVehicleType][1][1]
	local maxacc = PartsMultipler["Engines"][theVehicleType][1][2]+PartsMultipler["Turbo"][theVehicleType][1][2]
	
	return ((GetValPer(minacc, maxacc, acceleration)*10)/2)+(GetVehicleClutch(tractionMultiplier)/2)
end 



function GetVehicleClutch(tractionMultiplier)
	local theVehicleType = GetVehicleType(getPedOccupiedVehicle(localPlayer))
	return GetValPer(PartsMultipler["Tires"][theVehicleType][1][1], PartsMultipler["Tires"][theVehicleType][1][2], tractionMultiplier)*10
end


function GetVehicleControl(tractionBias)
	local theVehicleType = GetVehicleType(getPedOccupiedVehicle(localPlayer))
	return GetValPer(PartsMultipler["Tires"][theVehicleType][3][1], PartsMultipler["Tires"][theVehicleType][3][2], tractionBias)*10
end


function GetValPer(mins, maxs, raw)
	mins = math.round(mins, 2)
	maxs = math.round(maxs, 2)
	raw = math.round(raw, 2)
    return (raw-mins)/(maxs-mins)*100
end
 


function GetElementAttacker(element)
	local attacker = getElementData(element, "attacker")
	if(attacker) then
		attacker = getPlayerFromName(attacker)
	end
	return attacker
end



function GetVehicleBrakes(brakes, tractionLoss)
	local theVehicleType = GetVehicleType(getPedOccupiedVehicle(localPlayer))
	return ((GetValPer(PartsMultipler["Brakes"][theVehicleType][1][1], PartsMultipler["Brakes"][theVehicleType][1][2], brakes)*10)/2)+
		((GetValPer(PartsMultipler["Tires"][theVehicleType][2][1], PartsMultipler["Tires"][theVehicleType][2][2], tractionLoss)*10)/2)
end



local Tun = {}
local STPER = false
function LoadUpgrade(Update, handl, othercomp)
	Tun = {}
	local theVehicle = getPedOccupiedVehicle(localPlayer)
	if(Update) then
		STPER = getVehicleHandling(theVehicle)
		if(handl) then
			for i = 1, 6 do
				Upgrading[i]["data"] = {}
			end
			local handl = fromJSON(handl)
			Upgrading[1]["data"][1] = {handl[1].." [Установлен]", "Engines", "Установлено"}
			if(handl[2] ~= "") then Upgrading[2]["data"][1] = {handl[2].." [Установлено]", "Turbo", "Установлено"} end
			Upgrading[3]["data"][1] = {handl[3].." [Установлена]", "Transmission", "Установлено"}
			Upgrading[4]["data"][1] = {handl[4].." [Установлена]", "Suspension", "Установлено"}
			Upgrading[5]["data"][1] = {handl[5].." [Установлены]", "Brakes", "Установлено"}
			Upgrading[6]["data"][1] = {handl[6].." [Установлены]", "Tires", "Установлено"}
			local vtype = GetVehicleType(theVehicle)
			for i, arr in pairs(fromJSON(othercomp)) do
				local ks = nil
				if i == "Engines" then ks = 1
				elseif i == "Turbo" then ks = 2
				elseif i == "Transmission" then ks = 3
				elseif i == "Suspension" then ks = 4
				elseif i == "Brakes" then ks = 5
				elseif i == "Tires" then ks = 6 end
				for name, har in pairs(arr) do
					if(vtype == har[1]) then
						Upgrading[ks]["data"][#Upgrading[ks]["data"]+1] = {name, i, 0}
					end
				end
			end
		end
	end
	ChangeInfo("")
	TuningSelector = 1
	tuningList=true
	PText["tuning"] = {}
	local FH = dxGetFontHeight(scale, "default-bold")*1.1
	local x,y = 30*scalex, (screenHeight/4)

	local TotalCount = 1
	for i = 1, #Upgrading do
		local count = 0
		for item, key in pairs(Upgrading[i]["data"]) do
			if(LatencyUpgrade(key[2])) then
				count=count+1
			end
		end
		if(count > 0) then
			local color = tocolor(98, 125, 152, 255)
			if(TuningSelector == TotalCount) then
				color = tocolor(201, 219, 244, 255)
			end
			PText["tuning"][TotalCount] = {Upgrading[i]["text"], x, y+(FH*TotalCount), screenWidth, screenHeight, color, scale, "default-bold", "left", "top", false, false, false, true, false, 0, 0, 0, {["border"] = true}, {"TuningListOpen", localPlayer, i}}
			TotalCount=TotalCount+1
		end
	end

	setCameraMatrix (OrigX-5, OrigY+4,OrigZ+1, OrigX, OrigY, OrigZ)
	UpdateTuningPerformans()
end



local NEWPER = false
function UpdateTuningPerformans(NewDat)
	local Power = GetVehiclePower(STPER["mass"], STPER["engineAcceleration"])
	local Acceleration = GetVehicleAcceleration(STPER["engineAcceleration"], STPER["tractionMultiplier"])
	local TopSpeed = math.floor(GetVehicleTopSpeed(STPER["engineAcceleration"], STPER["dragCoeff"], STPER["maxVelocity"])/(1000/348))
	local Brake = math.floor(STPER["brakeBias"]*100)..'/'..(100)-math.floor(STPER["brakeBias"]*100)
	local Trans = STPER["driveType"].." "..STPER["numberOfGears"]
	local Control = GetVehicleControl(STPER["tractionBias"])
	
	if(NewDat) then
		NEWPER = getVehicleHandling(getPedOccupiedVehicle(localPlayer))
		local nTopSpeed = (GetVehicleTopSpeed(NEWPER["engineAcceleration"], NEWPER["dragCoeff"], NEWPER["maxVelocity"])/(1000/348))-(GetVehicleTopSpeed(STPER["engineAcceleration"], STPER["dragCoeff"], STPER["maxVelocity"])/(1000/348))
		if(nTopSpeed > 0) then TopSpeed = TopSpeed..'+'..nTopSpeed
		elseif(nTopSpeed < 0) then TopSpeed = TopSpeed..''..nTopSpeed end
		
		local nPower = GetVehiclePower(NEWPER["mass"], NEWPER["engineAcceleration"])-GetVehiclePower(STPER["mass"], STPER["engineAcceleration"])
		if(nPower > 0) then Power = Power..'+'..nPower
		elseif(nPower < 0) then Power = Power..''..nPower end
		Acceleration = GetVehicleAcceleration(NEWPER["engineAcceleration"], NEWPER["tractionMultiplier"])-GetVehicleAcceleration(STPER["engineAcceleration"], STPER["tractionMultiplier"])
		Brake = math.floor(NEWPER["brakeBias"]*100)..'/'..(100)-math.floor(NEWPER["brakeBias"]*100)
		Trans = NEWPER["driveType"].." "..NEWPER["numberOfGears"]
		Control = GetVehicleControl(NEWPER["tractionBias"])
	else
		triggerServerEvent("UpgradePreload", localPlayer, localPlayer)
		NEWPER = false
	end
	local sx,sy = (screenWidth/2.55), screenHeight-(150*scaley)
	
	PText["tuning"]["topspeed"] = {Text("Макс скорость").." "..TopSpeed.." "..Text("КМ/Ч"), sx, sy-(30*scaley), screenWidth, screenHeight, tocolor(255, 255, 255, 255), scale*0.7, "default-bold", "left", "top", false, false, false, true, false, 0, 0, 0, {["border"] = true}}
	PText["tuning"]["power"] = {Text("Мощность").." "..Power.." "..Text("Л.С."), sx+(300*scaley), sy-(30*scaley), screenWidth, screenHeight, tocolor(255, 255, 255, 255), scale*0.7, "default-bold", "left", "top", false, false, false, true, false, 0, 0, 0, {["border"] = true}}
	PText["tuning"]["acceleration"] = {Text("Ускорение").." ("..Trans.." АКПП)", sx+(600*scaley), sy-(30*scaley), screenWidth, screenHeight, tocolor(255, 255, 255, 255), scale*0.7, "default-bold", "left", "top", false, false, false, true, false, 0, 0, 0, {["border"] = true}}
	PText["tuning"]["brakes"] = {Text("Тормоза").." "..Brake, sx+(900*scaley), sy-(30*scaley), screenWidth, screenHeight, tocolor(255, 255, 255, 255), scale*0.7, "default-bold", "left", "top", false, false, false, true, false, 0, 0, 0, {["border"] = true}}
	PText["tuning"]["Управление"] = {Text("Управление").." "..Control, sx+(900*scaley), sy-(170*scaley), screenWidth, screenHeight, tocolor(255, 255, 255, 255), scale*0.7, "default-bold", "left", "top", false, false, false, true, false, 0, 0, 0, {["border"] = true}}

end


function TuningListOpen(num, page)
	if(not num) then
		if(Tun["num"]) then
			num = Tun["num"]
		else
			return false
		end
	else
		Tun["num"] = num
	end
	
	local maxpage = math.ceil(#Upgrading[num]["data"]/15)
	TuningSelector = 1
	if(not page or maxpage == 1) then 
		Tun["page"] = 1
	else
		Tun["page"] = Tun["page"]+page
		if(Tun["page"] > maxpage) then
			Tun["page"] = 1
		elseif(Tun["page"] <= 0) then
			Tun["page"] = maxpage
		end
	end
	PText["tuning"] = {}
	local FH = dxGetFontHeight(scale, "default-bold")*1.1
	local x,y = 30*scalex, (screenHeight/4)
	local count = 0
	
	for i = (Tun["page"]*15)-14, Tun["page"]*15 do
		if(Upgrading[num]["data"][i]) then
			count=count+1
			local color = tocolor(150, 150, 150, 255)
			local dat = nil
			local advtext = ""

			if(LatencyUpgrade(Upgrading[num]["data"][i][2])) then
				color = tocolor(98, 125, 152, 255)
				dat = {"BuyTuningShop", localPlayer, Upgrading[num]["data"][i][1], Upgrading[num]["data"][i][2], Upgrading[num]["data"][i][3]}
			else
				advtext = "[недоступно]"
			end
			PText["tuning"][count] = {Upgrading[num]["data"][i][1]..advtext, x, y+(FH*count), screenWidth, screenHeight, color, scale, "default-bold", "left", "top", false, false, false, true, false, 0, 0, 0, {["border"] = true}, dat}
			if(page) then
				if(page < 0) then
					TuningSelector=count
				end
			end
		end
	end
	PText["tuning"][TuningSelector][6] = tocolor(201, 219, 244, 255)
	UpgradePreload(Upgrading[num]["text"], PText["tuning"][TuningSelector][20][3], PText["tuning"][TuningSelector][20][4], PText["tuning"][TuningSelector][20][5])
end
addEvent("TuningListOpen", true )
addEventHandler("TuningListOpen", getRootElement(), TuningListOpen)




function BuyTuningShop(item, upgrd, cost)
	if(cost ~= "Установлено") then
		triggerServerEvent("VehicleUpgrade", localPlayer, upgrd, cost)
		playSFX("genrl", 53, 6, false)
	end
end
addEvent("BuyTuningShop", true )
addEventHandler("BuyTuningShop", getRootElement(), BuyTuningShop)


function BuyUpgrade(handl, othercomp)
	guiSetAlpha(TCButton[ToC1+1], 0)
	guiSetAlpha(TCButton2[ToC2+1], 0)
	ToC1, ToC2, ToC3, ToC4 = getVehicleColor(getPedOccupiedVehicle(localPlayer))
	guiSetAlpha(TCButton[ToC1+1], 0.5)
	guiSetAlpha(TCButton2[ToC2+1], 0.5)
	if(handl) then
		LoadUpgrade(true, handl, othercomp)
	else
		upgrades = getVehicleUpgrades(getPedOccupiedVehicle(localPlayer))
		helpmessage("#009900"..Text("КУПЛЕНО").."!")
		LoadUpgrade()
	end
end
addEvent("BuyUpgrade", true )
addEventHandler("BuyUpgrade", getRootElement(), BuyUpgrade)


function UpgradePreload(razdel, name, upgr, cost) 
	helpmessage("")
	local theVehicle = getPedOccupiedVehicle(localPlayer)


	if(tonumber(upgr)) then
		OriginVehicleUpgrade(theVehicle)
		addVehicleUpgrade(theVehicle, upgr)
		helpmessage(COLOR["DOLLAR"]["HEX"].."$"..cost)
		UpdateTuningPerformans()
	else
		if(cost == "Установлено") then
			UpdateTuningPerformans()
		else
			triggerServerEvent("UpgradePreload", localPlayer, localPlayer, name, upgr)
		end
	end
	
	
	playSFX("genrl", 53, 5, false)
	if(razdel) then
		if razdel == "Выхлопная труба" then
			local x,y,z = getVehicleComponentPosition(theVehicle, "exhaust_ok", "world")
			setCameraMatrix(x+4, y+(0.8) ,z, x, y, z)
		elseif razdel == "Спойлер" then
			local x,y,z = getVehicleComponentPosition(theVehicle, "boot_dummy", "world")
			setCameraMatrix(x+4, y ,z+1, x, y, z)
		elseif razdel == "Задний бампер" then
			local x,y,z = getVehicleComponentPosition(theVehicle, "boot_dummy", "world")
			setCameraMatrix(x+4, y ,z+0.5, x, y, z)
		end
	end
end



function UpgradeServerPreload() 
	helpmessage(COLOR["DOLLAR"]["HEX"]..Text("БЕСПЛАТНО"))
	UpdateTuningPerformans(true)
end
addEvent("UpgradeServerPreload", true )
addEventHandler("UpgradeServerPreload", getRootElement(), UpgradeServerPreload)




function TuningExit()
	local theVehicle = getPedOccupiedVehicle(localPlayer)
	PData["Driver"]["Handling"] = getVehicleHandling(theVehicle)
	setVehicleColor(theVehicle ,ToC1, ToC2, ToC3, ToC4)
	showCursor(false)
	tuningList=false
	for slot = 1, #TCButton do
		destroyElement(TCButton[slot])
	end
	for slot = 1, #TCButton2 do
		destroyElement(TCButton2[slot])
	end
	OriginVehicleUpgrade(theVehicle)
	triggerServerEvent("ExitTuning", localPlayer, theVehicle)
	PText["tuning"] = {}
end





function ValidateMaterialForThree(x,y,z,gz)
	--Исключить: 26, 27
	local materials = {9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,20 ,80 ,81 ,82 ,115 ,116 ,117 ,118 ,119 ,120 ,121 ,122 ,125 ,146 ,147 ,148 ,149 ,150 ,151 ,152 ,153 ,160 ,19 ,21 ,22 ,24 ,25 ,40 ,83 ,84 ,87 ,88 ,100 ,110 ,123 ,124 ,126 ,128 ,129 ,130 ,132 ,133 ,141 ,142 ,145 ,155 ,156}
    local material = GetGroundMaterial(x,y,z,gz)
	for _,k in pairs(materials) do
		if(k == material) then
			return true
		end
	end
	return false
end 


function GetGroundMaterial(x,y,z,gz)
	x, y = math.round(x, 0), math.round(y, 0)
	local material = false
	local zone = getZoneName(x,y,z,false)
	if(GroundMaterial[zone]) then
		if(GroundMaterial[zone][x]) then
			if(GroundMaterial[zone][x][y]) then
				material = GroundMaterial[zone][x][y]
			end
		end
	end
	if(not material) then _,_,_,_,_,_,_,_,material = processLineOfSight(x,y,z,x,y,gz-1, true,false,false,false,false,true,true,true,localPlayer, true) end
	if(not material) then material = 1337 end
	return material
end

function LatencyUpgrade(Upgrade)
	if(not tonumber(Upgrade)) then return true end
	local theVehicle = getPedOccupiedVehicle(localPlayer)
	
	if(Upgrade == 1087) then
		return true
	end
	
	if(Upgrade == 10 or Upgrade == 11 or Upgrade == 12 or Upgrade == 13) then 
		if(vinyl_vehicles[getElementModel(theVehicle)]) then
			return true
		end
	end
	
	addVehicleUpgrade(theVehicle, Upgrade)
	local CurrentUpgrades = getVehicleUpgrades(theVehicle)
	for slot = 0, #CurrentUpgrades do
		if(Upgrade == CurrentUpgrades[slot]) then
			OriginVehicleUpgrade(theVehicle)
			return true
		end
	end
	
	return false
end



function PoliceAddMarker(x, y, z, gpsmessage)
	GPS(x,y,z,gpsmessage)
	helpmessage("#4682B4"..Text("Поступил новый вызов!\n #FFFFFFОтправляйся на #FF0000красный маркер"))
	playSFX("script", 58, math.random(22, 35), false)
end
addEvent("PoliceAddMarker", true)
addEventHandler("PoliceAddMarker", getRootElement(), PoliceAddMarker)




function GPS(x,y,z,info,after)
	local GPSM = createMarker(x, y, z, "checkpoint", 5, 255, 50, 50, 170)
	setElementData(GPSM , "type", "GPS")
	GPSObject[GPSM] = createBlipAttachedTo(GPSM)
	if(x ~= 228 and y ~= 228 and z ~= 228) then
		local px, py, pz = getElementPosition(localPlayer)
		triggerServerEvent("GetPathByCoordsNEW", localPlayer, localPlayer, px, py, pz, x,y,z)
	end
	if(info) then setElementData(GPSM, "info", Text(info)) end
	if(after) then setElementData(GPSM, "after", after) end
	playSFX("script", 217, 0, false)
end
addEvent("AddGPSMarker", true)
addEventHandler("AddGPSMarker", getRootElement(), GPS)




function RemoveGPSMarker(info)
	for k,v in pairs(getElementsByType "marker") do
		if(getElementData(v, "info") == info) then
			destroyElement(GPSObject[v])
			GPSObject[v] = nil
			destroyElement(v)
		end
	end
end
addEvent("RemoveGPSMarker", true)
addEventHandler("RemoveGPSMarker", getRootElement(), RemoveGPSMarker)




function openmap()
	if(isPlayerMapForced()) then
		forcePlayerMap(false)
	else
		forcePlayerMap(true)
	end
end


function hideinv()
	if(PData["Interface"]["Full"]) then
		SetPlayerHudComponentVisible("all", false)
	else
		SetPlayerHudComponentVisible("all", true)
	end
end



function SetPlayerHudComponentVisible(component, show)
	setPlayerHudComponentVisible(component, show)
	if(component == "all") then
		if(show) then
			setPlayerHudComponentVisible("wanted", false)
			setPlayerHudComponentVisible("area_name", false)
			setPlayerHudComponentVisible("vehicle_name", false)
			for name, _ in pairs(PData["Interface"]) do
				PData["Interface"][name] = true
			end
		else
			for name, _ in pairs(PData["Interface"]) do
				PData["Interface"][name] = false
			end
		end
	end
end



function GPSFoundShop(bytype, varname, varval, name) --Тип, имя даты, значение даты, название
	local x,y,z = getElementPosition(localPlayer)
	local pic = false
	local mindist = 9999
	for key,thePickups in pairs(getElementsByType(bytype)) do
		if(getElementData(thePickups, varname) == varval) then
			local x2,y2,z2 = getElementPosition(thePickups)
			local dist = getDistanceBetweenPoints3D(x,y,z,x2,y2,z2)
			if(dist < mindist) then
				mindist = dist
				pic = thePickups
			end
		end
	end
	local x3,y3,z3 = getElementPosition(pic)
	GPS(x3,y3,z3, name)
end
addEvent("GPSFoundShop", true)
addEventHandler("GPSFoundShop", localPlayer, GPSFoundShop)






function MarkerHit(hitPlayer, Dimension)
	if(not Dimension) then return false end
	if(hitPlayer == localPlayer) then
		if(getElementData(source, "type") == "GPS") then
			destroyElement(GPSObject[source])
			GPSObject[source] = nil
			if(getElementData(source, "after")) then 
				playSFX("genrl", 52, 14, false) 
				helpmessage(getElementData(source, "after")) 
			end
			destroyElement(source)
		elseif(getElementData(source, "TrailerInfo")) then
			ChangeInfo(getElementData(source, "TrailerInfo"))
		elseif(getElementData(source, "type") == "Race") then
			NextRaceMarker()
		elseif(getElementData(source, "type") == "RVMarker") then
			local theVehicle = getPedOccupiedVehicle(localPlayer)
			if(theVehicle) then
				if(not PData["MarkerTrigger"]) then
					setPedCanBeKnockedOffBike(localPlayer, false)
					local x,y,z = getElementPosition(theVehicle)
					local _,_,rz = getElementRotation(theVehicle)
					triggerServerEvent("OpenTuning", localPlayer, localPlayer, x,y,getGroundPosition(x,y,z),rz)
					PData["MarkerTrigger"] = true
				else
					PData["MarkerTrigger"] = nil
				end
			end
		elseif(getElementData(source, "type") == "GEnter") then
			local theVehicle = getPedOccupiedVehicle(localPlayer)
			if(theVehicle) then
				setPedCanBeKnockedOffBike(localPlayer, false)
			end
		elseif(getElementData(source, "type") == "GExit") then
			local theVehicle = getPedOccupiedVehicle(localPlayer)
			if(theVehicle) then
				setPedCanBeKnockedOffBike(localPlayer, false)
			end
		elseif(getElementData(source, "type") == "SPRAY") then
			local theVehicle = getPedOccupiedVehicle(localPlayer)
			if(theVehicle) then
				SetZoneDisplay("Pay 'n' Spray")
				local x,y,z,lx,ly,lz = getCameraMatrix()
				local x2, y2, z2 = getElementPosition(source)
				local lx2,ly2,lz2 = getPointInFrontOfPoint(x2, y2, z2+5, 80-tonumber(getElementData(source, "rz")), 20)
				SmoothCameraMove(lx2, ly2, lz2, x2, y2, z2, 1500)
				PData["Pay 'n' Spray Timer"] = setTimer(function(x,y,z,x2,y2,z2)
					SmoothCameraMove(x,y,z,x2,y2,z2, 1500, true)
				end, 3000, 1, x,y,z,x2,y2,z2)
			end
		elseif(getElementData(source, "TriggerBot")) then
			local thePed = FoundPedByTINF(source)
			if(thePed) then
				if(thePed ~= localPlayer) then
					local theVehicle = getPedOccupiedVehicle(localPlayer)
					if(not theVehicle) then
						if(not isPedDoingTask(localPlayer, "TASK_SIMPLE_FIGHT") and not isPedDoingTask(thePed, "TASK_SIMPLE_FIGHT")) then
							if(GetElementAttacker(thePed)) then
								if(getElementHealth(thePed) < 20) then
									triggerServerEvent("PedDialog", localPlayer, localPlayer, thePed)
									setElementData(thePed, "saytome", "true")
								end
								return false
							end
							triggerServerEvent("PedDialog", localPlayer, localPlayer, thePed)
							setElementData(thePed, "saytome", "true")
							PData['dialogPed'] = thePed
						end
					end
				end
			end
		end
	end
end
addEventHandler("onClientMarkerHit", getRootElement(), MarkerHit)



function markerLeave(hitPlayer, Dimension)
	--Костыль, не работает Dimension
	if(hitPlayer == localPlayer) then
		if(getElementData(source, "TriggerBot")) then
			local thePed = FoundPedByTINF(source)
			triggerServerEvent("DialogBreak", localPlayer, localPlayer, false, thePed)
		end
	end
end
addEventHandler("onClientMarkerLeave", getRootElement(), markerLeave)


function FoundPedByTINF(thePed)
	local TINF = getElementData(thePed, "TriggerBot")
	for _,ped in pairs(getElementsByType("ped", getRootElement(), true)) do
		if(getElementData(ped, "TINF") == TINF) then
			return ped
		end
	end
	for _,ped in pairs(getElementsByType("player", getRootElement(), true)) do
		if(getPlayerName(ped) == TINF) then
			return ped
		end
	end
	return false
end


function BankControl(biz, data)
	if(BANKCTL) then
		BANKCTL = false
		PText["bank"] = {}
		showCursor(false)
	else
		bankControlUpdate(biz, data)
	end
end
addEvent("BankControl", true)
addEventHandler("BankControl", localPlayer, BankControl)


function bankControlUpdate(biz, data)
	PText["bank"] = {}
	local m = fromJSON(data)
	local text = "Денег на счету "..COLOR["DOLLAR"]["HEX"].."$"..m[1].." "
	local textWidth = dxGetTextWidth(text, scale*0.8, "default-bold", true)
	PText["bank"][#PText["bank"]+1] = {text, 660*scalex, 400*scaley, screenWidth, screenHeight, tocolor(255, 255, 255, 255), scale*0.8, "default-bold", "left", "top", false, false, false, true, false, 0, 0, 0, {}}
	PText["bank"][#PText["bank"]+1] = {Text("пополнить"), 660*scalex+textWidth, 400*scaley, screenWidth, screenHeight, tocolor(255, 255, 255, 255), scale*0.8, "default-bold", "left", "top", false, false, false, true, false, 0, 0, 0, {["border"] = true, ["line"] = true}, {"CreateButtonInputInt", localPlayer, "bank", "Введи сумму", toJSON{biz}}}
	local textWidth = textWidth+dxGetTextWidth(Text("пополнить").." ", scale*0.8, "default-bold", true)
	PText["bank"][#PText["bank"]+1] = {Text("снять"),  660*scalex+textWidth, 400*scaley, screenWidth, screenHeight, tocolor(255, 255, 255, 255), scale*0.8, "default-bold", "left", "top", false, false, false, true, false, 0, 0, 0, {["border"] = true, ["line"] = true}, {"CreateButtonInputInt", localPlayer, "withdraw", "Введи сумму", toJSON{biz}}}	
	BANKCTL = m[2]
	showCursor(true)
end
addEvent("bankControlUpdate", true)
addEventHandler("bankControlUpdate", localPlayer, bankControlUpdate)





function SetGPS(arr)
	if(PData['gps']) then
		for i, el in pairs(PData['gps']) do
			destroyElement(el)
		end
	end
	PData['gps'] = {}
	arr = fromJSON(arr)
	for i, k in pairs(arr) do
		local id = (#arr+1)-i
		PData['gps'][id] = createRadarArea(k[1]-10, k[2]-10, 20,20, 210,0,0,255)
		setElementData(PData['gps'][id], "coord", toJSON({k[1],k[2],k[3]}))
	end
	
	if(PData["ResourceMap"]) then
		PData["ResourceMap"][3] = {}
		if(PData['gps']) then
			local oldmarker = false
			for i,v in pairs(PData['gps']) do
				if(oldmarker) then
					local x,y,z = unpack(fromJSON(getElementData(v, "coord")))
					local x2,y2,z2 = unpack(fromJSON(getElementData(oldmarker, "coord")))
					x,y,z = GetCoordOnMap(x,y,z)
					x2,y2,z2 = GetCoordOnMap(x2,y2,z2)
					PData["ResourceMap"][3][#PData["ResourceMap"][3]+1] = {x,y,z,x2,y2,z2, tocolor(255,0,0,255), 10}
				end
				oldmarker = v
			end
		end
	end
	
	local text = Text("На #4682B4карту#FFFFFF добавлена #ff0000точка#FFFFFF! Используй клавишу {key} для автоматического перемещения", {{"{key}", COLOR["KEY"]["HEX"].."P#FFFFFF"}})
	InformTitle(text)
end
addEvent("SetGPS", true)
addEventHandler("SetGPS", localPlayer, SetGPS)



function MyVoice(voicebank, voice)
	local voi = playSound("http://109.227.228.4/engine/include/MTA/"..voicebank.."/"..voice..".wav")
	setSoundVolume(voi, 0.7)
end
addEvent("MyVoice", true)
addEventHandler("MyVoice", localPlayer, MyVoice)




function PlayerDialog(array, ped, endl)
	if(isTimer(dialogActionTimer)) then killTimer(dialogActionTimer) end
	if(isTimer(dialogTimer)) then killTimer(dialogTimer) end
	if(isTimer(dialogViewTimer)) then killTimer(dialogViewTimer) end
	if(array) then
		PText["dialog"] = {}
		dialogTitle = array["dialog"][math.random(#array["dialog"])]
		MyVoice("dg", md5(dialogTitle))
	
		if(not ped) then
			showCursor(true)
			PlayerDialogAction(array, ped)
		else
			PlayerSayEvent(dialogTitle, ped)
			dialogActionTimer = setTimer(function()
				PlayerDialogAction(array, ped)
			end, (#dialogTitle*50), 1)

		end

	else
		BindedKeys = {}
		PText["dialog"] = nil
		dialogTitle = false
		if(ped) then
			if(endl) then
				MyVoice("dg", md5(endl))
				PlayerSayEvent(endl, ped)
			end
			setElementData(ped, "saytome", nil)
			PData['dialogPed'] = nil
		else
			showCursor(false)
		end
	end
end
addEvent("PlayerDialog", true)
addEventHandler("PlayerDialog", localPlayer, PlayerDialog)


function ServerDialogCall(data)
	if(isTimer(dialogActionTimer)) then killTimer(dialogActionTimer) end
	if(isTimer(dialogTimer)) then killTimer(dialogTimer) end
	if(isTimer(dialogViewTimer)) then killTimer(dialogViewTimer) end
	if(dialogTitle) then
		PText["dialog"] = nil
		dialogTitle=false
		triggerServerEvent(unpack(data))
	end
end
addEvent("ServerDialogCall", true)
addEventHandler("ServerDialogCall", localPlayer, ServerDialogCall)



function PlayerDialogAction(array, ped)
	local FH = dxGetFontHeight(scale, "default-bold")*1.5
	local x,y = screenWidth/4, (screenHeight/1.2)

	for name,arr in pairs (array) do
		if(name ~= "dialog") then
			PText["dialog"][name] = {name..": "..arr["text"], x, y-(FH*(tablelength(array)-name)), screenWidth, screenHeight, tocolor(255,255,255, 255), scale*1.5, "default-bold", "left", "top", false, false, false, true, false, 0, 0, 0, {["border"] = true}, {"ServerDialogCall", localPlayer, {"DialogRelease", localPlayer, localPlayer, name, ped}}}
			BindedKeys[tostring(name)] = {"ServerDialogCall", localPlayer, {"DialogRelease", localPlayer, localPlayer, name, ped}}
			if(arr["timer"]) then
				dialogTimer = setTimer(function()
					triggerServerEvent("DialogRelease", localPlayer, localPlayer, name, ped)
					killTimer(dialogViewTimer)
				end, arr["timer"], 1)
				dialogViewTimer = setTimer(function(num, text)
					local remaining, executesRemaining, totalExecutes = getTimerDetails(dialogTimer) 
					PText["dialog"][num][1] = text.." #FF0000("..("%.1f"):format(remaining/1000)..")"
				end, 100, 0, name, name..": "..arr["text"])
			end
		end
	end

end




function bizControl(name, data)
	PText["biz"] = {}
	helpmessage("")
	MissionCompleted("", "")
	if(data["money"]) then
		local text = "Текущий баланс "..COLOR["DOLLAR"]["HEX"].."$"..data["money"].." "
		local textWidth = dxGetTextWidth(text, scale*0.8, "default-bold", true)
		PText["biz"][#PText["biz"]+1] = {text, 660*scalex, 400*scaley, screenWidth, screenHeight, tocolor(255, 255, 255, 255), scale*0.8, "default-bold", "left", "top", false, false, false, true, false, 0, 0, 0, {}}
		PText["biz"][#PText["biz"]+1] = {"пополнить", 660*scalex+textWidth, 400*scaley, screenWidth, screenHeight, tocolor(255, 255, 255, 255), scale*0.8, "default-bold", "left", "top", false, false, false, true, false, 0, 0, 0, {["border"] = true, ["line"] = true}, {"CreateButtonInputInt", localPlayer, "givebizmoney", "Введи сумму", toJSON{name}}}	
		local textWidth = textWidth+dxGetTextWidth("пополнить ", scale*0.8, "default-bold", true)
		PText["biz"][#PText["biz"]+1] = {"снять",  660*scalex+textWidth, 400*scaley, screenWidth, screenHeight, tocolor(255, 255, 255, 255), scale*0.8, "default-bold", "left", "top", false, false, false, true, false, 0, 0, 0, {["border"] = true, ["line"] = true}, {"CreateButtonInputInt", localPlayer, "removebizmoney", "Введи сумму", toJSON{name}}}	
	end
	
	
	if(data["Nachalnik"]) then
		if(data["vacancy"]) then
			for i, dat in pairs(data["vacancy"]) do
				local text = "#CCCCCC"..dat[2].."#FFFFFF - "..dat[3].." "
				local FH = dxGetFontHeight(scale*0.8, "default-bold")*1.1
				local textWidth = dxGetTextWidth(text, scale*0.8, "default-bold", true)
				PText["biz"][#PText["biz"]+1] = {text, 660*scalex, 400*scaley+(FH*i), screenWidth, screenHeight, tocolor(255, 255, 255, 255), scale*0.8, "default-bold", "left", "top", false, false, false, true, false, 0, 0, 0, {}}	
				if(dat[3] ~= "") then
					PText["biz"][#PText["biz"]+1] = {"уволить", 660*scalex+textWidth, 400*scaley+(FH*i), screenWidth, screenHeight, tocolor(255, 255, 255, 255), scale*0.8, "default-bold", "left", "top", false, false, false, true, false, 0, 0, 0, {["border"] = true, ["line"] = true}, {"ServerCall", localPlayer, {"editBizVacancy", localPlayer, localPlayer, "", toJSON({dat[1], dat[2], name, i-1})}}}
				else
					PText["biz"][#PText["biz"]+1] = {"назначить", 660*scalex+textWidth, 400*scaley+(FH*i), screenWidth, screenHeight, tocolor(255, 255, 255, 255), scale*0.8, "default-bold", "left", "top", false, false, false, true, false, 0, 0, 0, {["border"] = true, ["line"] = true}, {"CreateButtonInputInt", localPlayer, "editBizVacancy", "Введи имя", toJSON{dat[1], dat[2], name, i-1}}}
				end
			end
		end
	else
		if(data["vacancy"]) then
			for i, dat in pairs(data["vacancy"]) do
				local text = "#CCCCCC"..dat[2].."#FFFFFF - "..dat[3].." "
				local FH = dxGetFontHeight(scale*0.8, "default-bold")*1.1
				local textWidth = dxGetTextWidth(text, scale*0.8, "default-bold", true)
				PText["biz"][#PText["biz"]+1] = {text, 660*scalex, 440*scaley+(FH*i), screenWidth, screenHeight, tocolor(255, 255, 255, 255), scale*0.8, "default-bold", "left", "top", false, false, false, true, false, 0, 0, 0, {}}	
				if(dat[3] == "") then
					PText["biz"][#PText["biz"]+1] = {"устроиться", 660*scalex+textWidth, 440*scaley+(FH*i), screenWidth, screenHeight, tocolor(255, 255, 255, 255), scale*0.8, "default-bold", "left", "top", false, false, false, true, false, 0, 0, 0, {["border"] = true, ["line"] = true}, {"ServerCall", localPlayer, {"startBizVacancy", localPlayer, localPlayer, "", toJSON({dat[1], dat[2], name, i-1})}}}
				elseif(dat[3] == getPlayerName(localPlayer)) then
					PText["biz"][#PText["biz"]+1] = {"уволиться", 660*scalex+textWidth, 440*scaley+(FH*i), screenWidth, screenHeight, tocolor(255, 255, 255, 255), scale*0.8, "default-bold", "left", "top", false, false, false, true, false, 0, 0, 0, {["border"] = true, ["line"] = true}, {"ServerCall", localPlayer, {"stopBizVacancy", localPlayer, localPlayer, "", toJSON({dat[1], dat[2], name, i-1})}}}
				end
			end
		end
	end

	
	if(data["var"]) then
		local FH = dxGetFontHeight(scale*0.8, "default-bold")*1.1
		PInv["shop"] = {} 
		PBut["shop"] = {} 
		for varname, dats in pairs(data["var"]) do
			if(varname == "Торговля") then
				if(not PData["ResourceMap"]) then
					TradeWindow(dats, name)
				else
					TradeWindows = name
					local Coord = {
						["Trade"] = {
							["i"] = 1,
							["x"] = 640*scalex,
							["y"] = 700*scaley-(30*scaley), 
							["vx"] = (2.5*scalex),
							["vy"] = (80.5*scaley)
						},
						["Sell"] = {
							["i"] = 1,
							["x"] = 640*scalex,
							["y"] = 560*scaley-(30*scaley), 
							["vx"] = (2.5*scalex),
							["vy"] = (80.5*scaley)
						}
					}
					for _, dat in pairs(dats) do
						PInv["shop"][#PInv["shop"]+1] = dat
						--PText["biz"][#PText["biz"]+1] = {Coord[dat[2]]["i"], screenWidth-Coord[dat[2]]["x"]+Coord[dat[2]]["vx"]+(80.5*scaley), Coord[dat[2]]["y"]+Coord[dat[2]]["vy"]-(25*scaley), 0, screenHeight, tocolor(255, 255, 255, 255), NewScale, "pricedown", "center", "top", false, false, false, true, false, 0, 0, 0, {}}
						PBut["shop"][#PBut["shop"]+1] = {Coord[dat[2]]["x"]+Coord[dat[2]]["vx"], Coord[dat[2]]["y"]+Coord[dat[2]]["vy"], 80*scalex, 60*scaley}
						Coord[dat[2]]["vx"] = Coord[dat[2]]["vx"]+(80.5*scalex)
						if(Coord[dat[2]]["i"] == 8 or Coord[dat[2]]["i"] == 16 or Coord[dat[2]]["i"] == 24 or Coord[dat[2]]["i"] == 32) then
							Coord[dat[2]]["x"], Coord[dat[2]]["y"] = 640*scalex, 360*scaley-(30*scaley)
							Coord[dat[2]]["vx"], Coord[dat[2]]["vy"] = (2.5*scalex), Coord[dat[2]]["vy"]+(80.5*scaley)
						end
						Coord[dat[2]]["i"] = Coord[dat[2]]["i"]+1
					end
				end
			else
				local text = "#CCCCCC"..varname..": "..dats.." "
				PText["biz"][#PText["biz"]+1] = {text, 660*scalex, 370*scaley+(FH*(#PText["biz"]+1)), screenWidth, screenHeight, tocolor(255, 255, 255, 255), scale*0.8, "default-bold", "left", "top", false, false, false, true, false, 0, 0, 0, {}}
			end
		end
	end
	
	PData["BizControlName"] = {name, data["name"]}

	showCursor(true)
end
addEvent("bizControl", true)
addEventHandler("bizControl", localPlayer, bizControl)





function ServerCall(data)
	triggerServerEvent(unpack(data))
end
addEvent("ServerCall", true)
addEventHandler("ServerCall", localPlayer, ServerCall)



local ArraySkinInfo = {
	[0] = {"Мирные жители", "CJ"},
	
	[7] = {"Мирные жители", "Парень"},
	
	[9] = {"Мирные жители", "Женщина"},
	[10] = {"Мирные жители", "Пожилой"},
	[12] = {"Мирные жители", "Женщина"},
	[13] = {"Мирные жители", "Женщина"},
	[14] = {"Мирные жители", "Мужчина"},
	[15] = {"Мирные жители", "Мужчина"},
	[17] = {"Мирные жители", "Деловой"},
	[18] = {"Мирные жители", "Пляжный"},
	[19] = {"Мирные жители", "Пляжный"},
	[20] = {"Мирные жители", "Парень"},
	[21] = {"Мирные жители", "Парень"},
	[22] = {"Мирные жители", "Парень"},
	[23] = {"Мирные жители", "Парень"},
	[24] = {"Мирные жители", "Парень"},
	[25] = {"Мирные жители", "Мужчина"},
	[26] = {"Мирные жители", "Турист"},
	[27] = {"Мирные жители", "Рабочий"},
	[28] = {"Мирные жители", "Парень"},
	[29] = {"Мирные жители", "Парень"},
	[30] = {"Колумбийский картель", "Sureno", 120, 3},
	[31] = {"Мирные жители", "Ковбойский пожилой"},
	
	[36] = {"Мирные жители", "Гольфист"},
	
	[40] = {"Мирные жители", "Деловой"},
	
	[43] = {"Колумбийский картель", "Лейтенант колумбийского картеля", 420, 6},
	[44] = {"Мирные жители", "Мужчина"},
	
	[48] = {"Мирные жители", "Сынок"},
	
	[56] = {"Мирные жители", "Соска"},
	
	[60] = {"Мирные жители", "Парень", 140, 5},
	
	[62] = {"Уголовники", "Блатной"},
	
	[64] = {"Байкеры", "Шлюха-Транс"},
	
	[68] = {"Мирные жители", "Патриарх"},
	
	[70] = {"МЧС", "Учёный CPC", false, 4},
	
	[72] = {"Мирные жители", "Парень"},
	
	[77] = {"Мирные жители", "Бомжиха"},
	[78] = {"Мирные жители", "Бомж"},
	[79] = {"Мирные жители", "Бомж"},
	
	[82] = {"Мирные жители", "Elvis"}, 
	[83] = {"Мирные жители", "Elvis"}, 
	
	[85] = {"Мирные жители", "Шлюха"}, 
	
	[90] = {"Мирные жители", "Женщина"},
	[91] = {"Мирные жители", "Элитный"},
	[92] = {"Мирные жители", "Женские ролики"},
	[93] = {"Мирные жители", "Женщина"},
	
	[95] = {"Колумбийский картель", "Sombras", 75, 2},
	
	[99] = {"Мирные жители", "Мужские ролики"},
	[100] = {"Байкеры", "Дорожный капитан", 130, 4},
	
	[102] = {"Баллас", "Жаба"},
	[103] = {"Баллас", "Гусь"},
	[104] = {"Баллас", "Бык"},
	[105] = {"Гроув-стрит", "Красавчик Флиззи"},
	[106] = {"Гроув-стрит", "Гангстерлительный"},
	[107] = {"Гроув-стрит", "Джин Рамми"},
	
	[108] = {"Вагос", "Отмычка"},
	[109] = {"Вагос", "Браток"},
	[110] = {"Вагос", "Комендант"},
	[111] = {"Русская мафия", "Клоп", 600, 10},
	[112] = {"Русская мафия", "Вор", 750, 11},
	[113] = {"Русская мафия", "Пахан (Лидер)", 900, 12},
	[114] = {"Ацтекас", "Сопляк"},
	[115] = {"Ацтекас", "Кирпич"},
	[116] = {"Ацтекас", "Башка"},
	[117] = {"Триады", "Моль", 350, 10},
	[118] = {"Триады", "Баклан", 470, 11},
	
	[120] = {"Триады", "Зам. Лидера", 550, 12},
	[121] = {"Якудзы", "Куми-ин", 400, 10},
	[122] = {"Якудзы", "Сансита", 550, 11},
	[123] = {"Якудзы", "Дэката", 600, 12},

	[141] = {"Мирные жители", "Девушка"},
	
	[145] = {"Уголовники", "Потраченная"},
	
	[147] = {"Мирные жители", "Мужчина"},
	
	[150] = {"Мирные жители", "Планктон"},
	
	[155] = {"Мирный Житель", "Разносчик пиццы"},
	
	[158] = {"Деревенщины", "Папаша"},
	[159] = {"Деревенщины", "Шнырь"},
	[160] = {"Деревенщины", "Чёрт"},
	[161] = {"Деревенщины", "Блатной"},
	[162] = {"Деревенщины", "Опущенный"},
	[163] = {"ЦРУ", "", false, 20},
	[164] = {"ЦРУ", "", 600, 25},
	[166] = {"ЦРУ", "", 750, 30},
	[165] = {"ЦРУ", "", 900, 40},
	
	[169] = {"Якудзы", "Кумитё (Лидер)", 700, 13},
	
	[173] = {"Рифа", "Упырь"},
	[174] = {"Рифа", "Баклан"},
	[175] = {"Рифа", "Капореджиме"},
	
	[178] = {"Мирные жители", "Шлюха"},
	[179] = {"Колумбийский картель", "Guerrero",  240, 5},
	
	[181] = {"Байкеры", "Тусовщик", false, 1},
	
	[188] = {"Мирные жители", "Парень"},
	
	[193] = {"Мирные жители", "Женщина"},
	
	[201] = {"Мирные жители", "Работница"},
	
	[212] = {"Мирные жители", "Бомж"},
	[213] = {"Уголовники", "Чёрт"},
	
	[217] = {"Мирные жители", "Парень"},
	
	[222] = {"Колумбийский картель", "La Mugre", 50, 1},
	[223] = {"Мирные жители", "Продавец"},
	
	[226] = {"Мирные жители", "Женщина"},
	[227] = {"Мирные жители", "Деловой", false, 20},
	[228] = {"Мирные жители", "Деловой", false, 20},
	
	[230] = {"Мирные жители", "Бомж"},
	
	[233] = {"Мирные жители", "Продавщица"},
	
	[236] = {"Мирные жители", "Пожилой"},
	
	[239] = {"Мирные жители", "Борода"},

	[242] = {"Колумбийский картель", "Cacos", 180, 4},
	
	[247] = {"Байкеры", "Вольный ездок", 30, 2},
	[248] = {"Байкеры", "Шустрила", 75, 3},
	
	[252] = {"Уголовники", "Потраченный"},
	
	[256] = {"Мирные жители", "Женщина"},
	
	[260] = {"Мирные жители", "Строитель"},
	
	[264] = {"Мирные жители", "Клоун"},
	[265] = {"Полиция", "Начальник LSPD", false, 10},
	[266] = {"Полиция", "Офицер 2 класса", false, 9},
	[267] = {"Полиция", "Офицер 1 класса", false, 8},
	[268] = {"Уголовники", "Шпана"},
	[269] = {"Гроув-стрит", "Big Smoke"},
	[270] = {"Гроув-стрит", "Консильери"},
	
	[274] = {"МЧС", "Врач", false, 3},
	[275] = {"МЧС", "Ученик", false, 2},
	[276] = {"МЧС", "Санитар", false, 1},
	[277] = {"Мирные жители", "Пожарник"},
	
	[280] = {"Полиция", "Рядовой", false, 1},
	[281] = {"Полиция", "Сержант", false, 3},
	[282] = {"Полиция", "Майор", false, 4},
	[283] = {"Полиция", "Шериф", false, 7},
	[284] = {"Полиция", "Инспектор ДПС", false, 2}, 
	[285] = {"Полиция", "SWAT", false, 5},
	[286] = {"ФБР", "ФБР", false, 10}, 
	[287] = {"Военные", "Контрактник", false, 2},
	[288] = {"Полиция", "Помощник шерифа", false, 6},
	
	[292] = {"Ацтекас", "Громоотвод"},
	[293] = {"Гроув-стрит", "Укурыш"},
	[294] = {"Триады", "Желтый дракон (Лидер)", 700, 13},
	
	[299] = {"Мирные жители", "Claude"},
	
	[312] = {"Военные", "Призывник", false, 1},
}






local wardprobePosition = false
local wardprobeArr = false
local wardprobeType = false



function SetwardprobeSkin(skinid)
	local i = 0
	for skin, key in pairs(wardprobeArr) do
		i=i+1
		if(i == skinid) then
			skin=tonumber(skin)
			triggerServerEvent("SetPlayerModel", localPlayer, localPlayer, skin)
			PlayerChangeSkinTeam=RGBToHex(getTeamColor(getTeamFromName(ArraySkinInfo[skin][1])))..ArraySkinInfo[skin][1]
			PlayerChangeSkinTeamRang=ArraySkinInfo[skin][2]
			if(wardprobeType == "house") then
				if(key == 999) then
					PlayerChangeSkinTeamRespect="бесконечное количество шт."
				else
					PlayerChangeSkinTeamRespect=key.." шт."
				end
			elseif(wardprobeType == "shop") then
				PlayerChangeSkinTeamRespect="$"..key
			end

			if(skin == 285 or skin == 264) then
				PlayerChangeSkinTeamRespectNextLevel="скрывает имя игрока"
			else
				PlayerChangeSkinTeamRespectNextLevel=""
			end
		end
	end

end






function wardrobe(arr,types)
	wardprobeType=types
	wardprobeArr=fromJSON(arr)

	setCameraMatrix(255.5, -41.4, 1002.5,  258.3, -41.8, 1002.5)
	PEDChangeSkin=true

	SwitchButtonL = guiCreateButton(0.5-(0.08), 0.8, 0.04, 0.04, "<-", true)
	SwitchButtonR = guiCreateButton(0.5+(0.04), 0.8, 0.04, 0.04, "->", true)
	if(wardprobeType == "house") then
		SwitchButtonAccept = guiCreateButton(0.5-(0.04), 0.8, 0.08, 0.04, "ВЫБРАТЬ", true)
		local curskin = tostring(getElementModel(localPlayer))
		if(wardprobeArr[curskin]) then wardprobeArr[curskin] = wardprobeArr[curskin]+1 else wardprobeArr[curskin] = 1 end
		local i = 0
		for v, key in pairs(wardprobeArr) do
			i=i+1
			if(v == curskin) then
				wardprobePosition=i
			end
		end
	elseif(wardprobeType == "shop") then
		wardprobePosition=1
		SwitchButtonAccept = guiCreateButton(0.5-(0.04), 0.8, 0.08, 0.04, "КУПИТЬ", true)
	end
	SetwardprobeSkin(wardprobePosition)
	setElementData(SwitchButtonL, "data", "NewSwitchButtonL")
	setElementData(SwitchButtonR, "data", "NewSwitchButtonR")
	setElementData(SwitchButtonAccept, "data", "NewSwitchButtonAccept")
	setElementData(SwitchButtonL, "ped", "1")
	setElementData(SwitchButtonR, "ped", "1")
	setElementData(SwitchButtonAccept, "ped", "1")


	showCursor(true)
	bindKey("arrow_l", "down", NewNextSkinMinus) 
	bindKey("arrow_r", "down", NewNextSkinPlus) 
	bindKey("enter", "down", NewNextSkinEnter) 	
end
addEvent("wardrobe", true)
addEventHandler("wardrobe", localPlayer, wardrobe)



local RobActionTimer = false
function RobEvent(value)
	if(isTimer(RobActionTimer)) then
		killTimer(RobActionTimer)
	end
	
	
	if(RobAction == false) then
		RobAction = {value*10, false}
	else
		if(value) then
			RobAction[1] = RobAction[1]+(value*10) 
			RobAction[2] = value*10
		else
			RobAction = false
			return true
		end
	end
	
	
	RobActionTimer = setTimer(function() RobAction[2] = false end, 2500, 1)
end
addEvent("RobEvent", true)
addEventHandler("RobEvent", localPlayer, RobEvent)



function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end




function NewNextSkinPlus()
	if(wardprobePosition == tablelength(wardprobeArr)) then
		wardprobePosition=1
	else
		wardprobePosition=wardprobePosition+1
	end
	SetwardprobeSkin(wardprobePosition)
end


function NewNextSkinMinus()
	if(wardprobePosition == 1) then
		wardprobePosition = tablelength(wardprobeArr)
	else
		wardprobePosition = wardprobePosition-1
	end
	SetwardprobeSkin(wardprobePosition)
end

function NewNextSkinEnter(_, _, closed)
	unbindKey ("arrow_l", "down", NewNextSkinMinus) 
	unbindKey ("arrow_r", "down", NewNextSkinPlus) 
	unbindKey ("enter", "down", NewNextSkinEnter) 
	PEDChangeSkin = "play"
	showCursor(false)
	if(closed) then 
		triggerServerEvent("buywardrobe", localPlayer, localPlayer)
	else
		local i = 0
		for skin, key in pairs(wardprobeArr) do
			i=i+1
			if(i == wardprobePosition) then
				if(wardprobeType == "house") then
					triggerServerEvent("wardrobe", localPlayer, localPlayer, skin)
					break
				elseif(wardprobeType == "shop") then
					triggerServerEvent("buywardrobe", localPlayer, localPlayer, skin, key)
					break
				end
			end
		end
	end
	wardprobeArr = false
	guiSetVisible(SwitchButtonAccept, false)
	guiSetVisible(SwitchButtonL, false)
	guiSetVisible(SwitchButtonR, false)
end




local lookedHouse = false
local ViewHouse = 1

local CityColor = {
	["San Fierro"] = "#404552",  
	["Los Santos"] = "#FFC200", 
	["Las Venturas"] = "#DBC2FF", 
	["Tierra Robada"] = "#097380", 
	["Bone County"] = "#CCB277", 
	["Red County"] = "#C02221", 
	["Flint County"] = "#7C9B5F", 
	["Whetstone"] = "#999999"
}


function LookHouse(h)
	setElementDimension(localPlayer, 0)
	setElementInterior(localPlayer, 0) 
	local x,y,z= h[1],h[2],h[3] 
	local zone = getZoneName(x,y,z,true)
	local color = {"#9EDA46", "#FFFFFF"}
	if(CityColor[zone]) then color[1] = CityColor[zone] end
	PlayerChangeSkinTeam = color[1]..getZoneName(x,y,z, true)

	if(h[4] == "house") then
		PlayerChangeSkinTeamRang = color[2]..getZoneName(x,y,z).." "..getElementData(getElementByID(h[5]), "zone")
	else
		PlayerChangeSkinTeamRang = color[2]..h[5]
	end
	lookedHouse = h
	
	if(h[6] == 90) then
		setCameraMatrix(x+20, y-20, z+30, x, y, z)
	elseif(h[6] == 180) then
		setCameraMatrix(x-20, y-20, z+30, x, y, z)
	elseif(h[6] == 270) then
		setCameraMatrix(x-20, y+20, z+30, x, y, z)
	elseif(h[6] == 360) then
		setCameraMatrix(x+20, y+20, z+30, x, y, z)
	else
		setCameraMatrix(x-100, y-100, z+150, x, y, z)
	end
end



function NextSkinMinus()
	if(SpawnPoints[ViewHouse-1]) then
		LookHouse(SpawnPoints[ViewHouse-1])
		ViewHouse=ViewHouse-1
	else
		LookHouse(SpawnPoints[#SpawnPoints])
		ViewHouse=#SpawnPoints
	end
end

function NextSkinPlus()
	if(SpawnPoints[ViewHouse+1]) then
		LookHouse(SpawnPoints[ViewHouse+1])
		ViewHouse=ViewHouse+1
	else
		LookHouse(SpawnPoints[1])
		ViewHouse=1
	end
end


function NextSkinEnter()
	if(SkinFlag) then
		PText["HUD"][3] = nil
		PlayerChangeSkinTeam=""
		PlayerChangeSkinTeamRang=""
		PlayerChangeSkinTeamRespect=""
		PlayerChangeSkinTeamRespectNextLevel=""
		triggerServerEvent("SpawnedAfterChangeEvent", localPlayer, localPlayer, lookedHouse[4], lookedHouse[5])
		lookedHouse = false
	end
end





function StartLookZones(zones, update)
	if(#MyHouseBlip > 0) then 
		for slot = 1, #MyHouseBlip do
			destroyElement(MyHouseBlip[slot])
		end
		MyHouseBlip={}
	end
	

	SpawnPoints=fromJSON(zones)

	for i = 1, #SpawnPoints do
		if(SpawnPoints[i][4] == "house") then
			local x,y,z = SpawnPoints[i][1],SpawnPoints[i][2],SpawnPoints[i][3]
			MyHouseBlip[#MyHouseBlip+1]=createBlip(x, y, z, 31)
			local angle = SpawnPoints[i][6]
			if(not angle) then 
				if(not processLineOfSight(x, y, z, x+1, y, z, true)) then
					angle = 90
				elseif(not processLineOfSight(x, y, z, x-1, y, z, true)) then
					angle = 180
				elseif(not processLineOfSight(x, y, z, x, y+1, z, true)) then
					angle = 270
				elseif(not processLineOfSight(x, y, z, x, y-1, z, true)) then
					angle = 360
				else
					angle = 0
				end
			end
			SpawnPoints[i][6] = angle
		end
	end
	
	if(not update) then
		setElementDimension(localPlayer, getElementData(localPlayer,"id"))
		setElementInterior(localPlayer, 0)	
		PEDChangeSkin = true
		
		SwitchButtonL = guiCreateButton(0.5-(0.08), 0.8, 0.04, 0.04, "<-", true)
		SwitchButtonR = guiCreateButton(0.5+(0.04), 0.8, 0.04, 0.04, "->", true)
		
		SwitchButtonAccept = guiCreateButton(0.5-(0.04), 0.8, 0.08, 0.04, "ВЫБРАТЬ", true)
		setElementData(SwitchButtonL, "data", "SwitchButtonL")
		setElementData(SwitchButtonR, "data", "SwitchButtonR")
		setElementData(SwitchButtonAccept, "data", "SwitchButtonAccept")
		setElementData(SwitchButtonL, "ped", PEDChangeSkin)
		setElementData(SwitchButtonR, "ped", PEDChangeSkin)
		setElementData(SwitchButtonAccept, "ped", PEDChangeSkin)
		showCursor(true)
		bindKey ("arrow_l", "down", NextSkinMinus) 
		bindKey ("arrow_r", "down", NextSkinPlus) 
		bindKey ("enter", "down", NextSkinEnter)
		LookHouse(SpawnPoints[1])
	end
end
addEvent("StartLookZones", true)
addEventHandler("StartLookZones", localPlayer, StartLookZones)




local EditHomeKey = {
	["1"] = "Трейлер", 
	["2"] = "Маленькая комната", 
	["3"] = "Дом 1 этаж (бедный)", 
	["4"] = "Дом 1 этаж (нормальный)", 
	["5"] = "Дом 1 этаж (богатый)", 
	["6"] = "Дом 2 этажа (бедный)", 
	["7"] = "Дом 2 этажа (нормальный)", 
	["8"] = "Дом 2 этаж (богатый)", 
	["9"] = "Special", 
	["0"] = "Гараж"
}


function sendEditHome(key)
	triggerServerEvent("SetHomeType", localPlayer, localPlayer, PlayerChangeSkinTeamRang:gsub('#%x%x%x%x%x%x', ''), EditHomeKey[key])
end



function StartLookZonesBeta(zones, update)
	if(#MyHouseBlip > 0) then 
		for slot = 1, #MyHouseBlip do
			destroyElement(MyHouseBlip[slot])
		end
		MyHouseBlip={}
	end
	
	
	
	bindKey ("0", "down", sendEditHome, 0)
	bindKey ("1", "down", sendEditHome, 1)
	bindKey ("2", "down", sendEditHome, 2)
	bindKey ("3", "down", sendEditHome, 3)
	bindKey ("4", "down", sendEditHome, 4)
	bindKey ("5", "down", sendEditHome, 5)
	bindKey ("6", "down", sendEditHome, 6)
	bindKey ("7", "down", sendEditHome, 7)
	bindKey ("8", "down", sendEditHome, 8)
	bindKey ("9", "down", sendEditHome, 9)
	
	
	SpawnPoints=fromJSON(zones)
	HomeEditor = true
	for i = 1, #SpawnPoints do
		if(SpawnPoints[i][4] == "house") then
			local x,y,z = SpawnPoints[i][1],SpawnPoints[i][2],SpawnPoints[i][3]
			MyHouseBlip[#MyHouseBlip+1]=createBlip(x, y, z, 31)
			local angle = SpawnPoints[i][6]
			if(not angle) then 
				if(not processLineOfSight(x, y, z, x+1, y, z, true)) then
					angle = 90
				elseif(not processLineOfSight(x, y, z, x-1, y, z, true)) then
					angle = 180
				elseif(not processLineOfSight(x, y, z, x, y+1, z, true)) then
					angle = 270
				elseif(not processLineOfSight(x, y, z, x, y-1, z, true)) then
					angle = 360
				else
					angle = 0
				end
			end
			SpawnPoints[i][6] = angle
		end
	end
	
	if(not update) then
		setElementDimension(localPlayer, getElementData(localPlayer,"id"))
		setElementInterior(localPlayer, 0)	
		PEDChangeSkin = true
		
		SwitchButtonL = guiCreateButton(0.5-(0.08), 0.8, 0.04, 0.04, "<-", true)
		SwitchButtonR = guiCreateButton(0.5+(0.04), 0.8, 0.04, 0.04, "->", true)
		
		SwitchButtonAccept = guiCreateButton(0.5-(0.04), 0.8, 0.08, 0.04, "ВЫБРАТЬ", true)
		setElementData(SwitchButtonL, "data", "SwitchButtonL")
		setElementData(SwitchButtonR, "data", "SwitchButtonR")
		setElementData(SwitchButtonAccept, "data", "SwitchButtonAccept")
		setElementData(SwitchButtonL, "ped", PEDChangeSkin)
		setElementData(SwitchButtonR, "ped", PEDChangeSkin)
		setElementData(SwitchButtonAccept, "ped", PEDChangeSkin)
		showCursor(true)
		bindKey ("arrow_l", "down", NextSkinMinus) 
		bindKey ("arrow_r", "down", NextSkinPlus) 
		bindKey ("enter", "down", NextSkinEnter)
		LookHouse(SpawnPoints[1])
	else
		playSFX("genrl", 75, 1, false)
		helpmessage("")
		MissionCompleted(update, "")
		local x,y,z = getElementPosition(localPlayer)
		setCameraMatrix(x+20, y-20, z+30, x, y, z)
		PEDChangeSkin = "cinema"
		setTimer(function(thePlayer)
			setCameraTarget(localPlayer)
			PEDChangeSkin = "play"
		end, 4000, 1)
	end
end
addEvent("StartLookZonesBeta", true)
addEventHandler("StartLookZonesBeta", localPlayer, StartLookZonesBeta)






function CloseSkinSwitch()
	if(GTASound) then
		stopSound(GTASound)
		GTASound = false
	end
	unbindKey ("arrow_l", "down", NextSkinMinus) 
	unbindKey ("arrow_r", "down", NextSkinPlus) 
	unbindKey ("enter", "down", NextSkinEnter) 
	PEDChangeSkin="play"
	showCursor(false)
	guiSetVisible(SwitchButtonAccept, false)
	guiSetVisible(SwitchButtonL, false)
	guiSetVisible(SwitchButtonR, false)
end
addEvent("CloseSkinSwitchEvent", true)
addEventHandler("CloseSkinSwitchEvent", localPlayer, CloseSkinSwitch)








local radioVehicleIds={}
function CreateVehicleAudioEvent(vehicle,typest, station,song)
	if(radioVehicleIds[vehicle]) then
		stopSound(radioVehicleIds[vehicle])
	end
	local x,y,z = getElementPosition(vehicle)
	radioVehicleIds[vehicle]=playSFX3D(typest, station, song, x, y, z,true)
	attachElements(radioVehicleIds[vehicle], vehicle, 0, 0, 0)
	setSoundVolume(radioVehicleIds[vehicle], 1.0)
	setSoundMaxDistance(radioVehicleIds[vehicle], 65)
	setSoundMinDistance(radioVehicleIds[vehicle], 8)
end
addEvent("CreateVehicleAudioEvent", true)
addEventHandler("CreateVehicleAudioEvent", localPlayer, CreateVehicleAudioEvent)








function UpdateInventoryMass()
	local tmp=0
	for i,val in pairs(PInv["player"]) do
		if(val[1]) then
			tmp = tmp+(items[val[1]][5]*val[2])
		end
	end
	InventoryMass = math.round(tmp/1000, 1)
	MaxMass = math.round((20000+(getPedStat(localPlayer, 22)*30))/1000, 1)
	if InventoryMass > MaxMass then
		MassColor = tocolor(184,0,0,255)
		toggleControl("sprint", false)
	else
		MassColor = tocolor(255,255,255,255)
		toggleControl("sprint", true)
	end
end


-- ИД обьекта, Навык
local WeaponModel = {
	[0] = {nil, 177},
	[1] = {331, 177},
	[2] = {333, 177},
	[3] = {334, 177},
	[4] = {335, 177},
	[5] = {336, 177},
	[6] = {337, 177},
	[7] = {338, 177},
	[8] = {339, 177},
	[9] = {341, 177},
	[10] = {321, 177},
	[11] = {322, 177},
	[12] = {323, 177},
	[14] = {325, 177},
	[15] = {326, 177},
	[22] = {346, 69},
	[23] = {347, 70},
	[24] = {348, 71},
	[25] = {349, 72},
	[26] = {350, 73},
	[27] = {351, 74},
	[28] = {352, 75},
	[29] = {353, 76},
	[32] = {372, 75},
	[30] = {355, 77},
	[31] = {356, 78},
	[33] = {357, 79},
	[34] = {358, 79},
	[35] = {359, nil},
	[36] = {360, nil},
	[37] = {361, nil},
	[38] = {362, nil},
	[16] = {342, nil},
	[17] = {343, nil},
	[18] = {344, nil},
	[39] = {363, nil},
	[40] = {364, nil},
	[41] = {365, nil},
	[42] = {366, nil},
	[43] = {367, nil},
	[44] = {368, nil},
	[45] = {369, nil},
	[46] = {371, nil},
	[3026] = {3026, nil},
	[1210] = {1210, nil},
	[1650] = {1650, nil},
	[2663] = {2663, nil},
	[1025] = {1025, nil},
	[3632] = {3632, nil}, 
	[1370] = {1370, nil}, 
	[1218] = {1218, nil}, 
	[1222] = {1222, nil}, 
	[1225] = {1225, nil}, 
	[1453] = {1453, nil},
	[330] = {330, nil}, 
	[2900] = {2900, nil}, 
}




function table.copy(t)
	local t2 = {};
	for k,v in pairs(t) do
		if type(v) == "table" then
			t2[k] = table.copy(v);
		else
			t2[k] = v;
		end
	end
	return t2;
end

function UpdateArmas(thePlayer)
	if(getElementData(thePlayer, "armasplus")) then
		StreamData[thePlayer]["armasplus"] = fromJSON(getElementData(thePlayer, "armasplus"))
	else
		StreamData[thePlayer]["armasplus"] = {}
	end
	local WeaponUseTEMP = table.copy(StreamData[thePlayer]["armasplus"])
	if(getElementModel(thePlayer) ~= 0 and getElementModel(thePlayer) ~= 294 and getElementModel(thePlayer) ~= 293) then
		local invars = getElementData(thePlayer, "inv")
		if(invars) then
			local ars = fromJSON(invars)
			for i = 1, #ars do
				if(ars[i][1]) then
					if(WeaponNamesArr[ars[i][1]]) then
						WeaponUseTEMP[WeaponModel[WeaponNamesArr[ars[i][1]]][1]]=true
					end
				end
			end
		else
			return false
		end
	end
	if(getPedWeapon(thePlayer) ~= 0) then WeaponUseTEMP[WeaponModel[getPedWeapon(thePlayer)][1]] = nil end
	for v,z in pairs(WeaponUseTEMP) do
		if(not StreamData[thePlayer]["armas"][v]) then
			CreatePlayerArmas(thePlayer, v)
		end
	end
	
	for v,z in pairs(StreamData[thePlayer]["armas"]) do
	
		if(not WeaponUseTEMP[v]) then
			destroyElement(StreamData[thePlayer]["armas"][v])
			StreamData[thePlayer]["armas"][v]=nil
		end
	end
end


local WardrobeObject = {
	[1740] = true, 
	[1741] = true, 
	[1743] = true, 
	[2088] = true, 
	[2091] = true,
	[2094] = true,
	[2095] = true,
	[2158] = true,
	[2306] = true, 
	[2323] = true, 
	[2328] = true, 
	[2307] = true, 
	[2329] = true, 
	[2330] = true, 
	[1567] = true, --Дверь
	[14867] = true
}









local ActualBones = {1, 2, 3, 4, 5, 6, 7, 8, 21, 22, 23, 24, 25, 26, 31, 32, 33, 34, 35, 36, 41, 42, 43, 44, 51, 52, 53, 54}




function UpdateBot()
	for _,thePed in pairs(getElementsByType("ped", getRootElement(), true)) do
		local theVehicle = getPedOccupiedVehicle(thePed)
		local attacker = GetElementAttacker(thePed)
		if(theVehicle) then
			local x,y,z = getElementPosition(theVehicle)
			local rx,ry,rz = getElementRotation(theVehicle)
			local brakes = false
			local path = false
			local nextpath = false
			local maxspd = 40
			local PointDistance = 4
			local mreverse = false
			if(attacker) then
				PointDistance = 10
			end
			
			if(getElementData(thePed, "DynamicBot")) then
				local arr = fromJSON(getElementData(thePed, "DynamicBot"))
				path = {arr[1],arr[2],arr[3]}

				nextpath = {arr[5],arr[6],arr[7]}
				
				local distance = getDistanceBetweenPoints2D(path[1], path[2], x, y)
				if(distance < PointDistance) then
					if(arr[4]) then
						if(trafficlight[tostring(getTrafficLightState())] == arr[4]) then
							brakes = true
						end
						
					end
					
					if(brakes == false) then -- Если не ждет на светофоре
						if(StreamData[thePed]["UpdateRequest"]) then
							StreamData[thePed]["UpdateRequest"] = false
							triggerServerEvent("SetNextDynamicNode", localPlayer, thePed)
						end
					end
				end
				if(not StreamData[thePed]["UpdateRequest"]) then
					path = {arr[5],arr[6],arr[7]}
					local tmpx, tmpy, tmpz = getPointInFrontOfPoint(arr[5],arr[6],arr[7], rz+90, 20) -- Создает плавность до того как станет известно положение следующей точки
					
					nextpath = {tmpx, tmpy, tmpz}
					distance = getDistanceBetweenPoints2D(path[1], path[2], x,y)
					if(distance < PointDistance) then
						brakes = true
					end
				end
				
								
				if(not attacker) then-- Ближнее торможение аля пробки
					local x2,y2,z2 = getPositionInFront(theVehicle, 6)
					local _,_,_,_,hitElement,_,_,_,_ = processLineOfSight(x,y,z, x2,y2,z2, false,true,true, false, false, false, false, false, theVehicle)
					if(hitElement) then
						if(getElementType(hitElement) == "vehicle") then
							brakes = true
						elseif(getElementType(hitElement) == "player" or getElementType(hitElement) == "ped") then
							brakes = true
							HornPed(thePed, hitElement)
						end
					end
				end
			else
				if(attacker) then
					local x2,y2,z2 = getElementPosition(attacker)
					path = {x2,y2,z2}
					local tmpx, tmpy, tmpz = getPointInFrontOfPoint(x2,y2,z2, rz+90, 20) -- Создает плавность до того как станет известно положение следующей точки
					nextpath = {tmpx, tmpy, tmpz}
				end
			end
			
			if(path) then
				local vx, vy, vz = getElementVelocity(theVehicle)
				local s = (vx^2 + vy^2 + vz^2)^(0.5)*156

				
				local nextrot = GetMarrot(findRotation(path[1], path[2], nextpath[1], nextpath[2]),rz)
				if(nextrot < 0) then nextrot = nextrot-nextrot-nextrot end
				if(nextrot > 90) then nextrot = 90 end
				
				
				if(attacker) then maxspd = 220 end
				local limitspeed = maxspd-((maxspd-10)*(nextrot/90))

				
				if(brakes) then
					setPedAnalogControlState(thePed, "accelerate", 0)
					setPedAnalogControlState(thePed, "brake_reverse", 0)
					setPedControlState(thePed, "handbrake", true)
					setElementVelocity (theVehicle, 0,0,0)
				else
					local rot = GetMarrot(findRotation(x,y,path[1], path[2]),rz)
					if(rot > 80) then 
						if(rot > 100) then mreverse = true end
						rot = 20 
					elseif(rot < -20) then 
						if(rot < -80) then mreverse = true end
						rot = -20 
					end

					if(mreverse) then
						setPedAnalogControlState(thePed, "brake_reverse", 1-(s*1/limitspeed))
						setPedAnalogControlState(thePed, "accelerate", 0)
						setPedControlState(thePed, "handbrake", false)
						if(s > 10) then
							setPedControlState(thePed, "handbrake", true)
						else
							if(rot > 0) then
								setPedAnalogControlState(thePed, "vehicle_left", (rot)/20)
							else
								setPedAnalogControlState(thePed, "vehicle_right", -(rot)/20)
							end
						end
					else
						if(rot > 0) then
							setPedAnalogControlState(thePed, "vehicle_right", (rot)/20)
						else
							setPedAnalogControlState(thePed, "vehicle_left", -(rot)/20)
						end
					
						setPedAnalogControlState(thePed, "brake_reverse", 0)
						setPedControlState(thePed, "handbrake", false)
						if(s < limitspeed) then 
							setPedAnalogControlState(thePed, "accelerate", 1-(s*1/limitspeed))
						else
							setPedAnalogControlState(thePed, "accelerate", 0)
							setPedAnalogControlState(thePed, "brake_reverse", (s/limitspeed)-1)
						end
					end
				end
			end
		else
			local dialogrz = getElementData(thePed, "dialogrz")
			if(not dialogrz) then
				if(isElementSyncer(thePed)) then
					if(attacker) then
						local x,y,z = getPedBonePosition(attacker, ActualBones[math.random(#ActualBones)])
						MovePlayerTo[thePed] = {x,y,z,0,"fast",false,false,true} -- x,y,z,rz,speed,event,args,fire
						if(getElementData(thePed, "team") == "Полиция") then
							if(getElementData(attacker, "NoFireMePolice")) then
								MovePlayerTo[thePed][8] = false
								if(GetDistance(thePed, attacker) < 15) then
									if(getElementData(attacker, "NoFireMePolice") == "0") then
										triggerServerEvent("PoliceArrest", localPlayer, thePed, attacker)
									end
								end
							end
						end
					else
						local x,y,z = getElementPosition(thePed)
						local x2,y2,z2 = getPositionInFront(thePed, 2)
						local _,_,_,_,hitElement,_,_,_,_ = processLineOfSight(x,y,z,x2,y2,z2, false,true)
						if(hitElement) then
							if(getElementType(hitElement) == "vehicle") then
								if(getVehicleOccupant(hitElement)) then
									local rand = math.random(1,5)
									if(rand == 1) then
										StartAnimation(thePed, "ped", "fucku", 1500, false, true, true, false)
									elseif(rand == 2) then
										StartAnimation(thePed, "ped", "ev_step", 1500, false, true, true, false)
									end
								end
							end
						end
						MovePlayerTo[thePed] = FoundBotPath(thePed) or nil -- обычное поведение
					end
				end
			end
		end
	end
	
	
	for thePlayer, _ in pairs(MovePlayerTo) do
		if(isElement(thePlayer)) then
			if(not isPedDead(thePlayer)) then
				local theVehicle = getPedOccupiedVehicle(thePlayer)
				if(theVehicle) then
					local x,y,z = getElementPosition(theVehicle)
					local rx,ry,rz = getElementRotation(theVehicle)
					local brakes = false
					
					local nextrot = GetMarrot(findRotation(x, y, MovePlayerTo[thePlayer][1],MovePlayerTo[thePlayer][2]),rz)
					if(nextrot < 0) then nextrot = nextrot-nextrot-nextrot end
					if(nextrot > 90) then nextrot = 90 end
					local maxspd = 40
					
					local limitspeed = maxspd-((maxspd-10)*(nextrot/90))
					
					
					local vx, vy, vz = getElementVelocity(theVehicle)
					local s = (vx^2 + vy^2 + vz^2)^(0.5)*156
					
					
					-- Ближнее торможение аля пробки
					local x2,y2,z2 = getPositionInFront(theVehicle, 6)
					local _,_,_,_,hitElement,_,_,_,_ = processLineOfSight(x,y,z, x2,y2,z2, false,true,true, false, false, false, false, false, theVehicle)
					if(hitElement) then
						if(getElementType(hitElement) == "vehicle" or getElementType(hitElement) == "player" or getElementType(hitElement) == "ped") then
							brakes = true
						end
					end
					
						
					if(brakes) then
						setPedAnalogControlState(thePlayer, "accelerate", 0)
						setPedAnalogControlState(thePlayer, "brake_reverse", 0)
						setPedControlState(thePlayer, "handbrake", true)
						setElementVelocity(theVehicle, 0,0,0)
					else
						local rot = GetMarrot(findRotation(x,y,MovePlayerTo[thePlayer][1],MovePlayerTo[thePlayer][2]),rz)
						if(rot > 20) then rot = 20
						elseif(rot < -20) then rot = -20 end
						
						if(rot > 0) then
							setPedAnalogControlState(thePlayer, "vehicle_right", (rot)/20)
						else
							setPedAnalogControlState(thePlayer, "vehicle_left", -(rot)/20)
						end
					
					
						setPedAnalogControlState(thePlayer, "brake_reverse", 0)
						setPedControlState(thePlayer, "handbrake", false)
						if(s < limitspeed) then 
							setPedAnalogControlState(thePlayer, "accelerate", 1-(s*1/limitspeed))
						else
							setPedAnalogControlState(thePlayer, "accelerate", 0)
							setPedAnalogControlState(thePlayer, "brake_reverse", (s/limitspeed)-1)
						end
					end
				else
					local dialog = getElementData(thePlayer, "saytome")
					local px,py,pz = getElementPosition(thePlayer)
					if(dialog) then
						setPedAimTarget(thePlayer,px,py,pz)
						setPedAnalogControlState(thePlayer, "forwards", 0)
					else
						local distance = getDistanceBetweenPoints3D(px,py,pz,MovePlayerTo[thePlayer][1],MovePlayerTo[thePlayer][2],MovePlayerTo[thePlayer][3])
						
						if(distance > 1) then
							local angle = findRotation(px,py,MovePlayerTo[thePlayer][1],MovePlayerTo[thePlayer][2])
							if(getElementType(thePlayer) == "player") then
								setPedAnalogControlState(thePlayer, "forwards", 1)
								setPedControlState(thePlayer, "walk", true)
								setPedCameraRotation(thePlayer, angle)
							else
								setPedAnalogControlState(thePlayer, "forwards", 1)
								if(MovePlayerTo[thePlayer][5] == "fast") then
									setPedControlState(thePlayer, "sprint", true)
								else
									setPedControlState(thePlayer, "walk", true)
								end
								setPedCameraRotation(thePlayer, -angle)
							end
							
							if(GetElementAttacker(thePlayer)) then
								local weapon = getPedWeapon(thePlayer)
								if(weapon) then
									local range = 2
									if(weapon > 9) then 
										range = getWeaponProperty(weapon, "poor", "weapon_range")/2
									end
									local firespeed = 300
									if(WeaponTiming[weapon]) then firespeed = WeaponTiming[weapon] end
									if(range > distance) then
										setPedAnalogControlState(thePlayer, "forwards", 0)
										setPedControlState(thePlayer, "sprint", false)
										setPedControlState(thePlayer, "walk", false)
										if(not isTimer(FireTimer[thePlayer])) then
											setPedControlState(thePlayer, "aim_weapon", true)
											setPedAimTarget(thePlayer,MovePlayerTo[thePlayer][1],MovePlayerTo[thePlayer][2],MovePlayerTo[thePlayer][3])
											
											if(MovePlayerTo[thePlayer][8]) then
												setPedControlState(thePlayer, "fire", true)
											end
											
											FireTimer[thePlayer] = setTimer(function(thePlayer)
												setPedControlState(thePlayer, "fire", false)
												setPedAimTarget(thePlayer,0,0,0) -- Костыль
											end, firespeed, 1, thePlayer)
										end
									end
								end
							end
						else
							if(getElementType(thePlayer) == "player") then
								setPedControlState(thePlayer, "forwards", false)
								setElementRotation(thePlayer, 0,0,MovePlayerTo[thePlayer][4],"default",true)
								if(MovePlayerTo[thePlayer][6]) then
									triggerServerEvent(MovePlayerTo[thePlayer][6], thePlayer, thePlayer, unpack(MovePlayerTo[thePlayer][7]))
								end
								MovePlayerTo[thePlayer]=nil
							end
						end
					end
				end
			end
		else
			MovePlayerTo[thePlayer]=nil
		end
	end

end



		
function StartAnimation(thePlayer, block, anim, times, loop, updatePosition, interruptable, freezeLastFrame, forced)
	triggerServerEvent("StartAnimation", localPlayer, thePlayer, block, anim, times, loop, updatePosition, interruptable, freezeLastFrame, forced)
end


local VehTypeSkill = {
	["Automobile"] = 160,
	["Monster Truck"] = 160,
	["Unknown"] = 160,
	["Trailer"] = 160,
	["Train"] = 160,
	["Boat"] = 160,
	["Bike"] = 229,
	["Quad"] = 229,
	["BMX"] = 230,
	["Helicopter"] = 169,
	["Plane"] = 169
}






function getVehicleOneGear(engineAcceleration, dragCoeff, numberOfGears) -- engineAcceleration, dragCoeff, numberOfGears
	return (math.sqrt(3300*engineAcceleration/dragCoeff)*1.18)/numberOfGears
end


function getVehicleGear(theVehicle, engineAcceleration, dragCoeff, numberOfGears)
	local onegear = getVehicleOneGear(engineAcceleration, dragCoeff, numberOfGears)
	local result = 0
	for Gear = 0, numberOfGears, 1 do
		if(getVehicleCurrentGear(theVehicle) > 0) then
			if(onegear*Gear <= VehicleSpeed) then
				if((Gear+1) <= numberOfGears) then
					result = (Gear+1)
				end
			end
		else
			result = 0
		end
	end
    return result
end



function getVehicleRPM(theVehicle, engineAcceleration, dragCoeff, numberOfGears)
	local onegear = getVehicleOneGear(engineAcceleration, dragCoeff, numberOfGears)
	local MaxRPM = GetVehicleMaxRPM(engineAcceleration)
	local Gear = getVehicleGear(theVehicle, engineAcceleration, dragCoeff, numberOfGears)
	local crpm = 0
	if(getKeyState("w") and getKeyState("s") or getKeyState("w") and getKeyState("space")) then
		crpm = MaxRPM/onegear*(onegear-((onegear*Gear)-onegear))
	else
		if(Gear > 0) then
			crpm = MaxRPM/onegear*(onegear-((onegear*Gear)-VehicleSpeed))
		else
			crpm = MaxRPM/onegear*((VehicleSpeed-onegear*Gear))
		end
	end
	if getVehicleEngineState(theVehicle) == true then
		if(crpm < 800) then 
			crpm = 800
		else
			if(crpm > MaxRPM) then crpm = MaxRPM end -- Костыль
		end
	end
    return crpm
end


function GetVehicleMaxRPM(engineAcceleration)
	return (((10*(engineAcceleration))*1.5))*40
end


local PedHorn = {}
function HornPed(thePed, thePlayer)
	if(not isTimer(PedHorn[thePed])) then
		setPedControlState(thePed, "horn", true)
		PedHorn[thePed] = setTimer(function() 
			if(getPedControlState(thePed, "horn")) then
				setPedControlState(thePed, "horn", false)
			else
				setPedControlState(thePed, "horn", true)
			end
		end, math.random(100,500), 5)
		if(thePlayer) then
			local rand = math.random(1,5)
			if(rand > 2) then
				StartAnimation(thePlayer, "ped", "fucku", 1500, false, true, true, false)
			elseif(rand == 1) then
				StartAnimation(thePlayer, "ped", "ev_step", 1500, false, true, true, false)
			elseif(rand == 2) then
				StartAnimation(thePlayer, "ped", "ev_dive", 3000,false,true,true,false)
			end
		end
	end
end


function updateWorld()
	UpdateBot()
	local theVehicle = getPedOccupiedVehicle(localPlayer)
	if(PData["Driver"] and theVehicle) then
		if(getElementDimension(localPlayer) == 0) then
			local x,y,z = getElementPosition(theVehicle)
			PData["Driver"]["Distance"] = PData["Driver"]["Distance"]+getDistanceBetweenPoints3D(PData["Driver"]["drx"], PData["Driver"]["dry"], PData["Driver"]["drz"], x, y, z)
			PData["Driver"]["drx"], PData["Driver"]["dry"], PData["Driver"]["drz"] = x,y,z
			if(PData["Driver"]["Distance"] >= 2000) then
				local VehType = GetVehicleType(theVehicle)
				PData["Driver"]["Distance"] = 0
				triggerServerEvent("AddSkill", localPlayer, localPlayer, VehTypeSkill[VehType], 10)
			end
			
			if(GetVehicleType(theVehicle) == "Automobile" or GetVehicleType(theVehicle) == "Bike") then
				if(not isVehicleOnGround(theVehicle)) then
					if(not PData["Driver"]["jump"]) then 
						PData["Driver"]["jump"] = {0} 
						PData["Driver"]["jump"][2], PData["Driver"]["jump"][3], PData["Driver"]["jump"][4] = getElementPosition(theVehicle)
						PData["Driver"]["jump"][5], PData["Driver"]["jump"][6], PData["Driver"]["jump"][7] = getElementRotation(theVehicle)
						PData["Driver"]["jump"][8], PData["Driver"]["jump"][9], PData["Driver"]["jump"][10] = 0, 0, 0
					end
					PData["Driver"]["jump"][1] = PData["Driver"]["jump"][1]+0.5
					if(PData["Driver"]["jump"][1] >= 20) then
						RageInfo(Text("Отрыв от земли +{points}", {{"{points}", math.round(PData["Driver"]["jump"][1], 0)}}))
						
						local rx,ry,rz = getElementRotation(theVehicle)
						PData["Driver"]["jump"][8] = math.round(PData["Driver"]["jump"][8]+MinusToPlus(math.sin(rx-PData["Driver"]["jump"][5])), 0)
						PData["Driver"]["jump"][9] = math.round(PData["Driver"]["jump"][9]+MinusToPlus(math.sin(ry-PData["Driver"]["jump"][6])), 0)
						PData["Driver"]["jump"][10] = math.round(PData["Driver"]["jump"][10]+MinusToPlus(math.sin(rz-PData["Driver"]["jump"][7])), 0)
						
						PData["Driver"]["jump"][5], PData["Driver"]["jump"][6], PData["Driver"]["jump"][7] = getElementRotation(theVehicle)
						
					end
				else
					if(PData["Driver"]["jump"]) then
						if(PData["Driver"]["jump"][1] >= 20) then
							AddRage(math.round(PData["Driver"]["jump"][1], 0))
							local x,y,z = getElementPosition(theVehicle)
							local jumph = math.floor(PData["Driver"]["jump"][4]-z, 1)
							if(jumph < 0) then jumph = jumph-jumph-jumph end
							if(jumph > 10) then
								local salto = (math.round(PData["Driver"]["jump"][8]/360, 0))+(math.round(PData["Driver"]["jump"][9]/360, 0))+(math.round(PData["Driver"]["jump"][10]/360, 0))
								helpmessage("Дистанция: "..math.floor(getDistanceBetweenPoints2D(PData["Driver"]["jump"][2], PData["Driver"]["jump"][3], x,y), 1)..
								"м Высота: "..jumph.."м "..
								"Переворотов: "..salto..
								" Вращение: "..PData["Driver"]["jump"][8]+PData["Driver"]["jump"][9]+PData["Driver"]["jump"][10].."°")
							end
						end
						PData["Driver"]["jump"] = nil
					end
				end
			end
				
				
			if(VehicleSpeed > 100) then
				local vxl,vyl,vzl, vxr, vyr, vzr = false
				local vxc, vyc, vzc = getElementPosition(theVehicle)
				if(GetVehicleType(theVehicle) == "Automobile") then
					vxl, vyl, vzl = getVehicleComponentPosition(theVehicle, "wheel_lf_dummy", "world")
					vxr, vyr, vzr = getVehicleComponentPosition(theVehicle, "wheel_rf_dummy", "world")
				elseif(GetVehicleType(theVehicle) == "Bike") then
					vxl, vyl, vzl = getVehicleComponentPosition(theVehicle, "wheel_front", "world")
					vxr, vyr, vzr = getVehicleComponentPosition(theVehicle, "wheel_front", "world")
				end
				
				if(vxr) then
					local _,_,rz = getElementRotation(theVehicle)
					
					local x,y,z = getPointInFrontOfPoint(vxc, vyc, vzc, rz-270, 30)
					local _,_,_,_,hitElement,_,_,_,_ = processLineOfSight(vxc, vyc, vzc,x,y,z, false, true, true, false, false, false, false, false, theVehicle,false,false)
					if(hitElement) then
						if(getElementType(hitElement) == "vehicle") then
							if(not PData["VehicleBonus3"]) then PData["VehicleBonus3"] = 0 end
							PData["VehicleBonus3"] = PData["VehicleBonus3"] + 0.2
							if(PData["VehicleBonus3"] > 1) then 
								RageInfo(Text("Преследование +{points}", {{"{points}", math.round(PData["VehicleBonus3"], 0)}}))
							end
						elseif(getElementType(hitElement) == "ped") then
							StartAnimation(hitElement, "ped", "ev_dive", 3000,false,true,true,false)
						end
					else
						if(PData["VehicleBonus3"]) then
							if(PData["VehicleBonus3"] > 1) then 
								AddRage(math.round(PData["VehicleBonus3"], 0))
								PData["VehicleBonus3"] = nil
							end
						end
					end
					
					
					x,y,z = getPointInFrontOfPoint(vxl, vyl, vzl, rz-180, 1)
					_,_,_,_,hitElement,_,_,_,_ = processLineOfSight(vxl,vyl,vzl+0.5,x,y,z+0.5, false, true, false, false, false, false, false, false, theVehicle,false,false)
					if(hitElement) then
						local occ = getVehicleOccupant(hitElement)
						if(occ) then
							if(getElementType(occ) == "ped") then
								local _, _, brz = getElementRotation(hitElement)
								if(brz-rz >= 40 or brz-rz <= -40) then
									if(not isTimer(PData["VehicleBonus"])) then
										AddRage(math.round(VehicleSpeed-100, 0))
										RageInfo(Text("Опасное вождение +{points}", {{"{points}", math.round(VehicleSpeed-100, 0)}}))
										PData["VehicleBonus"] = setTimer(function() end, 2000, 1)
									end
									HornPed(occ)
								else
									if(not isTimer(PData["VehicleBonus"])) then
										AddRage(math.round(VehicleSpeed-100, 0))
										RageInfo(Text("Обгон +{points}", {{"{points}", math.round(VehicleSpeed-100, 0)}}))
										PData["VehicleBonus"] = setTimer(function() end, 2000, 1)
									end
									HornPed(occ)
								end
							end
						end
					end
					
			
					
					x,y,z = getPointInFrontOfPoint(vxr, vyr, vzr, rz, 1)
					_,_,_,_,hitElement,_,_,_,_ = processLineOfSight(vxr, vyr, vzr+0.5,x,y,z+0.5, false, true, false, false, false, false, false, false, theVehicle,false,false)
					if(hitElement) then
						local occ = getVehicleOccupant(hitElement)
						if(occ) then
							if(getElementType(occ) == "ped") then
								local _, _, brz = getElementRotation(hitElement)
								if(brz-rz >= 40 or brz-rz <= -40) then
									if(not isTimer(PData["VehicleBonus"])) then
										AddRage(math.round(VehicleSpeed-100, 0))
										RageInfo(Text("Опасное вождение +{points}", {{"{points}", math.round(VehicleSpeed-100, 0)}}))
										PData["VehicleBonus"] = setTimer(function() end, 2000, 1)
									end
									HornPed(occ)
								else	
									if(not isTimer(PData["VehicleBonus"])) then
										AddRage(math.round(VehicleSpeed-100, 0))
										RageInfo(Text("Обгон +{points}", {{"{points}", math.round(VehicleSpeed-100, 0)}}))
										PData["VehicleBonus"] = setTimer(function() end, 2000, 1)
									end
									HornPed(occ)
								end
							end
						end
					end
				end
			end
		end
	end
	local x,y,z = getElementPosition(localPlayer)
	if(PEDChangeSkin == "play") then
		if(ClosedZones) then
			local i,d = getElementInterior(localPlayer), getElementDimension(localPlayer)
			if(i ~= 0 or d ~= 0) then return false end
			for name, area in pairs(ClosedZones) do
				if(isInsideRadarArea(area, x, y)) then
					ClosedZones[name] = nil
					DestroyRadar(name, area)
					local add = {}
					if(DestroyedBlip[name]) then
						for _, arr in pairs(DestroyedBlip[name]) do
							if(arr[3]) then -- Для обычных зон
								local theBlips = CreateBlip(arr[2], arr[3], 0, 37, 0, 0, 0, 0, 0, 0, 300, arr[4])
								local index = tostring(arr[2]..'_'..arr[3])
								if(not DestroyedBlip[index]) then DestroyedBlip[index] = {} end
								DestroyedBlip[index][#DestroyedBlip[index]+1] = {theBlips, arr[1]}
								ClosedZones[index] = createRadarArea(arr[2]-40, arr[3]-40, 80, 80, 0, 0, 0,0)
								add[index] = {arr[2]-40, arr[3]-40, 80, 80, index}
							else -- Для неизвестных значков
								setBlipIcon(arr[1], arr[2])
								SetZoneDisplay(getElementData(arr[1], "info"))
								--[[local x,y,z = getPedBonePosition(localPlayer, 8)
								sx,sy = getScreenFromWorldPosition(x,y,z)
								PData['ExpText'][#PData['ExpText']+1] = {"Открыта новая зона! "..getElementData(arr[1], "info"), sx,sy}--]]
							end
						end
					end
					triggerServerEvent("SaveClosedZones", localPlayer, localPlayer, name, toJSON(add))
				end
			end
		end
	end
end
setTimer(updateWorld, 50, 0)


function CheckZoneCollect(zone)
	PData["DisplayCollection"] = {}

	local CollectionNames = {
		[954] = "Подкова", 
		[953] = "Ракушка",
		[1276] = "Реликвия"
	}
		
	for model, dat in pairs(Collections) do
		if(dat[zone]) then
			local count, total = 0, 0
			
			for i, v in pairs(dat[zone]) do
				if(isElement(v)) then
					count = count+1
				end
				total = total+1
			end
			
			if(count > 0) then
				PData["DisplayCollection"][CollectionNames[model]] = {total, count}
			end
		end
	end
end



function checkKey()
	if(PEDChangeSkin == "play") then
		local theVehicle = getPedOccupiedVehicle(localPlayer)
		if(getPedControlState(localPlayer, "sprint")) and PData["stamina"] ~= 0 then
			PData["stamina"] = PData["stamina"]-1
			if(getPedStat(localPlayer, 22) ~= 1000) then
				PData["LVLUPSTAMINA"] = PData["LVLUPSTAMINA"]-1
				if(PData["LVLUPSTAMINA"] == 0) then
					triggerServerEvent("StaminaOut", localPlayer, true)
					PData["LVLUPSTAMINA"]=10
				end
			end
		end
		if(PData["stamina"] <= 0) then
			triggerServerEvent("StaminaOut", localPlayer)
			setPedControlState(localPlayer, "sprint", false)
			PData["ShakeLVL"] = PData["ShakeLVL"]+5
		end
		
		for _, thePlayer in pairs(getElementsByType("player", getRootElement(), true)) do
			UpdateArmas(thePlayer)
		end
		for _, thePed in pairs(getElementsByType("ped", getRootElement(), true)) do
			UpdateArmas(thePed)
		end
		if(theVehicle and PData["ClearDriving"]) then
			if(VehicleSpeed < 1) then
				if(isTimer(PData["ClearDriving"])) then resetTimer(PData["ClearDriving"]) end
				if(getElementData(theVehicle, "owner") == getPlayerName(localPlayer)) then
					ChangeInfo(Text("Нажми {key} чтобы припарковать машину", {{"{key}", COLOR["KEY"]["HEX"].."P#FFFFFF"}}), 1000)
				end
			end
		end
	end	
	if(PING) then UpdateTabEvent() end
	
	local x,y,z = getElementPosition(localPlayer)
	local x2,y2,z2 = getPositionInFront(localPlayer, 1)
	PData["TARR"] = {} 
	for i = 1, 3 do
		local _,_,_,_,_,_,_,_,_,_,_,wmodel,wx,wy,wz = processLineOfSight(x,y,z,x2,y2,z2-(1-(0.5*i)), true,false,false,true,false,false,false,false,localPlayer, true) 
		if(wmodel) then
			PData["TARR"][wmodel] = {wx,wy,wz}
		end
	end
	
	
	if(PData['gps']) then
		if(#PData['gps'] == 0) then
			PData['gps'] = nil
		else
			for k,el in pairs(PData['gps']) do
				if(isInsideRadarArea(el, x, y)) then
					for slot = k, #PData['gps'] do
						destroyElement(PData['gps'][slot])
						PData['gps'][slot] = nil
						if(PData['automove']) then
							autoMove()
						end
					end
					break
				end
			end
		end
	end
	
	
	for k, arr in pairs(PData["TARR"]) do
		if(k) then
			if(PData["Target"][k]) then
				if(PData["Target"][k][1] == arr[1] and PData["Target"][k][2] == arr[2] and PData["Target"][k][3] == arr[3]) then
					return
				end
			end
			PData["Target"][k] = {arr[1], arr[2], arr[3]}
			if(WardrobeObject[k]) then
				ToolTip(Text("Нажми {key} чтобы переодеться", {{"{key}", COLOR["KEY"]["HEX"].."F#FFFFFF"}}))
			
			end
		end
	end
	for i, key in pairs(PData["Target"]) do
		if(not PData["TARR"][i]) then
			PData["Target"][i] = nil
		end
	end
end
setTimer(checkKey,700,0)






addEventHandler("onClientElementDataChange", getRootElement(),
function(dataName, oldValue)
	if getElementType(source) == "ped" then
		if dataName == "DynamicBot" then
			if(StreamData[source]) then
				StreamData[source]["UpdateRequest"] = true
			end
		end
	elseif getElementType(source) == "vehicle" then
		if dataName == "trunk" then
			 triggerEvent("onClientElementStreamOut", source, true)
		end
	end
end)






local BannedMaterial = {
	[0] = true, 
	[1] = true, 
	[9] = true, 
	[75] = true, 
	[76] = true,
	[118] = true,
}



function BotCheckPath(x,y,z,x2,y2,z2,zone)
	local gz = getGroundPosition(x2,y2,z2)
	if(isLineOfSightClear(x,y,z-0.45,x2,y2,gz+0.1, true, true, true, true)) then
		if(zone == getZoneName(x2,y2,z2)) then
			if(zone ~= "Unknown") then  
				local material = GetGroundMaterial(x2,y2,z2, gz-2)
				if(not BannedMaterial[material]) then
					return true
				end
			else
				return true
			end
		end
	end
	return false
end






function FoundBotPath(ped)
	local arr = {}
	local x,y,z = getElementPosition(ped)
	local x2,y2,z2 = getPositionInFront(ped, 8)
	local zone = getZoneName(x,y,z, false)
	
	if(getElementData(ped, "GROUP")) then
		local thePlayer = getPlayerFromName(getElementData(ped, "GROUP"))
		if(thePlayer) then
			local xp,yp,zp = getElementPosition(thePlayer)
			return {xp,yp,zp,0,"silent"}
		end
	end
	
	if(BotCheckPath(x,y,z,x2,y2,z2,zone)) then 
		return {x2,y2,z2,0,"silent"}
	else
		local x3,y3,z3 = getPositionInRight(ped, 2)
		local a3,b3,c3 = getPositionInFR(ped, 2)
		local x4,y4,z4 = getPositionInLeft(ped, 2)
		local a4,b4,c4 = getPositionInFL(ped, 2)
		if(BotCheckPath(x,y,z, a3,b3,c3,zone)) then
			arr[#arr+1] = {a3,b3,c3,0,"silent"}
		elseif(BotCheckPath(x,y,z, x3,y3,z3,zone)) then
			arr[#arr+1] = {x3,y3,z3,0,"silent"}
		end

		if(BotCheckPath(x,y,z, a4,b4,c4,zone)) then
			arr[#arr+1] = {a4,b4,c4,0,"silent"}
		elseif(BotCheckPath(x,y,z, x4,y4,z4,zone)) then
			arr[#arr+1] = {x4,y4,z4,0,"silent"}
		end

		if(#arr == 0) then
			local x5,y5,z5 = getPositionInBack(ped, 8)
			if(BotCheckPath(x,y,z, x5,y5,z5,zone)) then -- В крайнем случае идем назад
				return {x5,y5,z5,0,"silent"}
			else
				if(getElementData(ped, "TINF")) then
					local arrtmp = fromJSON(getElementData(ped, "TINF"))
					
					arr = {arrtmp[3], arrtmp[4], arrtmp[5], arrtmp[6], "silent"}
					return arr --Если нет путей
				else
					return false
				end
			end
		end
		return arr[math.random(1,#arr)] --Если спереди что то мешает выбераем рандомный свободный путь
	end
end





	
local SkillName = {
	[160] = "Вождение",
	[229] = "Мотоциклист",
	[230] = "Велосипедист",
	[169] = "Летчик",
	[161] = "Грузоперевозки",
	[157] = "Рыболов",
	[177] = "Рукопашный бой",
	[69] = "Пистолет",
	[70] = "Пистолет с глуш.",
	[71] = "Дигл",
	[72] = "Дробовик",
	[73] = "Sawn-Off",
	[74] = "SPAZ-12",
	[75] = "УЗИ",
	[76] = "MP5",
	[77] = "АК-47",
	[78] = "M4",
	[79] = "Винтовка",
	[24] = "Здоровье",
	[22] = "Выносливость"
}

 
 
function getPointInFrontOfPoint(x, y, z, rZ, dist)
	local offsetRot = math.rad(rZ)
	local vx = x + dist * math.cos(offsetRot)
	local vy = y + dist * math.sin(offsetRot)  
	return vx, vy, z
end







function getMatrixFromEulerAngles(x,y,z)
	x,y,z = math.rad(x),math.rad(y),math.rad(z)
	local sinx,cosx,siny,cosy,sinz,cosz = math.sin(x),math.cos(x),math.sin(y),math.cos(y),math.sin(z),math.cos(z)
	return
		cosy*cosz-siny*sinx*sinz,cosy*sinz+siny*sinx*cosz,-siny*cosx,
		-cosx*sinz,cosx*cosz,sinx,
		siny*cosz+cosy*sinx*sinz,siny*sinz-cosy*sinx*cosz,cosy*cosx
end

function getEulerAnglesFromMatrix(x1,y1,z1,x2,y2,z2,x3,y3,z3)
	local nz1,nz2,nz3
	nz3 = math.sqrt(x2*x2+y2*y2)
	nz1 = -x2*z2/nz3
	nz2 = -y2*z2/nz3
	local vx = nz1*x1+nz2*y1+nz3*z1
	local vz = nz1*x3+nz2*y3+nz3*z3
	return math.deg(math.asin(z2)),-math.deg(math.atan2(vx,vz)),-math.deg(math.atan2(x2,y2))
end




function updateStamina()
	if(PEDChangeSkin == "play") then
		if PData["stamina"] ~= 8+math.floor(getPedStat(localPlayer, 22)/40) and getPedControlState(localPlayer, "sprint") == false then
			PData["stamina"] = PData["stamina"] +1
		end
		if(PData["ShakeLVL"] > 1) then
			PData["ShakeLVL"]=PData["ShakeLVL"]-1
			setCameraShakeLevel(PData["ShakeLVL"])
		end
	end
end
setTimer(updateStamina,1000,0)



function DrugsPlayerEffect()
	if(isTimer(DrugsTimer)) then
		resetTimer(DrugsTimer)
	else
		DrugsTimer = setTimer(function()
			setWeather(math.random(0,19))
			setWindVelocity(math.random(1,100), math.random(1,100), math.random(1,100))
			setGameSpeed(math.random(1,20)/10)
			setSkyGradient(math.random(0,255), math.random(0,255), math.random(0,255), math.random(0,255), math.random(0,255), math.random(0,255))
		end, 1000+math.random(0,4000), 0 )
	end
end



function SpunkPlayerEffect()
	if(isTimer(SpunkTimer)) then
		resetTimer(SpunkTimer)
	else
		SpunkTimer = setTimer(function()
			SleepSound("script", math.random(1,200), math.random(0,55), false)
		end, 1000+math.random(0,4000), 0 )
	end
end





function OpenTAB()
	if(Targets["theVehicle"]) then
		if(getVehiclePlateText(Targets["theVehicle"]) == "SELL 228") then
			triggerServerEvent("BuyCar", localPlayer, Targets["theVehicle"])
		end
	end
	UpdateTabEvent()
end


function UpdateTabEvent()
	IDF, NF, RANG, PING = "","","",""
	TABCurrent = 0
	

	
	local thePlayers = getElementsByType("player")
	if(TabScroll > #thePlayers) then TabScroll = #thePlayers end
	for slot = TabScroll, #thePlayers do
		if(TABCurrent < MAXSCROLL) then
			RANG=RANG.."".."\n"
			IDF = IDF..getElementData(thePlayers[slot], "id").."\n"
			NF = NF..getElementData(thePlayers[slot], "color")..getPlayerName(thePlayers[slot]):gsub('#%x%x%x%x%x%x', '').."\n"
			PING = PING..getPlayerPing(thePlayers[slot]).."\n"
			TABCurrent=TABCurrent+1
		end
	end
end

function CloseTAB()
	IDF = false
	NF = false
	RANG = false
	PING = false
end








function updateCamera()
	for _, thePlayer in pairs(getElementsByType("player", getRootElement(), true)) do
		UpdateDisplayArmas(thePlayer)
	end
	for _, thePed in pairs(getElementsByType("ped", getRootElement(), true)) do
		UpdateDisplayArmas(thePed)
				
		local theVehicle = getPedOccupiedVehicle(thePed)
		if(theVehicle) then -- Костыль 
			local x,y,z = getElementPosition(theVehicle)
			local gz = getGroundPosition(x,y,z)
			local material = GetGroundMaterial(x,y,z+50,gz-3)
			local material2 = GetGroundMaterial(x+2,y,z+50,gz-3)
			if(material == 1337 and material2 == 1337) then -- Костыль
				if(StreamData[thePed]["UpdateRequest"]) then
					StreamData[thePed]["UpdateRequest"] = false
					triggerServerEvent("UpdateBotRequest", localPlayer, localPlayer, thePed)
				end
			end
		end
	end
	
	
	if(PData["ResourceMap"]) then
		setSkyGradient(170,103,0 ,170,103,0) -- ,170,103,0
	end
	
	
	for mar, dat in pairs(AnimatedMarker) do
		if(dat[1] == "up") then
			dat[2] = dat[2]+0.01
			if(dat[2] >= 0.25) then
				dat[1] = "down"
			end
		else
			dat[2] = dat[2]-0.01
			if(dat[2] <= -0.25) then
				dat[1] = "up"
			end
		end
		if(isElementAttached(mar)) then
			setElementAttachedOffsets(mar, dat[3], dat[4], dat[5]+dat[2])
		else
			setElementPosition(mar, dat[3], dat[4], dat[5]+dat[2])
		end
	end
end
addEventHandler("onClientPreRender", getRootElement(), updateCamera)




function CreateButtonInputInt(func, text, args)
	if(PText["HUD"][8]) then
		PText["HUD"][8] = nil
	else
		PText["HUD"][8] = {text, screenWidth, screenHeight-(650*scalex), 0, 0, tocolor(0, 0, 0, 255), NewScale*2, "default-bold", "center", "top", false, false, false, true, true, 0, 0, 0, {}}

		BindedKeys["enter"] = {"ServerCall", localPlayer, {func, localPlayer, localPlayer, "", args}}
	end
end
addEvent("CreateButtonInputInt", true)
addEventHandler("CreateButtonInputInt", localPlayer, CreateButtonInputInt)



function LoginClient(open)
	if(open) then
		CreateButtonInputInt("loginPlayerEvent", Text("Регистрация/Вход"))
		showCursor(true)
		
		outputChatBox(Text("Нажми {key} чтобы писать в общий чат", {{"{key}", COLOR["KEY"]["HEX"].."T#FFFFFF"}}),  255, 255, 255,true)
		outputChatBox(Text("Нажми {key} чтобы писать в командный чат", {{"{key}", COLOR["KEY"]["HEX"].."Y#FFFFFF"}}),  255, 255, 255,true)
		outputChatBox(Text("Исходный код сервера {link}", {{"{link}", "#2980B9https://github.com/alexaxel705/MTA-Tomsk"}}),  255, 255, 255,true)
		outputChatBox(Text("Группа ВКонтакте {link}", {{"{link}", "#2980B9http://vk.com/mtatomsk"}}),  255, 255, 255,true)
		
		PText["INVHUD"][10] = {"Русский", 100*NewScale, 500*NewScale, screenWidth, screenHeight, tocolor(255, 255, 255, 255), NewScale*2, "default-bold", "left", "top", false, false, true, true, false, 0, 0, 0, {["border"] = true}, {"ServerCall", localPlayer, {"SetLang", localPlayer, localPlayer, "Русский"}}}
		PText["INVHUD"][11] = {"English", 100*NewScale, 540*NewScale, screenWidth, screenHeight, tocolor(255, 255, 255, 255), NewScale*2, "default-bold", "left", "top", false, false, true, true, false, 0, 0, 0, {["border"] = true}, {"ServerCall", localPlayer, {"SetLang", localPlayer, localPlayer, "English"}}}
		PText["INVHUD"][12] = {"Portuguese", 100*NewScale, 580*NewScale, screenWidth, screenHeight, tocolor(255, 255, 255, 255), NewScale*2, "default-bold", "left", "top", false, false, true, true, false, 0, 0, 0, {["border"] = true}, {"ServerCall", localPlayer, {"SetLang", localPlayer, localPlayer, "Portuguese"}}}
		PText["INVHUD"][13] = {"Azerbaijani", 100*NewScale, 620*NewScale, screenWidth, screenHeight, tocolor(255, 255, 255, 255), NewScale*2, "default-bold", "left", "top", false, false, true, true, false, 0, 0, 0, {["border"] = true}, {"ServerCall", localPlayer, {"SetLang", localPlayer, localPlayer, "Azerbaijani"}}}
		PText["INVHUD"][14] = {"Turkish", 100*NewScale, 660*NewScale, screenWidth, screenHeight, tocolor(255, 255, 255, 255), NewScale*2, "default-bold", "left", "top", false, false, true, true, false, 0, 0, 0, {["border"] = true}, {"ServerCall", localPlayer, {"SetLang", localPlayer, localPlayer, "Turkish"}}}
	else
		PText["HUD"][8] = nil
	end
end
addEvent("LoginWindow", true)
addEventHandler("LoginWindow", localPlayer, LoginClient)



function StartUnload()
	LoginClient(false)
	for name, dat in pairs(VideoMemory) do
		VideoMemory[name] = {}
	end
	stopSound(GTASound)
	return true
end





function HUDPreload()
	VideoMemory["HUD"]["TABPanel"] = dxCreateRenderTarget(screenWidth, screenHeight, true)
	dxSetRenderTarget(VideoMemory["HUD"]["TABPanel"], true)
	dxSetBlendMode("modulate_add")

	local x,y = 510*scalex, 270*scaley
	dxDrawRectangle(x,y, 750*NewScale, 500*NewScale, tocolor(0, 0, 0, 180))	
	dxDrawBorderedText("RPG RealLife (Russian Federation/Tomsk)", 540*scalex, 285*scaley, 0, 0, tocolor(200, 200, 200, 255), NewScale*1.2, "default-bold", "left", "top")
	dxDrawBorderedText(Text("ид"), x+(15*NewScale), y+(40*scaley), 0, 0, tocolor(74, 140, 178, 255), NewScale*1.2, "default-bold", "left", "top")
	dxDrawBorderedText(Text("ник"), x+(60*NewScale), y+(40*scaley), 0, 0, tocolor(74, 140, 178, 255), NewScale*1.2, "default-bold", "left", "top")
	dxDrawBorderedText("", x+(300*NewScale), y+(40*scaley), 0, 0, tocolor(74, 140, 178, 255), NewScale*1.2, "default-bold", "left", "top")
	dxDrawBorderedText(Text("пинг"), x+(710*NewScale), y+(40*scaley), 0, 0, tocolor(74, 140, 178, 255), NewScale*1.2, "default-bold", "left", "top")
	dxDrawLine(510*scalex, 329*scaley, x+(750*NewScale), 329*scaley, tocolor(120,120,120,255), 1)
	dxDrawRectangle(475*scalex, 810*scaley, 470*NewScale, 215*NewScale, tocolor(0, 0, 0, 170))
	dxDrawBorderedText(Text("Итоги"), 500*scalex, 780*scaley, 0, 0, tocolor(255, 255, 255, 255), NewScale*4, "default-bold", "left", "top")
	dxSetBlendMode("blend")

	VideoMemory["HUD"]["WantedBackground"] = dxCreateRenderTarget(dxGetTextWidth("★★★★★★", NewScale*2, "pricedown", false), dxGetFontHeight(NewScale*2, "pricedown"), true)
	dxSetRenderTarget(VideoMemory["HUD"]["WantedBackground"], true)
	dxSetBlendMode("modulate_add")
	dxDrawBorderedText("★★★★★★", 0, 0, 0, 0, tocolor(40,40,40,200), NewScale*2, "pricedown", "left", "top")
	dxSetBlendMode("blend")
	
	VideoMemory["HUD"]["Cinema"] = dxCreateRenderTarget(screenWidth, screenHeight, true)
	dxSetRenderTarget(VideoMemory["HUD"]["Cinema"], true)
	dxSetBlendMode("modulate_add")
	dxDrawRectangle(0,0,screenWidth, screenHeight/9, tocolor(0,0,0,255))
	dxDrawRectangle(0,screenHeight-(screenHeight/9),screenWidth, screenHeight/9, tocolor(0,0,0,255))
	dxSetBlendMode("blend")

	VideoMemory["HUD"]["CollectionCircle"] = dxCreateRenderTarget(100*NewScale, 100*NewScale, true)
	dxSetRenderTarget(VideoMemory["HUD"]["CollectionCircle"], true)
	dxSetBlendMode("modulate_add")
	dxDrawCircle(50*NewScale, 50*NewScale, 0, 40*NewScale, 1, 0, 360, tocolor(70,74,70,15))
	dxDrawCircle(50*NewScale, 50*NewScale, 40*NewScale, 5*NewScale, 1, 0, 360, tocolor(20,24,20,15))
	dxSetBlendMode("blend")
	
	VideoMemory["HUD"]["BlackScreen"] = dxCreateRenderTarget(screenWidth, screenHeight, true)
	dxSetRenderTarget(VideoMemory["HUD"]["BlackScreen"], true)
	dxSetBlendMode("modulate_add")
	dxDrawRectangle(0,0,screenWidth,screenHeight,tocolor(0,0,0,255))
	dxSetBlendMode("blend")
	
	VideoMemory["HUD"]["PlayerInv"] = dxCreateRenderTarget((screenWidth)-((80*NewScale)*10), (80*NewScale), true)
	dxSetRenderTarget(VideoMemory["HUD"]["PlayerInv"], true)
	dxSetBlendMode("modulate_add")
	
	
	local x = 0
	local y = 0
	for i = 1, 10 do 
		local CRAM = tocolor(81,81,105,255)
		dxDrawLine(x, y, x, y+(80*NewScale), CRAM, 1)
		dxDrawLine(x+(80*NewScale), y, x+(80*NewScale), y+(80*NewScale), CRAM, 1)
		dxDrawLine(x, y, x+(80*NewScale), y, CRAM, 1)
		dxDrawLine(x, y+(80*NewScale), x+(80*NewScale), y+(80*NewScale), CRAM, 1)
		dxDrawLine(x, y+(80*NewScale), x+(80*NewScale), y+(80*NewScale), CRAM, 1)
		
		
		local n = i
		if(i == 10) then n = "0" end
		dxDrawText(n, x+(4*NewScale), y, x, y, tocolor(255, 255, 255, 255), NewScale/0.8, "default-bold", "left", "top")
		
		x=x+(80.5*NewScale)
	end
	
	dxSetBlendMode("blend")

	dxSetRenderTarget()
	return true
end




function GenerateTextureCompleted(textures) -- Третий этап загрузки
	for name, texture in pairs(textures) do
		items[name][1] = texture
	end

	triggerServerEvent("SyncTime", localPlayer, localPlayer)

	PEDChangeSkin = "intro"
	showChat(true)
	fadeCamera(true, 2.0)
	SetPlayerHudComponentVisible("all", false)

	LoginClient(true)
	PlaySFXSound(10)
	
	setCameraMatrix(1698.9, -1538.9, 13.4, 1694.2, -1529, 13.5)
end
addEvent("GenerateTextureCompleted", true)
addEventHandler("GenerateTextureCompleted", localPlayer, GenerateTextureCompleted)


local MyTextures = {
	["Кулак"] = {1666, 0,0,0, 0,0,0, 0,70, 255}, 
	["Фекалии"] = {16444, -2,-4,1, 0,0,0, 0,70, 255}, 
	["АК-47"] = {355, 0.3,1,0, 0.3,0,0, 0,70, 110}, 
	["Кольт 45"] = {346, 0.2,0.4,0.05, 0.1,-0.2,0.05, 0,70, 110}, 
	["Узи"] = {352, 0.2,0.4,0, 0,-0.2,0, 0,70, 110}, 
	["Pissh Gold"] = {1544, 0.3,0.6,0.2, 0,0,0.2, 0,70, 170}, 
	["Pissh"] = {1543, 0.2,0.6,0.2, 0,0,0.2, 0,70, 170}, 
	["USP-S"] = {347, 0.2,0.4,0.05, 0.2,-0.2,0.05, 0,70, 170}, 
	["Deagle"] = {348, 0.4,0.35,0.05, 0,-0.5,0.05, 0,70, 170}, 
	["MP5"] = {353, 0.2,0.5,0.08, 0.2,-0.1,0.08, 0,70, 170}, 
	["Кока"] = {782, 0,15,5, 0,0,5, 0,70, 160}, 
	["Конопля"] = {823, 0,10,0, 0,0,0, 0,70, 160}, 
	["Tec-9"] = {372, 0.4,0.4,0, 0.2,-0.2,0, 0,70, 110}, 
	["Чемодан"] = {1210, 0,0.5,0.03, 0,0,0.03, 0,70, 140}, 
	["Рюкзак"] = {3026, 0.2,-0.7,0, 0.2,0,0, 270,70, 140}, 
	["М16"] = {356, 0.3,1,0, 0.3,0,0, 0,70, 110},
	["Mossberg"] = {349, 0.3,0.9,0, 0.3,0,0, 8,70, 110}, 
	["ИЖ-12"] = {357, 0.3,1,0.05, 0.3,0,0.05, 352,70, 110}, 
	["SPAS-12"] = {351, 0.4,0.6,0.1, 0.4,0,0.1, 8,70, 110}, 
	["M40"] = {358, 0.3,0.9,0, 0.3,0,0, 8,70, 110}, 
	["Sawed-Off"] = {350, 0.3,0.5,0.05, 0.3,0,0.05, 8,70, 110}, 
	["Парашют"] = {371, 0,-0.7,0.02, 0,0,0.02, 0,70, 110}, 
	["Бензопила"] = {341, 0.45,0.9,0.12, 0.45,0,0.12, 8,70, 110}, 
	["Dildo XXL"] = {321, 0,0.7,0.2, 0,0,0.2, 290,70, 110}, 
	["Dildo"] = {322, 0.06,0.4,0.05, 0.06,0,0.05, 290,70, 110}, 
	["Вибратор"] = {323, 0.05,0.6,0.1, 0.05,0,0.1, 290,70, 110}, 
	["Пакет"] = {2663, 0,-0.7,0.02, 0,0,0.02, 0,70, 150}, 
	["Нож"] = {335, 0.1,-0.3,0.1, 0.1,0,0.1, 290,70, 110}, 
	["Удочка"] = {338, 0.1,-1.4,0.7, 0.1,0,0.7, 290,70, 110}, 
	["Клюшка"] = {333, 0.1,-0.8,0.4, 0.1,0,0.4, 290,70, 110}, 
	["Лопата"] = {337, 0.1,-0.8,0.4, 0.1,0,0.4, 290,70, 110}, 
	["Бита"] = {336, 0.1,-0.7,0.3, 0.1,0,0.3, 290,70, 110}, 
	["Дубинка"] = {334, 0.1,-0.7,0.2, 0.1,0,0.2, 290,70, 110}, 
	["Катана"] = {339, 0.1,-0.9,0.4, 0.1,0,0.4, 290,70, 110}, 
	["Камера"] = {367, 0.15,0.4,0.05, 0.15,0,0.05, 20,70, 110}, 
	["KBeer"] = {1950, 0.3,0.6,0, 0,0,0, 0,70, 250}, 
	["KBeer Dark"] = {1951, 0.3,0.6,0, 0,0,0, 0,70, 250}, 
	["isabella"] = {1669, 0.3,0.5,0, 0,0,0, 0,70, 250}, 
	["Бронежилет"] = {1242, 0,0.6,0.007, 0,0,0.007, 0,70, 140}, 
	["Спанк"] = {1279, 0,1,0.1, 0,0,0.1, 0,70, 255}, 
	["Кровь"] = {1580, 0,0.8,0.1, 0,0,0.1, 0,70, 255}, 
	["Граната"] = {342, 0.05,0.4,0, 0.05,0,0, 0,70, 255}, 
	["Молотов"] = {344, 0.2,-0.5,0, 0.1,0,0, 0,70, 255}, 
	["Канистра"] = {1650, 0,-0.6,-0.12, 0,0,-0.12, 0,70, 250}, 
	["Телефон"] = {330, 0,0.5,0, 0,0,0, 0,70, 250}, 
	["Подкова"] = {954, 0,0.9,0.04, 0,0,0.04, 0,70, 250}, 
	["Реликвия"] = {1276, 0,1,0.03, 0,0,0.03, 0,70, 250}, 
	["Запаска"] = {1025, 1.5,0,0, 0,0,0, 0,70, 150}, 
	["CoK"] = {2670, 0.14,0.18,0.28, 0.14,0.18,-0.28, 100,70, 250}, 
	["Сигарета"] = {3027, 0.31,0.01,0.08, 0,0.01,0.08, 290,70, 130}, 
	["Черепаха"] = {1609, 0,0,5, 0,0,0, 0,70, 250}, 
	["Акула"] = {1608, 0,0,10, 0,0,0, 60,70, 250}, 
	["Дельфин"] = {1607, 0,0,10, 0,0,0, 60,70, 250}, 
	["Рыба"] = {1600, 1,0,0.1, 0,0,0.1, 0,70, 255}, 	
	["Косяк"] = {3027, 0.31,0.01,0.08, 0,0.01,0.08, 290,70, 130}, 
	["7.62-мм"] = {18044, -3.3,-3.3,-0.6, 4.5,9,-2.5, 0,70, 250}, 
	["5.56-мм"] = {18044, -1.2,-3.3,-0.6, 4.5,9,-2.5, 0,70, 250}, 
	["9-мм"] = {18044, -4.5,1.2,-0.5, 4.5,4,-2.5, 0,70, 250}, 
	["18.5-мм"] = {18044, -4.5,1.2,-0.5, 4.5,4,-2.5, 0,70, 250}, 
	["Скот"] = {11470, 10,0,1.2, 0,0,1.2, 0,70, 255}, 
	["Мясо"] = {2805, 0,1.5,0, 0,0,0, 0,70, 255}, 
	["Нефть"] = {3632, 2,0,0, 0,0,0, 0,70, 255}, 
	["Пропан"] = {1370, 2,0,0, 0,0,0, 0,70, 255}, 
	["Химикаты"] = {1218, 2,0,0.1, 0,0,0.1, 0,70, 255}, 
	["Удобрения"] = {1222, 2,0,0.1, 0,0,0.1, 0,70, 255}, 
	["Бензин"] = {1225, 2,0,0.2, 0,0,0.2, 0,70, 255}, 
	["Зерно"] = {1453, 2,0,0, 0,0,0, 0,70, 200},
	["Газета"] = {2674, 0.8,0.2,0.75, 0.8,0.2,0, 0,70, 200},
	["Деньги"] = {1212, 0.2,0.2,0.35, -0.05,-0.05,0, 0,70, 200},
	["Кредитка"] = {1581, -0.3,0.7,0.6, 0,0,0, 0,70, 200},
	["Огнетушитель"] = {366, 0.35,0.9,-0.06, 0.35,0,-0.06, 8,70, 110}, 
	["Базука"] = {359, -0.1,1.2,0.05, -0.1,0,0.05, 0,70, 110}, 
	["Спрей"] = {365, 0.05,-0.35,-0.05, 0.05,-0.05,-0.05, 0,70, 250}, 
	["Огнемет"] = {361, 0.45,0.9,0.12, 0.45,0,0.12, 8,70, 110}, 
	["Ракушка"] = {953, 0,1.2,0, 0,0,0, 0,70, 250}, 
	["Ракета"] = {345, 0.8,0,0, 0.4,0,0, 0,70, 250}, 
	["Алкоголь"] = {2900, 2.5,0,0.6, 0,0,0.6, 0,70, 255}, 
}


function onDownloadFinish(file, success) -- Второй этап загрузки
	if(file == "lang/"..PData["LANG"]) then
		local hFile = fileOpen("lang/"..PData["LANG"], true)

		local ft = fileRead(hFile, 5500)
		while not fileIsEOF(hFile) do
			ft = ft .. fileRead(hFile, 5500)
		end
		
		ft = string.gsub(ft, 'msgid ""\n', 'msgid ')
		ft = string.gsub(ft, 'msgstr ""\n', 'msgstr ')
		ft = string.gsub(ft, '"\n"', '')
		LangArr = {}
		local Lines = split(ft, "\n")
		for i = 1, #Lines do
			if(string.sub(Lines[i], 0, 5) == "msgid") then
				LangArr[string.sub(Lines[i], 8, #Lines[i]-1)] = string.sub(Lines[i+1], 9, #Lines[i+1]-1)
			end
		end
		fileClose(hFile)
	end
	
	if(HUDPreload()) then
		triggerEvent("GenerateTexture", root, MyTextures)
	end
end
addEventHandler("onClientFileDownloadComplete", root, onDownloadFinish)





function StartLoad() -- Первый этап загрузки
	setTime(12, 0)
	setWeather(0)
	setFogDistance(300)
	setFarClipDistance(300)
	setMinuteDuration(1000)
	downloadFile("lang/"..PData["LANG"])
end
StartLoad()









function AuthComplete(CollectDat)
	local data = fromJSON(CollectDat)

	for model, dat in pairs(Collections) do
		for zone, dat2 in pairs(dat) do
			for i, v in pairs(dat2) do
				if(not data[tostring(model)][tostring(i)]) then
					Collections[model][zone][i] = createPickup(v[1],v[2],v[3], 3, model, 0)
					setElementData(Collections[model][zone][i], "id", i)
				end
			end
		end
	end


	PText["INVHUD"][10] = nil
	PText["INVHUD"][11] = nil
	PText["INVHUD"][12] = nil
	PText["INVHUD"][13] = nil
	PText["INVHUD"][14] = nil
end
addEvent("AuthComplete", true)
addEventHandler("AuthComplete", localPlayer, AuthComplete)




function SetLang(lang)
	PData["LANG"] = lang
	if(StartUnload()) then
		StartLoad()
	end
end
addEvent("SetLang", true)
addEventHandler("SetLang", localPlayer, SetLang)






function CallPhoneInput()
	CreateButtonInputInt("CallPhoneOutput", Text("Введи номер или ИД игрока"))
end
addEvent("CallPhoneInput", true)
addEventHandler("CallPhoneInput", localPlayer, CallPhoneInput)




function UpdTarget() targetingActivated(getPedTarget(localPlayer)) end
addEvent("UpdTarget", true)
addEventHandler("UpdTarget", localPlayer, UpdTarget)





function stopVehicleEntry(thePlayer, seat, door)
	if(getVehiclePlateText(source) == "SELL 228") then
		setVehicleLocked(source, true)
	elseif(getElementData(source, "owner")) then
		if(getElementData(source, "owner") ~= getPlayerName(thePlayer)) then
			setVehicleLocked(source, true)
		else
			setVehicleLocked(source, false)		
		end
	end
end
addEventHandler("onClientVehicleStartEnter",getRootElement(),stopVehicleEntry)








function CreateBlip(x, y, z, icon, size, r, g, b, a, ordering, visibleDistance, info)
	PData['blip'][#PData['blip']+1] = createBlip(x, y, z, icon, size, r, g, b, a, ordering, visibleDistance)
	setElementData(PData['blip'][#PData['blip']], 'info', Text(info))
	return PData['blip'][#PData['blip']]
end


function ReadNewsPaper(y,m)
	PData["WebLink"] = "http://109.227.228.4/engine/include/MTA/newspaper.php?y="..y.."&m="..m
	if(not isBrowserDomainBlocked(PData["WebLink"], true)) then
		if(not NewsPaper[1]) then
			NewsPaper[1] = createBrowser(screenWidth/1.5, screenHeight/1.5, false, false)
			NewsPaper[3] = PData["WebLink"]
		else
			CloseNewsPaper()
		end
	else
		requestBrowserDomains({PData["WebLink"], true})
	end
end
addEventHandler("onClientBrowserWhitelistChange", root, ReadNewsPaper)


function onClientBrowserCreated()
	loadBrowserURL(source, NewsPaper[3])
	NewsPaper[2] = true
end
addEventHandler("onClientBrowserCreated", root, onClientBrowserCreated)





function CloseNewsPaper()
	NewsPaper = {false,false,false,false}
end



CreateBlip(2071, -1794, 0, 7, 0, 0, 0, 0, 0, 0, 300, "Парикмахерская")
CreateBlip(824, -1588, 0, 7, 0, 0, 0, 0, 0, 0, 300, "Парикмахерская")
CreateBlip(672, -496, 0, 7, 0, 0, 0, 0, 0, 0, 300, "Парикмахерская")
CreateBlip(2080, 2123, 0, 7, 0, 0, 0, 0, 0, 0, 300, "Парикмахерская")
CreateBlip(-1450, 2592, 0, 7, 0, 0, 0, 0, 0, 0, 300, "Парикмахерская")



CreateBlip(2067, -1780, 0, 39, 0, 0, 0, 0, 0, 0, 300, "Тату салон")
CreateBlip(2095, 2123, 0, 39, 0, 0, 0, 0, 0, 0, 300, "Тату салон")
CreateBlip(-2491, -39, 0, 39, 0, 0, 0, 0, 0, 0, 300, "Тату салон")
CreateBlip(648, 873, 0, 11, 0, 0, 0, 0, 0, 0, 300, "Карьер «Hunter Quarry»")
CreateBlip(-1857, -1680, 0, 11, 0, 0, 0, 0, 0, 0, 300, "Свалка Angel Pine")
CreateBlip(1642, -2286, 0, 5, 0, 0, 0, 0, 0, 0, 300, "Аэропорт Los Santos")
CreateBlip(-1409, -298, 0, 5, 0, 0, 0, 0, 0, 0, 300, "Аэропорт San Fierro")
CreateBlip(1672, 1448, 0, 5, 0, 0, 0, 0, 0, 0, 300, "Аэропорт Las Venturas")
CreateBlip(1742, -1458, 0, 20, 0, 0, 0, 0, 0, 0, 300, "Пожарная станция Los Santos")
CreateBlip(-2026, 84, 0, 20, 0, 0, 0, 0, 0, 0, 300, "Пожарная станция San Fierro")
CreateBlip(1760, 2081, 0, 20, 0, 0, 0, 0, 0, 0, 300, "Пожарная станция Las Venturas №3")
CreateBlip(-52, -1131, 0, 51, 0, 0, 0, 0, 0, 0, 300, "База грузоперевозок")
CreateBlip(-330, 2671, 0, 51, 0, 0, 0, 0, 0, 0, 300, "Pecker's Feed & Seed")
CreateBlip(1096, 1902, 0, 51, 0, 0, 0, 0, 0, 0, 300, "База грузоперевозок")
CreateBlip(261, 1410, 0, 51, 0, 0, 0, 0, 0, 0, 300, "НПЗ «Green Palms»")
CreateBlip(-1035, -614, 0, 51, 0, 0, 0, 0, 0, 0, 300, "Easter Bay Chemicals")
CreateBlip(1760, -2056, 0, 51, 0, 0, 0, 0, 0, 0, 300, "База грузоперевозок")
CreateBlip(1676, 2325, 0, 51, 0, 0, 0, 0, 0, 0, 300, "Склад «Redsands West»")
CreateBlip(2390, 2760, 0, 51, 0, 0, 0, 0, 0, 0, 300, "База грузоперевозок")
CreateBlip(2220, -1721, 0, 54, 0, 0, 0, 0, 0, 0, 300, "Тренажерный зал")
CreateBlip(-2271, -156, 0, 54, 0, 0, 0, 0, 0, 0, 300, "Тренажерный зал")
CreateBlip(1969, 2296, 0, 54, 0, 0, 0, 0, 0, 0, 300, "Тренажерный зал")
CreateBlip(-2026, -102, 0, 36, 0, 0, 0, 0, 0, 0, 300, "Автошкола")
CreateBlip(-2624, 1412, 0, 23, 0, 0, 0, 0, 0, 0, 300, "Синдикат локо")
CreateBlip(-217, 979, 0, 30, 0, 0, 0, 0, 0, 0, 300, "Шериф округа Bone County")
CreateBlip(-1395, 2642, 0, 30, 0, 0, 0, 0, 0, 0, 300, "Шериф El Quebrados")
CreateBlip(-2161, -2384, 0, 30, 0, 0, 0, 0, 0, 0, 300, "Шериф Angel Pine")
CreateBlip(626, -571, 0, 30, 0, 0, 0, 0, 0, 0, 300, "Шериф округа Red County")
CreateBlip(1555, -1675, 0, 30, 0, 0, 0, 0, 0, 0, 300, "Полицейский участок Los Santos")
CreateBlip(2297, 2459, 0, 30, 0, 0, 0, 0, 0, 0, 300, "Полицейский участок Las Venturas")
CreateBlip(-1581, 719, 0, 30, 0, 0, 0, 0, 0, 0, 300, "Полицейский участок San Fierro")
CreateBlip(1481, -1772, 0, 19, 0, 0, 0, 0, 0, 0, 300, "Мэрия Los Santos")
CreateBlip(-2766, 375, 0, 19, 0, 0, 0, 0, 0, 0, 300, "Мэрия San Fierro")
CreateBlip(2389, 2466, 0, 19, 0, 0, 0, 0, 0, 0, 300, "Мэрия Las Venturas")
CreateBlip(-1420, 2583, 0, 63, 0, 0, 0, 0, 0, 0, 300, "Pay 'n' Spray")
CreateBlip(-99, 1117, 0, 63, 0, 0, 0, 0, 0, 0, 300, "Pay 'n' Spray")
CreateBlip(2064, -1831, 0, 63, 0, 0, 0, 0, 0, 0, 300, "Pay 'n' Spray")
CreateBlip(1024, -1023, 0, 63, 0, 0, 0, 0, 0, 0, 300, "Pay 'n' Spray")
CreateBlip(487, -1739, 0, 63, 0, 0, 0, 0, 0, 0, 300, "Pay 'n' Spray")
CreateBlip(-1904, 283, 0, 63, 0, 0, 0, 0, 0, 0, 300, "Pay 'n' Spray")
CreateBlip(-2425, 1021, 0, 63, 0, 0, 0, 0, 0, 0, 300, "Pay 'n' Spray")
CreateBlip(1974, 2162, 0, 63, 0, 0, 0, 0, 0, 0, 300, "Pay 'n' Spray")
CreateBlip(720, -456, 0, 63, 0, 0, 0, 0, 0, 0, 300, "Pay 'n' Spray")
CreateBlip(-1957, 276, 0, 55, 0, 0, 0, 0, 0, 0, 300, "Автосалон «Wang Cars»")
CreateBlip(-1657, 1212, 0, 55, 0, 0, 0, 0, 0, 0, 300, "Автосалон")
CreateBlip(520, 2372, 0, 55, 0, 0, 0, 0, 0, 0, 300, "Автосалон")
CreateBlip(1943, 2068, 0, 55, 0, 0, 0, 0, 0, 0, 300, "Автосалон")
CreateBlip(2200, 1389, 0, 55, 0, 0, 0, 0, 0, 0, 300, "Автосалон")
CreateBlip(553, -1279, 0, 55, 0, 0, 0, 0, 0, 0, 300, "Автосалон")
CreateBlip(2127, -1139, 0, 55, 0, 0, 0, 0, 0, 0, 300, "Автосалон")
CreateBlip(701, -519,  0, 55, 0, 0, 0, 0, 0, 0, 300, "Мотосалон «Dillmore»")
CreateBlip(2693, -1706, 0, 33, 0, 0, 0, 0, 0, 0, 300, "Стадион LS")
CreateBlip(1097, 1598,  0, 33, 0, 0, 0, 0, 0, 0, 300, "Стадион LV")
CreateBlip(-1514, 2518, 0, 22, 0, 0, 0, 0, 0, 0, 300, "Больница")
CreateBlip(-320, 1048, 0, 22, 0, 0, 0, 0, 0, 0, 300, "Медицинский центр Fort Caston")
CreateBlip(1607, 1815, 0, 22, 0, 0, 0, 0, 0, 0, 300, "Госпиталь Las Venturas")
CreateBlip(1172, -1323, 0, 22, 0, 0, 0, 0, 0, 0, 300, "Больница")
CreateBlip(2034, -1401, 0, 22, 0, 0, 0, 0, 0, 0, 300, "Больница")
CreateBlip(1225, 313, 0, 22, 0, 0, 0, 0, 0, 0, 300, "Больница")
CreateBlip(-2204, -2309, 0, 22, 0, 0, 0, 0, 0, 0, 300, "Больница")
CreateBlip(189, 1929, 0, 22, 0, 0, 0, 0, 0, 0, 300, "Больница")
CreateBlip(-2655, 640, 0, 22, 0, 0, 0, 0, 0, 0, 300, "Медицинский центр San Fierro")
CreateBlip(2644, -2044, 0, 27, 0, 0, 0, 0, 0, 0, 300, "Тюнинг")
CreateBlip(1041, -1015, 0, 27, 0, 0, 0, 0, 0, 0, 300, "TransFender")
CreateBlip(-1935, 246, 0, 27, 0, 0, 0, 0, 0, 0, 300, "TransFender")
CreateBlip(2386, 1052, 0, 27, 0, 0, 0, 0, 0, 0, 300, "Тюнинг")
CreateBlip(-2721, 217, 0, 27, 0, 0, 0, 0, 0, 0, 300, "Wheel Arch Angels")
CreateBlip(-1213, 1830, 0, 14, 0, 0, 0, 0, 0, 0, 300, "Cluckin' Bell")
CreateBlip(172, 1176, 0, 14, 0, 0, 0, 0, 0, 0, 300, "Cluckin' Bell")
CreateBlip(2397, -1899, 0, 14, 0, 0, 0, 0, 0, 0, 300, "Cluckin' Bell")
CreateBlip(928, -1352, 0, 14, 0, 0, 0, 0, 0, 0, 300, "Cluckin' Bell")
CreateBlip(928, -1352, 0, 14, 0, 0, 0, 0, 0, 0, 300, "Cluckin' Bell")
CreateBlip(2420, -1508, 0, 14, 0, 0, 0, 0, 0, 0, 300, "Cluckin' Bell")
CreateBlip(2393, 2041, 0, 14, 0, 0, 0, 0, 0, 0, 300, "Cluckin' Bell")
CreateBlip(2638, 1671, 0, 14, 0, 0, 0, 0, 0, 0, 300, "Cluckin' Bell")
CreateBlip(2838, 2407, 0, 14, 0, 0, 0, 0, 0, 0, 300, "Cluckin' Bell")
CreateBlip(2101, 2228, 0, 14, 0, 0, 0, 0, 0, 0, 300, "Cluckin' Bell")
CreateBlip(-2672, 258, 0, 14, 0, 0, 0, 0, 0, 0, 300, "Cluckin' Bell")
CreateBlip(-2155, -2460, 0, 14, 0, 0, 0, 0, 0, 0, 300, "Cluckin' Bell")
CreateBlip(-1816, 618, 0, 14, 0, 0, 0, 0, 0, 0, 300, "Cluckin' Bell")
CreateBlip(2105, -1806, 0, 29, 0, 0, 0, 0, 0, 0, 300, "The Well Stacked Pizza Co.")
CreateBlip(2331, 75, 0, 29, 0, 0, 0, 0, 0, 0, 300, "The Well Stacked Pizza Co.")
CreateBlip(1367, 248, 0, 29, 0, 0, 0, 0, 0, 0, 300, "The Well Stacked Pizza Co.")
CreateBlip(-1721, 1359, 0, 29, 0, 0, 0, 0, 0, 0, 300, "The Well Stacked Pizza Co.")
CreateBlip(2638, 1849, 0, 29, 0, 0, 0, 0, 0, 0, 300, "The Well Stacked Pizza Co.")
CreateBlip(2541, 2148, 0, 29, 0, 0, 0, 0, 0, 0, 300, "The Well Stacked Pizza Co.")
CreateBlip(2351, 2533, 0, 29, 0, 0, 0, 0, 0, 0, 300, "The Well Stacked Pizza Co.")
CreateBlip(2083, 2224, 0, 29, 0, 0, 0, 0, 0, 0, 300, "The Well Stacked Pizza Co.")
CreateBlip(-1808, 945, 0, 29, 0, 0, 0, 0, 0, 0, 300, "The Well Stacked Pizza Co.")
CreateBlip(203, -202, 0, 29, 0, 0, 0, 0, 0, 0, 300, "The Well Stacked Pizza Co.")
CreateBlip(2756, 2477, 0, 29, 0, 0, 0, 0, 0, 0, 300, "The Well Stacked Pizza Co.")
CreateBlip(810, -1616, 0, 10, 0, 0, 0, 0, 0, 0, 300, "Burger Shot")
CreateBlip(1199, -918, 0, 10, 0, 0, 0, 0, 0, 0, 300, "Burger Shot")
CreateBlip(-2336, -166, 0, 10, 0, 0, 0, 0, 0, 0, 300, "Burger Shot")
CreateBlip(-1912, 827, 0, 10, 0, 0, 0, 0, 0, 0, 300, "Burger Shot")
CreateBlip(-2355, 1008, 0, 10, 0, 0, 0, 0, 0, 0, 300, "Burger Shot")
CreateBlip(2169, 2795, 0, 10, 0, 0, 0, 0, 0, 0, 300, "Burger Shot")
CreateBlip(1157, 2072, 0, 10, 0, 0, 0, 0, 0, 0, 300, "Burger Shot")
CreateBlip(2472, 2034, 0, 10, 0, 0, 0, 0, 0, 0, 300, "Burger Shot")
CreateBlip(1872, 2071, 0, 10, 0, 0, 0, 0, 0, 0, 300, "Burger Shot")
CreateBlip(2367, 2071, 0, 10, 0, 0, 0, 0, 0, 0, 300, "Burger Shot")
CreateBlip(1836, -1682, 0, 48, 0, 0, 0, 0, 0, 0, 300, "Клуб")
CreateBlip(2507, 1242, 0, 48, 0, 0, 0, 0, 0, 0, 300, "Клуб")
CreateBlip(387, -1817, 0, 50, 0, 0, 0, 0, 0, 0, 300, "Закусочная")
CreateBlip(24, -2646, 0, 50, 0, 0, 0, 0, 0, 0, 300, "Закусочная")
CreateBlip(-384, 2206, 0, 50, 0, 0, 0, 0, 0, 0, 300, "Закусочная")
CreateBlip(-53, 1188, 0, 50, 0, 0, 0, 0, 0, 0, 300, "Закусочная")
CreateBlip(875, -968, 0, 17, 0, 0, 0, 0, 0, 0, 300, "Ресторан")
CreateBlip(-2524, 1216, 0, 17, 0, 0, 0, 0, 0, 0, 300, "Ресторан")
CreateBlip(-1942, 2379, 0, 17, 0, 0, 0, 0, 0, 0, 300, "Ресторан")
CreateBlip(-858, 1535, 0, 17, 0, 0, 0, 0, 0, 0, 300, "Ресторан")
CreateBlip(-187, 1210, 0, 17, 0, 0, 0, 0, 0, 0, 300, "Ресторан")
CreateBlip(2244, -1665, 0, 45, 0, 0, 0, 0, 0, 0, 300, "Binco")
CreateBlip(-2373, 910, 0, 45, 0, 0, 0, 0, 0, 0, 300, "Binco")
CreateBlip(2101, 2257, 0, 45, 0, 0, 0, 0, 0, 0, 300, "Binco")
CreateBlip(1657, 1733, 0, 45, 0, 0, 0, 0, 0, 0, 300, "Binco")
CreateBlip(-1882, 866, 0, 45, 0, 0, 0, 0, 0, 0, 300, "Zip")
CreateBlip(2090, 2224, 0, 45, 0, 0, 0, 0, 0, 0, 300, "Zip")
CreateBlip(1456, -1137, 0, 45, 0, 0, 0, 0, 0, 0, 300, "Zip")
CreateBlip(2572, 1904, 0, 45, 0, 0, 0, 0, 0, 0, 300, "Zip")
CreateBlip(461, -1500, 0, 45, 0, 0, 0, 0, 0, 0, 300, "Victim")
CreateBlip(2803, 2430, 0, 45, 0, 0, 0, 0, 0, 0, 300, "Victim")
CreateBlip(454, -1478, 0, 45, 0, 0, 0, 0, 0, 0, 300, "Didier Sachs")
CreateBlip(2112, -1211, 0, 45, 0, 0, 0, 0, 0, 0, 300, "Sub Urban")
CreateBlip(-2489, -29, 0, 45, 0, 0, 0, 0, 0, 0, 300, "Sub Urban")
CreateBlip(2779, 2453, 0, 45, 0, 0, 0, 0, 0, 0, 300, "Sub Urban")
CreateBlip(823, -1757, 0, 45, 0, 0, 0, 0, 0, 0, 300, "BOBO")
CreateBlip(499, -1360, 0, 45, 0, 0, 0, 0, 0, 0, 300, "ProLaps")
CreateBlip(-2492, 2363, 0, 45, 0, 0, 0, 0, 0, 0, 300, "ProLaps")
CreateBlip(2826, 2407, 0, 45, 0, 0, 0, 0, 0, 0, 300, "ProLaps")
CreateBlip(-1694, 951, 0, 45, 0, 0, 0, 0, 0, 0, 300, "Victim")
CreateBlip(-179, 1133, 0, 52, 0, 0, 0, 0, 0, 0, 300, "Банк")
CreateBlip(-2456, 503, 0, 52, 0, 0, 0, 0, 0, 0, 300, "Банк")
CreateBlip(-828, 1504, 0, 52, 0, 0, 0, 0, 0, 0, 300, "Банк")
CreateBlip(2447, 2376, 0, 52, 0, 0, 0, 0, 0, 0, 300, "Банк")
CreateBlip(593, -1251, 0, 52, 0, 0, 0, 0, 0, 0, 300, "Credit and Commerce Bank of San Andreas")
CreateBlip(1368, -1279, 0, 6, 0, 0, 0, 0, 0, 0, 300, "Ammu-Nation")
CreateBlip(2400, -1981, 0, 6, 0, 0, 0, 0, 0, 0, 300, "Ammu-Nation")
CreateBlip(-1508, 2610, 0, 6, 0, 0, 0, 0, 0, 0, 300, "Ammu-Nation")
CreateBlip(2159, 943, 0, 6, 0, 0, 0, 0, 0, 0, 300, "Ammu-Nation")
CreateBlip(776, 1871, 0, 6, 0, 0, 0, 0, 0, 0, 300, "Ammu-Nation")
CreateBlip(-316, 829, 0, 6, 0, 0, 0, 0, 0, 0, 300, "Ammu-Nation")
CreateBlip(-2626, 208, 0, 6, 0, 0, 0, 0, 0, 0, 300, "Ammu-Nation")
CreateBlip(2333, 61, 0, 6, 0, 0, 0, 0, 0, 0, 300, "Ammu-Nation")
CreateBlip(-2093, -2464, 0, 6, 0, 0, 0, 0, 0, 0, 300, "Ammu-Nation")
CreateBlip(2539, 2083, 0, 6, 0, 0, 0, 0, 0, 0, 300, "Ammu-Nation")
CreateBlip(243, -178, 0, 6, 0, 0, 0, 0, 0, 0, 300, "Ammu-Nation")
CreateBlip(-179, 1087, 0, 49, 0, 0, 0, 0, 0, 0, 300, "Attica Bar")
CreateBlip(2310, -1643, 0, 49, 0, 0, 0, 0, 0, 0, 300, "Ten Green Bottle")
CreateBlip(1945, -2042, 0, 49, 0, 0, 0, 0, 0, 0, 300, "Attica Bar")
CreateBlip(2441, -1376, 0, 49, 0, 0, 0, 0, 0, 0, 300, "Attica Bar")
CreateBlip(2460, -1344, 0, 49, 0, 0, 0, 0, 0, 0, 300, "Attica Bar")
CreateBlip(2361, -1332, 0, 49, 0, 0, 0, 0, 0, 0, 300, "Attica Bar")
CreateBlip(2441, 2065, 0, 49, 0, 0, 0, 0, 0, 0, 300, "The Craw Bar")




function RespectMessage(group, count) 
	if(PData["wasted"]) then
		SpawnAction[#SpawnAction+1] = {"RespectMessage", localPlayer, group, count}
	else
		count = tonumber(count)
		if(isTimer(RespectTempFileTimers)) then
			if(not RespectMsg[group]) then
				RespectMsg[group] = count
			else
				RespectMsg[group] = RespectMsg[group]+count
			end
			resetTimer(RespectTempFileTimers)
		else
			RespectMsg = {[group] = count}
			RespectTempFileTimers = setTimer(function()
				RespectMsg=false
			end, 3500, 1)
			PlaySFXSound(14)
		end
	end
end
addEvent("RespectMessage", true)
addEventHandler("RespectMessage", localPlayer, RespectMessage)



function helpmessage(message)
	if(removetarget) then
		Targets["thePlayer"] = nil
	end
	if(isTimer(PData["helpmessageTimer"])) then
		killTimer(PData["helpmessageTimer"])
	end
	
	PText["HUD"][5] = {Text(message), screenWidth, screenHeight-(200*scalex), 0, 0, tocolor(255, 255, 255, 255), NewScale*2.3, "sans", "center", "top", false, false, false, true, true, 0, 0, 0, {["border"] = true}}

	PData["helpmessageTimer"] = setTimer(function()
		PText["HUD"][5] = nil
	end, 3500, 1)
end
addEvent("helpmessageEvent", true)
addEventHandler("helpmessageEvent", localPlayer, helpmessage)




function MissionCompleted(job, money, removetarget, cinema)
	if(removetarget) then
		Targets["thePlayer"] = nil
	end
	if(isTimer(PData["MissionCompletedTimer"])) then
		killTimer(PData["MissionCompletedTimer"])
	end
	
	
	if(job) then
		PText["HUD"][6] = {"#744D02"..Text(job), screenWidth, screenHeight/2-dxGetFontHeight(NewScale*6, "sans")/2, 0, 0, tocolor(255, 255, 255, 255), NewScale*6, "sans", "center", "top", false, false, false, true, true, 0, 0, 0, {["border"] = true}}
	end
	
	if(money) then
		if(tonumber(money)) then
			PText["HUD"][7] = {"$"..money, screenWidth, screenHeight/2+(dxGetFontHeight(NewScale*4, "pricedown")/2), 0, 0, tocolor(255, 255, 255, 255), NewScale*4, "pricedown", "center", "top", false, false, false, true, true, 0, 0, 0, {["border"] = true}}	
		else
			PText["HUD"][7] = {money, screenWidth, screenHeight/2+(dxGetFontHeight(NewScale*6, "sans")/2), 0, 0, tocolor(255, 255, 255, 255), NewScale*6, "sans", "center", "top", false, false, false, true, true, 0, 0, 0, {["border"] = true}}	
		end
	end
	
	PData["MissionCompletedTimer"] = setTimer(function()
		PText["HUD"][6] = nil
		PText["HUD"][7] = nil
	end, 3500, 1)
	
	if(cinema) then
		playSFX("genrl", 75, 1, false)
		local x,y,z = getElementPosition(localPlayer)
		setCameraMatrix(x+20, y-20, z+30, x, y, z)
		PEDChangeSkin = "cinema"
		setTimer(function(thePlayer)
			setCameraTarget(localPlayer)
			PEDChangeSkin = "play"
		end, 3500, 1)
	end
end
addEvent("MissionCompleted", true)
addEventHandler("MissionCompleted", localPlayer, MissionCompleted)



function ToolTip(message)
	if(message ~= ToolTipText) then
		playSoundFrontEnd(11)
		if(isTimer(ToolTipTimers)) then
			killTimer(ToolTipTimers)
			ToolTipText = message
			ToolTipTimers = setTimer(function()
				ToolTipText = ""
			end, 1000+(#message*50), 1)
		else
			ToolTipText = message
			ToolTipTimers = setTimer(function()
				ToolTipText = ""
			end, 1000+(#message*50), 1)
		end
	end
end
addEvent("ToolTip", true)
addEventHandler("ToolTip", root, ToolTip)





function CallPoliceEvent()
	triggerServerEvent("CallPolice", localPlayer, CallPolice)
end


function PoliceArrestEvent()
	if(not isTimer(ArrestTimerEvent)) then
		if(Targets["theVehicle"]) then 
			triggerServerEvent("PoliceArrestCar", localPlayer)
		end
		ArrestTimerEvent=setTimer(function() end, 4000, 1)
	end
end



function TrunkWindow()
	if(Targets["theVehicle"]) then
		if(PEDChangeSkin == "play") then
			if(not TrunkWindows and not InventoryWindows) then
				PInv["trunk"] = fromJSON(getElementData(Targets["theVehicle"], "trunk"))
				DragElementId = false
				DragElementName = false
				TrunkWindows = Targets["theVehicle"]
				showCursor(true)
				local StPosx = 640*scalex
				local StPosxy = 360*scaley-(30*scaley)
				local binvx = (2.5*scalex)
				local binvy = (80.5*scaley)
				for i, _ in pairs(PInv["trunk"]) do
					PBut["trunk"][i] = {StPosx+binvx, StPosxy+binvy, 80*scalex, 60*scaley}
					binvx=binvx+(80.5*scalex)
					if(i == 8 or i == 16 or i == 24 or i == 32) then
						StPosx = 640*scalex
						StPosxy = 360*scaley-(30*scaley)
						binvx = (2.5*scalex)
						binvy = binvy+(80.5*scaley)
					end
				end
			end
		end
	end
end
addEvent("TrunkWindow", true)
addEventHandler("TrunkWindow", localPlayer, TrunkWindow)






function TrunkReq(arg)
	triggerServerEvent("TrunkOpen", localPlayer, localPlayer, Targets["theVehicle"]) 
end
addEvent("TrunkReq", true)
addEventHandler("TrunkReq", localPlayer, TrunkReq)



function CarJack()
	triggerServerEvent("WarpPedIntoVehicle", localPlayer, getVehicleOccupant(Targets["theVehicle"]), localPlayer) 
end
addEvent("CarJack", true)
addEventHandler("CarJack", localPlayer, CarJack)


function PedDialog()
	triggerServerEvent("PedDialog", localPlayer, localPlayer, Targets["thePlayer"])
end
addEvent("PedDialog", true)
addEventHandler("PedDialog", localPlayer, PedDialog)







function PrisonSleepEv()
	local x,y,z = getElementPosition(PrisonSleep)
	local rx,ry,rz = getElementRotation(PrisonSleep)
	triggerServerEvent("PrisonSleep", localPlayer, x,y,z,rz)
	fadeCamera(false, 4.0, 0, 0, 0)
	bindKey("space", "down", StopSleep)
	SleepTimer = setTimer(function()
		SleepSound("script",  39, math.random(0,114), false)
	end, 5000, 0)
	
	PText["HUD"][2] = {Text("Нажми {key} чтобы встать", {{"{key}", COLOR["KEY"]["HEX"].."Space#FFFFFF"}}), screenWidth, screenHeight-(150*scalex), 0, 0, tocolor(255, 255, 255, 255), scale*2, "sans", "center", "top", false, false, false, true, true, 0, 0, 0, {}}

end

function PrisonGavnoEv()
	local x,y,z = getElementPosition(PrisonGavno)
	local rx,ry,rz = getElementRotation(PrisonGavno)
	triggerServerEvent("PrisonGavno", localPlayer, x,y,z,rz)
end

function PrisonPiss() triggerServerEvent("PrisonPiss", localPlayer) end


function SleepSound(bank,id,id2)
	local sound = playSFX(bank, id, id2, false)
	setSoundEffectEnabled (sound, "reverb", true)
end

function StopSleep()
	fadeCamera(true, 4.0, 0, 0, 0)
	killTimer(SleepTimer)
	unbindKey("space", "down", StopSleep)
	triggerServerEvent("PrisonSleep", localPlayer)
	PText["HUD"][2] = nil
end


local vending = {
	{955, 0, -862.82, 1536.60, 21.98, 0, 0, 180},
	{956, 0, 2271.72, -76.46, 25.96, 0, 0, 0},
	{955, 0, 1277.83, 372.51, 18.95, 0, 0, 64},
	{956, 0, 662.42, -552.16, 15.71, 0, 0, 180},
	{955, 0, 201.01, -107.61, 0.89, 0, 0, 270},
	{955, 0, -253.73, 2597.95, 62.24, 0, 0, 90},
	{956, 0, -253.73, 2599.75, 62.24, 0, 0, 90},
	{956, 0, -76.03, 1227.99, 19.12, 0, 0, 90},
	{955, 0, -14.70, 1175.36, 18.95, 0, 0, 180},
	{1977, 7, 316.87, -140.35, 998.58, 0, 0, 270},
	{956, 0, -1455.11, 2591.665, 55.23, 0, 0, 180},
	{955, 0, 2352.18, -1357.15, 23.77, 0, 0, 90},
	{955, 0, 2325.97, -1645.14, 14.21, 0, 0, 0},
	{956, 0, 2139.52, -1161.48, 23.35, 0, 0, 87},
	{956, 0, 2153.23, -1016.14, 62.23, 0, 0, 127},
	{955, 0, 1928.74, -1772.44, 12.94, 0, 0, 90},
	{1776, 1, 2222.36, 1602.64, 1000.06, 0, 0, 90},
	{1775, 1, 2222.20, 1606.77, 1000.05, 0, 0, 90},
	{1775, 1, 2155.90, 1606.77, 1000.05, 0, 0, 90},
	{1775, 1, 2209.90, 1607.19, 1000.05, 0, 0, 270},
	{1776, 1, 2155.84, 1607.87, 1000.06, 0, 0, 90},
	{1776, 1, 2202.45, 1617, 1000.06, 0, 0, 180},
	{1776, 1, 2209.24, 1621.21, 1000.06, 0, 0, 0},
	{1776, 3, 330.67, 178.50, 1020.07, 0, 0, 0},
	{1776, 3, 331.92, 178.50, 1020.07, 0, 0, 0},
	{1776, 3, 350.91, 206.08, 1008.47, 0, 0, 90},
	{1776, 3, 361.56, 158.61, 1008.47, 0, 0, 180},
	{1776, 3, 371.59, 178.45, 1020.07, 0, 0, 0},
	{1776, 3, 374.89, 188.97, 1008.47, 0, 0, 0},
	{1775, 2, 2576.70, -1284.43, 1061.09, 0, 0, 270},
	{1775, 15, 2225.20, -1153.42, 1025.90, 0, 0, 270},
	{955, 0, 1154.72, -1460.89, 15.15, 0, 0, 270},
	{956, 0, 2480.85, -1959.27, 12.96, 0, 0, 180},
	{955, 0, 2060.11, -1897.65, 12.92, 0, 0, 0},
	{955, 0, 1729.78, -1943.05, 12.94, 0, 0, 0},
	{956, 0, 1634.10, -2237.53, 12.89, 0, 0, 0},
	{955, 0, 1789.21, -1369.26, 15.16, 0, 0, 270},
	{956, 0, -2229.18, 286.41, 34.70, 0, 0, 180},
	{955, 0, -1980.79, 142.66, 27.07, 0, 0, 270},
	{955, 0, -2118.96, -423.64, 34.72, 0, 0, 255},
	{955, 0, -2118.61, -422.41, 34.72, 0, 0, 255},
	{955, 0, -2097.27, -398.33, 34.72, 0, 0, 180},
	{955, 0, -2092.08, -490.05, 34.72, 0, 0, 0},
	{955, 0, -2063.27, -490.05, 34.72, 0, 0, 0},
	{955, 0, -2005.64, -490.05, 34.72, 0, 0, 0},
	{955, 0, -2034.46, -490.05, 34.72, 0, 0, 0},
	{955, 0, -2068.56, -398.33, 34.72, 0, 0, 180},
	{955, 0, -2039.85, -398.33, 34.72, 0, 0, 180},
	{955, 0, -2011.14, -398.33, 34.72, 0, 0, 180},
	{955, 0, -1350.11, 492.28, 10.58, 0, 0, 90},
	{956, 0, -1350.11, 493.85, 10.58, 0, 0, 90},
	{955, 0, 2319.99, 2532.85, 10.21, 0, 0, 0},
	{956, 0, 2845.72, 1295.04, 10.78, 0, 0, 0},
	{955, 0, 2503.14, 1243.70, 10.21, 0, 0, 180},
	{956, 0, 2647.69, 1129.66, 10.21, 0, 0, 0},
	{1209, 0, -2420.21, 984.57, 44.29, 0, 0, 90},
	{1302, 0, -2420.17, 985.94, 44.29, 0, 0, 90},
	{955, 0, 2085.77, 2071.35, 10.45, 0, 0, 90},
	{956, 0, 1398.84, 2222.60, 10.42, 0, 0, 180},
	{956, 0, 1659.46, 1722.85, 10.21, 0, 0, 0},
	{955, 0, 1520.14, 1055.26, 10, 0, 0, 270},
	{1775, 6, -19.03, -57.83, 1003.63, 0, 0, 180},
	{1776, 6, -36.14, -57.87, 1003.63, 0, 0, 180}
}


for key,theVend in pairs(vending) do
	local o = createObject(theVend[1], theVend[3], theVend[4], theVend[5], theVend[6], theVend[7],theVend[8],false)
	setElementInterior(o, theVend[2])
end



local effectNames = {"blood_heli","boat_prop","camflash","carwashspray","cement","cloudfast","coke_puff","coke_trail","cigarette_smoke",
"explosion_barrel","explosion_crate","explosion_door","exhale","explosion_fuel_car","explosion_large","explosion_medium",
"explosion_molotov","explosion_small","explosion_tiny","extinguisher","flame","fire","fire_med","fire_large","flamethrower",
"fire_bike","fire_car","gunflash","gunsmoke","insects","heli_dust","jetpack","jetthrust","nitro","molotov_flame",
"overheat_car","overheat_car_electric","prt_blood","prt_boatsplash","prt_bubble","prt_cardebris","prt_collisionsmoke",
"prt_glass","prt_gunshell","prt_sand","prt_sand2","prt_smokeII_3_expand","prt_smoke_huge","prt_spark","prt_spark_2",
"prt_splash","prt_wake","prt_watersplash","prt_wheeldirt","petrolcan","puke","riot_smoke","spraycan","smoke30lit","smoke30m",
"smoke50lit","shootlight","smoke_flare","tank_fire","teargas","teargasAD","tree_hit_fir","tree_hit_palm","vent","vent2",
"water_hydrant","water_ripples","water_speed","water_splash","water_splash_big","water_splsh_sml","water_swim","waterfall_end",
"water_fnt_tme","water_fountain","wallbust","WS_factorysmoke"}




DrugsEffect = {}
DrugsAnimation = {"PLY_CASH","PUN_CASH","PUN_HOLLER","PUN_LOOP","strip_A","strip_B","strip_C","strip_D","strip_E","strip_F","strip_G","STR_A2B","STR_B2A","STR_B2C","STR_C1","STR_C2", "STR_C2B", "STR_Loop_A","STR_Loop_B","STR_Loop_C"}
function targetingActivated(target)
	if(PEDChangeSkin == "play") then
		local theVehicle = getPedOccupiedVehicle(localPlayer)
		local PTeam = getTeamName(getPlayerTeam(localPlayer))
		if(isTimer(SpunkTimer)) then
			local x,y,z = getElementPosition(target)
			local ground = getGroundPosition(x, y, z)
			DrugsEffect[#DrugsEffect+1] = createEffect(effectNames[math.random(1,#effectNames)],x,y,z)
			DrugsEffect[#DrugsEffect+1] = createPed(math.random(0,299),x+math.random(-10,10),y+math.random(-10,10), ground+0.5, math.random(0,360))
			setElementInterior(DrugsEffect[#DrugsEffect], getElementInterior(localPlayer))
			setElementDimension(DrugsEffect[#DrugsEffect], getElementDimension(localPlayer))
			StartAnimation(DrugsEffect[#DrugsEffect], "STRIP", DrugsAnimation[math.random(1,#DrugsAnimation)])
			local rand = math.random(0,10)
			if(rand == 0) then 
				setPedHeadless(DrugsEffect[#DrugsEffect],true)
			end
		end

		if(SprunkObject) then 
			SprunkObject = false  
			unbindKey ("f", "down", SprunkFunk) 
			toggleControl("enter_exit", true) 
		end
		if(CallPolice) then
			CallPolice = false
			unbindKey ("F3", "down", CallPoliceEvent) 
		end


	
		for name, _ in pairs(Targets) do
			if(name == "theVehicle") then
				if(PTeam == "Полиция") then
					unbindKey("e", "down", PoliceArrestEvent)
				end
			end
			Targets[name] = nil
		end
		
		
		if(PrisonSleep) then
			PrisonSleep = false
			unbindKey("e", "down", PrisonSleepEv) 
		end
		
		if(PrisonGavno) then
			PrisonGavno = false
			unbindKey("e", "down", PrisonGavnoEv)
			unbindKey("f", "down", PrisonPiss)
		end
		
		if (target) then
			if(tostring(getElementType(target)) == "player") then
				Targets["thePlayer"] = target
				if(PTeam == "Мирные жители" or PTeam == "МЧС" and PTeam ~= "Полиция") then
					if(getElementData(target, "WantedLevel") ~= "Уровень розыска 0") then
						bindKey ("F3", "down", CallPoliceEvent)
						CallPolice=getPlayerName(target)
					end
				end

				local x, y, z = getElementPosition(localPlayer)
				local x2, y2, z2 = getElementPosition(target)
				local distance = getDistanceBetweenPoints3D(x,y,z,x2,y2,z2)
				local message=""
				if(distance < 2) then
					if(getElementHealth(target) < 20) then
						message = message.."Нажми #A0A0A0F2#FFFFFF чтобы поднять игрока\n"	
					end
				end
				if(CallPolice) then
					message = message.."Нажми #A0A0A0F3#FFFFFF чтобы позвонить в полицию\n"	
				end
				ChangeInfo(message)
			elseif(tostring(getElementType(target)) == "vehicle") then
				if(theVehicle) then
					if(theVehicle ~= target) then
						Targets["theVehicle"] = target
						if(PTeam == "Полиция") then
							bindKey ("e", "down", PoliceArrestEvent)
							if(getElementModel(theVehicle) == 596 or getElementModel(theVehicle) == 597 or getElementModel(theVehicle) == 598 or getElementModel(theVehicle) == 599 or getElementModel(theVehicle) == 523) then
								helpmessage("Нажми #A0A0A0E#FFFFFF чтобы\nпотребовать остановить автомобиль", 3000)
							end
						end
					end
				else
					if(not isPedDoingTask(localPlayer, "TASK_COMPLEX_ENTER_CAR_AS_DRIVER")
					and not isPedDoingTask(localPlayer, "TASK_COMPLEX_ENTER_CAR_AS_PASSENGER")) then
						Targets["theVehicle"] = target
					end
				end

				local t=""
				if(getVehiclePlateText(target) == "SELL 228") then
					t=t..Text("Нажми {key} чтобы купить", {{"{key}", COLOR["KEY"]["HEX"].."TAB#FFFFFF"}})
				end
				
				if(getElementData(target, "owner") == getPlayerName(localPlayer)) then
					if(getElementData(target, "siren")) then
						t=t.."\nНажми #A0A0A0ALT#FFFFFF чтобы управлять сигнализацией"
					end
				end
				ChangeInfo(t)
			elseif(tostring(getElementType(target)) == "object") then
				if(getElementModel(target) == 955 or getElementModel(target) == 956 
				or getElementModel(target) == 1977 or getElementModel(target) == 1775
				or getElementModel(target) == 1776 or getElementModel(target) == 1209
				or getElementModel(target) == 1302) then
					toggleControl("enter_exit", false) 
					ToolTip(Text("Sprunk стоимость #3B7231$20#FFFFFF").."\n"..Text("Нажми {key} чтобы купить", {{"{key}", COLOR["KEY"]["HEX"].."F#FFFFFF"}}))
					SprunkObject = target
					bindKey ("f", "down", SprunkFunk)
				elseif(getElementModel(target) == 1812) then
					ChangeInfo(Text("Нажми {key} чтобы лечь", {{"{key}", COLOR["KEY"]["HEX"].."E#FFFFFF"}}))
					PrisonSleep = target
					bindKey ("e", "down", PrisonSleepEv)
				elseif(getElementModel(target) == 2525) then
					ChangeInfo("Нажми #A0A0A0F#FFFFFF чтобы справить нужду\nНажми #A0A0A0E#FFFFFF чтобы чистить говно")
					PrisonGavno = target
					bindKey ("e", "down", PrisonGavnoEv)
					bindKey ("f", "down", PrisonPiss)
				elseif(getElementModel(target) == 10149 or getElementModel(target) == 10184 or getElementModel(target) == 2930 or getElementModel(target) == 11327 or getElementModel(target) == 975 or getElementModel(target) == 988) then
					ChangeInfo("Нажми #A0A0A0H#FFFFFF чтобы управлять воротами")
					Targets["object"] = target
				elseif(getElementModel(target) == 17566 or getElementModel(target) == 10671) then
					ChangeInfo("Нажми #A0A0A0H#FFFFFF чтобы управлять гаражом")
					Targets["object"] = target
				end
			elseif(tostring(getElementType(target)) == "ped") then
				if(getElementData(target, "team")) then
					local team=getElementData(target, "team")
					color=getTeamVariable(team)
					if(team == getTeamName(getPlayerTeam(localPlayer))) then
						ChangeInfo("Нажми #A0A0A0P #FFFFFFчтобы пригласить в группу")
					end
				end
				Targets["thePed"] = target
			end
		else 
			if(not theVehicle) then ChangeInfo() end
		end
	end
end
addEventHandler("onClientPlayerTarget", getRootElement(), targetingActivated)


 


function handleVehicleDamage(attacker, weapon, loss, x, y, z, tyre)
	if(attacker) then
		if(getElementType(attacker) == "vehicle") then
			local acc = getVehicleOccupant(attacker)
			if(acc) then
				if(getElementType(acc) == "player") then
					attacker = acc
				end
			end
		end
		if(attacker == localPlayer) then
			local occupants = getVehicleOccupants(source) or {}
			for seat, occupant in pairs(occupants) do
				if(getElementType(occupant) == "player") then
					if(getTeamName(getPlayerTeam(occupant)) == "Полиция" 
					or getTeamName(getPlayerTeam(occupant)) == "Военные"
					or getTeamName(getPlayerTeam(occupant)) == "ФБР") then
						triggerServerEvent("AddMeWanted", localPlayer)
					end
				elseif(getElementType(occupant) == "ped") then
					triggerServerEvent("PedDamage", localPlayer, occupant, 228, 0, 0)
				end
			end
			triggerServerEvent("FireVehicle", localPlayer, source, weapon)
		end
	end
end
addEventHandler("onClientVehicleDamage", root, handleVehicleDamage)



function getVehicleHandlingProperty(theVehicle, property)
    local HT = getVehicleHandling(theVehicle) 
	return HT[property]
end




function PlaySFX3DforAll(script, bank, id, x,y,z, loop, mindist, maxdist, effect, effectbool) 
	local s = playSFX3D(script, bank, id, x,y,z, loop)
	if(mindist) then
		setSoundMinDistance(s, mindist)
		setSoundMaxDistance(s, maxdist)
	end
	if(effect) then
		setSoundEffectEnabled(s, effect, effectbool)
	end
end
addEvent("PlaySFX3DforAll", true)
addEventHandler("PlaySFX3DforAll", localPlayer, PlaySFX3DforAll)


function PlaySFXClient(c,b,s)
	playSFX(c,b,s,false)
end
addEvent("PlaySFXClient", true)
addEventHandler("PlaySFXClient", localPlayer, PlaySFXClient)


function bloodfoot(bool) 
	setPedFootBloodEnabled(localPlayer, bool)
end
addEvent("bloodfoot", true)
addEventHandler("bloodfoot", localPlayer, bloodfoot)




local imageTimer = false
addEvent("onMyClientScreenShot",true)
addEventHandler("onMyClientScreenShot", resourceRoot,
    function(pixels)
	if isTimer(imageTimer) then killTimer(imageTimer) end
		cameraimage = dxCreateTexture(pixels)
		playSFX("script", 75, 6, false)
		imageTimer = setTimer(function()
			destroyElement(cameraimage)
			cameraimage=false
		end, 10000, 1)
    end
)
 
 

local score = 0
local tick
local idleTime
local multTime
local mult = 1



function SetupBackpack(num)
	if(num == "i") then
		num = 10
		if(not PInv["player"][num][4]) then 
			if(not InventoryWindows) then
				ActivateInventory(true, "шарится по карманам")
			else
				ActivateInventory(false)
			end
			return false
		else
			if(not PInv["player"][num][4]["content"]) then
				if(not InventoryWindows) then
					ActivateInventory(true, "шарится по карманам")
				else
					ActivateInventory(false)
				end
				return false
			end
		end
	end
	if(not InventoryWindows) then
		local StPosx = 640*scalex
		local StPosxy = 360*scaley-(30*scaley)
		local binvx = (2.5*scalex)
		local binvy = (80.5*scaley)
		PInv["backpack"] = PInv["player"][num][4]["content"]
		for i,val in pairs(PInv["player"][num][4]["content"]) do
			PBut["backpack"][i] = {StPosx+binvx, StPosxy+binvy, 80*scalex, 60*scaley}
			binvx=binvx+(80.5*scalex)
			if(i == 8 or i == 16 or i == 24 or i == 32) then
				binvx=(2.5*scalex)
				binvy=binvy+(80.5*scaley)
			end
		end
		backpackid=num
		if(PInv["player"][num][1] == "Рюкзак") then
			ActivateInventory(true, "шарится в рюкзаке")
		elseif(PInv["player"][num][1] == "Чемодан") then
			ActivateInventory(true, "шарится в чемодане")
		elseif(PInv["player"][num][1] == "Пакет") then
			ActivateInventory(true, "шарится в пакете")
		end
	else
		ActivateInventory(false)
	end
end
addEvent("SetupBackpack", true)
addEventHandler("SetupBackpack", localPlayer, SetupBackpack)



function ActivateInventory(enable, action)
	if(enable) then
		triggerServerEvent("CliendSideonPlayerChat", localPlayer, action, 1)
		InventoryWindows = true
		DragElementId = false
		DragElementName = false
		showCursor(true)
		UpdateInventoryMass()
	else
		if(not DragElement) then
			PBut["backpack"] = {}
			InventoryWindows = false
			backpackid = false
			DragElementId = false
			DragElementName = false
			PText["INVHUD"] = {}
			showCursor(false)
		end
	end

end




function onClientChatMessageHandler(text)
	if(PEDChangeSkin == "play") then
		if string.find(text, "http?://[%w-_%.%?%.:/%+=&]+") then -- if string.match and text itself are the same
			local s, e = string.find(text, "http?://[%w-_%.%?%.:/%+=&]+")
			PData["WebLink"] = string.sub(text, s, e)
			ToolTip("В чат добавлена ссылка\nНажми F5 чтобы посмотреть")
		end
	end

end
addEventHandler("onClientChatMessage", getRootElement(), onClientChatMessageHandler)



function RemoveInventory()
	if(initializedInv) then
		initializedInv=false
		PBut["player"] = {}
	end
end





-- Object, Model, Scale, x,y,z,rz, bizname
local ResourceInMap = {
	[1] = {false, 17005, 0.1, -382, -1437, 26,0, "FARMFR"},
	[2] = {false, 3375, 0.1, 1918, 173, 36, 0, "FARMPK"},
	[3] = {false, 12915, 0.1, -44.4, 78.7, 3.1, 0, "FARMBA"},
	[4] = {false, 17335, 0.1, -1439, -1534, 101, 90, "FARMWS"}, 
	[5] = {false, 10357, 0.05, -2523, -622, 132, 0, "ELSF"}, 
	--[7] = {false, 8079, 0.02, 1573, 1791, 9.8, 0, "MEDLV"}, 
	--[8] = {false, 3976, 0.02, 1555.2, -1675.6, 16.2, 0, "PLSPD"},
	--[9] = {false, 5708, 0.02, 1140, -1342, 15.4, 0, "MEDLS"}, 
	[10] = {false, 12988, 0.07, 1362, 328, 20.5, 335, "BIOEN"}, 
	[11] = {false, 3426, 0.1, 187, 1415, 10.6, 335, "PETLV"}, 
	[12] = {false, 17017, 0.05, -1040, -644, 132, 335, false}, 
	[13] = {false, 17021, 0.05, -1040, -644, 32, 335, "NPZSF"}, 
	[14] = {false, 7493, 0.02, 966.9, 2140.8, 10.8, 0, "MEATFA"}, 
	[15] = {false, 10775, 0.02, -1858, 3, 15.1, 0, "SOLIN"}, 
	[16] = {false, 12931, 0.02, -70, -270, 5.4, 90, "FLEIS"},  
	[17] = {false, 16399, 0.02, -300.5, 2658.7, 63, 0, "LASPA"}, 
	[18] = {false, 18474, 0.02, -2192.1, -2432.9, 31, 0, "ANLPI"}, 
	[19] = {false, 11456, 0.02, -1520.5, 2573.9, 55.8, 0, "ELQUE"}, 
	[20] = {false, 11436, 0.02, -818.2, 1560.6, 27.1, 0, "LASBA"}, 
	[21] = {false, 16385, 0.02, -135.1, 1116.8, 20.2, 0, "FORCA"}, 
	[22] = {false, 9243, 0.02, -2455.7, 2293, 5, 0, "BAYSA"}, 
	[23] = {false, 5131, 0.02, 2179.5, -2256.2, 14.8, 0, "LOSSA"}, 
	[24] = {false, 12863, 0.02, 710.9, -569.4, 16.3, 0, "DILLI"}, 
	[25] = {false, 13066, 0.02, 169.1, -34.3, 1.6, 0, "BLUEB"}, 
	[26] = {false, 8060, 0.02, 1708.6, 1073.7, 10.8, 0, "LASVE"}, 
	[27] = {false, 13078, 0.02, 1228.1, 182.7, 20.3, 0, "MONTG"}, 
	[28] = {false, 12964, 0.02, 2246.4, 52.4, 26.7, 0, "PALOM"}, 
	[29] = {false, 11092, 0.02, -2119.9, -26.1, 35.3, 0, "SANFI"}, 
	[30] = {false, 3755, 0.02, 2483.8, -2115.9, 13.5, 0, "FOSOI"}, 
}


function resourcemap()
	if(not PData["ResourceMap"]) then
		for i, dat in pairs(ResourceInMap) do
			if(not dat[1]) then
				mx,my,mz = GetCoordOnMap(dat[4],dat[5],dat[6])
				dat[1] = createObject(dat[2], mx,my,mz+0.1) -- Чуть завышены так как толщина линий 1
				setElementRotation(dat[1], 0,0,dat[7])
				setObjectScale(dat[1], dat[3])
				if(dat[8]) then
					local col = createColSphere(mx,my,mz, 2)
					attachElements(col, dat[1])
					setElementData(dat[1], "NameInMap", dat[8])
				end

			end
		end
		
		SetPlayerHudComponentVisible("all", false)
		PData["Interface"]["Full"] = true
		PData["Interface"]["Inventory"] = true
		setElementFrozen(localPlayer, true)
		local theVehicle = getPedOccupiedVehicle(localPlayer)
		if(theVehicle) then
			setElementFrozen(theVehicle, true)
		end
		
		local loadingzones = {}
		for name, dat in pairs(PData["infopath"]) do
			if(not dat) then
				loadingzones[#loadingzones+1] = name
			end
		end
		
		if(#loadingzones == 0) then 
			map()
		else
			helpmessage("Идет загрузка...")
			for slot = 1, #loadingzones do
				if(slot == #loadingzones) then
					triggerServerEvent("CreateVehicleNodeMarker", localPlayer, loadingzones[slot], true)
				else
					triggerServerEvent("CreateVehicleNodeMarker", localPlayer, loadingzones[slot])
				end
			end
		end
	else
		setCameraTarget(localPlayer)
		PData["ResourceMap"] = nil
		
		if(PData["BizControlName"]) then
			triggerServerEvent("StopBizControl", localPlayer, PData["BizControlName"][1]) 
			PText["biz"] = {}
			PData["MapShowInfo"] = nil
			PData["BizControlName"] = nil
			PInv["shop"] = {} 
			PBut["shop"] = {} 
			TradeWindows = false
		end
		
		
		SetPlayerHudComponentVisible("all", true)
		setElementFrozen(localPlayer, false)
		local theVehicle = getPedOccupiedVehicle(localPlayer)
		if(theVehicle) then
			setElementFrozen(theVehicle, false)
		end
		showCursor(false)
	end
end


function map()
	PData["ResourceMap"] = {[1] = {}, [2] = {}, [3] = {}} -- 1 Roads, 2 Railroads, 3 GPS
	
	for zone, arr in pairs(PData["infopath"]) do
		if(arr) then for i, arr2 in pairs(arr) do
			
			local nextmarkers = {}
			if(arr2[6]) then
				for _,k in pairs(arr2[6]) do
					table.insert(nextmarkers, {k[1], k[2]})
				end
			end
			
			if(PData["infopath"][zone][tostring(i+1)]) then
				table.insert(nextmarkers, {zone, i+1})
			end
			
			for _, arr3 in pairs(nextmarkers) do
				if(PData["infopath"][arr3[1]]) then
					local dat = PData["infopath"][arr3[1]][tostring(arr3[2])]
					if(dat) then
						local color = tocolor(120,105,103,255)
						if(dat[1] == "Closed" or arr2[1] == "Closed") then
							color = tocolor(140,125,123,255)
						end
						
						x,y,z = GetCoordOnMap(arr2[2], arr2[3], arr2[4])
						x2,y2,z2 = GetCoordOnMap(dat[2], dat[3], dat[4])
						PData["ResourceMap"][1][#PData["ResourceMap"][1]+1] = {x,y,z,x2,y2,z2, color, 10}
					end
				end
			end
		end end
	end
	
	
	if(PData['gps']) then
		local oldmarker = false
		for i,v in pairs(PData['gps']) do
			if(oldmarker) then
				local x,y,z = unpack(fromJSON(getElementData(v, "coord")))
				local x2,y2,z2 = unpack(fromJSON(getElementData(oldmarker, "coord")))
				x,y,z = GetCoordOnMap(x,y,z)
				x2,y2,z2 = GetCoordOnMap(x2,y2,z2)
				PData["ResourceMap"][3][#PData["ResourceMap"][3]+1] = {x,y,z,x2,y2,z2, tocolor(255,0,0,255), 10}
			end
			oldmarker = v
		end
	end
	
	for zone, arr in pairs(RailRoads) do
		for i, arr2 in pairs(arr) do
			
			local nextmarkers = {}
			if(arr2[6]) then
				for _,k in pairs(arr2[6]) do
					table.insert(nextmarkers, {k[1], k[2]})
				end
			end
			
			if(RailRoads[zone][i+1]) then
				table.insert(nextmarkers, {zone, i+1})
			end
			
			for _, arr3 in pairs(nextmarkers) do
				if(RailRoads[arr3[1]]) then
					local dat = RailRoads[arr3[1]][arr3[2]]
					if(dat) then
						x,y,z = GetCoordOnMap(arr2[2], arr2[3], arr2[4])
						x2,y2,z2 = GetCoordOnMap(dat[2], dat[3], dat[4])
						PData["ResourceMap"][2][#PData["ResourceMap"][2]+1] = {x,y,z,x2,y2,z2, tocolor(99,0,0,255), 10}
					end
				end
			end
		end
	end
	
	
	setCameraMatrix(0, 0, 4250, 0, 0, 4000, 0, 70)
	
	setFarClipDistance(600)
	setWeather(0)--nen
	showCursor(true)
end
addEvent("map", true)
addEventHandler("map", localPlayer, map)




function GetCoordOnMap(x,y,z)
	return x/50,y/50,z/50+(4000)
end


function GetCursorPositionOnMap() -- Можно оптимизировать в дальнейшем
	local _,_,x,y,z = getCursorPosition()
	local camx, camy, camz = getCameraMatrix()
	
	local x2, y2, z2 = camx-x, camy-y, camz-z
	for i = 0, math.round(z2, 0) do
		local per = (i/math.round(z2, 0))
		if(z+(z2*per) >= 4000) then
			return x+(x2*per),y+(y2*per),z+(z2*per)
		end
	end
	return x,y,z
end


function InfoPath(zone, arr, last)
	if(arr) then
		PData['infopath'][zone] = fromJSON(arr)
	else
		PData['infopath'][zone] = nil
	end
	
	if(last) then
		map()
	end
end
addEvent("InfoPath", true)
addEventHandler("InfoPath", localPlayer, InfoPath)


function InfoPathPed(zone, arr)
	if(not GroundMaterial[zone]) then
		local arr = fromJSON(arr)
		GroundMaterial[zone] = {}
		for i, dat2 in pairs(arr) do
			for slotx = dat2[1], dat2[4] do
				if(not GroundMaterial[zone][slotx]) then GroundMaterial[zone][slotx] = {} end
				for sloty = dat2[2], dat2[5] do
					GroundMaterial[zone][slotx][sloty] = 4
				end
			end
			PData['changezone'][zone.." "..i] = {
				[1] = {dat2[1], dat2[2], dat2[3], zone}, 
				[2] = {dat2[4], dat2[5], dat2[6]}
			}
		end
	end
end
addEvent("InfoPathPed", true)
addEventHandler("InfoPathPed", localPlayer, InfoPathPed)



function ShowInfoKey()
	if(ShowInfo) then
		ShowInfo = false
		setDevelopmentMode(false)
	else
		setDevelopmentMode(true)
		ShowInfo = true
		GPS(math.random(-3000,3000), math.random(-3000,3000), math.random(-3000,3000), "Случайная точка ")
	end
end
addEvent("ShowInfoKey", true)
addEventHandler("ShowInfoKey", localPlayer, ShowInfoKey)




function ShowLink()
	if(PData["WebLink"]) then
		if(not isBrowserDomainBlocked(PData["WebLink"], true)) then
			if(not NewsPaper[1]) then
				NewsPaper[1] = createBrowser(screenWidth/1.5, screenHeight/1.5, false, false)
				NewsPaper[3] = PData["WebLink"]
			else
				CloseNewsPaper()
			end
		else
			requestBrowserDomains({PData["WebLink"]}, true)
		end
	end
end
addEvent("ShowLink", true)
addEventHandler("ShowLink", localPlayer, ShowLink)



function onClientBrowserWhitelistChange()
	ShowLink()
end
addEventHandler("onClientBrowserWhitelistChange", root, onClientBrowserWhitelistChange)







function inventoryBind(key)
	if(not BindedKeys[key]) then
		if(key == "0") then 
			key = 10 
		end
		UseInventoryItem("player", tonumber(key))
	end
end


function opengate()
	if(Targets["object"]) then
		triggerServerEvent("opengate", localPlayer, Targets["object"])
	else
		triggerServerEvent("handsup", localPlayer, localPlayer)	
	end
end

function park()
	if(Targets["thePed"]) then
		triggerServerEvent("InviteBot", localPlayer, Targets["thePed"])
	else
		local theVehicle = getPedOccupiedVehicle(localPlayer)
		if(theVehicle) then
			if(getElementData(theVehicle, "owner") == getPlayerName(localPlayer) and not tuningList and VehicleSpeed < 1) then
				triggerServerEvent("ParkMyCar", localPlayer, theVehicle)
				setPedControlState(localPlayer, "enter_exit", true)
			end
		end
	end
end


local objectTypes = {
	[1524] = "Графити", 
    [1525] = "Графити",
	[1526] = "Графити",
	[1528] = "Графити",
	[1529] = "Графити",
	[1530] = "Графити",
	[1531] = "Графити"
}

function GetObjectType(obj)
	local model = getElementModel(obj)
	return objectTypes[model] or "Неизвестно"
end


function onClientPlayerWeaponFireFunc(weapon, ammo, ammoInClip, hitX, hitY, hitZ, hitElement)
	if source == localPlayer then
		if(not hitElement) then
			local col = createObject(16635, hitX, hitY, hitZ)
			for _, v in pairs(getElementsByType("colshape", getRootElement(), true)) do
				if(isElementWithinColShape(col, v)) then
					hitElement = getElementAttachedTo(v)
				end
			end
			destroyElement(col)
		end
		
		
		if(weapon == 41) then
			if(GetObjectType(hitElement) == "Графити") then
				ToolTip("Доделаю потом")
			end
		elseif(weapon == 42) then
			if(getElementModel(hitElement) == 1362) then
				triggerServerEvent("RemoveFire", localPlayer, localPlayer, hitElement)
			end
		elseif(weapon == 43 and getElementModel(source) == 60) then
			triggerServerEvent("doTakeScreenShot", localPlayer)
		else
			if WeaponAmmo[weapon] then
				for key, k in pairs(PInv["player"][usableslot][4]) do
					if(k[1] == WeaponAmmo[weapon]) then
						RemoveInventoryItemID(usableslot, key)
						break
					end
				end --Для патронов
				
				if(PInv["player"][usableslot][1] == WeaponAmmo[weapon]) then
					RemoveInventoryItemID(usableslot)
				end-- Для гранат
				
			end
			if(getPedTotalAmmo(localPlayer) == 0) then
				triggerServerEvent("useinvweapon", localPlayer, localPlayer)
			end
		end
	end
end
addEventHandler("onClientPlayerWeaponFire", localPlayer, onClientPlayerWeaponFireFunc)





function SetupInventory()
	if(not initializedInv) then
		local StPosx = (screenWidth)-((80*NewScale)*10)
		local StPosxy = (screenHeight)-(80*NewScale)
		local binvx = 0
		local binvy = 0

		for i,val in pairs(PInv["player"]) do
			PBut["player"][i] = {StPosx+binvx, StPosxy+binvy, 80*NewScale, 60*NewScale}

			binvx = binvx+(80.5*NewScale)
		end
		
		initializedInv = true
		UpdateInventoryMass()
	end
end
addEvent("SetupInventory", true)
addEventHandler("SetupInventory", localPlayer, SetupInventory)





function playerPressedKey(button, press)
	if(PData["ResourceMap"]) then
		if(press) then
			if(isTimer(PData["MovementMapTimer"])) then
				killTimer(PData["MovementMapTimer"])
			end
			PData["MovementMapSpeed"] = 1
		else
			if(isTimer(PData["MovementMapTimer"])) then killTimer(PData["MovementMapTimer"]) end
		end
		if(button == "w") then
			if(press) then
				PData["MovementMapTimer"] = setTimer(function() 
					local x,y,z,rx,ry,rz,r,f = getCameraMatrix()
					setCameraMatrix(x,y+PData["MovementMapSpeed"],z,rx,ry+PData["MovementMapSpeed"],rz,r,f)
					PData["MovementMapSpeed"] = PData["MovementMapSpeed"]+0.3
				end, 50, 0)
			end
		elseif(button == "s") then
			if(press) then
				PData["MovementMapTimer"] = setTimer(function() 
					local x,y,z,rx,ry,rz,r,f = getCameraMatrix()
					setCameraMatrix(x,y-PData["MovementMapSpeed"],z,rx,ry-PData["MovementMapSpeed"],rz,r,f)
					PData["MovementMapSpeed"] = PData["MovementMapSpeed"]+0.3
				end, 50, 0)
			end
		elseif(button == "a") then
			if(press) then
				PData["MovementMapTimer"] = setTimer(function() 
					local x,y,z,rx,ry,rz,r,f = getCameraMatrix()
					setCameraMatrix(x-PData["MovementMapSpeed"],y,z,rx-PData["MovementMapSpeed"],ry,rz,r,f)
					PData["MovementMapSpeed"] = PData["MovementMapSpeed"]+0.3
				end, 50, 0)
			end
		elseif(button == "d") then
			if(press) then
				PData["MovementMapTimer"] = setTimer(function() 
					local x,y,z,rx,ry,rz,r,f = getCameraMatrix()
					setCameraMatrix(x+PData["MovementMapSpeed"],y,z,rx+PData["MovementMapSpeed"],ry,rz,r,f)
					PData["MovementMapSpeed"] = PData["MovementMapSpeed"]+0.3
				end, 50, 0)
			end	
		elseif(button == "mouse_wheel_down") then
			if(press) then
				local x,y,z,rx,ry,rz,r,f = getCameraMatrix()
				if(z < 4250) then
					setCameraMatrix(x,y+2,z+10,rx,ry,rz,r,f)
				end
			end
		elseif(button == "mouse_wheel_up") then
			if(press) then
				local x,y,z,rx,ry,rz,r,f = getCameraMatrix()
				if(z > 4010) then
					setCameraMatrix(x,y-2,z-10,rx,ry,rz,r,f)
				end
			end
		elseif(button == "mouse2") then
			if(press) then
				if(isElement(PData["WaypointBlip"])) then
					destroyElement(PData["WaypointBlip"])
				else
					local x,y,z = GetCursorPositionOnMap()
					PData["WaypointBlip"] = createBlip(x*50, y*50, 0, 41)
					local px,py,pz = getElementPosition(localPlayer)
					triggerServerEvent("GetPathByCoordsNEW", localPlayer, localPlayer, px, py, pz, x*50, y*50, 20)
					--[[triggerServerEvent("saveserver", localPlayer, localPlayer, 
					x*50, y*50, 20, 
					x*50, y*50, 20, "PedPath"
					)--]]
				end
			end
		elseif(button == "mouse1") then
			if(press) then
				if(PData["MapShowInfo"]) then
					triggerServerEvent("StopBizControl", localPlayer, PData["BizControlName"][1]) 
					PText["biz"] = {}
					PData["MapShowInfo"] = nil
					PData["BizControlName"] = nil
					PInv["shop"] = {} 
					PBut["shop"] = {} 
					TradeWindows = false
				end
				if(PData["MapHitElement"]) then
					PData["MapShowInfo"] = getElementData(PData["MapHitElement"], "NameInMap")
					playSFX("script", 71, 0, false)
					triggerServerEvent("StartLookBiz", localPlayer, localPlayer, false, getElementData(PData["MapHitElement"], "NameInMap"), "map")
				end
			end
		end
	end


	if(button == "mouse2") then
		if(isPlayerMapForced()) then
			if(press) then
				showCursor(true)
			else
				showCursor(false)
			end
		end
	elseif(button == "mouse1") then
		if(press) then
			if(not isCursorShowing()) then
				if(PInv["player"][usableslot]) then
					if(PInv["player"][usableslot][1]) then
						if(PInv["player"][usableslot][1] == "Удочка") then
							if(PData["fishpos"]) then
								triggerServerEvent("StopFish", localPlayer, localPlayer)
							else
								getGroundPositionFish()
							end
							cancelEvent()
						end
						if(PInv["player"][usableslot][1]) then
							if(items[PInv["player"][usableslot][1]][4]) then
								if(items[PInv["player"][usableslot][1]][4] ~= "useinvweapon") then
									UseInventoryItem("player", usableslot)
									cancelEvent()
								end
							end
						end
					end
				end
			end
		end
	end
	
	if(getPedOccupiedVehicle(localPlayer)) then
		if(getPedOccupiedVehicleSeat(localPlayer) == 0) then
			if(button == "lshift") then
				if(PData['rage'] > 0) then
					if(press) then
						PData['ragetimer'] = setTimer(function() 
							AddRage(-4)
						end, 50, 0)
						triggerServerEvent("Acceleration", localPlayer, localPlayer)
					else
						killTimer(PData['ragetimer'])
						triggerServerEvent("AccelerationDown", localPlayer, localPlayer)
					end
				end
			end
		end
	end
	
	
    if (press) then
		if(BindedKeys[button]) then
			triggerEvent(unpack(BindedKeys[button]))
			if(button == "enter") then
				PText["HUD"][8] = nil
				BindedKeys[button] = nil
			end
			cancelEvent()
		end
		
		if(PText["HUD"][8]) then
			if(button == "space") then
				button = " "
			elseif(button == "backspace") then
				BindedKeys["enter"][3][4] = BindedKeys["enter"][3][4]:sub(1, -2)
			end
			if(#button == 1) then
				BindedKeys["enter"][3][4] = BindedKeys["enter"][3][4]..button
				cancelEvent()
			end
		end
		
		
		for key, arr in pairs(PData["MultipleAction"]) do
			if(key == button) then
				triggerEvent(arr[1], localPlayer, localPlayer, arr[5])
			end
		end
		
		
		if(NewsPaper[1]) then
			if(NewsPaper[2]) then
				if button == "mouse_wheel_down" then
					injectBrowserMouseWheel(NewsPaper[1], -40, 0)
					cancelEvent()
				elseif button == "mouse_wheel_up" then
					injectBrowserMouseWheel(NewsPaper[1], 40, 0)
					cancelEvent()
				elseif button == "escape" then
					CloseNewsPaper()
					cancelEvent()
				end
			end
		end

		if(tuningList) then
			if(button == "s" or button == "arrow_d") then
				cancelEvent()
				if(TuningSelector+1 <= #PText["tuning"]) then
					PText["tuning"][TuningSelector][6] = tocolor(98, 125, 152, 255)
					PText["tuning"][TuningSelector+1][6] = tocolor(201, 219, 244, 255)
					TuningSelector = TuningSelector+1
				else
					PText["tuning"][TuningSelector][6] = tocolor(98, 125, 152, 255)
					PText["tuning"][1][6] = tocolor(201, 219, 244, 255)
					TuningSelector = 1
					TuningListOpen(false, 1)
				end
				if(PText["tuning"][TuningSelector][20][5]) then UpgradePreload(nil, PText["tuning"][TuningSelector][20][3], PText["tuning"][TuningSelector][20][4], PText["tuning"][TuningSelector][20][5]) end
			elseif(button == "w" or button == "arrow_u") then
				cancelEvent()
				if(TuningSelector-1 >= 1) then
					PText["tuning"][TuningSelector][6] = tocolor(98, 125, 152, 255)
					PText["tuning"][TuningSelector-1][6] = tocolor(201, 219, 244, 255)
					TuningSelector = TuningSelector-1
				else
					PText["tuning"][TuningSelector][6] = tocolor(98, 125, 152, 255)
					PText["tuning"][#PText["tuning"]][6] = tocolor(201, 219, 244, 255)
					TuningSelector = #PText["tuning"]
					TuningListOpen(false, -1)
				end
				if(PText["tuning"][TuningSelector][20][5]) then UpgradePreload(nil, PText["tuning"][TuningSelector][20][3], PText["tuning"][TuningSelector][20][4], PText["tuning"][TuningSelector][20][5]) end
			elseif(button == "e" or button == "enter" or button == "space" or button == "d") then
				cancelEvent()
				triggerEvent(unpack(PText["tuning"][TuningSelector][20]))
			elseif(button == "backspace" or button == "escape") then
				cancelEvent()
				if(PText["tuning"][TuningSelector][20][5]) then 
					LoadUpgrade()
				else
					TuningExit()
				end
			end
		end
		if(LainOS) then
			if(button == "space") then button = " " 
			elseif(button == "backspace") then LainOSInput = string.sub(LainOSInput, 0, -2) button = "" 
			elseif(button == "enter") then ExecuteLainOSCommand(LainOSInput) LainOSInput = "" button = "" end
			LainOSInput = LainOSInput..button
			UpdateLainOSCursor()
		end
		if(button == "escape") then
			if(InventoryWindows) then
				cancelEvent()
				SetupBackpack()
			elseif(TradeWindows) then
				if(not DragElement) then
					DragElementId = false
					DragElementName = false
					showCursor(false)
					TradeWindows = false
					PBut["shop"] = {}
					cancelEvent()
				end
			elseif(TrunkWindows) then
				if(not DragElement) then
					DragElementId = false
					DragElementName = false
					showCursor(false)
					TrunkWindows = false
					PBut["trunk"] = {}
					triggerServerEvent("TrunkClose", localPlayer, localPlayer)
					cancelEvent()
				end
			end
			if(PData["BizControlName"]) then
				cancelEvent()
				triggerServerEvent("StopBizControl", localPlayer, PData["BizControlName"][1]) 
				PData["BizControlName"] = nil
				PText["biz"] = {}
				showCursor(false)
			end
			if(BANKCTL) then
				cancelEvent()
				BankControl()
			end
			if(LainOS) then		
				cancelEvent()
				LainOS = false 
				killTimer(LainOSCursorTimer)
				PText["LainOS"] = {}
				showChat(true)
			end
			if(wardprobeArr) then
				cancelEvent()
				NewNextSkinEnter(nil,nil,true)
			end
		elseif(button == "f") then
			for i, key in pairs(PData["Target"]) do
				if(WardrobeObject[i]) then
					triggerServerEvent("EnterWardrobe", localPlayer, localPlayer, getElementDimension(localPlayer))
				end
			end
		elseif(button == "mouse_wheel_up") then
			if(PING) then
				if(TabScroll > 1) then
					TabScroll=TabScroll-1
					UpdateTabEvent()
				end
			end
		elseif(button == "mouse_wheel_down") then
			if(PING) then
				if(MAXSCROLL < TABCurrent) then
					TabScroll=TabScroll+1
					UpdateTabEvent()
				end
			end
		end
    end
end
addEventHandler("onClientKey", root, playerPressedKey)



function TradeWindow(Trade, biz)
	if(PEDChangeSkin == "play") then
		if(not TradeWindows and not InventoryWindows) then
			PInv["shop"] = Trade
			PBut["shop"] = {} 
			TradeWindows = biz
			DragElementId = false
			DragElementName = false
			showCursor(true)
			local Coord = {
				["Trade"] = {
					["i"] = 1,
					["x"] = 640*scalex,
					["y"] = 500*scaley-(30*scaley), 
					["vx"] = (2.5*scalex),
					["vy"] = (80.5*scaley)
				},
				["Sell"] = {
					["i"] = 1,
					["x"] = 640*scalex,
					["y"] = 360*scaley-(30*scaley), 
					["vx"] = (2.5*scalex),
					["vy"] = (80.5*scaley)
				}
			}
			for _, dat in pairs(PInv["shop"]) do
				PBut["shop"][#PBut["shop"]+1] = {Coord[dat[2]]["x"]+Coord[dat[2]]["vx"], Coord[dat[2]]["y"]+Coord[dat[2]]["vy"], 80*scalex, 60*scaley}
				Coord[dat[2]]["vx"] = Coord[dat[2]]["vx"]+(80.5*scalex)
				if(Coord[dat[2]]["i"] == 8 or Coord[dat[2]]["i"] == 16 or Coord[dat[2]]["i"] == 24 or Coord[dat[2]]["i"] == 32) then
					Coord[dat[2]]["x"], Coord[dat[2]]["y"] = 640*scalex, 360*scaley-(30*scaley)
					Coord[dat[2]]["vx"], Coord[dat[2]]["vy"] = (2.5*scalex), Coord[dat[2]]["vy"]+(80.5*scaley)
				end
				Coord[dat[2]]["i"] = Coord[dat[2]]["i"]+1
			end
		end
	end
end
addEvent("TradeWindow", true)
addEventHandler("TradeWindow", localPlayer, TradeWindow)


function CreateTarget(el)
	local ex,ey,ez = getElementPosition(el)
	local px,py,pz = getElementPosition(localPlayer)
	local dist = getDistanceBetweenPoints3D(ex,ey,ez,px,py,pz)
	if(dist < 30) then
		local types = getElementType(el)
		if(dist < 2) then
			if(types == "vehicle") then 
				local driver = getVehicleOccupant(el)
				if(driver) then
					if(getElementType(driver) == "ped") then
						PData["MultipleAction"]["f"] = {"CarJack", false, false, false}
					end
				end
			elseif(types == "player") then
				sx,sy = getScreenFromWorldPosition(ex,ey,ez)
				if(sx and sy) then
					PData["MultipleAction"]["e"] = {"PedDialog", "Начать разговор", sx,sy}
				end
			end
		end
		local AllBones = false
		if(types == "vehicle") then 
			AllBones = getVehicleComponents(el)
		elseif(types == "ped" or types == "player") then 
			AllBones = {1, 2, 3, 4, 5, 6, 7, 8, 21, 22, 23, 24, 25, 26, 31, 32, 33, 34, 35, 36, 41, 42, 43, 44, 51, 52, 53, 54} 
		end
		
		local minx, maxx, miny, maxy = screenWidth, 0, screenHeight, 0
		
		if(AllBones) then
			for bones in pairs(AllBones) do
				local x,y,z = false, false, false
				if(types == "vehicle") then 
					x,y,z = getVehicleComponentPosition(el, bones, "world")
							
				
					if(bones == "boot_dummy" or bones == "bump_rear_dummy") then
						local distdummy = getDistanceBetweenPoints3D(x,y,z,px,py,pz)
						if(distdummy < 3) then
							sx,sy = getScreenFromWorldPosition(x,y,z)
							if(sx and sy) then
								PData["MultipleAction"]["e"] = {"TrunkReq", "открыть", sx, sy}
							end
						end
					end
				elseif(types == "ped" or types == "player") then 
					x,y,z = getPedBonePosition(el, AllBones[bones]) 
				end
		
				x,y = getScreenFromWorldPosition(x,y,z)
				if(x and y) then
					if(x > maxx) then
						maxx = x
					end
					if(x < minx) then
						minx = x
					end
					
					if(y > maxy) then
						maxy = y
					end
					if(y < miny) then
						miny = y
					end
				end
			end

			local p = (40-dist) --Отступ
			maxx = maxx+(p*scalex)
			minx = minx-(p*scalex)
			maxy = maxy+(p*scaley)
			miny = miny-(p*scaley)
			
			local sizeBox = 10
			
			dxDrawLine(maxx, maxy, maxx+sizeBox, maxy, tocolor(255,255,255,180), 1)
			dxDrawLine(maxx+sizeBox, maxy, maxx+sizeBox, maxy-sizeBox, tocolor(255,255,255,180), 1)
			
			dxDrawLine(maxx, miny, maxx+sizeBox, miny, tocolor(255,255,255,180), 1)
			dxDrawLine(maxx+sizeBox, miny, maxx+sizeBox, miny+sizeBox, tocolor(255,255,255,180), 1)
			
			
			dxDrawLine(minx, maxy, minx+sizeBox, maxy, tocolor(255,255,255,180), 1)
			dxDrawLine(minx, maxy, minx, maxy-sizeBox, tocolor(255,255,255,180), 1)
			
			dxDrawLine(minx, miny, minx+sizeBox, miny, tocolor(255,255,255,180), 1)
			dxDrawLine(minx, miny, minx, miny+sizeBox, tocolor(255,255,255,180), 1)
			
			local text = false
			if(types == "vehicle") then 
				text = getVehicleName(el)
				if(getElementData(el, "year")) then
					text = text.." "..getElementData(el, "year")
				end
			elseif(types == "ped") then 
				text = "Неизвестно"
			end
			
			if(getElementData(el, "name")) then
				text = getElementData(el, "name")
			end
			
			if(text) then
				local tw = dxGetTextWidth(text, scale/2, "default-bold", true)
				local th = dxGetFontHeight(scale/2, "default-bold")
				dxDrawRectangle(minx+(1*scalex), miny+(1*scaley), tw+(10*scalex), th+(8*scaley), tocolor(0,0,0,180))
				dxDrawText(text, minx+(6*scalex), miny+(5*scaley), 0, 0, tocolor(200, 200, 200, 255), scale/2, "default-bold", "left", "top", false, false, false, true)
			end
		end	
	end
end

function ShakeLevel(level)
	PData["ShakeLVL"] = PData["ShakeLVL"]+level
end
addEvent("ShakeLevel", true)
addEventHandler("ShakeLevel", localPlayer, ShakeLevel)




function DrawOnClientRender()
	if(NewsPaper[1]) then
		if(NewsPaper[2]) then
			dxDrawImage(screenWidth/6, screenHeight/6, screenWidth/1.5, screenHeight/1.5, NewsPaper[1], 0, 0, 0, tocolor(255,255,255,255), true)
		end
	end


	if(PData['CameraMove']) then
		if(isTimer(PData['CameraMove']['timer'])) then
			local remaining, _, totalExecutes = getTimerDetails(PData['CameraMove']['timer'])
			local percent = 100-(remaining/totalExecutes)*100
			local a1, a2 = PData['CameraMove']['sourcePosition'], PData['CameraMove']['needPosition']
			local newx, newy, newz, newlx, newly, newlz = a1[1]-a2[1], a1[2]-a2[2], a1[3]-a2[3], a1[4]-a2[4], a1[5]-a2[5], a1[6]-a2[6]
			newx, newy, newz, newlx, newly, newlz = (newx/100)*percent, (newy/100)*percent, (newz/100)*percent, (newlx/100)*percent, (newly/100)*percent, (newlz/100)*percent 
			setCameraMatrix(a1[1]-newx, a1[2]-newy, a1[3]-newz, a1[4]-newlx, a1[5]-newly, a1[6]-newlz)
		end
	end

	if(isPlayerMapForced()) then
		return false
	end

	if(not PData["wasted"]) then
		if(PData["fishpos"]) then
			local x2,y2,z2 = getPedWeaponMuzzlePosition(localPlayer)
			local _, _, rz2 = getElementRotation(localPlayer)
			local x,y,z = getPointInFrontOfPoint(x2,y2,z2,rz2+90, 1)
			dxDrawLine3D(x,y,z+0.75,PData["fishpos"]["x"], PData["fishpos"]["y"], PData["fishpos"]["z"], tocolor(255,255,255,255), 0.98)
		end
		if(Targets["theVehicle"]) then
			CreateTarget(Targets["theVehicle"])
			
			local fract = ""
			local color = false
			local PLText = getVehiclePlateText(Targets["theVehicle"])
			local ps = string.sub(PLText, 0, 1)
			local pe = string.sub(PLText, 6, 9)
			if(PLText == "VAGOS228") then
				fract="Вагос"
				color=getTeamVariable("Вагос")
			elseif(PLText == "RIFA 228") then
				fract="Рифа"
				color=getTeamVariable("Вагос")
			elseif(PLText == "YAZA 228") then
				fract="Якудзы"
				color=getTeamVariable("Вагос")
			elseif(PLText == "METAL228") then
				fract="Байкеры"
				color=getTeamVariable("Вагос")
			elseif(PLText == "TRIA 228") then
				fract="Триады"
				color=getTeamVariable("Гроув-стрит")
			elseif(PLText == "GRST 228" or PLText == "GROVE4L_") then
				fract="Гроув-стрит"	
				color=getTeamVariable("Гроув-стрит")
			elseif(PLText == "AZTC 228") then
				fract="Ацтекас"	
				color=getTeamVariable("Гроув-стрит")
			elseif(PLText == "BALS 228") then
				fract="Баллас"	
				color=getTeamVariable("Баллас")
			elseif(PLText == "RUSM 228") then
				fract="Русская мафия"
				color=getTeamVariable("Баллас")
			elseif(PLText == "COKA 228") then
				fract="Колумбийский картель"
				color=getTeamVariable("Баллас")
			elseif(PLText == "NEWS 228") then
				fract="СМИ"
				color=getTeamVariable("Мирные жители")
			elseif(ps == "I" and pe == "228") then
				fract="Служебный"
			elseif(ps == "M" and pe == "228") then
				fract="МЧС"
			elseif(ps == "P" and pe == "228" or PLText == "_CUFFS__") then
				fract="Полиция"
				color=getTeamVariable("Полиция")
			elseif(ps == "A" and pe == "228") then
				fract="Военные"
				color=getTeamVariable("Полиция")
			elseif(getElementData(Targets["theVehicle"], "owner")) then
				fract="Частная собственность"
			elseif(ps == "U" and pe == "228") then
				fract="Учебная"
			elseif(PLText == "KOLHZ228") then
				fract="Деревенщины"
				color=getTeamVariable("Уголовники")
			else
				color=getTeamVariable("Мирные жители")
				fract="Мирные жители"
			end
			
			if(color) then
				if(color >= 0) then
					color = tocolor(54, 192, 44, 255)
				else
					color = tocolor(204, 0, 0, 255)
				end
			else
				color = tocolor(200, 200, 200, 255)
			end
			MemText(Text(fract), (screenWidth/2)+(60*scalex), (screenHeight/2)-(70*scaley), color, NewScale*1.5, "default-bold", NewScale*1.5, 0, true)
						
			
			if(getVehiclePlateText(Targets["theVehicle"]) == "SELL 228") then
				local x,y,z = getElementPosition(Targets["theVehicle"])
				local price = false
				if(getElementData(Targets["theVehicle"], "price")) then
					price = getElementData(Targets["theVehicle"], "price")
				else
					price = getVehicleHandlingProperty(Targets["theVehicle"], "monetary")
				end
				create3dtext("$"..price, x,y,z+1, scale*2, 60, tocolor(228, 54, 70, 180), "default-bold")
			end
		elseif(Targets["thePlayer"]) then		
			local skin = getElementModel(Targets["thePlayer"])
			local color = getTeamVariable(ArraySkinInfo[skin][1])

			if(color) then
				if(color >= 0) then
					color=tocolor(54, 192, 44, 255)
				else
					color=tocolor(204, 0, 0, 255)
				end
			else
				color=tocolor(200, 200, 200, 255)
			end
			MemText(Text(getTeamGroup(ArraySkinInfo[skin][1])), (screenWidth/2)+(60*scalex), (screenHeight/2)-(70*scaley), color, NewScale*1.5, "default-bold", NewScale*1.5, 0, true)
						
			CreateTarget(Targets["thePlayer"])
		elseif(Targets["thePed"]) then
			local team = getElementData(Targets["thePed"], "team")
			local color = getTeamVariable(team)
			if(color) then
				if(color >= 0) then
					color=tocolor(54, 192, 44, 255)
				else
					color=tocolor(204, 0, 0, 255)
				end
			else
				color=tocolor(200, 200, 200, 255)
			end
			if(team) then
				MemText(Text(getTeamGroup(team)), (screenWidth/2)+(60*scalex), (screenHeight/2)-(70*scaley), color, NewScale*1.5, "default-bold", NewScale*1.5, 0, true)
			end
			
			CreateTarget(Targets["thePed"])
		end
		
		for _, ped in pairs(getElementsByType("ped", getRootElement(), true)) do
			local text = ""
			
			local x,y,z = getElementPosition(localPlayer)
			local pedx, pedy, pedz = getElementPosition(ped)
			local distance = getDistanceBetweenPoints3D(x,y,z, pedx, pedy, pedz)
			if(distance < 10) then
				--text = "『 В разработке 』\n "
			end
			if(PlayersMessage[ped]) then
				text = text.."#EEEEEE"..PlayersMessage[ped]
			end
			if(text ~= "") then
				local hx,hy,hz = getPedBonePosition(ped, 5)
				create3dtext(text, hx,hy,hz+0.25, NewScale*1.8, 60, tocolor(255,255,255, 220), "default-bold")
			end
		end
		
		for i, arr in pairs(PData['ExpText']) do
			if(not arr[4]) then 
				arr[4] = 0
				arr[5] = 255
			end
			
			font = "sans"
			tw = dxGetTextWidth(arr[1], NewScale*1.8, font, true)
			th = dxGetFontHeight(NewScale*1.8, font)

			dxDrawBorderedText(arr[1], (arr[2]-tw/2), (arr[3]-th/2)+arr[4], screenWidth, screenHeight, tocolor(255, 153, 0 , 255), NewScale*1.8, font, "left", nil, nil, nil, nil, true)
			arr[4] = arr[4]-0.3
			arr[5] = arr[5]-1
			if(arr[5] <= 0) then
				PData['ExpText'][i] = nil
			end
		end
		
		
		for _, thePlayer in pairs(getElementsByType("player", getRootElement(), true)) do
			if(thePlayer) then
				local Team = getPlayerTeam(thePlayer)
				if(Team) then
					local x,y,z = getPedBonePosition(thePlayer, 5)
					local text = {}
					
					local skin = getElementModel(thePlayer)
					if(not skin) then return false end
					
					
					if(isPedDoingTask(thePlayer, "TASK_SIMPLE_USE_GUN")) then
						if(getElementData(thePlayer, "laser")) then
							local wx,wy,wz = getPedWeaponMuzzlePosition(thePlayer)
							local x2,y2,z2 = getPedTargetEnd(thePlayer)
							local arr = fromJSON(getElementData(thePlayer, "laser"))
							dxDrawLine3D(wx,wy,wz,x2,y2,z2, tocolor(arr["color"][1], arr["color"][2], arr["color"][3], arr["color"][4]), 0.8)
						end
					end
					
					if(skin == 285 or skin == 264) then
						text["nickname"] = "『 неизвестно 』"
						local r,g,b = getTeamColor(getTeamFromName(ArraySkinInfo[skin][1]))
						text["nicknamecolor"] = tocolor(r,g,b, 200)
					else
						if(not ArraySkinInfo[skin]) then outputChatBox(skin) end
						if(thePlayer ~= localPlayer) then
							text["nickname"] = getPlayerName(thePlayer)
							local r,g,b = getTeamColor(getTeamFromName(ArraySkinInfo[skin][1]))
							text["nicknamecolor"] = tocolor(r,g,b, 200)
						end
						if(skin == 252) then --CENSORED
							sx, sy, sz = getCameraMatrix()
							local x2,y2,z2 = getPedBonePosition(thePlayer, 1)
							local distance = getDistanceBetweenPoints3D(x2,y2,z2, sx, sy, sz)
							if(isLineOfSightClear(x2,y2,z2, sx, sy, sz, true, true, false, false, false)) then
								sx,sy = getScreenFromWorldPosition(x2,y2,z2)
								if(sx) then
									local CensureColor = {
										tocolor(50,50,50),
										tocolor(25,25,25),
										tocolor(75,75,75),
										tocolor(150, 90, 60),
										tocolor(228, 200, 160),
									}
									for i = 1, 8 do
										for i2 = 1, 8 do
											dxDrawRectangle(sx-(170*scale)/distance+((35*i)*scale/distance), sy-(70*scale)/distance+((35*i2)*scale/distance), (35*scale)/distance,(35*scale)/distance, CensureColor[math.random(#CensureColor)])
										end
									end
								end
							end
						elseif(skin == 145) then
							sx, sy, sz = getCameraMatrix()
							local x2,y2,z2 = getPedBonePosition(thePlayer, 1)
							local distance = getDistanceBetweenPoints3D(x2,y2,z2, sx, sy, sz)
							if(isLineOfSightClear(x2,y2,z2, sx, sy, sz, true, true, false, false, false)) then
								sx,sy = getScreenFromWorldPosition(x2,y2,z2)
								if(sx) then
									local CensureColor = {
										tocolor(50,50,50),
										tocolor(25,25,25),
										tocolor(75,75,75),
										tocolor(150, 90, 60),
										tocolor(228, 200, 160),
									}
									for i = 1, 8 do
										for i2 = 1, 8 do
											dxDrawRectangle(sx-(170*scale)/distance+((35*i)*scale/distance), sy-(90*scale)/distance+((35*i2)*scale/distance), (35*scale)/distance,(35*scale)/distance, CensureColor[math.random(#CensureColor)])
										end
									end
								end
							end
						end
					end
					
					local cx,cy,cz = getCameraMatrix()
					local depth = getDistanceBetweenPoints3D(x,y,z,cx,cy,cz)
					if(depth < 60) then
						local fh = dxGetFontHeight(NewScale*1.8, "default-bold")/(60/(60-depth))
						local sx,sy = getScreenFromWorldPosition(x,y,z+0.30)
						if(sx and sy) then
							if(PlayersMessage[thePlayer]) then
								x, y, z = getWorldFromScreenPosition(sx, sy-fh, depth)
								create3dtext(PlayersMessage[thePlayer], x,y,z, NewScale*1.8, 60, tocolor(230,230,230,200), "default-bold")
							end
							
							x, y, z = getWorldFromScreenPosition(sx, sy, depth)
							create3dtext(text["nickname"], x,y,z, NewScale*1.8, 60, text["nicknamecolor"], "default-bold")
						
							if(PlayersAction[thePlayer]) then
								x, y, z = getWorldFromScreenPosition(sx, sy+fh, depth)
								create3dtext(PlayersAction[thePlayer], x,y,z, NewScale*1.8, 60, tocolor(255,0,0,200), "default-bold")
							end
						end
					end
				end
			end
		end
	end
end
addEventHandler("onClientRender", root, DrawOnClientRender)




function DrawTriangle(a,b,c,d,color,revers)
	if(d > b) then
		b,d = b-(1*scaley), d+(1*scaley)
		for i=0, d-b do
			if(revers) then
				dxDrawLine(a,b+i,c,d,color, 1)
			else
				dxDrawLine(a,b,c,d-i,color, 1)
			end
		end
	else
		d,b,a = d-(1*scaley), b+(1*scaley),a-(1*scalex)
		for i=0, b-d do
			if(revers) then
				dxDrawLine(c,d+i,a,b,color, 1)
			else
				dxDrawLine(c,d,a,b-i,color, 1)
			end
		end
	end
end


function DrawZast(x,y,w,h,zahx,zahy,target)
	dxDrawImageSection(x,y, w,h , zahx,zahy, w,h, target)
end



function vp(command, h)
	local x,y,z = getElementPosition(localPlayer)
	triggerServerEvent("vp", localPlayer, localPlayer, h, x, y, z)
end
addCommandHandler("vp", vp)








function getTeamGroup(team)
	if(team == "Мирные жители" or team == "МЧС") then
		return "Мирные жители"
	elseif(team == "Вагос" or team == "Якудзы" or team == "Рифа") then
		return "Синдикат Локо"
	elseif(team == "Баллас" or team == "Колумбийский картель" or team == "Русская мафия") then
		return "Наркомафия"
	elseif(team == "Гроув-стрит" or team == "Триады" or team == "Ацтекас") then
	    return "Бандиты"
	elseif(team == "Полиция" or team == "Военные" or team == "ЦРУ" or team == "ФБР") then
		return "Официалы"
	elseif(team == "Уголовники" or team == "Байкеры" or team == "Деревенщины") then
		return "Уголовники"
	end
end


function getTeamGroupColor(team)
	if(team == "Мирные жители" or team == "МЧС") then
		return "#CCCCCC"
	elseif(team == "Вагос" or team == "Якудзы" or team == "Рифа") then
		return "#A00000"
	elseif(team == "Баллас" or team == "Колумбийский картель" or team == "Русская мафия") then
		return "#B7410E"
	elseif(team == "Гроув-стрит" or team == "Триады" or team == "Ацтекас") then
	    return "#4E653D"
	elseif(team == "Полиция" or team == "Военные" or team == "ЦРУ" or team == "ФБР") then
		return "#4169E1"
	elseif(team == "Уголовники" or team == "Байкеры" or team == "Деревенщины") then
		return "#858585"
	end
end




function getTeamVariable(team)
	if(team == "Мирные жители" or team == "МЧС") then
		return tonumber(getElementData(localPlayer, "civilian"))
	elseif(team == "Вагос" or team == "Якудзы" or team == "Рифа") then
		return tonumber(getElementData(localPlayer, "vagos"))
	elseif(team == "Баллас" or team == "Колумбийский картель" or team == "Русская мафия") then
		return tonumber(getElementData(localPlayer, "ballas"))	
	elseif(team == "Гроув-стрит" or team == "Триады" or team == "Ацтекас") then
	    return tonumber(getElementData(localPlayer, "grove"))
	elseif(team == "Полиция" or team == "Военные" or team == "ЦРУ" or team == "ФБР") then
		return tonumber(getElementData(localPlayer, "police"))
	elseif(team == "Уголовники" or team == "Байкеры" or team == "Деревенщины") then
		return tonumber(getElementData(localPlayer, "ugol"))
	end
end


function angle()
	local theVehicle = getPedOccupiedVehicle(localPlayer)
	local vx,vy,vz = getElementVelocity(theVehicle)
	local modV = math.sqrt(vx*vx + vy*vy)
	
	if not isVehicleOnGround(theVehicle) then return 0,modV end
	
	local rx,ry,rz = getElementRotation(theVehicle)
	local sn,cs = -math.sin(math.rad(rz)), math.cos(math.rad(rz))
	
	local deltaT = tick - (multTime or 0)
	if mult~= 1 and modV <= 0.3 and deltaT > 750 then
		mult = mult-1
		multTime = tick
	elseif deltaT > 1500 then
		local temp = 1
		if score >= 1000 then
			temp = 5
		elseif score >= 500 then
			temp = 4
		elseif score >= 250 then
			temp = 3
		elseif score >= 100 then
			temp = 2
		end
		if temp>mult then
			mult = temp
			multTime = tick
		end
	end
	

	local cosX = (sn*vx + cs*vy)/modV
	if cosX > 0.966 or cosX < 0 then return 0,modV end
	return math.deg(math.acos(cosX))*0.5, modV
end

addEvent("driftCarCrashed", true)
addEventHandler("driftCarCrashed", getRootElement(), function()
	resetTimer(PData["ClearDriving"])
	if score ~= 0 then
		score = 0
		mult = 1
	end
end)




function IsItemForSale(name)
	local state = false
	for _, dat in pairs(PInv["shop"]) do
		if(dat[2] == "Trade") then
			if(dat[1] == name) then
				state = true
			end
		end
	end
	return state
end



function hex2rgb(hex) return tonumber("0x"..hex:sub(1,2)), tonumber("0x"..hex:sub(3,4)), tonumber("0x"..hex:sub(5,6)) end 



function findRotation( x1, y1, x2, y2 ) 
    local t = -math.deg( math.atan2( x2 - x1, y2 - y1 ) )
    return t < 0 and t + 360 or t
end




function StopDrag(name, id)
	if(name and id) then
		DragElementName = name
		DragElementId = id
	end
	DragElement = false
	DragX = false
	DragY = false
end




function addLabelOnClick(button, state, absoluteX, absoluteY, worldX, worldY, worldZ, clickedElement)
	if(state == "down") then
		for name,arr in pairs(PText) do
			for i,el in pairs(arr) do
				local color = el[6]
				local FH = dxGetFontHeight(el[7], el[8])
				local FW = dxGetTextWidth(el[1], el[7], el[8], true)
				if(MouseX-el[2] <= FW and MouseX-el[2] >= 0) then
					if(MouseY-el[3] <= FH and MouseY-el[3] >= 0) then
						triggerEvent(unpack(el[20]))
					end
				end
			end
		end
	end
	if(TradeWindows or InventoryWindows or TrunkWindows) then
		PText["INVHUD"] = {}
		local drop = true
		for name,arr in pairs(PBut) do
			for i,el in pairs(arr) do
				local x,y = el[1], el[2]
				local h,w = el[3], el[4]
				w = w+20*(scaley)
				if(absoluteX-x <= h and absoluteX-x >= 0) then
					if(absoluteY-y <= w and absoluteY-y >= 0) then
						drop=false
						if(button == "left") then
							if(state == "up") then
								if(DragElement) then
									if(name == "player") then
										if(DragElementName == "shop") then
											if(IsItemForSale(PInv[DragElementName][DragElementId][1])) then
												ToolTip("Этот тип товара предприятие покупает")
												StopDrag(name, i)
											else
												local text = PInv[DragElementName][DragElementId][1]
												local quality = PInv[DragElementName][DragElementId][3]
												local data = PInv[DragElementName][DragElementId][4]
												if(items[text][3] > 1) then
													CreateButtonInputInt("buyshopitem", Text("Введи количество"), toJSON({text, GetItemCost(PInv[DragElementName][DragElementId]), quality, data, TradeWindows}))
													StopDrag(name, i)
												else
													triggerServerEvent("buyshopitem", localPlayer, localPlayer, 1, toJSON({text, GetItemCost(PInv[DragElementName][DragElementId]), quality, data, TradeWindows}))
													StopDrag(name, i)
													break
												end
											end
										elseif(DragElementName == "trunk") then
											local tmp = table.copy(PInv[DragElementName][DragElementId])
											local tmp2 = table.copy(PInv[name][i])
											SetInventoryItem(name, i, tmp[1], tmp[2], tmp[3], toJSON(tmp[4]))
											SetInventoryItem(DragElementName, DragElementId, tmp2[1], tmp2[2], tmp2[3], toJSON(tmp2[4]))
											StopDrag(name, i) -- Оставить фокус на ячейке
											break
										elseif(DragElementName == "player") then
											if(PInv[DragElementName][DragElementId][1] == PInv[name][i][1]) then			
												if(DragElementId == i and DragElementName == name) then
													StopDrag(name, i)
													break
												end

												local TIText = PInv[DragElementName][DragElementId][1]
		
												if(items[TIText][9]) then -- Объединяемые предметы
													if(GetQuality(PInv[DragElementName][DragElementId][3]) == GetQuality(PInv[name][i][3])) then
														
														if(PInv[name][i][3]+100 < 1000) then
															PInv[name][i][3] = PInv[name][i][3]+100
															SetInventoryItem(DragElementName, DragElementId, nil,nil,nil,nil)
															ToolTip("Качество предмета повысилось")
															
															PData['ExpText'][#PData['ExpText']+1] = {"Улучшено", absoluteX, absoluteY}
															StopDrag(name, i)
															break
														else
															ToolTip("У этого предмета уже максимальное качество")
														end
														
													end
												end
												
												local DragQuality = PInv[DragElementName][DragElementId][3]
												local ButQuality = PInv[name][i][3]
												if(GetQuality(DragQuality) == GetQuality(ButQuality) and items[PInv[name][i][1]][3] ~= 1) then
													if(DragElementId ~= i) then
														if(items[PInv[name][i][1]][3] >= PInv[name][i][2]+PInv[DragElementName][DragElementId][2]) then
															SetInventoryItem(name, i, PInv[name][i][1],PInv[name][i][2]+PInv[DragElementName][DragElementId][2],ButQuality, toJSON(PInv[name][i][4]))
															SetInventoryItem(DragElementName, DragElementId, nil,nil,nil,nil)
														else
															local count = items[PInv[name][i][1]][3]-PInv[name][i][2]
															local dragcount = PInv[DragElementName][DragElementId][2]-count
															local butcount = PInv[name][i][2]+count
															SetInventoryItem(name, i, PInv[name][i][1],butcount,ButQuality,toJSON(PInv[name][i][4]))
															SetInventoryItem(DragElementName, DragElementId, PInv[name][i][1],dragcount,DragQuality,toJSON(PInv[name][i][4]))
														end
													end
												else
													ReplaceInventoryItem(DragElementName, DragElementId, name, i)
												end
											else
												local Data = false --Связанные предметы
												local TIText = PInv[DragElementName][DragElementId][1]
												if(TIText) then
													if(items[TIText][7]) then
														for razdelname,razdel in pairs(items[TIText][7]) do
															for _, IT in pairs(razdel) do
																if IT == PInv[name][i][1] then
																	Data = razdelname
																end
															end
														end
													end
												end
												if(Data == false) then
													ReplaceInventoryItem(DragElementName, DragElementId, name, i)
												else
													AddButtonData(name, i, DragElementName,DragElementId,Data)
												end
											end
											StopDrag(name, i)
											if(DragElementId <= 10 or i <= 10) then
												triggerServerEvent("useinvweapon", localPlayer, localPlayer)
											end
											break
										elseif(DragElementName == "backpack") then
											if(PInv[DragElementName][DragElementId][1] == PInv[name][i][1]) then			
												if(DragElementId == i and DragElementName == name) then
													StopDrag(name, i)
													break
												end

												local TIText = PInv[DragElementName][DragElementId][1]
		
												if(items[TIText][9]) then -- Объединяемые предметы
													if(GetQuality(PInv[DragElementName][DragElementId][3]) == GetQuality(PInv[name][i][3])) then
														
														if(PInv[name][i][3]+100 < 1000) then
															PInv[name][i][3] = PInv[name][i][3]+100
															SetInventoryItem(DragElementName, DragElementId, nil,nil,nil,nil)
															ToolTip("Качество предмета повысилось")
															
															PData['ExpText'][#PData['ExpText']+1] = {"Улучшено", absoluteX, absoluteY}
															StopDrag(name, i)
															break
														else
															ToolTip("У этого предмета уже максимальное качество")
														end
														
													end
												end
												
												local DragQuality = PInv[DragElementName][DragElementId][3]
												local ButQuality = PInv[name][i][3]
												if(GetQuality(DragQuality) == GetQuality(ButQuality)) then
													if(DragElementId ~= i) then
														if(items[PInv[name][i][1]][3] >= PInv[name][i][2]+PInv[DragElementName][DragElementId][2]) then
															SetInventoryItem(name, i, PInv[name][i][1],PInv[name][i][2]+PInv[DragElementName][DragElementId][2],ButQuality, toJSON(PInv[name][i][4]))
															SetInventoryItem(DragElementName, DragElementId, nil,nil,nil,nil)
														else
															local count = items[PInv[name][i][1]][3]-PInv[name][i][2]
															local dragcount = PInv[DragElementName][DragElementId][2]-count
															local butcount = PInv[name][i][2]+count
															SetInventoryItem(name, i, PInv[name][i][1],butcount,ButQuality,toJSON(PInv[name][i][4]))
															SetInventoryItem(DragElementName, DragElementId, PInv[name][i][1],dragcount,DragQuality,toJSON(PInv[name][i][4]))
														end
													end
												else
													if(PInv[name][i][4]) then
														if(PInv[name][i][4]["content"]) then
															StopDrag(name, i)
															break
														end
													end
													ReplaceInventoryItem(DragElementName, DragElementId, name, i)
												end
											else
												local Data = false --Связанные предметы
												local TIText = PInv[DragElementName][DragElementId][1]
												if(TIText) then
													if(items[TIText][7]) then
														for razdelname,razdel in pairs(items[TIText][7]) do
															for _, IT in pairs(razdel) do
																if IT == PInv[name][i][1] then
																	Data = razdelname
																end
															end
														end
													end
												end
												if(Data == false) then
													if(PInv[name][i][4]) then
														if(PInv[name][i][4]["content"]) then
															StopDrag(name, i)
															break
														end
													end
													ReplaceInventoryItem(DragElementName, DragElementId, name, i)
												else
													AddButtonData(name, i, DragElementName,DragElementId,Data)
												end
											end
											StopDrag(name, i)
											if(DragElementId <= 10 or i <= 10) then
												triggerServerEvent("useinvweapon", localPlayer, localPlayer)
											end
											break
										end
									elseif(name == "shop") then
										if(DragElementName ~= "shop") then
											if(IsItemForSale(PInv[DragElementName][DragElementId][1])) then
												local count = PInv[DragElementName][DragElementId][2]
												triggerServerEvent("SellShopItem", localPlayer, localPlayer, PInv[DragElementName][DragElementId][2], toJSON({PInv[DragElementName][DragElementId][1], GetItemCost(PInv[DragElementName][DragElementId]), PInv[DragElementName][DragElementId][3], PInv[DragElementName][DragElementId][4], TradeWindows}))
												SetInventoryItem(DragElementName, DragElementId, nil,nil,nil,nil)
												StopDrag()--Оставить фокус на ячейке
												break
											else
												ToolTip("Этот тип товара предприятие не принимает")
												StopDrag()--Оставить фокус на ячейке
												break
											end
										else
											StopDrag(name, i)
										end
									elseif(name == "trunk") then
										local tmp = table.copy(PInv[DragElementName][DragElementId])
										local tmp2 = table.copy(PInv[name][i])
										SetInventoryItem(name, i, tmp[1], tmp[2], tmp[3], toJSON(tmp[4]))
										SetInventoryItem(DragElementName, DragElementId, tmp2[1], tmp2[2], tmp2[3], toJSON(tmp2[4]))
										StopDrag(name, i) -- Оставить фокус на ячейке
										break
									elseif(name == "backpack") then
										if(PInv[DragElementName][DragElementId][4]) then
											if(not PInv[DragElementName][DragElementId][4]["content"]) then
												ReplaceInventoryItem(DragElementName, DragElementId, name, i)
											end
											StopDrag()
										else
											ReplaceInventoryItem(DragElementName, DragElementId, name, i)
											StopDrag(name, i)
										end
									end
								end
							else
								DragStart[1] = absoluteX-x
								DragStart[2] = absoluteY-y
								DragX = x
								DragY = y
								DragElement = el
								DragElementId = i
								DragElementName = name
							end
						elseif(button == "right") then
							if(state == "down") then
								if(name == "player") then
									if(DragElement) then --Ручной стак
										if(PInv[name][i][1] == PInv[DragElementName][DragElementId][1] or not PInv[name][i][1]) then
											local DragQuality = PInv[DragElementName][DragElementId][3]
											local ButQuality = PInv[name][i][3]
											if(PInv[DragElementName][DragElementId][2] > 1) then
												if(not PInv[name][i][1]) then -- В пустой слот
													if(DragElementId ~= i) then
														local ValCeil = math.ceil(PInv[DragElementName][DragElementId][2]/2)
														local dragcount = PInv[DragElementName][DragElementId][2]-ValCeil
														PInv[DragElementName][DragElementId][2] = dragcount
														SetInventoryItem(name, i, PInv[DragElementName][DragElementId][1], ValCeil, DragQuality, toJSON(PInv[DragElementName][DragElementId][4]))
													end
												else
													if(items[PInv[DragElementName][DragElementId][1]][3] > PInv[name][i][2]) then
														if(GetQuality(DragQuality) == GetQuality(ButQuality)) then
															PInv[DragElementName][DragElementId][2] = PInv[DragElementName][DragElementId][2]-1
															PInv[name][i][2] = PInv[name][i][2]+1
														end
													end
												end
											else
												if(items[PInv[name][i][1]][3] > PInv[name][i][2]) then
													if(GetQuality(DragQuality) == GetQuality(ButQuality)) then
														if(DragElementId ~= i) then
															PInv[name][i][2] = PInv[name][i][2]+1
															SetInventoryItem(DragElementName, DragElementId, nil,nil,nil,nil)
														end
														StopDrag(name, i)
													end
												end
											end
										end
									end
									break
								end
							else
								if(name == "player" or name == "backpack") then
									if(not DragElement) then 
										if(PInv[name][i][1]) then
											DragElementId = i
											DragElementName = name
											local FH = dxGetFontHeight(scale*0.6, "default-bold")
											PText["INVHUD"][#PText["INVHUD"]+1] = {Text("Использовать"), absoluteX, absoluteY, screenWidth, screenHeight, tocolor(255, 255, 255, 255), scale*0.6, "default-bold", "left", "top", false, false, true, true, false, 0, 0, 0, {["border"] = true, ["line"] = true}, {"UseInventoryItem", localPlayer, name, i}}	
											PText["INVHUD"][#PText["INVHUD"]+1] = {Text("Выбросить"), absoluteX, absoluteY-FH, screenWidth, screenHeight, tocolor(255, 255, 255, 255), scale*0.6, "default-bold", "left", "top", false, false, true, true, false, 0, 0, 0, {["border"] = true, ["line"] = true}, {"DropInvItem", localPlayer, name, i}}	

											local lx, ly, lz = getElementPosition(localPlayer)
											for id, player in pairs(getElementsByType("player", getRootElement(), true)) do
												if(player ~= localPlayer) then
													local x2, y2, z2 = getElementPosition(player)
													local distance = getDistanceBetweenPoints3D(lx,ly,lz,x2,y2,z2)
													if(distance < 3) then
														PText["INVHUD"][#PText["INVHUD"]+1] = {Text("Передать {name}", {{"{name}", getPlayerName(player)}}), absoluteX, absoluteY-(FH*#PText["INVHUD"]), screenWidth, screenHeight, tocolor(255, 255, 255, 255), scale*0.6, "default-bold", "left", "top", false, false, true, true, false, 0, 0, 0, {["border"] = true, ["line"] = true}, {"DropInvItem", localPlayer, name, i, getPlayerName(player)}}	
													end
												end
											end
											
											if(PInv[name][i][1] == "Pissh Gold" 
											or PInv[name][i][1] == "Pissh"
											or PInv[name][i][1] == "KBeer"
											or PInv[name][i][1] == "KBeer Dark"
											or PInv[name][i][1] == "isabella") then
												for id, player in pairs(getElementsByType("player", getRootElement(), true)) do
													local x2, y2, z2 = getElementPosition(player)
													local distance = getDistanceBetweenPoints3D(lx,ly,lz,x2,y2,z2)
													if(distance < 3) then
														PText["INVHUD"][#PText["INVHUD"]+1] = {Text("Посадить {name}", {{"{name}", getPlayerName(player)}}), absoluteX, absoluteY-(FH*#PText["INVHUD"]), screenWidth, screenHeight, tocolor(255, 255, 255, 255), scale*0.6, "default-bold", "left", "top", false, false, true, true, false, 0, 0, 0, {["border"] = true, ["line"] = true}, {"ServerCall", localPlayer, {"butilka", localPlayer, localPlayer, name, i, player}}}
													end
												end
											end
											
											local bannedNames = {["hp"] = true, ["date"] = true, ["cost"] = true, ["color"] = true, ["content"] = true, ["name"] = true, ["quality"] = true, ["mass"] = true}
											for razdelname, razdeldata in pairs(PInv[name][i][4]) do --Для bannedNames запустить еще цикл
												if(not bannedNames[razdelname]) then
													PText["INVHUD"][#PText["INVHUD"]+1] = {Text("Извлечь {item}", {{"{item}", razdelname}}), absoluteX, absoluteY-(FH*#PText["INVHUD"]), screenWidth, screenHeight, tocolor(255, 255, 255, 255), scale*0.6, "default-bold", "left", "top", false, false, true, true, false, 0, 0, 0, {["border"] = true, ["line"] = true}, {"RemoveButtonData", localPlayer, name, i, razdelname}}
												end
											end
										end
									end
								end
							end
						end		
					end
				end
			end
		end
		
		if(state == "up") then
			if(DragElement and drop) then 
				if(DragElementName ~= "shop") then
					DropInvItem(DragElementName, DragElementId)
				end
				StopDrag()
			end
		end
	end
	
	
	if(getPlayerName(localPlayer) == "alexaxel705") then
		worldX = math.round(worldX, 0)
		worldY = math.round(worldY, 0)
		worldZ = math.round(worldZ, 1)
		if(button == "left") then
			if(state == "down") then
				PData['changezone'][#PData['changezone']+1] = {[1] = {worldX, worldY, worldZ, getZoneName(worldX, worldY, worldZ, false)}}
			else
				local zone = getZoneName(worldX, worldY, worldZ, false)
				if(zone == PData['changezone'][#PData['changezone']][1][4]) then
					local oldx, oldy, oldz = PData['changezone'][#PData['changezone']][1][1], PData['changezone'][#PData['changezone']][1][2], PData['changezone'][#PData['changezone']][1][3]
		

					local out = {oldx, oldy, oldz, worldX, worldY, worldZ}
					if(out[1] > out[4]) then
						out = {out[4], out[2], math.round(getGroundPosition(out[4], out[2], out[3]+3), 1), out[1], out[5], math.round(getGroundPosition(out[1], out[5], out[6]+3), 1)}
					end
					
					if(out[2] > out[5]) then
						out = {out[1], out[5], math.round(getGroundPosition(out[1], out[5], out[3]+3), 1), out[4], out[2], math.round(getGroundPosition(out[4], out[2], out[6]+3), 1)}
					end
					
	
					PData['changezone'][#PData['changezone']][1] = {out[1], out[2], out[3], zone}
					PData['changezone'][#PData['changezone']][2] = {out[4], out[5], out[6]}
					

					--[[triggerServerEvent("saveserver", localPlayer, localPlayer, 
					out[1], out[2], out[3], 
					out[4], out[5], out[6], "PedPath"
					)--]]
				else
					PData['changezone'][#PData['changezone']] = nil
					ToolTip("Разные зоны!!!")
				end
			end
		end
	end
end
addEventHandler("onClientClick", getRootElement(), addLabelOnClick)






function DropInvItem(name, id, komu)
	if(backpackid) then
		if(backpackid == id) then
			if(name == "player") then
				return false
			end
		end
	end
	if(name == "backpack") then
		triggerServerEvent("dropinvitem", localPlayer, localPlayer, name, id, backpackid, komu)
	elseif(name == "trunk") then
		return false -- Доделать потом
	else
		triggerServerEvent("dropinvitem", localPlayer, localPlayer, name, id, false, komu)	
	end
	SetInventoryItem(name, id, nil, nil, nil, nil)
end
addEvent("DropInvItem", true)
addEventHandler("DropInvItem", localPlayer, DropInvItem)




function AddButtonData(name, i1, dragname, i2, razdel)
	local oldData = PInv[name][i1][4][razdel]
	local d1,d2,d3,d4 = PInv[dragname][i2][1], PInv[dragname][i2][2], PInv[dragname][i2][3], PInv[dragname][i2][4]
	if(oldData) then
		local o1, o2, o3, o4 = oldData[1], oldData[2], oldData[3], oldData[4]
		PInv[name][i1][4][razdel] = {d1,d2,d3,toJSON(d4)}
		SetInventoryItem(name, i2, o1,o2,o3,o4)
	else
		PInv[name][i1][4][razdel] = {d1,d2,d3,toJSON(d4)}
		SetInventoryItem(dragname, i2, nil,nil,nil,nil)
	end
end
addEvent("AddButtonData", true)
addEventHandler("AddButtonData", localPlayer, AddButtonData)


function RemoveButtonDataNew(name, i, key, count)
	PInv[name][i][4][key][2] = PInv[name][i][4][key][2]+count
	if(PInv[name][i][4][key][2] == 0) then
		PInv[name][i][4][key] = nil
	end	
	
	SetInventoryItem(name, i, PInv[name][i][1],PInv[name][i][2],PInv[name][i][3],toJSON(PInv[name][i][4]))
end
addEvent("RemoveButtonDataNew", true)
addEventHandler("RemoveButtonDataNew", localPlayer, RemoveButtonDataNew)



function RemoveButtonData(name, i1, key)
	local newslot = false
	for i2 = 1, #PInv[name] do
		if(not PInv[name][i2][1]) then
			newslot=i2
			break
		end
	end
	if(newslot) then
		local item = PInv[name][i1][4][key]
		PInv[name][i1][4][key] = nil
		SetInventoryItem(name, newslot, item[1],item[2],item[3],item[4])
	end
end
addEvent("RemoveButtonData", true)
addEventHandler("RemoveButtonData", localPlayer, RemoveButtonData)


function ReplaceInventoryItem(name1, item1, name2, item2)
	if(backpackid) then
		if(name1 == "player") then
			if(item1 == backpackid) then
				return false
			end
		end
		
		if(name2 == "player") then
			if(item2 == backpackid) then
				return false
			end
		end
	end
	local inv = PInv[name1][item1][1]
	local count = PInv[name1][item1][2]
	local quality = PInv[name1][item1][3]
	local data = PInv[name1][item1][4]
	
	local inv2 = PInv[name2][item2][1]
	local count2 = PInv[name2][item2][2]
	local quality2 = PInv[name2][item2][3]
	local data2 = PInv[name2][item2][4]
	SetInventoryItem(name1, item1, inv2, count2, quality2, toJSON(data2))
	SetInventoryItem(name2, item2, inv, count, quality, toJSON(data))
end



function SetInventoryItem(name, i, item, count, quality, data)
	if(not isPedDead(localPlayer)) then
		if(data) then data = fromJSON(data) end
		if(name == "backpack") then
			PInv["player"][backpackid][4]["content"][i][1] = item
			PInv["player"][backpackid][4]["content"][i][2] = count
			PInv["player"][backpackid][4]["content"][i][3] = quality
			PInv["player"][backpackid][4]["content"][i][4] = data
		else
			PInv[name][i][1] = item
			PInv[name][i][2] = count
			PInv[name][i][3] = quality
			PInv[name][i][4] = data
		end
		
		
		if(name == "trunk") then
			triggerServerEvent("SaveTrunk", localPlayer, TrunkWindows, toJSON(PInv["trunk"]))
		end
		triggerServerEvent("SaveInventory", localPlayer, localPlayer, toJSON(PInv["player"]))

		UpdateInventoryMass()
		triggerServerEvent("useinvweapon", localPlayer, localPlayer)
	end
end





function onMyMouseDoubleClick(button, absoluteX, absoluteY, worldX, worldY,  worldZ, clickedWorld)
	if button == "left" and DragElement then 
		for name,arr in pairs(PBut) do
			for i,el in pairs(arr) do
				local x,y = el[1], el[2]
				local h,w = el[3], el[4]
				w = w+20*(scaley)
				if(absoluteX-x <= h and absoluteX-x >= 0) then
					if(absoluteY-y <= w and absoluteY-y >= 0) then
						if(name == "player" or name == "backpack") then
							if(items[PInv[name][i][1]][4]) then
								UseInventoryItem(name, i)
							end
						elseif(name == "shop") then
							if(IsItemForSale(PInv[name][i][1])) then
								ToolTip("Этот тип товара предприятие покупает")
							else
								local text = PInv[name][i][1]
								local quality = PInv[name][i][3]
								local data = PInv[name][i][4]
								if(items[text][3] > 1) then
									CreateButtonInputInt("buyshopitem", Text("Введи количество"), toJSON({text, GetItemCost(PInv[name][i]), quality, data, TradeWindows}))
								else
									triggerServerEvent("buyshopitem", localPlayer, localPlayer, 1, toJSON({text, GetItemCost(PInv[name][i]), quality, data, TradeWindows}))
								end
							end
						end
					end
				end
			end
		end
	end
end
addEventHandler("onClientDoubleClick", root, onMyMouseDoubleClick)



function MoveMouse(x, y, absoluteX, absoluteY)
	if(DragElement) then
		DragX = absoluteX-DragStart[1]
		DragY = absoluteY-DragStart[2]
	end
	MouseX = absoluteX
	MouseY = absoluteY
	local hx,hy,hz = getWorldFromScreenPosition(screenWidth/2, screenHeight/2, 10)
	setPedLookAt(localPlayer, hx,hy,hz)
end
addEventHandler("onClientCursorMove", getRootElement(), MoveMouse)



function useinvslot(val)
	usableslot=val
end
addEvent("useinvslot", true)
addEventHandler("useinvslot", localPlayer, useinvslot)





function GetQualityInfo(it)
	local name = it[1]
	local quality = it[3]
	if(it[4]) then
		if(it[4]["quality"]) then quality = it[4]["quality"] end
	end
	if(not quality) then quality = 0 end
	if(name) then
		local text=""
		text=text..Text("Цена")..": $"..GetItemCost(it).."\n"
		text=text..Text("Масса")..": "..GetItemMass(it).."\n"
		if(items[name][4] == "useinvweapon") then	
			if(getWeaponProperty(WeaponNamesArr[name], "poor", "damage")) then
				text=text..Text("Урон")..": "..
				math.round(getOriginalWeaponProperty(WeaponNamesArr[name], "poor", "damage")*(quality/500), 0)-(2).." - "..
				math.round(getOriginalWeaponProperty(WeaponNamesArr[name], "poor", "damage")*(quality/500), 0)+(2)..
				"\n"
			end
			if(getWeaponProperty(WeaponNamesArr[name], "poor", "weapon_range")) then
				text=text..Text("Расстояние")..": "..getWeaponProperty(WeaponNamesArr[name], "poor", "weapon_range").."\n"
			end
			if(getWeaponProperty(WeaponNamesArr[name], "poor", "maximum_clip_ammo")) then
				text=text..Text("Магазин")..": "..getWeaponProperty(WeaponNamesArr[name], "poor", "maximum_clip_ammo").."\n"
			end
			if(WeaponAmmo[WeaponNamesArr[name]]) then
				text=text..Text("Калибр")..": "..WeaponAmmo[WeaponNamesArr[name]].."\n"
			end
		elseif(items[name][4] == "usedrugs") then	
			text=text..Text("Здоровье")..": "..math.floor((10+(quality/10))).."\n"
		elseif(items[name][4] == "usesmoke") then	
			text=text..Text("Здоровье")..": 5\n"
		end
		text = text..Text("Качество")..": "..GetQuality(quality)
		if(items[name][8]) then text = text.."\n#FFFFFF"..Text("Выпадает после смерти") end
		return text
	end
end

function GetItemMass(item)
	local gr = false
	if(item[4]["mass"]) then gr = item[4]["mass"] end
	if(not gr) then gr = items[item[1]][5] end
	
	if(gr >= 1000) then
		return (gr/1000)..Text("кг")
	else
		return gr..Text("г")
	end
end

function GetItemCost(it)
	if(it[4]) then
		if(it[4]["cost"]) then return it[4]["cost"] end
	end
	cost = items[it[1]][6]
	
	local Economics = fromJSON(getElementData(root, "Economics"))
	
	if(Economics[it[1]]) then cost = cost*Economics[it[1]] end
	
	
	if(it[2] == "Sell") then
		cost = cost*0.75 -- Цена покупки меньше на четверть
	end
	
	
	if(cost <= 0) then cost = 1 end
	
	return math.round(cost*(it[3]/450), 0)
end


function GetQuality(quality)
	local out = ""
	if(not quality or quality <= 99) then
		out = "отвратительное"
	elseif(quality <= 199 and quality > 99) then
		out = "мерзкое"
	elseif(quality <= 299 and quality > 199) then
		out = "гадкое"
	elseif(quality <= 399 and quality > 299) then
		out = "плохое"
	elseif(quality <= 499 and quality > 399) then
		out = "обычное"
	elseif(quality <= 599 and quality > 499) then
		out = "хорошее"
	elseif(quality <= 699 and quality > 599) then
		out = "очень хорошее"
	elseif(quality <= 799 and quality > 699) then
		out = "отличное"
	elseif(quality <= 899 and quality > 799) then
		out = "высокое"
	elseif(quality <= 999 and quality > 899) then
		out =  "великолепное"
	elseif(quality >= 1000) then
		out = "превосходное"
	end
	return GetQualityColor(quality)..Text(out)
end


function GetQualityColor(quality)
	if(not quality or quality <= 99) then
		return "#CC0000"
	elseif(quality <= 199 and quality > 99) then
		return "#CC3300"
	elseif(quality <= 299 and quality > 199) then
		return "#CC6600"
	elseif(quality <= 399 and quality > 299) then
		return "#CC9900"
	elseif(quality <= 499 and quality > 399) then
		return "#CCCC00"
	elseif(quality <= 599 and quality > 499) then
		return "#CCFF00"
	elseif(quality <= 699 and quality > 599) then
		return "#99CC00"
	elseif(quality <= 799 and quality > 699) then
		return "#99FF00"
	elseif(quality <= 899 and quality > 799) then
		return "#9966FF"
	elseif(quality <= 999 and quality > 899) then
		return "#9933FF"
	elseif(quality >= 1000) then
		return "#9900FF"
	end
end


function vibori(arr)
	if(arr) then
		local text = ""
		local i = 1
		for v,k in pairs(fromJSON(arr)) do
			text=text..i..": "..v.." ("..k..")\n"
			BindedKeys[tostring(i)] = {"ServerCall", localPlayer, {"golos", localPlayer, localPlayer, v}}
			i=i+1
		end
		PText["INVHUD"]["golos"] = {text, 0, 430*scaley, screenWidth-(10*scalex), 0, tocolor(255, 255, 255, 255), scale, "clear", "right", "top", false, false, false, true, false, 0, 0, 0, {}}
	else
		PText["INVHUD"]["golos"] = nil
		BindedKeys = {}
	end
end
addEvent("vibori", true)
addEventHandler("vibori", localPlayer, vibori)



function InformTitle(text, types)
	if(types) then
		if(types == "wardrobe") then
			AddITimerText = "В #4682B4гардероб#FFFFFF добавлен костюм "..COLOR["KEY"]["HEX"]..ArraySkinInfo[tonumber(text)][2]
		end
	else
		AddITimerText = text
	end
	if(isTimer(AddITimer)) then
		killTimer(AddITimer)
	end
	AddITimer = setTimer(function() AddITimerText = "" end, 3500, 1)
	PlaySFXSound(15)
end
addEvent("InformTitle", true)
addEventHandler("InformTitle", localPlayer, InformTitle)



function AddInventoryItem(itemname, count, quality, data)
	if(not data) then data = toJSON({}) end
	local stacked = false
	if count > 0 then 
		stacked = math.round(count/items[itemname][3], 0)
		if(itemname ~= "Деньги") then
			InformTitle(Text("В #4682B4инвентарь#FFFFFF добавлен предмет {item}, нажми {key} чтобы посмотреть", {{"{item}", COLOR["KEY"]["HEX"]..itemname.."#FFFFFF"}, {"{key}", "#C00000i#FFFFFF"}}))
		end
	else
		stacked = math.ceil(count/items[itemname][3])
	end
	
	
	for slot = 1, 10 do
		if(stacked >= 1) then
			for v = 1, stacked do
				AddInventoryItemNewStack(itemname, items[itemname][3], quality, data)
				count = count - items[itemname][3]
			end
		elseif(stacked <= -1) then
			for v = stacked-stacked-stacked, 1 do
				local NumberStack = FoundFullStackedInventoryItem(itemname, quality)
				if(NumberStack) then
					RemoveInventorySlot("player", NumberStack)
					count = count + items[itemname][3]
				end
			end
		end
		if(count == 0) then
			break
		elseif(count > 0) then
			local NumberStack = FoundStackedInventoryItem(itemname, quality)
			if(NumberStack) then
				if(PInv["player"][NumberStack][2]+count <= items[itemname][3]) then
					SetInventoryItem("player", NumberStack, PInv["player"][NumberStack][1], PInv["player"][NumberStack][2]+count, PInv["player"][NumberStack][3], data)
					count = 0
					break
				else
					count = count - (items[itemname][3]-PInv["player"][NumberStack][2])
					SetInventoryItem("player", NumberStack, PInv["player"][NumberStack][1], items[itemname][3], PInv["player"][NumberStack][3], data)
				end
			end
	
			if(count > 0) then
				AddInventoryItemNewStack(itemname, count, quality, data) --Докладываем остаток
			end
			break
		elseif(count < 0) then
			local NumberStack = FoundStackedInventoryItem(itemname, quality)
			if(not NumberStack) then NumberStack = FoundFullStackedInventoryItem(itemname, quality) end
			if(NumberStack) then
				if(PInv["player"][NumberStack][2]+count <= 0) then
					count = count + PInv["player"][NumberStack][2]
					RemoveInventorySlot("player", NumberStack)
				else
					SetInventoryItem("player", NumberStack, PInv["player"][NumberStack][1], PInv["player"][NumberStack][2]+count, PInv["player"][NumberStack][3], data)
					break
				end
			end
		end
	end
end
addEvent("AddInventoryItem", true)
addEventHandler("AddInventoryItem", localPlayer, AddInventoryItem)




function AddInventoryItemNewStack(itemname, count, quality, data)
	for i = 1, 10 do
		if(not PInv["player"][i][1]) then
			SetInventoryItem("player", i, itemname, count, quality, data)
			return true
		end
	end
	ToolTip(Text("Закончилось место в инвентаре"))
end



function UseInventoryItem(name, i)
	local text = PInv[name][i][1] or "Кулак"
	
	if(PData["fishpos"]) then
		triggerServerEvent("StopFish", localPlayer, localPlayer)
	end
	
	if(name == "backpack") then return ToolTip(Text("Чтобы использовать этот предмет возьми его в руки")) end
	
	triggerServerEvent("useinvweapon", localPlayer, localPlayer, i)
	if(items[text][4] == "useinvweapon") then
		return true
	elseif(items[text][4] == "CreateCanabis") then
		local x, y, z = getElementPosition(localPlayer)
		local gz = getGroundPosition(x, y, z)
		if(ValidateMaterialForThree(x,y,z, gz)) then
			triggerServerEvent("CreateThreePlayer", localPlayer, localPlayer, i, x,y,gz)
		else
			outputChatBox("Здесь нельзя садить #558833коноплю",255,255,255,true)
		end
	elseif(items[text][4] == "CreateCoka") then
		local x, y, z = getElementPosition(localPlayer)
		local gz = getGroundPosition(x, y, z)
		if(ValidateMaterialForThree(x,y,z, gz)) then
			triggerServerEvent("CreateThreePlayer", localPlayer, localPlayer, i, x,y,gz)
		else
			outputChatBox("Здесь нельзя садить коку",255,255,255,true)
		end
	elseif(items[text][4] == "SetupBackpack") then
		SetupBackpack(i)
	elseif(items[text][4] == "usecellphone") then
		triggerServerEvent(items[text][4], localPlayer, localPlayer)
	elseif(items[text][4] == "usenewspaper") then
		ReadNewsPaper(PInv[name][i][4]["date"][2], PInv[name][i][4]["date"][1])
	elseif(items[text][4] == "usesmoke" 
		or items[text][4] == "usekanistra" 
		or items[text][4] == "usezapaska" 
		or items[text][4] == "usedrink") then
		triggerServerEvent(items[text][4], localPlayer, localPlayer, i)
	else
		if(text == "Косяк") then
			DrugsPlayerEffect()
		elseif(text == "Спанк") then
			SpunkPlayerEffect()
		else
			if(not items[text][4]) then
				return true
			end
		end
		
		local count = PInv[name][i][2]-1
		if(count == 0) then
			SetInventoryItem(name, i, nil,nil,nil,nil)
		else
			SetInventoryItem(name, i, PInv[name][i][1],count,PInv[name][i][3],toJSON(PInv[name][i][4]))
		end
		
		triggerServerEvent(items[text][4], localPlayer, localPlayer)
	end
end
addEvent("UseInventoryItem", true)
addEventHandler("UseInventoryItem", localPlayer, UseInventoryItem)


local BannedReasons = {
	[19] = "Rocket",
	[37] = "Burnt",
	[50] = "Ranover/Helicopter Blades",
	[51] = "Explosion",
	[53] = "Drowned",
	[54] = "Fall",
	[55] = "Unknown",
	[56] = "Melee",
	[57] = "Weapon",
	[59] = "Tank Grenade",
	[63] = "Blown"
}

function PedDamage(attacker, weapon, bodypart, loss)
	if(BannedReasons[weapon]) then 
		cancelEvent()
	end
	if(attacker) then
		if(getElementType(attacker) == "vehicle") then
			if(getElementModel(attacker) == 532) then
				bodypart = 9
				weapon = 160
			end
			attacker = getVehicleOccupant(attacker)
		end
		
		if(attacker == localPlayer) then
			triggerServerEvent("PedDamage", attacker, source, weapon, bodypart, loss)
			for _, thePed in pairs(getElementsByType("ped", getRootElement(), true)) do
				if(source ~= thePed) then
					local team = getElementData(thePed, "team")
					if(team) then
						if(getTeamName(getTeamFromName(team)) ~= "Мирные жители") then
							triggerServerEvent("PedDamage", attacker, thePed, weapon, 0, 0)
						end
					end
				end
			end
		elseif(getElementType(attacker) == "ped") then
			if(isElementSyncer(source)) then
				triggerServerEvent("PedDamage", attacker, source, weapon, bodypart, loss)
			end
		end
	end
end
addEventHandler("onClientPedDamage", getRootElement(), PedDamage)


function RemoveInventoryItemNew(name, i)
	local count = PInv[name][i][2]-1
	if(count == 0) then
		SetInventoryItem(name, i, nil,nil,nil,nil)
	else
		SetInventoryItem(name, i, PInv[name][i][1],count,PInv[name][i][3],toJSON(PInv[name][i][4]))
	end
	triggerServerEvent("useinvweapon", localPlayer, localPlayer)
end
addEvent("RemoveInventoryItemNew", true)
addEventHandler("RemoveInventoryItemNew", localPlayer, RemoveInventoryItemNew)



function RemoveInventoryItem(itemname)
	for i = 1, #PInv["player"] do
		if(itemname == PInv["player"][i][1]) then
			local count = PInv["player"][i][2]-1
			
			if(count == 0) then
				SetInventoryItem("player", i, nil, nil, nil, nil)
			else
				SetInventoryItem("player", i, PInv["player"][i][1], count, PInv["player"][i][3], toJSON(PInv["player"][i][4]))
			end
			break
		end
	end
end
addEvent("RemoveInventoryItem", true)
addEventHandler("RemoveInventoryItem", localPlayer, RemoveInventoryItem)



function RemoveInventoryItemID(i,dataid)
	if(dataid) then
		local count = PInv["player"][i][4][dataid][2]-1
		
		if(count == 0) then
			PInv["player"][i][4][dataid] = nil
			SetInventoryItem("player", i, PInv["player"][i][1], PInv["player"][i][2], PInv["player"][i][3], toJSON(PInv["player"][i][4]))
		else
			PInv["player"][i][4][dataid][2] = count
			SetInventoryItem("player", i, PInv["player"][i][1], PInv["player"][i][2], PInv["player"][i][3], toJSON(PInv["player"][i][4]))
		end
	else
		local count = PInv["player"][i][2]-1
		
		if(count == 0) then
			SetInventoryItem("player", i, nil, nil, nil, nil)
		else
			SetInventoryItem("player", i, PInv["player"][i][1], count, PInv["player"][i][3], toJSON(PInv["player"][i][4]))
		end
		triggerServerEvent("useinvweapon", localPlayer, localPlayer)
	end
end
addEvent("RemoveInventoryItemID", true)
addEventHandler("RemoveInventoryItemID", localPlayer, RemoveInventoryItemID)


function getGroundPositionFish()
	if(not getPedOccupiedVehicle(localPlayer)) then
		if(not isCursorShowing()) then
			local x,y,z = getPositionInFront(localPlayer,10)
			local lvl = getWaterLevel(x,y,z)
			if(lvl) then
				local result = lvl-getGroundPosition(x, y, z)
				if(result > 0) then
					local z = getGroundPosition(x, y, z)
					triggerServerEvent("startfish", localPlayer, localPlayer, x,y,z)
					return
				end
			end
			local r,g,b,a = getWaterColor()
			ToolTip("Подойди к "..RGBToHex(r,g,b).."воде")
		end
	end
end
addEvent("getGroundPositionFish", true)
addEventHandler("getGroundPositionFish", localPlayer, getGroundPositionFish)


function FishStarted(lx,ly,lz)
	if(lx) then
		PData["fishpos"] = {["x"] = lx, ["y"] = ly, ["z"] = lz}
	else
		PData["fishpos"] = false
	end
end
addEvent("FishStarted", true)
addEventHandler("FishStarted", localPlayer, FishStarted)




function RemoveInventorySlot(name, i)
	SetInventoryItem(name, i, nil, nil, nil, nil)
	triggerServerEvent("useinvweapon", localPlayer, localPlayer)
end
addEvent("RemoveInventorySlot", true)
addEventHandler("RemoveInventorySlot", localPlayer, RemoveInventorySlot)


function FoundStackedInventoryItem(itemname, quality)
	local id = false
	for i = 1, #PInv["player"] do
		if(PInv["player"][i][1] == itemname) then
			if(items[itemname][3] > PInv["player"][i][2]) then
				if(GetQuality(quality) == GetQuality(PInv["player"][i][3])) then
					id=i
					break
				end
			end
		end
	end
	if(id) then return id
	else return false end
end

 
function FoundFullStackedInventoryItem(itemname, quality)
	local id = false
	for i = 1, #PInv["player"] do
		if(PInv["player"][i][1] == itemname) then
			if(items[itemname][3] == PInv["player"][i][2]) then
				if(GetQuality(quality) == GetQuality(PInv["player"][i][3])) then
					id=i
					break
				end
			end
		end
	end
	if(id) then return id
	else return false end
end
 
 

 
function FoundInventoryItem(itemname)
	local id = false
	for i, k in pairs(PInv["player"]) do
		if(k[1] == itemname) then
			id = i
			break
		end
	end
	return id
end




--[[
	scale3D - Необходимо для того чтобы уменьшать текст в 3D пространстве, без перерисовки
--]]
function MemText(text, left, top, color, scale, font, border, incline, centerX, centerY, scale3D)
	if(text) then
		local w,h = dxGetTextWidth(text, scale, font, true)+(border*2), dxGetFontHeight(scale, font)+(border*2)
		local index = text..color
		
		if(not VideoMemory["HUD"][index]) then
			VideoMemory["HUD"][index] = dxCreateRenderTarget(w+((w*incline)/4),h, true)
			dxSetRenderTarget(VideoMemory["HUD"][index], true)
			dxSetBlendMode("modulate_add")
			
			local posx, posy = ((w*incline)/4),0
			if(border) then
				posx = posx+border
				posy = posy+border
			end
			
			
			local textb = string.gsub(text, "#%x%x%x%x%x%x", "")
			for oX = -border, border do 
				for oY = -border, border do 
					dxDrawText(textb, posx+oX, posy+oY, 0+oX, 0+oY, tocolor(0, 0, 0, 255), scale, font, "left", "top", false, false,false,false,true)
				end
			end

			dxDrawText(text, posx, posy, 0, 0, color, scale, font, "left", "top", false,false,false,true,true)

			dxSetBlendMode("blend")
			dxSetRenderTarget()
			
			if(incline > 0) then 
				local pixels = dxGetTexturePixels(VideoMemory["HUD"][index])
				local x, y = dxGetPixelsSize(pixels)
				local texture = dxCreateTexture(x,y, "argb")
				local pixels2 = dxGetTexturePixels(texture)
				local pady = 0
				for y2 = 0, y-1 do
					for x2 = 0, x-1 do
						local colors = {dxGetPixelColor(pixels, x2,y2)}
						if(colors[4] > 0) then
							dxSetPixelColor(pixels2, x2-pady, y2, colors[1],colors[2],colors[3],colors[4])
						end
					end
					pady = pady+incline
				end
				
				dxSetTexturePixels(texture, pixels2)
				VideoMemory["HUD"][index] = texture
			end
		end
		
		if(scale3D) then 
			w = w/scale3D 
			h = h/scale3D
		end
		if(centerX) then 
			if(centerX == "right") then 
				left = left-(w) 
			else
				left = left-(w/2) 
			end
		end
		
		if(centerY) then 
			if(centerY == "bottom") then 
				top = top-(h) 
			else
				top = top-(h/2)
			end
		end
		
		return dxDrawImage(left,top, w,h, VideoMemory["HUD"][index], 0, 0, 0, color) 
	end
end






function normalspeed(h,m,weather)
	if(isTimer(DrugsTimer)) then
		killTimer(DrugsTimer)
	end
	if(isTimer(SpunkTimer)) then
		killTimer(SpunkTimer)
	end

	for slot = 1, #DrugsEffect do
		destroyElement(DrugsEffect[slot])
	end
	RespawnTimer=nil
	setWeather(weather)
	setWindVelocity(0,0,0)
	setGameSpeed(1.2)
	setTime(h, m)
end
addEvent("normalspeed", true )
addEventHandler("normalspeed", localPlayer, normalspeed)


function onWasted(killer, weapon, bodypart)
	if(source == localPlayer) then 
		if(getPedOccupiedVehicle(localPlayer)) then
			ClientVehicleExit(localPlayer, getPedOccupiedVehicleSeat(localPlayer))
		end
		
		
		if(InventoryWindows) then
			SetupBackpack()
		end
	
	
		if(PData["fishpos"]) then
			triggerServerEvent("StopFish", localPlayer, localPlayer)
		end
		
		setGameSpeed(0.7)
		
		RemoveInventory()
		PData["wasted"] = Text("ПОТРАЧЕНО")
		if(killer) then
			if(getElementType(killer) == "ped") then
				if(getElementData(killer, "attacker") == getPlayerName(localPlayer)) then
					setPedControlState(killer, "fire", false)
				end
				local KTeam = getElementData(killer, "team")				
				if(KTeam == "Полиция" or KTeam == "ФБР" or KTeam == "Военные") then
					PData["wasted"] = Text("СЛОМАНО")
				end
			elseif(getElementType(killer) == "player") then
				local KTeam = getTeamName(getPlayerTeam(killer))			
				if(KTeam == "Полиция" or KTeam == "ФБР" or KTeam == "Военные") then
					PData["wasted"] = Text("СЛОМАНО")
				end
			end
		end
	end
end
addEvent("onClientWastedLocalPlayer", true)
addEventHandler("onClientWastedLocalPlayer", getRootElement(), onWasted)
addEventHandler("onClientPlayerWasted", getRootElement(), onWasted)




function PlayerNewZone(zone, city, updateweather, interior)
	if(getElementDimension(localPlayer) == 0) then SetZoneDisplay(zone) end
	triggerServerEvent("ZoneInfo", localPlayer, localPlayer, zone)
	
	CheckZoneCollect(zone)
end
addEventHandler("PlayerNewZone", root, PlayerNewZone)


--[[
	if(PlayerZone == "Restricted Area") then
		for key,thePlayer in pairs(getElementsByType "player") do
			local team = getPlayerTeam(thePlayer)
			if(team) then
				local r,g,b = getTeamColor(team)
				local px,py,pz = getElementPosition(thePlayer)
				
				local xp = (px/3000)*1
				local yp = (py/3000)*1
				local zp = (pz/3000)*1
				
				local mx2,my2,mz2 = 220-(1.7*yp), 1822.8+(1.7*xp), 6.5+(zp)
				dxDrawLine3D(220, 1822.8, 12.5,mx2,my2,mz2, tocolor(r,g,b,180))
			end
		end
	end
--]]



function PlayerVehicleEnter(theVehicle, seat)
	if(source == localPlayer) then 
		Targets["theVehicle"] = nil
		if(seat == 0) then
			PData["Driver"] = {
				["Handling"] = getVehicleHandling(theVehicle),
				["Distance"] = 0
			}
			PData["Driver"]["drx"], PData["Driver"]["dry"], PData["Driver"]["drz"] = getElementPosition(theVehicle)
			local name = getVehicleName(theVehicle)
			if(getElementData(theVehicle, "name")) then
				name = getElementData(theVehicle, "name")
			end
			if(getElementData(theVehicle, "year")) then
				name = name.." "..getElementData(theVehicle, "year")
			end
			SetZoneDisplay("#9b7c52"..name)
		end
	end
end
addEventHandler("onClientPlayerVehicleEnter",getRootElement(),PlayerVehicleEnter)

function PlayerVehicleExit(theVehicle, seat)
	if(source == localPlayer) then 
		ChangeInfo() 
		if(seat == 0) then
			PData["Driver"] = nil
		end
	end
end
addEventHandler("onClientPlayerVehicleExit", getRootElement(), PlayerVehicleExit)



function ChangeInfo(text, ctime)
	if(isTimer(PData["ChangeInfoTimer"])) then
		killTimer(PData["ChangeInfoTimer"])
	end
	
	if(text) then
		PText["HUD"][3] = {text, 10, screenHeight/2, screenWidth, screenHeight, tocolor(255, 255, 255, 255), scale, "default-bold", "left", "top", false, false, false, true, true, 0, 0, 0, {["border"] = true}}
	end
	
	if(ctime) then
		PData["ChangeInfoTimer"] = setTimer(function()
			PText["HUD"][3] = nil
		end, ctime, 1)
	end
end
addEvent("ChangeInfo", true)
addEventHandler("ChangeInfo", localPlayer, ChangeInfo)



function ChangeInfoAdv(text, ctime)
	if(isTimer(PData["ChangeInfoAdvTimer"])) then
		killTimer(PData["ChangeInfoAdvTimer"])
	end
	
	PText["HUD"][4] = {text, 10, screenHeight/1.7, screenWidth, screenHeight, tocolor(255, 255, 255, 255), scale, "default-bold", "left", "top", false, false, false, true, true, 0, 0, 0, {["border"] = true}}
	

	if(ctime) then
		PData["ChangeInfoAdvTimer"] = setTimer(function()
			PText["HUD"][4] = nil
		end, ctime, 1)
	end
end
addEvent("ChangeInfoAdv", true)
addEventHandler("ChangeInfoAdv", localPlayer, ChangeInfoAdv)





function NextRaceMarker()
	table.remove(PData["Race"]["Track"], 1)
	if(PData["Race"]["Marker"]) then destroyElement(PData["Race"]["Marker"]) end
	if(PData["Race"]["Blip"]) then destroyElement(PData["Race"]["Blip"]) end
		
	if(#PData["Race"]["Track"] >= 1) then
		PData["Race"]["Marker"] = createMarker(PData["Race"]["Track"][1][1], PData["Race"]["Track"][1][2], PData["Race"]["Track"][1][3], "checkpoint", 20, 255, 0, 0, 170)
		setElementData(PData["Race"]["Marker"], "type", "Race")
		PData["Race"]["Blip"] = createBlipAttachedTo(PData["Race"]["Marker"],0,2,255,0,0, 255,0, 99999)
		if(PData["Race"]["Track"][2]) then
			setMarkerTarget(PData["Race"]["Marker"], PData["Race"]["Track"][2][1], PData["Race"]["Track"][2][2], PData["Race"]["Track"][2][3])
		end
	else	
		triggerServerEvent("RaceFinish", localPlayer, localPlayer, getTickCount()-PData["Race"]["Start"])
	end
end



function GetRacePosition()
	local pos = #PData["Race"]["Racers"]
	local x,y,z = getElementPosition(localPlayer)
	local mydist = getDistanceBetweenPoints2D(x,y, PData["Race"]["Track"][#PData["Race"]["Track"]][1], PData["Race"]["Track"][#PData["Race"]["Track"]][2])
	for _, name in pairs(PData["Race"]["Racers"]) do
		local thePlayer = getPlayerFromName(name)
		if(thePlayer) then
			if(thePlayer ~= localPlayer) then
				x,y,z = getElementPosition(thePlayer)
				if(mydist < getDistanceBetweenPoints2D(x,y, PData["Race"]["Track"][#PData["Race"]["Track"]][1], PData["Race"]["Track"][#PData["Race"]["Track"]][2])) then
					pos = pos-1
				end
			end
		else
			pos = pos-1
		end
	end
	return pos
end


function StartRace(arr, players)
	PData["Race"] = {
		["Start"] = getTickCount(), 
		["Track"] = arr,
		["Racers"] = players
	}
	NextRaceMarker()
end
addEvent("StartRace", true)
addEventHandler("StartRace", localPlayer, StartRace)






function EndRace(oldbest)
	if(PData["Race"]) then
		local seconds = (getTickCount()-PData["Race"]["Start"])/1000
		local hours = math.floor(seconds/3600)
		local mins = math.floor(seconds/60 - (hours*60))
		local secs = math.floor(seconds - hours*3600 - mins *60)
		local msec = math.floor(((getTickCount()-PData["Race"]["Start"])-(secs*1000)-(mins*60000)-(hours*3600000))/10)

		
		oldbest = tonumber(oldbest)
		local seconds2 = (oldbest)/1000
		local hours2 = math.floor(seconds2/3600)
		local mins2 = math.floor(seconds2/60 - (hours2*60))
		local secs2 = math.floor(seconds2 - hours2*3600 - mins2 *60)
		local msec2 = math.floor(((oldbest)-(secs2*1000)-(mins2*60000)-(hours2*3600000))/10)
		
		ToolTip("Твоё время "..string.format("%02.f", mins)..":"..string.format("%02.f", secs)..":"..string.format("%02.f", msec).."\n"..
		"Рекорд трассы: "..string.format("%02.f", mins2)..":"..string.format("%02.f", secs2)..":"..string.format("%02.f", msec2))
	end
	
	
	for _, element in pairs(PData["Race"]) do
		if(isElement(element)) then
			destroyElement(element)
		end
	end
	PData["Race"] = nil
end
addEvent("EndRace", true)
addEventHandler("EndRace", localPlayer, EndRace)





function StartLainOS()
	if(not LainOS) then
		showChat(false)
		LainOSDisplay = {}
		LainOSInput = ""
		setTimer(function()
			PText["LainOS"][1] = {"RAM OK", 0, 50*scalex, screenWidth-(250*scaley), screenHeight, tocolor(0, 168, 0, 255), scale*6, "default", "right", "top", false, false, false, true, false, 0, 0, 0, {}}
			playSFX("genrl", 53, 8, false)
			setTimer(function()
				PText["LainOS"][1] = {"RAM OK\nROM OK", 0, 50*scalex, screenWidth-(250*scaley), screenHeight, tocolor(0, 168, 0, 255), scale*6, "default", "right", "top", false, false, false, true, false, 0, 0, 0, {}}
				playSFX("genrl", 53, 8, false)
				setTimer(function()
					LainOSCursorTimer = setTimer(function()
						UpdateLainOSCursor()
					end, 500, 0, source)
	
					AddLainOSTerminalText("Copyright (c) 1969-1989 The LainOS Project.")
					AddLainOSTerminalText("Copyright (c) 1969, 1973, 1977, 1979, 1980, 1983, 1986, 1988, 1989")
					setTimer(function()
						AddLainOSTerminalText("The Regents of the Hikikomori of Equestria. All rights reserved.")
						AddLainOSTerminalText("LainOS is a registered trademark of The LainOS Foundation.")
						AddLainOSTerminalText("LainOS 1.3-ALPHA #0: Fri May  1 08:49:13 UTC 1989")
						setTimer(function()
							AddLainOSTerminalText("Timecounter \"i228\" frequency 1193182 Hz quality 0")
							AddLainOSTerminalText("CPU: TNN Mithrope(tm) 16 Processor 800+ (405.03-MHz 686-class CPU)")
							AddLainOSTerminalText("  Origin = \"AuthenticTNN\"  Id = 0x50ff2  Stepping = 2")
							AddLainOSTerminalText("  Features=0x78bfbff<FPU,VME,DE,PSE,TSC,MSR,PAE,MCE,CX8,APIC,SEP,MTRR,PGE,MCA,CMOV,PAT,PSE36,CLFLUSH,MMX,FXSR,SSE,SSE2>")
							AddLainOSTerminalText("  Features2=0x2001<SSE3,CX16>")
							AddLainOSTerminalText("  TNN Features=0xea500800<SYSCALL,NX,MMX+,FFXSR,RDTSCP,LM,2DNow!+,2DNow!>")
							AddLainOSTerminalText("  TNN Features2=0x1d<LAHF,SVM,ExtAPIC,CR8>")
							setTimer(function()
								AddLainOSTerminalText("real memory  = 1039073280 (990 MB)")
								AddLainOSTerminalText("avail memory = 1003065344 (956 MB)")
							end, 300, 1, source)
						end, 300, 1, source)
					end, 500, 1, source)
				end, 700, 1, source)
			end, 1000, 1, source)
		end, 500, 1, source)
		LainOS = true
	end
end
addEvent("StartLainOS", true)
addEventHandler("StartLainOS", localPlayer, StartLainOS)


function AddLainOSTerminalText(text)
	LainOSDisplay[#LainOSDisplay+1] = text
	local FH = dxGetFontHeight(scale, "default")
	local maxline = math.floor((screenHeight-(50*scaley))/FH)-1
	if(maxline > #LainOSDisplay) then maxline = #LainOSDisplay end
	local out = ""
	for i = 1, maxline do
		out = out.."\n"..LainOSDisplay[#LainOSDisplay-(maxline-i)]
	end
	PText["LainOS"][1] = {out, 25*scalex, 25*scaley, 0, 0, tocolor(0, 168, 0, 255), scale, "default", "left", "top", false, false, false, true, false, 0, 0, 0, {}}

	UpdateLainOSCursor()
end


local LainOSCMD = {
	["help"] = "lainoshelp"
}
function ExecuteLainOSCommand(cmd)
	if(not LainOSCMD[cmd]) then
		AddLainOSTerminalText(cmd..": Command not found.")
	else
	
	end

end


function UpdateLainOSCursor()
	local FH = dxGetFontHeight(scale, "default")
	local maxline = math.floor((screenHeight-(50*scaley))/FH)
	if(maxline > #LainOSDisplay) then maxline = #LainOSDisplay+1 end
	if(LainOSCursorLoad > #LainOSCursorLoadData) then 
		LainOSCursorLoad = 1 
	end
	
	PText["LainOS"][2] = {LainOSInput..LainOSCursorLoadData[LainOSCursorLoad], 25*scalex, 25*scaley+(FH*maxline), 0, 0, tocolor(0, 168, 0, 255), scale, "clear", "left", "top", false, false, false, true, false, 0, 0, 0, {}}
	LainOSCursorLoad=LainOSCursorLoad+1
end




-- bone, offx,offy,offz,offrx,offry,offrz
local ModelPlayerPosition = {
	[352] = {13, -0.06, 0.05, -0.1, -5, 260, 90},
	[353] = {13, -0.06, 0.05, -0.1, -5, 260, 90},
	[372] = {13, -0.06, 0.05, -0.1, -5, 260, 90},
	[346] = {14, 0.08, 0.05, -0.1, 5, 260, 90},
	[347] = {14, 0.08, 0.05, -0.1, 5, 260, 90},
	[348] = {14, 0.08, 0.05, -0.1, 5, 260, 90},
	[342] = {14, 0.08, 0.05, -0.1, 5, 260, 90},
	[335] = {14, 0.13, -0.08, -0.04, 5, 0, 90},
	[367] = {3, 0.11, 0.13, 0.1, 0, 40, 90},
	[349] = {3, 0, -0.14, -0.25, 0, 290, 15}, 
	[350] = {3, 0, -0.14, -0.25, 0, 290, 15}, 
	[351] = {3, 0, -0.14, -0.25, 0, 290, 15}, 
	[355] = {3, 0, -0.14, -0.25, 0, 290, 15}, 
	[356] = {3, 0, -0.14, -0.25, 0, 290, 15}, 
	[357] = {3, 0, -0.14, -0.25, 0, 290, 15}, 
	[358] = {3, 0, -0.14, -0.25, 0, 290, 15}, 
	[359] = {3, 0.07, -0.14, 0, 0, 290, 15}, 
	[341] = {3, 0, -0.14, -0.25, 0, 290, 15}, 
	[3026] = {3, 0, -0.10, -0.15, 0, 270, 0}, 
	[339] = {3, 0.15, -0.14, 0.2, 0, 200, 15},
	[338] = {3, 0.15, -0.14, 0.2, 0, 200, 15},
	[333] = {3, 0.15, -0.14, 0.2, 0, 200, 15},
	[336] = {3, 0.15, -0.14, 0.2, 0, 200, 15},
	[337] = {3, 0.15, -0.14, 0.2, 0, 200, 15},
	[321] = {4, 0, -0.04, -0.1, 0, 160, 90},
	[322] = {4, 0, -0.04, -0.1, 0, 160, 90},
	[323] = {4, 0, -0.04, -0.1, 0, 160, 90},
	[1484] = {11,0.01,0,0.15,0,140,0},
	[1950] = {11,-0.14,0.05,0.1,0,100,0},
	[1951] = {11,-0.14,0.05,0.1,0,100,0},
	[1669] = {11,-0.14,0.05,0.1,0,100,0},
	[1543] = {11,-0.22,0.05,0.15,0,100,0},
	[1544] = {11,-0.15,0.05,0.30,0,140,0},
	[1546] = {11,0,0.1,0.1,0,90,0},
	[330] = {12,0,0,0.03,0,-90,0},
	[2880] = {12,0,0,0,0,-90,0},
	[2881] = {12,0,0,0,0,-90,0},
	[2769] = {11,0,0,0.1,0,0,0},
	[3027] = {1, 0, 0.09, -0.01, 90, 90, 90},
	[1210] = {12, 0, 0.1, 0.3, 0, 180, 0},
	[954] = {12, 0, 0.1, 0.3, 0, 180, 0},
	[1276] = {12, 0, 0.1, 0.3, 0, 180, 0},
	[2663] = {12, 0, 0, 0.3, 0, 180, 0},
	[1650] = {12, 0, 0, 0.15, 0, 180, 0},
	[1609] = {3, 0, 0, -0.25, 90, 0, 0},
	[1608] = {3, 0, 0, -0.25, 90, 0, 0},
	[1607] = {3, 0, 0, -0.25, 90, 0, 0},
	[1025] = {12, 0.2, 0.05, 0, 0, 0, 75},
	[3632] = {12, 0, 0, 0, 0, 90, 0},
	[1370] = {12, 0, 0, 0, 0, 90, 0},
	[1218] = {12, 0, 0, 0, 0, 90, 0},
	[1222] = {12, 0, 0, 0, 0, 90, 0},
	[1225] = {12, 0, 0, 0, 0, 90, 0},
	[1453] = {12, 0.2, 0.1, 0, 0, 90, 345},
	[2900] = {12, -0.1, 0.3, 0.15, 0, 90, 0},
}





function outputLoss(attacker)
	if(getElementType(attacker) == "vehicle") then attacker = getVehicleOccupant(attacker) end
	if(attacker) then
		if(attacker == localPlayer) then
			triggerServerEvent("DestroyObject", localPlayer, localPlayer, source)
		end
	end
end
addEventHandler("onClientObjectBreak", root, outputLoss)


function CreatePlayerArmas(thePlayer, model) 
	if(StreamData[thePlayer]["armas"]) then
		if(ModelPlayerPosition[tonumber(model)]) then
			StreamData[thePlayer]["armas"][model] = createObject(model, 0,0,0)
			if(tonumber(model) == 1025 or tonumber(model) == 1453 or tonumber(model) == 2900) then -- Уменьшаем запаску
				setObjectScale(StreamData[thePlayer]["armas"][model], 0.6)
			end
			setElementCollisionsEnabled(StreamData[thePlayer]["armas"][model], false)
			setElementDimension(StreamData[thePlayer]["armas"][model],getElementDimension(thePlayer))
			setElementInterior(StreamData[thePlayer]["armas"][model],getElementInterior(thePlayer))
		end
	end
end


function AddPlayerArmas(thePlayer, model)
	if(StreamData[thePlayer]) then
		StreamData[thePlayer]["armasplus"][model] = true
		UpdateArmas(thePlayer)
	end
end
addEvent("AddPlayerArmas", true)
addEventHandler("AddPlayerArmas", getRootElement(), AddPlayerArmas)


function RemovePlayerArmas(thePlayer, model)
	if(StreamData[thePlayer]) then
		StreamData[thePlayer]["armasplus"][model] = nil
		UpdateArmas(thePlayer)
	end
end
addEvent("RemovePlayerArmas", true)
addEventHandler("RemovePlayerArmas", getRootElement(), RemovePlayerArmas)



local bones = {
	[1] = {5,4,6}, --head{5,nil,6}
	[2] = {4,5,8}, --neck
	[3] = {3,1,31}, --spine {3,nil,31}
	[4] = {1,2,3}, --pelvis
	[5] = {4,32,5}, --left clavicle
	[6] = {4,22,5}, --right clavicle
	[7] = {32,33,34}, --left shoulder
	[8] = {22,23,24}, --right shoulder
	[9] = {33,34,32}, --left elbow
	[10] = {23,24,22}, --right elbow
	[11] = {34,35,36}, --left hand
	[12] = {24,25,26}, --right hand
	[13] = {41,42,43}, --left hip
	[14] = {51,52,53}, --right hip
	[15] = {42,43,44}, --left knee
	[16] = {52,53,54}, --right knee
	[17] = {43,42,44}, --left ankle
	[18] = {53,52,54}, --right angle
	[19] = {44,43,42}, --left foot
	[20] = {54,53,52} --right foot
}


function getMatrixFromPoints(x,y,z,x3,y3,z3,x2,y2,z2)
	x3 = x3-x
	y3 = y3-y
	z3 = z3-z
	x2 = x2-x
	y2 = y2-y
	z2 = z2-z
	local x1 = y2*z3-z2*y3
	local y1 = z2*x3-x2*z3
	local z1 = x2*y3-y2*x3
	x2 = y3*z1-z3*y1
	y2 = z3*x1-x3*z1
	z2 = x3*y1-y3*x1
	local len1 = 1/math.sqrt(x1*x1+y1*y1+z1*z1)
	local len2 = 1/math.sqrt(x2*x2+y2*y2+z2*z2)
	local len3 = 1/math.sqrt(x3*x3+y3*y3+z3*z3)
	x1 = x1*len1 y1 = y1*len1 z1 = z1*len1
	x2 = x2*len2 y2 = y2*len2 z2 = z2*len2
	x3 = x3*len3 y3 = y3*len3 z3 = z3*len3
	return x1,y1,z1,x2,y2,z2,x3,y3,z3
end





function getBoneMatrix(ped,bone)
	local x,y,z,tx,ty,tz,fx,fy,fz
	x,y,z = getPedBonePosition(ped,bones[bone][1])
	if bone == 1 then
		local x6,y6,z6 = getPedBonePosition(ped,6)
		local x7,y7,z7 = getPedBonePosition(ped,7)
		tx,ty,tz = (x6+x7)*0.5,(y6+y7)*0.5,(z6+z7)*0.5
	elseif bone == 3 then
		local x21,y21,z21, x31,y31,z31
	
		x21,y21,z21 = getPedBonePosition(ped,21)
		x31,y31,z31 = getPedBonePosition(ped,31)
	
		if math.round(x21, 2) == math.round(x31, 2) and math.round(y21, 2) == math.round(y31, 2) and math.round(z21, 2) == math.round(z31, 2) then
			x21,y21,z21 = getPedBonePosition(ped,21)
			local _,_,rZ = getElementRotation(ped)
	
			tx,ty,tz = getPointInFrontOfPoint(x21, y21, z21, rZ, 0.0001)
		else
			tx,ty,tz = (x21+x31)*0.5,(y21+y31)*0.5,(z21+z31)*0.5
		end        
	else
		tx,ty,tz = getPedBonePosition(ped,bones[bone][2])
	end
	fx,fy,fz = getPedBonePosition(ped,bones[bone][3])
	local xx,xy,xz,yx,yy,yz,zx,zy,zz = getMatrixFromPoints(x,y,z,tx,ty,tz,fx,fy,fz)
	if bone == 1 or bone == 3 then xx,xy,xz,yx,yy,yz = -yx,-yy,-yz,xx,xy,xz end
	return xx,xy,xz,yx,yy,yz,zx,zy,zz
end




function isnan(x) 
    if (x ~= x) then 
        return true 
    end 
    if type(x) ~= "number" then 
       return false 
    end 
    if tostring(x) == tostring((-1)^0.5) then 
        return true 
    end 
    return false 
end 

function UpdateDisplayArmas(thePlayer)
	if(isElementAttached(thePlayer)) then
		local ATT = getElementAttachedTo(thePlayer)
		local rx,ry,rz=getElementRotation(ATT)
		setElementRotation(thePlayer,rx,ry,rz,"default",true)
	end
	if(StreamData[thePlayer]) then
		for model,weapon in pairs(StreamData[thePlayer]["armas"]) do
			model = tonumber(model)
			if(ModelPlayerPosition[model]) then
				local bone, offx,offy,offz,offrx,offry,offrz = unpack(ModelPlayerPosition[model])
				if(getElementData(thePlayer, "BottleAnus")) then
					if(model == getElementData(thePlayer, "BottleAnus")) then
						bone, offx,offy,offz,offrx,offry,offrz = 3, -0.1, 0.1, -0.6, 0, 0, 0
					end
				end
				
				
				local x,y,z = getPedBonePosition(thePlayer,bones[bone][1])


				local xx,xy,xz,yx,yy,yz,zx,zy,zz = getBoneMatrix(thePlayer,bone)
				local objx = x+offx*xx+offy*yx+offz*zx
				local objy = y+offx*xy+offy*yy+offz*zy
				local objz = z+offx*xz+offy*yz+offz*zz
				local rxx,rxy,rxz,ryx,ryy,ryz,rzx,rzy,rzz = getMatrixFromEulerAngles(offrx,offry,offrz)
				
				local txx = rxx*xx+rxy*yx+rxz*zx
				local txy = rxx*xy+rxy*yy+rxz*zy
				local txz = rxx*xz+rxy*yz+rxz*zz
				local tyx = ryx*xx+ryy*yx+ryz*zx
				local tyy = ryx*xy+ryy*yy+ryz*zy
				local tyz = ryx*xz+ryy*yz+ryz*zz
				local tzx = rzx*xx+rzy*yx+rzz*zx
				local tzy = rzx*xy+rzy*yy+rzz*zy
				local tzz = rzx*xz+rzy*yz+rzz*zz
				offrx,offry,offrz = getEulerAnglesFromMatrix(txx,txy,txz,tyx,tyy,tyz,tzx,tzy,tzz)
				
				if(isnan(offrx) or isnan(offry) or isnan(offrz)) then return false end		
				if(isnan(objx) or isnan(objy) or isnan(objz)) then return false end
				

				setElementPosition(weapon,objx,objy,objz)
				setElementRotation(weapon,offrx,offry,offrz,"ZXY")
			end
		end
	end
end




function RGBToHex(red, green, blue, alpha)
	if((red < 0 or red > 255 or green < 0 or green > 255 or blue < 0 or blue > 255) or (alpha and (alpha < 0 or alpha > 255))) then return nil end
	if(alpha) then return string.format("#%.2X%.2X%.2X%.2X", red,green,blue,alpha)
	else return string.format("#%.2X%.2X%.2X", red,green,blue) end
end

function create3dtext(text,x,y,z,razmer,dist,color,font)
	local px,py,pz = getCameraMatrix()
    local distance = getDistanceBetweenPoints3D(x,y,z,px,py,pz)
    if distance <= dist then
		if(getPedOccupiedVehicle(localPlayer)) then
			if(isLineOfSightClear(x,y,z, px,py,pz, true, false, false, true, false, false, false, localPlayer)) then
				sx,sy = getScreenFromWorldPosition(x, y, z, 0.06)
				if not sx then return end
				MemText(text, sx, sy, color, razmer, font, razmer, 0, true, true, dist/(dist-distance))
			end
		else
			if(isLineOfSightClear(x,y,z, px,py,pz, true, true, false, true, false, false, false, localPlayer)) then
				sx,sy = getScreenFromWorldPosition(x, y, z, 0.06)
				if not sx then return end
				MemText(text, sx, sy, color, razmer, font, razmer, 0, true, true, dist/(dist-distance))
			end
		end
    end
end


function Create3DTextOnMap(text,x,y,z,razmer,dist,color,font)
	x = x/50
	y = y/50
	local px,py,pz = getCameraMatrix()
    local distance = getDistanceBetweenPoints3D(x,y,z,px,py,pz)
    if distance <= dist then
		sx,sy = getScreenFromWorldPosition(x, y, z, 0.06)
		if not sx then return end
		dxDrawBorderedText(text, sx, sy, sx, sy, color, (1-(distance/dist))*razmer, font, "center", "bottom", false, false, false,false)
    end
end


function setDoingDriveby()
	if(getPedOccupiedVehicle(localPlayer) and not InventoryWindows) then
		if not isPedDoingGangDriveby(localPlayer) then
			setPedDoingGangDriveby(localPlayer, true)
		else
			setPedDoingGangDriveby(localPlayer, false)
		end
	end
end


function DrawProgressBar(x,y,count,bool,size)
	local size2 = size-10
	dxDrawRectangle(x, y, size*scalex, 31*scaley , tocolor(0, 0, 0, 255))
	dxDrawRectangle(x+(5*scalex), y+(6*scaley), size2*scalex, 19*scaley , tocolor(100, 100, 100, 255))
	dxDrawRectangle(x+(5*scalex), y+(6*scaley), ((count/1000)*size2)*scalex, 19*scaley , tocolor(255, 255, 255, 255))
	
	if(bool) then
		if(bool == 0) then return true end
		if(bool > 0) then
			if(bool < 25) then
				bool = bool+25
				count = count+25
			end
			if(count-bool <= 0) then count = 25 end
			dxDrawRectangle(x+(5*scalex)+((((count-bool)/1000)*size2)*scalex), y+(6*scaley), ((bool/1000)*size2)*scalex, 19*scaley, tocolor(69, 200, 59, 255))
		else
			if(bool > -25) then
				bool = bool-25
				count = count-25
			end
			if(count-bool <= 0) then count = 25 end
		--	bool = (bool-bool-bool)
			dxDrawRectangle(x+(5*scalex)+((((count-bool)/1000)*size2)*scalex), y+(6*scaley), ((bool/1000)*size2)*scalex, 19*scaley, tocolor(255, 0, 0, 255))
		end
	end
end



function PlaySFXSound(event)
	if(event==1) then
		playSFX("script", 146, 4, false)--Вступление в картель
	elseif(event==2) then
		playSFX("script", 16, 3, false)--Вступление в Гроув-стрит
	elseif(event==4) then
		playSFX("script", 150, 0, false)--ремонт
	elseif(event==5) then
		playSFX("script", 144, 1, false)
	elseif(event==6) then
		playSFX("script", 205, 1, false)--Деньги
	elseif(event==7) then
		playSFX("genrl", 52, 19, false)--Гонка
	elseif(event==8) then
		playSFX("script", 61, 0, false)--piss
	elseif(event==9) then
		playSFX("genrl", 131, 2, false)--engine starter
	elseif(event==10) then
		GTASound = playSound("GTA3.mp3")
		setSoundVolume(GTASound, 0.5)
	elseif(event==11) then 
		playSFX("script", 151, 0, false) -- Еда
	elseif(event==12) then
		playSFX("script", 8, 0, false) -- Звонок набор
	elseif(event==13) then
		playSFX("script", 105, 0, false) -- Звонок вызов
	elseif(event==14) then
		playSFX("genrl", 52, 15, false)--levelup
	elseif(event==15) then
		playSFX("genrl", 52, 17, false)--инвентарь
	elseif(event==16) then
		playSFX("genrl", 131, 43, false)--Открыть дверь
	elseif(event==17) then
		playSFX("genrl", 131, 38, false)--закрыть дверь
	elseif(event==18) then
		playSFX("genrl", 75, 1, false)--Миссия выполнена
	end
end
addEvent("PlaySFXSoundEvent", true)
addEventHandler("PlaySFXSoundEvent", localPlayer, PlaySFXSound)




addEventHandler("onClientVehicleExplode", getRootElement(), function()
	if(isElementSyncer(source)) then
		local x,y,z = getElementPosition(source)
		local rand = math.random(0, 4)
		if(rand > 0) then
			local arr = {}
			for slot = 1, rand do
				local randx, randy = math.random(-5,5), math.random(-5,5)
				z = getGroundPosition(x+randx,y+randy,z)
				arr[#arr+1] = {x+randx, y+randy, z}
			end
			triggerServerEvent("CreateFire", localPlayer, toJSON(arr))
		end
	end
	if(getElementModel(source) == 592) then
		local x,y,z = getElementPosition(source)
		for slot = 1, 40 do
			createExplosion(x+(math.random(-40,40)), y+(math.random(-40,40)), z, 6)
			createEffect("explosion_large", x+(math.random(-40,40)), y+(math.random(-40,40)), z)
		end
	end
end)


function PlayerSayEvent(message,thePlayer)
	PlayersMessage[thePlayer]=message
	if(isTimer(timers[thePlayer])) then
		killTimer(timers[thePlayer])
	end
	timers[thePlayer] = setTimer(function()
		PlayersMessage[thePlayer]=nil
	end, 1000+(#message*150), 1)
end
addEvent("PlayerSayEvent", true)
addEventHandler("PlayerSayEvent", localPlayer, PlayerSayEvent)

function PlayerActionEvent(message,thePlayer)
	PlayersAction[thePlayer]=message
	if(isTimer(timersAction[thePlayer])) then
		killTimer(timersAction[thePlayer])
	end
	timersAction[thePlayer] = setTimer(function()
		PlayersAction[thePlayer]=nil
	end, 300+(#message*75), 1)
end
addEvent("PlayerActionEvent", true)
addEventHandler("PlayerActionEvent", localPlayer, PlayerActionEvent)




function breakMove()
	if(MovePlayerTo[localPlayer]) then
		MovePlayerTo[localPlayer] = nil
		setPedControlState(localPlayer, "forwards", false)
		PData['automove'] = nil
	end
end



function autoMove()
	if(PData['gps']) then
		PData['automove'] = true
		
		local arr = fromJSON(getElementData(PData['gps'][#PData['gps']], "coord"))
		
		MovePlayerTo[localPlayer] = {arr[1],arr[2],arr[3],0,"silent"}
	else
		breakMove()
	end
end



function reload()
	local found = false
	local item = PInv["player"][usableslot][1] or "Кулак"
	if(WeaponAmmo[WeaponNamesArr[item]]) then
		for key, k in pairs(PInv["player"][usableslot][4]) do
			if(k[1] == PInv["player"][usableslot][4][key][1]) then
				found = true
				break
			end
		end
		if(not found) then
			local AmmoSlot = FoundInventoryItem(WeaponAmmo[WeaponNamesArr[PInv["player"][usableslot][1]]])
			if(AmmoSlot) then
				AddButtonData("player", usableslot, "player", AmmoSlot, "патроны")
				triggerServerEvent("useinvweapon", localPlayer, localPlayer)
			end
		end
	end
end



--1,2,5,6 - размеры x,y
local screenSaver = {
	{340*scalex, 330*scaley, 165*scalex, 150*scaley, screenWidth/2, 0, true, true, 0},
	{340*scalex, 500*scaley, 90*scalex, 220*scaley, 0, 0, true, true, 0},
	{340*scalex, 720*scaley, 100*scalex, 200*scaley, 0, screenHeight, true, true, 0},
	{460*scalex, 720*scaley, 175*scalex, 120*scaley, screenWidth/2, screenHeight, true, true, 0},
	{470*scalex, 500*scaley, 165*scalex, 200*scaley, screenWidth, 0, true, true, 0},
}





function DrawPlayerInventory()
	local sx, sy, font, tw, th, color
	--[[ 
		Уберешь потом PData["Interface"]["Full"]
		когда сделаешь все зависимости
		возможно помимо отображения работают какие либо вычисления
	-- ]] 
	if(PData["Interface"]["Full"] and PEDChangeSkin == "play" and initializedInv and not isPedDead(localPlayer) and not isPlayerMapForced()) then
		titleText = Text("Информация")
		qualityInfo = ""
		if(InventoryWindows) then
			dxDrawRectangle(640*scalex, 360*scaley, 950*scalex, 425*scaley, tocolor(0, 0, 20, 150))
			if(backpackid) then
				dxDrawBorderedText(PInv["player"][backpackid][1], 660*scalex, 330*scaley, screenWidth, screenHeight, tocolor(255, 255, 255, 255), scale*2, "default-bold", "left", "top", false, false, false, true)	
			else
				dxDrawBorderedText(getPlayerName(localPlayer), 660*scalex, 325*scaley, screenWidth, screenHeight, tocolor(255, 255, 255, 255), scale*2, "default-bold", "left", "top", false, false, false, true)	
				local Birthday = getRealTime(getElementData(localPlayer, "Birthday"))
				qualityInfo = Text("Дата рождения")..
				": "..Birthday.monthday.."."..Birthday.month+(1).."."..Birthday.year+(1882)..
				" ("..Text("{age} лет", {{"{age}", ServerDate.year-(Birthday.year-18)}})..
				")\n"..Text("Фракция")..": "..Text(getTeamName(getPlayerTeam(localPlayer)))..
				"\n"..Text("Работа")..": "..Text(getElementData(localPlayer, "job"))
			end
			
			dxDrawLine(640*scalex+(646*scalex), 360*scaley+(50*scaley), 640*scalex+(949*scalex), 360*scaley+(50*scaley), tocolor(120,120,120,255), 1)	
			dxDrawLine(640*scalex+(646*scalex), 360*scaley+(90*scaley), 640*scalex+(949*scalex), 360*scaley+(90*scaley), tocolor(120,120,120,255), 1)	
			dxDrawLine(640*scalex+(646*scalex), 360*scaley+(320*scaley), 640*scalex+(949*scalex), 360*scaley+(320*scaley), tocolor(120,120,120,255), 1)
			dxDrawLine(640*scalex+(646*scalex), 360*scaley+(372*scaley), 640*scalex+(949*scalex), 360*scaley+(372*scaley), tocolor(120,120,120,255), 1)
			
			dxDrawBorderedText(InventoryMass.."/"..MaxMass..Text("кг"), screenWidth+(950*scalex), 695*scaley, 0, 0, MassColor, scale/1.2, "clear", "center", "top", false, false, false, true)
		elseif(PData["BizControlName"]) then
			dxDrawRectangle(640*scalex, 360*scaley, 950*scalex, 525*scaley, tocolor(20, 25, 20, 245))
			dxDrawBorderedText(PData["BizControlName"][2], 660*scalex, 330*scaley, screenWidth, screenHeight, tocolor(255, 255, 255, 255), scale*2, "default-bold", "left", "top", false, false, false, true)	
		elseif(TradeWindows) then			
			dxDrawRectangle(640*scalex, 360*scaley, 950*scalex, 425*scaley, tocolor(0, 0, 20, 150))
			dxDrawBorderedText("Продажа", 660*scalex, 330*scaley, screenWidth, screenHeight, tocolor(255, 255, 255, 255), scale*2, "default-bold", "left", "top", false, false, false, true)	
		
			dxDrawLine(640*scalex+(646*scalex), 360*scaley+(50*scaley), 640*scalex+(949*scalex), 360*scaley+(50*scaley), tocolor(120,120,120,255), 1)	
			dxDrawLine(640*scalex+(646*scalex), 360*scaley+(90*scaley), 640*scalex+(949*scalex), 360*scaley+(90*scaley), tocolor(120,120,120,255), 1)	
			dxDrawLine(640*scalex+(646*scalex), 360*scaley+(320*scaley), 640*scalex+(949*scalex), 360*scaley+(320*scaley), tocolor(120,120,120,255), 1)
			dxDrawLine(640*scalex+(646*scalex), 360*scaley+(372*scaley), 640*scalex+(949*scalex), 360*scaley+(372*scaley), tocolor(120,120,120,255), 1)
			
			dxDrawBorderedText(InventoryMass.."/"..MaxMass..Text("кг"), screenWidth+(950*scalex), 695*scaley, 0, 0, MassColor, scale/1.2, "clear", "center", "top", false, false, false, true)
		elseif(TrunkWindows) then			
			dxDrawRectangle(640*scalex, 360*scaley, 950*scalex, 425*scaley, tocolor(0, 0, 20, 150))
			dxDrawBorderedText("Багажник", 660*scalex, 330*scaley, screenWidth, screenHeight, tocolor(255, 255, 255, 255), scale*2, "default-bold", "left", "top", false, false, false, true)	
		elseif(BANKCTL) then
			dxDrawRectangle(640*scalex, 360*scaley, 950*scalex, 525*scaley, tocolor(25, 20, 20, 245))
			dxDrawBorderedText(BANKCTL, 660*scalex, 330*scaley, screenWidth, screenHeight, tocolor(255, 255, 255, 255), scale*2, "default-bold", "left", "top", false, false, false, true)	
		end

		
		dxDrawImage((screenWidth)-((80*NewScale)*10), screenHeight-(80*NewScale),(screenWidth)-((80*NewScale)*10), (80*NewScale), VideoMemory["HUD"]["PlayerInv"])

		for name,arr in pairs(PBut) do
			for i,el in pairs(arr) do
				sx,sy = el[1], el[2]
				local h,w = el[3], el[4]
				
				local CRAM = false
				local CTBACK = tocolor(81,81,105,140)
				local SystemName = PInv[name][i][1]
				local DrawText = Text(SystemName)
				if(PInv[name][i][4]) then
					if(PInv[name][i][4]["name"]) then
						DrawText = Text(PInv[name][i][4]["name"])
					end
				end

				if(name == "player") then
					if(i == usableslot) then
						CRAM = tocolor(230,230,255,255)
					end
				else
					CRAM = tocolor(120,120,120,255)
				end


				if(DragElementId) then
					local TIText = PInv[DragElementName][DragElementId][1]
					if(TIText) then
						if(items[TIText][7]) then -- Связанные предметы
							for razdelname,razdel in pairs(items[TIText][7]) do
								for _, IT in pairs(razdel) do
									if IT == SystemName then
										dxDrawRectangle(sx, sy, h, w,  tocolor(0,255,0,50))
									end
								end
							end
						end
						
						if(items[TIText][9]) then -- Объединяемые предметы
							if(DragElementId ~= i and DragElementName == name) then
								if(TIText == SystemName) then
									if(GetQuality(PInv[DragElementName][DragElementId][3]) == GetQuality(PInv[name][i][3])) then
										dxDrawRectangle(sx, sy, h, w,  tocolor(255,153,0,50))
									end
								end
							end
						end
					end
					if(DragElementId == i and DragElementName == name) then
						CRAM = tocolor(255,255,255,255)
						qualityInfo = GetQualityInfo(PInv[DragElementName][DragElementId])
						if(SystemName) then
							dxDrawText(items[SystemName][2], 640*scalex+(5*scalex), 740*scaley, screenWidth, screenHeight, tocolor(255, 255, 255, 255), scale/1.8, "default", "left", "top", false, false, false, true)
							titleText=DrawText
						end
					end
				end

				if(PInv[name][i][3]) then
					if(DragElement ~= el) then
						local r2,g2,b2 = hex2rgb(GetQualityColor(PInv[name][i][3]):sub(2,7))
						if(PInv[name][i][4]["quality"]) then
							r2,g2,b2 = hex2rgb(GetQualityColor(PInv[name][i][4]["quality"]):sub(2,7))
						end
						CTBACK = tocolor(r2,g2,b2,140)
					end
				end
				
				
				dxDrawRectangle(sx, sy+(80*NewScale), h, w-(80*NewScale), CTBACK)
					
				if(CRAM) then
					dxDrawLine(sx, sy, sx, sy+(80*NewScale), CRAM, 1)
					dxDrawLine(sx+(80*NewScale), sy, sx+(80*NewScale), sy+(80*NewScale), CRAM, 1)
					dxDrawLine(sx, sy, sx+(80*NewScale), sy, CRAM, 1)
					dxDrawLine(sx, sy+(80*NewScale), sx+(80*NewScale), sy+(80*NewScale), CRAM, 1)
					dxDrawLine(sx, sy+(80*NewScale), sx+(80*NewScale), sy+(80*NewScale), CRAM, 1)
				end
				

				if(DragElement == el and DragX) then
				
				else
					if(PInv[name][i][4]) then
						dxDrawImage(sx,sy,h,w,items[SystemName][1])

						local fontsize = NewScale
						tw = dxGetTextWidth(DrawText, fontsize, "default-bold", true)
						if(tw > w) then
							fontsize=fontsize*(w/tw)
						end
						MemText(DrawText, sx+(40*scalex), sy+(70*scaley), tocolor(255, 255, 255, 255), fontsize, "default-bold", NewScale, 0.1, true, true)
							
						if(name == "player" or name == "backpack" or name == "trunk") then
							if(items[SystemName][3] > 1) then
								local sht = {"", " шт"}
								if(SystemName == "Деньги") then sht = {"$", ""} end
								dxDrawBorderedText(sht[1]..PInv[name][i][2]..sht[2], sx, sy, sx+(76*NewScale), sy, tocolor(255, 255, 255, 255), scale/2, "default-bold", "right", "top", false, false, false, false)
							end
						elseif(name == "shop") then
							dxDrawBorderedText("$"..GetItemCost(PInv[name][i]), sx, sy, sx+(76*NewScale), sy, tocolor(100, 255, 100, 255), scale/2.5, "pricedown", "right", "top", false, false, false, false)
						end
						
						if(PInv[name][i][4]["патроны"]) then
							dxDrawImage(sx+(h-(25*NewScale)), sy, 25*NewScale, 25*NewScale, items[PInv[name][i][4]["патроны"][1]][1])
						end
						
						if(PInv[name][i][4]["лазер"]) then
							dxDrawImage(sx+(h-(50*NewScale)), sy, 25*NewScale, 25*NewScale, items[PInv[name][i][4]["лазер"][1]][1])
						end
						
						if(PInv[name][i][4]["сигареты"]) then
							dxDrawImage(sx+(h-(25*NewScale)), sy, 25*NewScale, 25*NewScale, items[PInv[name][i][4]["сигареты"][1]][1])
						end
					end
				end
			end
		end
		
		if(DragElement and DragX) then
			sx, sy = PBut[DragElementName][DragElementId][3], PBut[DragElementName][DragElementId][4]
			
			dxDrawImage(DragX, DragY, sx, sy, items[PInv[DragElementName][DragElementId][1]][1], nil,nil,nil,true)
			if(PInv[DragElementName][DragElementId][4]) then -- Экипированные в предмет вещи аля патроны
				if(PInv[DragElementName][DragElementId][4]["патроны"]) then
					dxDrawImage(DragX+(sx-(25*NewScale)), DragY, 25*NewScale, 25*NewScale, items[PInv[DragElementName][DragElementId][4]["патроны"][1]][1], nil,nil,nil,true)
				elseif(PInv[DragElementName][DragElementId][4]["сигареты"]) then
					dxDrawImage(DragX+(sx-(25*NewScale)), DragY, 25*NewScale, 25*NewScale, items[PInv[DragElementName][DragElementId][4]["сигареты"][1]][1], nil,nil,nil,true)
				end
			end
			
			local CTBACK = tocolor(81,81,105, 140)
			if(PInv[DragElementName][DragElementId][3]) then
				local r2,g2,b2 = hex2rgb(GetQualityColor(PInv[DragElementName][DragElementId][3]):sub(2,7))
				if(PInv[DragElementName][DragElementId][4]["quality"]) then
					r2,g2,b2 = hex2rgb(GetQualityColor(PInv[DragElementName][DragElementId][4]["quality"]):sub(2,7))
				end
				CTBACK = tocolor(r2,g2,b2,140)
			end
			dxDrawRectangle(DragX, DragY+(80*NewScale), sx, sy-(80*NewScale), CTBACK)
			
			if(DragElementName ~= "shop") then
				if(items[PInv[DragElementName][DragElementId][1]][3] > 1) then
					local sht = {"", " шт"}
					if(PInv[DragElementName][DragElementId][1] == "Деньги") then sht = {"$", ""} end
					dxDrawBorderedText(sht[1]..PInv[DragElementName][DragElementId][2]..sht[2], DragX, DragY, DragX+(76*NewScale), DragY, tocolor(255, 255, 255, 255), scale/2, "default-bold", "right", "top", false, false, true, true)
				end
			else
				dxDrawBorderedText("$"..GetItemCost(PInv[DragElementName][DragElementId]), DragX, DragY, DragX+(76*NewScale), DragY, tocolor(100, 255, 100, 255), scale/2.5, "pricedown", "right", "top", false, false, true, true)
			end
			
			local dragText = PInv[DragElementName][DragElementId][1]
			if(PInv[DragElementName][DragElementId][4]) then
				if(PInv[DragElementName][DragElementId][4]["name"]) then
					dragText = PInv[DragElementName][DragElementId][4]["name"]
				end
			end
			local fontsize = NewScale
			tw = dxGetTextWidth(dragText, fontsize, "default-bold", true)
			if(tw > (60*NewScale)) then
				fontsize=fontsize*((60*NewScale)/tw)
			end
			MemText(dragText, DragX+(40*scalex), DragY+(70*scaley), tocolor(255, 255, 255, 255), fontsize, "default-bold", NewScale, 0.1, true, true)

			titleText=dragText
		end
		if(InventoryWindows or TradeWindows) then
			dxDrawBorderedText(titleText, screenWidth+(970*NewScale), 415*NewScale, 0, 0, tocolor(255, 255, 255, 255), scale/1.2, "default-bold", "center", "top", false, false, false, true)
			dxDrawBorderedText(qualityInfo, 640*NewScale+(660*NewScale), (screenHeight/2.4), 0, 0, tocolor(255, 255, 255, 255), scale/1.5, "default-bold", "left", "top", false, false, false, true)
		end

	end	
end









addEventHandler("onClientVehicleCollision", root,
    function(HitElement,force, bodyPart, x, y, z, nx, ny, nz, hitElementForce)
         if(source == getPedOccupiedVehicle(localPlayer)) then
			if(HitElement) then
				local fDamageMultiplier = getVehicleHandling(source).collisionDamageMultiplier
				if(isTimer(PData["Driver"]["Collision"])) then
					killTimer(PData["Driver"]["Collision"])
				else
					PData["Driver"]["CollisionPoint"] = 0
				end
				
				PData["Driver"]["CollisionPoint"] = PData["Driver"]["CollisionPoint"]+(force*fDamageMultiplier)

				PData["Driver"]["Collision"] = setTimer(function(targetafter)
					triggerServerEvent("DestroyObject", localPlayer, localPlayer, PData["Driver"]["CollisionPoint"])
					PData["Driver"]["CollisionPoint"] = nil
				end, 200, 1)
			end
			
			if(force > 500) then
				triggerServerEvent("ForceRemoveFromVehicle", localPlayer, localPlayer, force/1000)
			end
         end
    end
)






local PosVar = {
	[1] = "ый",
	[2] = "ой",
	[3] = "ий",
	[4] = "ый",
	[5] = "ый",
	[6] = "ой",
	[7] = "ой",
	[8] = "ой",
}

function DrawPlayerMessage()
	local x,y,z = getElementPosition(localPlayer)
	
	local sx, sy, font, tw, th, color
	
	if(PData["ResourceMap"]) then
		for i, dat in pairs(PData["ResourceMap"]) do
			for name, v in pairs(dat) do
				dxDrawLine3D(v[1],v[2],v[3],v[4],v[5],v[6],v[7],v[8])
			end
		end
	
		mousex,mousey,mousez = GetCursorPositionOnMap()
		mx,my,mz = GetCoordOnMap(x,y,z)
		sx,sy = getScreenFromWorldPosition(mx,my,mz)
		if(sx and sy) then
			dxDrawCircle(sx,sy, 6*NewScale, 2*NewScale, 1, 0, 360, tocolor(255,24,20,150))
			if(getDistanceBetweenPoints2D(mx,my,mousex,mousey) < 1) then
				Create3DTextOnMap("ТЫ",mousex*50,mousey*50,mousez,NewScale*2,2000,tocolor(230,230,230,255),"default-bold")
			end
		end
		
		
		if(isElement(PData["WaypointBlip"])) then
			local x,y,z = getElementPosition(PData["WaypointBlip"])
			mx,my,mz = GetCoordOnMap(x,y,z)
			sx,sy = getScreenFromWorldPosition(mx,my,mz)
			if(sx and sy) then
				dxDrawCircle(sx,sy, 6*NewScale, 6*NewScale, 1, 0, 360, tocolor(255,24,20,150))
			end
		
		end
		
		Create3DTextOnMap("Los Santos\n#ffff00★★★★",1850,-1600,4000,NewScale*2,600,tocolor(230,230,230,255),"default-bold")
		Create3DTextOnMap("San Fierro\n#ffff00★★★",-2200,400,4000,NewScale*2,600,tocolor(230,230,230,255),"default-bold")
		Create3DTextOnMap("Las Venturas\n#ffff00★★★",2200,1650,4000,NewScale*2,600,tocolor(230,230,230,255),"default-bold")
		Create3DTextOnMap("Angel Pine\n#ffff00★★",-2150,-2450,4000,NewScale*2,250,tocolor(230,230,230,255),"default-bold")
		Create3DTextOnMap("Las Payasadas\n#ffff00★★★",-250,2650,4000,NewScale*2,250,tocolor(230,230,230,255),"default-bold")
		Create3DTextOnMap("El Quebrados\n#ffff00★★★",-1500,2500,4000,NewScale*2,250,tocolor(230,230,230,255),"default-bold")
		Create3DTextOnMap("Fort Caston\n#ffff00★★",-245,1100,4000,NewScale*2,250,tocolor(230,230,230,255),"default-bold")
		Create3DTextOnMap("Palomino Creek\n#ffff00★★★",2350,30,4000,NewScale*2,250,tocolor(230,230,230,255),"default-bold")
		Create3DTextOnMap("Blueberry\n#ffff00★★★",215,-215,4000,NewScale*2,250,tocolor(230,230,230,255),"default-bold")
		Create3DTextOnMap("Dillimore\n#ffff00★",670,-540,4000,NewScale*2,250,tocolor(230,230,230,255),"default-bold")
		Create3DTextOnMap("Montgomery\n#ffff00★",1310, 310,4000,NewScale*2,250,tocolor(230,230,230,255),"default-bold")
		Create3DTextOnMap("Bayside\n#ffff00★",-2537, 2332,4000,NewScale*2,250,tocolor(230,230,230,255),"default-bold")
		Create3DTextOnMap("Las Barrancas\n#ffff00★",-763, 1504, 4000,NewScale*2,250,tocolor(230,230,230,255),"default-bold")

		
		PData["MapHitElement"] = false
		local col = createObject(16635, mousex,mousey,mousez)
		for _, v in pairs(getElementsByType("colshape", getRootElement(), true)) do
			if(isElementWithinColShape(col, v)) then
				PData["MapHitElement"] = getElementAttachedTo(v)
			end
		end
		destroyElement(col)
		

		if(PData["MapHitElement"]) then
			x,y,z = getElementPosition(PData["MapHitElement"])
			--Create3DTextOnMap(getElementData(PData["MapHitElement"], "NameInMap"),x*50,y*50,z,NewScale,2000,tocolor(230,230,230,255),"default-bold")
		end
	end
	
	for key, arr in pairs(PData["MultipleAction"]) do
		local text = arr[2]
		if(text) then
			font = "sans"
			tw = dxGetTextWidth(text, NewScale*1.8, font, true)
			th = dxGetFontHeight(NewScale*1.8, font)

			dxDrawBorderedText(text.." ["..key.."]", arr[3]-tw/2, arr[4]-th/2, screenWidth, screenHeight, tocolor(255, 153, 0 , 255), NewScale*1.8, font, "left", nil, nil, nil, nil, true)		
		end
	end
	PData["MultipleAction"] = {}
		
	if(PEDChangeSkin == "play" and initializedInv and not isPlayerMapForced()) then
		if(tuningList) then
			sx,sy = (screenWidth/2.55), screenHeight-(150*scaley)
		
			if(STPER) then
				local TopSpeed, Power, Acceleration, Brake, Control = 0,0,0,0,0
				if(NEWPER) then
					TopSpeed = GetVehicleTopSpeed(NEWPER["engineAcceleration"], NEWPER["dragCoeff"], NEWPER["maxVelocity"])-GetVehicleTopSpeed(STPER["engineAcceleration"], STPER["dragCoeff"], STPER["maxVelocity"])
					Power = GetVehiclePower(NEWPER["mass"], NEWPER["engineAcceleration"])-GetVehiclePower(STPER["mass"], STPER["engineAcceleration"])
					Acceleration = GetVehicleAcceleration(NEWPER["engineAcceleration"], NEWPER["tractionMultiplier"])-GetVehicleAcceleration(STPER["engineAcceleration"], STPER["tractionMultiplier"])
					Brake = GetVehicleBrakes(NEWPER["brakeDeceleration"], NEWPER["tractionLoss"])-GetVehicleBrakes(STPER["brakeDeceleration"], STPER["tractionLoss"])
					Control = GetVehicleControl(NEWPER["tractionBias"])-GetVehicleControl(STPER["tractionBias"])
				end
				DrawProgressBar(sx, sy, (GetVehicleTopSpeed(STPER["engineAcceleration"], STPER["dragCoeff"], STPER["maxVelocity"]))+TopSpeed,TopSpeed,200)
				DrawProgressBar(sx+(300*scaley), sy, GetVehiclePower(STPER["mass"], STPER["engineAcceleration"])+Power,Power,200) --При максимальной мощности 348 лс.
				DrawProgressBar(sx+(600*scaley), sy, GetVehicleAcceleration(STPER["engineAcceleration"], STPER["tractionMultiplier"])+Acceleration,Acceleration,200)
				DrawProgressBar(sx+(900*scaley), sy, GetVehicleBrakes(STPER["brakeDeceleration"], STPER["tractionLoss"])+Brake,Brake,200)
				DrawProgressBar(sx+(900*scaley), sy-(130*scaley), GetVehicleControl(STPER["tractionBias"])+Control,Control,200)
			
			end
		
			sx,sy = guiGetScreenSize()
			local S = 60
			local PosX=0
			local PosY=sy-((sy/S)*13)

			for slot = 1, #ColorArray do
				local r,g,b = hex2rgb(ColorArray[slot])
				if(slot <= 10) then
					dxDrawRectangle(PosX+((sx/S)*(slot-1)), PosY, sx/S, sy/S, tocolor(r, g, b, 255))
				elseif(slot <= 20) then
					dxDrawRectangle(PosX+((sx/S)*(slot-11)), PosY+(sy/S), sx/S, sy/S, tocolor(r, g, b, 255))
				elseif(slot <= 30) then
					dxDrawRectangle(PosX+((sx/S)*(slot-21)), PosY+(sy/S)*2, sx/S, sy/S, tocolor(r, g, b, 255))
				elseif(slot <= 40) then
					dxDrawRectangle(PosX+((sx/S)*(slot-31)), PosY+(sy/S)*3, sx/S, sy/S, tocolor(r, g, b, 255))
				elseif(slot <= 50) then
					dxDrawRectangle(PosX+((sx/S)*(slot-41)), PosY+(sy/S)*4, sx/S, sy/S, tocolor(r, g, b, 255))
				elseif(slot <= 60) then
					dxDrawRectangle(PosX+((sx/S)*(slot-51)), PosY+(sy/S)*5, sx/S, sy/S, tocolor(r, g, b, 255))
				elseif(slot <= 70) then
					dxDrawRectangle(PosX+((sx/S)*(slot-61)), PosY+(sy/S)*6, sx/S, sy/S, tocolor(r, g, b, 255))
				elseif(slot <= 80) then
					dxDrawRectangle(PosX+((sx/S)*(slot-71)), PosY+(sy/S)*7, sx/S, sy/S, tocolor(r, g, b, 255))
				elseif(slot <= 90) then
					dxDrawRectangle(PosX+((sx/S)*(slot-81)), PosY+(sy/S)*8, sx/S, sy/S, tocolor(r, g, b, 255))
				elseif(slot <= 100) then
					dxDrawRectangle(PosX+((sx/S)*(slot-91)), PosY+(sy/S)*9, sx/S, sy/S, tocolor(r, g, b, 255))
				elseif(slot <= 110) then
					dxDrawRectangle(PosX+((sx/S)*(slot-101)), PosY+(sy/S)*10, sx/S, sy/S, tocolor(r, g, b, 255))
				elseif(slot <= 120) then
					dxDrawRectangle(PosX+((sx/S)*(slot-111)), PosY+(sy/S)*11, sx/S, sy/S, tocolor(r, g, b, 255))
				elseif(slot <= 130) then
					dxDrawRectangle(PosX+((sx/S)*(slot-121)), PosY+(sy/S)*12, sx/S, sy/S, tocolor(r, g, b, 255))
				end
			end
			
			
			local PosX=0+(sx/S*11)

			for slot = 1, #ColorArray do
				local r,g,b = hex2rgb(ColorArray[slot])
				if(slot <= 10) then
					dxDrawRectangle(PosX+((sx/S)*(slot-1)), PosY, sx/S, sy/S, tocolor(r, g, b, 255))
				elseif(slot <= 20) then
					dxDrawRectangle(PosX+((sx/S)*(slot-11)), PosY+(sy/S), sx/S, sy/S, tocolor(r, g, b, 255))
				elseif(slot <= 30) then
					dxDrawRectangle(PosX+((sx/S)*(slot-21)), PosY+(sy/S)*2, sx/S, sy/S, tocolor(r, g, b, 255))
				elseif(slot <= 40) then
					dxDrawRectangle(PosX+((sx/S)*(slot-31)), PosY+(sy/S)*3, sx/S, sy/S, tocolor(r, g, b, 255))
				elseif(slot <= 50) then
					dxDrawRectangle(PosX+((sx/S)*(slot-41)), PosY+(sy/S)*4, sx/S, sy/S, tocolor(r, g, b, 255))
				elseif(slot <= 60) then
					dxDrawRectangle(PosX+((sx/S)*(slot-51)), PosY+(sy/S)*5, sx/S, sy/S, tocolor(r, g, b, 255))
				elseif(slot <= 70) then
					dxDrawRectangle(PosX+((sx/S)*(slot-61)), PosY+(sy/S)*6, sx/S, sy/S, tocolor(r, g, b, 255))
				elseif(slot <= 80) then
					dxDrawRectangle(PosX+((sx/S)*(slot-71)), PosY+(sy/S)*7, sx/S, sy/S, tocolor(r, g, b, 255))
				elseif(slot <= 90) then
					dxDrawRectangle(PosX+((sx/S)*(slot-81)), PosY+(sy/S)*8, sx/S, sy/S, tocolor(r, g, b, 255))
				elseif(slot <= 100) then
					dxDrawRectangle(PosX+((sx/S)*(slot-91)), PosY+(sy/S)*9, sx/S, sy/S, tocolor(r, g, b, 255))
				elseif(slot <= 110) then
					dxDrawRectangle(PosX+((sx/S)*(slot-101)), PosY+(sy/S)*10, sx/S, sy/S, tocolor(r, g, b, 255))
				elseif(slot <= 120) then
					dxDrawRectangle(PosX+((sx/S)*(slot-111)), PosY+(sy/S)*11, sx/S, sy/S, tocolor(r, g, b, 255))
				elseif(slot <= 130) then
					dxDrawRectangle(PosX+((sx/S)*(slot-121)), PosY+(sy/S)*12, sx/S, sy/S, tocolor(r, g, b, 255))
				end
			end	
		else -- Не в тюнинге
			for _, thePickup in pairs(getElementsByType("pickup", getRootElement(), true)) do
				local owner = getElementData(thePickup, "bizowner") or ""
				if(owner == getPlayerName(localPlayer)) then
					if(getElementData(thePickup, "money")) then
						local x,y,z = getElementPosition(thePickup)
						create3dtext("$"..getElementData(thePickup, "money"), x,y,z+0.5, NewScale*3, 60, tocolor(54, 228, 70, 70), "pricedown")
					end
				end
			end
		
			if(LainOS) then
				dxDrawImage(0, 0, screenWidth, screenHeight, VideoMemory["HUD"]["BlackScreen"])
			end

			if(PData["Interface"]["Collections"]) then
				local cposx, cposy = 100*NewScale, screenHeight/1.6
				for name, dat in pairs(PData["DisplayCollection"]) do
					dxDrawImage(cposx-(20*NewScale), cposy-(25*NewScale), 100*NewScale, 100*NewScale, VideoMemory["HUD"]["CollectionCircle"])

					dxDrawImage(cposx, cposy-(5*NewScale), 60*NewScale, 40*NewScale, items[name][1])
					dxDrawBorderedText(dat[1]-dat[2].."/"..dat[1], cposx+(165*NewScale), cposy+(35*NewScale), 0, 0, tocolor(255, 255, 255, 255), NewScale*1.5, "default-bold", "center", "top", nil, nil, nil, true)
					cposy = cposy-(100*NewScale)
				end
			end

			if(PData["Interface"]["Inventory"]) then
				DrawPlayerInventory()
			end
			
			
			dxDrawBorderedText(AddITimerText, 44*scalex, screenHeight-(60*scaley), screenWidth, screenHeight, tocolor(255, 255, 255, 255), scale, "sans")

			if(ZonesDisplay[1]) then
				if(not PData['Minimize']) then
					if(PData["Interface"]["AreaName"]) then
						dxDrawImage(screenWidth-(dxGetTextWidth(ZonesDisplay[1][1], NewScale*6, "default-bold", true)*1.15)-(25*scalex), screenHeight-(140*scaley), (dxGetTextWidth(ZonesDisplay[1][1], NewScale*6, "default-bold", true)*1.3), dxGetFontHeight(NewScale*4, "default-bold"), DrawLocation(ZonesDisplay[1][1]), 0, 0, 0, tocolor(255, 255, 255, ZonesDisplay[1][2]))
					end
				end

				if(tonumber(ZonesDisplay[1][3])) then
					if(ZonesDisplay[1][3] > 0) then
						ZonesDisplay[1][3] = ZonesDisplay[1][3]-5
						if(ZonesDisplay[1][3] <= 255) then
							ZonesDisplay[1][2] = ZonesDisplay[1][3]
						end
					else
						VideoMemory["HUD"]["LocationTarget"] = nil
						table.remove(ZonesDisplay, 1)
					end
				elseif(ZonesDisplay[1][2] < 255) then
					ZonesDisplay[1][2] = ZonesDisplay[1][2]+5
				elseif(ZonesDisplay[1][2] == 255) then
					if(ZonesDisplay[1][3] == "fast") then
						ZonesDisplay[1][3] = 255
					else
						ZonesDisplay[1][3] = 1200
					end
				end
			end
			
			if(PData['dialogPed']) then
				CreateTarget(PData['dialogPed'])
			end
			
			if(dialogTitle) then
				if(not isTimer(dialogActionTimer)) then
					dxDrawImage(0, 0, screenWidth, screenHeight, VideoMemory["HUD"]["Cinema"])
					dxDrawText(dialogTitle, 0, screenHeight/1.12, screenWidth, screenHeight, tocolor(255, 255, 255, 255), scale*1.2, "default-bold", "center", "top", nil, nil, nil, true)
				end
			end
					
			if(ToolTipText ~= "") then
				local linecount = 1
				for i in string.gfind(ToolTipText, "\n") do
				   linecount = linecount + 1
				end
				font = "default-bold"
				tw = dxGetTextWidth(ToolTipText, scale, font, true)+(26*scalex)
				th = (dxGetFontHeight(scale, font)*linecount)+(20*scaley)
				dxDrawRectangle(25*scalex, 325*scaley, tw, th, tocolor(0, 0, 0, 180))
				dxDrawText(ToolTipText, 25*scalex+(13*scalex), 325*scaley+(9*scaley), 0, 0, tocolor(255,255,255,255), scale, font, "left", "top", false, false, false, true)
			end
			
			
			local line = 1
			for v,k in pairs(GPSObject) do
				local x2,y2,z2 = getElementPosition(v)
				local dist = getDistanceBetweenPoints3D(x,y,z,x2,y2,z2)/2
				if(dist >= 1000) then
					dist = math.round((dist/1000), 1).." "..Text("км")
				else
					dist = math.round(dist, 0).." "..Text("м")
				end
				local _,_,rz = getElementRotation(localPlayer)
				local marrot = GetMarrot(findRotation(x,y,x2,y2),rz)
				if(x2 ~= 228 and y2 ~= 228 and z2 ~= 228) then
					if(not PData['Minimize']) then
						dxDrawImage(screenWidth-dxGetTextWidth(getElementData(v, "info").." #A9A9A9"..dist, scale, "default-bold", true)-(40*NewScale), screenHeight/2.7+(dxGetFontHeight(scale, "default-bold")*line), dxGetTextWidth("↑", scale, "default-bold", false), dxGetFontHeight(scale, "default-bold"), DrawArrow(), marrot)
					end
					dist = " #A9A9A9"..dist.."\n"
				else
					dist = ""
				end
				dxDrawBorderedText(getElementData(v, "info")..dist, 0, screenHeight/2.7+(dxGetFontHeight(scale, "default-bold")*line), screenWidth-(10*NewScale), screenHeight, tocolor(200, 200, 200, 255), scale, "default-bold", "right", "top", nil, nil, nil, true)
				line = line+1
			end
			
			if(PData['gps']) then
				local oldmarker = false
				local px,py,pz = getElementPosition(localPlayer)
				for i,v in pairs(PData['gps']) do --тут
					if(oldmarker) then
						local x,y,z = unpack(fromJSON(getElementData(v, "coord")))

						if(getDistanceBetweenPoints2D(x,y, px, py) < 100) then
							local x2,y2,z2 = unpack(fromJSON(getElementData(oldmarker, "coord")))

							local a3,b3,c3 = getPointInFrontOfPoint(x,y,z, findRotation(x,y,x2,y2)-60, 2)
							local a4,b4,c4 = getPointInFrontOfPoint(x,y,z, findRotation(x,y,x2,y2)-120, 2)
							
							dxDrawLine3D(x,y,z+0.2,a3,b3,c3+0.2, tocolor(50,150,200,80), 6)
							dxDrawLine3D(x,y,z+0.2,a4,b4,c4+0.2, tocolor(50,150,200,80), 6)
							dxDrawLine3D(a3,b3,c3+0.2,a4,b4,c4+0.2, tocolor(50,150,200,80), 6)
						end
					end
					oldmarker = v
				end
			end
			
	
			if(ShowInfo) then
				for i, arr in pairs(PData['changezone']) do
					local wx,wy,wz = false, false, false
					if(arr[2]) then
						wx,wy,wz = arr[2][1], arr[2][2], arr[2][3]
					else
						local _, _, worldx, worldy, worldz = getCursorPosition()
						local px, py, pz = getCameraMatrix()
						_,wx,wy,wz,_ = processLineOfSight(px, py, pz, worldx, worldy, worldz)
						wx,wy,wz = math.round(wx, 0), math.round(wy, 0), math.round(wz, 1)
						
					end
					local color = tocolor(50,150,200,80)
					if(arr[1][4] ~= getZoneName(wx,wy,wz, false)) then
						color = tocolor(200,50,50,80)
					end

					
					local point = {arr[1][1], wy, math.round(getGroundPosition(arr[1][1], wy, arr[1][3]+3), 1)}
					local point2 = {wx, arr[1][2], math.round(getGroundPosition(wx, arr[1][2], wz+3), 1)}
					
					dxDrawLine3D(arr[1][1], arr[1][2], arr[1][3], point[1], point[2], point[3], color, 25)
					
					dxDrawLine3D(point[1], point[2], point[3], wx,wy,wz, color, 25)

					dxDrawLine3D(wx,wy,wz, point2[1], point2[2], point2[3], color, 25)

					dxDrawLine3D(point2[1], point2[2], point2[3], arr[1][1], arr[1][2], arr[1][3], color, 25)
					
					
					local nx, ny = ((arr[1][1]-arr[2][1])/2), ((arr[1][2]-arr[2][2])/2)
					create3dtext('[ '..i..' ] ', arr[1][1]-nx, arr[1][2]-ny, arr[1][3]+2, scale, 60, tocolor(228, 70, 70, 180), "default-bold")

				end
				
				local material = GetGroundMaterial(x,y,z,z-2)
				local out = "Материал: "..material.."\nЗона: "..getZoneName(x,y,z)
				if(isCursorShowing()) then
					local x,y,z = getCameraMatrix()
					local sx,sy, cx,cy,cz = getCursorPosition()
					local theVehicle = getPedOccupiedVehicle(localPlayer)
					local _,_,_,_,hitElement,_,_,_,_,_,_,model = processLineOfSight(x,y,z, cx,cy,cz, true,true,true, true, true, true, false, true, false, true, false)
					
					dxDrawLine3D(x,y,z, cx,cy,cz)
					if(model) then
						out = out.."\nЭлемент: "..model
					end
				end
				dxDrawBorderedText(out, 10, screenHeight/3, 10, screenHeight, tocolor(255, 255, 255, 255), scale, "default-bold", "left", "top", nil, nil, nil, true)

				
				for zone, arr in pairs(PData['infopath']) do
					if(arr) then
					for i, arr2 in pairs(arr) do
						local x,y,z = arr2[2], arr2[3], arr2[4]
						
						local px,py,pz = getElementPosition(localPlayer)
						if(getDistanceBetweenPoints2D(x,y, px, py) < 100) then
							if(arr2[5]) then
								create3dtext('['..i..'] '..getZoneName(x,y,z), x,y,z+1, scale, 60, tocolor(228, 70, 250, 180), "default-bold")
							else
								create3dtext('['..i..'] '..getZoneName(x,y,z), x,y,z+1, scale, 60, tocolor(228, 250, 70, 180), "default-bold")
							end
							local nextmarkers = {}
							if(arr2[6]) then
								for _,k in pairs(arr2[6]) do
									table.insert(nextmarkers, {k[1], k[2]})
								end
							end
							
							if(PData['infopath'][zone][tostring(i+1)]) then
								table.insert(nextmarkers, {zone, i+1})
							end
							
							for _, arr3 in pairs(nextmarkers) do
								if(PData['infopath'][arr3[1]]) then
									local dat = PData['infopath'][arr3[1]][tostring(arr3[2])]
									if(dat) then
										local color = tocolor(50,255,50,150)
										if(dat[1] == "Closed" or arr2[1] == "Closed") then
											color = tocolor(255,50,50,150)
										end
										local x2,y2,z2 = dat[2], dat[3], dat[4]
										
										dxDrawLine3D(x,y,z+0.2,x2,y2,z2+0.2, color, 6)
										
										
										local a3,b3,c3 = getPointInFrontOfPoint(x2,y2,z2, findRotation(x,y,x2,y2)-60, 2)
										local a4,b4,c4 = getPointInFrontOfPoint(x2,y2,z2, findRotation(x,y,x2,y2)-120, 2)
										
										dxDrawLine3D(x2,y2,z2+0.2,a3,b3,c3+0.2, color, 6)
										dxDrawLine3D(x2,y2,z2+0.2,a4,b4,c4+0.2, color, 6)
									end
								end
							end
						end
					end
					end
				end
				
			
				for _, thePed in pairs(getElementsByType("ped", getRootElement(), true)) do
					local theVehicle = getPedOccupiedVehicle(thePed)
					if(theVehicle) then
						if(getElementData(thePed, "DynamicBot")) then
							local arr = fromJSON(getElementData(thePed, "DynamicBot"))
							local x,y,z = getElementPosition(theVehicle)
							path = {arr[1],arr[2],arr[3]}
							nextpath = {arr[5],arr[6],arr[7]}
							dxDrawLine3D(x,y,z,arr[1],arr[2],arr[3]+1, tocolor(255,50,50,150), 8)
						end
					end
				end
			end
			
			
		
			if(RobAction) then
				DrawProgressBar(screenWidth-430*scalex, 420*scaley, RobAction[1], RobAction[2], 250)
				local advtext = ""
				if(RobAction[2]) then
					advtext = "+"..(RobAction[2]/10).." "
				end
				dxDrawBorderedText(advtext.."ДАВЛЕНИЕ", screenWidth, 455*scaley, screenWidth-200*scalex, screenHeight, tocolor(255, 255, 255, 255), scale, "default-bold", "right", "top", nil, nil, nil, true)
			end
			
			if cameraimage then
				dxDrawImage(25*scale, 150*scale, 150*scale, 100*scale, cameraimage) -- Камера
			end
			

			if(HomeEditor) then
				dxDrawBorderedText("1: Трейлер\n2: Маленькая комната\n3: Дом 1 этаж (бедный)\n4: Дом 1 этаж (нормальный)\n5: Дом 1 этаж (богатый)\n6: Дом 2 этажа (бедный)\n7: Дом 2 этажа (нормальный)\n8: Дом 2 этаж (богатый)\n9: Special\n0: Гараж", 10, screenHeight/3, screenWidth, screenHeight, tocolor(255, 255, 255, 255), scale, "default-bold", "left", "top", false, false, false, true) 
			end
			
			if(PData["HarvestDisplay"]) then
				local HS = VehicleSpeed*10
				if(HS > 390) then HS = 390 end
				sx,sy = 400*NewScale, 40*NewScale
				dxDrawRectangle(screenWidth/2-(sx/2)-(2*NewScale), screenHeight/1.2-(sy/2)-(2*NewScale), sx+(4*NewScale),sy+(4*NewScale), tocolor(0, 0, 0, 150))
				dxDrawRectangle(screenWidth/2-(sx/2)+(175*NewScale), screenHeight/1.2-(sy/2), 50*NewScale,sy, tocolor(181, 212, 82, 200))
				
				dxDrawRectangle(screenWidth/2-(sx/2)+(HS*NewScale), screenHeight/1.2-(sy/2), 10*NewScale,sy, tocolor(255, 255, 255, 200))
				dxDrawRectangle(screenWidth/2-(sx/2)+(HS*NewScale), screenHeight/1.2+(sy/2), 10*NewScale, -(NewScale*PData["HarvestDisplay"]), tocolor(255, 153, 0, 255))
			end
			
			local wanted = getElementData(localPlayer, "WantedLevel") or ""
			local TotalDamage = getElementData(localPlayer, "Damage")
			if(PData["Interface"]["WantedLevel"]) then
				if(PData["WantedLevel"]) then
					if(PData["WantedLevel"] ~= wanted) then
						VideoMemory["HUD"]["Wanted"] = nil
						PData['WantedFlashing'] = setTimer(function() end, 100, 7)
					end
				end
				PData["WantedLevel"] = wanted
				local posx, posy = screenWidth-(screenWidth/4.5), screenHeight/3
				if(getPedStat(localPlayer, 24) <= 573) then posx, posy = screenWidth-(screenWidth/4.5), screenHeight/3.4 end
				if(tonumber(wanted)) then
					local flash = false
					if(isTimer(PData['WantedFlashing'])) then
						local _, executesRemaining, _ = getTimerDetails(PData['WantedFlashing'])
						if(math.fmod(executesRemaining, 2) ~= 0) then
							flash = true
						end
					end
				
					if(not PData['Minimize']) then
						wanted = tonumber(wanted)
						tw, _ = dxGetTextWidth("★★★★★★", scale, "pricedown", false), dxGetFontHeight(scale, "pricedown")
						
						dxDrawImage(posx, posy, dxGetTextWidth("★★★★★★", scale, "pricedown", false), dxGetFontHeight(scale, "pricedown"), VideoMemory["HUD"]["WantedBackground"])
						if(not flash) then
							dxDrawImage(posx+(tw*((6-wanted)/6)), posy, dxGetTextWidth("★★★★★★", scale, "pricedown", false), dxGetFontHeight(scale, "pricedown"), DrawWanted(wanted))
						end
					end
					if(TotalDamage) then
						MemText("Ущерб: $"..TotalDamage, posx+dxGetTextWidth("★★★★★★", scale, "pricedown", false), posy+dxGetFontHeight(scale, "pricedown"), tocolor(200, 0, 0, 210), NewScale*1.5, "default-bold", NewScale*1.5, 0, "right", false)
					end
				else
					dxDrawBorderedText(wanted, posx, posy, screenWidth, screenHeight, tocolor(200, 200, 200, 180), scale, "default-bold", "left", "top", nil, nil, nil, true)
				end
			end
		

		
			local theVehicle = getPedOccupiedVehicle(localPlayer)
			if(PData["Driver"] and theVehicle) then
				tick = getTickCount()
				local angulo,velocidad = angle()
				
				local tempBool = tick - (idleTime or 0) < 750
				if not tempBool and score ~= 0 then
					score = 0
				end
				
				if angulo ~= 0 then
					if tempBool then
						score = score + math.floor(angulo*velocidad)*mult
					else
						score = math.floor(angulo*velocidad)*mult
					end

					idleTime = tick
				end
				

				if tick - (idleTime or 0) < 50 then
					if(score > 500) then
						AddRage(1)
						RageInfo("Занос +"..math.round(score/100, 0))
					end
				end

				
				local vx, vy, vz = getElementVelocity(theVehicle)
				VehicleSpeed = (vx^2 + vy^2 + vz^2)^(0.5)*156

				local MaxRPM = GetVehicleMaxRPM(PData["Driver"]["Handling"]["engineAcceleration"])
				local RPMMeter = false
				local RPMDate = false 
				
				if(MaxRPM <= 4000) then
					RPMMeter = 45
					RPMDate = 4000
				elseif(MaxRPM > 4000 and MaxRPM <= 6000) then
					RPMMeter = 37.5
					RPMDate = 6000
				elseif(MaxRPM > 6000 and MaxRPM <= 7000) then
					RPMMeter = 32.1
					RPMDate = 7000
				elseif(MaxRPM > 7000 and MaxRPM <= 8000) then
					RPMMeter = 28
					RPMDate = 8000
				elseif(MaxRPM > 8000 and MaxRPM <= 10000) then
					RPMMeter = 22.5
					RPMDate = 10000
				elseif(MaxRPM > 10000 and MaxRPM <= 12000) then
					RPMMeter = 18.7
					RPMDate = 12000
				elseif(MaxRPM > 12000 and MaxRPM <= 14000) then
					RPMMeter = 16
					RPMDate = 14000
				elseif(MaxRPM > 14000 and MaxRPM <= 16000) then
					RPMMeter = 14
					RPMDate = 16000
				elseif(MaxRPM > 16000 and MaxRPM <= 18000) then
					RPMMeter = 12.5
					RPMDate = 18000
				elseif(MaxRPM > 18000 and MaxRPM <= 20000) then
					RPMMeter = 11.2
					RPMDate = 20000
				end
				
				if(RPMDate) then
					local RPM = (225*(getVehicleRPM(theVehicle, PData["Driver"]["Handling"]["engineAcceleration"], PData["Driver"]["Handling"]["dragCoeff"], PData["Driver"]["Handling"]["numberOfGears"])/RPMDate))
					local RedRPMZone = 225*((MaxRPM/RPMDate))
					if(SlowTahometer < RPM) then
						SlowTahometer = SlowTahometer+(RPM-SlowTahometer)/20
					elseif(SlowTahometer > RPM) then
						SlowTahometer = SlowTahometer-(SlowTahometer-RPM)/20
					end
					sx = screenWidth-(150*scalex)
					sy = screenHeight-(247*scaley)
					local TS = NewScale
					dxDrawCircle(sx,sy, 88*TS, 23*TS, 1, 0, 360, tocolor(0,0,0,5))
					dxDrawCircle(sx,sy, 100*TS, 5*TS, 4, 120, 120+RedRPMZone, tocolor(0,0,0,200))
					dxDrawCircle(sx,sy, 100*TS, 5*TS, 4, 120+RedRPMZone, 345, tocolor(255,51,51,200))
					dxDrawCircle(sx,sy, 100*TS, 5*TS, 4, 120, 120+math.floor(SlowTahometer), tocolor(255,255,255,255))
					if(getVehicleNitroCount(theVehicle)) then
						dxDrawCircle(sx,sy, 120*TS, 9*TS, 1, 118, 158, tocolor(0,0,0,20))
						dxDrawCircle(sx,sy, 120*TS, 5*TS, 4, 120, 157, tocolor(100,100,100,200))
						dxDrawCircle(sx,sy, 120*TS, 5*TS, 4, 120, 120+(3.7*getVehicleNitroCount(theVehicle)), tocolor(40,200,255,160))
					end
					
					dxDrawCircle(sx,sy, 120*TS, 9*TS, 1, 158, 345, tocolor(0,0,0,20)) -- тут
					dxDrawCircle(sx,sy, 120*TS, 5*TS, 4, 160, 344, tocolor(100,100,100,200))
					dxDrawCircle(sx,sy, 120*TS, 5*TS, 4, 160, 160+(184*(PData['rage']/1000)), tocolor(255,200,40,160))
					
					dxDrawCircle(sx,sy, 90*TS, 2*TS, RPMMeter, 120, 345, tocolor(255,255,255,255), nil, true)
					dxDrawCircle(sx,sy, 87*TS, 1*TS, 0.8, 120, 345, tocolor(255,255,255,255))
					
					dxDrawCircle(sx,sy, 30*TS, 35*TS, 1, 0, 360, tocolor(0,0,0,20))
					dxDrawText(getVehicleGear(theVehicle, PData["Driver"]["Handling"]["engineAcceleration"], PData["Driver"]["Handling"]["dragCoeff"], PData["Driver"]["Handling"]["numberOfGears"]), sx,sy-(30*scaley),sx,sy-(30*scaley), tocolor(255,255,255,255), scale*2.5, "default-bold", "center", "center")

					if(getElementData(theVehicle, "Fuel")) then
						local handlingTable = getOriginalHandling(getElementModel(theVehicle))
						dxDrawCircle(sx,sy, 90*TS, 4*TS, 1, 10, 90, tocolor(0,0,0,60))
						local maxfuel = math.floor(handlingTable["mass"]/30)
						dxDrawCircle(sx,sy, 90*TS, 4*TS, 1, 10+math.floor(80-(80*(getElementData(theVehicle, "Fuel")/maxfuel))), 90, tocolor(255,255,255,60))
					end

					dxDrawText(string.format("%03.f", VehicleSpeed), sx,sy+(15*scaley),sx,sy+(15*scaley), tocolor(120,120,120,255), scale*1.25, "default-bold", "center", "center")
					dxDrawText(Text("КМ/Ч"), sx,sy+(45*scaley),sx,sy+(45*scaley), tocolor(120,120,120,255), scale/1.5, "default-bold", "center", "center")
				
					if(PData["Race"]) then
						local pos = GetRacePosition()
						dxDrawRectangle(sx-(327*scalex),sy-(82*scaley), 139*NewScale, 154*NewScale, tocolor(0,0,0))
						dxDrawRectangle(sx-(325*scalex),sy-(80*scaley), 135*NewScale, 150*NewScale, tocolor(121,137,153))
						dxDrawRectangle(sx-(320*scalex),sy-(75*scaley), 125*NewScale, 140*NewScale, tocolor(0,0,0))
						dxDrawText(pos, sx-(305*scalex),sy-(82*scaley),0,0, tocolor(121,137,153,255), NewScale*7, "default-bold", "left", "top")
						dxDrawText(PosVar[pos] or "ый", sx-(255*scalex),sy-(70*scaley),0,0, tocolor(121,137,153,255), NewScale*3, "default-bold", "left", "top")
						dxDrawText("/"..#PData["Race"]["Racers"], sx-(255*scalex),sy-(35*scaley),0,0, tocolor(121,137,153,255), NewScale*3, "default-bold", "left", "top")
						
						local seconds = (getTickCount()-PData["Race"]["Start"])/1000
						local hours = math.floor(seconds/3600)
						local mins = math.floor(seconds/60 - (hours*60))
						local secs = math.floor(seconds - hours*3600 - mins *60)
						local msec =  math.floor(((getTickCount()-PData["Race"]["Start"])-(secs*1000)-(mins*60000)-(hours*3600000))/10)
						dxDrawText(string.format("%02.f", mins)..":"..string.format("%02.f", secs), sx-(257*scalex), sy+(5*scaley), sx-(257*scalex), sy+(5*scaley), tocolor(121,137,153,255), NewScale*3, "default-bold", "center", "top")

					end
				end
				
				local hardtruck = theVehicle
				if(getVehicleTowedByVehicle(theVehicle)) then
					hardtruck = getVehicleTowedByVehicle(theVehicle)
				end
				
				if(getElementData(hardtruck, "product")) then
					ChangeInfo("Груз: "..getElementData(hardtruck, "product").."\nСостояние: "..math.floor(getElementHealth(hardtruck)/10).."%")
				end			
			end
		end
	else
		tw = dxGetTextWidth(PlayerChangeSkinTeam, scale*1.4, "bankgothic", true)
		th = dxGetFontHeight(scale*1.4, "bankgothic")
		dxDrawBorderedText(PlayerChangeSkinTeam, screenWidth/2-tw/2.15, screenHeight-(screenHeight-th/10), screenWidth, screenHeight, tocolor(255, 255, 255, 255), scale*1.4, "bankgothic", nil, nil, nil, nil, nil, true)
		
		
		tw = dxGetTextWidth(PlayerChangeSkinTeamRang, scale/1.2, "bankgothic", true)
		th = dxGetFontHeight(scale*1, "bankgothic")
		dxDrawBorderedText(PlayerChangeSkinTeamRang, screenWidth/2-tw/2.15, screenHeight-(screenHeight-th*1.5), screenWidth, screenHeight, tocolor(255, 255, 255, 255), scale/1.2, "bankgothic", nil, nil, nil, nil, nil, true)
		

		th = dxGetFontHeight(scale*2, "sans")
		tw = dxGetTextWidth(PlayerChangeSkinTeamRespect, scale*2, "sans", true)
		dxDrawBorderedText(PlayerChangeSkinTeamRespect, screenWidth/2-tw/2.15, screenHeight-(th*2.5), screenWidth, screenHeight, tocolor(255, 255, 255, 255), scale*2, "sans", nil, nil, nil, nil, nil, true)
		tw = dxGetTextWidth(PlayerChangeSkinTeamRespectNextLevel, scale*2, "sans", true)
		dxDrawBorderedText(PlayerChangeSkinTeamRespectNextLevel, screenWidth/2-tw/2.15, screenHeight-(th*1.5), screenWidth, screenHeight, tocolor(255, 255, 255, 255), scale*2, "sans", nil, nil, nil, nil, nil, true)
	end
	
	if(PING or RespectMsg) then
		local teams = {"Мирные жители", "Вагос", "Баллас", "Уголовники", "Полиция", "Гроув-стрит"}
		
		local FH = dxGetFontHeight(scale, "clear")*1.1
		local idouble = 0
		if(RespectMsg and not PING) then
			for v, key in pairs (RespectMsg) do
				if(tonumber(v)) then
					v=tonumber(v)
					dxDrawBorderedText(Text(SkillName[v]), 0, 530*scaley+(FH*(idouble)), screenWidth-170*scalex, 0, tocolor(255, 255, 255, 255), scale, "clear", "right", "top", false, false, false, true)
					DrawProgressBar(screenWidth-160*scalex, 530*scaley+(FH*(idouble)), getPedStat(localPlayer, v), key, 150)
				else
					dxDrawBorderedText(getTeamGroupColor(v)..Text(getTeamGroup(v)), 0, 530*scaley+(FH*(idouble)), screenWidth-170*scalex, 0, tocolor(255, 255, 255, 255), scale, "clear", "right", "top", false, false, false, true)
					DrawProgressBar(screenWidth-160*scalex, 530*scaley+(FH*(idouble)), 500+(getTeamVariable(v)/2), key, 150)
				end
				idouble=idouble+1
			end
		else
			for i, v in pairs (teams) do
				dxDrawBorderedText(getTeamGroupColor(v)..Text(getTeamGroup(v)), 0, 530*scaley+(FH*(i-1)), screenWidth-170*scalex, 0, tocolor(255, 255, 255, 255), scale, "clear", "right", "top", false, false, false, true)
				DrawProgressBar(screenWidth-160*scalex, 530*scaley+(FH*(i-1)), 500+(getTeamVariable(v)/2), nil, 150)
			end
		end
		

		if(PING) then
			dxDrawImage(0,0,screenWidth,screenHeight, VideoMemory["HUD"]["TABPanel"])

	
			dxDrawBorderedText(Text("Игроков")..": "..#getElementsByType("player"), 0, 285*scaley, 510*scalex+(730*NewScale), 0, tocolor(180, 180, 180, 255), NewScale*1.2, "default-bold", "right", "top", false, false, false, true)
		
			dxDrawBorderedText(IDF,510*scalex+(15*NewScale), 335*scaley, 0, 0, tocolor(255, 255, 255, 255), NewScale*1.2, "default-bold", "left", "top", false, false, false, true)
			dxDrawBorderedText(NF, 510*scalex+(60*NewScale), 335*scaley, 0, 0, tocolor(255, 255, 255, 255), NewScale*1.2, "default-bold", "left", "top", false, false, false, true)
			dxDrawBorderedText(RANG, 510*scalex+(300*NewScale), 335*scaley, 0, 0, tocolor(255, 255, 255, 255), NewScale*1.2, "default-bold", "left", "top", false, false, false, true)
			dxDrawBorderedText(PING, 510*scalex+(710*NewScale), 335*scaley, 0, 0, tocolor(255, 255, 255, 255), NewScale*1.2, "default-bold", "left", "top", false, false, false, true)
		
			
			
			if(getTeamVariable("Мирные жители")) then
				local count=0
				
				dxDrawText(Text(SkillName[24]),  490*scalex, 840*scaley+((35*scaley)*count), 0, 0, tocolor(255, 255, 255, 255), NewScale*2, "default-bold", "left", "top", false, false, false, true)
				DrawProgressBar(780*scalex,840*scaley+((35*scaley)*count), getPedStat(localPlayer, 24), nil, 150)
				count=count+1
				
				local Skill = false
				if(theVehicle) then
					local VehType = GetVehicleType(theVehicle)
					Skill = VehTypeSkill[VehType]
					if(Skill == 160) then
						if(string.sub(getVehiclePlateText(theVehicle), 0, 1) == "I" and string.sub(getVehiclePlateText(theVehicle), 6, 9) == "228") then
							Skill = 161
						end
					end
					dxDrawText(Text(SkillName[Skill]),  490*scalex, 840*scaley+((35*scaley)*count), 0, 0, tocolor(255, 255, 255, 255), NewScale*2, "default-bold", "left", "top", false, false, false, true)
					DrawProgressBar(780*scalex,840*scaley+((35*scaley)*count), getPedStat(localPlayer, Skill), nil, 150)
				else
					if(PData["fishpos"]) then
						Skill = 157
					else
						Skill = 22
					end
					dxDrawText(Text(SkillName[Skill]),  490*scalex, 840*scaley+((35*scaley)*count), 0, 0, tocolor(255, 255, 255, 255), NewScale*2, "default-bold", "left", "top", false, false, false, true)
					DrawProgressBar(780*scalex,840*scaley+((35*scaley)*count), getPedStat(localPlayer, Skill), nil, 150)
				end
				count=count+1
				
				local weapon = getPedWeapon(localPlayer, slot) 
				if(SkillName[WeaponModel[weapon][2]]) then
					dxDrawText(Text(SkillName[WeaponModel[weapon][2]]), 490*scalex, 840*scaley+((35*scaley)*count), 0, 0, tocolor(255, 255, 255, 255), NewScale*2, "default-bold", "left", "top", false, false, false, true)
					DrawProgressBar(780*scalex, 840*scaley+((35*scaley)*count), getPedStat(localPlayer, WeaponModel[weapon][2]), nil, 150)
				end
				dxDrawBorderedText(ServerDate.monthday.." "..Text(Month[ServerDate.month+1]).." "..ServerDate.year+1900, 490*scalex, 960*scaley, 0, 0, tocolor(200, 200, 200, 255), NewScale*2.4, "default-bold", "left", "top", nil, nil, nil, true)		
				

				dxDrawBorderedText(Text(Day[ServerDate.weekday+1]), screenWidth, 960*scaley, 930*scalex, screenHeight, tocolor(200, 200, 200, 255), NewScale*2.4, "default-bold", "right", "top", nil, nil, nil, true)		
			end
		end
	elseif(PEDChangeSkin == "nowTime") then
		dxDrawRectangle(0,0,screenWidth, screenHeight, tocolor(255,255,255,255))
	elseif(PEDChangeSkin == "intro") then
		dxDrawImage(0, 0, screenWidth, screenHeight, VideoMemory["HUD"]["BlackScreen"])
		dxUpdateScreenSource(screenSource)    
		local speed2 = 100
		for i, key in pairs(screenSaver) do
			sx = (key[1]*(key[9]/speed2))+(key[5]-(key[5]*(key[9]/speed2)))
			local sy = (key[2]*(key[9]/speed2))+(key[6]-(key[6]*(key[9]/speed2)))
			if(key[8]) then
				DrawZast(sx,sy, key[3], key[4], key[1],key[2], screenSource)
				
				if(key[9] < speed2) then
					key[9]=key[9]+1
				else
					key[8] = false
					key[7] = false
				end
			else
				dxDrawBorderedText("#FF9800"..Text("Благодарности").."\n#FFFFFFCrystalMV #69749Abone_attach\n#FFFFFFPioner #69749Aперевод на азербайджанский\n#FFFFFF*Vk*Ricci #69749Aперевод на английский\n\n#C7843C"..Text("Над сервером работали").."#FFFFFF\n800 #194299real_life@sibmail.com#FFFFFF 2006-2011\nTanker #194299tankerktv@mail.ru#FFFFFF 2006-2009\nDark_ALEX #194299dark_alex@sibmail.com#FFFFFF 2009-2017\nMishel' #194299laym101@mail.com#FFFFFF 2017", screenWidth, screenHeight-(340*NewScale), screenWidth-(30*NewScale), screenHeight, tocolor(103,104,107, 255), NewScale*2, "default-bold", "right", "top", false, false, false, true)
				
				local x2, y2, z2, lx, ly, lz, rz = getCameraMatrix ()
				setCameraMatrix (x2+0.0005, y2+0.0005, z2+0.00005, lx+0.0005, ly+0.0005, lz)
				DrawZast(key[1],key[2], key[3], key[4], key[1],key[2], screenSource)
				sx = key[1]
				sy = key[2]
				if(key[9] > 0) then
					key[9]=key[9]-0.1
				else
					setCameraMatrix (1698.9, -1538.9, 13.4, 1694.2, -1529, 13.5)
					key[8] = true
					key[7] = true
				end
			end
			
			if(i == 1) then
				DrawTriangle(sx+(key[3])-(130*scalex), sy, sx+(key[3]), sy+key[4], tocolor(0,0,0,255))
			elseif(i == 4) then
				DrawTriangle(sx+(key[3])-(10*scalex), sy, sx+(key[3]), sy+key[4], tocolor(0,0,0,255))
			elseif(i == 5) then
				DrawTriangle(sx+(50*scalex), sy, sx+(key[3]), sy+key[4]-(30*scaley), tocolor(0,0,0,255))
				DrawTriangle(sx+key[3]-(20*scalex), sy+key[4]-(60*scaley), sx+(key[3])-(10*scalex), sy+key[4], tocolor(0,0,0,255))
				dxDrawRectangle(sx+key[3]-(10*scalex), sy+key[4]-(60*scaley), 30*scalex, 61*scaley, tocolor(0,0,0,255))
			elseif(i == 3) then
				DrawTriangle(sx, sy+(20*scaley), sx+(key[3]), sy, tocolor(0,0,0,255))
			elseif(i == 2) then
				DrawTriangle(sx, sy+(key[4]), sx+(key[3]), sy+(key[4])-(17*scaley), tocolor(0,0,0,255), true)
			end
		end
	elseif(PEDChangeSkin == "cinema") then
		dxDrawImage(0, 0, screenWidth, screenHeight, VideoMemory["HUD"]["Cinema"])
	else
		if(PData["wasted"]) then
			local Block, Anim = getPedAnimation(localPlayer)
			if(isPedDoingTask(localPlayer, "TASK_SIMPLE_DEAD") or Anim == "handsup") then
				dxDrawBorderedText(PData["wasted"], 0, 0, screenWidth, screenHeight, tocolor(255, 255, 255, 255), scale*5, "clear", "center", "center", nil, nil, nil, true)

				if(not RespawnTimer) then
					fadeCamera(false, 3.0, 230, 230, 230)
					RespawnTimer = setTimer(triggerServerEvent, 7000, 1, "SpawnthePlayer", localPlayer, localPlayer, "death")
				end
			end
		end
	end

	if(PText["HUD"][8]) then
		dxDrawRectangle(screenWidth/2-(150*scaley), screenHeight-(660*scalex), 300*NewScale, 150*NewScale, tocolor(233, 165, 58, 180))	
		if(BindedKeys["enter"][3][1] == "loginPlayerEvent") then
			local text = ""
			for _ = 1, #BindedKeys["enter"][3][4] do
				text = text.."*"
			end
			dxDrawBorderedText(text.."|", screenWidth/2-(120*scaley), screenHeight-(580*scalex), 0, 0, tocolor(0, 0, 0, 255), NewScale*2, "sans", "left", "top", false, false, false, true, true, 0, 0, 0)
		else
			dxDrawBorderedText(BindedKeys["enter"][3][4].."|", screenWidth/2-(120*scaley), screenHeight-(580*scalex), 0, 0, tocolor(0, 0, 0, 255), NewScale*2, "sans", "left", "top", false, false, false, true, true, 0, 0, 0)
		end
	end
	
	for name,arr in pairs(PText) do
		for i,el in pairs(arr) do
			color = el[6]
			th = dxGetFontHeight(el[7], el[8])
			tw = dxGetTextWidth(el[1], el[7], el[8], true)
			
			if(MouseX-el[2] <= tw and MouseX-el[2] >= 0) then
				if(MouseY-el[3] <= th and MouseY-el[3] >= 0) then
					if(el[20]) then
						color = tocolor(255,0,0,255)
					end
				end
			end
			
			if(el[19]["border"]) then
				dxDrawBorderedText(el[1], el[2], el[3], el[4], el[5], color, el[7], el[8], el[9], el[10], el[11], el[12], el[13], el[14], el[15], el[16], el[17], el[18])
			else
				dxDrawText(el[1], el[2], el[3], el[4], el[5], color, el[7], el[8], el[9], el[10], el[11], el[12], el[13], el[14], el[15], el[16], el[17], el[18])
			end
			
			if(el[19]["line"]) then
				dxDrawLine(el[2], el[3]+th, el[2]+tw, el[3]+th, color, 1, el[13])
			end
		end
	end
end
addEventHandler("onClientHUDRender", getRootElement(), DrawPlayerMessage)



function SmoothCameraMove(x,y,z,x2,y2,z2,times,targetafter)
	PData['CameraMove'] = {}
	local x1, y1, z1, lx1, ly1, lz1 = getCameraMatrix()
	PData['CameraMove']['sourcePosition'] = {x1, y1, z1, lx1, ly1, lz1}
	PData['CameraMove']['needPosition'] = {x,y,z,x2,y2,z2}
	
	PData['CameraMove']['timer'] = setTimer(function(targetafter)
		if(targetafter) then
			setCameraTarget(localPlayer)
		end
		PData['CameraMove'] = nil
	end, times, 1, targetafter)
end




function RageInfo(info)
	if(isTimer(PData['rageinfotimer'])) then killTimer(PData['rageinfotimer']) end
	PText["HUD"][9] = {info, 0, 910*NewScale, screenWidth-230*NewScale, 0, tocolor(255,232,25,200), NewScale*2, "default-bold", "right", "top", false, false, false, true, true, 0, 0, 0, {["border"] = true}}
	PData['rageinfotimer'] = setTimer(function() 
		PText["HUD"][9] = nil
	end, 2000, 1)
end

function AddRage(count)
	if(count < 0) then
		count = count+(count*((1000-getPedStat(localPlayer, 160))/200))
	end
	if(PData['rage']+count < 0) then
		if(isTimer(PData['ragetimer'])) then killTimer(PData['ragetimer']) end
		triggerServerEvent("AccelerationDown", localPlayer, localPlayer)
		PData['rage'] = 0
	elseif(PData['rage'] + count > 1000) then
		PData['rage'] = 1000
	else
		PData['rage'] = PData['rage'] + count
	end
end


function GetMarrot(angle, rz)
	local marrot = 0
	if(angle > rz) then
		marrot = -(angle-rz)
	else
		marrot = rz-angle
	end
	
	if(marrot > 180) then
		marrot = marrot-360
	elseif(marrot < -180) then
		marrot = marrot+360
	end
	return marrot
end


--[Имя] = {id модели, {scale, vehx, vehy, vehz, vehrx, vehry, vehrz}}
local itemsData = {
	["Запаска"] = {1025, {0.6, 0, 0, 0, 180, 90, 0}}, 
	["АК-47"] = {355, {0.7, -0.1, -0.15, -0.05, 270, 0, 30}}, 
	["М16"] = {356, {0.7, -0.1, -0.15, -0.05, 270, 0, 30}},	
	["Пакет"] = {2663, {1, 0, 0, 0, 90, 180, 0}}, 
	["Зерно"] = {1453, {0.6, 0, 0, -0.1, 90, 90, 90}}, 
	["Огнетушитель"] = {366, {0.7, -0.1, -0.15, -0.05, 270, 0, 30}}, 
	["Нефть"] = {3632, {0.6, 0, 0, -0.1, 90, 90, 90}}, 
	["Пропан"] = {1370, {0.6, 0, 0, -0.1, 90, 90, 90}}, 
	["Химикаты"] = {1218, {0.6, 0, 0, -0.1, 90, 90, 90}}, 
	["Удобрения"] = {1222, {0.6, 0, 0, -0.1, 90, 90, 90}}, 
	["Бензин"] = {1225, {0.6, 0, 0, -0.1, 90, 90, 90}}, 
	["Алкоголь"] = {2900, {0.5, 0, 0, -0.1, 90, 90, 90}}, 
}


--{+x,+y,+z}
local VehicleTrunks = {
	[400] = {{-0.6, -1.4, 0.1, 60, 0, 0}, {0, -1.4, 0.1, 60, 0, 0}, {0.6, -1.4, 0.1, 60, 0, 0}, {-0.6, -1.9, -0.08, 10, 0, 0}, {0, -1.9, -0.08, 10, 0, 0}, {0.6, -1.9, -0.08, 10, 0, 0}},
	[401] = {{-0.4, -2.1, 0.15, 10, 0, 0}, {0.4, -2.1, 0.15, 10, 0, 0}},
	[402] = {{-0.6, -2.2, 0.15, 0, 0, 0}, {0, -2.2, 0.15, 0, 0, 0}, {0.6, -2.2, 0.15, 0, 0, 0}},
	[403] = false,
	[404] = {{-0.6, -1.7, 0.2, 0, 0, 0}, {0, -1.7, -0.07, 0, 0, 0}, {0.6, -1.7, 0.2, 0, 0, 0}, {-0.6, -2.2, -0.07, 0, 0, 0}, {0, -2.2, -0.07, 0, 0, 0}, {0.6, -2.2, -0.07, 0, 0, 0}},
	
	[412] = {{-0.6, -2.4, -0.05, 10, 0, 0}, {0, -2.4, -0.05, 10, 0, 0}, {0.6, -2.4, -0.05, 10, 0, 0}, {-0.6, -3.0, -0.05, 10, 0, 0}, {0, -3.0, -0.05, 10, 0, 0}, {0.6, -3.0, -0.05, 10, 0, 0}},

	[419] = {{-0.6, -2.4, -0.05, 10, 0, 0}, {0, -2.4, -0.05, 10, 0, 0}, {0.6, -2.4, -0.05, 10, 0, 0}},
	
	[422] = {
		{-0.6, -0.7, -0.1, 0, 0, 0}, {0, -0.7, -0.1, 0, 0, 0}, {0.6, -0.7, -0.1, 0, 0, 0}, 
		{-0.6, -1.3, -0.1, 0, 0, 0}, {0, -1.3, -0.1, 0, 0, 0}, {0.6, -1.3, -0.1, 0, 0, 0},
		{-0.6, -2, -0.1, 0, 0, 0}, {0, -2, -0.1, 0, 0, 0}, {0.6, -2, -0.1, 0, 0, 0},
	},
	
	[439] = {{-0.6, -2.2, -0.05, 10, 0, 0}, {0, -2.2, -0.05, 10, 0, 0}, {0.6, -2.2, -0.05, 10, 0, 0}},
	
	[442] = false,
	[443] = false,
	[444] = false,
	[445] = {{-0.6, -2.5, -0.05, 10, 0, 0}, {0, -2.5, -0.05, 10, 0, 0}, {0.6, -2.5, -0.05, 10, 0, 0}},
	[446] = false, 
	[447] = false, 
	[448] = false, 
	[449] = false,
	[450] = false, 
	[451] = false, 
	[452] = false, 
	[453] = false,
	[454] = false, 
	[455] = {
		{-1, -0.2, 0.2, 0, 0, 0}, {-0.5, -0.2, 0.2, 0, 0, 0}, {0.5, -0.2, 0.2, 0, 0, 0}, {1, -0.2, 0.2, 0, 0, 0}, 
		{-1, -0.9, 0.2, 0, 0, 0}, {-0.5, -0.9, 0.2, 0, 0, 0}, {0.5, -0.9, 0.2, 0, 0, 0}, {1, -0.9, 0.2, 0, 0, 0}, 
		{-1, -1.6, 0.2, 0, 0, 0}, {-0.5, -1.6, 0.2, 0, 0, 0}, {0.5, -1.6, 0.2, 0, 0, 0}, {1, -1.6, 0.2, 0, 0, 0}, 
		{-1, -2.2, 0.2, 0, 0, 0}, {-0.5, -2.2, 0.2, 0, 0, 0}, {0.5, -2.2, 0.2, 0, 0, 0}, {1, -2.2, 0.2, 0, 0, 0}, 
		{-1, -2.9, 0.2, 0, 0, 0}, {-0.5, -2.9, 0.2, 0, 0, 0}, {0.5, -2.9, 0.2, 0, 0, 0}, {1, -2.9, 0.2, 0, 0, 0}, 
		{-1, -3.6, 0.2, 0, 0, 0}, {-0.5, -3.6, 0.2, 0, 0, 0}, {0.5, -3.6, 0.2, 0, 0, 0}, {1, -3.6, 0.2, 0, 0, 0}, 
		{-1, -4.1, 0.2, 0, 0, 0}, {-0.5, -4.1, 0.2, 0, 0, 0}, {0.5, -4.1, 0.2, 0, 0, 0}, {1, -4.1, 0.2, 0, 0, 0}, 
		
	},
	[456] = {
		{-0.6, -0.3, 0.25, 0, 0, 0}, {0, -0.3, 0.25, 0, 0, 0}, {0.6, -0.3, 0.25, 0, 0, 0}, 
		{-0.6, -1, 0.25, 0, 0, 0}, {0, -1, 0.25, 0, 0, 0}, {0.6, -1, 0.25, 0, 0, 0}, 
		{-0.6, -1.7, 0.25, 0, 0, 0}, {0, -1.7, 0.25, 0, 0, 0}, {0.6, -1.7, 0.25, 0, 0, 0}, 
		{-0.6, -2.2, 0.25, 0, 0, 0}, {0, -2.2, 0.25, 0, 0, 0}, {0.6, -2.2, 0.25, 0, 0, 0}
	}, 
	[457] = false,
	[458] = {{-0.6, -1.7, 0, 0, 0, 0}, {0, -1.7, 0, 0, 0, 0}, {0.6, -1.7, 0, 0, 0, 0}, {-0.6, -2.3, 0, 0, 0, 0}, {0, -2.3, 0, 0, 0, 0}, {0.6, -2.3, 0, 0, 0, 0}},
	[459] = {
		{-0.6, -0.3, -0.07, 0, 0, 0}, {0, -0.3, -0.07, 0, 0, 0}, {0.6, -0.3, -0.07, 0, 0, 0}, 
		{-0.6, -1, -0.07, 0, 0, 0}, {0, -1, -0.07, 0, 0, 0}, {0.6, -1, -0.07, 0, 0, 0}, 
		{-0.6, -1.7, -0.07, 0, 0, 0}, {0, -1.7, -0.07, 0, 0, 0}, {0.6, -1.7, -0.07, 0, 0, 0}, 
		{-0.6, -2.2, -0.07, 0, 0, 0}, {0, -2.2, -0.07, 0, 0, 0}, {0.6, -2.2, -0.07, 0, 0, 0}
	}, 
	[460] = false,
	[461] = false,
	[462] = false, 
	[463] = false, 
	[464] = false, 
	[465] = false, 
	[466] = {{-0.6, -2.3, -0.05, 0, 0, 0}, {0, -2.3, -0.05, 0, 0, 0}, {0.6, -2.3, -0.05, 0, 0, 0}},
	[467] = {{-0.5, -2.3, -0.05, 0, 0, 0}, {0, -2.3, -0.05, 0, 0, 0}, {0.5, -2.3, -0.05, 0, 0, 0}},
	[468] = false,
	[469] = false,
	[470] =  {{-0.8, -2, 0.25, 10, 0, 0}, {0, -2, 0.1, 10, 0, 0}, {0.8, -2, 0.25, 10, 0, 0}},
	[471] = false, 
	[472] = false,
	[473] = false,
	[474] = {{-0.6, -2.5, -0.15, 10, 0, 0}, {0, -2.5, -0.15, 10, 0, 0}, {0.6, -2.5, -0.15, 10, 0, 0}},
	[475] = {{-0.6, -2.3, -0.05, 10, 0, 0}, {0, -2.3, -0.05, 10, 0, 0}, {0.6, -2.3, -0.05, 10, 0, 0}},
	
	[478] = {{-0.6, -0.9, 0, 0, 0, 0}, {0, -0.9, -0, 0, 0, 0}, {0.6, -0.9, 0, 0, 0, 0}, {-0.6, -1.6, 0, 0, 0, 0}, {0, -1.6, 0, 0, 0, 0}, {0.6, -1.6, 0, 0, 0, 0}, {-0.6, -2.2, 0, 0, 0, 0}, {0, -2.2, 0, 0, 0, 0}, {0.6, -2.2, 0, 0, 0, 0}},

	[480] = {{-0.5, -1.8, 0, 10, 0, 0}, {0, -1.8, 0, 10, 0, 0}, {0.5, -1.8, 0, 10, 0, 0}},

	[489] = {{-0.6, -1.7, 0.2, 0, 0, 0}, {0, -1.7, -0.07, 0, 0, 0}, {0.6, -1.7, 0.2, 0, 0, 0}, {-0.6, -2.2, -0.07, 0, 0, 0}, {0, -2.2, -0.07, 0, 0, 0}, {0.6, -2.2, -0.07, 0, 0, 0}},
	[490] = {{-0.5, -1.7, -0.05, 10, 0, 0}, {0, -1.7, -0.05, 10, 0, 0}, {0.5, -1.7, -0.05, 10, 0, 0}},
	
	[495] = {{-0.6, -1, -0.1, 0, 0, 0}, {0, -1, -0.1, 0, 0, 0}, {0.6, -1, -0.1, 0, 0, 0}, {-0.6, -1.7, -0.1, 0, 0, 0}, {0, -1.7, -0.1, 0, 0, 0}, {0.6, -1.7, -0.1, 0, 0, 0}},
	[496] = {{-0.5, -1.7, -0.05, 10, 0, 0}, {0, -1.7, -0.05, 10, 0, 0}, {0.5, -1.7, -0.05, 10, 0, 0}},
	
	[505] = {{-0.5, -1.7, -0.05, 10, 0, 0}, {0, -1.7, -0.05, 10, 0, 0}, {0.5, -1.7, -0.05, 10, 0, 0}},
	
	[517] = {{-0.5, -2.3, -0.05, 0, 0, 0}, {0, -2.3, -0.05, 0, 0, 0}, {0.5, -2.3, -0.05, 0, 0, 0}},
	[518] = {{-0.5, -2.3, -0.05, 0, 0, 0}, {0, -2.3, -0.05, 0, 0, 0}, {0.5, -2.3, -0.05, 0, 0, 0}},
	
	[533] = {{-0.6, -2, 0.1, 10, 0, 0}, {0, -2, 0.1, 10, 0, 0}, {0.6, -2, 0.1, 10, 0, 0}},
	[534] = {{-0.6, -2.3, -0, 10, 0, 0}, {0, -2.3, 0, 10, 0, 0}, {0.6, -2.3, 0, 10, 0, 0}},
	[535] = false, 
	[536] = {{-0.6, -2.6, -0, 10, 0, 0}, {0, -2.6, 0, 10, 0, 0}, {0.6, -2.6, 0, 10, 0, 0}},
	
	[542] = {{-0.6, -2.5, 0.1, 10, 0, 0}, {0, -2.5, 0.1, 10, 0, 0}, {0.6, -2.5, 0.1, 10, 0, 0}},
	[543] = {{-0.6, -0.9, 0, 0, 0, 0}, {0, -0.9, -0, 0, 0, 0}, {0.6, -0.9, 0, 0, 0, 0}, {-0.6, -1.6, 0, 0, 0, 0}, {0, -1.6, -0, 0, 0, 0}, {0.6, -1.6, 0, 0, 0, 0}, {-0.6, -2.2, 0, 0, 0, 0}, {0, -2.2, 0, 0, 0, 0}, {0.6, -2.2, 0, 0, 0, 0}},
	
	[549] = {{-0.5, -2.1, 0.06, 0, 0, 0}, {0, -2.1, 0.06, 0, 0, 0}, {0.5, -2.1, 0.06, 0, 0, 0}},
	
	[554] = {{-0.6, -0.9, 0, 0, 0, 0}, {0, -0.9, -0, 0, 0, 0}, {0.6, -0.9, 0, 0, 0, 0}, {-0.6, -1.6, 0, 0, 0, 0}, {0, -1.6, -0, 0, 0, 0}, {0.6, -1.6, 0, 0, 0, 0}, {-0.6, -2.2, 0, 0, 0, 0}, {0, -2.2, 0, 0, 0, 0}, {0.6, -2.2, 0, 0, 0, 0}}, 
	[555] = {{-0.5, -1.9, -0.08, 0, 0, 0}, {0, -1.9, -0.08, 0, 0, 0}, {0.5, -1.9, -0.08, 0, 0, 0}},

	[558] = {{-0.5, -2.1, 0.3, 0, 0, 0}, {0, -2.1, 0.3, 0, 0, 0}, {0.5, -2.1, 0.3, 0, 0, 0}},
	[559] = {{-0.5, -1.8, 0.2, 0, 0, 0}, {0, -1.8, 0.2, 0, 0, 0}, {0.5, -1.8, 0.2, 0, 0, 0}},
	[560] = {{-0.5, -1.9, 0.2, 0, 0, 0}, {0, -1.9, 0.2, 0, 0, 0}, {0.5, -1.9, 0.2, 0, 0, 0}},
	[561] = {{-0.5, -1.9, 0, 0, 0, 0}, {0, -1.9, 0, 0, 0, 0}, {0.5, -1.9, 0, 0, 0, 0}},
	[562] = {{-0.5, -1.9, 0.2, 0, 0, 0}, {0, -1.9, 0.2, 0, 0, 0}, {0.5, -1.9, 0.2, 0, 0, 0}},
	
	[576] = {{-0.6, -2.1, -0.05, 10, 0, 0}, {0, -2.1, -0.05, 10, 0, 0}, {0.6, -2.1, -0.05, 10, 0, 0}, {-0.6, -2.7, -0.05, 10, 0, 0}, {0, -2.7, -0.05, 10, 0, 0}, {0.6, -2.7, -0.05, 10, 0, 0}},

	[603] = {{-0.6, -2.2, 0.1, 10, 0, 0}, {0, -2.2, 0.1, 10, 0, 0}, {0.6, -2.2, 0.1, 10, 0, 0}},
	[604] = {{-0.6, -2.3, -0.05, 0, 0, 0}, {0, -2.3, -0.05, 0, 0, 0}, {0.6, -2.3, -0.05, 0, 0, 0}},
	[605] = {{-0.6, -0.9, 0, 0, 0, 0}, {0, -0.9, -0, 0, 0, 0}, {0.6, -0.9, 0, 0, 0, 0}, {-0.6, -1.6, 0, 0, 0, 0}, {0, -1.6, -0, 0, 0, 0}, {0.6, -1.6, 0, 0, 0, 0}, {-0.6, -2.2, 0, 0, 0, 0}, {0, -2.2, 0, 0, 0, 0}, {0.6, -2.2, 0, 0, 0, 0}},
}






addEventHandler("onClientMinimize", root, function()
	PData['Minimize'] = true
	VideoMemory["HUD"]["ArrowTarget"] = nil
	VideoMemory["HUD"]["LocationTarget"] = nil
	VideoMemory["HUD"]["Wanted"] = nil
end)
 
addEventHandler("onClientRestore", root, function ()
	PData['Minimize'] = nil
end)


function DrawArrow(rotation)
	if(not VideoMemory["HUD"]["ArrowTarget"]) then
		VideoMemory["HUD"]["ArrowTarget"] = dxCreateRenderTarget(dxGetTextWidth("↑", NewScale*2, "default-bold", false), dxGetFontHeight(NewScale*2, "default-bold"), true)
		dxSetRenderTarget(VideoMemory["HUD"]["ArrowTarget"], true)
		dxSetBlendMode("modulate_add")
		dxDrawBorderedText("↑", 0, 0, 0, 0, tocolor(200, 0, 0, 255), NewScale*2, "default-bold", "left", "top", nil, nil, nil, true, false)
		dxSetBlendMode("blend")
		dxSetRenderTarget()
	end
	return VideoMemory["HUD"]["ArrowTarget"]
end


function DrawWanted(level)
	if(not VideoMemory["HUD"]["Wanted"]) then
		if(level > 0) then
			local rand = math.random(6)
			if(rand == 1) then playSFX("script", 0, math.random(0, 163), false)
			elseif(rand == 2) then playSFX("script", 1, math.random(0, 14), false)
			elseif(rand == 3) then playSFX("script", 2, math.random(0, 4), false)
			elseif(rand == 4) then playSFX("script", 3, math.random(0, 8), false)
			elseif(rand == 5) then playSFX("script", 4, math.random(0, 13), false)
			elseif(rand == 6) then playSFX("script", 5, math.random(0, 57), false) end
		end
		VideoMemory["HUD"]["Wanted"] = dxCreateRenderTarget(dxGetTextWidth("★★★★★★", NewScale*2, "pricedown", false), dxGetFontHeight(NewScale*2, "pricedown"), true)
		dxSetRenderTarget(VideoMemory["HUD"]["Wanted"], true)
		dxSetBlendMode("modulate_add")

		dxDrawBorderedText("★★★★★★", 0-(dxGetTextWidth("★★★★★★", NewScale*2, "pricedown", false)*((6-level)/6)), 0, 0, 0, tocolor(255,165,0, 200), NewScale*2, "pricedown", "left", "top", nil, nil, nil, true, false)
		dxSetBlendMode("blend")
		dxSetRenderTarget()
	end
	return VideoMemory["HUD"]["Wanted"]
end




function DrawLocation(location)
	if(not VideoMemory["HUD"]["LocationTarget"]) then
		VideoMemory["HUD"]["LocationTarget"] = dxCreateRenderTarget((dxGetTextWidth(location, NewScale*6, "default-bold", true)*1.3), dxGetFontHeight(NewScale*6, "default-bold")+4, true)
		dxSetRenderTarget(VideoMemory["HUD"]["LocationTarget"], true)
		
		dxSetBlendMode("modulate_add")
		
		dxDrawText(location:gsub('#%x%x%x%x%x%x', ''), (dxGetTextWidth(location, NewScale*6, "default-bold", true)*1.3)+1.5, 4, 0, 0, tocolor(0, 0, 0, 255), NewScale*6, "default-bold", "center", "top", nil, nil, nil, false)
		dxDrawText(location, (dxGetTextWidth(location, NewScale*6, "default-bold", true)*1.3), 0, 0, 0, tocolor(147, 148, 78, 255), NewScale*6, "default-bold", "center", "top", nil, nil, nil, true)

		dxSetBlendMode("blend")
		dxSetRenderTarget()
				

		local pixels = dxGetTexturePixels(VideoMemory["HUD"]["LocationTarget"])
		local x, y = dxGetPixelsSize(pixels)
		local texture = dxCreateTexture(x,y, "argb")
		local pixels2 = dxGetTexturePixels(texture)
		local pady = 0
		for y2 = 0, y-1 do
			for x2 = 0, x-1 do
				local colors = {dxGetPixelColor(pixels, x2,y2)}
				if(colors[4] > 0) then
					dxSetPixelColor(pixels2, x2-pady, y2, colors[1],colors[2],colors[3],colors[4])
				end
			end
			pady = pady+0.15
		end
		
		--[[
		  local pngPixels = dxConvertPixels(pixels2, 'png')
  local newImg = fileCreate('img.png')
  fileWrite(newImg, pngPixels)
  fileClose(newImg)
		]]
		
		dxSetTexturePixels(texture, pixels2)
		VideoMemory["HUD"]["LocationTarget"] = texture
	end
	return VideoMemory["HUD"]["LocationTarget"]
end





function initTrunk(theVehicle)
	local trunkobj = getElementData(theVehicle, "trunk")
	if(trunkobj) then
		if(VehicleTrunk[theVehicle]) then
			for _, obj in pairs(VehicleTrunk[theVehicle]) do
				destroyElement(obj)
			end
		end
		VehicleTrunk[theVehicle] = {}
		trunkobj = fromJSON(trunkobj)
		for i, v in pairs(trunkobj) do
			if(itemsData[v[1]]) then
				local x,y,z,rx,ry,rz = unpack(VehicleTrunks[getElementModel(theVehicle)][i])
				local vx, vy, vz = getElementPosition(theVehicle)
				local vrx, vry, vrz = getElementRotation(theVehicle)
				if(itemsData[v[1]][2]) then
					x,y,z,rx,ry,rz = x+itemsData[v[1]][2][2],y+itemsData[v[1]][2][3],z+itemsData[v[1]][2][4],rx+itemsData[v[1]][2][5],ry+itemsData[v[1]][2][6],rz+itemsData[v[1]][2][7]
					VehicleTrunk[theVehicle][i] = createObject(itemsData[v[1]][1], vx+x, vy+y, vz+z, vrx+rx, vry+ry, vrz+rz)
					setObjectScale(VehicleTrunk[theVehicle][i], itemsData[v[1]][2][1])
					attachElements(VehicleTrunk[theVehicle][i], theVehicle, x,y,z,rx,ry,rz)
				end
				
			end
		end
	end
end



function StreamIn(restream)
	if(getElementType(source) == "player") then
		if(not StreamData[source]) then
			StreamData[source] = {["armas"] = {}}
		end
		UpdateArmas(source)
	elseif(getElementType(source) == "marker") then
		if(getMarkerType(source) == "arrow") then
			local mx,my,mz = getElementPosition(source)
			if(isElementAttached(source)) then
				mx,my,mz = getElementAttachedOffsets(source)
			end
			AnimatedMarker[source] = {"up", 0, mx,my,mz}
		end
	elseif(getElementType(source) == "vehicle") then
		local occupant = getVehicleOccupant(source)
		VehiclesInStream[source] = {}
		if(not getElementData(source, "owner")) then
			VehiclesInStream[source]["blip"] = createBlipAttachedTo(source, 0, 1, 170,170,170,255,1)
		end

		if(occupant) then
			if(getElementType(occupant) == "ped") then
				if(getElementData(occupant, "DynamicBot")) then
					setElementVelocity(source, 0, 0, 0)
				end
			end
		end
		
		if(getElementData(source, "type")) then
			if(getElementData(source, "type") == "jobtruck") then
				if(GetVehicleType(source) == "Trailer") then
					if(not getVehicleTowingVehicle(source)) then
						triggerEvent("onClientTrailerDetach", source, source)
					end
				else
					if(not occupant) then
						triggerEvent("onClientTrailerDetach", source, source)
					end		
				end
			end
		end
		initTrunk(source)
	elseif(getElementType(source) == "object") then
		if(getElementModel(source) == 1362) then
			local x,y,z = getElementPosition(source)
			ObjectInStream[source] = {}
			ObjectInStream[source]["fire"] = createEffect("fire", x,y,z+0.7,x,y,z+2,500)
			ObjectInStream[source]["light"] = createLight(0, x,y,z+0.7, 6, 255, 165, 0, nil, nil, nil, true)
			ObjectInStream[source]["collision"] = createColSphere(x,y,z+1, 1)
			attachElements(ObjectInStream[source]["collision"], source)
			setElementAttachedOffsets(ObjectInStream[source]["collision"], 0,0,1)
		elseif(GetObjectType(source) == "Графити") then
			ObjectInStream[source] = {}
			local x,y,z = getElementPosition(source)
			ObjectInStream[source]["collision"] = createColSphere(x,y,z, 1)
			attachElements(ObjectInStream[source]["collision"], source)
		end
	elseif(getElementType(source) == "pickup") then
		if(getElementData(source, "arr")) then
			local arr = fromJSON(getElementData(source, "arr"))
			local r,g,b = hex2rgb(GetQualityColor(arr[3]):sub(2,7))
			local x,y,z = getElementPosition(source)
			ObjectInStream[source] = {}
			ObjectInStream[source]["light"] = createMarker(x,y,z,"corona",1, r,g,b,30)
			setElementInterior(ObjectInStream[source]["light"], getElementInterior(source))
			setElementDimension(ObjectInStream[source]["light"], getElementDimension(source))
		end
	elseif(getElementType(source) == "ped") then
		local x,y,z = getElementPosition(source)
		local zone = getZoneName(x,y,z,false)
		if(not GroundMaterial[zone]) then
			triggerServerEvent("ZonesGroundPosition", localPlayer, zone)
		end
		StreamData[source] = {["armas"] = {}, ["UpdateRequest"] = true}
		UpdateArmas(source)
		
		UpdateBot()
		
		if(getElementData(source, "dialog")) then
			if(getElementData(source, "dialogrz")) then
				local px,py,pz = getElementPosition(source)
				local rz = tonumber(getElementData(source, "dialogrz"))
				local x,y,z = getPointInFrontOfPoint(px,py,pz, rz, 2)
				StreamData[source]["ActionMarker"] = createMarker(x,y,z-1,  "corona", 2, 255, 10, 10, 0)
				setElementInterior(StreamData[source]["ActionMarker"], getElementInterior(source))
				setElementDimension(StreamData[source]["ActionMarker"], getElementDimension(source))
				setElementData(StreamData[source]["ActionMarker"], "TriggerBot", getElementData(source, "TINF"))
			else
				local x,y,z = getElementPosition(source)
				StreamData[source]["ActionMarker"] = createMarker(x,y,z,  "corona", 1, 255, 10, 10, 0)
				setElementInterior(StreamData[source]["ActionMarker"], getElementInterior(source))
				setElementDimension(StreamData[source]["ActionMarker"], getElementDimension(source))
				attachElements(StreamData[source]["ActionMarker"], source)
				setElementData(StreamData[source]["ActionMarker"], "TriggerBot", getElementData(source, "TINF"))
			end
		else
			local x,y,z = getElementPosition(source)
			StreamData[source]["ActionMarker"] = createMarker(x,y,z,  "corona", 1, 255, 10, 10, 0)
			setElementInterior(StreamData[source]["ActionMarker"], getElementInterior(source))
			setElementDimension(StreamData[source]["ActionMarker"], getElementDimension(source))
			attachElements(StreamData[source]["ActionMarker"], source)
			setElementData(StreamData[source]["ActionMarker"], "TriggerBot", getElementData(source, "TINF"))
		end
		
		if(getElementData(source, "anim")) then
			local arr = fromJSON(getElementData(source, "anim"))
			local block, anim, times, loop, updatePosition, interruptable, freezeLastFrame = arr[1], arr[2], arr[3], arr[4], arr[5], arr[6], arr[7]
			setPedAnimation(source, block, anim, times, loop, updatePosition, interruptable, freezeLastFrame)
			local rz = tonumber(getElementData(source, "dialogrz"))
			if(rz) then --Костыль
				setElementRotation(source, 0, 0, 90-rz)
			end
		end
	end
	if(not restream) then
		triggerServerEvent("PlayerElementSync", localPlayer, localPlayer, source, true)
	end
end
addEvent("onClientElementStreamIn", true)
addEventHandler("onClientElementStreamIn", getRootElement(), StreamIn)


--Для работы дальнобойщиком без прицепа

function ClientVehicleEnter(thePlayer, seat)
	if(thePlayer == localPlayer) then
		if(seat == 0) then
			PData["ClearDriving"] = setTimer(function() 
				AddRage(150)
				RageInfo("Чистое вождение +150")
			end, 25000, 0)

			if(getElementModel(source) == 532 or getElementModel(source) == 531) then
				onAttach(source)
			end
			if(getElementData(source, "type")) then
				if(getElementData(source, "type") == "jobtruck") then
					triggerEvent("onClientTrailerAttach", source)
				end
			end
		end
	end
end
addEventHandler("onClientVehicleEnter", getRootElement(), ClientVehicleEnter)

function ClientVehicleExit(thePlayer, seat)
	if(thePlayer == localPlayer) then
		if(seat == 0) then
			killTimer(PData["ClearDriving"])
			if(getElementModel(source) == 532 or getElementModel(source) == 531) then
				deAttach(source)
			end
			if(getElementData(source, "type")) then
				if(getElementData(source, "type") == "jobtruck") then
					triggerEvent("onClientTrailerDetach", source, source)
				end
			end
		end
	end
end
addEventHandler("onClientVehicleExit", getRootElement(), ClientVehicleExit)


function onAttach(theVehicle)
	if(getElementModel(theVehicle) == 531 or getElementModel(theVehicle) == 532) then
		if(getElementModel(theVehicle) == 531) then 
			if(not getVehicleTowedByVehicle(theVehicle)) then return false end 
		end
		PData["Harvest"] = setTimer(function(theVehicle)
			local x,y,z = getElementPosition(theVehicle)
			local gz = getGroundPosition(x,y,z)
			local _,_,_,_,_,_,_,_,material = processLineOfSight(x,y,z,x,y,gz-1, true,false,false,false,false,true,true,true,localPlayer, true)
			if(material) then
				if(material == 40) then
					if(not PData["HarvestDisplay"]) then
						PData["HarvestDisplay"] = 0
						ToolTip("Для сбора урожая удерживай\nскорость в пределах зеленой зоны")
					end
					
					if(VehicleSpeed >= 18 and VehicleSpeed <= 22) then
						PData["HarvestDisplay"] = PData["HarvestDisplay"]+0.25
						if(PData["HarvestDisplay"] == 40) then
							PData["HarvestDisplay"] = 0
							playSFX("genrl", 131, 2, false)
							triggerServerEvent("DropHarvest", localPlayer, x, y, gz+1)
						end
					end
				else
					PData["HarvestDisplay"] = false
				end
			end
		end, 50, 0, source)
	
	else
		destroyElement(VehiclesInStream[source]["info"]) -- Для дальнобойщиков
	end
end
addEventHandler("onClientTrailerAttach", getRootElement(), onAttach)


function deAttach(theVehicle)
	if(getElementModel(theVehicle) == 532 or getElementModel(theVehicle) == 531) then
		killTimer(PData["Harvest"])
		PData["HarvestDisplay"] = false
	else
		local x,y,z = getElementPosition(source)
		VehiclesInStream[source]["info"] = createMarker(x,y,z, "corona", 15, 255, 10, 10, 0)

		local x,y,z,resx,resy,resz = getElementData(source, "x"),getElementData(source, "y"),getElementData(source, "z"),getElementData(source, "resx"),getElementData(source, "resy"),getElementData(source, "resz")
		local dist = getDistanceBetweenPoints3D(x,y,z,resx,resy,resz)/2
		if(dist >= 1000) then
			dist=math.round((dist/1000), 1).." км"
		else
			dist=math.round(dist, 0).." м"
		end
		
		local money = getElementData(source, "money")
		local rl = fromJSON(getElementData(source, "BaseDat"))
		setElementData(VehiclesInStream[source]["info"], "TrailerInfo", "Груз: #FF0000"..getElementData(source, "product").."\n#FFFFFFКуда: "..rl[1].."\nРасстояние: "..dist.."\n#FFFFFFОплата: #3B7231$"..money)
		
		attachElements(VehiclesInStream[source]["info"], source)
	end
end
addEventHandler("onClientTrailerDetach", getRootElement(), deAttach)



function clientPickupHit(thePlayer, matchingDimension)
	if(thePlayer == localPlayer) then
		local x,y,z = getElementPosition(thePlayer)
		local zone = getZoneName(x,y,z)
		local model = getElementModel(source)
		if(model == 954 or model == 1276 or model == 953) then
			triggerServerEvent("AddCollections", localPlayer, localPlayer, model, getElementData(source, "id"))
			destroyElement(source)
			CheckZoneCollect(zone)
		end
	end
end
addEventHandler("onClientPickupHit", getRootElement(), clientPickupHit)

function StreamOut(restream)
	if(StreamData[source]) then 
		for v,k in pairs(StreamData[source]["armas"]) do
			destroyElement(StreamData[source]["armas"][v])
		end
		if(isElement(StreamData[source]["ActionMarker"])) then
			destroyElement(StreamData[source]["ActionMarker"])
		end
		StreamData[source] = nil
	end

	if(getElementType(source) == "object" or getElementType(source) == "pickup")then
		if(ObjectInStream[source]) then
			for _, obj in pairs(ObjectInStream[source]) do
				destroyElement(obj)
			end
		end
	elseif(getElementType(source) == "vehicle") then
		if(VehiclesInStream[source]) then
			for _, obj in pairs(VehiclesInStream[source]) do
				if(isElement(obj)) then
					destroyElement(obj)
				end
			end
		end
	elseif(getElementType(source) == "marker") then
		if(AnimatedMarker[source]) then
			AnimatedMarker[source] = nil
		end
	end
	
	if(restream) then 
		if isElementStreamedIn(source) then
			triggerEvent("onClientElementStreamIn", source, true) 
			return false
		end
	end
	triggerServerEvent("PlayerElementSync", localPlayer, localPlayer, source, nil)
end
addEventHandler("onClientElementStreamOut", getRootElement(), StreamOut)
addEventHandler("onClientElementDestroy", getRootElement(), StreamOut)
			



function SprunkFunk()
	local x,y,z = getPositionInFront(SprunkObject, -0.7)
	local _,_,rz = getElementRotation(SprunkObject)
	local objmodel = getElementModel(SprunkObject)
	MovePlayerTo[localPlayer]={x,y,z,180-rz, "silent", "DrinkSprunk", {objmodel}}
end



function getPositionInFront(element,meters)
	local x, y, z = getElementPosition(element)
	local a,b,r = getElementRotation(element)
	x = x - math.sin ( math.rad(r) ) * meters
	y = y + math.cos ( math.rad(r) ) * meters
	return x,y,z
end

function getPositionInBack(element,meters)
   local x, y, z = getElementPosition(element)
   local a,b,r = getElementRotation(element)
   x = x + math.sin ( math.rad(r) ) * meters
   y = y - math.cos ( math.rad(r) ) * meters
   return x,y,z
end

function getPositionInLeft(element,meters)
   local x, y, z = getElementPosition(element)
   local a,b,r = getElementRotation(element)
   x = x+math.cos(math.rad(r))*meters
   y = y-math.sin(math.rad(r))*meters
   return x,y,z
end

function getPositionInRight(element,meters)
   local x, y, z = getElementPosition(element)
   local a,b,r = getElementRotation(element)
   x = x-math.cos(math.rad(r))*meters
   y = y+math.sin(math.rad(r))*meters
   return x,y,z
end


function getPositionInFR(element,meters)
   local x, y, z = getElementPosition(element)
   local a,b,r = getElementRotation(element)
   x = x - math.sin ( math.rad(r-45) ) * meters
   y = y + math.cos ( math.rad(r-45) ) * meters
   return x,y,z
end


function getPositionInFL(element,meters)
   local x, y, z = getElementPosition(element)
   local a,b,r = getElementRotation(element)
   x = x - math.sin ( math.rad(r+45) ) * meters
   y = y + math.cos ( math.rad(r+45) ) * meters
   return x,y,z
end





function onQuitGame(reason)
	if(isTimer(timers[source])) then
		PlayersMessage[source] = nil
	end
	if(isTimer(timersAction[source])) then
		PlayersAction[source] = nil
	end
end
addEventHandler("onClientPlayerQuit", getRootElement(), onQuitGame)



bindKey("M", "down", openmap)
bindKey("tab", "down", OpenTAB)
bindKey("tab", "up", CloseTAB)
bindKey("h", "down", opengate)
bindKey("p", "down", park)
bindKey('1', 'down', inventoryBind)
bindKey('2', 'down', inventoryBind)
bindKey('3', 'down', inventoryBind)
bindKey('4', 'down', inventoryBind)
bindKey('5', 'down', inventoryBind)
bindKey('6', 'down', inventoryBind)
bindKey('7', 'down', inventoryBind)
bindKey('8', 'down', inventoryBind)
bindKey('9', 'down', inventoryBind)
bindKey('0', 'down', inventoryBind)
bindKey("i", "down", SetupBackpack)
bindKey('mouse2', 'down', setDoingDriveby)
bindKey("w", "down", breakMove)
bindKey("a", "down", breakMove)
bindKey("s", "down", breakMove)
bindKey("d", "down", breakMove)
bindKey("p", "down", autoMove)
bindKey("r", "down", reload)
bindKey("F1", "down", ShowInfoKey)
bindKey("F5", "down", ShowLink)
bindKey("F10", "down", resourcemap)
bindKey("F11", "down", openmap)
bindKey("F12", "down", hideinv)




function SwitchNick()
	RemoveInventory()
	LoginClient(true)
end

addEventHandler("onClientPlayerChangeNick", getLocalPlayer(), SwitchNick)



