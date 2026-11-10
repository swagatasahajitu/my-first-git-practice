<!-- Chapter 1 IDENTITY OF THE SUBSTANCE template file -->

<!-- 1 IDENTITY OF THE SUBSTANCE -->
<h2 class="Heading2">Name and other identifiers of the substance</h2>
<p class="Caption">Substance identity and information related to molecular and structural formula of the substance</p>
<#if isSubstance(_subject)>
    <@keySubstanceInformation.substanceIdentityTable tableDefinition.table_1 />
<#else>
    <p><i>Substance identity table is not available when the report is generated from a mixture.</i></p>
</#if>
<div class="page-break"></div>
<#assign recordList = iuclid.getSectionDocumentsForParentKey(_subject.documentKey, "FLEXIBLE_RECORD", "SubstanceComposition") />
<#list recordList as record>
    <#if record?has_content>

        <#if record.Constituents.Constituents?has_content>	
        <p class="Caption">Constituents (non-confidential information)</p>
        <@keyCompositionInformation.substanceConstituentsImpuritiesAdditives record tableDefinition.table_2 />
        </#if>

        <#if record.Impurities.Impurities?has_content>
        <p class="Caption">Impurities (non-confidential information) if relevant for the classification of the substance</p>
        <@keyCompositionInformation.substanceConstituentsImpuritiesAdditives record tableDefinition.table_3/>
        </#if>

        <#if record.Additives.Additives?has_content>
        <p class="Caption">Additives (non-confidential information) if relevant for the classification of the substance</p>
        <@keyCompositionInformation.substanceConstituentsImpuritiesAdditives record tableDefinition.table_4/>
        </#if>

    </#if>
</#list>
<p class="Caption">Test substances (non-confidential information) (this table is optional)</p>
<mark>Table 5 is currently found at the end of the report.</mark>
<#-- keyHumanHealthHazardAssessmentInformation.standardStudyTable tableDefinition.table_5
substanceIdentity.activeSubstanceComposition _subject -->