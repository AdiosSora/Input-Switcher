local acutil = require('acutil');
local loaded = 0

acutil.slashCommand('/inputswitch',parse);
ui.SysMsg("Input switcher loaded! To use, type /inputswitch.")


function parse(command)
	local cmd = table.remove(command,1);
	if (cmd == 'kb') then
		config.ChangeXMLConfig("ControlMode", 2);
		return ui.SysMsg('Keyboard mode enabled.');
	end
	if (cmd == 'mouse') then
		config.ChangeXMLConfig("ControlMode", 3);
		return ui.SysMsg('Mouse mode enabled.')
	end
	if (cmd == 'toggle') then
		if config.GetXMLConfig("ControlMode") == 3 then
			config.ChangeXMLConfig("ControlMode", 2)
			return ui.SysMsg('Keyboard mode enabled.')
		end
		config.ChangeXMLConfig("ControlMode", 3)
		return ui.SysMsg('Mouse mode enabled.')
	end
	if (not cmd) then
		return ui.SysMsg('Type /inputswitch kb to enable keyboard, /inputswitch mouse to enable mouse, or /inputswitch toggle to toggle.')
	end
end