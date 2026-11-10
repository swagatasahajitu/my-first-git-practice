<!DOCTYPE html>

<#-- Import common macros and functions -->
<#import "../../common_modules/html/macros_common_general_html.ftl" as com>

<!-- Initialize common variables -->
<@com.initializeMainVariables/>	

<!-- Initialize the macro and use clhRelevant?? to include or !(clhRelevant??) exclude content from FTLs for the CLH report -->
<@com.initiateRelevanceCLH relevance/>
<#-- global debug = true/ -->
<#------------------------------>
<#-- CLH Report TEMPLATE FILE -->
<#------------------------------>
<html>
    <head>
		<#if clhRelevant??>
			<meta name="description" content="CLH Report" />
		</#if>
    </head>
	<body>

	<!--test -->
		${"&amp;"}
	<!--end test -->
<br/>
	<!--test -->
		${"&nbsp;"}
	<!--end test -->
<br/>

	<!--get first real richtext -->
	<#assign studyList = iuclid.getSectionDocumentsForParentKey(_subject.documentKey, "ENDPOINT_SUMMARY", "Explosiveness") />
	<#list studyList as study>
        <#if study?has_content>
			<#if study.KeyInformation.KeyInformation?has_content>
			<#assign richtextval=study.KeyInformation.KeyInformation />
            </#if>
			<#if study.Discussion.Discussion?has_content>
			<#assign discussionval=study.Discussion.Discussion />
            </#if>
			<#if richtextval?has_content && discussionval?has_content>
			<#continue>
            </#if>
        </#if>
	</#list>
		<#assign studyList = iuclid.getSectionDocumentsForParentKey(_subject.documentKey, "ENDPOINT_SUMMARY", "GeneralInformation") />
	<#list studyList as study>
        <#if study?has_content>
			<#if study.KeyInformation.KeyInformation?has_content>
			<#assign htmlfield=study.KeyInformation.KeyInformation />
			<#continue>
            </#if>
        </#if>
	</#list>
	
	Node type of richtextval: ${richtextval?node_type}
	Node type of discussionval: ${discussionval?node_type}
	Node type of htmlfield: ${htmlfield?node_type}
	<!--end test -->

<br/>
	<!--test richText macro-->
	KeyInformation: <@com.richText richtextval />
	Discussion: <@com.richText discussionval />
	GeneralKeyInformation: <@com.richText htmlfield />
	<!--end test -->
<br/>
	<!--test replace-->
	KeyInformation: ${richtextval?replace('&[a-z]+;', "DEBUG")}
	Discussion: ${discussionval?replace("&[a-z]+;", "DEBUG")}
	GeneralKeyInformation: ${htmlfield?replace("&[a-z]+;", "DEBUG")}
	<!--end test -->
<br/>

	<!--test escapes-->
	<#--KeyInformation escaped: ${richtextval?esc}
	//Syntax error in template "dbreport_CLH HTML report testing/text/html/00_clh_testing.ftl" in line 77, column 47:
	//?esc can't be used here, as the current output format isn't a markup (escaping) 
	//format: undefined(mimeType=null, class=f.c.UndefinedOutputFormat)
	
	KeyInformation not escaped: ${richtextval?no_esc}-->
	<!--end test -->
<br/>

HTML: <#outputformat 'HTML'>${richtextval}</#outputformat>
XML:  <#outputformat 'XML'>${richtextval}</#outputformat>
RTF:  <#outputformat 'RTF'>${richtextval}</#outputformat>

	</body>
</html>
