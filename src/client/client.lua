-- 🔎 Need top-tier FiveM scripts?
-- 🛒 Browse our collection: https://groot-development.tebex.io/
-- 💬 Join Discord: https://discord.gg/Nm5FSxK2gv

local function Localization()
	local translations = {
		muteAllSounds = LAN("muteAllSounds"),
		hideNotifications = LAN("hideNotifications"),
		disableSlideAnimations = LAN("disableSlideAnimations"),
		SettingTitle = LAN("SettingTitle"),
		SettingDesc = LAN("SettingDesc"),
		variationSelectionTitle = LAN("variationSelectionTitle"),
		NotificationPosition = LAN("NotificationPosition"),
		Variant = LAN("Variant"),

		topLeft = LAN("topLeft"),
		topcenter = LAN("topcenter"),
		topRight = LAN("topRight"),
		center = LAN("center"),
		bottomLeft = LAN("bottomLeft"),
		bottomCenter = LAN("bottomCenter"),
		bottomRight = LAN("bottomRight"),
		bottomFull = LAN("bottomFull"),
		topFull = LAN("topFull"),

		testCurrentSettings = LAN("testCurrentSettings"),
		resetSettings = LAN("resetSettings"),
		saveSettings = LAN("saveSettings"),
	}
	SendNUIMessage({
		action = "jusgroot:g-notification:localizations",
		data = translations,
	})
end

local function init()
	Localization()

	SendNUIMessage({
		action = "g-notification:alltypes:colors",
		data = Config.Notification.Styles,
	})
end

function Notify(data)
	init()
	Wait(100)
	local enableSound = data.EnableSound
	if enableSound == nil then
		enableSound = true
	end
	data.EnableSound = enableSound
	if enableSound then
		data.soundName = data.soundName or Config.Notification.DefaultSoundName
	else
		data.soundName = nil
	end
	data.duration = data.duration or Config.Notification.DefaultDuration
	if data.showDuration == nil then
		data.showDuration = true
	end
	data.type = data.type or Config.Notification.DefaultNotifyType
	data.position = data.position or Config.Notification.DefaultPosition
	data.id = data.id or nil
	data.icon = data.icon or nil

	SendNUIMessage({
		action = "setVisibleNotification",
		data = {
			id = data.id or nil,
			title = data.title,
			description = data.description,
			duration = tonumber(data.duration),
			showDuration = data.showDuration,
			type = data.type,
			position = data.position,
			EnableSound = data.EnableSound,
			soundName = data.soundName,
			variant = data.variant,
			styles = data.styles,
			icon = data.icon or nil,
		},
	})
end

function RemoveNotification(id)
	if id == nil then
		return
	end
	SendNUIMessage({
		action = "justgroot:g-notification:remove:notification",
		data = tostring(id),
	})
end

exports("RemoveNotification", RemoveNotification)
exports("Notify", Notify)

RegisterNetEvent("g-notification:notify", function(data)
	Notify(data)
end)

RegisterCommand("notification-settings", function()
	Localization()
	SendNUIMessage({ action = "setVisibleUserSettingsPanel", data = true })
	SetNuiFocus(true, true)
end, false)

RegisterNUICallback("closeSettingsPanel", function(_, cb)
	SetNuiFocus(false, false)
	cb({ ok = true })
end)

RegisterNUICallback("justgroot:g-notification:testCurrentSettings", function(data, cb)
	local variant = data.variant
	local position = data.position
	exports["g-notifications"]:Notify({
		title = "Test Notification",
		description = "This is a test notification",
		type = "success",
		position = position,
		variant = variant,
	})
	cb({})
end)
RegisterNUICallback("justgroot:g-notification:settings:reset:completed", function(data, cb)
	exports["g-notifications"]:Notify({
		title = "Reset Notification Settings",
		description = "Notification settings have been reset.",
		type = "info",
	})
	cb({})
end)
RegisterNUICallback("justgroot:g-notification:settings:saved", function(data, cb)
	exports["g-notifications"]:Notify({
		title = "Notification Settings Saved",
		description = "Notification settings have been saved.",
		type = "info",
	})
	cb({})
end)

if Config.SystemSettings.Debug then
	local isopen = false
	RegisterCommand("notify-debug", function()
		if isopen then
			SendNUIMessage({ action = "g-notification:debug:panel", data = false })
			SetNuiFocus(false, false)
			isopen = false
		else
			SendNUIMessage({ action = "g-notification:debug:panel", data = true })
			SetNuiFocus(true, true)
			isopen = true
		end
	end, false)

	RegisterCommand("test-notify", function()
		exports["g-notifications"]:Notify({
			title = "Announcement",
			description = "Announcement server",
			showDuration = true,
			type = "error",
			position = "top-right",
			EnableSound = true,
			duration = 13000,
		})

		Wait(2000)
		exports["g-notifications"]:Notify({
			title = "Announcement",
			description = "Announcement server",
			showDuration = true,
			type = "success",
			position = "top-right",
			duration = 12000,
		})

		Wait(2000)
		exports["g-notifications"]:Notify({
			title = "Announcement",
			description = "Announcement server",
			showDuration = true,
			type = "warn",
			position = "top-right",
			duration = 14000,
		})

		Wait(2000)
		exports["g-notifications"]:Notify({
			title = "Announcement",
			description = "Announcement server",
			showDuration = true,
			type = "info",
			position = "top-right",
			duration = 16000,
		})
	end, false)
end


