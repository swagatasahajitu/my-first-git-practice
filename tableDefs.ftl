<#-- standard field sets -->
<#assign method=[
	{"field":"MaterialsAndMethods.Guideline", "params":{"before":"", "after":""}},
	{"field":"MaterialsAndMethods.MethodNoGuideline"},
	{"field":"MaterialsAndMethods.GLPComplianceStatement", "params":{"before":"GLP compliance:", "after":""}}
	] />
<#assign testMethod=[{"field":"MaterialsAndMethods.TestType"}] + method />
<#assign studyMethod=[{"field":"MaterialsAndMethods.StudyType"}] + method />
<#assign endpointMethod=[{"field":"AdministrativeData.Endpoint"}] + method />
<#assign limitMethod=[{"field":"MaterialsAndMethods.LimitTest"}] + method />
<#assign endpointLimitMethod=[{"field":"AdministrativeData.Endpoint"}] + limitMethod />
<#assign endpointStudyMethod=[{"field":"AdministrativeData.Endpoint"}] + studyMethod />
<#assign testMaterial=[
	{"field":"MaterialsAndMethods.TestMaterials.TestMaterialInformation", "macro":"testMaterialInformation"},
	{"field":"MaterialsAndMethods.TestMaterials.AdditionalTestMaterialInformation"}
	] />
<#assign testMaterialWithComposition=testMaterial + [{"field":"MaterialsAndMethods.TestMaterials.TestMaterialInformation", "macro":"CompositionList"}] />
<#assign relevantInfo=[
	{"field":"MaterialsAndMethods.LimitTest"},
	{"field":"MaterialsAndMethods.TestAnimals.Species"},
	{"field":"MaterialsAndMethods.TestAnimals.Sex"},
	{"field":"AdministrationExposure.Vehicle"},
	{"field":"AdministrationExposure.DetailsOnExposure"},
	{"field":"AdministrationExposure.DosesConcentrations"},
	{"field":"AdministrationExposure.NoOfAnimalsPerSexPerDose"}
] />
<#assign reference=[
	{"field":"DataSource.Reference"}
] />
<#assign reliability=[
	{"field":"AdministrativeData.StudyResultType"},
	{"field":"AdministrativeData.Reliability"},
	{"field":"AdministrativeData.PurposeFlag"}
] />
<#assign species=[
	{"field":"MaterialsAndMethods.TestAnimals.Species", "params":{"before":"","after":":"}},
	{"field":"MaterialsAndMethods.TestAnimals.Strain", "params":{"before":"","after":""}},
	{"field":"MaterialsAndMethods.TestAnimals.Sex", "params":{"before":"(","after":")"}},
	{"field":"MaterialsAndMethods.AdministrationExposure.NoOfAnimalsPerSexPerDose", "params":{"before":"[", "after":"]"}}
] />
<#-- standard column sets -->
<#assign columnSet1=[
	"Material and method, Remarks",
	"Results",
	"References"] />
<#assign columnSet2=[
	"Method, guideline, deviations if any",
	"Species, strain, sex, no/group", 
	"Test substance, dose levels, duration of exposure",
	"Results",
	"References"] />
<#assign columnSet3=[
	"Type of data/report, substance exposed to etc.",
	"Relevant information about the study (as applicable)",
	"Observations",
	"References"] />
<#assign columnSet4=[
	"Type of study/data, test substance",
	"Relevant information about the study (as applicable)",
	"Observations",
	"References"] />	

<#assign degreeOfPurityKey = "Degree of purity (%) (if relevant for the entry in Annex VI)">

<#assign table_1 = {
	"title":"Substance identity and information related to molecular and structural formula of the substance",
"columnWidths": [35,65],
"columns": ["Information on optical activity and typical ratio of (stereo) isomers (if applicable and appropriate)",
"Degree of purity (%) (if relevant for the entry in Annex VI)",
"Description of the manufacturing process and identity of the source (for UVCB substances only)",
"CAS number (if available)",
"Molecular formula",
"Molecular weight or molecular weight range",
"SMILES notation (if available)",
"Structural formula",
"EC name (if available and appropriate)",
"EC number (if available and appropriate)",
"ISO common name (if available and appropriate)",
"Other identity code (if available)"
],
	"docDefIds":{
"FLEXIBLE_RECORD.AnalyticalInformation": {
			"Information on optical activity and typical ratio of (stereo) isomers (if applicable and appropriate)": [
				{
				"field": "AnalyticalInformation.MethodsAndResultsOfAnalysis",
				"subfields": {
					"OpticalActivity": "OpticalActivity"
                }}
			]
},
"FLEXIBLE_RECORD.SubstanceComposition": {
			"Degree of purity (%) (if relevant for the entry in Annex VI)": [
				{"field":"DegreeOfPurity.Purity"}
			],
			"Description of the manufacturing process and identity of the source (for UVCB substances only)": [
				{"field":"GeneralInformation.DescriptionOfComposition"}
			]
},
"SUBSTANCE": {
			"CAS number (if available)": [
				{
				"field": "ReferenceSubstance.ReferenceSubstance",
				"subfields": {
					"Inventory.CASNumber": "Inventory.CASNumber"
                }}
			], 
			"Molecular formula": [
				{
				"field": "ReferenceSubstance.ReferenceSubstance",
				"subfields": {
					"MolecularStructuralInfo.MolecularFormula": "MolecularStructuralInfo.MolecularFormula"
                }}
			],
			"Molecular weight or molecular weight range": [
				{
				"field": "ReferenceSubstance.ReferenceSubstance",
				"subfields": {
					"MolecularStructuralInfo.MolecularWeightRange": "MolecularStructuralInfo.MolecularWeightRange"
                }}
			],
			"SMILES notation (if available)": [
				{
				"field": "ReferenceSubstance.ReferenceSubstance",
				"subfields": {
					"MolecularStructuralInfo.SmilesNotation": "MolecularStructuralInfo.SmilesNotation"
                }}
			],
			"Structural formula": [
				{
				"field": "ReferenceSubstance.ReferenceSubstance",
				"subfields": {
					"MolecularStructuralInfo.StructuralFormula": "MolecularStructuralInfo.StructuralFormula"
                }}
			],
			"EC name (if available and appropriate)": [
				{
				"field": "ReferenceSubstance.ReferenceSubstance",
				"subfields": {
					"Inventory.InventoryEntry": "Inventory.InventoryEntry"
                }}
			],
			"EC number (if available and appropriate)": [
				{
				"field": "ReferenceSubstance.ReferenceSubstance",
				"subfields": {
					"Inventory.InventoryEntry": "Inventory.InventoryEntry"
                }}  
			],
			"ISO common name (if available and appropriate)": [
				{
				"field": "OtherNames",
				"subfields": {
					"Name": "Name", "params":{"NameType": "NameType"}
					
                }}
			],
			"Other identity code (if available)": [
				{
				"field": "OtherNames",
				"subfields": {
					"Name": "Name", "params":{"noParams": "noParams"}
				}}
			]
}}}/>


<#assign table_2 = {
	"title":"Constituents (non-confidential information) ",
 "columnWidths": [35, 35, 15, 15],
 "blockId":"Constituents.Constituents",
"columns": [
	"Constituent (Name and numerical identifier)",
	"Concentration range (% w/w minimum and maximum in multi-constituent substances)",
	"Current CLH in Annex VI Table 3 (CLP)",
	"Current self- classification and labelling (CLP)"
	],
	"docDefIds":{
		"FLEXIBLE_RECORD.SubstanceComposition": {
			"Constituent (Name and numerical identifier)": [
				{
				"field": "ReferenceSubstance",
				"subfields": {
					"Inventory.InventoryEntry": "Inventory.InventoryEntry"
                }}
			],
			"Concentration range (% w/w minimum and maximum in multi-constituent substances)": [
				{"field":"Concentration"}
			]
}
}}/>


<#assign table_3 = {
	"title":"Impurities (non-confidential information) if relevant for the classification of the substance",
	 "columnWidths": [35, 35, 10, 10, 10],
"columns": [
	"Impurity (Name and numerical identifier)",
	"Concentration range (% w/w minimum and maximum)",
	"Current CLH in Annex VI Table 3 (CLP)",
	"Current self- classification and labelling (CLP)",
	"The impurity contributes to the classification and labelling"
],
"blockId":"Impurities.Impurities",
	"docDefIds":{
		"FLEXIBLE_RECORD.SubstanceComposition": {
			"Impurity (Name and numerical identifier)":  [
				{
				"field": "ReferenceSubstance",
				"subfields": { 
					"Inventory.InventoryEntry": "Inventory.InventoryEntry"
                }}
			],
			"Concentration range (% w/w minimum and maximum)": [
				{"field":"Concentration"}
			],
			"The impurity contributes to the classification and labelling":  [
				{"field":"RelevantForClassificationLabeling"}
			]
}
<#--,
"REFERENCE_SUBSTANCE": {
			"Impurity (Name and numerical identifier)": [
				{"field":"Inventory.CASNumber"},
				{"field":"Synonyms.Synonyms"}
			]
}-->
}}/>


<#assign table_4 = {
	"title":"Additives (non-confidential information) if relevant for the classification of the substance",
"columnWidths": [25, 25, 10, 15, 15, 10],
"blockId":"Additives.Additives",
"columns": [
	"Additive (Name and numerical identifier)",
	"Function",
	"Concentration range (% w/w minimum and maximum)",
	"Current CLH in Annex VI Table 3 (CLP)",
	"Current self- classification and labelling (CLP)",
	"The additive contributes to the classification and labelling"
	],
	"docDefIds":{
		"FLEXIBLE_RECORD.SubstanceComposition": {
			"Additive (Name and numerical identifier)":  [
				{
				"field": "ReferenceSubstance",
				"subfields": { 
					"Inventory.InventoryEntry": "Inventory.InventoryEntry"
                }}
			],

			"Function": [
				{"field":"Function"}
			],

			"Concentration range (% w/w minimum and maximum)": [
				{"field":"Concentration"}
			],

			"The additive contributes to the classification and labelling": [
				{"field":"RelevantForClassificationLabeling"}
			]
}<#--,
"REFERENCE_SUBSTANCE": {
			"Additive (Name and numerical identifier)": [
				{"field":"Inventory.CASNumber"},
				{"field":"Synonyms.Synonyms"}
			]
}-->
}}/>


<#assign table_5 = {
	"title":"Test substances (non-confidential information) (this table is optional)",
"columns": [
	"Identification of test substance",
	"Purity",
	"Impurities and additives (identity, %, classification if available)",
	"Other information",
	"The study(ies) in which the test substance is used"
],
	"docDefIds":{
		"FLEXIBLE_RECORD.SubstanceComposition": {
			"Impurities and additives (identity, %, classification if available)": [
				{"field":"Composition.CompositionList"}
			],
			"Other information": [
				{"field":"Composition.OtherCharacteristics.DetailsOnTestMaterial"}
			],
			"Purity": [
				{"field":"Composition.CompositionList"}
			]
}}}/>


<#assign table_7 = {
	"title":"Reason for not proposing harmonised classification and status under consultation",
"columnWidths": [30,50,20],
"columns": ["Explosives",
"Flammable gases (including chemically unstable gases)",
"Oxidising gases",
"Gases under pressure",
"Flammable liquids",
"Flammable solids",
"Self-reactive substances",
"Pyrophoric liquids",
"Pyrophoric solids",
"Self-heating substances",
"Substances which in contact with water emit flammable gases",
"Oxidising liquids",
"Oxidising solids",
"Organic peroxides",
"Corrosive to metals",
"Acute toxicity via oral route",
"Acute toxicity via dermal route",
"Acute toxicity via inhalation route",
"Skin corrosion/irritation",
"Serious eye damage/eye irritation",
"Respiratory sensitisation",
"Skin sensitisation",
"Germ cell mutagenicity",
"Carcinogenicity",
"Reproductive toxicity",
"Specific target organ toxicity-single exposure",
"Specific target organ toxicity-repeated exposure",
"Aspiration hazard",
"Endocrine disruption for HH",
"Hazardous to the aquatic environment",
"Endocrine disruption for ENV",
"PBT/vPvB",
"PMT/vPvM",
"Hazardous to the ozone layer"],
"docDefIds":{
		"FLEXIBLE_RECORD.Ghs": {
        "Explosives": [
            {"field":"Classification.PhysicalHazards.Explosives.ReasonForNoClassification", "params":{"before":"", "after":""}}
        ],
        "Flammable gases (including chemically unstable gases)": [
            {"field":"Classification.PhysicalHazards.FlammableGases.ReasonForNoClassification", "params":{"before":"", "after":""}}
        ],
        "Oxidising gases": [
            {"field":"Classification.PhysicalHazards.OxidisingGases.ReasonForNoClassification", "params":{"before":"", "after":""}}
        ],
        "Gases under pressure": [
            {"field":"Classification.PhysicalHazards.GasesPres.ReasonForNoClassification", "params":{"before":"", "after":""}}
        ],
        "Flammable liquids": [
            {"field":"Classification.PhysicalHazards.FlammableLiquids.ReasonForNoClassification", "params":{"before":"", "after":""}}
        ],
        "Flammable solids": [
            {"field":"Classification.PhysicalHazards.FlammableSolids.ReasonForNoClassification", "params":{"before":"", "after":""}}
        ],
        "Self-reactive substances": [
            {"field":"Classification.PhysicalHazards.SelfReactiveSubstMixt.ReasonForNoClassification", "params":{"before":"", "after":""}}
        ],
        "Pyrophoric liquids": [
            {"field":"Classification.PhysicalHazards.PyrophoricLiquids.ReasonForNoClassification", "params":{"before":"", "after":""}}
        ],
        "Pyrophoric solids": [
            {"field":"Classification.PhysicalHazards.PyrophoricSolids.ReasonForNoClassification", "params":{"before":"", "after":""}}
        ],
        "Self-heating substances": [
            {"field":"Classification.PhysicalHazards.SelfHeatSubstMixt.ReasonForNoClassification", "params":{"before":"", "after":""}}
        ],
        "Substances which in contact with water emit flammable gases": [
            {"field":"Classification.PhysicalHazards.SubstMixtWater.ReasonForNoClassification", "params":{"before":"", "after":""}}
        ],
        "Oxidising liquids": [
            {"field":"Classification.PhysicalHazards.OxidisingLiquids.ReasonForNoClassification", "params":{"before":"", "after":""}}
        ],
        "Oxidising solids": [
            {"field":"Classification.PhysicalHazards.OxidisingSolids.ReasonForNoClassification", "params":{"before":"", "after":""}}
        ],
        "Organic peroxides": [
            {"field":"Classification.PhysicalHazards.OrganicPeroxides.ReasonForNoClassification", "params":{"before":"", "after":""}}
        ],
        "Corrosive to metals": [
            {"field":"Classification.PhysicalHazards.CorMetals.ReasonForNoClassification", "params":{"before":"", "after":""}}
        ],
        "Acute toxicity via oral route": [
            {"field":"Classification.HealthHazards.AcuteToxicityOral.ReasonForNoClassification", "params":{"before":"", "after":""}}
        ],
        "Acute toxicity via dermal route": [
            {"field":"Classification.HealthHazards.AcuteToxicityDermal.ReasonForNoClassification", "params":{"before":"", "after":""}}
        ],
        "Acute toxicity via inhalation route": [
            {"field":"Classification.HealthHazards.AcuteToxicityInhalation.ReasonForNoClassification", "params":{"before":"", "after":""}}
        ],
        "Skin corrosion/irritation": [
            {"field":"Classification.HealthHazards.Irritation.ReasonForNoClassification", "params":{"before":"", "after":""}}
        ],
        "Serious eye damage/eye irritation": [
            {"field":"Classification.HealthHazards.EyeIrritation.ReasonForNoClassification", "params":{"before":"", "after":""}}
        ],
        "Respiratory sensitisation": [
            {"field":"Classification.HealthHazards.RespiratorySensitisation.ReasonForNoClassification", "params":{"before":"", "after":""}}
        ],
        "Skin sensitisation": [
            {"field":"Classification.HealthHazards.SkinSensitisation.ReasonForNoClassification", "params":{"before":"", "after":""}}
        ],
        "Germ cell mutagenicity": [
            {"field":"Classification.HealthHazards.GermCell.GermCell.ReasonForNoClassification", "params":{"before":"", "after":""}}
        ],
        "Carcinogenicity": [
            {"field":"Classification.HealthHazards.Carcinogenicity.Carcinogenicity.ReasonForNoClassification", "params":{"before":"", "after":""}}
        ],
        "Reproductive toxicity": [
            {"field":"Classification.HealthHazards.ReproductiveToxicity.ReproductiveToxicity.ReasonForNoClassification", "params":{"before":"", "after":""}}
        ],
        "Specific target organ toxicity-single exposure": [
            {"field":"Classification.HealthHazards.ToxicitySingle.Toxicity", "params":{"before":"", "after":""}}
        ],
        "Specific target organ toxicity-repeated exposure": [
            {"field":"Classification.HealthHazards.ToxicityRepeated.Toxicity", "params":{"before":"", "after":""}}
        ],
        "Aspiration hazard": [
            {"field":"Classification.HealthHazards.AspirationHazard.ReasonForNoClassification", "params":{"before":"", "after":""}}
        ],
        "Endocrine disruption for HH": [
            {"field":"Classification.HealthHazards.EndocDisruptHH.ReasonForNoClassification", "params":{"before":"", "after":""}}
        ],
        "Hazardous to the aquatic environment": [
            {"field":"Classification.EnvironmentalHazards.AquaticEnvironment.AcuteShortTerm.ReasonForNoClassification", "params":{"before":"", "after":""}},
            {"field":"Classification.EnvironmentalHazards.AquaticEnvironment.LongTerm.ReasonForNoClassification", "params":{"before":"", "after":""}}
        ],
        "Endocrine disruption for ENV": [
            {"field":"Classification.EnvironmentalHazards.EDENV.ReasonForNoClassification", "params":{"before":"", "after":""}}
        ],
        "PBT/vPvB": [
            {"field":"Classification.EnvironmentalHazards.PBT.ReasonForNoClassification", "params":{"before":"", "after":""}}
        ],
        "PMT/vPvM": [
            {"field":"Classification.EnvironmentalHazards.PMT.ReasonForNoClassification", "params":{"before":"", "after":""}}
        ],
        "Hazardous to the ozone layer": [
            {"field":"Classification.EnvironmentalHazards.OzoneLayer.HazardousOzone.ReasonForNoClassification", "params":{"before":"", "after":""}}
        ]
}}}/>


<#assign table_8 = {
	"title":"Summary of physicochemical properties ",
"columns": ["Comment (e.g. measured or estimated)",
"Value"],
	"docDefIds":{
		"ENDPOINT_SUMMARY.Dissociation": {
			"Comment (e.g. measured or estimated)": [
				{"field":"Discussion.Discussion"}
			],
			"Value": [
				{"field":"KeyValueForChemicalSafetyAssessment.pka"},
				{"field":"KeyValueForChemicalSafetyAssessment.AtTheTemperatureOf"}
			]
},
"ENDPOINT_STUDY_RECORD": {
			"Reference": reference
},
"ENDPOINT_STUDY_RECORD.AutoFlammability": {
			"Reference": reference
},
"ENDPOINT_STUDY_RECORD.BoilingPoint": {
			"Reference": reference
},
"ENDPOINT_STUDY_RECORD.Density": {
			"Reference": reference
},
"ENDPOINT_STUDY_RECORD.DissociationConstant": {
			"Reference": reference
},
"ENDPOINT_STUDY_RECORD.Explosiveness": {
			"Reference": reference
},
"ENDPOINT_STUDY_RECORD.Flammability": {
			"Reference": reference
},
"ENDPOINT_STUDY_RECORD.FlashPoint": {
			"Reference": reference
},
"ENDPOINT_STUDY_RECORD.GeneralInformation": {
			"Reference": reference
},
"ENDPOINT_STUDY_RECORD.Melting": {
			"Reference": reference
},
"ENDPOINT_STUDY_RECORD.Partition": {
			"Reference": reference
},
"ENDPOINT_STUDY_RECORD.StabilityOrganic": {
			"Reference": reference
},
"ENDPOINT_STUDY_RECORD.SurfaceTension": {
			"Reference": reference
},
"ENDPOINT_STUDY_RECORD.Vapour": {
			"Reference": reference
},
"ENDPOINT_STUDY_RECORD.Viscosity": {
			"Reference": reference
},
"ENDPOINT_STUDY_RECORD.WaterSolubility": {
			"Reference": reference
},
"ENDPOINT_SUMMARY.AutoFlammability": {
			"Comment (e.g. measured or estimated)": [
				{"field":"Discussion.Discussion"}
			],
			"Value": [
				{"field":"KeyValueForChemicalSafetyAssessment.AutoFlammability"},
				{"field":"KeyValueForChemicalSafetyAssessment.AtThePressureOf"}
			]
},
"ENDPOINT_SUMMARY.BoilingPoint": {
			"Comment (e.g. measured or estimated)": [
				{"field":"Discussion.Discussion"}
			],
			"Value": [
				{"field":"KeyValueForChemicalSafetyAssessment.BoilingPoint"},
				{"field":"KeyValueForChemicalSafetyAssessment.AtThePressureOf"}
			]
},
"ENDPOINT_SUMMARY.Explosiveness": {
			"Comment (e.g. measured or estimated)": [
				{"field":"Discussion.Discussion"}
			],
			"Value": [
				{"field":"KeyValueChemicalAssessment.Explosiveness"}
			]
},
"ENDPOINT_SUMMARY.Flammability": {
			"Comment (e.g. measured or estimated)": [
				{"field":"Discussion.Discussion"}
			],
			"Value": [
				{"field":"KeyValueChemicalAssessment.Flammability"}
			]
},
"ENDPOINT_SUMMARY.FlashPoint": {
			"Comment (e.g. measured or estimated)": [
				{"field":"Discussion.Discussion"}
			],
			"Value": [
				{"field":"KeyValueForChemicalSafetyAssessment.FlashPoint"},
				{"field":"KeyValueForChemicalSafetyAssessment.AtThePressureOf"}
			]
},
"ENDPOINT_SUMMARY.GeneralInformation": {
			"Comment (e.g. measured or estimated)": [
				{"field":"Discussion.Discussion"}
			],
			"Value": [
				{"field":"KeyValueForChemicalSafetyAssessment.PhysicalState"}
			]
},
"ENDPOINT_SUMMARY.Melting": {
			"Comment (e.g. measured or estimated)": [
				{"field":"Discussion.Discussion"}
			],
			"Value": [
				{"field":"KeyValueForChemicalSafetyAssessment.MelFreezPoint"},
				{"field":"KeyValueForChemicalSafetyAssessment.AtThePressureOf"}
			]
},
"ENDPOINT_SUMMARY.OxidisingProperties": {
			"Comment (e.g. measured or estimated)": [
				{"field":"Discussion.Discussion"}
			],
			"Value": [
				{"field":"KeyValueChemicalAssessment.Oxidising"}
			]
},
"ENDPOINT_SUMMARY.ParticleSize": {
			"Comment (e.g. measured or estimated)": [
				{"field":"Discussion.Discussion"}
			],
			"Value": [
				{"field":"KeyInformation.KeyInformation"}
			]
},
"ENDPOINT_SUMMARY.PartitionCoefficient": {
			"Comment (e.g. measured or estimated)": [
				{"field":"Discussion.Discussion"}
			],
			"Value": [
				{"field":"KeyValueForChemicalSafetyAssessment.LowKow"},
				{"field":"KeyValueForChemicalSafetyAssessment.TemperatureOf"}
			]
},
"ENDPOINT_SUMMARY.PcDensity": {
			"Comment (e.g. measured or estimated)": [
				{"field":"Discussion.Discussion"}
			],
			"Value": [
				{"field":"KeyValueForChemicalSafetyAssessment.RelativeDensity"},
				{"field":"KeyValueForChemicalSafetyAssessment.AtTheTemperatureOf"}
			]
},
"ENDPOINT_SUMMARY.StabilityOrganic.": {
			"Comment (e.g. measured or estimated)": [
				{"field":"Discussion.Discussion"}
			],
			"Value": [
				{"field":"KeyInformation.KeyInformation"}
			]
},
"ENDPOINT_SUMMARY.SurfaceTension": {
			"Comment (e.g. measured or estimated)": [
				{"field":"Discussion.Discussion"}
			],
			"Value": [
				{"field":"KeyValueForChemicalSafetyAssessment.SurfaceTension"},
				{"field":"KeyValueForChemicalSafetyAssessment.AtTheTemperatureOf"},
				{"field":"KeyValueForChemicalSafetyAssessment.Concentration"},
				{"field":"KeyValueForChemicalSafetyAssessment.CriticalMicelleConcentrationCMC"}
			]
},
"ENDPOINT_SUMMARY.Vapour": {
			"Comment (e.g. measured or estimated)": [
				{"field":"Discussion.Discussion"}
			],
			"Value": [
				{"field":"KeyValueForChemicalSafetyAssessment.VapourPressure"},
				{"field":"KeyValueForChemicalSafetyAssessment.TemperatureOf"}
			]
},
"ENDPOINT_SUMMARY.Viscosity": {
			"Comment (e.g. measured or estimated)": [
				{"field":"Discussion.Discussion"}
			],
			"Value": [
				{"field":"KeyValueForChemicalSafetyAssessment.Viscosity"},
				{"field":"KeyValueForChemicalSafetyAssessment.AtTheTemperatureOf"}
			]
},
"ENDPOINT_SUMMARY.WaterSolubility": {
			"Comment (e.g. measured or estimated)": [
				{"field":"Discussion.Discussion"}
			],
			"Value": [
				{"field":"KeyValueForChemicalSafetyAssessment.WaterSolubility"},
				{"field":"KeyValueForChemicalSafetyAssessment.TemperatureOf"}
			]
}}}/>


<#assign table_9 = {
	"title":"Summary table of studies on explosive properties",
"columnWidths": [40,40,20],
"columns": columnSet1,
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.Explosiveness": {
			"Material and method, Remarks": method + testMaterial + reliability,
			"References": reference,
			"Results": [
				{"field":"ResultsAndDiscussion.SmallScalePreliminaryTests"},
				{"field":"ResultsAndDiscussion.ResultsOfTestSeriesForExplosives"}
			]
}}}/>


<#assign table_10 = {
	"title":"Summary table of studies on flammable gases (including chemically unstable gases)",
"columnWidths": [40,40,20],
	"columns": columnSet1,
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.Flammability": {
			"Material and method, Remarks": method + testMaterial + reliability,
			"References": reference,
			"Results": [
				{"field":"ResultsAndDiscussion.FlammableGasesLowerAndUpperExplosionLimit"}
			]
}}}/>


<#assign table_11 = {
	"title":"Summary table of studies on oxidising gases",
"columnWidths": [40,40,20],
"columns": columnSet1,
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.OxidisingProperties": {
			"Material and method, Remarks": method + testMaterial + reliability,
			"References": reference,
			"Results": [
				{"field":"ResultsAndDiscussion.TestResultOxidisingGases"}
			]
}}}/>


<#assign table_12 = {
	"title":"Summary table of studies on gases under pressure",
"columnWidths": [40,40,20],
"columns": columnSet1,
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.GasesUnderPressure": {
			"Material and method, Remarks": method + testMaterial + reliability,
			"References": reference,
			"Results": [
				{"field":"ResultsAndDiscussion.TestResults"}
			]
}}}/>


<#assign table_13 = {
	"title":"Summary table of studies on flammable liquids",
"columnWidths": [40,40,20],
"columns": columnSet1,
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.FlashPoint": {
			"Material and method, Remarks": method + testMaterial + reliability,
			"References": reference,
			"Results": [
				{"field":"ResultsAndDiscussion.FlashPoint"}
			]
}}}/>


<#assign table_14 = {
	"title":"Summary table of studies on flammable solids",
"columnWidths": [40,40,20],
"columns": columnSet1,
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.Flammability": {
			"Material and method, Remarks": method + testMaterial + reliability,
			"References": reference,
			"Results": [
				{"field":"ResultsAndDiscussion.FlammableSolids"}
			]
}}}/>


<#assign table_15 = {
	"title":"Summary table of studies on self-reactivity",
"columnWidths": [40,40,20],
"columns": columnSet1,
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.SelfReactiveSubstances": {
			"Material and method, Remarks": method + testMaterial + reliability,
			"References": reference,
			"Results": [
				{"field":"ResultsAndDiscussion.SmallScalePreliminaryTests"},
				{"field":"ResultsAndDiscussion.ResultsOfTestSeriesForSelfReactiveSubstances"}
			]
}}}/>


<#assign table_16 = {
	"title":"Summary table of studies on pyrophoric liquids",
"columnWidths": [40,40,20],
"columns": columnSet1,
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.Flammability": {
			"Material and method, Remarks": method + testMaterial + reliability,
			"References": reference,
			"Results": [
				{"field":"ResultsAndDiscussion.PyrophoricLiquids"}
			]
}}}/>


<#assign table_17 = {
	"title":"Summary table of studies on pyrophoric solids",
"columnWidths": [40,40,20],
"columns": columnSet1,
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.Flammability": {
			"Material and method, Remarks": method + testMaterial + reliability,
			"References": reference,
			"Results": [
				{"field":"ResultsAndDiscussion.PyrophoricSolids"}
			]
}}}/>


<#assign table_18 = {
	"title":"Summary table of studies on self-heating substances",
"columnWidths": [40,40,20],
"columns": columnSet1,
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.AutoFlammability": {
			"Material and method, Remarks": method + testMaterial + reliability,
			"References": reference,
			"Results": [
				{"field":"ResultsAndDiscussion.AutoFlammability"},
				{"field":"ResultsAndDiscussion.RelativeSelfIgnitionTemperatureSolids"},
				{"field":"ResultsAndDiscussion.SelfIgnitionTemperatureOfDustAccumulation"}
			]
}}}/>


<#assign table_19 = {
	"title":"Summary table of studies on substances which in contact with water emit flammable gases",
"columnWidths": [40,40,20],
"columns": columnSet1,
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.Flammability": {
			"Material and method, Remarks": method + testMaterial + reliability,
			"References": reference,
			"Results": [
				{"field":"ResultsAndDiscussion.SubstancesMixturesWhichInContactWithWaterEmitFlammableGases"}
			]
}}}/>


<#assign table_20 = {
	"title":"Summary table of studies on oxidising liquids",
"columnWidths": [40,40,20],
"columns": columnSet1,
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.OxidisingProperties": {
			"Material and method, Remarks": method + testMaterial + reliability,
			"References": reference,
			"Results": [
				{"field":"ResultsAndDiscussion.TestResultsOxidisingLiquids"}
			]
}}}/>


<#assign table_21 = {
	"title":"Summary table of studies on oxidising solids",
"columnWidths": [40,40,20],
"columns": columnSet1,
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.OxidisingProperties": {
			"Material and method, Remarks": method + testMaterial + reliability,
			"References": reference,
			"Results": [
				{"field":"ResultsAndDiscussion.TestResultsOxidisingSolids"}
			]
}}}/>


<#assign table_22 = {
	"title":"Summary table of studies on organic peroxides",
"columnWidths": [40,40,20],
"columns": columnSet1,
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.OrganicPeroxide": {
			"Material and method, Remarks": method + testMaterial + reliability,
			"References": reference,
			"Results": [
				{"field":"ResultsAndDiscussion.SmallScalePreliminaryTests"},
				{"field":"ResultsAndDiscussion.ResultsOfTestSeriesForOrganicPeroxides"}
			]
}}}/>


<#assign table_23 = {
	"title":"Summary table of studies on the hazard class corrosive to metals",
"columnWidths": [40,40,20],
"columns": columnSet1,
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.CorrosiveToMetals": {
			"Material and method, Remarks": method + testMaterial + reliability,
			"References": reference,
			"Results": [
				{"field":"ResultsAndDiscussion.TestResults"}
			]
}}}/>


<#assign table_24 = {
	"title":"Summary table of toxicokinetic studies",
"columnWidths":[40,40,20],
"columns": columnSet1,
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.BasicToxicokinetics": {
			"Material and method, Remarks": endpointMethod + species + [
				{"field":"MaterialsAndMethods.AdministrationExposure.RouteOfAdministration"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationAndFrequencyOfTreatmentExposure"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DosesConcentrations"},
				{"field":"MaterialsAndMethods.TestMaterials.TestMaterialInformation"},
				{"field":"MaterialsAndMethods.TestMaterials.AdditionalTestMaterialInformation"},
				{"field":"AdministrativeData.Reliability"},
				{"field":"AdministrativeData.PurposeFlag"},
				{"field":"ResultsAndDiscussion.MetaboliteCharacterisationStudies.DistributionOfMetabolitesInMatrices"}
			],
			"References": reference,
			"Results": [
				{"field":"ResultsAndDiscussion.MainAdmeResults"},
				{"field":"ResultsAndDiscussion.PharmacokineticStudies.TransferIntoOrgans"},
				{"field":"ResultsAndDiscussion.PharmacokineticStudies.ToxicokineticParameters"},
				{"field":"ResultsAndDiscussion.MetaboliteCharacterisationStudies.DistributionOfMetabolitesInMatrices"},
				{"field":"ResultsAndDiscussion.AppendixMetabolitesAndTheirParentsInTreatmentGroups.MetabolitesInTreatmentGroups"}
			]
},
"ENDPOINT_STUDY_RECORD.DermalAbsorption": {
			"Material and method, Remarks": method + species + [
				{"field":"MaterialsAndMethods.AdministrationExposure.TypeOfCoverage"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfExposure"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DosesConcentrations"},
				{"field":"MaterialsAndMethods.TestMaterials.TestMaterialInformation"},
				{"field":"MaterialsAndMethods.TestMaterials.AdditionalTestMaterialInformation"},
				{"field":"AdministrativeData.Reliability"},
				{"field":"AdministrativeData.PurposeFlag"},
				{"field":"ResultsAndDiscussion.Absorption"}
			],
			"References": reference,
			"Results": [
				{"field":"ResultsAndDiscussion.SignsSymptomsToxicity"},
				{"field":"ResultsAndDiscussion.DermalIrritation"},
				{"field":"ResultsAndDiscussion.AbsorptionMatrices"},
				{"field":"ResultsAndDiscussion.TotalRecovery"},
				{"field":"ResultsAndDiscussion.Absorption"},
				{"field":"ResultsAndDiscussion.Metabolites"},
				{"field":"ResultsAndDiscussion.IdentityOfMetabolites"}
			]
},
"ENDPOINT_STUDY_RECORD.DirectObservationsClinicalCases": {
			"Material and method, Remarks": studyMethod + [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.Subjects"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.RouteOfExposure"},
				{"field":"MaterialsAndMethods.Method.ReasonOfExposure"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}] + testMaterial + reliability,
			"References": reference,
			"Results": [
				{"field":"ResultsAndDiscussion.ClinicalSigns"},
				{"field":"ResultsAndDiscussion.RsExaminations"},
				{"field":"ResultsAndDiscussion.EffectivityMedicalTreatment"},
				{"field":"ResultsAndDiscussion.Outcome"}
			]
},
"ENDPOINT_STUDY_RECORD.EpidemiologicalData": {
			"Material and method, Remarks": studyMethod + [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"},
				{"field":"MaterialsAndMethods.TestMaterials.TestMaterialInformation"},
				{"field":"MaterialsAndMethods.TestMaterials.AdditionalTestMaterialInformation"},
				{"field":"AdministrativeData.Reliability"},
				{"field":"AdministrativeData.PurposeFlag"},
				{"field":"ResultsAndDiscussion.EffectLevels"}
			],
			"References": reference,
			"Results": [
				{"field":"ResultsAndDiscussion.Results"},
				{"field":"ResultsAndDiscussion.ConfoundingFactors"},
				{"field":"ResultsAndDiscussion.EffectLevels"},
				{"field":"ResultsAndDiscussion.EffectLevels.Efflevel"},
				{"field":"ResultsAndDiscussion.TargetSystemOrganToxicity"}
			]
},
"ENDPOINT_STUDY_RECORD.ExposureRelatedObservationsOther": {
			"Material and method, Remarks": [
				{"field":"MaterialsAndMethods.TypeOfStudyInformation"},
				{"field":"AdministrativeData.Reliability"},
				{"field":"AdministrativeData.PurposeFlag"},
				{"field":"MaterialsAndMethods.MethodNoGuideline"},
				{"field":"MaterialsAndMethods.GLPComplianceStatement", "params":{"before":"GLP compliance:", "after":""}},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}] + testMaterial,
			"References": reference,
			"Results": [
				{"field":"ResultsAndDiscussion.Results"}
			]
},
"ENDPOINT_STUDY_RECORD.HealthSurveillanceData": {
			"Material and method, Remarks": studyMethod + [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"}] + testMaterial + reliability,
			"References": reference,
			"Results": [
				{"field":"ResultsAndDiscussion.Results"}
			]
}}}/>


<#assign table_25 = {
	"title":"Summary table of animal studies on acute oral toxicity",
"columnWidths":[25,25,20,20,10],
"columns": columnSet2,
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.AcuteToxicityOral": {
			"Method, guideline, deviations if any": testMethod + reliability,
			"Species, strain, sex, no/group":species,
			"Test substance, dose levels, duration of exposure": testMaterial + [
				{"field":"MaterialsAndMethods.AdministrationExposure.Doses"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfExposure"}
			],
			"References": reference,
			"Results": [
				{"field":"ResultsAndDiscussion.EffectLevels"},
				{"field":"ResultsAndDiscussion.EffectLevels.EffectLevel"}
			]
}}}/>


<#assign table_26 = {
	"title":"Summary table of human data on acute oral toxicity",
	"columnWidths":[30,30,25,15],
	"columns": columnSet3,
	"filter":{
		"ENDPOINT_STUDY_RECORD.HealthSurveillanceData": [{"property":"MaterialsAndMethods.EndpointAddressed","value":["acute toxicity: oral"]}],		
		"ENDPOINT_STUDY_RECORD.DirectObservationsClinicalCases": [{"property":"MaterialsAndMethods.EndpointAddressed","value":["acute toxicity: oral"]}],
		"ENDPOINT_STUDY_RECORD.EpidemiologicalData": [{"property":"MaterialsAndMethods.EndpointAddressed","value":["acute toxicity: oral"]}],
		"ENDPOINT_STUDY_RECORD.ExposureRelatedObservationsOther": [
			{"property":"MaterialsAndMethods.EndpointAddressed","value":["acute toxicity: oral"]},
			{"property":"MaterialsAndMethods.Method.RouteOfExposure","value":["oral"]}
		]
	},
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.DirectObservationsClinicalCases": {
			"Observations": [
				{"field":"ResultsAndDiscussion.ClinicalSigns"},
				{"field":"ResultsAndDiscussion.RsExaminations"},
				{"field":"ResultsAndDiscussion.EffectivityMedicalTreatment"},
				{"field":"ResultsAndDiscussion.Outcome"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.Subjects"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.RouteOfExposure"},
				{"field":"MaterialsAndMethods.Method.ReasonOfExposure"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
		},
		"ENDPOINT_STUDY_RECORD.EpidemiologicalData": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"},
				{"field":"ResultsAndDiscussion.ConfoundingFactors"},
				{"field":"ResultsAndDiscussion.EffectLevels"},
				<#--  {"field":"ResultsAndDiscussion.EffectLevels.Efflevel"},  -->
				{"field":"ResultsAndDiscussion.TargetSystemOrganToxicity"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
		},
		"ENDPOINT_STUDY_RECORD.ExposureRelatedObservationsOther": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Test substance": testMaterial,
			"Type of data/report, substance exposed to etc.": studyMethod + reliability
		},
		"ENDPOINT_STUDY_RECORD.HealthSurveillanceData": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
		}
}}/>


<#assign table_27 = {
	"title":"Summary table of other studies relevant for acute oral toxicity",
"columns": columnSet4,
	"filter":{
		"ENDPOINT_STUDY_RECORD.ToxicEffectsLivestock": [{
			"property":"MaterialsAndMethods.Method.RouteOfExposure",
			"value":["oral:applied on feed", "oral:capsule", "oral:gavage", "oral:ingestion of bait", "oral:licking", "oral:unspecified"]
			}]
	},
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.ToxicEffectsLivestock": {
			"Observations": [

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinSigns"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinSigns", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ClinSignsDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.Mortality"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.Mortality", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.MortalityDescriptionIncidence", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservBodyweight"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservBodyweight", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.WeightDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodConsum"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodConsum", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.FoodConsDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.FoodEfficiency"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.FoodEfficiency", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.FoodEffDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservWaterConsum"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservWaterConsum", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.WaterConsDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OphthalmologicalFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OphthalmologicalFindings", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OphtalDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHaematol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHaematol", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.HaematoDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinChem"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinChem", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ClinBiochemDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineFindings", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservUrin"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservUrin", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.UrinalysisDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.BehaviourFunctionalFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.BehaviourFunctionalFindings", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.BehaviourDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ImmunologicalFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ImmunologicalFindings", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ImmunoDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OrganWeightFindingsIncludingOrganBodyWeightRatios"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OrganWeightFindingsIncludingOrganBodyWeightRatios", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OrganWeightDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.NeuropathologicalFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.NeuropathologicalFindings", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.NeuroDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservGrpathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservGrpathol", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.GrossPathDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopathol", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.HistopathNonNeoDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.HistopathologicalFindingsNeoplastic"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.HistopathologicalFindingsNeoplastic", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.HistoNeoDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OtherEffects"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OtherEffects", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OtherEffectsDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

	{"field":"ResultsAndDiscussion.EffectLevels"},
	{"field":"ResultsAndDiscussion.EffectLevels.Efflevel"},
	{"field":"ResultsAndDiscussion.TargetSystemOrganToxicity"},
	{"field":"ResultsAndDiscussion.TargetSystemOrganToxicity.TargetSystemOrganToxicity"}

	],
			"References": reference,
			"Relevant information about the study (as applicable)": relevantInfo,
			"Type of study/data, test substance": reliability + method + testMaterial
}}}/>


<#assign table_28 = {
	"title":"Summary table of animal studies on acute dermal toxicity ",
"columnWidths":[25,25,20,20,10],
"columns": columnSet2,
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.AcuteToxicityDermal": {
			"Method, guideline, deviations if any": testMethod + reliability,
			"Species, strain, sex, no/group": species,
			"Test substance, dose levels, duration of exposure": testMaterial + [
				{"field":"MaterialsAndMethods.AdministrationExposure.Doses"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfExposure"}
			],
			"References": reference,
			"Results": [
				{"field":"ResultsAndDiscussion.EffectLevels"},
				{"field":"ResultsAndDiscussion.EffectLevels.EffectLevel"}
			]
}}}/>


<#assign table_29 = {
	"title":"Summary table of human data on acute dermal toxicity ",
	"columnWidths":[30,30,25,15],
"columns": columnSet3,
	"filter":{
		"ENDPOINT_STUDY_RECORD.HealthSurveillanceData": [{"property":"MaterialsAndMethods.EndpointAddressed","value":["acute toxicity"]}],
		"ENDPOINT_STUDY_RECORD.DirectObservationsClinicalCases": [{"property":"MaterialsAndMethods.EndpointAddressed","value":["acute toxicity: dermal"]}],
		"ENDPOINT_STUDY_RECORD.EpidemiologicalData": [{"property":"MaterialsAndMethods.EndpointAddressed","value":["acute toxicity: dermal"]}],
		"ENDPOINT_STUDY_RECORD.ExposureRelatedObservationsOther": [{"property":"MaterialsAndMethods.EndpointAddressed","value":["acute toxicity: dermal"]}],
		"ENDPOINT_STUDY_RECORD.ToxicEffectsLivestock": [{"property":"MaterialsAndMethods.Method.RouteOfExposure","value":["dermal"]}]
	},
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.DirectObservationsClinicalCases": {
			"Observations": [
				{"field":"ResultsAndDiscussion.ClinicalSigns"},
				{"field":"ResultsAndDiscussion.RsExaminations"},
				{"field":"ResultsAndDiscussion.EffectivityMedicalTreatment"},
				{"field":"ResultsAndDiscussion.Outcome"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.Subjects"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.RouteOfExposure"},
				{"field":"MaterialsAndMethods.Method.ReasonOfExposure"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
},
"ENDPOINT_STUDY_RECORD.EpidemiologicalData": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"},
				{"field":"ResultsAndDiscussion.ConfoundingFactors"},
				{"field":"ResultsAndDiscussion.EffectLevels"},
				{"field":"ResultsAndDiscussion.EffectLevels.Efflevel"},
				{"field":"ResultsAndDiscussion.TargetSystemOrganToxicity"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
},
"ENDPOINT_STUDY_RECORD.ExposureRelatedObservationsOther": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of data/report, substance exposed to etc.": [
				{"field":"MaterialsAndMethods.TypeOfStudyInformation"}] + reliability + method + testMaterial
},
"ENDPOINT_STUDY_RECORD.HealthSurveillanceData": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
}}}/>


<#assign table_30 = {
	"title":"Summary table of other studies relevant for acute dermal toxicity",
"columns": columnSet4,
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.ToxicEffectsLivestock": {
			"Observations": [
				{"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinSigns"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinSigns", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ClinSignsDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.Mortality"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.Mortality", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.MortalityDescriptionIncidence", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservBodyweight"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservBodyweight", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.WeightDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodConsum"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodConsum", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.FoodConsDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.FoodEfficiency"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.FoodEfficiency", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.FoodEffDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservWaterConsum"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservWaterConsum", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.WaterConsDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OphthalmologicalFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OphthalmologicalFindings", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OphtalDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHaematol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHaematol", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.HaematoDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinChem"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinChem", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ClinBiochemDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineFindings", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservUrin"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservUrin", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.UrinalysisDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.BehaviourFunctionalFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.BehaviourFunctionalFindings", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.BehaviourDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ImmunologicalFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ImmunologicalFindings", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ImmunoDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OrganWeightFindingsIncludingOrganBodyWeightRatios"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OrganWeightFindingsIncludingOrganBodyWeightRatios", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OrganWeightDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.NeuropathologicalFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.NeuropathologicalFindings", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.NeuroDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservGrpathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservGrpathol", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.GrossPathDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopathol", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.HistopathNonNeoDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.HistopathologicalFindingsNeoplastic"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.HistopathologicalFindingsNeoplastic", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.HistoNeoDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OtherEffects"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OtherEffects", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OtherEffectsDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

	{"field":"ResultsAndDiscussion.EffectLevels"},
	{"field":"ResultsAndDiscussion.EffectLevels.Efflevel"},
	{"field":"ResultsAndDiscussion.TargetSystemOrganToxicity"},
	{"field":"ResultsAndDiscussion.TargetSystemOrganToxicity.TargetSystemOrganToxicity"}
	],
			"References": reference,
			"Relevant information about the study (as applicable)": relevantInfo,
			"Type of study/data, test substance": reliability + method + testMaterial
}}}/>


<#assign table_31 = {
	"title":"Summary table of animal studies on acute inhalation toxicity",
"columnWidths":[25,20,20,15,10,10],
"columns": [
	"Method, guideline, deviations if any",
	"Species, strain, sex, no/group", 
	"Test substance, form and particle size (MMAD)",
	"Dose levels, duration of exposure",
	"Value LC<sub>50</sub>",
	"References"
	],
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.AcuteToxicityInhalation": {
			"Method, guideline, deviations if any": testMethod + reliability,
			"Dose levels, duration of exposure": [
				{"field":"MaterialsAndMethods.AdministrationExposure.Concentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.Vehicle"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfExposure"}
			],
			"Species, strain, sex, no/group": species,
			"References": reference,
			"Value LC<sub>50</sub>": [
				{"field":"ResultsAndDiscussion.EffectLevels"},
				{"field":"ResultsAndDiscussion.EffectLevels.EffectLevel"}
			],
			"Test substance, form and particle size (MMAD)": testMaterial + [
				{"field":"MaterialsAndMethods.AdministrationExposure.MassMedianAerodynamicDiameter"},
				{"field":"MaterialsAndMethods.AdministrationExposure.GeometricStandardDeviation"},
				{"field":"MaterialsAndMethods.AdministrationExposure.RemarksOnMMAD"}
			]
}}}/>


<#assign table_32 = {
	"title":"Summary table of human data on acute inhalation toxicity",
	"columnWidths":[30,30,25,15],
"columns": columnSet3,
	"filter":{
		"ENDPOINT_STUDY_RECORD.HealthSurveillanceData": [{"property":"MaterialsAndMethods.EndpointAddressed","value":["acute toxicity"]}],
		"ENDPOINT_STUDY_RECORD.DirectObservationsClinicalCases": [{"property":"MaterialsAndMethods.EndpointAddressed","value":["acute toxicity: inhalation"]}],
		"ENDPOINT_STUDY_RECORD.EpidemiologicalData": [{"property":"MaterialsAndMethods.EndpointAddressed","value":["acute toxicity: inhalation"]}],
		"ENDPOINT_STUDY_RECORD.ExposureRelatedObservationsOther": [{"property":"MaterialsAndMethods.EndpointAddressed","value":["acute toxicity: inhalation"]}]
	},
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.DirectObservationsClinicalCases": {
			"Observations": [
				{"field":"ResultsAndDiscussion.ClinicalSigns"},
				{"field":"ResultsAndDiscussion.RsExaminations"},
				{"field":"ResultsAndDiscussion.EffectivityMedicalTreatment"},
				{"field":"ResultsAndDiscussion.Outcome"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.Subjects"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.RouteOfExposure"},
				{"field":"MaterialsAndMethods.Method.ReasonOfExposure"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
},
"ENDPOINT_STUDY_RECORD.EpidemiologicalData": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"},
				{"field":"ResultsAndDiscussion.ConfoundingFactors"},
				{"field":"ResultsAndDiscussion.EffectLevels"},
				<#--  {"field":"ResultsAndDiscussion.EffectLevels.Efflevel"},  -->
				{"field":"ResultsAndDiscussion.TargetSystemOrganToxicity"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
},
"ENDPOINT_STUDY_RECORD.ExposureRelatedObservationsOther": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of data/report, substance exposed to etc.": [
				{"field":"MaterialsAndMethods.TypeOfStudyInformation"}] + reliability + method + testMaterial
},
"ENDPOINT_STUDY_RECORD.HealthSurveillanceData": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
}}}/>


<#assign table_33 = {
	"title":"Summary table of other studies relevant for acute inhalation toxicity ",
"columns": columnSet4,
	"filter":{
		"ENDPOINT_STUDY_RECORD.ToxicEffectsLivestock": [{"property":"MaterialsAndMethods.Method.RouteOfExposure","value":["inhalation"]}]
	},
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.ToxicEffectsLivestock": {
			"Observations": [
				{"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinSigns"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinSigns", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ClinSignsDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.Mortality"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.Mortality", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.MortalityDescriptionIncidence", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservBodyweight"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservBodyweight", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.WeightDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodConsum"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodConsum", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.FoodConsDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.FoodEfficiency"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.FoodEfficiency", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.FoodEffDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservWaterConsum"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservWaterConsum", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.WaterConsDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OphthalmologicalFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OphthalmologicalFindings", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OphtalDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHaematol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHaematol", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.HaematoDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinChem"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinChem", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ClinBiochemDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineFindings", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservUrin"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservUrin", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.UrinalysisDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.BehaviourFunctionalFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.BehaviourFunctionalFindings", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.BehaviourDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ImmunologicalFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ImmunologicalFindings", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ImmunoDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OrganWeightFindingsIncludingOrganBodyWeightRatios"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OrganWeightFindingsIncludingOrganBodyWeightRatios", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OrganWeightDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.NeuropathologicalFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.NeuropathologicalFindings", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.NeuroDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservGrpathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservGrpathol", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.GrossPathDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopathol", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.HistopathNonNeoDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.HistopathologicalFindingsNeoplastic"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.HistopathologicalFindingsNeoplastic", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.HistoNeoDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OtherEffects"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OtherEffects", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OtherEffectsDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

	{"field":"ResultsAndDiscussion.EffectLevels"},
	{"field":"ResultsAndDiscussion.EffectLevels.Efflevel"},
	{"field":"ResultsAndDiscussion.TargetSystemOrganToxicity"},
	{"field":"ResultsAndDiscussion.TargetSystemOrganToxicity.TargetSystemOrganToxicity"}
	],
			"References": reference,
			"Relevant information about the study (as applicable)": relevantInfo,
			"Type of study/data, test substance": reliability + method + testMaterial
}}}/>


<#assign table_34 = {
	"title":"Summary table of animal studies on skin corrosion/irritation",
"columns": [
	"Method, guideline, deviations if any<br/>Species, strain, sex, no/group",
	"Test substance, dose levels, duration of exposure",
	"Results<br/>-Observations and time point of onset<br/>-Mean scores/animal<br/>-Reversibility",
	"References"
	],
	"filter":{
		"ENDPOINT_STUDY_RECORD.SkinIrritationCorrosion": [{"property":"AdministrativeData.Endpoint","value":["skin irritation: in vivo"]}]
	},
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.SkinIrritationCorrosion": {
			"Test substance, dose levels, duration of exposure": testMaterial + [
				{"field":"MaterialsAndMethods.TestSystem.AmountConcentrationApplied"},
				{"field":"MaterialsAndMethods.TestSystem.TypeOfCoverage"},
				{"field":"MaterialsAndMethods.TestSystem.PreparationOfTestSite"},
				{"field":"MaterialsAndMethods.TestSystem.Vehicle"},
				{"field":"MaterialsAndMethods.TestSystem.HighDoseLevelUsed"},
				{"field":"MaterialsAndMethods.TestSystem.DurationOfTreatmentExposure"},
				{"field":"MaterialsAndMethods.TestSystem.ObservationPeriod"}
			],
			"Method, guideline, deviations if any<br/>Species, strain, sex, no/group": 
			endpointMethod + reliability + species,
			"References": reference,
			"Results<br/>-Observations and time point of onset<br/>-Mean scores/animal<br/>-Reversibility": [
				{"field":"ResultsAndDiscussion.InVivo.Results"}		
			],
			"NA": [
				{"field":"ResultsAndDiscussion.EffectLevels.Efflevel"}
			]
}}}/>


<#assign table_35 = {
	"title":"Summary table of human data on skin corrosion/irritation",
	"columnWidths":[30,30,25,15],
"columns": columnSet3,
	"filter":{
		"ENDPOINT_STUDY_RECORD.HealthSurveillanceData": [{"property":"MaterialsAndMethods.EndpointAddressed","value":["skin irritation / corrosion"]}],
		"ENDPOINT_STUDY_RECORD.DirectObservationsClinicalCases": [{"property":"MaterialsAndMethods.EndpointAddressed","value":["skin irritation / corrosion"]}],
		"ENDPOINT_STUDY_RECORD.EpidemiologicalData": [{"property":"MaterialsAndMethods.EndpointAddressed","value":["skin irritation / corrosion"]}],
		"ENDPOINT_STUDY_RECORD.ExposureRelatedObservationsOther": [{"property":"MaterialsAndMethods.EndpointAddressed","value":["skin irritation / corrosion"]}]
	},
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.DirectObservationsClinicalCases": {
			"Observations": [
				{"field":"ResultsAndDiscussion.ClinicalSigns"},
				{"field":"ResultsAndDiscussion.RsExaminations"},
				{"field":"ResultsAndDiscussion.EffectivityMedicalTreatment"},
				{"field":"ResultsAndDiscussion.Outcome"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.Subjects"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.RouteOfExposure"},
				{"field":"MaterialsAndMethods.Method.ReasonOfExposure"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
},
"ENDPOINT_STUDY_RECORD.EpidemiologicalData": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"},
				{"field":"ResultsAndDiscussion.ConfoundingFactors"},
				{"field":"ResultsAndDiscussion.EffectLevels"},
				<#--  {"field":"ResultsAndDiscussion.EffectLevels.Efflevel"},  -->
				{"field":"ResultsAndDiscussion.TargetSystemOrganToxicity"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
},
"ENDPOINT_STUDY_RECORD.ExposureRelatedObservationsOther": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of data/report, substance exposed to etc.": [
				{"field":"MaterialsAndMethods.TypeOfStudyInformation"}] + reliability + method + testMaterial
},
"ENDPOINT_STUDY_RECORD.HealthSurveillanceData": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
}}}/>


<#assign table_36 = {
	"title":"Summary table of other studies relevant for skin corrosion/irritation",
"columns": columnSet4,
	"filter":{
		"ENDPOINT_STUDY_RECORD.SkinIrritationCorrosion": [{"property":"AdministrativeData.Endpoint","value":["skin irritation: in vitro", "skin irritation: other"]}]
	},
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.SkinIrritationCorrosion": {
			"Observations": [
				{"field":"ResultsAndDiscussion.InVitro"},
				{"field":"ResultsAndDiscussion.InVitro.Results"},
				{"field":"ResultsAndDiscussion.InVitro.Results"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.InVitroTestSystem.TestSystem"},
				{"field":"MaterialsAndMethods.InVitroTestSystem.SourceSpecies"},
				{"field":"MaterialsAndMethods.InVitroTestSystem.CellType"},
				{"field":"MaterialsAndMethods.InVitroTestSystem.CellSource"},
				{"field":"MaterialsAndMethods.InVitroTestSystem.SourceStrain"},
				{"field":"MaterialsAndMethods.InVitroTestSystem.Vehicle"},
				{"field":"MaterialsAndMethods.InVitroTestSystem.AmountConcentrationApplied"},
				{"field":"MaterialsAndMethods.InVitroTestSystem.DurationOfTreatmentExposure"},
				{"field":"MaterialsAndMethods.InVitroTestSystem.NumberOfReplicates"}
			],
			"Type of study/data, test substance": endpointMethod + reliability + testMaterial
}}}/>


<#assign table_37 = {
	"title":"Summary table of animal studies on serious eye damage/eye irritation",
"columns": [
	"Method, guideline, deviations if any<br/>Species, strain, sex, no/group",
	"Test substance, dose levels, duration of exposure",
	"Results<br/>-Observations and time point of onset<br/>-Mean scores/animal<br/>-Reversibility",
	"References"
	],
	"filter":{
		"ENDPOINT_STUDY_RECORD.EyeIrritation": [{"property":"AdministrativeData.Endpoint","value":["eye irritation: in vivo"]}]
	},
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.EyeIrritation": {
			"Method, guideline, deviations if any<br/>Species, strain, sex, no/group": 
			endpointMethod + reliability + species,
			"Test substance, dose levels, duration of exposure": testMaterial + [
				{"field":"MaterialsAndMethods.TestSystem.AmountConcentrationApplied"},
				{"field":"MaterialsAndMethods.TestSystem.Vehicle"},
				{"field":"MaterialsAndMethods.TestSystem.NumberOfAnimals"},
				{"field":"MaterialsAndMethods.TestSystem.HighDoseLevelUsed"},
				{"field":"MaterialsAndMethods.TestSystem.DurationOfTreatmentExposure"},
				{"field":"MaterialsAndMethods.TestSystem.ObservationPeriod"}
			],
			"References": reference,
			"Results<br/>-Observations and time point of onset<br/>-Mean scores/animal<br/>-Reversibility": [
				{"field":"ResultsAndDiscussion.InVivo.IrritationCorrosionResults"}
			],
			"NA": [
				{"field":"ResultsAndDiscussion.EffectLevels.Efflevel"}
			]
}}}/>


<#assign table_38 = {
	"title":"Summary table of human data on serious eye damage/eye irritation",
	"columnWidths":[30,30,25,15],
"columns": columnSet3,
	"filter":{
		"ENDPOINT_STUDY_RECORD.HealthSurveillanceData": [{"property":"MaterialsAndMethods.EndpointAddressed","value":["eye irritation"]}],
		"ENDPOINT_STUDY_RECORD.DirectObservationsClinicalCases": [{"property":"MaterialsAndMethods.EndpointAddressed","value":["eye irritation"]}],
		"ENDPOINT_STUDY_RECORD.EpidemiologicalData": [{"property":"MaterialsAndMethods.EndpointAddressed","value":["eye irritation"]}],
		"ENDPOINT_STUDY_RECORD.ExposureRelatedObservationsOther": [{"property":"MaterialsAndMethods.EndpointAddressed","value":["eye irritation"]}]
	},
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.DirectObservationsClinicalCases": {
			"Observations": [
				{"field":"ResultsAndDiscussion.ClinicalSigns"},
				{"field":"ResultsAndDiscussion.RsExaminations"},
				{"field":"ResultsAndDiscussion.EffectivityMedicalTreatment"},
				{"field":"ResultsAndDiscussion.Outcome"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.Subjects"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.RouteOfExposure"},
				{"field":"MaterialsAndMethods.Method.ReasonOfExposure"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
},
"ENDPOINT_STUDY_RECORD.EpidemiologicalData": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"},
				{"field":"ResultsAndDiscussion.ConfoundingFactors"},
				{"field":"ResultsAndDiscussion.EffectLevels"},
				<#--  {"field":"ResultsAndDiscussion.EffectLevels.Efflevel"},  -->
				{"field":"ResultsAndDiscussion.TargetSystemOrganToxicity"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
},
"ENDPOINT_STUDY_RECORD.ExposureRelatedObservationsOther": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of data/report, substance exposed to etc.": [
				{"field":"MaterialsAndMethods.TypeOfStudyInformation"}] + reliability + method + testMaterial
},
"ENDPOINT_STUDY_RECORD.HealthSurveillanceData": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
}}}/>


<#assign table_39 = {
	"title":"Summary table of other studies relevant for serious eye damage/eye irritation",
"columns": columnSet4,
	"filter":{
		"ENDPOINT_STUDY_RECORD.EyeIrritation": [
			{"property":"AdministrativeData.Endpoint","value":["eye irritation: in vitro / ex vivo"]},
			{"property":"AdministrativeData.Endpoint","value":["eye irritation: in chemico"]},
			{"property":"AdministrativeData.Endpoint","value":["eye irritation, other"]}
		]
	},
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.EyeIrritation": {
			"Observations": [
				{"field":"ResultsAndDiscussion.InVitro.ResultsOfExVivoInVitroStudy"},
				{"field":"ResultsAndDiscussion.ResultsAndDiscussion.InVitro.ResultsOfExVivoInVitroStudy"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.TestAnimals.Species"},
				{"field":"MaterialsAndMethods.TestAnimals.Strain"},
				{"field":"MaterialsAndMethods.TestSystem.NumberOfAnimals"},
				{"field":"MaterialsAndMethods.TestSystem.AmountConcentrationApplied"},
				{"field":"MaterialsAndMethods.TestSystem.Vehicle"},
				{"field":"MaterialsAndMethods.TestSystem.NumberOfAnimals"},
				{"field":"MaterialsAndMethods.TestSystem.HighDoseLevelUsed"},
				{"field":"MaterialsAndMethods.TestSystem.DurationOfTreatmentExposure"},
				{"field":"MaterialsAndMethods.TestSystem.DurationOfPostTreatmentIncubationInVitro"}
			],
			"Type of study/data, test substance": endpointMethod + reliability + testMaterial
}}}/>


<#assign table_40 = {
	"title":"Summary table of animal studies on respiratory sensitisation",
"columnWidths": [43,43,14],
"columns": [
	"Method, guideline, deviations if any<br/>Species, strain, sex, no/group<br/>Test substance, dose levels, duration of exposure<br/>Remarks",
	"Results",
	"References"
],
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.RespiratorySensitisation": {
			"Method, guideline, deviations if any<br/>Species, strain, sex, no/group<br/>Test substance, dose levels, duration of exposure<br/>Remarks": 
				endpointMethod + reliability + species + testMaterial + [
				{"field":"MaterialsAndMethods.TestSystem.Concentration"},
				{"field":"MaterialsAndMethods.TestSystem.DetailsOnStudyDesign"},
				{"field":"MaterialsAndMethods.TestSystem.RouteOfInductionExposure"},
				{"field":"MaterialsAndMethods.TestSystem.RouteOfChallengeExposure"},
				{"field":"MaterialsAndMethods.TestSystem.Vehicle"}
			],
			"References": reference,
			"Results": [
				{"field":"ResultsAndDiscussion.Results"},
				{"field":"ResultsAndDiscussion.PosControlResults"},
				{"field":"ResultsAndDiscussion.NegControlResults"}
			]
}}}/>


<#assign table_41 = {
	"title":"Summary table of human data on respiratory sensitisation",
	"columnWidths":[30,30,25,15],
"columns": columnSet3,
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.DirectObservationsClinicalCases": {
			"Observations": [
				{"field":"ResultsAndDiscussion.ClinicalSigns"},
				{"field":"ResultsAndDiscussion.RsExaminations"},
				{"field":"ResultsAndDiscussion.EffectivityMedicalTreatment"},
				{"field":"ResultsAndDiscussion.Outcome"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.Subjects"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.RouteOfExposure"},
				{"field":"MaterialsAndMethods.Method.ReasonOfExposure"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
},
"ENDPOINT_STUDY_RECORD.EpidemiologicalData": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"},
				{"field":"ResultsAndDiscussion.ConfoundingFactors"},
				{"field":"ResultsAndDiscussion.EffectLevels"},
				<#--  {"field":"ResultsAndDiscussion.EffectLevels.Efflevel"},  -->
				{"field":"ResultsAndDiscussion.TargetSystemOrganToxicity"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
},
"ENDPOINT_STUDY_RECORD.ExposureRelatedObservationsOther": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of data/report, substance exposed to etc.": [
				{"field":"MaterialsAndMethods.TypeOfStudyInformation"}] + reliability + method + testMaterial
},
"ENDPOINT_STUDY_RECORD.HealthSurveillanceData": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
},
"ENDPOINT_STUDY_RECORD.SensitisationData": {
			"Observations": [
				{"field":"ResultsAndDiscussion.RsExaminations"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.Subjects"},
				{"field":"MaterialsAndMethods.Method.ClinicalHistory"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
}}}/>


<#assign table_42 = {
	"title":"Summary table of other studies relevant for respiratory sensitisation",
"columns": columnSet4,
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.RespiratorySensitisation": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.TestAnimals.Species"},
				{"field":"MaterialsAndMethods.TestAnimals.Strain"},
				{"field":"MaterialsAndMethods.TestSystem.RouteOfInductionExposure"},
				{"field":"MaterialsAndMethods.TestSystem.RouteOfChallengeExposure"},
				{"field":"MaterialsAndMethods.TestSystem.Vehicle"},
				{"field":"MaterialsAndMethods.TestSystem.Concentration"}
			],
			"Type of study/data, test substance": endpointMethod + reliability + testMaterial
}}}/>


<#assign table_43 = {
	"title":"Summary table of animal studies on skin sensitisation",
"columnWidths":[22,22,22,22,12],
"columns": ["Method, guideline, deviations if any",
"Test substance, species, strain, sex, no/group",
"Dose level, duration of exposure",
"Results",
"References"
],
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.SkinSensitisation": {
			"Method, guideline, deviations if any": [
				{"field":"MaterialsAndMethods.TypeOfStudy"}] + method + reliability,
			"Dose level, duration of exposure": [
				{"field":"MaterialsAndMethods.InVivoTestSystem.StudyDesignInVivoLLNA.Concentration"},
				{"field":"MaterialsAndMethods.InVivoTestSystem.StudyDesignInVivoLLNA.Vehicle"},
				{"field":"MaterialsAndMethods.InVivoTestSystem.StudyDesignInVivoLLNA.HighDoseLevelUsed"},
				{"field":"MaterialsAndMethods.InVivoTestSystem.StudyDesignInVivoNonLLNA.Induction"},
				{"field":"MaterialsAndMethods.InVivoTestSystem.StudyDesignInVivoNonLLNA.Challenge"},
				{"field":"MaterialsAndMethods.InVivoTestSystem.StudyDesignInVivoNonLLNA.Challenge"}
			],
			"References": reference,
			"Results": [
				{"field":"ResultsAndDiscussion.InVivoLLNA.Results"},
				{"field":"ResultsAndDiscussion.TraditionalSensitisationTest.ResultsOfTest"}
			],
			"Test substance, species, strain, sex, no/group": testMaterial + [
				{"field":"MaterialsAndMethods.InVivoTestSystem.TestAnimals.Species"},
				{"field":"MaterialsAndMethods.InVivoTestSystem.TestAnimals.Strain"},
				{"field":"MaterialsAndMethods.InVivoTestSystem.TestAnimals.Sex"},
				{"field":"MaterialsAndMethods.InVivoTestSystem.StudyDesignInVivoLLNA.NoOfAnimalsPerDose"}
			]
}}}/>


<#assign table_44 = {
	"title":"Summary table of human data on skin sensitisation",
	"columnWidths":[30,30,25,15],
"columns": columnSet3,
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.DirectObservationsClinicalCases": {
			"Observations": [
				{"field":"ResultsAndDiscussion.ClinicalSigns"},
				{"field":"ResultsAndDiscussion.RsExaminations"},
				{"field":"ResultsAndDiscussion.EffectivityMedicalTreatment"},
				{"field":"ResultsAndDiscussion.Outcome"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.Subjects"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.RouteOfExposure"},
				{"field":"MaterialsAndMethods.Method.ReasonOfExposure"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
},
"ENDPOINT_STUDY_RECORD.EpidemiologicalData": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"},
				{"field":"ResultsAndDiscussion.ConfoundingFactors"},
				{"field":"ResultsAndDiscussion.EffectLevels"},
				<#--  {"field":"ResultsAndDiscussion.EffectLevels.Efflevel"},  -->
				{"field":"ResultsAndDiscussion.TargetSystemOrganToxicity"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
},
"ENDPOINT_STUDY_RECORD.ExposureRelatedObservationsOther": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of data/report, substance exposed to etc.": [
				{"field":"MaterialsAndMethods.TypeOfStudyInformation"}] + reliability + method + testMaterial
},
"ENDPOINT_STUDY_RECORD.HealthSurveillanceData": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
},
"ENDPOINT_STUDY_RECORD.SensitisationData": {
			"Observations": [
				{"field":"ResultsAndDiscussion.RsExaminations"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.Subjects"},
				{"field":"MaterialsAndMethods.Method.ClinicalHistory"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
}}}/>


<#assign table_45 = {
	"title":"Summary table of other studies relevant for skin sensitisation",
"columns": columnSet4,
"columnWidths": [35, 35, 15, 15],
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.SkinSensitisation": {
			"Observations": [
				{"field":"ResultsAndDiscussion.InVitroInChemico.Results"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.InVitroTestSystem.VehicleSolventControl"}
			],
			"Type of study/data, test substance": studyMethod + reliability + testMaterial
}}}/>


<#assign table_46 = {
	"title":"Summary table of mutagenicity/genotoxicity tests in vitro",
"columns": [
"Method, guideline, deviations if any, test substance, relevant information about the study (as applicable)",
"Results",
"References"],
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.GeneticToxicityVitro": {
			"Method, guideline, deviations if any, test substance, relevant information about the study (as applicable)": 
				endpointMethod + reliability + testMaterial + [
				{"field":"MaterialsAndMethods.Method.TargetGene"},
				{"field":"MaterialsAndMethods.Method.SpeciesStrain"},
				{"field":"MaterialsAndMethods.Method.MetabolicActivation"},
				{"field":"MaterialsAndMethods.Method.MetabolicActivationSystem"},
				{"field":"MaterialsAndMethods.Method.TestConcentrations"},
				{"field":"MaterialsAndMethods.Method.HighDoseLevelUsed"},
				{"field":"MaterialsAndMethods.Method.Vehicle"},
				{"field":"MaterialsAndMethods.Method.Controls"}
			],
			"References": reference,
			"Results": [
				{"field":"ResultsAndDiscussion.TestRs"},
				{"field":"ResultsAndDiscussion.RemarksOnResults"}
			]
}}}/>


<#assign table_47 = {
	"title":"Summary table of mutagenicity/genotoxicity tests in mammalian somatic or germ cells in vivo",
"columnWidths": [43,43,14],
"columns": [
	"Method, guideline, deviations if any<br/>Species, strain, sex, no/group<br/>Test substance, dose levels, duration of exposure<br/>Remarks",
	"Results",
	"References"
	],
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.GeneticToxicityVivo": {
			"Method, guideline, deviations if any<br/>Species, strain, sex, no/group<br/>Test substance, dose levels, duration of exposure<br/>Remarks": 
				endpointStudyMethod + reliability + species + testMaterial + [
				{"field":"MaterialsAndMethods.AdministrationExposure.RouteOfAdministration"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DosesConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.Vehicle"},
				{"field":"MaterialsAndMethods.AdministrationExposure.HighDoseLevelUsed"},
				{"field":"MaterialsAndMethods.AdministrationExposure.PositiveControls"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfTreatmentExposure"},
				{"field":"MaterialsAndMethods.AdministrationExposure.FrequencyOfTreatment"},
				{"field":"MaterialsAndMethods.AdministrationExposure.PostExposurePeriod"}
			],
			"References": reference,
			"Results": [
				{"field":"ResultsAndDiscussion.TestRs"}
			]
}}}/>


<#assign table_48 = {
	"title":"Summary table of human data relevant for germ cell mutagenicity",
	"columnWidths":[30,30,25,15],
"columns": columnSet3,
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.DirectObservationsClinicalCases": {
			"Observations": [
				{"field":"ResultsAndDiscussion.ClinicalSigns"},
				{"field":"ResultsAndDiscussion.RsExaminations"},
				{"field":"ResultsAndDiscussion.EffectivityMedicalTreatment"},
				{"field":"ResultsAndDiscussion.Outcome"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.Subjects"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.RouteOfExposure"},
				{"field":"MaterialsAndMethods.Method.ReasonOfExposure"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
},
"ENDPOINT_STUDY_RECORD.EpidemiologicalData": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"},
				{"field":"ResultsAndDiscussion.ConfoundingFactors"},
				{"field":"ResultsAndDiscussion.EffectLevels"},
				<#--  {"field":"ResultsAndDiscussion.EffectLevels.Efflevel"},  -->
				{"field":"ResultsAndDiscussion.TargetSystemOrganToxicity"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
},
"ENDPOINT_STUDY_RECORD.ExposureRelatedObservationsOther": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of data/report, substance exposed to etc.": [
				{"field":"MaterialsAndMethods.TypeOfStudyInformation"}] + reliability + method + testMaterial
},
"ENDPOINT_STUDY_RECORD.HealthSurveillanceData": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
}}}/>


<#assign table_49 = {
	"title":"Summary table of animal studies on carcinogenicity",
"columnWidths": [43,43,14],
"columns": [
	"Method, guideline, deviations if any<br/>Species, strain, sex, no/group<br/>Test substance, dose levels, duration of exposure<br/>Remarks",
	"Results",
	"References"
],
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.Carcinogenicity": {
			"Method, guideline, deviations if any<br/>Species, strain, sex, no/group<br/>Test substance, dose levels, duration of exposure<br/>Remarks": 
				endpointMethod + reliability + species + testMaterial + [
				{"field":"MaterialsAndMethods.AdministrationExposure.DosesConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.HighDoseLevelUsed"},
				{"field":"MaterialsAndMethods.AdministrationExposure.RouteOfAdministration"},
				{"field":"MaterialsAndMethods.AdministrationExposure.TypeOfInhalationExposureIfApplicable"},
				{"field":"MaterialsAndMethods.AdministrationExposure.Vehicle"},
				{"field":"MaterialsAndMethods.AdministrationExposure.AnalyticalVerificationOfDosesOrConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfTreatmentExposure"},
				{"field":"MaterialsAndMethods.AdministrationExposure.FrequencyOfTreatment"},
				{"field":"MaterialsAndMethods.AdministrationExposure.PostExposurePeriod"}
			],
			"References": reference,
			"Results": [
				{"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinSigns"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinSigns", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservClinSigns", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservDermalIrritationIfDermalStudy"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservDermalIrritationIfDermalStudy", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservDermalIrritationIfDermalStudy", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservMortality"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservMortality", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceMortality", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservBodyweight"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservBodyweight", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservBodyweight", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodConsum"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodConsum", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservFoodConsum", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodEfficiency"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodEfficiency", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservFoodEfficiency", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservWaterConsum"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservWaterConsum", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservWaterConsum", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOphthalm"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOphthalm", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservOphthalm", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHaematol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHaematol", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservHaematol", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinChem"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinChem", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservClinChem", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineFindings", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityEndocrine", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservUrin"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservUrin", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservUrin", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeurobehaviour"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeurobehaviour", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservNeurobehaviour", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ImmunologicalFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ImmunologicalFindings", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityImmunologicalFindings", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOrganWeights"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOrganWeights", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservOrganWeights", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservGrpathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservGrpathol", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservGrpathol", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeuropathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeuropathol", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservNeuropathol", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopathol", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservHistopathol", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopatholNeoplastic"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopatholNeoplastic", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservHistopatholNeoplastic", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OtherEffects"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OtherEffects", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityOtherEffects", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.RelevanceOfCarcinogenicEffectsPotential "},

    {"field":"ResultsAndDiscussion.EffectLevels"},
    {"field":"ResultsAndDiscussion.EffectLevels.Efflevel"},

    {"field":"ResultsAndDiscussion.TargetSystemOrganToxicity"}

]
}}}/>


<#assign table_50 = {
	"title":"Summary table of human data on carcinogenicity",
	"columnWidths":[30,30,25,15],
"columns": columnSet3,
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.DirectObservationsClinicalCases": {
			"Observations": [
				{"field":"ResultsAndDiscussion.ClinicalSigns"},
				{"field":"ResultsAndDiscussion.RsExaminations"},
				{"field":"ResultsAndDiscussion.EffectivityMedicalTreatment"},
				{"field":"ResultsAndDiscussion.Outcome"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.Subjects"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.RouteOfExposure"},
				{"field":"MaterialsAndMethods.Method.ReasonOfExposure"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
},
"ENDPOINT_STUDY_RECORD.EpidemiologicalData": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"},
				{"field":"ResultsAndDiscussion.ConfoundingFactors"},
				{"field":"ResultsAndDiscussion.EffectLevels"},
				<#--  {"field":"ResultsAndDiscussion.EffectLevels.Efflevel"},  -->
				{"field":"ResultsAndDiscussion.TargetSystemOrganToxicity"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
},
"ENDPOINT_STUDY_RECORD.ExposureRelatedObservationsOther": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of data/report, substance exposed to etc.": [
				{"field":"MaterialsAndMethods.TypeOfStudyInformation"}] + reliability + method + testMaterial
},
"ENDPOINT_STUDY_RECORD.HealthSurveillanceData": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
}}}/>


<#assign table_51 = {
	"title":"Summary table of other studies relevant for carcinogenicity",
"columns": columnSet4,
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.Carcinogenicity": {
			"Observations": [
				{"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinSigns"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinSigns", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservClinSigns", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservDermalIrritationIfDermalStudy"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservDermalIrritationIfDermalStudy", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservDermalIrritationIfDermalStudy", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservMortality"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservMortality", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceMortality", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservBodyweight"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservBodyweight", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservBodyweight", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodConsum"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodConsum", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservFoodConsum", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodEfficiency"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodEfficiency", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservFoodEfficiency", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservWaterConsum"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservWaterConsum", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservWaterConsum", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOphthalm"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOphthalm", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservOphthalm", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHaematol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHaematol", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservHaematol", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinChem"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinChem", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservClinChem", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineFindings", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityEndocrine", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservUrin"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservUrin", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservUrin", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeurobehaviour"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeurobehaviour", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservNeurobehaviour", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ImmunologicalFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ImmunologicalFindings", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityImmunologicalFindings", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOrganWeights"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOrganWeights", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservOrganWeights", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservGrpathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservGrpathol", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservGrpathol", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeuropathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeuropathol", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservNeuropathol", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopathol", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservHistopathol", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopatholNeoplastic"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopatholNeoplastic", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservHistopatholNeoplastic", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OtherEffects"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OtherEffects", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityOtherEffects", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.RelevanceOfCarcinogenicEffectsPotential "},

    {"field":"ResultsAndDiscussion.EffectLevels"},
    {"field":"ResultsAndDiscussion.EffectLevels.Efflevel"},

    {"field":"ResultsAndDiscussion.TargetSystemOrganToxicity"}

],
			"References": reference,
			"Relevant information about the study (as applicable)": species + [
				{"field":"MaterialsAndMethods.AdministrationExposure.DosesConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.HighDoseLevelUsed"},
				{"field":"MaterialsAndMethods.AdministrationExposure.RouteOfAdministration"},
				{"field":"MaterialsAndMethods.AdministrationExposure.TypeOfInhalationExposureIfApplicable"},
				{"field":"MaterialsAndMethods.AdministrationExposure.Vehicle"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfTreatmentExposure"},
				{"field":"MaterialsAndMethods.AdministrationExposure.FrequencyOfTreatment"},
				{"field":"MaterialsAndMethods.AdministrationExposure.PostExposurePeriod"}
			],
			"Type of study/data, test substance": [
				{"field":"AdministrativeData.Endpoint"}
				] + reliability + method + testMaterial
}}}/>

<#-- Placeholder table -->
<#assign table_52 = {
	"title":"Compilation of factors to be taken into consideration in the hazard assessment ",
	"columnWidths": [13,12,12,11,11,11,11,11,8],
	"columns": [
		"Species and strain",
		"Tumour type and background incidence",
		"Multi-site responses",
		"Progression of lesions to malignancy",
		"Reduced tumour latency",
		"Responses in single or both sexes",
		"Confounding effect by excessive toxicity?",
		"Route of exposure",
		"MoA and relevance to humans"
		],
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.Carcinogenicity": {}
		}
}/>

<#assign table_53 = {
	"title":"Summary table of animal studies on adverse effects on sexual function and fertility",
"columnWidths": [43,43,14],
"columns": [
	"Method, guideline, deviations if any<br/>Species, strain, sex, no/group<br/>Test substance, dose levels, duration of exposure<br/>Remarks",
	"Results",
	"References"
	],
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.ToxicityReproduction": {
			"Method, guideline, deviations if any<br/>Species, strain, sex, no/group<br/>Test substance, dose levels, duration of exposure<br/>Remarks": 
				endpointLimitMethod + reliability + species + testMaterial + [
				{"field":"MaterialsAndMethods.AdministrationExposure.DosesConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.HighDoseLevelUsed"},
				{"field":"MaterialsAndMethods.AdministrationExposure.RouteOfAdministration"},
				{"field":"MaterialsAndMethods.AdministrationExposure.TypeOfInhalationExposureIfApplicable"},
				{"field":"MaterialsAndMethods.AdministrationExposure.Vehicle"},
				{"field":"MaterialsAndMethods.AdministrationExposure.AnalyticalVerificationOfDosesOrConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfTreatmentExposure"},
				{"field":"MaterialsAndMethods.AdministrationExposure.FrequencyOfTreatment"}
			],
			"References": reference,
			
			"Results": [
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0"},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservClinSigns"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservClinSigns","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservClinSigns","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservDermalIrritationIfDermalStudy"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservDermalIrritationIfDermalStudy","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservDermalIrritationIfDermalStudy","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservMortality"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservMortality","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceMortality","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservBodyweight"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservBodyweight","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservBodyweight","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservFoodConsum"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservFoodConsum","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservFoodConsum","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservFoodEfficiency"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservFoodEfficiency","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservFoodEfficiency","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservWaterConsum"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservWaterConsum","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservWaterConsum","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservOphthalm"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservOphthalm","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservOphthalm","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservHaematol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservHaematol","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservHaematol","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservClinChem"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservClinChem","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservClinChem","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.EndocrineFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.EndocrineFindings","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservUrin","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservUrin"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservUrin","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservNeurobehaviour","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservNeurobehaviour"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservNeurobehaviour","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityImmunologicalFindings","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ImmunologicalFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ImmunologicalFindings","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservOrganWeights","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservOrganWeights"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservOrganWeights","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservGrpathol","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservGrpathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservGrpathol","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservNeuropathol","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservNeuropathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservNeuropathol","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservHistopathol","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservHistopathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservHistopathol","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservHistopatholNeoplastic","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservHistopatholNeoplastic"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservHistopatholNeoplastic","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityOtherEffects","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.OtherEffects"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.OtherEffects","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservEstrousParent","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.ReproductiveFunctionPerformanceP0.ObservEstrousParent"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.ReproductiveFunctionPerformanceP0.ObservEstrousParent","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservSpermParent","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.ReproductiveFunctionPerformanceP0.ObservSpermParent"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.ReproductiveFunctionPerformanceP0.ObservSpermParent","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservReproPerformParent","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.ReproductiveFunctionPerformanceP0.ObservReproPerformParent"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.ReproductiveFunctionPerformanceP0.ObservReproPerformParent","params":{"before":"Signs","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.EffectLevelsP0.Efflevel"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.TargetSystemOrganToxicityP0.TargetSystemOrganToxicity"},


	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1"},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservClinSigns"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservClinSigns","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservClinSigns","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservDermalIrritationIfDermalStudy"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservDermalIrritationIfDermalStudy","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservDermalIrritationIfDermalStudy","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservMortality"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservMortality","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceMortality","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservBodyweight"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservBodyweight","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservBodyweight","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservFoodConsum"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservFoodConsum","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservFoodConsum","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservFoodEfficiency"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservFoodEfficiency","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservFoodEfficiency","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservWaterConsum"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservWaterConsum","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservWaterConsum","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservOphthalm"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservOphthalm","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservOphthalm","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservHaematol"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservHaematol","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservHaematol","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservClinChem"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservClinChem","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservClinChem","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.EndocrineFindings"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.EndocrineFindings","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityEndocrine","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservUrin"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservUrin","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservUrin","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservNeurobehaviour"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservNeurobehaviour","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservNeurobehaviour","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ImmunologicalFindings"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ImmunologicalFindings","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityImmunologicalFindings","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservOrganWeights"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservOrganWeights","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservOrganWeights","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservGrpathol"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservGrpathol","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservGrpathol","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservNeuropathol"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservNeuropathol","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservNeuropathol","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservHistopathol"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservHistopathol","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservHistopathol","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservHistopatholNeoplastic"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservHistopatholNeoplastic","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservHistopatholNeoplastic","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.OtherEffects"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.OtherEffects","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityOtherEffects","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.ReproductiveFunctionPerformanceP1.ReproductiveFunctionEstrousCycle"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.ReproductiveFunctionPerformanceP1.ReproductiveFunctionEstrousCycle","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.ReproductiveFunctionPerformanceP1.DescriptionIncidenceAndSeverityReproductiveFunctionEstrousCycle","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.ReproductiveFunctionPerformanceP1.ReproductiveFunctionSpermMeasures"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.ReproductiveFunctionPerformanceP1.ReproductiveFunctionSpermMeasures","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityOtherEffects","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.ReproductiveFunctionPerformanceP1.ReproductivePerformance"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.ReproductiveFunctionPerformanceP1.ReproductivePerformance","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityOtherEffects","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.EffectLevelsP1.Efflevel"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.TargetSystemOrganToxicityP1.TargetSystemOrganToxicity"},


	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1"},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservClinOffspring"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservClinOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservClinOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DermalIrritationOffspringIfDermalStudy"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DermalIrritationOffspringIfDermalStudy","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityDermalIrritationOffspringIfDermalStudy","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservViabilityOffspring"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservViabilityOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservViabilityOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservBodyweightOffspring"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservBodyweightOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservBodyweightOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservFoodConsumOffspring"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservFoodConsumOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservFoodConsumOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservFoodEfficiencyOffspring"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservFoodEfficiencyOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservFoodEfficiencyOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservWaterConsumOffspring"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservWaterConsumOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservWaterConsumOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservOphthalmOffspring"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservOphthalmOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservOphthalmOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservHaematolOffspring"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservHaematolOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservHaematolOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservClinChemOffspring"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservClinChemOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservClinChemOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservUrinOffspring"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservUrinOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservUrinOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservMaturationOffspring"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservMaturationOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservMaturationOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.AnogenitalDistance"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.AnogenitalDistance","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityAnogenitalDistance","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.NippleRetentionInMalePups"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.NippleRetentionInMalePups","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityNippleRetentionInMalePups","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservOrganWeightsOffspring"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservOrganWeightsOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservOrganWeightsOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservGrpatholOffspring"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservGrpatholOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservGrpatholOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservHistopathol"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservHistopathol","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservHistopatholOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.OtherEffects"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.OtherEffects","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityOtherEffectsOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.DevelopmentalNeurotoxicityF1.BehaviourFunctionalFindings"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.DevelopmentalNeurotoxicityF1.BehaviourFunctionalFindings","params":{"before":"Signs","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.DevelopmentalImmunotoxicityF1.DevelopmentalImmunotoxicity"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.DevelopmentalImmunotoxicityF1.DevelopmentalImmunotoxicity","params":{"before":"Signs","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.EffectLevelsF1.Efflevel"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.TargetSystemOrganToxicityF1.TargetSystemOrganToxicity"},


	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2"},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservClinOffspring"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservClinOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservClinOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DermalIrritationOffspringIfDermalStudy"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DermalIrritationOffspringIfDermalStudy","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityDermalIrritationOffspringIfDermalStudy","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservViabilityOffspring"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservViabilityOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservViabilityOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservBodyweightOffspring"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservBodyweightOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservBodyweightOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservFoodConsumOffspring"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservFoodConsumOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservFoodConsumOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservFoodEfficiencyOffspring"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservFoodEfficiencyOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservFoodEfficiencyOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservWaterConsumOffspring"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservWaterConsumOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservWaterConsumOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservOphthalmOffspring"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservOphthalmOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservOphthalmOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservHaematolOffspring"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservHaematolOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservHaematolOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservClinChemOffspring"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservClinChemOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservClinChemOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservUrinOffspring"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservUrinOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservUrinOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservMaturationOffspring"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservMaturationOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservMaturationOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.AnogenitalDistance"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.AnogenitalDistance","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityAnogenitalDistance","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.NippleRetentionInMalePups"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.NippleRetentionInMalePups","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityNippleRetentionInMalePups","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservOrganWeightsOffspring"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservOrganWeightsOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservOrganWeightsOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservGrpatholOffspring"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservGrpatholOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservGrpatholOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservHistopathol"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservHistopathol","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservHistopatholOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.OtherEffects"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.OtherEffects","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityOtherEffectsOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.DevelopmentalNeurotoxicityF2.BehaviourFunctionalFindings"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.DevelopmentalNeurotoxicityF2.BehaviourFunctionalFindings","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityBehaviourFunctionalFindings","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.DevelopmentalImmunotoxicityF2.DevelopmentalImmunotoxicity"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.DevelopmentalImmunotoxicityF2.DevelopmentalImmunotoxicity","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityDevelopmentalImmunotoxicity","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.EffectLevelsF2.Efflevel"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.TargetSystemOrganToxicityF2.TargetSystemOrganToxicity"},
	{"field":"ResultsAndDiscussion.ReproductiveToxicity.ReproductiveToxicity"}

	]
},
"ENDPOINT_STUDY_RECORD.RepeatedDoseToxicityDermal": {
			"Method, guideline, deviations if any<br/>Species, strain, sex, no/group<br/>Test substance, dose levels, duration of exposure<br/>Remarks": 
				endpointLimitMethod + reliability + species + testMaterial + [
				{"field":"MaterialsAndMethods.AdministrationExposure.DosesConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.HighDoseLevelUsed"},
				{"field":"MaterialsAndMethods.AdministrationExposure.RouteOfAdministration"},
				{"field":"MaterialsAndMethods.AdministrationExposure.TypeOfCoverage"},
				{"field":"MaterialsAndMethods.AdministrationExposure.Vehicle"},
				{"field":"MaterialsAndMethods.AdministrationExposure.AnalyticalVerificationOfDosesOrConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfTreatmentExposure"},
				{"field":"MaterialsAndMethods.AdministrationExposure.FrequencyOfTreatment"}
			],
			"References": reference,
			"Results": [

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinSigns"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinSigns", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservClinSigns", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservDermalIrritation"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservDermalIrritation", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservDermalIrritation", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservMortality"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservMortality", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceMortality", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservBodyweight"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservBodyweight", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservBodyweight", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodConsum"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodConsum", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservFoodConsum", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodEfficiency"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodEfficiency", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservFoodEfficiency", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservWaterConsum"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservWaterConsum", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservWaterConsum", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOphthalm"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOphthalm", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservOphthalm", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHaematol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHaematol", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservHaematol", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinChem"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinChem", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservClinChem", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineFindings", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityEndocrine", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservUrin"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservUrin", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservUrin", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeurobehaviour"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeurobehaviour", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservNeurobehaviour", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ImmunologicalFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ImmunologicalFindings", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityImmunologicalFindings", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOrganWeights"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOrganWeights", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservOrganWeights", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservGrpathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservGrpathol", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservGrpathol", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeuropathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeuropathol", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservNeuropathol", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopathol", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservHistopathol", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopatholNeoplastic"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopatholNeoplastic", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservHistopatholNeoplastic", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OtherEffects"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OtherEffects", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityOtherEffects", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.EffectLevels"},
    {"field":"ResultsAndDiscussion.EffectLevels.Efflevel"},
    {"field":"ResultsAndDiscussion.TargetSystemOrganToxicity.TargetSystemOrganToxicity"}
	]
},
"ENDPOINT_STUDY_RECORD.RepeatedDoseToxicityInhalation": {
			"Method, guideline, deviations if any<br/>Species, strain, sex, no/group<br/>Test substance, dose levels, duration of exposure<br/>Remarks": 
				endpointLimitMethod + reliability + species + testMaterial + [
				{"field":"MaterialsAndMethods.AdministrationExposure.DosesConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.HighDoseLevelUsed"},
				{"field":"MaterialsAndMethods.AdministrationExposure.RouteOfAdministration"},
				{"field":"MaterialsAndMethods.AdministrationExposure.TypeOfInhalationExposureIfApplicable"},
				{"field":"MaterialsAndMethods.AdministrationExposure.Vehicle"},
				{"field":"MaterialsAndMethods.AdministrationExposure.AnalyticalVerificationOfDosesOrConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfTreatmentExposure"},
				{"field":"MaterialsAndMethods.AdministrationExposure.FrequencyOfTreatment"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfTest"}
			],
			"References": reference,
			"Results": [
				
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinSigns"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinSigns", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservClinSigns", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservDermalIrritation"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservDermalIrritation", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservDermalIrritation", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservMortality"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservMortality", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceMortality", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservBodyweight"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservBodyweight", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservBodyweight", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodConsum"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodConsum", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservFoodConsum", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodEfficiency"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodEfficiency", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservFoodEfficiency", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservWaterConsum"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservWaterConsum", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservWaterConsum", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOphthalm"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOphthalm", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservOphthalm", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHaematol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHaematol", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservHaematol", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinChem"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinChem", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservClinChem", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineFindings", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityEndocrine", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservUrin"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservUrin", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservUrin", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeurobehaviour"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeurobehaviour", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservNeurobehaviour", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ImmunologicalFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ImmunologicalFindings", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityImmunologicalFindings", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOrganWeights"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOrganWeights", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservOrganWeights", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservGrpathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservGrpathol", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservGrpathol", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeuropathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeuropathol", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservNeuropathol", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopathol", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservHistopathol", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopatholNeoplastic"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopatholNeoplastic", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservHistopatholNeoplastic", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OtherEffects"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OtherEffects", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityOtherEffects", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.EffectLevels"},
    {"field":"ResultsAndDiscussion.EffectLevels.Efflevel"},
    {"field":"ResultsAndDiscussion.TargetSystemOrganToxicity.TargetSystemOrganToxicity"}
]
},
"ENDPOINT_STUDY_RECORD.RepeatedDoseToxicityOral": {
			"Method, guideline, deviations if any<br/>Species, strain, sex, no/group<br/>Test substance, dose levels, duration of exposure<br/>Remarks": 
				endpointLimitMethod + reliability + species + testMaterial + [
				{"field":"MaterialsAndMethods.AdministrationExposure.DosesConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.HighDoseLevelUsed"},
				{"field":"MaterialsAndMethods.AdministrationExposure.RouteOfAdministration"},
				{"field":"MaterialsAndMethods.AdministrationExposure.TypeOfInhalationExposureIfApplicable"},
				{"field":"MaterialsAndMethods.AdministrationExposure.Vehicle"},
				{"field":"MaterialsAndMethods.AdministrationExposure.AnalyticalVerificationOfDosesOrConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfTreatmentExposure"},
				{"field":"MaterialsAndMethods.AdministrationExposure.FrequencyOfTreatment"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfTest"}
			],
			"References": reference,
			"Results": [
				{"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinSigns"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinSigns", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservClinSigns", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservDermalIrritation"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservDermalIrritation", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservDermalIrritation", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservMortality"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservMortality", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceMortality", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservBodyweight"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservBodyweight", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservBodyweight", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodConsum"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodConsum", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservFoodConsum", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodEfficiency"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodEfficiency", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservFoodEfficiency", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservWaterConsum"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservWaterConsum", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservWaterConsum", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOphthalm"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOphthalm", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservOphthalm", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHaematol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHaematol", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservHaematol", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinChem"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinChem", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservClinChem", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineFindings", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityEndocrine", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservUrin"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservUrin", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservUrin", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeurobehaviour"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeurobehaviour", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservNeurobehaviour", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ImmunologicalFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ImmunologicalFindings", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityImmunologicalFindings", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOrganWeights"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOrganWeights", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservOrganWeights", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservGrpathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservGrpathol", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservGrpathol", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeuropathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeuropathol", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservNeuropathol", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopathol", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservHistopathol", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopatholNeoplastic"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopatholNeoplastic", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservHistopatholNeoplastic", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OtherEffects"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OtherEffects", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityOtherEffects", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.EffectLevels"},
    {"field":"ResultsAndDiscussion.EffectLevels.Efflevel"},
    {"field":"ResultsAndDiscussion.TargetSystemOrganToxicity.TargetSystemOrganToxicity"}
]
}}}/>


<#assign table_54 = {
	"title":"Summary table of human data on adverse effects on sexual function and fertility",
	"columnWidths":[30,30,25,15],
"columns": columnSet3,
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.DirectObservationsClinicalCases": {
			"Observations": [
				{"field":"ResultsAndDiscussion.ClinicalSigns"},
				{"field":"ResultsAndDiscussion.RsExaminations"},
				{"field":"ResultsAndDiscussion.EffectivityMedicalTreatment"},
				{"field":"ResultsAndDiscussion.Outcome"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.Subjects"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.RouteOfExposure"},
				{"field":"MaterialsAndMethods.Method.ReasonOfExposure"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
},
"ENDPOINT_STUDY_RECORD.EpidemiologicalData": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"},
				{"field":"ResultsAndDiscussion.ConfoundingFactors"},
				{"field":"ResultsAndDiscussion.EffectLevels"},
				<#--  {"field":"ResultsAndDiscussion.EffectLevels.Efflevel"},  -->
				{"field":"ResultsAndDiscussion.TargetSystemOrganToxicity"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
},
"ENDPOINT_STUDY_RECORD.ExposureRelatedObservationsOther": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of data/report, substance exposed to etc.": [
				{"field":"MaterialsAndMethods.TypeOfStudyInformation"}] + reliability + method + testMaterial
},
"ENDPOINT_STUDY_RECORD.HealthSurveillanceData": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
}}}/>


<#assign table_55 = {
	"title":"Summary table of other studies relevant for toxicity on sexual function and fertility",
"columns": columnSet4,
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.ToxicityReproductionOther": {
			"Observations": [
				{"field":"ResultsAndDiscussion.EffectLevels"},
				{"field":"ResultsAndDiscussion.EffectLevels.Efflevel"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": species + [
				{"field":"MaterialsAndMethods.AdministrationExposure.DosesConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.HighDoseLevelUsed"},
				{"field":"MaterialsAndMethods.AdministrationExposure.AnalyticalVerificationOfDosesOrConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.RouteOfAdministration"},
				{"field":"MaterialsAndMethods.AdministrationExposure.TypeOfInhalationExposureIfApplicable"},
				{"field":"MaterialsAndMethods.AdministrationExposure.Vehicle"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfTreatmentExposure"},
				{"field":"MaterialsAndMethods.AdministrationExposure.FrequencyOfTreatment"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfTest"}
			],
			"Type of study/data, test substance": reliability + method + testMaterial
}}}/>


<#assign table_56 = {
	"title":"Summary table of animal studies on adverse effects on development",
"columns": [
	"Method, guideline, deviations if any<br/>Species, strain, sex, no/group<br/>Test substance, dose level, duration of exposure",
	"Results",
"References"
],
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.DevelopmentalToxicityTeratogenicity": {
			"Method, guideline, deviations if any<br/>Species, strain, sex, no/group<br/>Test substance, dose level, duration of exposure": 
			endpointLimitMethod + reliability + species + testMaterial + [
				{"field":"MaterialsAndMethods.AdministrationExposure.DosesConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.HighDoseLevelUsed"},
				{"field":"MaterialsAndMethods.AdministrationExposure.RouteOfAdministration"},
				{"field":"MaterialsAndMethods.AdministrationExposure.TypeOfInhalationExposureIfApplicable"},
				{"field":"MaterialsAndMethods.AdministrationExposure.Vehicle"},
				{"field":"MaterialsAndMethods.AdministrationExposure.AnalyticalVerificationOfDosesOrConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfTreatmentExposure"},
				{"field":"MaterialsAndMethods.AdministrationExposure.FrequencyOfTreatment"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfTest"}
			],
			"References": reference,
			"Results": [

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservClinSigns"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservClinSigns", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservClinSigns", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservDermalIrritationIfDermalStudy"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservDermalIrritationIfDermalStudy", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservDermalIrritationIfDermalStudy", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservMortality"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservMortality", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceMortality", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservBodyweight"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservBodyweight", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservBodyweight", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservFoodConsum"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservFoodConsum", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservFoodConsum", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservFoodEfficiency"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservFoodEfficiency", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservFoodEfficiency", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservWaterConsum"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservWaterConsum", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservWaterConsum", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservOphthalm"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservOphthalm", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservOphthalm", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservHaematol"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservHaematol", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservHaematol", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservClinChem"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservClinChem", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservClinChem", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.EndocrineFindings"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.EndocrineFindings", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityEndocrine", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservUrin"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservUrin", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservUrin", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservNeurobehaviour"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservNeurobehaviour", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservNeurobehaviour", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ImmunologicalFindings"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ImmunologicalFindings", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityImmunologicalFindings", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservOrganWeights"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservOrganWeights", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservOrganWeights", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservGrpathol"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservGrpathol", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservGrpathol", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservNeuropathol"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservNeuropathol", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservNeuropathol", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservHistopathol"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservHistopathol", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservHistopathol", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservHistopatholNeoplastic"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservHistopatholNeoplastic", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservHistopatholNeoplastic", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.OtherEffects"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.OtherEffects", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityOtherEffects", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.MaternalAbnormalities.MaternalAbnormalities"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.EffectLevelsMaternalAnimals.Efflevel"},
{"field":"ResultsAndDiscussion.ResultsFetuses.EffectLevelsFetuses.Efflevel"},
{"field":"ResultsAndDiscussion.ResultsFetuses.FetalBodyWeightChanges"},
{"field":"ResultsAndDiscussion.ResultsFetuses.ReductionInNumberOfLiveOffspring"},
{"field":"ResultsAndDiscussion.ResultsFetuses.ChangesInSexRatio"},
{"field":"ResultsAndDiscussion.ResultsFetuses.ChangesInLitterSizeAndWeights"},
{"field":"ResultsAndDiscussion.ResultsFetuses.AnogenitalDistanceOfAllRodentFetuses"},
{"field":"ResultsAndDiscussion.ResultsFetuses.ChangesInPostnatalSurvival"},
{"field":"ResultsAndDiscussion.ResultsFetuses.ExternalMalformations"},
{"field":"ResultsAndDiscussion.ResultsFetuses.SkeletalMalformations"},
{"field":"ResultsAndDiscussion.ResultsFetuses.VisceralMalformations"},
{"field":"ResultsAndDiscussion.ResultsFetuses.OtherEffects"},
{"field":"ResultsAndDiscussion.ResultsFetuses.FetalAbnormalities.FetalAbnormalities"},
{"field":"ResultsAndDiscussion.DevelopmentalToxicity.DevelopmentalToxicity"}

]
}}}/>


<#assign table_57 = {
	"title":"Summary table of human data on adverse effects on development",
	"columnWidths":[30,30,25,15],
"columns": columnSet3,
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.DirectObservationsClinicalCases": {
			"Observations": [
				{"field":"ResultsAndDiscussion.ClinicalSigns"},
				{"field":"ResultsAndDiscussion.RsExaminations"},
				{"field":"ResultsAndDiscussion.EffectivityMedicalTreatment"},
				{"field":"ResultsAndDiscussion.Outcome"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.Subjects"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.RouteOfExposure"},
				{"field":"MaterialsAndMethods.Method.ReasonOfExposure"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
},
"ENDPOINT_STUDY_RECORD.EpidemiologicalData": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"},
				{"field":"ResultsAndDiscussion.ConfoundingFactors"},
				{"field":"ResultsAndDiscussion.EffectLevels"},
				<#--  {"field":"ResultsAndDiscussion.EffectLevels.Efflevel"},  -->
				{"field":"ResultsAndDiscussion.TargetSystemOrganToxicity"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
},
"ENDPOINT_STUDY_RECORD.ExposureRelatedObservationsOther": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of data/report, substance exposed to etc.": [
				{"field":"MaterialsAndMethods.TypeOfStudyInformation"}] +
				reliability + method + testMaterial
},
"ENDPOINT_STUDY_RECORD.HealthSurveillanceData": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
}}}/>


<#assign table_58 = {
	"title":"Summary table of other studies relevant for developmental toxicity",
"columns": columnSet4,
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.ToxicityReproductionOther": {
			"Observations": [
				{"field":"ResultsAndDiscussion.EffectLevels"},
				{"field":"ResultsAndDiscussion.EffectLevels.Efflevel"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": species + [
				{"field":"MaterialsAndMethods.AdministrationExposure.DosesConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.HighDoseLevelUsed"},
				{"field":"MaterialsAndMethods.AdministrationExposure.AnalyticalVerificationOfDosesOrConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.RouteOfAdministration"},
				{"field":"MaterialsAndMethods.AdministrationExposure.TypeOfInhalationExposureIfApplicable"},
				{"field":"MaterialsAndMethods.AdministrationExposure.Vehicle"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfTreatmentExposure"},
				{"field":"MaterialsAndMethods.AdministrationExposure.FrequencyOfTreatment"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfTest"}
			],
			"Type of study/data, test substance": [
				{"field":"MaterialsAndMethods.MethodType"}] + reliability + method + testMaterial
}}}/>


<#assign table_59 = {
	"title":"Summary table of animal studies on effects on or via lactation",
"columnWidths": [43,43,14],
"columns": [
	"Method, guideline, deviations if any<br/>Species, strain, sex, no/group<br/>Test substance, dose levels, duration of exposure<br/>Remarks",
	"Results",
	"References"
	],
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.DevelopmentalToxicityTeratogenicity": {
			"Method, guideline, deviations if any<br/>Species, strain, sex, no/group<br/>Test substance, dose levels, duration of exposure<br/>Remarks": 
				endpointLimitMethod + reliability + species + testMaterial + [
				{"field":"MaterialsAndMethods.AdministrationExposure.DosesConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.HighDoseLevelUsed"},
				{"field":"MaterialsAndMethods.AdministrationExposure.RouteOfAdministration"},
				{"field":"MaterialsAndMethods.AdministrationExposure.TypeOfInhalationExposureIfApplicable"},
				{"field":"MaterialsAndMethods.AdministrationExposure.Vehicle"},
				{"field":"MaterialsAndMethods.AdministrationExposure.AnalyticalVerificationOfDosesOrConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfTreatmentExposure"},
				{"field":"MaterialsAndMethods.AdministrationExposure.FrequencyOfTreatment"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfTest"}
			],
			"References": reference,
			"Results": [
				{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservClinSigns"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservClinSigns", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservClinSigns", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservDermalIrritationIfDermalStudy"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservDermalIrritationIfDermalStudy", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservDermalIrritationIfDermalStudy", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservMortality"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservMortality", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceMortality", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservBodyweight"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservBodyweight", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservBodyweight", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservFoodConsum"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservFoodConsum", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservFoodConsum", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservFoodEfficiency"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservFoodEfficiency", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservFoodEfficiency", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservWaterConsum"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservWaterConsum", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservWaterConsum", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservOphthalm"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservOphthalm", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservOphthalm", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservHaematol"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservHaematol", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservHaematol", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservClinChem"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservClinChem", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservClinChem", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.EndocrineFindings"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.EndocrineFindings", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityEndocrine", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservUrin"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservUrin", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservUrin", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservNeurobehaviour"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservNeurobehaviour", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservNeurobehaviour", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ImmunologicalFindings"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ImmunologicalFindings", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityImmunologicalFindings", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservOrganWeights"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservOrganWeights", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservOrganWeights", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservGrpathol"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservGrpathol", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservGrpathol", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservNeuropathol"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservNeuropathol", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservNeuropathol", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservHistopathol"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservHistopathol", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservHistopathol", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservHistopatholNeoplastic"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservHistopatholNeoplastic", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservHistopatholNeoplastic", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.OtherEffects"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.OtherEffects", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityOtherEffects", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.MaternalAbnormalities.MaternalAbnormalities"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.EffectLevelsMaternalAnimals.Efflevel"},
{"field":"ResultsAndDiscussion.ResultsFetuses.EffectLevelsFetuses.Efflevel"},
{"field":"ResultsAndDiscussion.ResultsFetuses.FetalBodyWeightChanges"},
{"field":"ResultsAndDiscussion.ResultsFetuses.ReductionInNumberOfLiveOffspring"},
{"field":"ResultsAndDiscussion.ResultsFetuses.ChangesInSexRatio"},
{"field":"ResultsAndDiscussion.ResultsFetuses.ChangesInLitterSizeAndWeights"},
{"field":"ResultsAndDiscussion.ResultsFetuses.AnogenitalDistanceOfAllRodentFetuses"},
{"field":"ResultsAndDiscussion.ResultsFetuses.ChangesInPostnatalSurvival"},
{"field":"ResultsAndDiscussion.ResultsFetuses.ExternalMalformations"},
{"field":"ResultsAndDiscussion.ResultsFetuses.SkeletalMalformations"},
{"field":"ResultsAndDiscussion.ResultsFetuses.VisceralMalformations"},
{"field":"ResultsAndDiscussion.ResultsFetuses.OtherEffects"},
{"field":"ResultsAndDiscussion.ResultsFetuses.FetalAbnormalities.FetalAbnormalities"},
{"field":"ResultsAndDiscussion.DevelopmentalToxicity.DevelopmentalToxicity"}
]
},
"ENDPOINT_STUDY_RECORD.ToxicityReproduction": {
			"Method, guideline, deviations if any<br/>Species, strain, sex, no/group<br/>Test substance, dose levels, duration of exposure<br/>Remarks": 
				endpointLimitMethod + reliability + species + testMaterial + [
				{"field":"MaterialsAndMethods.AdministrationExposure.DosesConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.HighDoseLevelUsed"},
				{"field":"MaterialsAndMethods.AdministrationExposure.RouteOfAdministration"},
				{"field":"MaterialsAndMethods.AdministrationExposure.TypeOfInhalationExposureIfApplicable"},
				{"field":"MaterialsAndMethods.AdministrationExposure.Vehicle"},
				{"field":"MaterialsAndMethods.AdministrationExposure.AnalyticalVerificationOfDosesOrConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfTreatmentExposure"},
				{"field":"MaterialsAndMethods.AdministrationExposure.FrequencyOfTreatment"}
			],
			"References": reference,
			"Results": [
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0"},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservClinSigns"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservClinSigns","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservClinSigns","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservDermalIrritationIfDermalStudy"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservDermalIrritationIfDermalStudy","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservDermalIrritationIfDermalStudy","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservMortality"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservMortality","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceMortality","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservBodyweight"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservBodyweight","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservBodyweight","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservFoodConsum"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservFoodConsum","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservFoodConsum","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservFoodEfficiency"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservFoodEfficiency","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservFoodEfficiency","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservWaterConsum"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservWaterConsum","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservWaterConsum","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservOphthalm"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservOphthalm","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservOphthalm","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservHaematol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservHaematol","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservHaematol","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservClinChem"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservClinChem","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservClinChem","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.EndocrineFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.EndocrineFindings","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservUrin","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservUrin"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservUrin","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservNeurobehaviour","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservNeurobehaviour"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservNeurobehaviour","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityImmunologicalFindings","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ImmunologicalFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ImmunologicalFindings","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservOrganWeights","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservOrganWeights"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservOrganWeights","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservGrpathol","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservGrpathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservGrpathol","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservNeuropathol","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservNeuropathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservNeuropathol","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservHistopathol","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservHistopathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservHistopathol","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservHistopatholNeoplastic","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservHistopatholNeoplastic"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservHistopatholNeoplastic","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityOtherEffects","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.OtherEffects"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.OtherEffects","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservEstrousParent","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.ReproductiveFunctionPerformanceP0.ObservEstrousParent"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.ReproductiveFunctionPerformanceP0.ObservEstrousParent","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservSpermParent","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.ReproductiveFunctionPerformanceP0.ObservSpermParent"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.ReproductiveFunctionPerformanceP0.ObservSpermParent","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservReproPerformParent","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.ReproductiveFunctionPerformanceP0.ObservReproPerformParent"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.ReproductiveFunctionPerformanceP0.ObservReproPerformParent","params":{"before":"Signs","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.EffectLevelsP0.Efflevel"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.TargetSystemOrganToxicityP0.TargetSystemOrganToxicity"},


	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1"},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservClinSigns"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservClinSigns","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservClinSigns","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservDermalIrritationIfDermalStudy"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservDermalIrritationIfDermalStudy","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservDermalIrritationIfDermalStudy","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservMortality"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservMortality","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceMortality","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservBodyweight"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservBodyweight","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservBodyweight","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservFoodConsum"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservFoodConsum","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservFoodConsum","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservFoodEfficiency"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservFoodEfficiency","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservFoodEfficiency","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservWaterConsum"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservWaterConsum","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservWaterConsum","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservOphthalm"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservOphthalm","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservOphthalm","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservHaematol"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservHaematol","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservHaematol","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservClinChem"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservClinChem","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservClinChem","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.EndocrineFindings"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.EndocrineFindings","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityEndocrine","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservUrin"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservUrin","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservUrin","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservNeurobehaviour"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservNeurobehaviour","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservNeurobehaviour","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ImmunologicalFindings"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ImmunologicalFindings","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityImmunologicalFindings","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservOrganWeights"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservOrganWeights","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservOrganWeights","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservGrpathol"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservGrpathol","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservGrpathol","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservNeuropathol"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservNeuropathol","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservNeuropathol","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservHistopathol"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservHistopathol","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservHistopathol","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservHistopatholNeoplastic"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservHistopatholNeoplastic","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservHistopatholNeoplastic","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.OtherEffects"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.OtherEffects","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityOtherEffects","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.ReproductiveFunctionPerformanceP1.ReproductiveFunctionEstrousCycle"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.ReproductiveFunctionPerformanceP1.ReproductiveFunctionEstrousCycle","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.ReproductiveFunctionPerformanceP1.DescriptionIncidenceAndSeverityReproductiveFunctionEstrousCycle","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.ReproductiveFunctionPerformanceP1.ReproductiveFunctionSpermMeasures"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.ReproductiveFunctionPerformanceP1.ReproductiveFunctionSpermMeasures","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityOtherEffects","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.ReproductiveFunctionPerformanceP1.ReproductivePerformance"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.ReproductiveFunctionPerformanceP1.ReproductivePerformance","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityOtherEffects","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.EffectLevelsP1.Efflevel"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.TargetSystemOrganToxicityP1.TargetSystemOrganToxicity"},


	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1"},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservClinOffspring"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservClinOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservClinOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DermalIrritationOffspringIfDermalStudy"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DermalIrritationOffspringIfDermalStudy","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityDermalIrritationOffspringIfDermalStudy","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservViabilityOffspring"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservViabilityOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservViabilityOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservBodyweightOffspring"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservBodyweightOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservBodyweightOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservFoodConsumOffspring"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservFoodConsumOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservFoodConsumOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservFoodEfficiencyOffspring"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservFoodEfficiencyOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservFoodEfficiencyOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservWaterConsumOffspring"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservWaterConsumOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservWaterConsumOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservOphthalmOffspring"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservOphthalmOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservOphthalmOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservHaematolOffspring"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservHaematolOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservHaematolOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservClinChemOffspring"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservClinChemOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservClinChemOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservUrinOffspring"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservUrinOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservUrinOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservMaturationOffspring"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservMaturationOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservMaturationOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.AnogenitalDistance"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.AnogenitalDistance","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityAnogenitalDistance","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.NippleRetentionInMalePups"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.NippleRetentionInMalePups","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityNippleRetentionInMalePups","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservOrganWeightsOffspring"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservOrganWeightsOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservOrganWeightsOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservGrpatholOffspring"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservGrpatholOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservGrpatholOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservHistopathol"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservHistopathol","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservHistopatholOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.OtherEffects"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.OtherEffects","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityOtherEffectsOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.DevelopmentalNeurotoxicityF1.BehaviourFunctionalFindings"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.DevelopmentalNeurotoxicityF1.BehaviourFunctionalFindings","params":{"before":"Signs","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.DevelopmentalImmunotoxicityF1.DevelopmentalImmunotoxicity"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.DevelopmentalImmunotoxicityF1.DevelopmentalImmunotoxicity","params":{"before":"Signs","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.EffectLevelsF1.Efflevel"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.TargetSystemOrganToxicityF1.TargetSystemOrganToxicity"},


	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2"},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservClinOffspring"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservClinOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservClinOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DermalIrritationOffspringIfDermalStudy"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DermalIrritationOffspringIfDermalStudy","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityDermalIrritationOffspringIfDermalStudy","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservViabilityOffspring"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservViabilityOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservViabilityOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservBodyweightOffspring"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservBodyweightOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservBodyweightOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservFoodConsumOffspring"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservFoodConsumOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservFoodConsumOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservFoodEfficiencyOffspring"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservFoodEfficiencyOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservFoodEfficiencyOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservWaterConsumOffspring"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservWaterConsumOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservWaterConsumOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservOphthalmOffspring"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservOphthalmOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservOphthalmOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservHaematolOffspring"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservHaematolOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservHaematolOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservClinChemOffspring"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservClinChemOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservClinChemOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservUrinOffspring"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservUrinOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservUrinOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservMaturationOffspring"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservMaturationOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservMaturationOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.AnogenitalDistance"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.AnogenitalDistance","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityAnogenitalDistance","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.NippleRetentionInMalePups"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.NippleRetentionInMalePups","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityNippleRetentionInMalePups","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservOrganWeightsOffspring"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservOrganWeightsOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservOrganWeightsOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservGrpatholOffspring"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservGrpatholOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservGrpatholOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservHistopathol"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservHistopathol","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservHistopatholOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.OtherEffects"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.OtherEffects","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityOtherEffectsOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.DevelopmentalNeurotoxicityF2.BehaviourFunctionalFindings"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.DevelopmentalNeurotoxicityF2.BehaviourFunctionalFindings","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityBehaviourFunctionalFindings","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.DevelopmentalImmunotoxicityF2.DevelopmentalImmunotoxicity"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.DevelopmentalImmunotoxicityF2.DevelopmentalImmunotoxicity","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityDevelopmentalImmunotoxicity","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.EffectLevelsF2.Efflevel"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.TargetSystemOrganToxicityF2.TargetSystemOrganToxicity"},
	{"field":"ResultsAndDiscussion.ReproductiveToxicity.ReproductiveToxicity"}

	]
}}}/>


<#assign table_60 = {
	"title":"Summary table of human data on effects on or via lactation",
	"columnWidths":[30,30,25,15],
"columns": columnSet3,
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.DirectObservationsClinicalCases": {
			"Observations": [
				{"field":"ResultsAndDiscussion.ClinicalSigns"},
				{"field":"ResultsAndDiscussion.RsExaminations"},
				{"field":"ResultsAndDiscussion.EffectivityMedicalTreatment"},
				{"field":"ResultsAndDiscussion.Outcome"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.Subjects"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.RouteOfExposure"},
				{"field":"MaterialsAndMethods.Method.ReasonOfExposure"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
},
"ENDPOINT_STUDY_RECORD.EpidemiologicalData": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"},
				{"field":"ResultsAndDiscussion.ConfoundingFactors"},
				{"field":"ResultsAndDiscussion.EffectLevels"},
				<#--  {"field":"ResultsAndDiscussion.EffectLevels.Efflevel"},  -->
				{"field":"ResultsAndDiscussion.TargetSystemOrganToxicity"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
},
"ENDPOINT_STUDY_RECORD.ExposureRelatedObservationsOther": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of data/report, substance exposed to etc.": [
				{"field":"MaterialsAndMethods.TypeOfStudyInformation"}] + reliability + method + testMaterial
},
"ENDPOINT_STUDY_RECORD.HealthSurveillanceData": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
}}}/>


<#assign table_61 = {
	"title":"Summary table of other studies relevant for effects on or via lactation",
"columns": columnSet4,
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.ToxicityReproductionOther": {
			"Observations": [
				{"field":"ResultsAndDiscussion.EffectLevels"},
				{"field":"ResultsAndDiscussion.EffectLevels.Efflevel"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": species + [
				{"field":"MaterialsAndMethods.AdministrationExposure.DosesConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.HighDoseLevelUsed"},
				{"field":"MaterialsAndMethods.AdministrationExposure.AnalyticalVerificationOfDosesOrConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.RouteOfAdministration"},
				{"field":"MaterialsAndMethods.AdministrationExposure.TypeOfInhalationExposureIfApplicable"},
				{"field":"MaterialsAndMethods.AdministrationExposure.Vehicle"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfTreatmentExposure"},
				{"field":"MaterialsAndMethods.AdministrationExposure.FrequencyOfTreatment"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfTest"}
			],
			"Type of study/data, test substance": [
				{"field":"MaterialsAndMethods.MethodType"}] + reliability + method + testMaterial
}}}/>


<#assign table_62 = {
	"title":"Summary table of animal studies on STOT SE ",
"columnWidths": [43,43,14],
"columns": [
	"Method, guideline, deviations if any<br/>Species, strain, sex, no/group<br/>Test substance, dose levels, duration of exposure<br/>Remarks",
	"Results",
	"References"
	],
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.AcuteToxicityDermal": {
			"Method, guideline, deviations if any<br/>Species, strain, sex, no/group<br/>Test substance, dose levels, duration of exposure<br/>Remarks": 
				testMethod + reliability + species + testMaterial +
				[
				{"field":"MaterialsAndMethods.AdministrationExposure.Doses"},
				{"field":"MaterialsAndMethods.AdministrationExposure.TypeOfCoverage"},
				{"field":"MaterialsAndMethods.AdministrationExposure.Vehicle"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfExposure"}
			],
			"References": reference,
			"Results": [
				{"field":"ResultsAndDiscussion.EffectLevels"},
				{"field":"ResultsAndDiscussion.EffectLevels.EffectLevel"}
			]
},
"ENDPOINT_STUDY_RECORD.AcuteToxicityInhalation": {
			"Method, guideline, deviations if any<br/>Species, strain, sex, no/group<br/>Test substance, dose levels, duration of exposure<br/>Remarks": 
				testMethod + reliability + species + testMaterial + [
				{"field":"MaterialsAndMethods.AdministrationExposure.MassMedianAerodynamicDiameter"},
				{"field":"MaterialsAndMethods.AdministrationExposure.GeometricStandardDeviation"},
				{"field":"MaterialsAndMethods.AdministrationExposure.RemarksOnMMAD"},
				{"field":"MaterialsAndMethods.AdministrationExposure.Concentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.Vehicle"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfExposure"}
			],
			"References": reference,
			"Results": [
				{"field":"ResultsAndDiscussion.EffectLevels"},
				{"field":"ResultsAndDiscussion.EffectLevels.EffectLevel"}
			]
},
"ENDPOINT_STUDY_RECORD.AcuteToxicityOral": {
			"Method, guideline, deviations if any<br/>Species, strain, sex, no/group<br/>Test substance, dose levels, duration of exposure<br/>Remarks": 
				testMethod + reliability + species + testMaterial + [
				{"field":"MaterialsAndMethods.AdministrationExposure.Doses"}
			],
			"References": reference,
			"Results": [
				{"field":"ResultsAndDiscussion.Mortality"}
				{"field":"ResultsAndDiscussion.EffectLevels"},
				{"field":"ResultsAndDiscussion.EffectLevels.EffectLevel"},
				{"field":"ResultsAndDiscussion.ClinicalSigns"},
				{"field":"ResultsAndDiscussion.GrossPathology"},
				{"field":"ResultsAndDiscussion.OtherFindings"}
			]
}}}/>


<#assign table_63 = {
	"title":"Summary table of human data on STOT SE",
	"columnWidths":[30,30,25,15],
"columns": columnSet3,
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.DirectObservationsClinicalCases": {
			"Observations": [
				{"field":"ResultsAndDiscussion.ClinicalSigns"},
				{"field":"ResultsAndDiscussion.RsExaminations"},
				{"field":"ResultsAndDiscussion.EffectivityMedicalTreatment"},
				{"field":"ResultsAndDiscussion.Outcome"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.Subjects"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.RouteOfExposure"},
				{"field":"MaterialsAndMethods.Method.ReasonOfExposure"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"},
				{"field":"MaterialsAndMethods.Method.DetailsOnExposure"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
},
"ENDPOINT_STUDY_RECORD.EpidemiologicalData": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"},
				{"field":"ResultsAndDiscussion.ConfoundingFactors"},
				{"field":"ResultsAndDiscussion.EffectLevels"},
				<#--  {"field":"ResultsAndDiscussion.EffectLevels.Efflevel"},  -->
				{"field":"ResultsAndDiscussion.TargetSystemOrganToxicity"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
},
"ENDPOINT_STUDY_RECORD.ExposureRelatedObservationsOther": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Test substance": [
				
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
},
"ENDPOINT_STUDY_RECORD.HealthSurveillanceData": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
}}}/>


<#assign table_64 = {
	"title":"Summary table of other studies relevant for STOT SE",
"columns": columnSet4,
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.ToxicEffectsLivestock": {
			"Observations": [
				{"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinSigns"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinSigns", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ClinSignsDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.Mortality"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.Mortality", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.MortalityDescriptionIncidence", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservBodyweight"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservBodyweight", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.WeightDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodConsum"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodConsum", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.FoodConsDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.FoodEfficiency"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.FoodEfficiency", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.FoodEffDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservWaterConsum"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservWaterConsum", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.WaterConsDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OphthalmologicalFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OphthalmologicalFindings", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OphtalDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHaematol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHaematol", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.HaematoDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinChem"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinChem", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ClinBiochemDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineFindings", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservUrin"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservUrin", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.UrinalysisDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.BehaviourFunctionalFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.BehaviourFunctionalFindings", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.BehaviourDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ImmunologicalFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ImmunologicalFindings", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ImmunoDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OrganWeightFindingsIncludingOrganBodyWeightRatios"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OrganWeightFindingsIncludingOrganBodyWeightRatios", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OrganWeightDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.NeuropathologicalFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.NeuropathologicalFindings", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.NeuroDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservGrpathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservGrpathol", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.GrossPathDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopathol", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.HistopathNonNeoDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.HistopathologicalFindingsNeoplastic"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.HistopathologicalFindingsNeoplastic", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.HistoNeoDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OtherEffects"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OtherEffects", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OtherEffectsDescriptionIncidenceAndSeverity", "params":{"before":"Description", "after":""}},

	{"field":"ResultsAndDiscussion.EffectLevels"},
	{"field":"ResultsAndDiscussion.EffectLevels.Efflevel"},
	{"field":"ResultsAndDiscussion.TargetSystemOrganToxicity"},
	{"field":"ResultsAndDiscussion.TargetSystemOrganToxicity.TargetSystemOrganToxicity"}
	],
			"References": reference,
			"Relevant information about the study (as applicable)": relevantInfo,
			"Type of study/data, test substance": reliability + method + testMaterial
}}}/>


<#assign table_65 = {
	"title":"Summary table of animal studies on STOT RE",
"columnWidths": [43,43,14],
"columns": [
	"Method, guideline, deviations if any<br/>Species, strain, sex, no/group<br/>Test substance, dose levels, duration of exposure<br/>Remarks",
	"Results",
	"References"
],
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.Carcinogenicity": {
			"Method, guideline, deviations if any<br/>Species, strain, sex, no/group<br/>Test substance, dose levels, duration of exposure<br/>Remarks": 
				endpointMethod + reliability + species + testMaterial + [
				{"field":"MaterialsAndMethods.AdministrationExposure.DosesConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.HighDoseLevelUsed"},
				{"field":"MaterialsAndMethods.AdministrationExposure.RouteOfAdministration"},
				{"field":"MaterialsAndMethods.AdministrationExposure.TypeOfInhalationExposureIfApplicable"},
				{"field":"MaterialsAndMethods.AdministrationExposure.Vehicle"},
				{"field":"MaterialsAndMethods.AdministrationExposure.AnalyticalVerificationOfDosesOrConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfTreatmentExposure"},
				{"field":"MaterialsAndMethods.AdministrationExposure.FrequencyOfTreatment"},
				{"field":"MaterialsAndMethods.AdministrationExposure.PostExposurePeriod"}
			],
			"References": reference,
			"Results": [
				{"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinSigns"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinSigns", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservClinSigns", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservDermalIrritationIfDermalStudy"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservDermalIrritationIfDermalStudy", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservDermalIrritationIfDermalStudy", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservMortality"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservMortality", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceMortality", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservBodyweight"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservBodyweight", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservBodyweight", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodConsum"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodConsum", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservFoodConsum", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodEfficiency"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodEfficiency", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservFoodEfficiency", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservWaterConsum"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservWaterConsum", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservWaterConsum", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOphthalm"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOphthalm", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservOphthalm", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHaematol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHaematol", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservHaematol", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinChem"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinChem", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservClinChem", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineFindings", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityEndocrine", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservUrin"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservUrin", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservUrin", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeurobehaviour"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeurobehaviour", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservNeurobehaviour", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ImmunologicalFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ImmunologicalFindings", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityImmunologicalFindings", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOrganWeights"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOrganWeights", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservOrganWeights", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservGrpathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservGrpathol", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservGrpathol", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeuropathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeuropathol", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservNeuropathol", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopathol", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservHistopathol", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopatholNeoplastic"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopatholNeoplastic", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservHistopatholNeoplastic", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OtherEffects"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OtherEffects", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityOtherEffects", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.RelevanceOfCarcinogenicEffectsPotential "},

    {"field":"ResultsAndDiscussion.EffectLevels"},
    {"field":"ResultsAndDiscussion.EffectLevels.Efflevel"},

    {"field":"ResultsAndDiscussion.TargetSystemOrganToxicity"}

]
},
"ENDPOINT_STUDY_RECORD.DevelopmentalToxicityTeratogenicity": {
			"Method, guideline, deviations if any<br/>Species, strain, sex, no/group<br/>Test substance, dose levels, duration of exposure<br/>Remarks": 
				endpointLimitMethod + reliability + species + testMaterial + [
				{"field":"MaterialsAndMethods.AdministrationExposure.DosesConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.HighDoseLevelUsed"},
				{"field":"MaterialsAndMethods.AdministrationExposure.RouteOfAdministration"},
				{"field":"MaterialsAndMethods.AdministrationExposure.TypeOfInhalationExposureIfApplicable"},
				{"field":"MaterialsAndMethods.AdministrationExposure.Vehicle"},
				{"field":"MaterialsAndMethods.AdministrationExposure.AnalyticalVerificationOfDosesOrConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfTreatmentExposure"},
				{"field":"MaterialsAndMethods.AdministrationExposure.FrequencyOfTreatment"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfTest"}
			],
			"References": reference,
			"Results": [
				{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservClinSigns"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservClinSigns", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservClinSigns", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservDermalIrritationIfDermalStudy"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservDermalIrritationIfDermalStudy", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservDermalIrritationIfDermalStudy", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservMortality"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservMortality", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceMortality", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservBodyweight"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservBodyweight", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservBodyweight", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservFoodConsum"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservFoodConsum", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservFoodConsum", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservFoodEfficiency"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservFoodEfficiency", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservFoodEfficiency", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservWaterConsum"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservWaterConsum", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservWaterConsum", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservOphthalm"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservOphthalm", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservOphthalm", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservHaematol"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservHaematol", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservHaematol", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservClinChem"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservClinChem", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservClinChem", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.EndocrineFindings"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.EndocrineFindings", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityEndocrine", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservUrin"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservUrin", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservUrin", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservNeurobehaviour"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservNeurobehaviour", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservNeurobehaviour", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ImmunologicalFindings"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ImmunologicalFindings", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityImmunologicalFindings", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservOrganWeights"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservOrganWeights", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservOrganWeights", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservGrpathol"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservGrpathol", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservGrpathol", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservNeuropathol"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservNeuropathol", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservNeuropathol", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservHistopathol"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservHistopathol", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservHistopathol", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservHistopatholNeoplastic"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.ObservHistopatholNeoplastic", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityObservHistopatholNeoplastic", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.OtherEffects"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.OtherEffects", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.GeneralToxicityMaternalAnimals.DescriptionIncidenceAndSeverityOtherEffects", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.MaternalAbnormalities.MaternalAbnormalities"},
{"field":"ResultsAndDiscussion.ResultsMaternalAnimals.EffectLevelsMaternalAnimals.Efflevel"},
{"field":"ResultsAndDiscussion.ResultsFetuses.EffectLevelsFetuses.Efflevel"},
{"field":"ResultsAndDiscussion.ResultsFetuses.FetalBodyWeightChanges"},
{"field":"ResultsAndDiscussion.ResultsFetuses.ReductionInNumberOfLiveOffspring"},
{"field":"ResultsAndDiscussion.ResultsFetuses.ChangesInSexRatio"},
{"field":"ResultsAndDiscussion.ResultsFetuses.ChangesInLitterSizeAndWeights"},
{"field":"ResultsAndDiscussion.ResultsFetuses.AnogenitalDistanceOfAllRodentFetuses"},
{"field":"ResultsAndDiscussion.ResultsFetuses.ChangesInPostnatalSurvival"},
{"field":"ResultsAndDiscussion.ResultsFetuses.ExternalMalformations"},
{"field":"ResultsAndDiscussion.ResultsFetuses.SkeletalMalformations"},
{"field":"ResultsAndDiscussion.ResultsFetuses.VisceralMalformations"},
{"field":"ResultsAndDiscussion.ResultsFetuses.OtherEffects"},
{"field":"ResultsAndDiscussion.ResultsFetuses.FetalAbnormalities.FetalAbnormalities"},
{"field":"ResultsAndDiscussion.DevelopmentalToxicity.DevelopmentalToxicity"}
]
},
"ENDPOINT_STUDY_RECORD.RepeatedDoseToxicityDermal": {
			"Method, guideline, deviations if any<br/>Species, strain, sex, no/group<br/>Test substance, dose levels, duration of exposure<br/>Remarks": 
				endpointLimitMethod + reliability + species + testMaterial + [
				{"field":"MaterialsAndMethods.AdministrationExposure.DosesConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.HighDoseLevelUsed"},
				{"field":"MaterialsAndMethods.AdministrationExposure.RouteOfAdministration"},
				{"field":"MaterialsAndMethods.AdministrationExposure.TypeOfCoverage"},
				{"field":"MaterialsAndMethods.AdministrationExposure.Vehicle"},
				{"field":"MaterialsAndMethods.AdministrationExposure.AnalyticalVerificationOfDosesOrConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfTreatmentExposure"},
				{"field":"MaterialsAndMethods.AdministrationExposure.FrequencyOfTreatment"}
			],
			"References": reference,
			"Results": [

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinSigns"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinSigns", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservClinSigns", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservDermalIrritation"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservDermalIrritation", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservDermalIrritation", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservMortality"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservMortality", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceMortality", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservBodyweight"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservBodyweight", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservBodyweight", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodConsum"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodConsum", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservFoodConsum", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodEfficiency"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodEfficiency", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservFoodEfficiency", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservWaterConsum"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservWaterConsum", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservWaterConsum", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOphthalm"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOphthalm", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservOphthalm", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHaematol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHaematol", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservHaematol", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinChem"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinChem", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservClinChem", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineFindings", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityEndocrine", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservUrin"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservUrin", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservUrin", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeurobehaviour"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeurobehaviour", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservNeurobehaviour", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ImmunologicalFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ImmunologicalFindings", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityImmunologicalFindings", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOrganWeights"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOrganWeights", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservOrganWeights", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservGrpathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservGrpathol", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservGrpathol", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeuropathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeuropathol", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservNeuropathol", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopathol", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservHistopathol", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopatholNeoplastic"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopatholNeoplastic", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservHistopatholNeoplastic", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OtherEffects"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OtherEffects", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityOtherEffects", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.EffectLevels"},
    {"field":"ResultsAndDiscussion.EffectLevels.Efflevel"},
    {"field":"ResultsAndDiscussion.TargetSystemOrganToxicity.TargetSystemOrganToxicity"}
]
},
"ENDPOINT_STUDY_RECORD.RepeatedDoseToxicityInhalation": {
			"Method, guideline, deviations if any<br/>Species, strain, sex, no/group<br/>Test substance, dose levels, duration of exposure<br/>Remarks": 
				endpointLimitMethod + reliability + species + testMaterial + [
				{"field":"MaterialsAndMethods.AdministrationExposure.DosesConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.HighDoseLevelUsed"},
				{"field":"MaterialsAndMethods.AdministrationExposure.RouteOfAdministration"},
				{"field":"MaterialsAndMethods.AdministrationExposure.TypeOfInhalationExposureIfApplicable"},
				{"field":"MaterialsAndMethods.AdministrationExposure.Vehicle"},
				{"field":"MaterialsAndMethods.AdministrationExposure.AnalyticalVerificationOfDosesOrConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfTreatmentExposure"},
				{"field":"MaterialsAndMethods.AdministrationExposure.FrequencyOfTreatment"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfTest"}
			],
			"References": reference,
			"Results": [
				
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinSigns"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinSigns", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservClinSigns", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservDermalIrritation"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservDermalIrritation", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservDermalIrritation", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservMortality"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservMortality", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceMortality", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservBodyweight"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservBodyweight", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservBodyweight", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodConsum"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodConsum", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservFoodConsum", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodEfficiency"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodEfficiency", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservFoodEfficiency", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservWaterConsum"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservWaterConsum", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservWaterConsum", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOphthalm"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOphthalm", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservOphthalm", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHaematol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHaematol", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservHaematol", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinChem"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinChem", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservClinChem", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineFindings", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityEndocrine", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservUrin"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservUrin", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservUrin", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeurobehaviour"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeurobehaviour", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservNeurobehaviour", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ImmunologicalFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ImmunologicalFindings", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityImmunologicalFindings", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOrganWeights"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOrganWeights", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservOrganWeights", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservGrpathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservGrpathol", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservGrpathol", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeuropathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeuropathol", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservNeuropathol", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopathol", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservHistopathol", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopatholNeoplastic"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopatholNeoplastic", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservHistopatholNeoplastic", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OtherEffects"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OtherEffects", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityOtherEffects", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.EffectLevels"},
    {"field":"ResultsAndDiscussion.EffectLevels.Efflevel"},
    {"field":"ResultsAndDiscussion.TargetSystemOrganToxicity.TargetSystemOrganToxicity"}
	
]
},
"ENDPOINT_STUDY_RECORD.RepeatedDoseToxicityOral": {
			"Method, guideline, deviations if any<br/>Species, strain, sex, no/group<br/>Test substance, dose levels, duration of exposure<br/>Remarks": 
				endpointLimitMethod + reliability + species + testMaterial + [
				{"field":"MaterialsAndMethods.AdministrationExposure.DosesConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.HighDoseLevelUsed"},
				{"field":"MaterialsAndMethods.AdministrationExposure.RouteOfAdministration"},
				{"field":"MaterialsAndMethods.AdministrationExposure.TypeOfInhalationExposureIfApplicable"},
				{"field":"MaterialsAndMethods.AdministrationExposure.Vehicle"},
				{"field":"MaterialsAndMethods.AdministrationExposure.AnalyticalVerificationOfDosesOrConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfTreatmentExposure"},
				{"field":"MaterialsAndMethods.AdministrationExposure.FrequencyOfTreatment"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfTest"}
			],
			"References": reference,
			"Results": [
				{"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinSigns"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinSigns", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservClinSigns", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservDermalIrritation"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservDermalIrritation", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservDermalIrritation", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservMortality"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservMortality", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceMortality", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservBodyweight"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservBodyweight", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservBodyweight", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodConsum"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodConsum", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservFoodConsum", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodEfficiency"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodEfficiency", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservFoodEfficiency", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservWaterConsum"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservWaterConsum", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservWaterConsum", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOphthalm"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOphthalm", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservOphthalm", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHaematol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHaematol", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservHaematol", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinChem"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinChem", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservClinChem", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineFindings", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityEndocrine", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservUrin"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservUrin", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservUrin", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeurobehaviour"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeurobehaviour", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservNeurobehaviour", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ImmunologicalFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ImmunologicalFindings", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityImmunologicalFindings", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOrganWeights"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOrganWeights", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservOrganWeights", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservGrpathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservGrpathol", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservGrpathol", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeuropathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeuropathol", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservNeuropathol", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopathol", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservHistopathol", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopatholNeoplastic"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopatholNeoplastic", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservHistopatholNeoplastic", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OtherEffects"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OtherEffects", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityOtherEffects", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.EffectLevels"},
    {"field":"ResultsAndDiscussion.EffectLevels.Efflevel"},
    {"field":"ResultsAndDiscussion.TargetSystemOrganToxicity.TargetSystemOrganToxicity"}
]
},
"ENDPOINT_STUDY_RECORD.ToxicityReproduction": {
			"Method, guideline, deviations if any<br/>Species, strain, sex, no/group<br/>Test substance, dose levels, duration of exposure<br/>Remarks": 
				endpointLimitMethod + reliability + species + testMaterial + [
				{"field":"MaterialsAndMethods.AdministrationExposure.DosesConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.HighDoseLevelUsed"},
				{"field":"MaterialsAndMethods.AdministrationExposure.RouteOfAdministration"},
				{"field":"MaterialsAndMethods.AdministrationExposure.TypeOfInhalationExposureIfApplicable"},
				{"field":"MaterialsAndMethods.AdministrationExposure.Vehicle"},
				{"field":"MaterialsAndMethods.AdministrationExposure.AnalyticalVerificationOfDosesOrConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfTreatmentExposure"},
				{"field":"MaterialsAndMethods.AdministrationExposure.FrequencyOfTreatment"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfTest"}
			],
			"References": reference,
			"Results": [
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0"},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservClinSigns"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservClinSigns","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservClinSigns","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservDermalIrritationIfDermalStudy"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservDermalIrritationIfDermalStudy","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservDermalIrritationIfDermalStudy","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservMortality"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservMortality","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceMortality","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservBodyweight"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservBodyweight","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservBodyweight","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservFoodConsum"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservFoodConsum","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservFoodConsum","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservFoodEfficiency"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservFoodEfficiency","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservFoodEfficiency","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservWaterConsum"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservWaterConsum","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservWaterConsum","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservOphthalm"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservOphthalm","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservOphthalm","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservHaematol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservHaematol","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservHaematol","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservClinChem"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservClinChem","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservClinChem","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.EndocrineFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.EndocrineFindings","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservUrin","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservUrin"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservUrin","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservNeurobehaviour","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservNeurobehaviour"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservNeurobehaviour","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityImmunologicalFindings","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ImmunologicalFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ImmunologicalFindings","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservOrganWeights","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservOrganWeights"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservOrganWeights","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservGrpathol","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservGrpathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservGrpathol","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservNeuropathol","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservNeuropathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservNeuropathol","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservHistopathol","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservHistopathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservHistopathol","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservHistopatholNeoplastic","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservHistopatholNeoplastic"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.ObservHistopatholNeoplastic","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityOtherEffects","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.OtherEffects"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.OtherEffects","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservEstrousParent","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.ReproductiveFunctionPerformanceP0.ObservEstrousParent"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.ReproductiveFunctionPerformanceP0.ObservEstrousParent","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservSpermParent","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.ReproductiveFunctionPerformanceP0.ObservSpermParent"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.ReproductiveFunctionPerformanceP0.ObservSpermParent","params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.GeneralToxicityP0.DescriptionIncidenceAndSeverityObservReproPerformParent","params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.ReproductiveFunctionPerformanceP0.ObservReproPerformParent"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.ReproductiveFunctionPerformanceP0.ObservReproPerformParent","params":{"before":"Signs","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.EffectLevelsP0.Efflevel"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminationsParentalGeneration.TargetSystemOrganToxicityP0.TargetSystemOrganToxicity"},


	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1"},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservClinSigns"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservClinSigns","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservClinSigns","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservDermalIrritationIfDermalStudy"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservDermalIrritationIfDermalStudy","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservDermalIrritationIfDermalStudy","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservMortality"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservMortality","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceMortality","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservBodyweight"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservBodyweight","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservBodyweight","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservFoodConsum"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservFoodConsum","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservFoodConsum","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservFoodEfficiency"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservFoodEfficiency","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservFoodEfficiency","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservWaterConsum"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservWaterConsum","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservWaterConsum","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservOphthalm"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservOphthalm","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservOphthalm","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservHaematol"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservHaematol","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservHaematol","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservClinChem"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservClinChem","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservClinChem","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.EndocrineFindings"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.EndocrineFindings","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityEndocrine","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservUrin"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservUrin","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservUrin","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservNeurobehaviour"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservNeurobehaviour","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservNeurobehaviour","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ImmunologicalFindings"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ImmunologicalFindings","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityImmunologicalFindings","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservOrganWeights"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservOrganWeights","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservOrganWeights","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservGrpathol"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservGrpathol","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservGrpathol","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservNeuropathol"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservNeuropathol","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservNeuropathol","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservHistopathol"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservHistopathol","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservHistopathol","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservHistopatholNeoplastic"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.ObservHistopatholNeoplastic","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityObservHistopatholNeoplastic","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.OtherEffects"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.OtherEffects","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityOtherEffects","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.ReproductiveFunctionPerformanceP1.ReproductiveFunctionEstrousCycle"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.ReproductiveFunctionPerformanceP1.ReproductiveFunctionEstrousCycle","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.ReproductiveFunctionPerformanceP1.DescriptionIncidenceAndSeverityReproductiveFunctionEstrousCycle","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.ReproductiveFunctionPerformanceP1.ReproductiveFunctionSpermMeasures"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.ReproductiveFunctionPerformanceP1.ReproductiveFunctionSpermMeasures","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityOtherEffects","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.ReproductiveFunctionPerformanceP1.ReproductivePerformance"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.ReproductiveFunctionPerformanceP1.ReproductivePerformance","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.GeneralToxicityP1.DescriptionIncidenceAndSeverityOtherEffects","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.EffectLevelsP1.Efflevel"},
	{"field":"ResultsAndDiscussion.ResultsP1SecondParentalGeneration.TargetSystemOrganToxicityP1.TargetSystemOrganToxicity"},


	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1"},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservClinOffspring"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservClinOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservClinOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DermalIrritationOffspringIfDermalStudy"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DermalIrritationOffspringIfDermalStudy","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityDermalIrritationOffspringIfDermalStudy","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservViabilityOffspring"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservViabilityOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservViabilityOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservBodyweightOffspring"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservBodyweightOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservBodyweightOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservFoodConsumOffspring"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservFoodConsumOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservFoodConsumOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservFoodEfficiencyOffspring"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservFoodEfficiencyOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservFoodEfficiencyOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservWaterConsumOffspring"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservWaterConsumOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservWaterConsumOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservOphthalmOffspring"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservOphthalmOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservOphthalmOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservHaematolOffspring"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservHaematolOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservHaematolOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservClinChemOffspring"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservClinChemOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservClinChemOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservUrinOffspring"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservUrinOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservUrinOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservMaturationOffspring"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservMaturationOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservMaturationOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.AnogenitalDistance"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.AnogenitalDistance","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityAnogenitalDistance","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.NippleRetentionInMalePups"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.NippleRetentionInMalePups","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityNippleRetentionInMalePups","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservOrganWeightsOffspring"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservOrganWeightsOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservOrganWeightsOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservGrpatholOffspring"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservGrpatholOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservGrpatholOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservHistopathol"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.ObservHistopathol","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityObservHistopatholOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.OtherEffects"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.OtherEffects","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.GeneralToxicityF1.DescriptionIncidenceAndSeverityOtherEffectsOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.DevelopmentalNeurotoxicityF1.BehaviourFunctionalFindings"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.DevelopmentalNeurotoxicityF1.BehaviourFunctionalFindings","params":{"before":"Signs","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.DevelopmentalImmunotoxicityF1.DevelopmentalImmunotoxicity"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.DevelopmentalImmunotoxicityF1.DevelopmentalImmunotoxicity","params":{"before":"Signs","after":""}},

	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.EffectLevelsF1.Efflevel"},
	{"field":"ResultsAndDiscussion.ResultsOfExaminationsOffspring.TargetSystemOrganToxicityF1.TargetSystemOrganToxicity"},


	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2"},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservClinOffspring"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservClinOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservClinOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DermalIrritationOffspringIfDermalStudy"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DermalIrritationOffspringIfDermalStudy","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityDermalIrritationOffspringIfDermalStudy","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservViabilityOffspring"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservViabilityOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservViabilityOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservBodyweightOffspring"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservBodyweightOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservBodyweightOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservFoodConsumOffspring"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservFoodConsumOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservFoodConsumOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservFoodEfficiencyOffspring"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservFoodEfficiencyOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservFoodEfficiencyOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservWaterConsumOffspring"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservWaterConsumOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservWaterConsumOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservOphthalmOffspring"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservOphthalmOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservOphthalmOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservHaematolOffspring"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservHaematolOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservHaematolOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservClinChemOffspring"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservClinChemOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservClinChemOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservUrinOffspring"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservUrinOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservUrinOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservMaturationOffspring"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservMaturationOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservMaturationOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.AnogenitalDistance"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.AnogenitalDistance","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityAnogenitalDistance","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.NippleRetentionInMalePups"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.NippleRetentionInMalePups","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityNippleRetentionInMalePups","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservOrganWeightsOffspring"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservOrganWeightsOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservOrganWeightsOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservGrpatholOffspring"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservGrpatholOffspring","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservGrpatholOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservHistopathol"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.ObservHistopathol","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityObservHistopatholOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.OtherEffects"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.OtherEffects","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityOtherEffectsOffspring","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.DevelopmentalNeurotoxicityF2.BehaviourFunctionalFindings"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.DevelopmentalNeurotoxicityF2.BehaviourFunctionalFindings","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityBehaviourFunctionalFindings","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.DevelopmentalImmunotoxicityF2.DevelopmentalImmunotoxicity"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.DevelopmentalImmunotoxicityF2.DevelopmentalImmunotoxicity","params":{"before":"Signs","after":""}},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.GeneralToxicityF2.DescriptionIncidenceAndSeverityDevelopmentalImmunotoxicity","params":{"before":"Description","after":""}},

	{"field":"ResultsAndDiscussion.ResultsF2Generation.EffectLevelsF2.Efflevel"},
	{"field":"ResultsAndDiscussion.ResultsF2Generation.TargetSystemOrganToxicityF2.TargetSystemOrganToxicity"},
	{"field":"ResultsAndDiscussion.ReproductiveToxicity.ReproductiveToxicity"}

	]
}}}/>


<#assign table_66 = {
	"title":"Summary table of human data on STOT RE",
	"columnWidths":[30,30,25,15],
"columns": columnSet3,
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.DirectObservationsClinicalCases": {
			"Observations": [
				{"field":"ResultsAndDiscussion.ClinicalSigns"},
				{"field":"ResultsAndDiscussion.RsExaminations"},
				{"field":"ResultsAndDiscussion.EffectivityMedicalTreatment"},
				{"field":"ResultsAndDiscussion.Outcome"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.Subjects"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.RouteOfExposure"},
				{"field":"MaterialsAndMethods.Method.ReasonOfExposure"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
},
"ENDPOINT_STUDY_RECORD.EpidemiologicalData": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"},
				{"field":"ResultsAndDiscussion.ConfoundingFactors"},
				{"field":"ResultsAndDiscussion.EffectLevels"},
				<#--  {"field":"ResultsAndDiscussion.EffectLevels.Efflevel"},  -->
				{"field":"ResultsAndDiscussion.TargetSystemOrganToxicity"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
},
"ENDPOINT_STUDY_RECORD.ExposureRelatedObservationsOther": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of data/report, substance exposed to etc.": [
				{"field":"MaterialsAndMethods.TypeOfStudyInformation"}] + reliability + method + testMaterial
},
"ENDPOINT_STUDY_RECORD.HealthSurveillanceData": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"}
			],
			"Type of data/report, substance exposed to etc.": studyMethod + reliability + testMaterial
}}}/>


<#assign table_67 = {
	"title":"Summary table of other studies relevant for STOT RE",
"columns": columnSet4,
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.Carcinogenicity": {
			"Observations": [
	{"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinSigns"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinSigns", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservClinSigns", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservDermalIrritationIfDermalStudy"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservDermalIrritationIfDermalStudy", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservDermalIrritationIfDermalStudy", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservMortality"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservMortality", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceMortality", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservBodyweight"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservBodyweight", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservBodyweight", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodConsum"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodConsum", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservFoodConsum", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodEfficiency"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodEfficiency", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservFoodEfficiency", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservWaterConsum"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservWaterConsum", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservWaterConsum", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOphthalm"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOphthalm", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservOphthalm", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHaematol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHaematol", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservHaematol", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinChem"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinChem", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservClinChem", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineFindings", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityEndocrine", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservUrin"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservUrin", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservUrin", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeurobehaviour"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeurobehaviour", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservNeurobehaviour", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ImmunologicalFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ImmunologicalFindings", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityImmunologicalFindings", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOrganWeights"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOrganWeights", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservOrganWeights", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservGrpathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservGrpathol", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservGrpathol", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeuropathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeuropathol", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservNeuropathol", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopathol", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservHistopathol", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopatholNeoplastic"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopatholNeoplastic", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservHistopatholNeoplastic", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OtherEffects"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OtherEffects", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityOtherEffects", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.RelevanceOfCarcinogenicEffectsPotential "},

    {"field":"ResultsAndDiscussion.EffectLevels"},
    {"field":"ResultsAndDiscussion.EffectLevels.Efflevel"},

    {"field":"ResultsAndDiscussion.TargetSystemOrganToxicity"}

],
			"References": reference,
			"Relevant information about the study (as applicable)": species + [
				{"field":"MaterialsAndMethods.AdministrationExposure.DosesConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.HighDoseLevelUsed"},
				{"field":"MaterialsAndMethods.AdministrationExposure.RouteOfAdministration"},
				{"field":"MaterialsAndMethods.AdministrationExposure.TypeOfInhalationExposureIfApplicable"},
				{"field":"MaterialsAndMethods.AdministrationExposure.Vehicle"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfTreatmentExposure"},
				{"field":"MaterialsAndMethods.AdministrationExposure.FrequencyOfTreatment"},
				{"field":"MaterialsAndMethods.AdministrationExposure.PostExposurePeriod"}
			],
			"Type of study/data, test substance": [
				{"field":"AdministrativeData.Endpoint"}] + reliability + method + testMaterial
},
"ENDPOINT_STUDY_RECORD.RepeatedDoseToxicityDermal": {
			"Observations": [

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinSigns"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinSigns", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservClinSigns", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservDermalIrritation"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservDermalIrritation", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservDermalIrritation", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservMortality"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservMortality", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceMortality", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservBodyweight"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservBodyweight", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservBodyweight", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodConsum"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodConsum", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservFoodConsum", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodEfficiency"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodEfficiency", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservFoodEfficiency", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservWaterConsum"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservWaterConsum", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservWaterConsum", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOphthalm"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOphthalm", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservOphthalm", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHaematol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHaematol", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservHaematol", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinChem"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinChem", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservClinChem", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineFindings", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityEndocrine", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservUrin"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservUrin", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservUrin", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeurobehaviour"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeurobehaviour", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservNeurobehaviour", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ImmunologicalFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ImmunologicalFindings", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityImmunologicalFindings", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOrganWeights"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOrganWeights", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservOrganWeights", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservGrpathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservGrpathol", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservGrpathol", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeuropathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeuropathol", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservNeuropathol", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopathol", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservHistopathol", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopatholNeoplastic"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopatholNeoplastic", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservHistopatholNeoplastic", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OtherEffects"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OtherEffects", "params":{"before":"Signs", "after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityOtherEffects", "params":{"before":"Description", "after":""}},

    {"field":"ResultsAndDiscussion.EffectLevels"},
    {"field":"ResultsAndDiscussion.EffectLevels.Efflevel"},
    {"field":"ResultsAndDiscussion.TargetSystemOrganToxicity.TargetSystemOrganToxicity"}

	],
			"References": reference,
			"Relevant information about the study (as applicable)": species + [
				{"field":"MaterialsAndMethods.AdministrationExposure.DosesConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.HighDoseLevelUsed"},
				{"field":"MaterialsAndMethods.AdministrationExposure.RouteOfAdministration"},
				{"field":"MaterialsAndMethods.AdministrationExposure.TypeOfCoverage"},
				{"field":"MaterialsAndMethods.AdministrationExposure.Vehicle"},
				{"field":"MaterialsAndMethods.AdministrationExposure.AnalyticalVerificationOfDosesOrConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfTreatmentExposure"},
				{"field":"MaterialsAndMethods.AdministrationExposure.FrequencyOfTreatment"}
			],
			"Type of study/data, test substance": limitMethod + reliability + testMaterial
},
"ENDPOINT_STUDY_RECORD.RepeatedDoseToxicityInhalation": {
			"Observations": [

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinSigns"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinSigns", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservClinSigns", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservDermalIrritation"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservDermalIrritation", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservDermalIrritation", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservMortality"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservMortality", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceMortality", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservBodyweight"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservBodyweight", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservBodyweight", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodConsum"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodConsum", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservFoodConsum", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodEfficiency"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodEfficiency", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservFoodEfficiency", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservWaterConsum"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservWaterConsum", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservWaterConsum", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOphthalm"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOphthalm", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservOphthalm", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHaematol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHaematol", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservHaematol", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinChem"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinChem", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservClinChem", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineFindings", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityEndocrine", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservUrin"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservUrin", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservUrin", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeurobehaviour"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeurobehaviour", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservNeurobehaviour", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ImmunologicalFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ImmunologicalFindings", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityImmunologicalFindings", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOrganWeights"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOrganWeights", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservOrganWeights", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservGrpathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservGrpathol", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservGrpathol", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeuropathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeuropathol", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservNeuropathol", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopathol", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservHistopathol", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopatholNeoplastic"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopatholNeoplastic", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservHistopatholNeoplastic", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OtherEffects"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OtherEffects", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityOtherEffects", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.EffectLevels"},
    {"field":"ResultsAndDiscussion.EffectLevels.Efflevel"},
    {"field":"ResultsAndDiscussion.TargetSystemOrganToxicity.TargetSystemOrganToxicity"}
	],

			"References": reference,
			"Relevant information about the study (as applicable)": species + [
				{"field":"MaterialsAndMethods.AdministrationExposure.DosesConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.HighDoseLevelUsed"},
				{"field":"MaterialsAndMethods.AdministrationExposure.RouteOfAdministration"},
				{"field":"MaterialsAndMethods.AdministrationExposure.TypeOfInhalationExposureIfApplicable"},
				{"field":"MaterialsAndMethods.AdministrationExposure.Vehicle"},
				{"field":"MaterialsAndMethods.AdministrationExposure.AnalyticalVerificationOfDosesOrConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfTreatmentExposure"},
				{"field":"MaterialsAndMethods.AdministrationExposure.FrequencyOfTreatment"}
			],
			"Type of study/data, test substance": limitMethod + reliability + testMaterial
},
"ENDPOINT_STUDY_RECORD.RepeatedDoseToxicityOral": {
			"Observations": [

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinSigns"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinSigns", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservClinSigns", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservDermalIrritation"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservDermalIrritation", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservDermalIrritation", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservMortality"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservMortality", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceMortality", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservBodyweight"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservBodyweight", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservBodyweight", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodConsum"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodConsum", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservFoodConsum", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodEfficiency"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodEfficiency", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservFoodEfficiency", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservWaterConsum"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservWaterConsum", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservWaterConsum", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOphthalm"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOphthalm", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservOphthalm", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHaematol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHaematol", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservHaematol", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinChem"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinChem", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservClinChem", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineFindings", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityEndocrine", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservUrin"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservUrin", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservUrin", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeurobehaviour"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeurobehaviour", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservNeurobehaviour", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ImmunologicalFindings"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ImmunologicalFindings", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityImmunologicalFindings", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOrganWeights"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOrganWeights", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservOrganWeights", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservGrpathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservGrpathol", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservGrpathol", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeuropathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservNeuropathol", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservNeuropathol", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopathol"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopathol", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservHistopathol", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopatholNeoplastic"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopatholNeoplastic", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservHistopatholNeoplastic", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OtherEffects"},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.OtherEffects", "params":{"before":"Signs","after":""}},
    {"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityOtherEffects", "params":{"before":"Description","after":""}},

    {"field":"ResultsAndDiscussion.EffectLevels"},
    {"field":"ResultsAndDiscussion.EffectLevels.Efflevel"},
    {"field":"ResultsAndDiscussion.TargetSystemOrganToxicity.TargetSystemOrganToxicity"}

			],
			"References": reference,
			"Relevant information about the study (as applicable)": species + [
				{"field":"MaterialsAndMethods.AdministrationExposure.DosesConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.HighDoseLevelUsed"},
				{"field":"MaterialsAndMethods.AdministrationExposure.RouteOfAdministration"},
				{"field":"MaterialsAndMethods.AdministrationExposure.Vehicle"},
				{"field":"MaterialsAndMethods.AdministrationExposure.AnalyticalVerificationOfDosesOrConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfTreatmentExposure"},
				{"field":"MaterialsAndMethods.AdministrationExposure.FrequencyOfTreatment"}
			],
			"Type of study/data, test substance": limitMethod + reliability + testMaterial
},
"ENDPOINT_STUDY_RECORD.ToxicityReproductionOther": {
			"Observations": [
				{"field":"ResultsAndDiscussion.EffectLevels"},
				{"field":"ResultsAndDiscussion.EffectLevels.Efflevel"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": species + [
				{"field":"MaterialsAndMethods.AdministrationExposure.DosesConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.HighDoseLevelUsed"},
				{"field":"MaterialsAndMethods.AdministrationExposure.AnalyticalVerificationOfDosesOrConcentrations"},
				{"field":"MaterialsAndMethods.AdministrationExposure.RouteOfAdministration"},
				{"field":"MaterialsAndMethods.AdministrationExposure.TypeOfInhalationExposureIfApplicable"},
				{"field":"MaterialsAndMethods.AdministrationExposure.Vehicle"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfTreatmentExposure"},
				{"field":"MaterialsAndMethods.AdministrationExposure.FrequencyOfTreatment"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfTest"}
			],
			"Type of study/data, test substance": reliability + method + testMaterial
}}}/>


<#assign table_69 = {
	"title":"Summary table of evidence for aspiration hazard",
"columns": columnSet4,
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.DirectObservationsClinicalCases": {
			"Observations": [
				{"field":"ResultsAndDiscussion.ClinicalSigns"},
				{"field":"ResultsAndDiscussion.RsExaminations"},
				{"field":"ResultsAndDiscussion.EffectivityMedicalTreatment"},
				{"field":"ResultsAndDiscussion.Outcome"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.Subjects"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.RouteOfExposure"},
				{"field":"MaterialsAndMethods.Method.ReasonOfExposure"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"},
				{"field":"MaterialsAndMethods.Method.DetailsOnExposure"}
			],
			"Type of study/data, test substance": studyMethod + reliability + testMaterial
},
"ENDPOINT_STUDY_RECORD.EpidemiologicalData": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"},
				{"field":"ResultsAndDiscussion.ConfoundingFactors"},
				{"field":"ResultsAndDiscussion.EffectLevels"},
				<#--  {"field":"ResultsAndDiscussion.EffectLevels.Efflevel"},  -->
				{"field":"ResultsAndDiscussion.TargetSystemOrganToxicity"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of study/data, test substance": studyMethod + reliability + testMaterial
},
"ENDPOINT_STUDY_RECORD.ExposureRelatedObservationsOther": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.EthicalApproval"},
				{"field":"MaterialsAndMethods.Method.ExposureAssessment"}
			],
			"Type of study/data, test substance": studyMethod + reliability + testMaterial
},
"ENDPOINT_STUDY_RECORD.HealthSurveillanceData": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Results"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.Method.TypeOfPopulation"},
				{"field":"MaterialsAndMethods.Method.EthicalApproval"}
			],
			"Type of study/data, test substance": studyMethod + reliability + testMaterial
},
"ENDPOINT_STUDY_RECORD.Viscosity": {
			"Observations": [
				{"field":"ResultsAndDiscussion.Viscosity"}
			],
			"References": reference,
			"Relevant information about the study (as applicable)": [
				{"field":"MaterialsAndMethods.MethodType"}
			],
			"Type of study/data, test substance": studyMethod + reliability + testMaterial
}}}/>


<#assign table_76 = {
	"title":"Summary of relevant information on rapid degradability",
"columns": ["Method, Study type",
"Test material, Purity",
"Results",
"Remarks, Reliability",
"References"
],
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.BiodegradationInSoil": {
			"Method, Study type": method + [				
				{"field":"MaterialsAndMethods.StudyDesign.OxygenConditions"},
				{"field":"MaterialsAndMethods.StudyDesign.ContinuousDarkness"},
				{"field":"MaterialsAndMethods.StudyDesign.SoilClassification"},
				{"field":"MaterialsAndMethods.StudyDesign.SoilProperties"},
				{"field":"MaterialsAndMethods.StudyDesign.DurationOfTestContactTime"},
				{"field":"MaterialsAndMethods.StudyDesign.ParameterFollowed"}
			],
			"Test material, Purity": testMaterialWithComposition,
			"References": reference,
			"Remarks, Reliability": reliability,
			"Results": [
				{"field":"ResultsAndDiscussion.DTParentCompound"},
				{"field":"ResultsAndDiscussion.Degradation"},
				{"field":"ResultsAndDiscussion.MaterialMassBalance"},
				{"field":"ResultsAndDiscussion.EvaporationOfParentCompound"},
				{"field":"ResultsAndDiscussion.MineralizationRateInCO2"},
				{"field":"ResultsAndDiscussion.TransformationProducts"},
				{"field":"ResultsAndDiscussion.TransformationProductsDetails"},
				{"field":"ResultsAndDiscussion.VolatileMetabolites"},
				{"field":"ResultsAndDiscussion.Residues"}
			]
},
"ENDPOINT_STUDY_RECORD.BiodegradationInWaterAndSedimentSimulationTests": {
			"Method, Study type": [
				{"field":"MaterialsAndMethods.Guideline"},
				{"field":"MaterialsAndMethods.MethodNoGuideline"},
				{"field":"MaterialsAndMethods.GLPComplianceStatement", "params":{"before":"GLP compliance: ", "after":""}}<#--,
				{"field":"MaterialsAndMethods.StudyDesign.OxygenConditions"},
				{"field":"MaterialsAndMethods.StudyDesign.InoculumOrTestSystem"},
				{"field":"MaterialsAndMethods.StudyDesign.DurationOfTestContactTime"},
				{"field":"MaterialsAndMethods.StudyDesign.InitialTestSubstanceConcentration"},
				{"field":"MaterialsAndMethods.StudyDesign.ParameterFollowedForBiodegradationEstimation"}-->
			],
			"Test material, Purity": testMaterialWithComposition,
			"References": reference,
			"Remarks, Reliability": reliability,
			"Results": [
				{"field":"ResultsAndDiscussion.DTParentCompound"},
				{"field":"ResultsAndDiscussion.Degradation"},
				{"field":"ResultsAndDiscussion.MaterialMassBalance"},
				{"field":"ResultsAndDiscussion.EvaporationOfParentCompound"},
				{"field":"ResultsAndDiscussion.MineralizationRateInCO2"},
				{"field":"ResultsAndDiscussion.TransformationProducts"},
				{"field":"ResultsAndDiscussion.TransformationProductsDetails"},
				{"field":"ResultsAndDiscussion.VolatileMetabolites"},
				{"field":"ResultsAndDiscussion.Residues"}
			]
},
"ENDPOINT_STUDY_RECORD.BiodegradationInWaterScreeningTests": {
			"Method, Study type": endpointMethod + [
				{"field":"MaterialsAndMethods.StudyDesign.OxygenConditions"},
				{"field":"MaterialsAndMethods.StudyDesign.InoculumOrTestSystem"},
				{"field":"MaterialsAndMethods.StudyDesign.DurationOfTestContactTime"},
				{"field":"MaterialsAndMethods.StudyDesign.InitialTestSubstanceConcentration"},
				{"field":"MaterialsAndMethods.StudyDesign.ParameterFollowedForBiodegradationEstimation"}
			],
			"Test material, Purity": testMaterialWithComposition,
			"References": reference,
			"Remarks, Reliability": reliability,
			"Results": [
				{"field":"ResultsAndDiscussion.Degradation"},
				{"field":"ResultsAndDiscussion.Bod5CodResults.Bod5Cod"}
			]
},
"ENDPOINT_STUDY_RECORD.FieldStudies": {
			"Method, Study type": method + [				{"field":"MaterialsAndMethods.TypeOfMeasurement"}
			],
			"Test material, Purity": testMaterialWithComposition,
			"References": reference,
			"Remarks, Reliability": reliability,
			"Results": [
				{"field":"ResultsAndDiscussion.HalfLifeOfParentCompound50DisappearanceTimeDT50"},
				{"field":"ResultsAndDiscussion.TransformationProductsDetails"}
			]
},
"ENDPOINT_STUDY_RECORD.Hydrolysis": {
			"Method, Study type": method + [
				{"field":"MaterialsAndMethods.StudyDesign.DurationOfTest"},
				{"field":"MaterialsAndMethods.StudyDesign.AnalyticalMonitoring"},
				{"field":"MaterialsAndMethods.StudyDesign.EstimationMethodIfUsed"}
			],
			"Test material, Purity": testMaterialWithComposition,
			"References": reference,
			"Remarks, Reliability": reliability,
			"Results": [
				{"field":"ResultsAndDiscussion.DTParentCompound"},
				{"field":"ResultsAndDiscussion.MaterialMassBalance"},
				{"field":"ResultsAndDiscussion.IdentityTransformation"}
			]
},
"ENDPOINT_STUDY_RECORD.ModeOfDegradationInActualUse": {
			"Method, Study type": method + [
				{"field":"MaterialsAndMethods.TypeOfStudyInformation"}
			],
			"Test material, Purity": testMaterialWithComposition,
			"References": reference,
			"Remarks, Reliability": reliability,
			"Results": [
				{"field":"ResultsAndDiscussion.AnyOtherInformationOnResultsInclTables.OtherInformation"}
			]
},
"ENDPOINT_STUDY_RECORD.MonitoringData": {
			"Method, Study type": method + [
				{"field":"MaterialsAndMethods.TypeOfMeasurement"}
			],
			"Test material, Purity": testMaterialWithComposition,
			"References": reference,
			"Remarks, Reliability": reliability,
			"Results": [
				{"field":"ResultsAndDiscussion.Concentration"}
			]
},
"ENDPOINT_STUDY_RECORD.PhotoTransformationInSoil": {
			"Method, Study type": method + [
				{"field":"MaterialsAndMethods.StudyDesign.LightSource"},
				{"field":"MaterialsAndMethods.StudyDesign.LightSpectrumWavelengthInNm"},
				{"field":"MaterialsAndMethods.StudyDesign.RelativeLightIntensity"},
				{"field":"MaterialsAndMethods.StudyDesign.DurationOfTestAtGivenTestCondition"},
				{"field":"MaterialsAndMethods.StudyDesign.ComputationalMethods"}
			],
			"Test material, Purity": testMaterialWithComposition,
			"References": reference,
			"Remarks, Reliability": reliability,
			"Results": [
				{"field":"ResultsAndDiscussion.SpectrumOfSubstance"},
				{"field":"ResultsAndDiscussion.DTParentCompound"},
				{"field":"ResultsAndDiscussion.Degradation"},
				{"field":"ResultsAndDiscussion.MaterialMassBalance"},
				{"field":"ResultsAndDiscussion.QuantumYield"},
				{"field":"ResultsAndDiscussion.TransformationProducts"},
				{"field":"ResultsAndDiscussion.IdentityTransformation"}
			]
},
"ENDPOINT_STUDY_RECORD.Phototransformation": {
			"Method, Study type": method + [
				{"field":"MaterialsAndMethods.StudyType"},
				{"field":"MaterialsAndMethods.StudyDesign.ComputationalMethods"},
				{"field":"MaterialsAndMethods.StudyDesign.LightSource"},
				{"field":"MaterialsAndMethods.StudyDesign.LightSpectrumWavelengthInNm"},
				{"field":"MaterialsAndMethods.StudyDesign.RelativeLightIntensity"},
				{"field":"MaterialsAndMethods.StudyDesign.DurationOfTestAtGivenTestCondition"},
				{"field":"MaterialsAndMethods.StudyDesign.SensitiserForIndirectPhotolysis"}
			],
			"Test material, Purity": testMaterialWithComposition,
			"References": reference,
			"Remarks, Reliability": reliability,
			"Results": [
				{"field":"ResultsAndDiscussion.SpectrumOfSubstance"},
				{"field":"ResultsAndDiscussion.DTParentCompound"},
				{"field":"ResultsAndDiscussion.Degradation"},
				{"field":"ResultsAndDiscussion.MaterialMassBalance"},
				{"field":"ResultsAndDiscussion.QuantumYield"},
				{"field":"ResultsAndDiscussion.RateConstant"},
				{"field":"ResultsAndDiscussion.TransformationProducts"},
				{"field":"ResultsAndDiscussion.IdentityTransformation"}
			]
},
"ENDPOINT_STUDY_RECORD.PhototransformationInAir": {
			"Method, Study type": method + [
				{"field":"MaterialsAndMethods.StudyDesign.EstimationMethodIfUsed"},
				{"field":"MaterialsAndMethods.StudyDesign.LightSource"},
				{"field":"MaterialsAndMethods.StudyDesign.LightSpectrumWavelengthInNm"},
				{"field":"MaterialsAndMethods.StudyDesign.RelativeLightIntensity"},
				{"field":"MaterialsAndMethods.StudyDesign.DurationOfTestAtGivenTestCondition"}
			],
			"Test material, Purity": testMaterialWithComposition,
			"References": reference,
			"Remarks, Reliability": reliability,
			"Results": [
				{"field":"ResultsAndDiscussion.SpectrumOfSubstance"},
				{"field":"ResultsAndDiscussion.DissipationParentCompound"},
				{"field":"ResultsAndDiscussion.Degradation"},
				{"field":"ResultsAndDiscussion.DegradationRateConstant"},
				{"field":"ResultsAndDiscussion.QuantumYield"},
				{"field":"ResultsAndDiscussion.TransformationProducts"},
				{"field":"ResultsAndDiscussion.IdentityTransformation"}
			]
}}}/>


<#assign table_77 = {
	"title":"Summary of relevant information on rapid environmental transformation",
"columns": ["Method, study type",
"Test material, purity",
"Results",
"Remarks, reliability",
"References"
],
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.AdditionalInformationOnEnvironmentalFateAndBehaviour": {
			"Method, study type": method,
			"Test material, purity": testMaterialWithComposition,
			"References": reference,
			"Remarks, reliability": reliability,
			"Results": [
				{"field":"ResultsAndDiscussion.AnyOtherInformationOnResultsInclTables.OtherInformation"}
			]
},
"ENDPOINT_STUDY_RECORD.AdsorptionDesorption": {
			"Method, study type": method,
			"Test material, purity": testMaterialWithComposition,
			"References": reference,
			"Remarks, reliability": reliability,
			"Results": [
				{"field":"ResultsAndDiscussion.AdsorptionCoefficient"},
				{"field":"ResultsAndDiscussion.AdsorptionOther0.SampleNo"},
				{"field":"ResultsAndDiscussion.AdsorptionOther"},
				{"field":"ResultsAndDiscussion.ResultsBatchEquilibriumOrOtherMethod.MassBalanceAtEndOfAdsorptionPhase"},
				{"field":"ResultsAndDiscussion.ResultsBatchEquilibriumOrOtherMethod.MassBalanceAtEndOfDesorptionPhase"},
				{"field":"ResultsAndDiscussion.ResultsBatchEquilibriumOrOtherMethod.TransformationProducts"},
				{"field":"ResultsAndDiscussion.ResultsBatchEquilibriumOrOtherMethod.IdentityTransformation"}
			]
},
"ENDPOINT_STUDY_RECORD.DistributionModelling": {
			"Method, study type": method + [
				{"field":"MaterialsAndMethods.Model"},
				{"field":"MaterialsAndMethods.Year"},
				{"field":"MaterialsAndMethods.Media"}
			],
			"Test material, purity": testMaterialWithComposition,
			"References": reference,
			"Remarks, reliability": reliability,
			"Results": [
				{"field":"ResultsAndDiscussion.PercentDistributionInMedia.AirPercentage"},
				{"field":"ResultsAndDiscussion.PercentDistributionInMedia.WaterPercentage"},
				{"field":"ResultsAndDiscussion.PercentDistributionInMedia.SoilPercentage"},
				{"field":"ResultsAndDiscussion.PercentDistributionInMedia.SedimentPercentage"},
				{"field":"ResultsAndDiscussion.PercentDistributionInMedia.SuspSedimentPercentage"},
				{"field":"ResultsAndDiscussion.PercentDistributionInMedia.AerosolPercentage"},
				{"field":"ResultsAndDiscussion.PercentDistributionInMedia.BiotaPercentage"},
				{"field":"ResultsAndDiscussion.PercentDistributionInMedia.OtherDistributionResults"}
			]
},
"ENDPOINT_STUDY_RECORD.HenrysLawConstant": {
			"Method, study type": method,
			"Test material, purity": testMaterialWithComposition,
			"References": reference,
			"Remarks, reliability": reliability,
			"Results": [
				{"field":"ResultsAndDiscussion.HenrysLawConstantH"}
			]
},
"ENDPOINT_STUDY_RECORD.OtherDistributionData": {
			"Method, study type": method,
			"Test material, purity": testMaterialWithComposition,
			"References": reference,
			"Remarks, reliability": reliability,
			"Results": [
				{"field":"ResultsAndDiscussion.AnyOtherInformationOnResultsInclTables.OtherInformation"}
			]
},
"ENDPOINT_STUDY_RECORD.WaterSolubility": {
			"Method, study type": method + [
				{"field":"MaterialsAndMethods.MethodType"}
			],
			"Test material, purity": testMaterialWithComposition,
			"References": reference,
			"Remarks, reliability": reliability,
			"Results": [
				{"field":"ResultsAndDiscussion.WaterSolubility"},
				{"field":"WaterSolubility.ResultsAndDiscussion.WaterSolubility"},
				{"field":"ResultsAndDiscussion.SolubilityOfMetalIonsInAqueousMedia"}
			]
}}}/>


<#assign table_78 = {
	"title":"Summary of relevant information on bioaccumulation",
"columns": ["Method, study type",
"Test material, purity",
"Results",
"Remarks, reliability",
"References"],
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.BioaccumulationAquaticSediment": {
			"Method, study type": method + [
				{"field":"MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies"},
				{"field":"MaterialsAndMethods.StudyDesign.RouteOfExposure"},
				{"field":"MaterialsAndMethods.StudyDesign.WaterMediaType"},
				{"field":"MaterialsAndMethods.StudyDesign.TestType"},
				{"field":"MaterialsAndMethods.StudyDesign.TotalExposureUptakeDuration"},
				{"field":"MaterialsAndMethods.StudyDesign.TotalDepurationDuration"},
				{"field":"MaterialsAndMethods.TestConditions.DetailsOnEstimationOfBioconcentration"}
			],
			"Test material, purity": testMaterialWithComposition,
			"References": reference,
			"Remarks, reliability": reliability,
			"Results": [
				{"field":"ResultsAndDiscussion.LipidContent"},
				{"field":"ResultsAndDiscussion.BioaccumulationFactor"},
				{"field":"ResultsAndDiscussion.Depuration"},
				{"field":"ResultsAndDiscussion.RateConstants"},
				{"field":"ResultsAndDiscussion.MetabolitesDetails"},
				{"field":"ResultsAndDiscussion.IdentityOfMetabolites"}
			]
},
"ENDPOINT_STUDY_RECORD.BioaccumulationTerrestrial": {
			"Method, study type": method + [
				{"field":"MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies"},
				{"field":"MaterialsAndMethods.StudyDesign.TotalExposureUptakeDuration"},
				{"field":"MaterialsAndMethods.StudyDesign.TotalDepurationDuration"}
			],
			"Test material, purity": testMaterialWithComposition,
			"References": reference,
			"Remarks, reliability": reliability,
			"Results": [
				{"field":"ResultsAndDiscussion.LipidContent"},
				{"field":"ResultsAndDiscussion.BioaccumulationFactor"},
				{"field":"ResultsAndDiscussion.Depuration"},
				{"field":"ResultsAndDiscussion.MetabolitesDetails"},
				{"field":"ResultsAndDiscussion.IdentityOfMetabolites"}
			]
}}}/>


<#assign table_79 = {
	"title":"Summary of relevant information on acute aquatic toxicity",
"columns": ["Method, study type",
"Test material, purity",
"Results",
"Remarks, reliability",
"References"],
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.ShortTermToxicityToAquaInv": {
			"Method, study type": method + [
				{"field":"MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies"},
				{"field":"MaterialsAndMethods.StudyDesign.TestType"},
				{"field":"MaterialsAndMethods.StudyDesign.WaterMediaType"}
			],
			"Test material, purity": testMaterialWithComposition,
			"References": reference,
			"Remarks, reliability": [
				{"field":"ApplicantSummaryAndConclusion.ValidityCriteria"}] + reliability,
			"Results": [
				{"field":"ResultsAndDiscussion.EffectConcentrations"}
			]
},
"ENDPOINT_STUDY_RECORD.ShortTermToxicityToFish": {
			"Method, study type": method + [
				{"field":"MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies"},
				{"field":"MaterialsAndMethods.StudyDesign.TestType"},
				{"field":"MaterialsAndMethods.StudyDesign.WaterMediaType"}
			],
			"Test material, purity": testMaterialWithComposition,
			"References": reference,
			"Remarks, reliability": [
				{"field":"ApplicantSummaryAndConclusion.ValidityCriteria"}] + reliability,
			"Results": [
				{"field":"ResultsAndDiscussion.EffectConcentrations"}
			]
},
"ENDPOINT_STUDY_RECORD.ToxicityToAquaticAlgae": {
			"Method, study type": method + [
				{"field":"MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies"},
				{"field":"MaterialsAndMethods.StudyDesign.TestType"},
				{"field":"MaterialsAndMethods.StudyDesign.WaterMediaType"}
			],
			"Test material, purity": testMaterialWithComposition,
			"References": reference,
			"Remarks, reliability": [
				{"field":"ApplicantSummaryAndConclusion.ValidityCriteria"}] + reliability,
			"Results": [
				{"field":"ResultsAndDiscussion.EffectConcentrations"}
			]
},
"ENDPOINT_STUDY_RECORD.ToxicityToAquaticPlant": {
			"Method, study type": method + [
				{"field":"MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies"},
				{"field":"MaterialsAndMethods.StudyDesign.TestType"},
				{"field":"MaterialsAndMethods.StudyDesign.WaterMediaType"}
			],
			"Test material, purity": testMaterialWithComposition,
			"References": reference,
			"Remarks, reliability": [
				{"field":"ApplicantSummaryAndConclusion.ValidityCriteria"}] + reliability,
			"Results": [
				{"field":"ResultsAndDiscussion.EffectConcentrations"}
			]
},
"ENDPOINT_STUDY_RECORD.ToxicityToOtherAqua": {
			"Method, study type": method + [
				{"field":"MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies"},
				{"field":"MaterialsAndMethods.StudyDesign.TestType"},
				{"field":"MaterialsAndMethods.StudyDesign.WaterMediaType"}
			],
			"Test material, purity": testMaterialWithComposition,
			"References": reference,
			"Remarks, reliability": [
				{"field":"ApplicantSummaryAndConclusion.ValidityCriteria"}] + reliability,
			"Results": [
				{"field":"ResultsAndDiscussion.EffectConcentrations"}
			]
}}}/>


<#assign table_80 = {
	"title":"Summary of relevant information on chronic aquatic toxicity",
"columns": ["Method, Study type",
"Test material, Purity",
"Results",
"Remarks, Reliability",
"References"],
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.LongTermToxToFish": {
			"Method, Study type": method + [
				{"field":"MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies"},
				{"field":"MaterialsAndMethods.StudyDesign.TestType"},
				{"field":"MaterialsAndMethods.StudyDesign.WaterMediaType"}
			],
			"Test material, Purity": testMaterialWithComposition,
			"References": reference,
			"Remarks, Reliability": [
				{"field":"ApplicantSummaryAndConclusion.ValidityCriteria"}] + reliability,
			"Results": [
				{"field":"ResultsAndDiscussion.EffectConcentrations"}
			]
},
"ENDPOINT_STUDY_RECORD.LongTermToxicityToAquaInv": {
			"Method, Study type": method + [
				{"field":"MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies"},
				{"field":"MaterialsAndMethods.StudyDesign.TestType"},
				{"field":"MaterialsAndMethods.StudyDesign.WaterMediaType"}
			],
			"Test material, Purity": testMaterialWithComposition,
			"References": reference,
			"Remarks, Reliability": [
				{"field":"ApplicantSummaryAndConclusion.ValidityCriteria"}] + reliability,
			"Results": [
				{"field":"ResultsAndDiscussion.EffectConcentrations"}
			]
},
"ENDPOINT_STUDY_RECORD.ToxicityToAquaticAlgae": {
			"Method, Study type": method + [
				{"field":"MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies"},
				{"field":"MaterialsAndMethods.StudyDesign.TestType"},
				{"field":"MaterialsAndMethods.StudyDesign.WaterMediaType"}
			],
			"Test material, Purity": testMaterialWithComposition,
			"References": reference,
			"Remarks, Reliability": [
				{"field":"ApplicantSummaryAndConclusion.ValidityCriteria"}] + reliability,
			"Results": [
				{"field":"ResultsAndDiscussion.EffectConcentrations"}
			]
},
"ENDPOINT_STUDY_RECORD.ToxicityToAquaticPlant": {
			"Method, Study type": method + [
				{"field":"MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies"},
				{"field":"MaterialsAndMethods.StudyDesign.TestType"},
				{"field":"MaterialsAndMethods.StudyDesign.WaterMediaType"}
			],
			"Test material, Purity": testMaterialWithComposition,
			"References": reference,
			"Remarks, Reliability": [
				{"field":"ApplicantSummaryAndConclusion.ValidityCriteria"}] + reliability,
			"Results": [
				{"field":"ResultsAndDiscussion.EffectConcentrations"}
			]
},
"ENDPOINT_STUDY_RECORD.ToxicityToOtherAqua": {
			"Method, Study type": method + [
				{"field":"MaterialsAndMethods.TestOrganisms.AquaticVertebrateTypeOtherThanFish"},
				{"field":"MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies"},
				{"field":"MaterialsAndMethods.StudyDesign.TestType"},
				{"field":"MaterialsAndMethods.StudyDesign.WaterMediaType"}
			],
			"Test material, Purity": testMaterialWithComposition,
			"References": reference,
			"Remarks, Reliability": [
				{"field":"ApplicantSummaryAndConclusion.ValidityCriteria"}] + reliability,
			"Results": [
				{"field":"ResultsAndDiscussion.EffectConcentrations"}
			]
}}}/>

<#-- newly generated tables start for ED HH -->

<#assign combinedList_table_70 = method + [
  {"field":"MaterialsAndMethods.MethodNoGuideline"},
  {"field":"MaterialsAndMethods.GLPComplianceStatement"},
  {"field":"REFERENCE_SUBSTANCE.Inventory.InventoryEntry"},
  {"field":"MaterialsAndMethods.StudyDesign.TestType"},
  {"field":"MaterialsAndMethods.StudyDesign.WaterMediaType"},
  {"field":"MaterialsAndMethods.LimitTest"},
  {"field":"MaterialsAndMethods.TestOrganisms.DetailsOnTestOrganisms"},
  {"field":"MaterialsAndMethods.SamplingAndAnalysis.AnalyticalMonitoring"},
  {"field":"MaterialsAndMethods.StudyDesign.TotalExposureDuration"},
  {"field":"MaterialsAndMethods.StudyDesign.PostExposureObservationPeriod"},
  {"field":"MaterialsAndMethods.TestAnimals.Sex"},
  {"field":"MaterialsAndMethods.TestOrganisms.AquaticVertebrateType"},
  {"field":"MaterialsAndMethods.TestAnimals.Species"},
  {"field":"MaterialsAndMethods.TestMaterials.TestMaterialInformation"},
  {"field":"MaterialsAndMethods.TestMaterials.AdditionalTestMaterialInformation"},
  {"field":"MaterialsAndMethods.TestSolutions.Vehicle"}
] + reliability />

<#assign base_table_70 = {
	"title":"Evidence for adversity",
"columnWidths":[20,20,20,20,10,10],
"columns": ["Method, guideline, deviations if any<br/>Species, strain, sex, no/group, cell line when applicable (NAMs)<br/>Test substance, dose/concentration levels, vehicle if relevant, duration and lifestage of exposure<br/>(e.g., gestational, postnatal, adult or multigenerational), Reliability",
"Endocrine modality (E, A, S, T, other, please also separate if sensitive to but not diagnostic of EATS)<br/>Target of investigation",
"Effect levels and magnitude (excessive: yes or no) of general systemic (parental) toxicity",
"Results (positive and negative findings from each study)",
"Observations / interpretation / weight of the data",
"Reference"],
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.EndocrineDisrupterMammalianScreening": {
"Method, guideline, deviations if any<br/>Species, strain, sex, no/group, cell line when applicable (NAMs)<br/>Test substance, dose/concentration levels, vehicle if relevant, duration and lifestage of exposure<br/>(e.g., gestational, postnatal, adult or multigenerational), Reliability":
combinedList_table_70,
"Endocrine modality (E, A, S, T, other, please also separate if sensitive to but not diagnostic of EATS)<br/>Target of investigation": [
{"field":"ResultsAndDiscussion.ParametersAffected"},
{"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineFindings"},
{"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityEndocrine"}
],
"Effect levels and magnitude (excessive: yes or no) of general systemic (parental) toxicity": [
{"field":"ResultsAndDiscussion.EffectLevels"},
{"field":"ResultsAndDiscussion.EffectLevels.Efflevel"}
],
"Results (positive and negative findings from each study)": [
{"field":"ResultsAndDiscussion.EndocrineDisruptingPotential"},
{"field":"ResultsAndDiscussion.ResultsOfExaminations.DetailsOnResults"}
],
"Observations / interpretation / weight of the data": [

{"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinSigns"},
{"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinSigns", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservClinSigns", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservMortality"},
{"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservMortality", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceMortality", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservBodyweight"},
{"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservBodyweight", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservBodyweight", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodConsum"},
{"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservFoodConsum", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservFoodConsum", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservWaterConsum"},
{"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservWaterConsum", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservWaterConsum", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinChem"},
{"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservClinChem", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservClinChem", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineFindings"},
{"field":"ResultsAndDiscussion.ResultsOfExaminations.EndocrineFindings", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityEndocrine", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOrganWeights"},
{"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservOrganWeights", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservOrganWeights", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservGrpathol"},
{"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservGrpathol", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservGrpathol", "params":{"before":"Description","after":""}},

{"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopathol"},
{"field":"ResultsAndDiscussion.ResultsOfExaminations.ObservHistopathol", "params":{"before":"Signs","after":""}},
{"field":"ResultsAndDiscussion.ResultsOfExaminations.DescriptionIncidenceAndSeverityObservHistopathol", "params":{"before":"Description","after":""}}

],
"Reference": reference
}}}/>

<#assign table_70 = base_table_70 + {"title": "Evidence for adversity"}/>
<#assign table_73 = base_table_70 + {"title": "Evidence for endocrine activity in vivo "}/>

<#assign table_71 = {
	"title":"Evidence for endocrine activity in silico",
"columnWidths":[25,25,20,20,10],
"columns": ["Model and version of the QSAR, applicability domain, reliability",
"Endocrine modality (target of the investigation)",
"Observations / interpretation / weight of the data",
"Results (positive/negative findings from each study)"
"Reference"],
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.EndocrineDisrupterScreeningInVitro": {
"Model and version of the QSAR, applicability domain, reliability": reliability + [
{"field":"MaterialsAndMethods.ModelAndSoftware.ModelNameAndVersion"},
{"field":"MaterialsAndMethods.ModelAndSoftware.SoftwareNameAndVersion"},
{"field":"ResultsAndDiscussion.AdditionalInformationAboutApplicabilityDomainAndReliabilityOfQSARPredictions.FitWithTheApplicabilityDomain"},
{"field":"ResultsAndDiscussion.AdditionalInformationAboutApplicabilityDomainAndReliabilityOfQSARPredictions.JustificationForTheFitWithTheApplicabilityDomain"},
{"field":"ResultsAndDiscussion.AdditionalInformationAboutApplicabilityDomainAndReliabilityOfQSARPredictions.ConclusionsOnApplicabilityDomainAndReliability"},
{"field":"ResultsAndDiscussion.AdditionalInformationAboutApplicabilityDomainAndReliabilityOfQSARPredictions.Uncertainty"},
{"field":"MaterialsAndMethods.GLPComplianceStatement"}
],
"Endocrine modality (target of the investigation)": [ 
{"field":"MaterialsAndMethods.TestSystem.TestSystemDetails"}
],
"Observations / interpretation / weight of the data": [
{"field":"ResultsAndDiscussion.TestResults.TestResults"}
],
"Results (positive/negative findings from each study)": [
{"field":"MaterialsAndMethods.TestDesign.TestDesign.ControlAndReferenceItems.ControlsReferenceSubstances"},
{"field":"MaterialsAndMethods.TestDesign.ControlAndReferenceItems.ControlsReferenceSubstances"}
],
"Reference": reference
}}}/>

<#--  <#assign table_71 = {
	"title":"Evidence for endocrine activity in silico",
"columns": ["Model and version of the QSAR, applicability domain",
"Reference",
"Reliability",
"Results (positive/negative findings from each study)"],
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.EndocrineDisrupterScreeningInVitro": {
"Model and version of the QSAR, applicability domain": [
{"field":"MaterialsAndMethods.ModelAndSoftware.ModelNameAndVersion"},
{"field":"MaterialsAndMethods.ModelAndSoftware.SoftwareNameAndVersion"},
{"field":"ResultsAndDiscussion.AdditionalInformationAboutApplicabilityDomainAndReliabilityOfQSARPredictions.FitWithTheApplicabilityDomain"},
{"field":"ResultsAndDiscussion.AdditionalInformationAboutApplicabilityDomainAndReliabilityOfQSARPredictions.JustificationForTheFitWithTheApplicabilityDomain"},
{"field":"ResultsAndDiscussion.AdditionalInformationAboutApplicabilityDomainAndReliabilityOfQSARPredictions.ConclusionsOnApplicabilityDomainAndReliability"},
{"field":"ResultsAndDiscussion.AdditionalInformationAboutApplicabilityDomainAndReliabilityOfQSARPredictions.Uncertainty"},
{"field":"MaterialsAndMethods.GLPComplianceStatement"}
],
"Reference": [
{"field":"LITERATURE.GeneralInfo.Author"},
{"field":"LITERATURE.GeneralInfo.ReferenceYear"}
],
"Reliability": [
{"field":"AdministrativeData.Reliability"},
{"field":"AdministrativeData.PurposeFlag"}
],
"Results (positive/negative findings from each study)": [
{"field":"ResultsAndDiscussion.ResultsOfExaminations.DetailsOnResults"}
]
}}}/>  -->

<#assign table_72 = {
"title":"Evidence for endocrine activity in vitro",

"columns": ["Method, guideline, deviations if any <br/> 
Species/receptor origin or assay, cell line type, positive and negative controls used <br/>
Test substance, concentration / concentration range, vehicle used, duration of exposure <br/>
Reliability",
"Endocrine modality (target of the investigation)",
"Results (positive/negative findings from each study)",
"Observations / interpretation / weight of the data",
"Reference"],
"docDefIds":{
	"ENDPOINT_STUDY_RECORD.EndocrineDisrupterScreeningInVitro": {
"Method, guideline, deviations if any <br/> 
Species/receptor origin or assay, cell line type, positive and negative controls used <br/>
Test substance, concentration / concentration range, vehicle used, duration of exposure <br/>
Reliability": endpointMethod + reliability + species + testMaterial + [
{"field":"MaterialsAndMethods.TypeOfStudy"},
{"field":"MaterialsAndMethods.GLPComplianceStatement"},
{"field":"MaterialsAndMethods.OtherQualityFollowed"},
{"field":"MaterialsAndMethods.TestSystem.TestSystemType"},
{"field":"MaterialsAndMethods.TestSystem.TestSystemIdentity"},
{"field":"MaterialsAndMethods.TestDesign"}
],
"Endocrine modality (target of the investigation)": [ 
{"field":"MaterialsAndMethods.ResultsAndDiscussion.ParametersAffected"},
{"field":"MaterialsAndMethods.TestSystem.TestSystemDetails"}
],
"Results (positive/negative findings from each study)": [
{"field":"MaterialsAndMethods.TestDesign.TestDesign.ControlAndReferenceItems.ControlsReferenceSubstances"},
{"field":"MaterialsAndMethods.TestDesign.ControlAndReferenceItems.ControlsReferenceSubstances"}
],
"Observations / interpretation / weight of the data": [
{"field":"ResultsAndDiscussion.TestResults.TestResults"}
],
"Reference": reference
}}}/>

<#--  <#assign table_72 = {
	"title":"Evidence for endocrine activity in vitro",
"columns": ["Cell line type",
"Conc. or conc. Range",
"Deviations if any",
"Guideline",
"Method",
"Observations/ interpretation / weight of the data",
"Positive and negative controls used",
"Reference",
"Reliability",
"Results (positive/negative findings from each study)",
"Species/receptor origin or assay",
"Test substance"],
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.EndocrineDisrupterScreeningInVitro": {
"Cell line type": [
{"field":"MaterialsAndMethods.TestSystem.TestSystemIdentity"}
],
"Conc. or conc. Range": [
{"field":"ResultsAndDiscussion.TestResults.TestResults"},
{"field":"MaterialsAndMethods.TestDesign.TestMaterialPreparation.Vehicle"},
{"field":"MaterialsAndMethods.TestDesign.TestMaterialPreparation.DilutionStepsDoseIntervals"}
],
"Deviations if any": [
{"field":"MaterialsAndMethods.MethodNoGuideline"}
],
"Guideline": [
{"field":"MaterialsAndMethods.Guideline"}
],
"Method": [
{"field":"MaterialsAndMethods.TypeOfStudy"},
{"field":"MaterialsAndMethods.TestSystem.TestSystemType"},
{"field":"MaterialsAndMethods.TestDesign.ExperimentalConditions.AdditionalAnalysis"},
{"field":"MaterialsAndMethods.GLPComplianceStatement"},
{"field":"MaterialsAndMethods.OtherQualityFollowed"}
],
"Observations/ interpretation / weight of the data": [
{"field":"ResultsAndDiscussion.TestResults.TestResults"}
],
"Positive and negative controls used": [
{"field":"MaterialsAndMethods.TestDesign.TestDesign.ControlAndReferenceItems.ControlsReferenceSubstances"},
{"field":"MaterialsAndMethods.TestDesign.ControlAndReferenceItems.ControlsReferenceSubstances"}
],
"Reference": [
{"field":"LITERATURE.GeneralInfo.Author"},
{"field":"LITERATURE.GeneralInfo.ReferenceYear"}
],
"Reliability": [
{"field":"AdministrativeData.Reliability"},
{"field":"AdministrativeData.PurposeFlag"}
],
"Results (positive/negative findings from each study)": [
{"field":"ResultsAndDiscussion.TestResults.TestResults"}
],
"Species/receptor origin or assay": [
{"field":"MaterialsAndMethods.TestSystem.TestSystemDetails"}
],
"Test substance": [
{"field":"MaterialsAndMethods.TestMaterials.TestMaterialInformation"},
{"field":"MaterialsAndMethods.TestMaterials.AdditionalTestMaterialInformation"},
{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"},
{"field":"REFERENCE_SUBSTANCE.Inventory.InventoryEntry"}
]
}}}/>  -->

<#-- env. endocrine disruption -->

<#assign combinedList_table_81 = method + [
  {"field":"MaterialsAndMethods.MethodNoGuideline"},
  {"field":"MaterialsAndMethods.GLPComplianceStatement"},
  {"field":"REFERENCE_SUBSTANCE.Inventory.InventoryEntry"},
  {"field":"MaterialsAndMethods.StudyDesign.TestType"},
  {"field":"MaterialsAndMethods.StudyDesign.WaterMediaType"},
  {"field":"MaterialsAndMethods.AdministrationExposure.HighDoseLevelUsed"},
  {"field":"MaterialsAndMethods.AdministrationExposure.JustificationForDeviationFromTheHighDoseLevel"},
  {"field":"MaterialsAndMethods.TestOrganisms.DetailsOnTestOrganisms"},
  {"field":"MaterialsAndMethods.SamplingAndAnalysis.AnalyticalMonitoring"},
  {"field":"MaterialsAndMethods.StudyDesign.TotalExposureDuration"},
  {"field":"MaterialsAndMethods.StudyDesign.PostExposureObservationPeriod"},
  {"field":"MaterialsAndMethods.TestAnimals.Sex"},
  {"field":"MaterialsAndMethods.TestOrganisms.AquaticVertebrateType"},
  {"field":"MaterialsAndMethods.TestAnimals.Species"},
  {"field":"MaterialsAndMethods.TestMaterials.TestMaterialInformation"},
  {"field":"MaterialsAndMethods.TestMaterials.AdditionalTestMaterialInformation"},
  {"field":"MaterialsAndMethods.TestSolutions.Vehicle"}
] + reliability />

<#assign base_table_81 = {
"columnWidths":[20,20,20,20,10,10],
"columns": ["Method, guideline, deviations if any<br/>Species, strain, sex, no/group, cell line when applicable (NAMs)<br/>Test substance, dose/concentration levels, vehicle if relevant, duration and lifestage of exposure<br/>(e.g., embryo, larval, juvenile, adult or multigenerational), Reliability",
"Endocrine modality (E, A, S, T, other, please also separate if sensitive to but not diagnostic of EATS)<br/>Target of investigation",
"Effect levels and magnitude (excessive: yes or no) of general systemic (parental) toxicity",
"Results (positive and negative findings from each study)",
"Observations / interpretation / weight of the data",
"Reference"],
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.EndocrineDisrupterTestingInAqua": {
"Method, guideline, deviations if any<br/>Species, strain, sex, no/group, cell line when applicable (NAMs)<br/>Test substance, dose/concentration levels, vehicle if relevant, duration and lifestage of exposure<br/>(e.g., embryo, larval, juvenile, adult or multigenerational), Reliability":
combinedList_table_81,
"Endocrine modality (E, A, S, T, other, please also separate if sensitive to but not diagnostic of EATS)<br/>Target of investigation": [
{"field":"ResultsAndDiscussion.DetailedResults.DoseResponse.BasisForEffect"},
{"field":"MaterialsAndMethods.TestConditions.DetailsOnTestConditions"}
],
"Effect levels and magnitude (excessive: yes or no) of general systemic (parental) toxicity": [
{"field":"ResultsAndDiscussion.EffectConcentrations"}
],
"Results (positive and negative findings from each study)": [
{"field":"MaterialsAndMethods.TestConditions.ReferenceSubstancePositiveControl"},
{"field":"ResultsAndDiscussion.ResultsRefSubstance"},
{"field":"ResultsAndDiscussion.DetailedResults.DoseResponse"}
],
"Observations / interpretation / weight of the data": [
{"field":"ResultsAndDiscussion.ResultsDetails"}
],
"Reference": reference
}}}/>

<#assign table_81 = base_table_81 + {"title": "Evidence for adversity"}/>
<#assign table_84 = base_table_81 + {"title": "Evidence for endocrine activity in vivo "}/>

<#--  <#assign table_73 = {
	"title":"Evidence for endocrine activity in vivo",
"columns": ["Deviations if any",
"Dose/concentration levels",
"Duration ",
"Effect levels and magnitude (excessive: yes or no) of general systemic (parental) toxicity",
"Guideline",
"Method, guideline, deviations if any, species, sex, no/group, vehicle if relevant, and reliability",
"No/group",
"Reference (if the study is already reported under another section, please refer to the relevant table/text here)",
"Reliability",
"Results (positive and negative findings from each study)",
"Sex",
"Species",
"Test substance",
"Vehicle if relevant",
"lifestage of exposure (e.g., embryo, larval, juvenile, adult or multigenerational)"],
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.EndocrineDisrupterTestingInAqua": {
"Deviations if any": [
{"field":"MaterialsAndMethods.MethodNoGuideline"}
],
"Dose/concentration levels": [
{"field":"MaterialsAndMethods.SamplingAndAnalysis.AnalyticalMonitoring"}
],
"Duration ": [
{"field":"MaterialsAndMethods.StudyDesign.TotalExposureDuration"},
{"field":"MaterialsAndMethods.StudyDesign.PostExposureObservationPeriod"}
],
"Effect levels and magnitude (excessive: yes or no) of general systemic (parental) toxicity": [
{"field":"ResultsAndDiscussion.EffectConcentrations"}
],
"Guideline": [
{"field":"MaterialsAndMethods.Guideline"}
],
"Method, guideline, deviations if any, species, sex, no/group, vehicle if relevant, and reliability": [
{"field":"MaterialsAndMethods.StudyDesign.TestType"},
{"field":"MaterialsAndMethods.StudyDesign.WaterMediaType"},
{"field":"MaterialsAndMethods.LimitTest"},
{"field":"MaterialsAndMethods.GLPComplianceStatement"}
],
"No/group": [
{"field":"MaterialsAndMethods.TestOrganisms.DetailsOnTestOrganisms"}
],
"Reference (if the study is already reported under another section, please refer to the relevant table/text here)": [
{"field":"LITERATURE.GeneralInfo.Author"},
{"field":"LITERATURE.GeneralInfo.ReferenceYear"}
],
"Reliability": [
{"field":"AdministrativeData.Reliability"},
{"field":"AdministrativeData.PurposeFlag"}
],
"Results (positive and negative findings from each study)": [
{"field":"ResultsAndDiscussion.ResultsDetails"}
],
"Sex": [
{"field":"MaterialsAndMethods.TestAnimals.Sex"}
],
"Species": [
{"field":"MaterialsAndMethods.TestOrganisms.AquaticVertebrateType"},
{"field":"MaterialsAndMethods.TestAnimals.Species"}
],
"Test substance": [
{"field":"MaterialsAndMethods.TestMaterials.TestMaterialInformation"},
{"field":"MaterialsAndMethods.TestMaterials.AdditionalTestMaterialInformation"},
{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"},
{"field":"REFERENCE_SUBSTANCE.Inventory.InventoryEntry"}
],
"Vehicle if relevant": [
{"field":"MaterialsAndMethods.TestSolutions.Vehicle"}
],
"lifestage of exposure (e.g., embryo, larval, juvenile, adult or multigenerational)": [
{"field":"MaterialsAndMethods.TestOrganisms.DetailsOnTestOrganisms"}
]
}}}/>  -->

<#-- newly generated tables end -->


<#assign table_87 = {
	"title":"Summary of relevant information on persistence under CLP Annex I, 4.3",
"columns": ["Method",
"Purity",
"References",
"Reliability",
"Remarks",
"Results",
"Study type",
"Test material"],
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.BiodegradationInSoil": {
			"Method": method,
			"Purity": [
				{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"}
			],
			"References": reference,
			"Reliability": reliability,
			"Remarks": [
				{"field":"ResultsAndDiscussion.DTParentCompound"},
				{"field":"ResultsAndDiscussion.Degradation"},
				{"field":"ResultsAndDiscussion.MaterialMassBalance"}
			],
			"Results": [
				{"field":"ResultsAndDiscussion.DTParentCompound"},
				{"field":"ResultsAndDiscussion.Degradation"},
				{"field":"ResultsAndDiscussion.MaterialMassBalance"},
				{"field":"ResultsAndDiscussion.EvaporationOfParentCompound"},
				{"field":"ResultsAndDiscussion.MineralizationRateInCO2"},
				{"field":"ResultsAndDiscussion.TransformationProducts"},
				{"field":"ResultsAndDiscussion.TransformationProductsDetails"},
				{"field":"ResultsAndDiscussion.VolatileMetabolites"},
				{"field":"ResultsAndDiscussion.Residues"}
			],
			"Study type": [
				{"field":"MaterialsAndMethods.StudyDesign.OxygenConditions"},
				{"field":"MaterialsAndMethods.StudyDesign.ContinuousDarkness"},
				{"field":"MaterialsAndMethods.StudyDesign.SoilClassification"},
				{"field":"MaterialsAndMethods.StudyDesign.SoilProperties"},
				{"field":"MaterialsAndMethods.StudyDesign.DurationOfTestContactTime"},
				{"field":"MaterialsAndMethods.StudyDesign.ParameterFollowed"}
			],
			"Test material": testMaterial
},
"ENDPOINT_STUDY_RECORD.BiodegradationInWaterAndSedimentSimulationTests": {
			"Method": method,
			"Purity": [
				{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"}
			],
			"References": reference,
			"Reliability": reliability,
			"Remarks": [
				{"field":"ResultsAndDiscussion.DTParentCompound"},
				{"field":"ResultsAndDiscussion.Degradation"},
				{"field":"ResultsAndDiscussion.MaterialMassBalance"}
			],
			"Results": [
				{"field":"ResultsAndDiscussion.DTParentCompound"},
				{"field":"ResultsAndDiscussion.Degradation"},
				{"field":"ResultsAndDiscussion.MaterialMassBalance"},
				{"field":"ResultsAndDiscussion.EvaporationOfParentCompound"},
				{"field":"ResultsAndDiscussion.MineralizationRateInCO2"},
				{"field":"ResultsAndDiscussion.TransformationProducts"},
				{"field":"ResultsAndDiscussion.TransformationProductsDetails"},
				{"field":"ResultsAndDiscussion.VolatileMetabolites"},
				{"field":"ResultsAndDiscussion.Residues"}
			],
			"Study type": [
				{"field":"MaterialsAndMethods.StudyDesign.OxygenConditions"},
				{"field":"MaterialsAndMethods.StudyDesign.InoculumOrTestSystem"},
				{"field":"MaterialsAndMethods.StudyDesign.DurationOfTestContactTime"},
				{"field":"MaterialsAndMethods.StudyDesign.InitialTestSubstanceConcentration"},
				{"field":"MaterialsAndMethods.StudyDesign.ParameterFollowedForBiodegradationEstimation"}
			],
			"Test material": testMaterial
},
"ENDPOINT_STUDY_RECORD.BiodegradationInWaterScreeningTests": {
			"Method": endpointMethod,
			"Purity": [
				{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"}
			],
			"References": reference,
			"Reliability": reliability,
			"Remarks": [
				{"field":"ResultsAndDiscussion.Degradation", "macro":"remarksOnResultsList"}
			],
			"Results": [
				{"field":"ResultsAndDiscussion.Degradation"}
			],
			"Study type": [
				{"field":"MaterialsAndMethods.StudyDesign.OxygenConditions"},
				{"field":"MaterialsAndMethods.StudyDesign.InoculumOrTestSystem"},
				{"field":"MaterialsAndMethods.StudyDesign.DurationOfTestContactTime"},
				{"field":"MaterialsAndMethods.StudyDesign.InitialTestSubstanceConcentration"},
				{"field":"MaterialsAndMethods.StudyDesign.ParameterFollowedForBiodegradationEstimation"}
			],
			"Test material": testMaterial
},
"ENDPOINT_STUDY_RECORD.FieldStudies": {
			"Method": method,
			"Purity": [
				{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"}
			],
			"References": reference,
			"Reliability": reliability,
			"Remarks": [
				{"field":"ResultsAndDiscussion.HalfLifeOfParentCompound50DisappearanceTimeDT50"}
			],
			"Results": [
				{"field":"ResultsAndDiscussion.HalfLifeOfParentCompound50DisappearanceTimeDT50"},
				{"field":"ResultsAndDiscussion.TransformationProductsDetails"}
			],
			"Study type": [
				{"field":"MaterialsAndMethods.TypeOfMeasurement"}
			],
			"Test material": testMaterial
},
"ENDPOINT_STUDY_RECORD.Hydrolysis": {
			"Method": method,
			"Purity": [
				{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"}
			],
			"References": reference,
			"Reliability": reliability,
			"Remarks": [
				{"field":"ResultsAndDiscussion.DTParentCompound"},
				{"field":"ResultsAndDiscussion.MaterialMassBalance"}
			],
			"Results": [
				{"field":"ResultsAndDiscussion.DTParentCompound"},
				{"field":"ResultsAndDiscussion.MaterialMassBalance"},
				{"field":"ResultsAndDiscussion.IdentityTransformation"}
			],
			"Study type": [
				{"field":"MaterialsAndMethods.StudyDesign.DurationOfTest"},
				{"field":"MaterialsAndMethods.StudyDesign.AnalyticalMonitoring"},
				{"field":"MaterialsAndMethods.StudyDesign.EstimationMethodIfUsed"}
			],
			"Test material": testMaterial
},
"ENDPOINT_STUDY_RECORD.ModeOfDegradationInActualUse": {
			"Method": method,
			"Purity": [
				{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"}
			],
			"References": reference,
			"Reliability": reliability,
			"Results": [
				{"field":"ResultsAndDiscussion.AnyOtherInformationOnResultsInclTables.OtherInformation"}
			],
			"Study type": [
				{"field":"MaterialsAndMethods.TypeOfStudyInformation"}
			],
			"Test material": testMaterial
},
"ENDPOINT_STUDY_RECORD.MonitoringData": {
			"Method": method,
			"Purity": [
				{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"}
			],
			"References": reference,
			"Reliability": reliability,
			"Remarks": [
				{"field":"ResultsAndDiscussion.Concentration"}
			],
			"Results": [
				{"field":"ResultsAndDiscussion.Concentration"}
			],
			"Study type": [
				{"field":"MaterialsAndMethods.TypeOfMeasurement"}
			],
			"Test material": testMaterial
},
"ENDPOINT_STUDY_RECORD.PhotoTransformationInSoil": {
			"Method": method,
			"Purity": [
				{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"}
			],
			"References": reference,
			"Reliability": reliability,
			"Remarks": [
				{"field":"ResultsAndDiscussion.SpectrumOfSubstance"},
				{"field":"ResultsAndDiscussion.DTParentCompound"},
				{"field":"ResultsAndDiscussion.Degradation"},
				{"field":"ResultsAndDiscussion.MaterialMassBalance"}
			],
			"Results": [
				{"field":"ResultsAndDiscussion.SpectrumOfSubstance"},
				{"field":"ResultsAndDiscussion.DTParentCompound"},
				{"field":"ResultsAndDiscussion.Degradation"},
				{"field":"ResultsAndDiscussion.MaterialMassBalance"},
				{"field":"ResultsAndDiscussion.QuantumYield"},
				{"field":"ResultsAndDiscussion.TransformationProducts"},
				{"field":"ResultsAndDiscussion.IdentityTransformation"}
			],
			"Study type": [
				{"field":"MaterialsAndMethods.StudyDesign.LightSource"},
				{"field":"MaterialsAndMethods.StudyDesign.LightSpectrumWavelengthInNm"},
				{"field":"MaterialsAndMethods.StudyDesign.RelativeLightIntensity"},
				{"field":"MaterialsAndMethods.StudyDesign.DurationOfTestAtGivenTestCondition"}
			],
			"Test material": testMaterial
},
"ENDPOINT_STUDY_RECORD.Phototransformation": {
			"Method": method,
			"Purity": [
				{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"}
			],
			"References": reference,
			"Reliability": reliability,
			"Remarks": [
				{"field":"ResultsAndDiscussion.SpectrumOfSubstance"},
				{"field":"ResultsAndDiscussion.DTParentCompound"},
				{"field":"ResultsAndDiscussion.Degradation"},
				{"field":"ResultsAndDiscussion.MaterialMassBalance"}
			],
			"Results": [
				{"field":"ResultsAndDiscussion.SpectrumOfSubstance"},
				{"field":"ResultsAndDiscussion.DTParentCompound"},
				{"field":"ResultsAndDiscussion.Degradation"},
				{"field":"ResultsAndDiscussion.MaterialMassBalance"},
				{"field":"ResultsAndDiscussion.QuantumYield"},
				{"field":"ResultsAndDiscussion.RateConstant"},
				{"field":"ResultsAndDiscussion.TransformationProducts"},
				{"field":"ResultsAndDiscussion.IdentityTransformation"}
			],
			"Study type": [
				{"field":"MaterialsAndMethods.StudyType"},
				{"field":"MaterialsAndMethods.StudyDesign.ComputationalMethods"},
				{"field":"MaterialsAndMethods.StudyDesign.LightSource"},
				{"field":"MaterialsAndMethods.StudyDesign.LightSpectrumWavelengthInNm"},
				{"field":"MaterialsAndMethods.StudyDesign.RelativeLightIntensity"},
				{"field":"MaterialsAndMethods.StudyDesign.DurationOfTestAtGivenTestCondition"},
				{"field":"MaterialsAndMethods.StudyDesign.SensitiserForIndirectPhotolysis"}
			],
			"Test material": testMaterial
},
"ENDPOINT_STUDY_RECORD.PhototransformationInAir": {
			"Method": method,
			"Purity": [
				{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"}
			],
			"References": reference,
			"Reliability": reliability,
			"Remarks": [
				{"field":"ResultsAndDiscussion.SpectrumOfSubstance"},
				{"field":"ResultsAndDiscussion.DissipationParentCompound"},
				{"field":"ResultsAndDiscussion.Degradation"},
				{"field":"ResultsAndDiscussion.DegradationRateConstant"}
			],
			"Results": [
				{"field":"ResultsAndDiscussion.SpectrumOfSubstance"},
				{"field":"ResultsAndDiscussion.DissipationParentCompound"},
				{"field":"ResultsAndDiscussion.Degradation"},
				{"field":"ResultsAndDiscussion.DegradationRateConstant"},
				{"field":"ResultsAndDiscussion.QuantumYield"},
				{"field":"ResultsAndDiscussion.TransformationProducts"},
				{"field":"ResultsAndDiscussion.IdentityTransformation"}
			],
			"Study type": [
				{"field":"MaterialsAndMethods.StudyDesign.EstimationMethodIfUsed"},
				{"field":"MaterialsAndMethods.StudyDesign.LightSource"},
				{"field":"MaterialsAndMethods.StudyDesign.LightSpectrumWavelengthInNm"},
				{"field":"MaterialsAndMethods.StudyDesign.RelativeLightIntensity"},
				{"field":"MaterialsAndMethods.StudyDesign.DurationOfTestAtGivenTestCondition"}
			],
			"Test material": testMaterial
}}}/>


<#assign table_88 = {
	"title":"Summary of relevant information on bioaccumulation under CLP Annex I, 4.3",
"columns": ["Method",
"Purity",
"References",
"Reliability",
"Remarks",
"Results",
"Test material"],
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.AdsorptionDesorption": {
			"Method": method,
			"Purity": [
				{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"}
			],
			"References": reference,
			"Reliability": reliability,
			"Remarks": [
				{"field":"ResultsAndDiscussion.AdsorptionCoefficient"},
				{"field":"ResultsAndDiscussion.AdsorptionOther"},
				{"field":"ResultsAndDiscussion.ResultsBatchEquilibriumOrOtherMethod.MassBalanceAtEndOfAdsorptionPhase"}
			],
			"Results": [
				{"field":"ResultsAndDiscussion.AdsorptionCoefficient"},
				{"field":"ResultsAndDiscussion.AdsorptionOther0.SampleNo"},
				{"field":"ResultsAndDiscussion.AdsorptionOther"},
				{"field":"ResultsAndDiscussion.ResultsBatchEquilibriumOrOtherMethod.MassBalanceAtEndOfAdsorptionPhase"},
				{"field":"ResultsAndDiscussion.ResultsBatchEquilibriumOrOtherMethod.MassBalanceAtEndOfDesorptionPhase"},
				{"field":"ResultsAndDiscussion.ResultsBatchEquilibriumOrOtherMethod.TransformationProducts"},
				{"field":"ResultsAndDiscussion.ResultsBatchEquilibriumOrOtherMethod.IdentityTransformation"}
			],
			"Test material": testMaterial
},
"ENDPOINT_STUDY_RECORD.BasicToxicokinetics": {
			"Method": [
				{"field":"AdministrativeData.Endpoint"}] + method + species + [
				{"field":"MaterialsAndMethods.AdministrationExposure.RouteOfAdministration"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationAndFrequencyOfTreatmentExposure"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DosesConcentrations"}
			],
			"Purity": [
				{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"}
			],
			"References": reference,
			"Reliability": reliability,
			"Remarks": [
				{"field":"ResultsAndDiscussion.MetaboliteCharacterisationStudies.DistributionOfMetabolitesInMatrices"}
			],
			"Results": [
				{"field":"ResultsAndDiscussion.MainAdmeResults"},
				{"field":"ResultsAndDiscussion.PharmacokineticStudies.TransferIntoOrgans"},
				{"field":"ResultsAndDiscussion.PharmacokineticStudies.ToxicokineticParameters"},
				{"field":"ResultsAndDiscussion.MetaboliteCharacterisationStudies.DistributionOfMetabolitesInMatrices"},
				{"field":"ResultsAndDiscussion.AppendixMetabolitesAndTheirParentsInTreatmentGroups.MetabolitesInTreatmentGroups"}
			],
			"Test material": testMaterial
},
"ENDPOINT_STUDY_RECORD.BioaccumulationAquaticSediment": {
			"Method": method,
			"Purity": [
				{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"}
			],
			"References": reference,
			"Reliability": reliability,
			"Remarks": [
				{"field":"ResultsAndDiscussion.LipidContent"},
				{"field":"ResultsAndDiscussion.BioaccumulationFactor"},
				{"field":"ResultsAndDiscussion.Depuration"},
				{"field":"ResultsAndDiscussion.RateConstants"}
			],
			"Results": [
				{"field":"ResultsAndDiscussion.LipidContent"},
				{"field":"ResultsAndDiscussion.BioaccumulationFactor"},
				{"field":"ResultsAndDiscussion.Depuration"},
				{"field":"ResultsAndDiscussion.RateConstants"},
				{"field":"ResultsAndDiscussion.MetabolitesDetails"},
				{"field":"ResultsAndDiscussion.IdentityOfMetabolites"}
			],
			"Study type": [
				{"field":"MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies"},
				{"field":"MaterialsAndMethods.StudyDesign.RouteOfExposure"},
				{"field":"MaterialsAndMethods.StudyDesign.WaterMediaType"},
				{"field":"MaterialsAndMethods.StudyDesign.TestType"},
				{"field":"MaterialsAndMethods.StudyDesign.TotalExposureUptakeDuration"},
				{"field":"MaterialsAndMethods.StudyDesign.TotalDepurationDuration"}
			],
			"Test material": testMaterial
},
"ENDPOINT_STUDY_RECORD.BioaccumulationTerrestrial": {
			"Method": method,
			"Purity": [
				{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"}
			],
			"References": reference,
			"Reliability": reliability,
			"Remarks": [
				{"field":"ResultsAndDiscussion.LipidContent"},
				{"field":"ResultsAndDiscussion.BioaccumulationFactor"},
				{"field":"ResultsAndDiscussion.Depuration"}
			],
			"Results": [
				{"field":"ResultsAndDiscussion.LipidContent"},
				{"field":"ResultsAndDiscussion.BioaccumulationFactor"},
				{"field":"ResultsAndDiscussion.Depuration"},
				{"field":"ResultsAndDiscussion.MetabolitesDetails"},
				{"field":"ResultsAndDiscussion.IdentityOfMetabolites"}
			],
			"Study type": [
				{"field":"MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies"},
				{"field":"MaterialsAndMethods.StudyDesign.TotalExposureUptakeDuration"},
				{"field":"MaterialsAndMethods.StudyDesign.TotalDepurationDuration"}
			],
			"Test material": testMaterial
},
"ENDPOINT_STUDY_RECORD.DermalAbsorption": {
			"Method": endpointMethod + species + [
				{"field":"MaterialsAndMethods.AdministrationExposure.TypeOfCoverage"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DurationOfExposure"},
				{"field":"MaterialsAndMethods.AdministrationExposure.DosesConcentrations"}] + testMaterial,
			"Purity": [
				{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"}
			],
			"References": reference,
			"Reliability": reliability,
			"Remarks": [
				{"field":"ResultsAndDiscussion.Absorption"}
			],
			"Results": [
				{"field":"ResultsAndDiscussion.SignsSymptomsToxicity"},
				{"field":"ResultsAndDiscussion.DermalIrritation"},
				{"field":"ResultsAndDiscussion.AbsorptionMatrices"},
				{"field":"ResultsAndDiscussion.TotalRecovery"},
				{"field":"ResultsAndDiscussion.Absorption"},
				{"field":"ResultsAndDiscussion.Metabolites"},
				{"field":"ResultsAndDiscussion.IdentityOfMetabolites"}
			],
			"Test material": testMaterial
},
"ENDPOINT_STUDY_RECORD.HenrysLawConstant": {
			"Method": method,
			"Purity": [
				{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"}
			],
			"References": reference,
			"Reliability": reliability,
			"Remarks": [
				{"field":"ResultsAndDiscussion.HenrysLawConstantH"}
			],
			"Results": [
				{"field":"ResultsAndDiscussion.HenrysLawConstantH"}
			],
			"Test material": testMaterial
},
"ENDPOINT_STUDY_RECORD.OtherDistributionData": {
			"Method": method,
			"Purity": [
				{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"}
			],
			"References": reference,
			"Reliability": reliability,
			"Results": [
				{"field":"ResultsAndDiscussion.AnyOtherInformationOnResultsInclTables.OtherInformation"}
			],
			"Test material": testMaterial
}}}/>


<#assign table_89 = {
	"title":"Summary of relevant information on toxicity under CLP Annex I, 4.3",
"columns": ["Method",
"Purity",
"References",
"Reliability",
"Remarks",
"Results",
"Study type",
"Test material"],
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.ToxicityToBees": {
			"Method": method,
			"Purity": [
				{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"}
			],
			"References": reference,
			"Reliability": reliability,
			"Remarks": [
				{"field":"ResultsAndDiscussion.EffectConcentrations"},
				{"field":"ApplicantSummaryAndConclusion.ValidityCriteria"}
			],
			"Results": [
				{"field":"ResultsAndDiscussion.EffectConcentrations"}
			],
			"Study type": [
				{"field":"MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies"},
				{"field":"MaterialsAndMethods.TestOrganisms.AnimalGroup"},
				{"field":"MaterialsAndMethods.StudyDesign.StudyType"},
				{"field":"MaterialsAndMethods.StudyDesign.LimitTest"},
				{"field":"MaterialsAndMethods.StudyDesign.TotalExposureDuration"}
			],
			"Test material": testMaterial
},
"ENDPOINT_STUDY_RECORD.LongTermToxToFish": {
			"Method": method,
			"Purity": [
				{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"}
			],
			"References": reference,
			"Reliability": reliability,
			"Remarks": [
				{"field":"ResultsAndDiscussion.EffectConcentrations"},
				{"field":"ApplicantSummaryAndConclusion.ValidityCriteria"}
			],
			"Results": [
				{"field":"ResultsAndDiscussion.EffectConcentrations"}
			],
			"Study type": [
				{"field":"MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies"},
				{"field":"MaterialsAndMethods.StudyDesign.TestType"},
				{"field":"MaterialsAndMethods.StudyDesign.WaterMediaType"}
			],
			"Test material": testMaterial
},
"ENDPOINT_STUDY_RECORD.LongTermToxicityToAquaInv": {
			"Method": method,
			"Purity": [
				{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"}
			],
			"References": reference,
			"Reliability": reliability,
			"Remarks": [
				{"field":"ResultsAndDiscussion.EffectConcentrations"},
				{"field":"ApplicantSummaryAndConclusion.ValidityCriteria"}
			],
			"Results": [
				{"field":"ResultsAndDiscussion.EffectConcentrations"}
			],
			"Study type": [
				{"field":"MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies"},
				{"field":"MaterialsAndMethods.StudyDesign.TestType"},
				{"field":"MaterialsAndMethods.StudyDesign.WaterMediaType"}
			],
			"Test material": testMaterial
},
"ENDPOINT_STUDY_RECORD.SedimentToxicity": {
			"Method": method,
			"Purity": [
				{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"}
			],
			"References": reference,
			"Reliability": reliability,
			"Remarks": [
				{"field":"ResultsAndDiscussion.EffectConcentrations"},
				{"field":"ApplicantSummaryAndConclusion.ValidityCriteria"}
			],
			"Results": [
				{"field":"ResultsAndDiscussion.EffectConcentrations"}
			],
			"Study type": [
				{"field":"MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies"},
				{"field":"MaterialsAndMethods.StudyDesign.StudyType"},
				{"field":"MaterialsAndMethods.StudyDesign.TestType"},
				{"field":"MaterialsAndMethods.StudyDesign.WaterMediaType"},
				{"field":"MaterialsAndMethods.StudyDesign.TypeOfSediment"},
				{"field":"MaterialsAndMethods.StudyDesign.LimitTest"},
				{"field":"MaterialsAndMethods.StudyDesign.ExposureDuration"}
			],
			"Test material": testMaterial
},
"ENDPOINT_STUDY_RECORD.ShortTermToxicityToAquaInv": {
			"Method": method,
			"Purity": [
				{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"}
			],
			"References": reference,
			"Reliability": reliability,
			"Remarks": [
				{"field":"ResultsAndDiscussion.EffectConcentrations"},
				{"field":"ApplicantSummaryAndConclusion.ValidityCriteria"}
			],
			"Results": [
				{"field":"ResultsAndDiscussion.EffectConcentrations"}
			],
			"Study Type": [
				{"field":"MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies"},
				{"field":"MaterialsAndMethods.StudyDesign.TestType"},
				{"field":"MaterialsAndMethods.StudyDesign.WaterMediaType"}
			],
			"Test material": testMaterial
},
"ENDPOINT_STUDY_RECORD.ShortTermToxicityToFish": {
			"Method": method,
			"Purity": [
				{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"}
			],
			"References": reference,
			"Reliability": reliability,
			"Remarks": [
				{"field":"ResultsAndDiscussion.EffectConcentrations"},
				{"field":"ApplicantSummaryAndConclusion.ValidityCriteria"}
			],
			"Results": [
				{"field":"ResultsAndDiscussion.EffectConcentrations"}
			],
			"Study Type": [
				{"field":"MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies"},
				{"field":"MaterialsAndMethods.StudyDesign.TestType"},
				{"field":"MaterialsAndMethods.StudyDesign.WaterMediaType"}
			],
			"Test material": testMaterial
},
"ENDPOINT_STUDY_RECORD.ToxicityToAquaticAlgae": {
			"Method": method,
			"Purity": [
				{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"}
			],
			"References": reference,
			"Reliability": reliability,
			"Remarks": [
				{"field":"ResultsAndDiscussion.EffectConcentrations"},
				{"field":"ApplicantSummaryAndConclusion.ValidityCriteria"}
			],
			"Results": [
				{"field":"ResultsAndDiscussion.EffectConcentrations"}
			],
			"Study Type": [
				{"field":"MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies"},
				{"field":"MaterialsAndMethods.StudyDesign.TestType"},
				{"field":"MaterialsAndMethods.StudyDesign.WaterMediaType"}
			],
			"Study type": [
				{"field":"MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies"},
				{"field":"MaterialsAndMethods.StudyDesign.TestType"},
				{"field":"MaterialsAndMethods.StudyDesign.WaterMediaType"}
			],
			"Test material": testMaterial
},
"ENDPOINT_STUDY_RECORD.ToxicityToAquaticPlant": {
			"Method": method + [
				{"field":" MaterialsAndMethods.MethodNoGuideline"}
			],
			"Purity": [
				{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"}
			],
			"References": reference,
			"Reliability": reliability,
			"Remarks": [
				{"field":"ResultsAndDiscussion.EffectConcentrations"},
				{"field":"ApplicantSummaryAndConclusion.ValidityCriteria"}
			],
			"Results": [
				{"field":"ResultsAndDiscussion.EffectConcentrations"}
			],
			"Study Type": [
				{"field":"MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies"},
				{"field":"MaterialsAndMethods.StudyDesign.TestType"},
				{"field":"MaterialsAndMethods.StudyDesign.WaterMediaType"}
			],
			"Study type": [
				{"field":"MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies"},
				{"field":"MaterialsAndMethods.StudyDesign.TestType"},
				{"field":"MaterialsAndMethods.StudyDesign.WaterMediaType"}
			],
			"Test material": testMaterial
},
"ENDPOINT_STUDY_RECORD.ToxicityToBirds": {
			"Method": method,
			"Purity": [
				{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"}
			],
			"References": reference,
			"Reliability": reliability,
			"Remarks": [
				{"field":"ResultsAndDiscussion.EffectConcentrations"},
				{"field":"ApplicantSummaryAndConclusion.ValidityCriteria"}
			],
			"Results": [
				{"field":"ResultsAndDiscussion.EffectConcentrations"},
				{"field":"ResultsAndDiscussion.RepellencyFactors"},
				{"field":"ResultsAndDiscussion.MortalityAndSubLethalEffects"},
				{"field":"ResultsAndDiscussion.EffectsOnReproduction"}
			],
			"Study type": [
				{"field":"MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies"},
				{"field":"MaterialsAndMethods.TestOrganisms.AnimalGroup"},
				{"field":"MaterialsAndMethods.StudyDesign.LimitTest"},
				{"field":"MaterialsAndMethods.StudyDesign.TotalExposureDuration"},
				{"field":"MaterialsAndMethods.StudyDesign.NoOfAnimalsPerSexPerDose"}
			],
			"Test material": testMaterial
},
"ENDPOINT_STUDY_RECORD.ToxicityToOtherAqua": {
			"Method": method,
			"Purity": [
				{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"}
			],
			"References": reference,
			"Reliability": reliability,
			"Remarks": [
				{"field":"ResultsAndDiscussion.EffectConcentrations"},
				{"field":"ApplicantSummaryAndConclusion.ValidityCriteria"}
			],
			"Results": [
				{"field":"ResultsAndDiscussion.EffectConcentrations"}
			],
			"Study Type": [
				{"field":"MaterialsAndMethods.TestOrganisms.AquaticVertebrateTypeOtherThanFish"},
				{"field":"MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies"},
				{"field":"MaterialsAndMethods.StudyDesign.TestType"},
				{"field":"MaterialsAndMethods.StudyDesign.WaterMediaType"}
			],
			"Study type": [
				{"field":"MaterialsAndMethods.TestOrganisms.AquaticVertebrateTypeOtherThanFish"},
				{"field":"MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies"},
				{"field":"MaterialsAndMethods.StudyDesign.TestType"},
				{"field":"MaterialsAndMethods.StudyDesign.WaterMediaType"}
			],
			"Test material": testMaterial
},
"ENDPOINT_STUDY_RECORD.ToxicityToSoilArthropods": {
			"Method": method,
			"Purity": [
				{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"}
			],
			"References": reference,
			"Reliability": reliability,
			"Remarks": [
				{"field":"ResultsAndDiscussion.EffectConcentrations"},
				{"field":"ApplicantSummaryAndConclusion.ValidityCriteria"}
			],
			"Results": [
				{"field":"ResultsAndDiscussion.EffectConcentrations"}
			],
			"Study type": [
				{"field":"MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies"},
				{"field":"MaterialsAndMethods.TestOrganisms.AnimalGroup"},
				{"field":"MaterialsAndMethods.StudyDesign.StudyType"},
				{"field":"MaterialsAndMethods.StudyDesign.LimitTest"},
				{"field":"MaterialsAndMethods.StudyDesign.TotalExposureDuration"}
			],
			"Test material": testMaterial
},
"ENDPOINT_STUDY_RECORD.ToxicityToSoilMacroorganismsExceptArthropods": {
			"Method": method,
			"Purity": [
				{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"}
			],
			"References": reference,
			"Reliability": reliability,
			"Remarks": [
				{"field":"ResultsAndDiscussion.EffectConcentrations"},
				{"field":"ApplicantSummaryAndConclusion.ValidityCriteria"}
			],
			"Results": [
				{"field":"ResultsAndDiscussion.EffectConcentrations"}
			],
			"Study type": [
				{"field":"MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies"},
				{"field":"MaterialsAndMethods.TestOrganisms.AnimalGroup"},
				{"field":"MaterialsAndMethods.StudyDesign.StudyType"},
				{"field":"MaterialsAndMethods.StudyDesign.SubstrateType"}
			],
			"Test material": testMaterial
},
"ENDPOINT_STUDY_RECORD.ToxicityToSoilMicroorganisms": {
			"Method": method,
			"Purity": [
				{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"}
			],
			"References": reference,
			"Reliability": reliability,
			"Remarks": [
				{"field":"ResultsAndDiscussion.EffectConcentrations"},
				{"field":"ApplicantSummaryAndConclusion.ValidityCriteria"}
			],
			"Results": [
				{"field":"ResultsAndDiscussion.EffectConcentrations"}
			],
			"Study type": [
				{"field":"MaterialsAndMethods.TestOrganisms.TestOrganismsInoculum"},
				{"field":"MaterialsAndMethods.StudyDesign.TotalExposureDuration"}
			],
			"Test material": testMaterial
},
"ENDPOINT_STUDY_RECORD.ToxicityToTerrestrialArthropodsOtherThanBees": {
			"Method": method,
			"Purity": [
				{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"}
			],
			"References": reference,
			"Reliability": reliability,
			"Remarks": [
				{"field":"ResultsAndDiscussion.EffectConcentrations"},
				{"field":"ApplicantSummaryAndConclusion.ValidityCriteria"}
			],
			"Results": [
				{"field":"ResultsAndDiscussion.EffectConcentrations"}
			],
			"Study type": [
				{"field":"MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies"},
				{"field":"MaterialsAndMethods.TestOrganisms.AnimalGroup"},
				{"field":"MaterialsAndMethods.StudyDesign.StudyType"},
				{"field":"MaterialsAndMethods.StudyDesign.LimitTest"},
				{"field":"MaterialsAndMethods.StudyDesign.TotalExposureDuration"}
			],
			"Test material": testMaterial
},
"ENDPOINT_STUDY_RECORD.ToxicityToTerrestrialPlants": {
			"Method": method,
			"Purity": [
				{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"}
			],
			"References": reference,
			"Reliability": reliability,
			"Remarks": [
				{"field":"ResultsAndDiscussion.EffectConcentrations"},
				{"field":"ApplicantSummaryAndConclusion.ValidityCriteria"}
			],
			"Results": [
				{"field":"ResultsAndDiscussion.EffectConcentrations"}
			],
			"Study type": [
				{"field":"MaterialsAndMethods.TestOrganisms.TestOrganisms"},
				{"field":"MaterialsAndMethods.StudyDesign.StudyType"},
				{"field":"MaterialsAndMethods.StudyDesign.TestType"},
				{"field":"MaterialsAndMethods.StudyDesign.SubstrateType"},
				{"field":"MaterialsAndMethods.StudyDesign.LimitTest"},
				{"field":"MaterialsAndMethods.StudyDesign.TotalExposureDuration"}
			],
			"Test material": testMaterial
}}}/>


<#assign table_90 = {
	"title":"Summary of relevant information on mobility under CLP Annex I 4.4",
"columns": ["Method",
"Purity",
"References",
"Reliability",
"Remarks",
"Results",
"Test material"],
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.AdsorptionDesorption": {
			"Method": method,
			"Purity": [
				{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"}
			],
			"References": reference,
			"Reliability": reliability,
			"Remarks": [
				{"field":"ResultsAndDiscussion.AdsorptionCoefficient"},
				{"field":"ResultsAndDiscussion.AdsorptionOther"},
				{"field":"ResultsAndDiscussion.ResultsBatchEquilibriumOrOtherMethod.MassBalanceAtEndOfAdsorptionPhase"}
			],
			"Results": [
				{"field":"ResultsAndDiscussion.AdsorptionCoefficient"},
				{"field":"ResultsAndDiscussion.AdsorptionOther0.SampleNo"},
				{"field":"ResultsAndDiscussion.AdsorptionOther"},
				{"field":"ResultsAndDiscussion.ResultsBatchEquilibriumOrOtherMethod.MassBalanceAtEndOfAdsorptionPhase"},
				{"field":"ResultsAndDiscussion.ResultsBatchEquilibriumOrOtherMethod.MassBalanceAtEndOfDesorptionPhase"},
				{"field":"ResultsAndDiscussion.ResultsBatchEquilibriumOrOtherMethod.TransformationProducts"},
				{"field":"ResultsAndDiscussion.ResultsBatchEquilibriumOrOtherMethod.IdentityTransformation"}
			],
			"Test material": testMaterial
},
"ENDPOINT_STUDY_RECORD.DistributionModelling": {
			"Method": method,
			"Purity": [
				{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"}
			],
			"References": reference,
			"Reliability": reliability,
			"Results": [
				{"field":"ResultsAndDiscussion.PercentDistributionInMedia.AirPercentage"},
				{"field":"ResultsAndDiscussion.PercentDistributionInMedia.WaterPercentage"},
				{"field":"ResultsAndDiscussion.PercentDistributionInMedia.SoilPercentage"},
				{"field":"ResultsAndDiscussion.PercentDistributionInMedia.SedimentPercentage"},
				{"field":"ResultsAndDiscussion.PercentDistributionInMedia.SuspSedimentPercentage"},
				{"field":"ResultsAndDiscussion.PercentDistributionInMedia.AerosolPercentage"},
				{"field":"ResultsAndDiscussion.PercentDistributionInMedia.BiotaPercentage"},
				{"field":"ResultsAndDiscussion.PercentDistributionInMedia.OtherDistributionResults"}
			],
			"Study type": [
				{"field":"MaterialsAndMethods.Model"},
				{"field":"MaterialsAndMethods.Year"},
				{"field":"MaterialsAndMethods.Media"}
			],
			"Test material": testMaterial
},
"ENDPOINT_STUDY_RECORD.FieldStudies": {
			"Method": method,
			"Purity": [
				{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"}
			],
			"References": reference,
			"Reliability": reliability,
			"Remarks": [
				{"field":"ResultsAndDiscussion.HalfLifeOfParentCompound50DisappearanceTimeDT50"}
			],
			"Results": [
				{"field":"ResultsAndDiscussion.HalfLifeOfParentCompound50DisappearanceTimeDT50"},
				{"field":"ResultsAndDiscussion.TransformationProductsDetails"}
			],
			"Study type": [
				{"field":"MaterialsAndMethods.TypeOfMeasurement"}
			],
			"Test material": testMaterial
},
"ENDPOINT_STUDY_RECORD.HenrysLawConstant": {
			"Method": method,
			"Purity": [
				{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"}
			],
			"References": reference,
			"Reliability": reliability,
			"Remarks": [
				{"field":"ResultsAndDiscussion.HenrysLawConstantH"}
			],
			"Results": [
				{"field":"ResultsAndDiscussion.HenrysLawConstantH"}
			],
			"Test material": testMaterial
},
"ENDPOINT_STUDY_RECORD.MonitoringData
": {
			"Method": method,
			"Purity": [
				{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"}
			],
			"References": reference,
			"Reliability": reliability,
			"Remarks": [
				{"field":"ResultsAndDiscussion.Concentration"}
			],
			"Results": [
				{"field":"ResultsAndDiscussion.Concentration"}
			],
			"Study type": [
				{"field":"MaterialsAndMethods.TypeOfMeasurement"}
			],
			"Test material": testMaterial
},
"ENDPOINT_STUDY_RECORD.OtherDistributionData": {
			"Method": method,
			"Purity": [
				{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"}
			],
			"References": reference,
			"Reliability": reliability,
			"Results": [
				{"field":"ResultsAndDiscussion.AnyOtherInformationOnResultsInclTables.OtherInformation"}
			],
			"Test material": testMaterial
},
"ENDPOINT_STUDY_RECORD.WaterSolubility": {
			"Method": method,
			"Purity": [
				{"field":"TEST_MATERIAL_INFORMATION.Composition.CompositionList"}
			],
			"References": reference,
			"Reliability": reliability,
			"Remarks": [
				{"field":"ResultsAndDiscussion.WaterSolubility"},
				{"field":"ResultsAndDiscussion.SolubilityOfMetalIonsInAqueousMedia"}
			],
			"Results": [
				{"field":"ResultsAndDiscussion.WaterSolubility"},
				{"field":"WaterSolubility.ResultsAndDiscussion.WaterSolubility"},
				{"field":"ResultsAndDiscussion.SolubilityOfMetalIonsInAqueousMedia"}
			],
			"Study Type": [
				{"field":"MaterialsAndMethods.MethodType"}
			],
			"Test material": testMaterial
}}}/>


<#assign table_91 = {
	"title":"Summary table of data concerning hazardous properties of the substance for the ozone layer",
"columns": ["Type of study/data",
"Test substance",
"Relevant information about the study (as applicable)",
"Observations",
"References"],
	"docDefIds":{
		"ENDPOINT_STUDY_RECORD.PhototransformationInAir": {
			"Type of study/data": method + [
				{"field":"MaterialsAndMethods.StudyDesign.EstimationMethodIfUsed"},
				{"field":"MaterialsAndMethods.StudyDesign.LightSource"},
				{"field":"MaterialsAndMethods.StudyDesign.LightSpectrumWavelengthInNm"},
				{"field":"MaterialsAndMethods.StudyDesign.RelativeLightIntensity"},
				{"field":"MaterialsAndMethods.StudyDesign.DurationOfTestAtGivenTestCondition"}
			],
			"Test substance": testMaterialWithComposition,
			"References": reference,
			"Observations": reliability,
			"Relevant information about the study (as applicable)": [
				{"field":"ResultsAndDiscussion.SpectrumOfSubstance"},
				{"field":"ResultsAndDiscussion.DissipationParentCompound"},
				{"field":"ResultsAndDiscussion.Degradation"},
				{"field":"ResultsAndDiscussion.DegradationRateConstant"}
				{"field":"ResultsAndDiscussion.QuantumYield"},
				{"field":"ResultsAndDiscussion.TransformationProducts"},
				{"field":"ResultsAndDiscussion.IdentityTransformation"}

			]
}}}/>


