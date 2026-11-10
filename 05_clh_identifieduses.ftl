<!-- Chapter 5 IDENTIFIED USES template file -->

<!-- 5 IDENTIFIED USES -->
<div class="RepeatTableHeader">
<#assign recordDocs = ["FLEXIBLE_RECORD.Manufacturer","FLEXIBLE_RECORD.Formulation","FLEXIBLE_RECORD.UseAtIndustrialSites","FLEXIBLE_RECORD.ProfessionalWorkers","FLEXIBLE_RECORD.ConsumerUses"] />

<@keyHumanHealthHazardAssessmentInformation.getSectionDocuments _subject recordDocs />
<#assign recordList=keyHumanHealthHazardAssessmentInformation.resultStudyList />

<#assign printedHeaders = {} />

<#assign docsForType = iuclid.getSectionDocumentsForParentKey(_subject.documentKey, "FIXED_RECORD", "NoIdentifiedUses") />
<#if docsForType?has_content>
    <#list docsForType as record>
    <b>No identified uses:</b> <@com.printIf record "JustificationNoIdentified" "" "<br/>" />
    </#list>
</#if>

<#assign map = {
    "Manufacturer": "Manufacture",
    "Formulation": "Formulation",
    "UseAtIndustrialSites": "UsesAtIndustrialSites",
    "ProfessionalWorkers": "UsesByProfessionalWorkers",
    "ConsumerUses": "ConsumerUses"
}/>  
                
<#list recordDocs as docDefId>
<#assign uniqueList=[]>
<#assign listNumbers=[]>
    <#assign split = docDefId?split(".") />
    <#assign docType = split[0] />
    <#assign docSubType = split[1] />
    <#assign docsForType = iuclid.getSectionDocumentsForParentKey(_subject.documentKey, docType, docSubType) />
    <#list docsForType as doc>
    
        <#assign printName = docsForType?size gt 1 />
        <#list recordList as record>
            <#if record?has_content && record.hasElement(map[docSubType])>
                <#if !printedHeaders?has_content || !printedHeaders[docSubType]!false>
                    <p><u>${com.camelCaseToString(docSubType)}</u></p>
                    <#assign printedHeaders = printedHeaders + {docSubType: true} />
                </#if>                 
                <@getListOfUseNames record map docSubType />
            </#if>
        </#list> 
    </#list>
    <@printUse uniqueList />
</#list>

<#macro printUse uniqueList>
<#compress>
<#list uniqueList as item>
<#if item?is_string && item?has_content><p>${item}</p></#if>
</#list>
</#compress>
</#macro>

<#macro getListOfUseNames record map docSubType>
    <#assign useMap = {} />

    <#list record?children as item>
        <#assign useName = "" />
        <#assign useNumber = "" />

        <#list item?children as blockChild>
            <#if blockChild?node_name == "IdentifiedUseName">
                <#assign useName><@com.text blockChild/></#assign>
            </#if>
            <#if blockChild?node_name == "IdentifiedUseNumber">
                <#assign useNumber><@com.text blockChild/></#assign>
            </#if>
        </#list>

        <#-- Only store if there's a valid name -->
        <#if useName?has_content>
            <#assign useMap = useMap + {useName:useNumber} />
        </#if>
    </#list>

    <#-- Iterate over the map and add to uniqueList in order -->
    <#list useMap?keys as useName>
        <#assign useNumber = useMap[useName] />

        <#-- Determine the correct version to store -->
        <#if useNumber?has_content && useNumber?trim?length &gt; 0>
            <#assign formattedUse = useName +"; "+useNumber+""/>
        <#else>
            <#assign formattedUse = useName />
        </#if>

        <#-- Remove unnumbered version if numbered version is added -->
        <#if formattedUse != useName && uniqueList?seq_contains(useName)>
            <#assign uniqueList = uniqueList?filter(x -> x != useName) />
        </#if>

        <#-- Add only if not already in the list -->
        <#if !uniqueList?seq_contains(formattedUse)>
            <#assign uniqueList = uniqueList + [formattedUse] />
        </#if>
    </#list>
</#macro>
</div>


        <#--  <#local fullpaths = "record." + "${map[docSubType]}.IdentifiedUseName" />
        <#local evaluatedValue = fullpaths?eval/>
        <#local outputs><@com.text evaluatedValue/></#local>
        <#local out = [outputs]/>  -->

        <#--  <@com.text output/>  -->
        <#--  <@com.printIf record "${map[docSubType]}.IdentifiedUseName" "Use: " ", "/>
        <@com.printIf record "${map[docSubType]}.IdentifiedUseNumber" "" ""/>  -->