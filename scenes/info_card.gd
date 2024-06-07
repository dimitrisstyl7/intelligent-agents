extends Node2D

var agent: Node

@onready var label_agent_id = %LabelAgentID
@onready var label_agent_village = %LabelAgentVillage
@onready var label_state = %LabelState
@onready var label_energy = %LabelEnergy
@onready var label_resource = %LabelResource
@onready var label_map_discovery = %LabelMapDiscovery


func _on_ready():
	update_info()

func _on_timer_timeout():
	update_info()

func update_info():
	if agent != null:
		
		# Convert the state enum to a string
		var state_string = ""
		match agent.current_state:
			agent.State.WALKING: state_string = "WALKING"
			agent.State.DECIDING: state_string = "DECIDING"
			agent.State.REFILLING: state_string = "REFILLING"
			agent.State.IDLE: state_string = "IDLE"
		label_state.text = "State: " + state_string
		label_agent_id.text = "Agent ID: " + str(agent.get_name())
		label_agent_village.text = "Village: " + str(agent.village_type)
		label_energy.text = "Energy: " + str(agent.energy)
		if agent.current_carrying_resource:
			label_resource.text = "Resource: " + str(agent.current_carrying_resource.type) + " (" + str(agent.current_carrying_resource.quantity) + ")"
		else:
			label_resource.text = "Resource: None"
		#label_map_discovery.text = "Map Discovery: " + str(agent.map_discovery)
