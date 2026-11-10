<!-- Chapter 17 ADDITIONAL LABELLING template file -->


<!-- 17 ADDITIONAL LABELLING 
<div>
-->


<#assign studyList = iuclid.getSectionDocumentsForParentKey(_subject.documentKey, "FLEXIBLE_RECORD", "Ghs") />
<p><b><u>Additional labelling requirements (CLP supplemental hazard statement):</u></b></p>
<#list studyList as study>
        <#if study?has_content>
            <@keyClassifcationAndLabellingInformation.AdditionalLabellingList study.Labelling.LabelingRequirementsBlock.AdditionalLabelling />
        </#if>
        <#else>
        No relevant information available.<br/>
</#list>
<p><b><u>Additional labelling requirements (non-GHS hazard statement):</u></b></p>
<#list studyList as study>
        <#if study?has_content>
            <@keyClassifcationAndLabellingInformation.SupplimentalHazardStatementList study.Labelling.LabelingRequirementsBlock.LabelingRequirements />
        </#if>
        <#else>
        No relevant information available.<br/>
</#list>


<!--/div-->
