
TYPE
	VisuCtrl_type : 	STRUCT 
		buttons : VisuCtrl_buttons_type;
		numInputs : VisuCtrl_numInputs_type;
		numOutputs : VisuCtrl_numOutputs_type;
	END_STRUCT;
	VisuCtrl_buttons_type : 	STRUCT 
		buttonAddToList : BOOL;
	END_STRUCT;
	VisuCtrl_numInputs_type : 	STRUCT 
		batch : UINT;
		material : STRING[80];
	END_STRUCT;
	VisuCtrl_numOutputs_type : 	STRUCT 
		New_Member : USINT;
	END_STRUCT;
END_TYPE
