/*
	These are simple defaults for your project.
 */

world
	fps = 25		// 25 frames per second
	icon_size = 32	// 32x32 icon size by default
	view = 6		// show up to 6 tiles outward from center (13x13 view)

// Make objects move 8 pixels per tick when walking

mob
	step_size = 8
	var
		// Combat passive skills
		bone_breaker = 0
		laceration = 0
		deflection = 0
		
		// Energy skills
		energy_master = 0
		energy_manipulation = 0
		regeneration = 0
		energy_deflection = 0
		energy_recovery = 0
		
		// Technology skills
		androids = 0
		cyborgs = 0
		parts = 0
		artificial_skin = 0
		efficient = 0
		study = 0
		implants = 0
		self_borgification = 0
		
		// Points system
		skill_points = 0

obj
	step_size = 8

// Initialize the skin when the game starts
world/New()
	..()
	// Set up the main window
	winset(src, "mainwindow", "is-visible=true")
	
	// Set up the map view
	winset(src, "mainwindow.map", "icon-size=32")
	
	// Set up the output windows
	winset(src, "mainwindow.mainOutput", "text-color=#c0c0c0")
	winset(src, "mainwindow.ICoutput", "text-color=#c0c0c0")
	
	// Set up the input window
	winset(src, "mainwindow.input", "text-color=#c0c0c0")
	
	// Initialize passive skill windows as hidden
	winset(src, "combatPasWindow", "is-visible=false")
	winset(src, "techPasWindow", "is-visible=false")
	winset(src, "mutationsWindow", "is-visible=false")
	winset(src, "bountiesWindow", "is-visible=false")

// Update skill labels
mob/proc/UpdateSkillLabels()
	// Combat skills
	winset(src, "combatPasWindow.bbreakerLb", "text=[bone_breaker]")
	winset(src, "combatPasWindow.lacerationLb", "text=[laceration]")
	winset(src, "combatPasWindow.deflectionLb", "text=[deflection]")
	
	// Energy skills
	winset(src, "combatPasWindow.emasterLb", "text=[energy_master]")
	winset(src, "combatPasWindow.emanipLb", "text=[energy_manipulation]")
	winset(src, "combatPasWindow.regenLb", "text=[regeneration]")
	winset(src, "combatPasWindow.edeflectionLb", "text=[energy_deflection]")
	winset(src, "combatPasWindow.recovLb", "text=[energy_recovery]")
	
	// Technology skills
	winset(src, "techPasWindow.androidsLb", "text=[androids]")
	winset(src, "techPasWindow.cyborgsLb", "text=[cyborgs]")
	winset(src, "techPasWindow.partsLb", "text=[parts]")
	winset(src, "techPasWindow.skinLb", "text=[artificial_skin]")
	winset(src, "techPasWindow.efficientLb", "text=[efficient]")
	winset(src, "techPasWindow.studyLb", "text=[study]")
	winset(src, "techPasWindow.implantsLb", "text=[implants]")
	winset(src, "techPasWindow.selfBorgLb", "text=[self_borgification]")
	
	// Update points
	winset(src, "combatPasWindow.pointsLb", "text=[skill_points]")
	winset(src, "techPasWindow.pointsLb", "text=[skill_points]")

// Button click handlers
mob/proc/BBreakerClick()
	if(skill_points > 0)
		bone_breaker++
		skill_points--
		UpdateSkillLabels()

mob/proc/LacerationClick()
	if(skill_points > 0)
		laceration++
		skill_points--
		UpdateSkillLabels()

mob/proc/DeflectionClick()
	if(skill_points > 0)
		deflection++
		skill_points--
		UpdateSkillLabels()

// Add similar handlers for other skills...
