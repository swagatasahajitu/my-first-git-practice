<!-- Chapter 16 EVALUATION OF ADDITIONAL HAZARDS template file -->


<!-- 16 EVALUATION OF ADDITIONAL HAZARDS 
<div>
-->

<h2 class="Heading2">Hazardous to the ozone layer</h2>

<@studyandsummaryCom.standardStudyTable tableDefinition.table_91 />

<h3 class="Heading3">Short summary and overall relevance of the provided information on ozone layer hazard</h3>
<@study_summary "ENDPOINT_SUMMARY.PhototransformationInAir"/>

<h3 class="Heading3">Comparison with the CLP criteria</h3>
<@study_summary docDefId="ENDPOINT_SUMMARY.PhototransformationInAir" includeClassField=true/>

<h3 class="Heading3">Conclusion on classification and labelling for hazardous to the ozone layer</h3>
<#assign studyList = iuclid.getSectionDocumentsForParentKey(_subject.documentKey, "FLEXIBLE_RECORD", "Ghs") />
<b><u>Conclusion on classification and labelling for PBT/vPvB hazards:</u></b>
<#list studyList as study>
        <#if study?has_content>
            <@com.printIf study "Classification.EnvironmentalHazards.OzoneLayer.HazardousOzone.HazardCategory" "Classification: " "" />
            <@com.printIf study "Classification.EnvironmentalHazards.OzoneLayer.HazardousOzone.HazardStatement" "(Hazard statement: " ")" />
            <@com.printIf study "Classification.EnvironmentalHazards.OzoneLayer.HazardousOzone.ReasonForClassification" ", " "<br/>" />
            <@com.printIf study "Classification.EnvironmentalHazards.OzoneLayer.HazardousOzone.ReasonForNoClassification" "No classification is proposed. " "<br/>" />
        </#if>
        <#else>
        No relevant information available.<br/>
    </#list>
