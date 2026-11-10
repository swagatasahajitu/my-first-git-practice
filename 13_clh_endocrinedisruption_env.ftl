<!-- Chapter 13 template file -->
<#assign humanStudyDocs = ["ENDPOINT_STUDY_RECORD.HealthSurveillanceData","ENDPOINT_STUDY_RECORD.EpidemiologicalData","ENDPOINT_STUDY_RECORD.DirectObservationsClinicalCases","ENDPOINT_STUDY_RECORD.ExposureRelatedObservationsOther", "ENDPOINT_STUDY_RECORD.SensitisationData"] />

<@keyHumanHealthHazardAssessmentInformation.getSectionDocuments _subject humanStudyDocs />
<#assign humanStudyList = keyHumanHealthHazardAssessmentInformation.resultStudyList />

    <h2 class="Heading2">Evidence on EATS and other modalities</h2> 

    <h3 class="Heading3">Summary tables of evidence for Adversity – EATS and other modalities</h3> 
    <@studyandsummaryCom.standardStudyTable tableDefinition.table_81 /> 

    <h3 class="Heading2">Evaluation and conclusion on adverse effects</h3>
    <@study_summary "ENDPOINT_SUMMARY.EndocrineDisrupterMammalianScreening">adverse effects</@study_summary>

    <h3 class="Heading3">Summary tables of evidence for Endocrine activity – EATS and other modalities</h3>
       
    <@studyandsummaryCom.standardStudyTable tableDefinition.table_71 />
    <@studyandsummaryCom.standardStudyTable tableDefinition.table_72 />
    <@studyandsummaryCom.standardStudyTable tableDefinition.table_84 />

    <h3 class="Heading3">Integration of evidence for Endocrine Activity and Adversity – EATS and other modalities</h3>
    <br/>
    <h2 class="Heading2">Mode of Action (MoA) analysis</h2>
    <h3 class="Heading3">Summary tables of Mode of Action analysis and biological plausibility</h3>
    <h3 class="Heading3">Assessment of possible other modes of action</h3>
    <h3 class="Heading3">Conclusion on the Mode of Action analysis and biological plausibility</h3>
    <br/>
    <h2 class="Heading2">Short summary and overall relevance of the provided information on endocrine disruption for the environment </h2> 
    <@study_summary "ENDPOINT_SUMMARY.EndocrineDisrupterScreeningInVitro">adverse effects<br/></@study_summary>
    
    <h2 class="Heading2">Comparison with the CLP criteria</h2>
    <@study_summary docDefId="ENDPOINT_SUMMARY.EndocrineDisrupterTestingInAqua" includeClassField=true/>

    <h2 class="Heading2">Conclusion on classification and labelling for endocrine disruption for the environment</h2>
    <@classificationAndLabellingGHS hazardField="EDENV"/>

<#macro classificationAndLabellingGHS hazardField="">
<#local fields=[
    "Classification.EnvironmentalHazards."+hazardField+".HazardCategory",
    "Classification.EnvironmentalHazards."+hazardField+".HazardStatement",
    "Classification.EnvironmentalHazards."+hazardField+".ReasonForNoClassification",
    "Classification.EnvironmentalHazards."+hazardField+".ReasonForClassification"
] />
<@study_summary "FLEXIBLE_RECORD.Ghs" "" "" fields />
</#macro>