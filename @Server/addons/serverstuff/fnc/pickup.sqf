
if(pickingup)exitwith{player groupchat "Вы уже поднимаете предмет"};
pickingup   = true;
_action	    = _this select 2;
_this 	    = _this select 3;
_object	    = _this select 0;
_item  	    = _this select 1;
_name       = _item call fnc_getItemName;   	
_amount     = _this select 2;
_exitvar    = 0;
pickingup   = true;
_object setvariable ["amount", 0, true];
if(primaryweapon player == "" and secondaryweapon player == "")then{player playmove "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon"}else{player playmove "AinvPknlMstpSlayWrflDnon"};
sleep 1;
if (isNull _object) exitWith {systemChat "Ошибка предмета."; pickingup = false;};
[_item, _amount] call fnc_addItem;
[format["Вы подняли %1 %2", _amount, _name]] spawn fnc_itemNotifyMePls;
(format ["[%1|%2|%3] has picked up %4 %5", name player, getPlayerUID player, side player, _amount, _item]) remoteExec ["fnc_logMyStuff",2];
deletevehicle _object;
pickingup   = false;
