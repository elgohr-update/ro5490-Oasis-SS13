// These can only be applied by blobs. They are what blobs are made out of.
// The 4 damage
datum/reagent/blob/boiling_oil
	name = "Boiling Oil"
	id = "boiling_oil"
	description = ""
	color = "#000000"

datum/reagent/blob/boiling_oil/reaction_mob(var/mob/living/M as mob, var/method=TOUCH, var/volume)
	if(method == TOUCH)
		M.apply_damage(15, BURN)
		M.adjust_fire_stacks(2)
		M.IgniteMob()
		M << "<span class = 'userdanger'>The blob splashes you with burning oil!</span>"
		M.emote("scream")

datum/reagent/blob/toxic_goop
	name = "Toxic Goop"
	id = "toxic_goop"
	description = ""
	color = "#008000"

datum/reagent/blob/toxic_goop/reaction_mob(var/mob/living/M as mob, var/method=TOUCH, var/volume)
	if(method == TOUCH)
		M.apply_damage(20, TOX)
		M << "<span class = 'userdanger'>The blob strikes you, and you feel sick and nauseated!</span>"

datum/reagent/blob/skin_ripper
	name = "Skin Ripper"
	id = "skin_ripper"
	description = ""
	color = "#FF4C4C"

datum/reagent/blob/skin_ripper/reaction_mob(var/mob/living/M as mob, var/method=TOUCH, var/volume)
	if(method == TOUCH)
		M.apply_damage(20, BRUTE)
		M << "<span class = 'userdanger'>The blob strikes you, and you feel your skin ripping and tearing off!</span>"
		M.emote("scream")

datum/reagent/blob/anti_oxygenation
	name = "Anti-Oxygenation Liquid"
	id = "anti_oxygenation"
	description = ""
	color = "#00FFFF"

datum/reagent/blob/anti_oxygenation/reaction_mob(var/mob/living/M as mob, var/method=TOUCH, var/volume)
	if(method == TOUCH)
		M.apply_damage(20, OXY)
		M << "<span class = 'userdanger'>The blob strikes you, and you feel dizzy and out of breath!</span>"

datum/reagent/blob/stamina_drainer
	name = "Stamina Drainer"
	id = "stamina_drainer"
	description = ""
	color = "#FFFF00"

datum/reagent/blob/stamina_drainer/reaction_mob(var/mob/living/M as mob, var/method=TOUCH, var/volume)
	if(method == TOUCH)
		M.apply_damage(30, STAMINA)
		M.apply_damage(10, BRUTE)
		M << "<span class = 'userdanger'>The blob strikes you, and you feel winded and weak!</span>"

// Combo Reagents

datum/reagent/blob/skin_melter
	name = "Skin Melter"
	id = "skin_melter"
	description = ""
	color = "#7F0000"

datum/reagent/blob/skin_melter/reaction_mob(var/mob/living/M as mob, var/method=TOUCH, var/volume)
	if(method == TOUCH)
		M.apply_damage(10, BRUTE)
		M.apply_damage(10, BURN)
		M.adjust_fire_stacks(2)
		M.IgniteMob()
		M << "<span class = 'userdanger'>The blob strikes you, and you feel your skin char and melt!</span>"
		M.emote("scream")

datum/reagent/blob/lung_destroying_toxin
	name = "Lung Destroying Toxin"
	id = "lung_destroying_toxin"
	description = ""
	color = "#00FFC5"

datum/reagent/blob/lung_destroying_toxin/reaction_mob(var/mob/living/M as mob, var/method=TOUCH, var/volume)
	if(method == TOUCH)
		M.apply_damage(10, OXY)
		M.apply_damage(10, TOX)
		M << "<span class = 'userdanger'>The blob strikes you, and your lungs feel heavy and weak!</span>"
// Special Reagents
datum/reagent/blob/acid
	name = "Acidic Liquid"
	id = "blob_acid"
	description = ""
	color = "#BD80F4"

datum/reagent/blob/acid/reaction_mob(var/mob/living/M as mob, var/method=TOUCH, var/volume)
	if(method == TOUCH)
		M.acid_act(20,1,10)
		M.apply_damage(10, BRUTE)
		M << "<span class = 'userdanger'>The blob's tendrils melt though your equipment!</span>"

datum/reagent/blob/radioactive_liquid
	name = "Radioactive Liquid"
	id = "radioactive_liquid"
	description = ""
	color = "#00EE00"

datum/reagent/blob/radioactive_liquid/reaction_mob(var/mob/living/M as mob, var/method=TOUCH, var/volume)
	if(method == TOUCH)
		M.apply_damage(10, BRUTE)
		M.apply_effect(10,IRRADIATE,0)
		if(prob(33))
			randmuti(M)
			if(prob(98))
				randmutb(M)
			else
				randmutg(M)
			domutcheck(M, null)
			updateappearance(M)
		M << "<span class = 'userdanger'>The blob strikes you, and your skin feels papery and everything hurts!</span>"

datum/reagent/blob/dark_matter
	name = "Dark Matter"
	id = "dark_matter"
	description = ""
	color = "#3A115F"

datum/reagent/blob/dark_matter/reaction_mob(var/mob/living/M as mob, var/method=TOUCH, var/volume)
	if(method == TOUCH)
		M.apply_damage(15, BRUTE)
		var/turf/pull = get_turf(M)
		for(var/atom/movable/X in orange(4,pull))
			if(istype(X, /atom/movable))
				if((X) && (!istype(X,/mob/living/carbon/human)))
					X.throw_at(pull)
				else if(istype(X,/mob/living/carbon/human))
					var/mob/living/carbon/human/H = X
					if(istype(H.shoes,/obj/item/clothing/shoes/magboots))
						var/obj/item/clothing/shoes/magboots/S = H.shoes
						if(S.magpulse)
							continue
					X.throw_at(pull)
		M << "<span class = 'userdanger'>You feel a thrum as the blob strikes you, and everything flies at you!</span>"

datum/reagent/blob/sorium
	name = "Sorium"
	id = "sorium"
	description = ""
	color = "#808000"

datum/reagent/blob/sorium/reaction_mob(var/mob/living/M as mob, var/method=TOUCH, var/volume)
	if(method == TOUCH)
		M.apply_damage(15, BRUTE)
		if(prob(70))
			var/end_dir
			if(M.dir == NORTH && !end_dir)
				end_dir = SOUTH
			if(M.dir == SOUTH && !end_dir)
				end_dir = NORTH
			if(M.dir == EAST && !end_dir)
				end_dir = WEST
			if(M.dir == WEST && !end_dir)
				end_dir = EAST
			var/atom/throw_target = get_edge_target_turf(M, end_dir)
			M.throw_at(throw_target, 200, 4)
			M << "<span class = 'userdanger'>The blob slams into you, and sends you flying!</span>"


datum/reagent/blob/explosive // I'm gonna burn in hell for this one
	name = "Explosive Gelatin"
	id = "explosive"
	description = ""
	color = "#FFA500"

datum/reagent/blob/explosive/reaction_mob(var/mob/living/M as mob, var/method=TOUCH, var/volume)
	if(method == TOUCH)
		if(prob(75))
			M << "<span class = 'userdanger'>The blob strikes you, and its tendrils explode!</span>"
			explosion(M.loc, 0, 0, 1, 0, 0)