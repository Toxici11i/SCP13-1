

/mob/living/carbon/human/proc/scpize()
	if (HAS_TRANSFORMATION_MOVEMENT_HANDLER(src))
		return
	for(var/obj/item/W in src)
		drop_from_inventory(W)
	regenerate_icons()
	ADD_TRANSFORMATION_MOVEMENT_HANDLER(src)
	icon = null
	set_invisibility(101)
	for(var/t in organs)	//this really should not be necessary
		qdel(t)

	var/mob/living/scp_173/A = new /mob/living/scp_173 (loc)
	A.a_intent = I_HURT
	A.key = key

	to_chat(A, "<B>You are now 173. Snap Snap.</B>")
	qdel(src)
	return

/mob/living/carbon/human/proc/spcize()
	if (HAS_TRANSFORMATION_MOVEMENT_HANDLER(src))
		return
	for(var/obj/item/W in src)
		drop_from_inventory(W)
	regenerate_icons()
	ADD_TRANSFORMATION_MOVEMENT_HANDLER(src)
	icon = null
	set_invisibility(101)
	for(var/t in organs)	//this really should not be necessary
		qdel(t)

	var/mob/living/simple_animal/scp_999/A = new /mob/living/simple_animal/scp_999 (loc)
	A.a_intent = I_HURT
	A.key = key

	to_chat(A, "<B>You are now 999. You feel happy!</B>")
	qdel(src)
	return
