(**********************************  ESTRUCTURA DE MAQUINA GLOBAL *********************************)
(***********************************************************************************************************************)

TYPE
	Machine_ctrl_type : 	STRUCT 
		cmd : Machine_cmd_type;
		param : Machine_param_type;
		status : Machine_status_type;
		state : Machine_state_type;
	END_STRUCT;
	Machine_cmd_type : 	STRUCT 
	END_STRUCT;
	Machine_param_type : 	STRUCT 
	END_STRUCT;
	Machine_status_type : 	STRUCT 
	END_STRUCT;
	Machine_state_type : 	STRUCT 
	END_STRUCT;
END_TYPE

(**********************************  ESTRUCTURA DE VARIABLES REMANENTES *********************************)
(***********************************************************************************************************************)

TYPE
	Machine_remanent_type : 	STRUCT 
	END_STRUCT;
END_TYPE

(**********************************  ESTRUCTURA DE VISU *********************************)
(***********************************************************************************************************************)

TYPE
	Visu_type : 	STRUCT 
		buttons : Visu_buttons_type;
		numInputs : Visu_numInputs_type;
		numOutputs : Visu_numOutputs_type;
	END_STRUCT;
	Visu_buttons_type : 	STRUCT 
	END_STRUCT;
	Visu_numInputs_type : 	STRUCT 
	END_STRUCT;
	Visu_numOutputs_type : 	STRUCT 
	END_STRUCT;
END_TYPE
