-- Ship template by Joey45 edit as you see fit 
-- Name of ship and who by

GT = {};
dofile(current_mod_path..'/scripts/ShipnameRunwaysAndRoutes.lua') -- the runways and taxiway lua file
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_ship) -- all ships have this

GT.visual = {}
GT.visual.shape = "NameHere"  -- name of LODs lua
GT.visual.shape_dstr = "" -- if there is a destruction model it goes here
--                                     all messurements are taken from the model in the 3d software

GT.life = 7200; --                     hit points
GT.mass = 11339.809; --                Displacmeent (kg)
GT.max_velocity = 14.4 --              Maximum speed in (m/s)
GT.race_velocity = 12.1 --             Maximum dash speed (m/s) 
GT.economy_velocity = 7.7 --           Economic cruising speed (m/s)
GT.economy_distance = 13,000 --        Range at cruising speed
GT.race_distance = 2.778e+006 --       ships hav unlimited fuel so it dosen't really matter'
GT.shipLength = 225.20 --              Waterline ship length (m)
GT.Width = 43.90 --                    Beam (Width) (m)
GT.Height = 35.226 --                  Height (Keel to top of mast?) (m)
GT.Length = 225.20 --                  Total length (m)
GT.DeckLevel = 11.816 --               Deck Height above waterline of flight deck (m)
GT.X_nose = 107.0 --                   bow wave
GT.X_tail = -104.5 --                  wake
GT.Tail_Width = 8 --                   wake width
GT.draft = 13 --                       from waterline to keel of the ship
GT.Gamma_max = 0.35 --                 no idea
GT.Om = 0.05 --                        no idea
GT.speedup = 0.119249; --              time it takes to accelerate
GT.R_min = 665.8 --                    turn radius

GT.RCS = 100000 -- new in 2.7 ----estimated RCS in square meters
GT.IR_emission_coeff = 0.9 -- new in 2.7 not sure the params


GT.TACAN		   = true;		--If it has TACAN say true if not say false or not have this entry
GT.TACAN_position = {7.006,  43.155,  -14.1} --position of tacan TX	


GT.ICLS = true; -- IF it has ICLS say true if not say false or not have this entry
GT.ICLS_Localizer_position =  {-109.324,  9.685,  7.715, 189.0}	-- {x [m], y [m], z [m], yaw [deg]} 
GT.ICLS_Glideslope_position = {-14.694,  19.945, 13.212,   3.5}	-- {x [m], y [m], z [m], glideslope = 3.5 [deg]}
--Optical Landing System
GT.OLS = {
Type = GT_t.OLS_TYPE.IFLOLS, 
CutLightsArg = 404, 
DatumAndWaveOffLightsArg = 405, 
MeatBallArg = 151, 
GlideslopeBasicAngle = 3.5, 
VerticalCoverageAngle = 1.7
}
GT.LRLS = true; -- Long Range Line-up System
GT.distFindObstacles = 10000


GT.numParking = 2 -- runways
GT.Plane_Num_ = 12 -- max number of planes, not sure if it matters in game
GT.Helicopter_Num_ = 8 -- Number heli (spawns)

-- the new LSO stuff is still new to me but this is what I have found out by looking through the lua files

--LSO view          high quality edm file, whatever you named the connector , Visiblity arg   , Position of camera
local LSO_Station = { HQ_model = "empty", dockConnector  = "LSO_VIEW" , hide_argument = 821 , cameraPos = {-110+1,19.8,-18+0.5,180}} --this camera pos works

GT.Stations = 	{	LSO = LSO_Station, }

GT.LSOView = {cockpit = "empty", position = {--[[connector = "LSO_VIEW", ]]offset = {0.0, 0.0, 0.0, 0.0, 0.0}}} --this offset has no effect but the line needs to be here


-- Landing point
GT.Landing_Point	= {101.926,   11.812,   -12.378} -- y z x You need this otherwise the aircraft will not load on the deck

-- smoke density and position
GT.exhaust = {
	  [1] = { size = 0.2 , pos = {0.0, 28.0, 16.0 } }, --Y, Z, X
}
      --[2] = { size = 1.0 , pos = {-1.9, 29.0, 14.0 } },	--if you have 2 stacks then enable this	


GT.animation_arguments.catapult_shuttles = {145, 146, 147, 148} --shuttle args
GT.animation_arguments.arresting_wires = {141, 142, 143, 144} -- can't get the visibilty anim to work, differnt #arg numbers on the Stennis and SC
GT.animation_arguments.holdback_bars_pos = {817, 818, 819, 820} 
GT.animation_arguments.holdback_bars_angle = {808, 809, 810, 811} 
GT.animation_arguments.holdback_bars_color = {812, 813, 814, 815}
GT.animation_arguments.holdback_bars_deck_cleat = {804, 805, 806, 807} --that little thing for the holdback bar
GT.animation_arguments.elevators = {57, 58, 59, 60}; --lifts
GT.animation_arguments.elevators_doors = {47, 48, 53, 54}; h--anger doors
GT.animation_arguments.elevators_fences_top = {27, 29, 31, 33}; --deck elevator fences
GT.animation_arguments.elevators_fences_bottom = {28, 30, 32, 34}; --hanger fences
GT.animation_arguments.alarm_state = 10; -- for the nets around the boat and or weapon stations or other stuff like antennas going up or platforms going from green state to red state
GT.animation_arguments.bubbles = {138, 139} -- doesn't go back down ED bug
GT.animation_arguments.landing_strip_illumination = 150; --runway lights


GT.animation_arguments.radar1_rotation = 1; -- Radar 1 Rotation main radar
GT.radar1_period = 1; --speed

GT.animation_arguments.radar2_rotation = 2; -- Radar 2 Rotation secondary radars
GT.radar1_period = 5; --speed

GT.animation_arguments.radar3_rotation = 3; -- navigation radar
GT.radar1_period = 5; --speed

-- for lights you can look at the shps in the modelviewer 
--                             {int ArgumentNo, float OffValue, float OnValue, [float AnimationDuration],  [bool cycleAnimation]}
GT.carrierIlluminationStates = { 
								 {{307, 0.0, 0.45}, {308, 0.0, 0.45}, {790, 0.0, 0.60}, {792, 0.0, 0.37}}, --NAV_LIGHTS
								 {{307, 0.0, 0.75}, {308, 0.0, 0.75}, {790, 0.0, 0.50}, {792, 0.0, 0.45}}, -- AC_LAUNCH_STATE
								 {{307, 0.0, 0.30}, {308, 0.0, 0.30}, {150, 0.0, 1.00}, {790, 0.0, 0.50}, {792, 0.0, 0.37}}, -- AC_RECOVERY_STATE
								}
								
--Damage Model
--THE DAMAGE MODEL, THIS IS THE NAMES OF THE COLLISION SHELL NODES (names can be anything as long as it matches up) 
GT.DM = {
    --Hull          Mesh name                     Arg Number        Hit Points                           Name of Connector
    { area_name = "COL_NOSE_R_01", 				area_arg = 75, area_life = 150, area_fire = { connector = "FIRE_NOSE_R_01", size = 0.5}},
	{ area_name = "COL_NOSE_R_02", 				area_arg = 76, area_life = 150, area_fire = { connector = "FIRE_NOSE_R_02", size = 0.5}},
	{ area_name = "COL_MIDDLE_R_01", 			area_arg = 77, area_life = 150, area_fire = { connector = "FIRE_CENTER_R_01", size = 0.5}},
	{ area_name = "COL_MIDDLE_R_02", 			area_arg = 78, area_life = 150, area_fire = { connector = "FIRE_CENTER_R_02", size = 0.5}},
    { area_name = "COL_BACK_R_01", 				area_arg = 79, area_life = 300, area_fire = { connector = "FIRE_BACK_R", size = 0.5}},
	
    { area_name = "COL_NOSE_L_01", 				    area_arg = ##, area_life = 150, area_fire = { connector = "FIRE_NOSE_L_01", size = 0.5}},
	{ area_name = "COL_NOSE_L_02", 			      	area_arg = ##, area_life = 150, area_fire = { connector = "FIRE_NOSE_L_02", size = 0.5}},
    { area_name = "COL_CENTER_L_01", 			    area_arg = ##, area_life = 150, area_fire = { connector = "FIRE_CENTER_L_01", size = 0.5}},
	{ area_name = "COL_CENTER_L_02", 		    	area_arg = ##, area_life = 150, area_fire = { connector = "FIRE_CENTER_L_02", size = 0.5}},
	{ area_name = "COL_CENTER_L_03", 		    	area_arg = ##, area_life = 150},
    { area_name = "COL_BACK_L", 				    area_arg = ##, area_life = 300, area_fire = { connector = "FIRE_BACK_L", size = 0.5}},
	--Deck                                                                                                                                                           If aircraft Varrier this is needed
	{ area_name = "COL_PALUBA_NOSE",			    area_arg = ##, area_life = 300, armour = {width = 0.030}, area_fire = { connector = "FIRE_PALUBA_NOSE", size = 0.8}, belongsToRunway = true},
	{ area_name = "COL_PALUBA_MIDLE_01",		    area_arg = ##, area_life = 100, armour = {width = 0.030}, area_fire = { connector = "PALUBA_MIDLE_01", size = 0.8}, belongsToRunway = true},
	{ area_name = "COL_PALUBA_MIDLE_02",		    area_arg = ##, area_life = 100, armour = {width = 0.030}, area_fire = { connector = "PALUBA_MIDLE_02", size = 0.8}, belongsToRunway = true},
	{ area_name = "COL_PALUBA_BACK_01", 		    area_arg = ##, area_life = 100, armour = {width = 0.030}, area_fire = { connector = "PALUBA_BACK_01", size = 0.8}, belongsToRunway = true},
	{ area_name = "COL_PALUBA_BACK_02", 		    area_arg = ##, area_life = 100, armour = {width = 0.030}, area_fire = { connector = "PALUBA_BACK_02", size = 0.8}, belongsToRunway = true},
	--Island / Superstructure
	{ area_name = "COL_BACK", 					    area_arg = ##, area_life = 100},
	{ area_name = "COL_RUBKA",			     		area_arg = ##, area_life = 100, area_fire = { connector = "FIRE_RUBKA", size = 0.8}},
	{ area_name = "COL_MACHTA",			    		area_arg = ##, area_life = 100},
	{ area_name = "COL_TOWER",				    	area_arg = ##, area_life = 100},
	--pontoons
	{ area_name = "COL_ZA_NR",				    	area_arg = ##, area_life = 30},
	{ area_name = "COL_ZA_BR",				    	area_arg = ##, area_life = 30},
	{ area_name = "COL_ZA_BL",				    	area_arg = ##, area_life = 30},
	{ area_name = "COL_NADSTROYKA_BR",			    area_arg = ##, area_life = 30},
	{ area_name = "COL_NADSTROYKA_BL",			    area_arg = ##, area_life = 30},
	{ area_name = "COL_ZRK_BR",					    area_arg = ##, area_life = 30},
	{ area_name = "COL_ZRK_NR",					    area_arg = ##, area_life = 30},
	
	-- Deck Lifts
	{ area_name = "COL_LIFT_01",				    area_arg = ##, area_life = 50},
	{ area_name = "COL_LIFT_02",				    area_arg = ##, area_life = 50},
	{ area_name = "COL_LIFT_03",				    area_arg = ##, area_life = 50},
	{ area_name = "COL_LIFT_04",			    	area_arg = ##, area_life = 50},
}

--GT.WS[ws].pointer = "BRIDGE" --possible CA or Weapon controls??
--GT.driverViewConnectorName = {"DRIVER_POINT", offset = {0.0, 0.0, 0.0}} --possible CA or weapon controls??
--GT.driverCockpit = "DriverCockpit/DriverCockpitWithIR" --possible CA or weapon controls??

GT.airWeaponDist = 15000  -- Max engagement range air threats (meters)
GT.airFindDist = 28000 -- Max detenction range air threats (meters)

--Radar info
GT.WS = {}
GT.WS.maxTargetDetectionRange = 25000; --450000
GT.WS.radar_type = 104 --104= Short range, 103 = Mid range at a guess 102 = Long range
GT.WS.searchRadarMaxElevation = math.rad(60);
local ws;

-- weapon systems goes here

-------------------------------------------------------------------------

GT.Name = "Liveries folder name" -- folder name for Liveries
GT.DisplayName = _("name of ship") -- name in game in ME and on the tape at the bottom
GT.DisplayNameShort = _("name") -- Label name
GT.Rate = 5500.000000 -- Reward Points

GT.Sensors = {  OPTIC = {"long-range naval optics", "long-range naval LLTV", "long-range naval FLIR"}, --optics types
                RADAR = {"Tor 9A331", "carrier search radar"}, --radar types
            };

 ----------------------------------------------------
GT.DetectionRange	= GT.airFindDist;
GT.ThreatRange		= GT.airWeaponDist;
GT.Singleton		= "yes";
GT.mapclasskey		= "P0091000065"; --map icon >>MissionEditor\data\NewMap\images
GT.attribute		= {wsType_Navy, wsType_Ship, wsType_AirCarrier, WSTYPE_PLACEHOLDER, -- >> \DCS World Version\Scripts\Database\wsTypes.lua
						"Aircraft Carriers", 
						"Arresting Gear",  --if it has arrester wires
						"catapult", --if it has catapults
						"ski_jump", -- if it has a ramp
						"RADAR_BAND1_FOR_ARM",
						"RADAR_BAND2_FOR_ARM",
					};
					--unfortunately the list with these have since been hidden by ED along with the ships lua files
GT.Categories		= {
						{name = "AircraftCarrier"}, --aircraft carrier
						{name = "AircraftCarrier With Catapult"}, --if it has catapults
						{name = "AircraftCarrier With Tramplin"}, -- if it has a ramp
						{name = "Armed Ship"} -- has weapons
						--{name = "AircraftCarrier With Arresting Gear"} -- disables mod when enabled, showws on SC module and Stennis and Forrestal.
					};	
					
					
-- categories in the mission editor 
GT.tags  = 
{
	"ship type",
	"if you want you can add it to another tag", --if only one delete this
}
--[[ 

example
GT.tags  = {"Battlecruiser",}
------------------------------------------------------------
ship type =
Carrier
Battleship
Battlecruiser
Cruiser
Destroyer
Frigate
Corvette and Patrol
Fast Attack Craft
Submarine
Support
Amphibious Assault

File location >>DCS World version\MissionEditor\modules\me_ship.lua

---------------------------------------
attributes
["ski_jump"] = {},
["catapult"] = {},
["Aircraft Carriers"] = {"Heavy armed ships",},
["Cruisers"] = {"Heavy armed ships",},
["Destroyers"] = {"Heavy armed ships",},
["Frigates"] = {"Heavy armed ships",},
["Corvettes"] = {"Heavy armed ships",},
["Submarines"] = {"Heavy armed ships",},
["Heavy armed ships"] = {"Armed ships", "Armed Air Defence", "HeavyArmoredUnits",},
["Light armed ships"] = {"Armed ships","NonArmoredUnits"},
["Armed ships"] = {"Ships"},
["Unarmed ships"] = {"Ships","HeavyArmoredUnits",},
["Ships"] = {"All",}

--]]	

add_surface_unit(GT)