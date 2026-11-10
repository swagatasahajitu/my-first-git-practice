<!-- Chapter 9 TOXICOKINETICS (ABSORPTION, METABOLISM, DISTRIBUTION AND ELIMINATION) template file -->
<#assign humanStudyDocs = ["ENDPOINT_STUDY_RECORD.HealthSurveillanceData","ENDPOINT_STUDY_RECORD.EpidemiologicalData","ENDPOINT_STUDY_RECORD.DirectObservationsClinicalCases","ENDPOINT_STUDY_RECORD.ExposureRelatedObservationsOther", "ENDPOINT_STUDY_RECORD.SensitisationData"] />

<@keyHumanHealthHazardAssessmentInformation.getSectionDocuments _subject humanStudyDocs />
<#assign humanStudyList = keyHumanHealthHazardAssessmentInformation.resultStudyList />
<!-- Assign an array of column headers to the variable 'columnHeaders'. -->
<#--<#assign columnHeaders = ["Material and method, Remarks", "Results", "Reference"]> 

<!-- Assign an array of column widths to the variable 'columnWidths'. -->
<#--<#assign columnWidths=[ "39%", "48%", "13%" ]>

<!-- Calculate the number of columns based on the size of the 'columnHeaders' array and assign it to the variable 'numberOfColumns' -->
<#--<#assign numberOfColumns = columnHeaders?size>

<!-- Toxicokinetics Documents -->
<#--<#assign toxicokineticsDocs = ["ENDPOINT_STUDY_RECORD.BasicToxicokinetics","ENDPOINT_STUDY_RECORD.DermalAbsorption","ENDPOINT_STUDY_RECORD.HealthSurveillanceData","ENDPOINT_STUDY_RECORD.EpidemiologicalData","ENDPOINT_STUDY_RECORD.DirectObservationsClinicalCases","ENDPOINT_STUDY_RECORD.ExposureRelatedObservationsOther"] />
<#assign humanToxicokineticsDocs = ["ENDPOINT_STUDY_RECORD.HealthSurveillanceData","ENDPOINT_STUDY_RECORD.EpidemiologicalData","ENDPOINT_STUDY_RECORD.DirectObservationsClinicalCases","ENDPOINT_STUDY_RECORD.ExposureRelatedObservationsOther"] />

<!-- 9. Toxicokinetics (absorption, metabolism, distribution and elimination) 
<div>-->





<#-- @keyHumanHealthHazardAssessmentInformation.humanInformationToxicokineticsStudies _subject / -->

<!-- Standard table layout 1: Table 24: Summary table of toxicokinetic studies -->
<#--<@keyHumanHealthHazardAssessmentInformation.getSectionDocuments _subject toxicokineticsDocs />
<@keyHumanHealthHazardAssessmentInformation.populateResultAndDataWaivingAndTestingProposalStudyLists studyList=keyHumanHealthHazardAssessmentInformation.resultStudyList />
<@keyHumanHealthHazardAssessmentInformation.setStudyTableHeader "Table 24: Summary table of toxicokinetic studies" columnHeaders columnWidths "#FBDDA6" ""/>
<@keyHumanHealthHazardAssessmentInformation.studyTableBody docFilter="toxicokinetics" />
-->
<@studyandsummaryCom.standardStudyTable tableDefinition.table_24 />

<h2 class="Heading2">Short summary and overall relevance of the provided toxicokinetic information on the proposed classification(s)</h2>

<#--<#assign animalStudyList = iuclid.getSectionDocumentsForParentKey(_subject.documentKey, "ENDPOINT_SUMMARY", "Toxicokinetics") />
<#assign humanStudySummary = iuclid.getSectionDocumentsForParentKey(_subject.documentKey, "ENDPOINT_SUMMARY", "ExposureRelatedObservationsHumans") />
<@keyHumanHealthHazardAssessmentInformation.getSectionDocuments _subject humanToxicokineticsDocs />
<#assign humanStudyList = keyHumanHealthHazardAssessmentInformation.resultStudyList />
<#assign humanStudyList = keyHumanHealthHazardAssessmentInformation.getRelevantHumanHealthStudies(humanStudyList "toxicokinetics") />
-->
<@study_summary "ENDPOINT_SUMMARY.Toxicokinetics">Animal information:</@study_summary>
<#assign studyList = keyHumanHealthHazardAssessmentInformation.getRelevantHumanHealthStudies(humanStudyList "" endpointFilter) />
<#if studyList??>
<#compress><#lt><@study_summary "ENDPOINT_SUMMARY.ExposureRelatedObservationsHumans"><p>Human information:</p></@study_summary></#compress>
</#if>
<#--escape x as x?html
    <#list animalStudyList as study>
        <#if study?has_content>
            <@keyHumanHealthHazardAssessmentInformation.printIf study "KeyInformation.KeyInformation" />
            <@keyHumanHealthHazardAssessmentInformation.printIf study "Discussion.Discussion" />
        </#if>
        <#else>
        No relevant information available.
    </#list>
    <br/>
    <b><u>Human information:</u></b>
    <#list humanStudyList as study>
        <#if study?has_content>
            <#list humanStudySummary as summarystudy>
                <@keyHumanHealthHazardAssessmentInformation.printIf summarystudy "KeyInformation.KeyInformation" />
                <@keyHumanHealthHazardAssessmentInformation.printIf summarystudy "Discussion.Discussion" />
            </#list>
            <#break>
        </#if>
        <#else>
        No relevant information available.
    </#list>
 -->