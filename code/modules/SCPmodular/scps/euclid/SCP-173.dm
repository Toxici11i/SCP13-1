/mob/living/scp_173
	name = "SCP-173"
	desc = "A statue, constructed from concrete and rebar with traces of Krylon brand spray paint"
	icon = 'code/modules/SCPmodular/spcicon/scpmobs/scp-173.dmi'
	icon_state = "173"

	maxHealth = 5000000000
	health = 5000000000

	var/last_snap = 0
	var/next_shit = 0
	var/list/next_blinks = list()

	var/last_player_shit = 0

/mob/living/scp_173/examine(mob/user)
	user << "<b><span class = 'euclid'><big>SCP-173</big></span></b> - [desc]"

/mob/living/scp_173/New()
	..()
	verbs += /mob/living/proc/ventcrawl

/mob/living/scp_173/Destroy()
	..()

/mob/living/scp_173/say(var/message)
	return // lol you can't talk

/mob/living/scp_173/proc/IsBeingWatched()
	// Am I being watched by eye pals?
	for (var/mob/living/M in view(src, 7))


	// Am I being watched by anyone else?
	for(var/mob/living/carbon/human/H in view(src, 7))
		if(is_blind(H) || H.eye_blind > 0)
			continue
		if(H.stat != CONSCIOUS)
			continue
		if(next_blinks[H] == null)
			next_blinks[H] = world.time+rand(25 SECONDS, 45 SECONDS)
		if(H.in view(src, 7))
			return TRUE
	return FALSE

/mob/living/scp_173/Move(a,b,f)
	if(IsBeingWatched())
		return FALSE
	return ..(a,b,f)

/mob/living/scp_173/movement_delay()
	return -5

/mob/living/scp_173/UnarmedAttack(var/atom/A)
	if(!IsBeingWatched() && ishuman(A))
		var/mob/living/carbon/human/H = A
		if(H.stat == DEAD)
			to_chat(src, "<span class='warning'><I>[H] is already dead!</I></span>")
			return
		visible_message("<span class='danger'>[src] snaps [H]'s neck!</span>")
		playsound(loc, pick('code/modules/SCPmodular/scpsounds/scp/spook/NeckSnap1.ogg', 'code/modules/SCPmodular/scpsounds/scp/spook/NeckSnap3.ogg'), 50, 1)
		H.death()


/mob/living/scp_173/Life()
	. = ..()
	if (isobj(loc))
		return
	var/list/our_view = view(src, 7)
	for(var/A in next_blinks)
		if(!(A in our_view))
			next_blinks[A] = null
			continue
		if(world.time >= next_blinks[A])
			var/mob/living/carbon/human/H = A
			if(H.stat) // Sleeping or dead people can't blink!
				next_blinks[A] = null
				continue
			H.visible_message("<span class='notice'>[H] blinks.</span>")
			H.eye_blind += 2
			next_blinks[H] = 10+world.time+rand(25 SECONDS, 45 SECONDS)
	if(client)
		return
	if(IsBeingWatched())
		return
	if(world.time >= next_shit)
		next_shit = world.time+rand(5 MINUTES, 10 MINUTES)
		var/feces = pick(/obj/effect/decal/cleanable/blood, /obj/effect/decal/cleanable/blood/gibs, /obj/effect/decal/cleanable/mucus)
		new feces(loc)
		return
	var/mob/living/carbon/human/target
	var/mob/living/carbon/human/possible_targets = list(null)
	for(var/mob/living/carbon/human/H in our_view)
		if(H.stat == DEAD)
			continue
		if(!AStar(loc, H.loc, /turf/proc/AdjacentTurfs, /turf/proc/Distance, max_nodes=25, max_node_depth=7))
			continue // We can't reach this person anyways
		possible_targets += H
	if(world.time >= last_snap+50)
		var/turf/spot
		target = pick(possible_targets)
		if (target)
			var/turf/behind_target = get_step(target.loc, turn(target.dir, 180))
			if(get_dist(behind_target, loc) <= 7)
				spot = behind_target
			else
				var/list/directions = shuffle(GLOB.cardinal.Copy())
				for(var/D in directions)
					var/turf/T = get_step(target, D)
					if(get_dist(T, loc) <= 7)
						spot = T
						break
			if(!spot) // We couldn't find a spot to go to!
				return
			forceMove(spot)
			dir = get_dir(src, target)
			visible_message("<span class='danger'>[src] snaps [target]'s neck!</span>")
			playsound(loc, pick('code/modules/SCPmodular/scpsounds/scp/spook/NeckSnap1.ogg', 'code/modules/SCPmodular/scpsounds/scp/spook/NeckSnap3.ogg'), 50, 1)
			target.death()
			last_snap = world.time

/mob/living/scp_173/can_ventcrawl()
	if(IsBeingWatched())
		to_chat(src, "<span class='warning'>You're being watched!</span>")
		return FALSE
	return ..()

/mob/living/scp_173/verb/get_schwifty() // plz don't kill me for the reference
	set name = "Shit On Floor"
	set category = "SCP"
	if(!isobj(loc) && world.time >= (last_player_shit + (1 MINUTE)))
		last_player_shit = world.time
		var/feces = pick(/obj/effect/decal/cleanable/blood, /obj/effect/decal/cleanable/blood/gibs, /obj/effect/decal/cleanable/mucus)
		new feces(loc)



