extends Button

@onready var line_edit_row = $"../../GridContainerParameters/VBoxContainerInput/HBoxContainerRow/LineEdit"
@onready var line_edit_column = $"../../GridContainerParameters/VBoxContainerInput/HBoxContainerColumn/LineEdit"
@onready var line_edit_stone = $"../../GridContainerParameters/VBoxContainerInput/HBoxContainerStone/LineEdit"
@onready var line_edit_wood = $"../../GridContainerParameters/VBoxContainerInput/HBoxContainerWood/LineEdit"
@onready var line_edit_gold = $"../../GridContainerParameters/VBoxContainerInput/HBoxContainerGold/LineEdit"
@onready var line_edit_agents = $"../../GridContainerParameters/VBoxContainerInput/HBoxContainerAgents/LineEdit"

func _on_button_start_pressed():
	var rows: int = line_edit_row.text.to_int()
	var cols: int = line_edit_column.text.to_int()
	var stone: int = line_edit_stone.text.to_int()
	var wood: int = line_edit_wood.text.to_int()
	var gold: int = line_edit_gold.text.to_int()
	var agents: int = line_edit_agents.text.to_int()
	
	var goal := calculate_goal(wood, stone, gold, agents)
	Village.set_target_resource_quantity(goal)	
	
	MapGenerator.set_input_arguments(rows, cols, stone, wood, gold, agents)
	get_tree().change_scene_to_file("res://scenes/map_generator.tscn")
	
func calculate_goal(wood: int, stone: int, gold: int, agents: int) -> Dictionary:
	"""
		This function calculates the resource gathering goals based on the number
		of agents and predefined maximum carry capacities.
	"""
	var wood_goal: int = agents * Common.RESOURCE_MAXIMUM_CARRY_CAPACITY_PER_AGENT.wood * 2
	var stone_goal: int = agents * Common.RESOURCE_MAXIMUM_CARRY_CAPACITY_PER_AGENT.stone * 2
	var gold_goal: int = agents * Common.RESOURCE_MAXIMUM_CARRY_CAPACITY_PER_AGENT.gold * 2
	return {'wood': wood_goal, 'stone': stone_goal, 'gold': gold_goal}
