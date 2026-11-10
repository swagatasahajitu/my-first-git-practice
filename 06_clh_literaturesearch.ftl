<!-- Chapter 6 DATA SOURCES template file -->

<!-- 6 DATA SOURCES -->

<#assign studyList = iuclid.getSectionDocumentsForParentKey(_subject.documentKey, "FLEXIBLE_RECORD", " LiteratureSearch") />
<#list studyList as study>
    <#if study?has_content>
        <@com.printIf study "DataSource.Reference" />
        <@com.printIf study "SearchStrategy.DatabasesUsed" />
        <@com.printIf study "RelevantStudies.KeyInformationDesc" />
        <@com.printIf study "RelevantStudies.SearchSummary" />
        <@com.printIf study "AdditionalInformation.AdditionalInfo" />
    </#if>
    <#else>
    No relevant information available.
</#list>
	