<#-- Chapter 15 template file -->
<h2 class="Heading2">Persistence under CLP Annex I, 4.4</h2>
<i>[Link to information that may already be available under a previous section of the CLH report template].</i>
<h2 class="Heading2">Short summary and overall relevance of the provided information on the PMT and vPvM properties</h2>
<@keyPbtandvPvBassessment.pbtandvPvBcriteriaAndJustification _subject=_subject includeB=false includeM=true />

<h2 class="Heading2">Comparison with the CLP criteria and conclusion on classification and labelling for PMT/vPvM hazards</h2>
<@study_summary docDefId="FLEXIBLE_SUMMARY.PbtAssessment" includeClassField=true />

<h2 class="Heading2">Conclusion on classification and labelling for PMT/vPvM hazards</h2>
<@classificationAndLabellingGHS hazardField="PMT"/>

<#macro classificationAndLabellingGHS hazardField="">
<#local fields=[
    "Classification.EnvironmentalHazards."+hazardField+".HazardCategory",
    "Classification.EnvironmentalHazards."+hazardField+".HazardStatement",
    "Classification.EnvironmentalHazards."+hazardField+".ReasonForNoClassification",
    "Classification.EnvironmentalHazards."+hazardField+".ReasonForClassification"
] />
<@study_summary "FLEXIBLE_RECORD.Ghs" "" "" fields />
</#macro>