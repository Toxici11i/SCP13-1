//ADD THESE JOBS TO THE ALLOWED JOBS LIST ON YOUR MAP OR IT WILL NOT WORK

/datum/job/scp173
	title = "SCP-173"
	department_flag = MSC
	total_positions = 1
	spawn_positions = 1
	supervisors = "Yourself"
	selection_color = "#254c25"
	minimal_player_age = 0
	account_allowed = 0
	economic_power = 0
	loadout_allowed = FALSE
	hud_icon = "hudblank"
	skill_points = 0
	no_skill_buffs = TRUE

/datum/job/scp173/handle_variant_join(var/mob/living/carbon/human/H, var/alt_title)
	return H && H.scpize()


/datum/job/scp999
	title = "SCP-999"
	department_flag = MSC
	total_positions = 1
	spawn_positions = 1
	supervisors = "Yourself"
	selection_color = "#254c25"
	minimal_player_age = 0
	account_allowed = 0
	economic_power = 0
	loadout_allowed = FALSE
	hud_icon = "hudblank"
	skill_points = 0
	no_skill_buffs = TRUE

/datum/job/scp999/handle_variant_join(var/mob/living/carbon/human/H, var/alt_title)
	return H && H.spcize()