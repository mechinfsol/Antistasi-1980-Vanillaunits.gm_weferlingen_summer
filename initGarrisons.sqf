

_mrkNATO = [];
_mrkCSAT = [];
_controlesNATO = [];
_controlesCSAT = [];

if (gameMode == 1) then
	{
    _controlesNATO = controles;
	if (worldName == "gm_weferlingen_summer") then
	    {
	    _mrkCSAT = ["airport_1","factory_1","puesto_1","port","puesto_13","puesto_17","factory_5","puesto_6","port_1","port_2","factory","puesto_9","puesto","puesto_4","factory_6","puesto_2","control","control_13","control_15","control_17","control_19","control_24","control_34","control_35","control_36","control_37","control_39","control_4","control_46","control_48","control_49","control_5","control_51","control_52","control_53","control_54","control_55","control_56","control_57","control_58","control_6","control_60","control_61","control_62","control_8","resource","resource_1","resource_3","resource_8","resource_9"];
	    _controlesNATO = _controlesNATO - ["airport","puesto_10","puesto_11","puesto_12","puesto_14","puesto_15","puesto_16","puesto_3","puesto_5","puesto_7","puesto_8","factory_7","factory_2","factory_3","factory_4","port_4","port_3","control_10","control_11","control_12","control_14","control_16","control_18","control_2","control_21","control_22","control_23","control_25","control_26","control_27","control_28","control_29","control_3","control_30","control_31","control_33","control_38","control_40","control_41","control_42","control_43","control_44","control_45","control_47","control_59","control_7","control_9"];
	    _controlesCSAT = ["control","control_13","control_15","control_17","control_19","control_24","control_34","control_35","control_36","control_37","control_39","control_4","control_46","control_48","control_49","control_5","control_51","control_52","control_53","control_54","control_55","control_56","control_57","control_58","control_6","control_60","control_61","control_62","control_8"];
	    }
	else
	    {
	    if (worldName == "Altis") then
	        {
	        _mrkCSAT = ["airport_2","puerto_4","puesto_5","control_52","control_33"];
	        _controlesNATO = _controlesNATO - ["control_52","control_33"];
	    	_controlesCSAT = ["control_52","control_33"];
	        }
        else
            {
            if (worldName == "chernarus_summer") then
                {
                _mrkCSAT = ["puesto_21"];
                };
            };
	    };
	_mrkNATO = marcadores - _mrkCSAT - ["Synd_HQ"];
	}
else
	{
	if (gameMode == 4) then
		{
		_mrkCSAT = marcadores - ["Synd_HQ"];
		_controlesCSAT = controles;
		}
	else
		{
		_mrkNATO = marcadores - ["Synd_HQ"];
		_controlesNATO = controles;
		};
	};
{lados setVariable [_x,malos,true]} forEach _controlesNATO;
{lados setVariable [_x,muyMalos,true]} forEach _controlesCSAT;
{
_pos = getMarkerPos _x;
_dmrk = createMarker [format ["Dum%1",_x], _pos];
_dmrk setMarkerShape "ICON";
_garrNum = [_x] call A3A_fnc_garrisonSize;
_garrNum = _garrNum / 8;
_garrison = [];
killZones setVariable [_x,[],true];
if (_x in _mrkCSAT) then
    {
    _dmrk setMarkerType flagCSATmrk;
    _dmrk setMarkerText format ["%1 HQ",nameMuyMalos];
    _dmrk setMarkerColor "default";
    for "_i" from 1 to _garrNum do
        {
        _garrison append (selectRandom gruposCSATSquad);
        };
    garrison setVariable [_x,_garrison,true];
    lados setVariable [_x,muyMalos,true];
    }
else
    {
    _dmrk setMarkerType flagNATOmrk;
    _dmrk setMarkerText format ["%1 HQ",nameMalos];
    _dmrk setMarkerColor "default";
    for "_i" from 1 to _garrNum do
        {
        _garrison append (selectRandom gruposNATOSquad);
        };
    garrison setVariable [_x,_garrison,true];
    lados setVariable [_x,malos,true];
    };
_nul = [_x] call A3A_fnc_crearControles;
server setVariable [_x,0,true];//fecha en fomrato dateToNumber en la que estarán idle
} forEach aeropuertos;

{
_pos = getMarkerPos _x;
_dmrk = createMarker [format ["Dum%1",_x], _pos];
_dmrk setMarkerShape "ICON";
_garrNum = [_x] call A3A_fnc_garrisonSize;
_garrNum = _garrNum / 8;
_garrison = [];
_dmrk setMarkerType "loc_rock";
_dmrk setMarkerText "Resources";
for "_i" from 1 to _garrNum do
   {
   _garrison append (selectRandom gruposFIASquad);
   };
if (_x in _mrkCSAT) then
	{
	_dmrk setMarkerColor colorMuyMalos;
	lados setVariable [_x,muyMalos,true];
	}
else
	{
	_dmrk setMarkerColor colorMalos;
	lados setVariable [_x,malos,true];
	};
garrison setVariable [_x,_garrison,true];
_nul = [_x] call A3A_fnc_crearControles;
} forEach recursos;

{
_pos = getMarkerPos _x;
_dmrk = createMarker [format ["Dum%1",_x], _pos];
_dmrk setMarkerShape "ICON";
_garrNum = [_x] call A3A_fnc_garrisonSize;
_garrNum = _garrNum / 8;
_garrison = [];
_dmrk setMarkerType "u_installation";
_dmrk setMarkerText "Factory";
for "_i" from 1 to _garrNum do
   {
   _garrison append (selectRandom gruposFIASquad);
   };
if (_x in _mrkCSAT) then
	{
	_dmrk setMarkerColor colorMuyMalos;
    lados setVariable [_x,muyMalos,true];
	}
else
	{
	_dmrk setMarkerColor colorMalos;
    lados setVariable [_x,malos,true];
    };
garrison setVariable [_x,_garrison,true];
_nul = [_x] call A3A_fnc_crearControles;
} forEach fabricas;

{
_pos = getMarkerPos _x;
_dmrk = createMarker [format ["Dum%1",_x], _pos];
_dmrk setMarkerShape "ICON";
_garrNum = [_x] call A3A_fnc_garrisonSize;
_garrNum = _garrNum / 8;
_garrison = [];
killZones setVariable [_x,[],true];
_dmrk setMarkerType "loc_bunker";
if !(_x in _mrkCSAT) then
    {
    _dmrk setMarkerColor colorMalos;
    _dmrk setMarkerText format ["%1 Outpost",nameMalos];
    for "_i" from 1 to _garrNum do
        {
        _garrison append (selectRandom gruposFIASquad);
        };
    lados setVariable [_x,malos,true];
    }
else
    {
    _dmrk setMarkerText format ["%1 Outpost",nameMuyMalos];
    _dmrk setMarkerColor colorMuyMalos;
    if (gameMode == 4) then
    	{
    	for "_i" from 1 to _garrNum do
	       {
	       _garrison append (selectRandom gruposFIASquad);
	       };
    	}
    else
    	{
	    for "_i" from 1 to _garrNum do
	        {
	        _garrison append (selectRandom gruposCSATSquad);
	        };
	    };
    lados setVariable [_x,muyMalos,true];
    };
garrison setVariable [_x,_garrison,true];
server setVariable [_x,0,true];
_nul = [_x] call A3A_fnc_crearControles;
} forEach puestos;

{
_pos = getMarkerPos _x;
_dmrk = createMarker [format ["Dum%1",_x], _pos];
_dmrk setMarkerShape "ICON";
_garrNum = [_x] call A3A_fnc_garrisonSize;
_garrNum = _garrNum / 8;
_garrison = [];
_dmrk setMarkerType "n_maint";
_dmrk setMarkerText "Warehouse";
if (_x in _mrkCSAT) then
    {
    _dmrk setMarkerColor colorMuyMalos;
	for "_i" from 1 to _garrNum do
	   {
	   _garrison append (selectRandom gruposCSATSquad);
	   };
    lados setVariable [_x,muyMalos,true];
    }
else
    {
    _dmrk setMarkerColor colorMalos;
    for "_i" from 1 to _garrNum do
        {
        _garrison append (selectRandom gruposNATOSquad);
        };
    lados setVariable [_x,malos,true];
    };
garrison setVariable [_x,_garrison,true];
_nul = [_x] call A3A_fnc_crearControles;
} forEach puertos;

lados setVariable ["NATO_carrier",malos,true];
lados setVariable ["CSAT_carrier",muyMalos,true];