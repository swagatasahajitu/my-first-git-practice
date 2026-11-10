<!DOCTYPE html>
<#import "../../common_modules/html/macros_common_general_html.ftl" as com> rakhlam ar ki
<@com.initializeMainVariables/>
<#-- allow report to be generated from sub entity -->
<#if subEntityUuid??><#assign subEntityKey = com.getSubEntityKey(subEntityUuid) />
<#global _subject = subEntityKey/></#if>
<#import "tableDefs.ftl" as tableDefinition>
<#import "../../common_modules/html/common_module_front_page_html.ftl" as fp>
<#import "../../common_modules/html/macros_common_studies_and_summaries_html.ftl" as studyandsummaryCom>
<#import "../../common_modules/html/common_module_human_health_hazard_assessment_html.ftl" as keyHumanHealthHazardAssessmentInformation>
<#import "../../common_modules/html/common_module_human_health_hazard_assessment_of_physicochemical_properties_html.ftl" as keyHumanHealthHazardAssessmentOfPhysChemPropInformation>
<#import "../../common_modules/html/common_module_physical_chemical_summary_properties_html.ftl" as keyPhysChemInformation>
<#import "../../common_modules/html/common_module_classification_and_labelling_html.ftl" as keyClassifcationAndLabellingInformation>
<#import "../../common_modules/html/common_module_environmental_fate_properties_html.ftl" as keyEnvironmentalFateAndProperties>
<#import "../../common_modules/html/common_module_literature_data_html.ftl" as keyLitertureSearchAndDataSources>
<#import "../../common_modules/html/common_module_environmental_hazard_assessment_html.ftl" as keyEnvironmentalHazardAssessment>
<#import "../../common_modules/html/common_module_substance_composition_html.ftl" as keyCompositionInformation>
<#import "../../common_modules/html/common_module_substance_basic_information_html.ftl" as keySubstanceInformation>
<#import "../../common_modules/html/common_module_pbt_and_vpvb_assessment_html.ftl" as keyPbtandvPvBassessment>

<#assign locale = "en" />
<#assign sysDateTime = .now>
<#-- global debug = true/ -->
<#-- Initialize the macro and use clhRelevant?? to include or !(clhRelevant??) exclude content from FTLs for the CLH report -->
<@com.initiateRelevanceCLH relevance/>
<html>
<head>
<#include "../../common_modules/stylesheets/html/stylesheet_html.ftl"/>
</head>
<body>
<div class="FooterInformationToc"><div class="LeftInformation"><p></p></div><div class="CenterInformation"><p>#PAGE_NUM#</p></div><div class="RightInformation"><p></p></div></div><div class="NumberedTableOfContents"></div>

<#if isSubstance(_subject)>
    <@fp.getFrontPage subject=_subject dossierHeader=_dossierHeader title="CLH Report<br/><br/>Proposal for Harmonised Classification and Labelling" subtitle="Based on Regulation (EC) No 1272/2008 (CLP Regulation), Annex VI, Part 2" notice="<i><u>Note on confidential information</u></i><br/>Please be aware that this report is intended to be made publicly available. Therefore, it should not contain any confidential information. Such information should be provided in a separate confidential Annex to this report, clearly marked as such."/>
<#elseif isMixture(_subject)>
    <h1>CLH Report</h1>
    <h2>Proposal for Harmonised Classification and Labelling</h2>
    <p>Based on Regulation (EC) No 1272/2008 (CLP Regulation), Annex VI, Part 2</p>
    <p><i><u>Note on confidential information</u></i><br/>Please be aware that this report is intended to be made publicly available. Therefore, it should not contain any confidential information. Such information should be provided in a separate confidential Annex to this report, clearly marked as such.</p>
</#if>

    <#assign mixtureSubject = _subject />
    <#assign reportSubjects = [_subject] />
    <#if isMixture(mixtureSubject)>
    <#assign compRecs = iuclid.getSectionDocumentsForParentKey(mixtureSubject.documentKey, "FLEXIBLE_RECORD", "MixtureComposition") />
    <#list compRecs as rec>
        <#list rec.Components.Components as item>
            <#if item.Function?has_content && item.Reference?has_content && com.picklistValueMatchesPhrases(item.Function, ["active substance"])>
                <#assign linkedDoc = iuclid.getDocumentForKey(item.Reference) />
                <#if linkedDoc?has_content && isSubstance(linkedDoc)>
                    <#assign reportSubjects = reportSubjects + [linkedDoc] />
                </#if>
            </#if>
        </#list>
    </#list>
    </#if>

    <#list reportSubjects as currentSubject>
    <#global _subject = currentSubject />
    <#if isMixture(currentSubject)>
        <h1>MIXTURE: ${currentSubject.name!""}</h1>
    <#elseif isMixture(mixtureSubject)>
        <h1>ACTIVE SUBSTANCE: ${currentSubject.name!""}</h1>
    </#if>

    <h1 class="Heading1">IDENTITY OF THE SUBSTANCE</h1>
        <#include "01_clh_identity.ftl"/>

    <h1 class="Heading1">PROPOSED HARMONISED CLASSIFICATION AND LABELLING</h1>
        <#include "02_clh_classification.ftl"/>

    <h1 class="Heading1">HISTORY OF THE PREVIOUS CLASSIFICATION AND LABELLING</h1>    
    <#-- CLH report document -->
    <#assign clhReportRecord = iuclid.getSectionDocumentsForParentKey(_subject.documentKey, "FIXED_RECORD", "CLHreport") />
    <#list clhReportRecord as record>
        <#if record.History?has_content>
            <@com.value record.History/>
        </#if>
    </#list>
    
    <h1 class="Heading1">JUSTIFICATION THAT ACTION IS NEEDED AT COMMUNITY LEVEL</h1>
    <#list clhReportRecord as record>
        <#if record.JustificationThatActionIsNeededAtCommunityLevel?has_content>
        
            <#if com.picklistValueMatchesPhrases(record.JustificationThatActionIsNeededAtCommunityLevel, ["There is no requirement for justification that action is needed at Community level."]) >
                <p><@com.value record.JustificationThatActionIsNeededAtCommunityLevel/></p>
            <#else>
                <#if record.ReasonForANeedForActionAtCommunityLevel?has_content>       
                    <p><b><@iuclid.label for=record.ReasonForANeedForActionAtCommunityLevel var="clhReportLabelReason"/></b></p>
                    <@com.text clhReportLabelReason/>: <@com.value record.ReasonForANeedForActionAtCommunityLevel/>
                </#if>
                <#if record.FurtherDetailOnNeedOfActionAtCommunityLevel?has_content>
                    <p><b><@iuclid.label for=record.FurtherDetailOnNeedOfActionAtCommunityLevel var="clhReportLabelFurtherDetails"/></b></p>
                    <@com.text clhReportLabelFurtherDetails/>: <@com.value record.FurtherDetailOnNeedOfActionAtCommunityLevel/>
                </#if>
            </#if>
        </#if>
    </#list>
    
    <h1 class="Heading1">IDENTIFIED USES</h1>
        <#include "05_clh_identifieduses.ftl"/>
    <h1 class="Heading1">DATA SOURCES</h1>
        <#include "06_clh_literaturesearch.ftl"/>
    <h1 class="Heading1">PHYSICOCHEMICAL PROPERTIES</h1>
        <#include "07_clh_phys_chem_properties.ftl"/>
    <h1 class="Heading1">EVALUATION OF PHYSICAL HAZARDS</h1>
        <#include "08_clh_physicalhazards.ftl"/>
    <h1 class="Heading1">TOXICOKINETICS (ABSORPTION, METABOLISM, DISTRIBUTION AND ELIMINATION)</h1>
        <#include "09_clh_toxicokinetics.ftl"/>
    <h1 class="Heading1">EVALUATION OF HEALTH HAZARDS</h1>
        <#include "10_clh_healthhazards.ftl"/>	
    <h1 class="Heading1">EVALUATION OF AQUATIC HAZARDS UNDER CLP ANNEX I, 4.1</h1>
        <#include "12_clh_aquatichazards.ftl"/>
    <h1 class="Heading1">ENDOCRINE DISRUPTION FOR THE ENVIRONMENT</h1>
        <#include "13_clh_endocrinedisruption_env.ftl"/>
    <h1 class="Heading1">Persistent, Bioaccumulative and Toxic (PBT) or Very Persistent, Very Bioaccumulative (vPvB) properties under CLP Annex I, 4.3</h1>
        <#include "14_clh_pbt.ftl"/>
    <h1 class="Heading1">Persistent, Mobile and Toxic (PMT) or Very Persistent, Very Mobile (vPvM) properties under CLP Annex I, 4.4</h1>
        <#include "15_clh_pmt.ftl"/>
    <h1 class="Heading1">EVALUATION OF ADDITIONAL HAZARDS</h1>
        <#include "16_clh_additionalhazards.ftl"/>
    <h1 class="Heading1">ADDITIONAL LABELLING</h1>
        <#include "17_clh_additionallabelling.ftl"/>
    </#list>
    <#global _subject = mixtureSubject />
    <h1 class="Heading1">REFERENCES</h1>
        <#include "../../common_modules/html/Annex1_literature_references_html.ftl"/>
        <#include "XX_clh_table_5.ftl"/>
    <h1 class="Heading1">Annexes</h1>
    [Please add ANNEX I to the CLH report and potential other annexes.]

    <h2 class="Heading2">Attachments</h2>
    <p>To generate a list of attachments from your IUCLID dossier or dataset, please generate the report 'List of attachments'. This will give you a list of all attachments found your dossier or dataset.</p>

    <#-- The commented out code below refers to an initial method of call certain attachments -->
    <#--  <#assign compositeEntityTypes = ["SUBSTANCE", "MIXTURE", "TEMPLATE"]>
    <#function isCompositeEntityDocument component>
    <#return compositeEntityTypes?seq_contains(component.documentType)>
    </#function>

    <@attachmentsForClh />
   
    <#macro attachmentsForClh>
    <#list dossier.components as component> 
        <#if isCompositeEntityDocument(component)>        
            <#if component?has_content>
                <#list component.documents as document>
                    <#if document?has_content>
                    <#assign name><#if document?has_content>${document.name}</#if></#assign>                                     
                    <@docNodes document name/>
                    </#if>
                </#list>
            </#if>
        </#if>
    </#list>
    </#macro>
    
    <#macro docNodes document name>    
    <#if document?children?has_content>
        <#list document?children as item>
            <#if item?children?has_content>
                <@docNodes item name/>
                <#else>   
                <#if item?node_type=="document_references">
                    <#list item as item>
                    <#assign iteme = iuclid.getDocumentForKey(item)/>
                        <#if iteme?children?has_content && iteme?node_name=="LITERATURE">
                            <#list iteme?children as child>
                                <#list child?children as child>
                                    <#if child?node_type=="repeatable" || child?node_type=="block">
                                        <#list child?children as childs>
                                            <#if childs?node_type=="repeatable" || childs?node_type=="block">
                                                <#list childs?children as child>
                                                    <#local fieldPaths = child._path>
                                                    <#if child?node_type == "attachment">
                                                        <#if child?has_content>
                                                            <#local attachmentMetaData = iuclid.getMetadataForAttachment(child)>
                                                            <p>
                                                            <#if name?has_content>${name}:&#160;</#if>
                                                            <b>${attachmentMetaData.filename}</b></p>
                                                        </#if>
                                                    </#if>
                                                </#list>
                                            </#if>
                                        </#list>
                                    </#if>
                                </#list>
                            </#list>
                        </#if>
                    </#list>
                <#else>
                    
                    <#if (item?node_type!="block" || item?node_type!="repeatable")>
                    <#local fieldPaths = item._path>
                        <#if item?node_type == "attachment" && (fieldPaths?contains("AttachedDocument") || fieldPaths?contains("AssessmentReport.Document"))>                        
                            <#if item?has_content>
                            <#local attachmentMetaData = iuclid.getMetadataForAttachment(item)>
                            <p><#if name?has_content>${name}:&#160;</#if><b>${attachmentMetaData.filename}</b></p>
                            </#if>                        
                        </#if> 
                    </#if>
                </#if>
            </#if>        
        </#list>            
    </#if>
    </#macro>  -->
    <#-- Macros and functions -->
    <#macro study_summary docDefId documentId="" endpointFilter="" fields=["KeyInformation.KeyInformation", "Discussion.Discussion"] includeClassField=false>
    <#local includeClassField = includeClassField!false />  
    <#local split = docDefId?split(".") />
    <#local docType = split[0] docSubType = split[1] />
    <#local studyList = iuclid.getSectionDocumentsForParentKey(_subject.documentKey, docType, docSubType) />
        <#if documentId?has_content || endpointFilter?has_content>
            <#local studyList = keyHumanHealthHazardAssessmentInformation.getRelevantHumanHealthStudies(studyList, documentId, endpointFilter) />
        </#if>
        <b><u><#nested></u></b>
        <#list studyList as study>
            <#if study?has_content>
                <#if includeClassField && study.hasElement("Justification.JustifClassif") && study.Justification.JustifClassif?has_content>                
                    <p><#compress><#lt><@studyandsummaryCom.justification study "Justification.JustifClassif"/></#compress></p>
                </#if>
                <#if includeClassField && study.hasElement("Justification.JustifClassif_STOTSE") && study.Justification.JustifClassif_STOTSE?has_content>
					<p><#compress><#lt><@studyandsummaryCom.justification study "Justification.JustifClassif_STOTSE" "for STOT SE"/></#compress></p>
                </#if>
                <#if includeClassField && study.hasElement("PbtAssessmentOverallResult.JustifClassif") && study.PbtAssessmentOverallResult.JustifClassif?has_content>
					<p><#compress><#lt><@studyandsummaryCom.justification study "PbtAssessmentOverallResult.JustifClassif" "for PBT"/></#compress></p>
                </#if>
                <#if includeClassField && study.hasElement("PbtAssessment.PMTAssessment.JustifClassif_PMT") && study.PbtAssessment.PMTAssessment.JustifClassif_PMT?has_content>
					<p><#compress><#lt><@studyandsummaryCom.justification study "PbtAssessment.PMTAssessment.JustifClassif_PMT" "for PMT"/></#compress></p>
                </#if>                
                <#if !includeClassField>
                    <#list fields as field>                    
                        <#if field?has_content>                    
                            <#if study.documentSubType=="Ghs">
                            <#local fieldLabel><#if field?has_content>${com.iuclidLabel(study, field)}</#if></#local>
                                <#if fieldLabel?? && fieldLabel?has_content>
                                    <@com.printIf study=study path=field before="<b>${com.iuclidLabel(study, field)!com.fieldNameToString(field)}:&#160;</b>"/>
                                <#else>
                                   <#if fieldLabel?? && fieldLabel?has_content>${fieldLabel}:</#if> <@com.printIf study=study path=field/>
                                </#if>
                            <#else>
                           <#compress><#lt><@com.printIf study field/></#compress>
                            </#if>
                        </#if>                     
                    </#list>
                </#if>
            </#if>
        </#list>
    </#macro>
<#macro inlcude_placeholder text>
${text}
</#macro>
<#-- functions to check root entity type -->
<#function isSubstance _subject>
    <#if _subject.documentType=="SUBSTANCE">
    <#return true>
    <#else>
    <#return false>
    </#if>
    <#return false>
</#function>
<#function isMixture _subject>
    <#if _subject.documentType=="MIXTURE">
    <#return true>
    <#else>
    <#return false>
    </#if>
    <#return false>
</#function>
</body>
</html>