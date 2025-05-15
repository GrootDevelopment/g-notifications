-- 🔎 Need top-tier FiveM scripts?
-- 🛒 Browse our collection: https://groot-development.tebex.io/
-- 💬 Join Discord: https://discord.gg/Nm5FSxK2gv


Config = {}

Config.SystemSettings = {
	Language = "en",
	Debug = false,
}

Config.Notification = {
	DefaultPosition = "top-right", -- "bottom-left" | "bottom-right" | "bottom-center" | "top-left" | "top-right" | "top-center" | "center" | "top-full" | "bottom-full"
	DefaultNotifyType = "info", -- "info" | "success" | "warn" | "error" | "default"
	DefaultSoundName = "notification1", -- If you want to add more sounds, place them in the sounds folder located at g-notifications/web/build/audio. Only .ogg format is supported.
	DefaultNotificationVariant = "type3", -- "type1" | "type2" | "type3" | "type4"
	DefaultDuration = 5000,
	Styles = {
		["info"] = {
			icon = "info-circle",
			sound = "notification1",
			["bgcolor"] = "#161a1d",
			["iconbg"] = "#0094E8",
			["iconColor"] = "#fff",
			["textColor"] = "#fff",
		},
		["success"] = {
			icon = "check-circle",
			sound = "notification1",
			["bgcolor"] = "#003f2d",
			["iconbg"] = "#00b37e",
			["iconColor"] = "#fff",
			["textColor"] = "#ffffff",
		},
		["warn"] = {
			icon = "exclamation-triangle",
			sound = "notification3",
			["bgcolor"] = "#2f2f2f",
			["iconbg"] = "#ffb703",
			["iconColor"] = "#fff",
			["textColor"] = "#fff",
		},
		["error"] = {
			icon = "times-circle",
			sound = "notification3",
			["bgcolor"] = "#6a040f",
			["iconbg"] = "#9d0208",
			["iconColor"] = "#fff",
			["textColor"] = "#fff",
		},
		["default"] = {
			["bgcolor"] = "#1e1e1e",
			["iconbg"] = "#444",
			["iconColor"] = "#aaa",
			["textColor"] = "#f8f8f8",
		},
		["custom"] = {
			["bgcolor"] = "#2f2f2f",
			["iconbg"] = "#ffb703",
			["iconColor"] = "#fff",
			["textColor"] = "#fff",
		},
		-- add more styles here
	},
}
