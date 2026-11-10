<#-- Chapter 14 template file -->
<h2 class="Heading2">Persistence under CLP Annex I, 4.3</h2>
<i>[Please refer to any information that may already be available under a previous section of the CLH report template (e.g. on aquatic hazards). Such a reference may be sufficient and no repetition of the same information is needed].</i>

<h2 class="Heading2">Short summary and overall relevance of the provided information on the PBT and vPvB properties</h2>
<@keyPbtandvPvBassessment.pbtandvPvBcriteriaAndJustification _subject=_subject includeB=true includeM=false />

<h2 class="Heading2">Comparison with the CLP criteria and conclusion on classification and labelling for PBT/vPvB hazards</h2>
<@study_summary docDefId="FLEXIBLE_SUMMARY.PbtAssessment" includeClassField=true />

<h2 class="Heading2">Conclusion on classification and labelling for PBT/vPvB hazards</h2>
<@classificationAndLabellingGHS hazardField="PBT"/>

<#macro classificationAndLabellingGHS hazardField="">
<#local fields=[
    "Classification.EnvironmentalHazards."+hazardField+".HazardCategory",
    "Classification.EnvironmentalHazards."+hazardField+".HazardStatement",
    "Classification.EnvironmentalHazards."+hazardField+".ReasonForNoClassification",
    "Classification.EnvironmentalHazards."+hazardField+".ReasonForClassification"
] />
<@study_summary "FLEXIBLE_RECORD.Ghs" "" "" fields />
</#macro>