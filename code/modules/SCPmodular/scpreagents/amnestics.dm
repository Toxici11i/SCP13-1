/*
	USE THIS FILE TO ADD ALL AMNESTIC RELATED REAGENTS AND EFFECTS
*/

/datum/reagent/amnestics
	name = "Amnestics"
	description = "Amnestics are applied to remove memories from a target, often to different degrees."
	taste_description = "something you forgot about already"
	reagent_state = LIQUID
	color = "#000000"


/datum/reagent/amnestics/classa
	name = "Class-A Amnestics"
	taste_description = "something you forgot about already"


/datum/reagent/amnestics/classa/on_mob_life(mob/living/M)
	to_chat(M, "<span class='notice'>You feel your memory drifting away...")
	to_chat(M, "<span class='boldannounce'>You have lost all memory up until the point before the last experiment (if any) you were involved in began. You must roleplay accordingly.</span>")
	M.visible_message("<span class='warning'>[M] looks confused for a moment.")
	playsound(src,'sound/misc/nymphchirp.ogg',3,3)
	holder.remove_reagent(/datum/reagent/amnestics/classa, volume)

/datum/reagent/amnestics/classb
	name = "Class-B Amnestics"
	color = "#00D9D9"
	taste_description = "something you forgot about already"

/datum/reagent/amnestics/classb/on_mob_life(mob/living/M)
	to_chat(M, "<span class='notice'>Your brain feels slightly emptier...")
	to_chat(M, "<span class='boldannounce'>You have lost all memory up until the point when the round began and you woke up. You must roleplay accordingly.</span>")
	M.visible_message("<span class='warning'>[M] looks a little dumber.")
	playsound(src,'sound/misc/nymphchirp.ogg',3,3)
	holder.remove_reagent(/datum/reagent/amnestics/classb, volume)

/datum/reagent/amnestics/classc
	name = "Class-C Amnestics"
	color = "#cd7f32"
	taste_description = "something you forgot about already"

/datum/reagent/amnestics/classc/on_mob_life(mob/living/M)
	to_chat(M, "<span class='notice'>Memories are ripped out of your head!")
	to_chat(M, "<span class='boldannounce'>You have lost all memory up until the point when you arrived at the foundation, and have no idea how you got here. You must roleplay accordingly.</span>")
	M.visible_message("<span class='warning'>[M] looks like they've suddenly gotten lost.")
	playsound(src,'sound/misc/nymphchirp.ogg',3,3)
	holder.remove_reagent(/datum/reagent/amnestics/classc, volume)

/datum/reagent/amnestics/classe
	name = "Class-E Amnestics"
	color = "#fa8072"
	taste_description = "something you forgot about already"

/datum/reagent/amnestics/classe/on_mob_life(mob/living/M)
	to_chat(M, "<span class='notice'>Who... Am... I?")
	to_chat(M, "<span class='boldannounce'>You have lost every memory you hold dear and every aspect of your identity has been torn away to be re-modelled like clay. You must roleplay accordingly.</span>")
	M.visible_message("<span class='warning'>[M] falls completely still for a moment, before raising their head with a cold, dull look in their eyes.")
	playsound(src,'sound/misc/nymphchirp.ogg',3,3)
	holder.remove_reagent(/datum/reagent/amnestics/classe, volume)

/datum/reagent/amnestics/machoman
	name = "Class-E Amnestics"
	color = "#fa8072"
	taste_description = "OHH YEAH"

/datum/reagent/amnestics/machoman/on_mob_life(mob/living/M)
	to_chat(M, "<span class='notice'>TIME TO KILL STUFF")
	to_chat(M, "<span class='boldannounce'>YOU HAVE BECOME MACHO MAN YOURSELF. YOU ARE MACHO MAN, AND NOTHING OTHER THAN THAT. ROBUST PEOPLE INTO SUBMISSION, OHHHHHHHHHHHHHHHHHHHHH YEAH</span>")
	M.visible_message("<span class='warning'>[M] suddenly becomes more energetic, the desire of wrestling fills their eyes. <b><i>Run</b></i>")
	playsound(src,'sound/misc/nymphchirp.ogg',3,3)
	holder.remove_reagent(/datum/reagent/amnestics/classe, volume)