<!-- Chapter 8 EVALUATION OF PHYSICAL HAZARDS template file -->

<!-- 8. EVALUATION OF PHYSICAL HAZARDS
<div>
-->
<@subChapter "Explosives" tableDefinition.table_9 "explosive properties" "ENDPOINT_SUMMARY.Explosiveness" "Explosives" />
<@subChapter "Flammable gases (including chemically unstable gases)" tableDefinition.table_10 "flammable gases (including chemically unstable gases)" "ENDPOINT_SUMMARY.Flammability" "FlammableGases" />
<@subChapter "Oxidising gases" tableDefinition.table_11 "oxidising gases" "ENDPOINT_SUMMARY.OxidisingProperties" "OxidisingGases" />
<@subChapter "Gases under pressure" tableDefinition.table_12 "gases under pressure" "ENDPOINT_SUMMARY.GasesUnderPressure" "GasesPres" "See chapter 8.4.1"/>
<@subChapter "Flammable liquids" tableDefinition.table_13 "flammable liquids" "ENDPOINT_SUMMARY.Flammability" "FlammableLiquids" />
<@subChapter "Flammable solids" tableDefinition.table_14 "flammable solids" "ENDPOINT_SUMMARY.Flammability" "FlammableSolids" />
<@subChapter "Self-reactive substances" tableDefinition.table_15 "self-reactive substances" "ENDPOINT_SUMMARY.SelfReactiveSubstances" "SelfReactiveSubstMixt" />
<@subChapter "Pyrophoric liquids" tableDefinition.table_16 "pyrophoric liquids" "ENDPOINT_SUMMARY.Flammability" "PyrophoricLiquids" />
<@subChapter "Pyrophoric solids" tableDefinition.table_17 "pyrophoric solids" "ENDPOINT_SUMMARY.Flammability" "PyrophoricSolids" />
<@subChapter "Self-heating substances" tableDefinition.table_18 "self-heating substances" "ENDPOINT_SUMMARY.AutoFlammability" "SelfHeatSubstMixt" "See chapter 8.10.1"/>
<@subChapter "Substances which in contact with water emit flammable gases" tableDefinition.table_19 "substances which in contact with water emit flammable gases" "ENDPOINT_SUMMARY.Flammability" "SubstMixtWater" />
<@subChapter "Oxidising liquids" tableDefinition.table_20 "oxidising liquids" "ENDPOINT_SUMMARY.OxidisingProperties" "OxidisingLiquids" />
<@subChapter "Oxidising solids" tableDefinition.table_21 "oxidising solids" "ENDPOINT_SUMMARY.OxidisingProperties" "OxidisingSolids" />
<@subChapter "Organic peroxides" tableDefinition.table_22 "organic peroxides" "ENDPOINT_SUMMARY.OrganicPeroxide" "OrganicPeroxides" "See chapter 8.14.1"/>
<@subChapter "Corrosive to metals" tableDefinition.table_23 "the hazard class corrosive to metals" "ENDPOINT_SUMMARY.CorrosiveToMetals" "CorMetals" "See chapter 8.15.1"/>
<!--/div-->

<#macro tableSummaryComparison tables startIndex infoOn docDefId endpointFilter livestock justField>
<#compress>
<p>
<#list tables as table>
    <@studyandsummaryCom.standardStudyTable table />
</#list>
</p>
<h2 class="Heading2">Short summary and overall relevance of the provided information on ${infoOn}</h2>
<@study_summary docDefId>Animal information:</@study_summary>
<#local studyList = keyHumanHealthHazardAssessmentInformation.getRelevantHumanHealthStudies(humanStudyList "" endpointFilter) />
<#if studyList??>
    <#-- omitting the endpoint filter and relying on filters of tabledefs instead -->
    <p><@study_summary "ENDPOINT_SUMMARY.ExposureRelatedObservationsHumans">Human information: </@study_summary></p>
</#if>
<#if livestock><p><@study_summary "ENDPOINT_SUMMARY.ToxicEffectsLivestockPets">Livestock and pets information:</@study_summary></p></#if>
<h3 class="Heading3">Comparison with CLP criteria</h3>
<p><@study_summary docDefId=docDefId includeClassField=true/></p>
</#compress>
</#macro>

<#macro subChapter title="Explosives" table="" infoOn="" docDefId="" hazardField="" see="">
<#compress>
<h2 class="Heading2">${title}</h2>
<@studyandsummaryCom.standardStudyTable table />
<h3 class="Heading3">Short summary and overall relevance of the provided information on ${infoOn}</h3>
<@study_summary docDefId/>
<h3 class="Heading3">Comparison with the CLP criteria</h3>
<@study_summary docDefId=docDefId includeClassField=true/>
<h3 class="Heading3">Conclusion on classification and labelling for ${infoOn}</h3>
<#assign fields=[
    "Classification.PhysicalHazards."+hazardField+".HazardCategory",
    "Classification.PhysicalHazards."+hazardField+".HazardStatement",
    "Classification.PhysicalHazards."+hazardField+".ReasonForNoClassification",
    "Classification.PhysicalHazards."+hazardField+".ReasonForClassification"
] />
<#local studyList = iuclid.getSectionDocumentsForParentKey(_subject.documentKey, "FLEXIBLE_RECORD", "Ghs") />
<#if !(studyList?has_content)>
    No relevant information available.
<#else>
    <#if studyList?size == 1>
        
        <#list studyList as study>
            <#if study?has_content>
                <@com.printIf study fields[0] "Classification: " "" />
                <@com.printIf study fields[1] "(" ")" />
                <@com.printIf study fields[3] "," "" />
                <@com.printIf study fields[2] "No classification is proposed. <br/>" "" />
            </#if>
        </#list>

    <#elseif studyList?size gt 1>

        <ul style="margin-top: 0; padding-left: 20px; list-style-position: inside;">

        <#list studyList as study>
            <#if study?has_content>
                <b>GHS record name: <@com.text study.name/></b>            
                <li><@com.printIf study fields[0] "Classification: " "" /></li>
                <li><@com.printIf study fields[1] "(" ")" /></li>
                <li><@com.printIf study fields[3] "," "" /></li>
                <li><@com.printIf study fields[2] "No classification is proposed. <br/>" "" /></li>
                <#if study?has_next><br/><#else></#if>
            </#if>
        </#list>
        </ul>
    </#if>
</#if>
</#compress>
</#macro>