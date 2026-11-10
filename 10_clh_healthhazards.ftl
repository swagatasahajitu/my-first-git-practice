<!-- Chapter 10 EVALUATION OF HEALTH HAZARDS template file -->
<#assign humanStudyDocs = ["ENDPOINT_STUDY_RECORD.HealthSurveillanceData","ENDPOINT_STUDY_RECORD.EpidemiologicalData","ENDPOINT_STUDY_RECORD.DirectObservationsClinicalCases","ENDPOINT_STUDY_RECORD.ExposureRelatedObservationsOther", "ENDPOINT_STUDY_RECORD.SensitisationData"] />

<@keyHumanHealthHazardAssessmentInformation.getSectionDocuments _subject humanStudyDocs />
<#assign humanStudyList = keyHumanHealthHazardAssessmentInformation.resultStudyList />

<!-- 10. EVALUATION OF HEALTH HAZARDS 
<div>
-->

<@subChapter
    title="Acute toxicity - oral route" 
    tables=[tableDefinition.table_25,tableDefinition.table_26,tableDefinition.table_27] 
    infoOn="acute oral toxicity"
    docDefId="ENDPOINT_SUMMARY.AcuteToxicity"
    endpointFilter=["acute toxicity: oral"]
    livestock=true
    justField=["Justification.JustifClassif"]
    hazardField="AcuteToxicityOral" />

<@subChapter
    title="Acute toxicity - dermal route" 
    tables=[tableDefinition.table_28,tableDefinition.table_29,tableDefinition.table_30] 
    infoOn="acute dermal toxicity"
    docDefId="ENDPOINT_SUMMARY.AcuteToxicity"
    endpointFilter=["acute toxicity: dermal"]
    livestock=true
    justField=["Justification.JustifClassif"]
    hazardField="AcuteToxicityDermal" />

<@subChapter
    title="Acute toxicity - inhalation route" 
    tables=[tableDefinition.table_31,tableDefinition.table_32,tableDefinition.table_33] 
    infoOn="acute inhalation toxicity"
    docDefId="ENDPOINT_SUMMARY.AcuteToxicity"
    endpointFilter=["acute toxicity: inhalation"]
    livestock=true
    justField=["Justification.JustifClassif"]
    hazardField="AcuteToxicityInhalation" />

<@subChapter 
    title="Skin corrosion/irritation" 
    tables=[tableDefinition.table_34,tableDefinition.table_35,tableDefinition.table_36] 
    infoOn="skin corrosion/irritation"
    docDefId="ENDPOINT_SUMMARY.IrritationCorrosion"
    endpointFilter=["skin irritation/ corrosion"]
    livestock=false
    justField=["JustificationForClassificationOrNonClassification.Remarks"]
    hazardField="Irritation" />

<@subChapter
    title="Serious eye damage/eye irritation" 
    tables=[tableDefinition.table_37,tableDefinition.table_38,tableDefinition.table_39] 
    infoOn="serious eye damage/eye irritation"
    docDefId="ENDPOINT_SUMMARY.IrritationCorrosion"
    endpointFilter=["eye irritation"]
    livestock=false
    justField=["JustificationForClassificationOrNonClassification.Remarks"]
    hazardField="EyeIrritation" />

<@subChapter 
    title="Respiratory sensitisation" 
    tables=[tableDefinition.table_40,tableDefinition.table_41,tableDefinition.table_42] 
    infoOn="respiratory sensitisation"
    docDefId="ENDPOINT_SUMMARY.Sensitisation"
    endpointFilter=["respiratory irritation", "respiratory sensitisation"]
    livestock=false
    justField=["JustificationForClassificationOrNonClassification.Remarks"]
    hazardField="RespiratorySensitisation" />

<@subChapter 
    title="Skin sensitisation" 
    tables=[tableDefinition.table_43,tableDefinition.table_44,tableDefinition.table_45] 
    infoOn="skin sensitisation"
    docDefId="ENDPOINT_SUMMARY.Sensitisation"
    endpointFilter=["skin irritation", "skin sensitisation"]
    livestock=false
    justField=["JustificationForClassificationOrNonClassification.Remarks"]
    hazardField="SkinSensitisation" />

<@subChapter 
    title="Germ cell mutagenicity" 
    tables=[tableDefinition.table_46,tableDefinition.table_47,tableDefinition.table_48] 
    infoOn="Germ cell mutagenicity"
    docDefId="ENDPOINT_SUMMARY.GeneticToxicity"
    endpointFilter=["genetic toxicity"]
    livestock=false
    justField=["JustificationForClassificationOrNonClassification.Remarks"]
    hazardField="GermCell.GermCell" />


<@subChapter 
    title="Carcinogenicity" 
    tables=[tableDefinition.table_49,tableDefinition.table_50,tableDefinition.table_51,tableDefinition.table_52] 
    infoOn="carcinogenicity"
    docDefId="ENDPOINT_SUMMARY.Carcinogenicity"
    endpointFilter=["carcinogenicity"]
    livestock=false
    justField=["JustificationForClassificationOrNonClassification.Remarks"]
    hazardField="Carcinogenicity.Carcinogenicity" />

<h3 class="Heading3">Reproductive toxicity</h3>
<h3 class="Heading3">Adverse effects on sexual function and fertility</h3>
<@tableSummaryComparison 
    tables=[tableDefinition.table_53, tableDefinition.table_54, tableDefinition.table_55] 
    startIndex = 2
    infoOn="adverse effects on sexual function and fertility"
    docDefId="ENDPOINT_SUMMARY.ToxicityToReproduction"
    endpointFilter=["toxicity to reproduction / fertility"]
    livestock=false
    justField=["JustificationForClassificationOrNonClassification.Remarks"] />
<h3 class="Heading3">Adverse effects on development</h3>
<@tableSummaryComparison 
    tables=[tableDefinition.table_56, tableDefinition.table_57, tableDefinition.table_58] 
    startIndex = 5
    infoOn="adverse effects on development"
    docDefId="ENDPOINT_SUMMARY.ToxicityToReproduction"
    endpointFilter=["developmental toxicity / teratogenicity"]
    livestock=false
    justField=["JustificationForClassificationOrNonClassification.Remarks"] />
<h3 class="Heading3">Adverse effects on or via lactation</h3>
<@tableSummaryComparison 
    tables=[tableDefinition.table_59, tableDefinition.table_60, tableDefinition.table_61] 
    startIndex = 8
    infoOn="effects on or via lactation"
    docDefId="ENDPOINT_SUMMARY.ToxicityToReproduction"
    endpointFilter=["developmental toxicity / teratogenicity", "toxicity to reproduction / fertility"]
    livestock=false
    justField=["JustificationForClassificationOrNonClassification.Remarks"] />

<h3 class="Heading3">Conclusion on classification and labelling for reproductive toxicity</h3>
<#assign fields=[
    "Classification.HealthHazards.ReproductiveToxicity.ReproductiveToxicity.HazardCategory",
    "Classification.HealthHazards.ReproductiveToxicity.ReproductiveToxicity.HazardStatement",
    "Classification.HealthHazards.ReproductiveToxicity.ReproductiveToxicity.ReasonForNoClassification",
    "Classification.HealthHazards.ReproductiveToxicity.ReproductiveToxicity.ReasonForClassification",
    "Classification.HealthHazards.ReproductiveToxicity.ReproductiveToxicity.SpecificEffect",
    "Classification.HealthHazards.ReproductiveToxicity.ReproductiveToxicity.RouteExposure"
] />
<@study_summary "FLEXIBLE_RECORD.Ghs" "" "" fields />

<@subChapter 
    title="Specific target organ toxicity-single exposure" 
    tables=[tableDefinition.table_62,tableDefinition.table_63,tableDefinition.table_64] 
    infoOn="specific target organ toxicity – single exposure"
    docDefId="ENDPOINT_SUMMARY.AcuteToxicity"
    endpointFilter=["acute toxicity: oral", "acute toxicity: dermal", "acute toxicity: inhalation"]
    livestock=true
    justField=["JustificationForClassificationOrNonClassification.JustifClassifAcuteTox"]
    hazardField="ToxicitySingle" />

<@subChapter 
    title="Specific target organ toxicity-repeated exposure" 
    tables=[tableDefinition.table_65,tableDefinition.table_66,tableDefinition.table_67] 
    infoOn="specific target organ toxicity – repeated exposure"
    docDefId="ENDPOINT_SUMMARY.RepeatedDoseToxicity"
    endpointFilter=["repeated dose toxicity: oral", "repeated dose toxicity: dermal", "repeated dose toxicity: inhalation", "carcinogenicity", "toxicity to reproduction / fertility"]
    livestock=false
    justField=["JustificationForClassificationOrNonClassification.Remarks"]
    hazardField="ToxicityRepeated" />

<@subChapter 
    title="Aspiration hazard" 
    tables=[tableDefinition.table_69] 
    infoOn="aspiration hazard"
    docDefId="ENDPOINT_SUMMARY.Viscosity"    
    endpointFilter=[]
    livestock=false
    justField=["KeyInformation.KeyInformation", "Discussion.Discussion"]
    hazardField="AspirationHazard" />

    <#-- endocrine starting to be added -->

    <h2 class="Heading1">Endocrine disruption for human health</h2>

    <h3 class="Heading2">Evidence on EATS and other modalities</h3> 

    <#--  <@subChapter num="11.1.1" 
    title="Summary tables of evidence for Adversity – EATS and other modalities" 
    tables=[tableDefinition.table_70]
    infoOn="evidence for adversity"
    docDefId="ENDPOINT_SUMMARY.EndocrineDisrupterMammalianScreening"
    endpointFilter=[]
    livestock=false
    justField=["KeyInformation.KeyInformation", "Discussion.Discussion"]
    hazardField="EndocDisruptHH" />  -->
    <h4 class="Heading3">Evidence on EATS and other modalities</h4> 
    <@studyandsummaryCom.standardStudyTable tableDefinition.table_70 />

    <h4 class="Heading3">Evaluation and conclusion on adverse effects</h4> 
    <@study_summary "ENDPOINT_SUMMARY.EndocrineDisrupterMammalianScreening">adverse effects</@study_summary>

    <h4 class="Heading3">Summary tables of evidence for Endocrine activity – EATS and other modalities</h4>       
    <@studyandsummaryCom.standardStudyTable tableDefinition.table_71 />
    <@studyandsummaryCom.standardStudyTable tableDefinition.table_72 />
    <@studyandsummaryCom.standardStudyTable tableDefinition.table_73 />

    <h4 class="Heading3">Evaluation and conclusion on endocrine activity </h4> 
    <@study_summary "ENDPOINT_SUMMARY.EndocrineDisrupterScreeningInVitro">adverse effects</@study_summary>
    
    <h4 class="Heading3">Comparison with the CLP criteria</h4>
    <u><b>Mammalian screening:</b></u>
    <@study_summary docDefId="ENDPOINT_SUMMARY.EndocrineDisrupterMammalianScreening" includeClassField=true/>  
    <u><b>in Vitro:</b></u>
    <@study_summary docDefId="ENDPOINT_SUMMARY.EndocrineDisrupterScreeningInVitro" includeClassField=true/>  

    <h4 class="Heading3">Conclusion on classification and labelling for endocrine disruption for human health</h4>    
    <@classificationAndLabellingGHS hazardField="EndocDisruptHH"/>

    <#--  <@subChapter num="11.1.4" 
    title="Summary tables of evidence for Endocrine activity – EATS and other modalities" 
    tables=[tableDefinition.table_71]
    infoOn="Evidence for endocrine activity in silico "
    docDefId="ENDPOINT_SUMMARY.EndocrineDisrupterScreeningInVitro"
    endpointFilter=[]
    livestock=false
    justField=["KeyInformation.KeyInformation", "Discussion.Discussion"]
    hazardField="EndocDisruptHH" />

   <@subChapter num="11.1.4" 
    title="Summary tables of evidence for Endocrine activity – EATS and other modalities" 
    tables=[tableDefinition.table_72]
    infoOn="Evidence for endocrine activity in vitro"
    docDefId="ENDPOINT_SUMMARY.EndocrineDisrupterScreeningInVitro"
    endpointFilter=[]
    livestock=false
    justField=["KeyInformation.KeyInformation", "Discussion.Discussion"]
    hazardField="EndocDisruptHH" />

    <@subChapter num="11.1.4" 
    title="Summary tables of evidence for Endocrine activity – EATS and other modalities" 
    tables=[tableDefinition.table_73]
    infoOn="Evidence for endocrine activity in vivo"
    docDefId="ENDPOINT_SUMMARY.EndocrineDisrupterMammalianScreening"
    endpointFilter=[]
    livestock=false
    justField=["KeyInformation.KeyInformation", "Discussion.Discussion"]
    hazardField="EndocDisruptHH" />  -->
    


<!--/div-->

<#macro tableSummaryComparison tables startIndex infoOn docDefId endpointFilter livestock justField>
<#-- tables is an array of objects defined in 'tableDefs.ftl' -->
<#list tables as table>
<p>
<@studyandsummaryCom.standardStudyTable table />
</p>
</#list>
<h4 class="Heading4">Short summary and overall relevance of the provided information on ${infoOn}</h4>
<#compress><#lt><@study_summary docDefId>Animal information:</@study_summary></#compress>
<#local studyList = keyHumanHealthHazardAssessmentInformation.getRelevantHumanHealthStudies(humanStudyList "" endpointFilter) />
<#if studyList??><p>
<@study_summary "ENDPOINT_SUMMARY.ExposureRelatedObservationsHumans">Human information:</@study_summary>
</p></#if>
<#if livestock><p><@study_summary "ENDPOINT_SUMMARY.ToxicEffectsLivestockPets">Livestock and pets information:</@study_summary></p></#if>
<h4 class="Heading4">Comparison with CLP criteria</h4>
<#if docDefId=="ENDPOINT_SUMMARY.Viscosity">
<@study_summary docDefId="ENDPOINT_SUMMARY.ExposureRelatedObservationsHumans" includeClassField=true/>
<#else>
<@study_summary docDefId=docDefId includeClassField=true/>
</#if>
<#--  <@study_summary docDefId "" "" justField />  -->
</#macro>

<#macro subChapter title="" tables=[] infoOn="" docDefId="" endpointFilter=[] livestock=false justField=["Justification.JustifClassif"] hazardField="" >
<#compress>
<h2 class="Heading2">${title}</h2>
<@tableSummaryComparison tables 1 infoOn docDefId endpointFilter livestock justField />
<h3 class="Heading3">Conclusion on classification and labelling for ${infoOn}</h3>
<#local fields=[
    "Classification.HealthHazards."+hazardField+".HazardCategory",
    "Classification.HealthHazards."+hazardField+".HazardStatement",
    "Classification.HealthHazards."+hazardField+".ReasonForNoClassification",
    "Classification.HealthHazards."+hazardField+".ReasonForClassification",
    "Classification.HealthHazards."+hazardField+".SpecificEffect",
    "Classification.HealthHazards."+hazardField+".Toxicity",
    "Classification.HealthHazards."+hazardField+".RouteExposure"
] />
<@study_summary "FLEXIBLE_RECORD.Ghs" "" "" fields/>
</#compress>
</#macro>

<#macro classificationAndLabellingGHS hazardField="">
<#local fields=[
    "Classification.HealthHazards."+hazardField+".HazardCategory",
    "Classification.HealthHazards."+hazardField+".HazardStatement",
    "Classification.HealthHazards."+hazardField+".ReasonForNoClassification",
    "Classification.HealthHazards."+hazardField+".ReasonForClassification"
] />
<@study_summary "FLEXIBLE_RECORD.Ghs" "" "" fields />
</#macro>