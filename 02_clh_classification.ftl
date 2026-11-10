<!-- Chapter 2 PROPOSED HARMONISED CLASSIFICATION AND LABELLING template file -->

<!-- 2 PROPOSED HARMONISED CLASSIFICATION AND LABELLING -->
<div class="OrientationLandscape RepeatTableHeader">

<h2 class="Heading2">Proposed harmonised classification and labelling according to the CLP criteria</h2>
<p class="Caption">Proposed harmonised classification and labelling with or without existing entry in Annex VI of CLP</p>
<table>
<thead>
    <tr>
        <th rowspan="2"></th>
        <th rowspan="2">Index No</th>
        <th rowspan="2">Chemical name</th>
        <th rowspan="2">EC No</th>
        <th rowspan="2">CAS No</th>
        <th colspan="2">Classification</th>
        <th colspan="3">Labelling</th>
        <th rowspan="2">Specific Conc. Limits, M-factors and ATEs</th>
        <th rowspan="2">Notes</th>
    </tr>
    <tr>
        <th>Hazard Class and Category Code(s)</th>
        <th>Hazard statement Code(s)</th>
        <th>Pictogram, Signal Word Code(s)</th>
        <th>Hazard statement Code(s)</th>
        <th>Suppl. Hazard statement Code(s)</th>
    </tr>
</thead>
<tbody>
    <tr>
    <#assign hazardRecords = iuclid.getSectionDocumentsForParentKey(_subject.documentKey, "FLEXIBLE_RECORD", "Ghs") />
    <#assign identifierRecords = iuclid.getSectionDocumentsForParentKey(_subject.documentKey, "FLEXIBLE_RECORD", "Identifiers") />
    <#assign classes = [
        "Classification.PhysicalHazards.Explosives",
        "Classification.PhysicalHazards.FlammableGases",
        "Classification.PhysicalHazards.FlammableAerosols",
        "Classification.PhysicalHazards.ChemicalsUnderPressure",
        "Classification.PhysicalHazards.OxidisingGases",
        "Classification.PhysicalHazards.GasesPres",
        "Classification.PhysicalHazards.FlammableLiquids",
        "Classification.PhysicalHazards.FlammableSolids",
        "Classification.PhysicalHazards.SelfReactiveSubstMixt",
        "Classification.PhysicalHazards.PyrophoricLiquids",
        "Classification.PhysicalHazards.PyrophoricSolids",
        "Classification.PhysicalHazards.SelfHeatSubstMixt",
        "Classification.PhysicalHazards.SubstMixtWater",
        "Classification.PhysicalHazards.OxidisingLiquids",
        "Classification.PhysicalHazards.OxidisingSolids",
        "Classification.PhysicalHazards.OrganicPeroxides",
        "Classification.PhysicalHazards.CorMetals",
        "Classification.PhysicalHazards.DesensitizedExplosives",
        "Classification.HealthHazards.AcuteToxicityOral",
        "Classification.HealthHazards.AcuteToxicityDermal",
        "Classification.HealthHazards.AcuteToxicityInhalation",
        "Classification.HealthHazards.Irritation",
        "Classification.HealthHazards.EyeIrritation",
        "Classification.HealthHazards.RespiratorySensitisation",
        "Classification.HealthHazards.SkinSensitisation",
        "Classification.HealthHazards.AspirationHazard",
        "Classification.HealthHazards.ReproductiveToxicity.ReproductiveToxicity",
        "Classification.HealthHazards.ReproductiveToxicity.Effects",
        "Classification.HealthHazards.GermCell.GermCell",
        "Classification.HealthHazards.Carcinogenicity.Carcinogenicity",
        "Classification.HealthHazards.ToxicitySingle.Toxicity",
        "Classification.HealthHazards.ToxicityRepeated.Toxicity",
        "Classification.HealthHazards.EndocDisruptHH",
        "Classification.EnvironmentalHazards.AquaticEnvironment.AcuteShortTerm",
        "Classification.EnvironmentalHazards.AquaticEnvironment.LongTerm",
        "Classification.EnvironmentalHazards.OzoneLayer.HazardousOzone",
        "Classification.EnvironmentalHazards.EDENV",
        "Classification.EnvironmentalHazards.PBT",
        "Classification.EnvironmentalHazards.PMT"
    ] />
        <td>Current Annex VI entry</td>
        <td>Existing No
        <#list identifierRecords as record>
            <#list record.RegulatoryProgrammeIdentifiers.RegulatoryProgrammeIdentifiers as item>
                <#assign program><@com.picklist item.RegulatoryProgramme/></#assign>
                <#if program?matches("CLP index number - harmonised C&amp;L") >
                    <p><@com.text item.Id/></p>
                </#if>
            </#list>
        </#list>
        </td>
        <td>Add what is in Annex VI e.g. name (ISO); IUPAC name
        <#if isSubstance(_subject)>
            <#assign name><@com.iupacName com.getReferenceSubstanceKey(_subject.ReferenceSubstance.ReferenceSubstance)/></#assign>
        <#else>
            <#assign name><@com.substanceName _subject/></#assign>
        </#if>

        <#if name?matches("No IUPAC name provided")>
            <#assign name><@com.substanceName _subject/></#assign>
        </#if>
        <p>${name}</p></td>
        <td>Add what is in Annex VI, i.e. EC No or "-"
        <#if _subject.hasElement("OtherNames")>
        <#list _subject.OtherNames as blockItem>
            <#if blockItem?has_content>
                <#if blockItem.hasElement('NameType') && com.picklistValueMatchesPhrases(blockItem.NameType!"", ["EC number"])>
                    <p><@com.value blockItem.Name/></p>
                </#if>
            </#if>
        </#list>
        </#if>
        </td>
        <td>Add what is in Annex VI, i.e. CAS No or "-"
        <#if isSubstance(_subject)>
            <@com.casNumber com.getReferenceSubstanceKey(_subject.ReferenceSubstance.ReferenceSubstance) />
        </#if>
        </td>
        <td>Add what is in Annex VI
        <#list hazardRecords as record>
            <#list classes as path>
                <#if path?matches("Classification\\.HealthHazards\\.Toxicity(Single|Repeated)\\.Toxicity")>
                    <#assign val="record.${path}"?eval />
                    <#list val as blockItem>
                        <#if blockItem.Toxicity.hasElement("HazardCategory") && blockItem.Toxicity.HazardCategory?has_content>
                            <p><@com.value blockItem.Toxicity.HazardCategory/></p>
                        </#if>
                    </#list>
                <#else>
                    <@com.printIf record "${path}.HazardCategory" "<p>" "</p>" />
                </#if>
            </#list>
        </#list>
        </td>
        <td>Add what is in Annex VI
        <#list hazardRecords as record>
            <#list classes as path>
                <#if path?matches("Classification\\.HealthHazards\\.Toxicity(Single|Repeated)\\.Toxicity")>
                    <#assign val="record.${path}"?eval />
                    <#list val as blockItem>
                        <#if blockItem.Toxicity.hasElement("HazardStatement") && blockItem.Toxicity.HazardStatement?has_content>
                            <p><@com.value blockItem.Toxicity.HazardStatement/></p>
                        </#if>
                    </#list>
                <#else>
                    <@com.printIf record "${path}.HazardStatement" "<p>" "</p>" />
                </#if>
            </#list>
        </#list>
        </td>
        <td>Add what is in Annex VI
        <#list hazardRecords as record>
            <#if record.Labelling.HazardPictogramBlock.HazardPictogram?has_content>
                <@keyClassifcationAndLabellingInformation.HazardPictogramList record.Labelling.HazardPictogramBlock.HazardPictogram/>
            </#if>
        </#list>
        </td>
        <td>Add what is in Annex VI
        <#list hazardRecords as record>
            <#if record.Labelling.HazardStatementsBlock.HazardStatements?has_content>
                <@keyClassifcationAndLabellingInformation.HazardStatementList record.Labelling.HazardStatementsBlock.HazardStatements/>
            </#if>
        </#list>
        </td>
        <td>Add what is in Annex VI or leave empty
        <#list hazardRecords as record>
            <#if record.Labelling.LabelingRequirementsBlock.LabelingRequirements?has_content>
                <@keyClassifcationAndLabellingInformation.SupplimentalHazardStatementList record.Labelling.LabelingRequirementsBlock.LabelingRequirements/>
			</#if>
        </#list>
        </td>
        <td>Add what is in Annex VI or leave empty
        <#list hazardRecords as record>
            <#list record.Classification.SpecificConcentrations.ConcentrationRange as item>
                <#if item.ConcentrationRangeVal?has_content || item.HazardCategories?has_content>
		        	<p>
		        		<u>Specific concentration limits:</u>
		        	</p>
                    <p><@com.range item.ConcentrationRangeVal/></p>
                    <p><@com.picklistMultiple item.HazardCategories/></p>
                </#if>
            </#list>
            <#if record.Classification.EnvironmentalHazards.AquaticEnvironment.MFactor.MFactorAcute?has_content || record.Classification.EnvironmentalHazards.AquaticEnvironment.MFactor.MFactorChronic?has_content>
				<p>
		        	<u>M-Factor:</u>
		        </p>
                <p><@com.value record.Classification.EnvironmentalHazards.AquaticEnvironment.MFactor.MFactorAcute/></p>
                <p><@com.value record.Classification.EnvironmentalHazards.AquaticEnvironment.MFactor.MFactorChronic/></p>
            </#if>
	        <#--  Acute Toxicity Estimates (ATE)  -->
	        <#if record.Classification.ATE?has_content>
	            <@com.emptyLine/>
	            <p>
	            	<u>Acute Toxicity Estimates (ATE):</u>
	            </p>
	            <p><@com.value record.Classification.ATE.Oral/></p>
	            <p><@com.value record.Classification.ATE.Dermal/></p>
	            <p><@com.value record.Classification.ATE.Inhalation/></p>
	        </#if>
        </#list>
        </td>
        <td>Add what is in Annex VI or leave empty
        <#list hazardRecords as record>
            <#if record.NotesBlock.Notes?has_content>
            <#list record.NotesBlock.Notes as blockItem>
                <p><@com.picklist blockItem.Note/></p>
            </#list>
			</#if>
        </#list>
        </td>
    </tr>
    <tr>
        <td>Dossier submitters proposal</td>
        <td>Existing No or TBD (in case a new Index No is needed)
        <#list identifierRecords as record>
            <#list record.RegulatoryProgrammeIdentifiers.RegulatoryProgrammeIdentifiers as item>
                <#assign program><@com.picklist item.RegulatoryProgramme/></#assign>
                <#if program?matches("CLP index number - harmonised C&amp;L") >
                    <p><@com.text item.Id/></p>
                </#if>
            </#list>
        </#list>
        </td>
        <td>E.g. name (ISO); IUPAC name (corrections may apply e.g. by ECHA SID team)
        ${name}</td>
        <td>EC No or "-"
        <#if _subject.hasElement("OtherNames")>
            <#list _subject.OtherNames as blockItem>
        		<#if blockItem?has_content>
        			<#if blockItem.hasElement('NameType') && com.picklistValueMatchesPhrases(blockItem.NameType!"", ["EC number"])>
        				<p><@com.value blockItem.Name/></p>
        			</#if>
        		</#if>
        	</#list>
        </#if>
        </td>
        <td>CAS No or "-"
        <#if isSubstance(_subject)>
            <p><@com.casNumber com.getReferenceSubstanceKey(_subject.ReferenceSubstance.ReferenceSubstance) /></p>
        </#if>
        </td>
        <td><b>Retain<br/>Add<br/>Modify<br/>Remove<br/></b>(see CLP Annex VI Table 1.1. for correct codes)<br/><mark>[Please fill in cell manually]</mark></td>
        <td><b>Retain<br/>Add<br/>Modify<br/>Remove<br/></b>(see CLP Annex VI Table 1.1. for correct codes)<br/><mark>[Please fill in cell manually]</mark></td>
        <td><b>Retain<br/>Add<br/>Modify<br/>Remove<br/></b>(see CLP Annex VI Table 1.1. for correct codes)<br/><mark>[Please fill in cell manually]</mark></td>
        <td><b>Retain<br/>Add<br/>Modify<br/>Remove<br/></b>(see CLP Annex VI Table 1.1. for correct codes)<br/><mark>[Please fill in cell manually]</mark></td>
        <td><b>Retain<br/>Add<br/>Modify<br/>Remove<br/></b>(see CLP Annex VI Table 1.1. for correct codes)<br/><mark>[Please fill in cell manually]</mark></td>
        <td><b>Retain<br/>Add<br/>Modify<br/>Remove<br/></b>or leave empty<br/><mark>[Please fill in cell manually]</mark></td>
        <td><b>Retain<br/>Add<br/>Modify<br/>Remove<br/></b>or leave empty<br/><mark>[Please fill in cell manually]</mark></td>
    </tr>
    <tr>
        <td>Resulting Annex VI entry if agreed by RAC and COM</td>
        <td>Existing No or TBD (in case a new Index No is needed)</td>
        <td>E.g. name (ISO); IUPAC name (corrections may apply e.g. by ECHA SID team)</td>
        <td>EC No or "-"</td>
        <td>CAS No or "-"</td>
        <td>Add the resulting Hazard Class and Category Code(s) without<br/><b>Retain, Add, Modify, or Remove<br/></b></td>
        <td>Add the resulting Hazard Class and Category Code(s) without<br/><b>Retain, Add, Modify, or Remove<br/></b></td>
        <td>Add the resulting Pictogram, Signal Word  Code(s) without<br/><b>Retain, Add, Modify, or Remove<br/></b></td>
        <td>Add the resulting Hazard statement Code(s) without <br/><b>Retain, Add, Modify, or Remove<br/></b></td>
        <td>Add the resulting Suppl. Hazard statement Code(s) without<br/><b>Retain, Add, Modify, or Remove<br/></b> or leave empty</td>
        <td>Add the resulting SCL(s), M-factor(s) and ATE(s) without <br/><b>Retain, Add, Modify, or Remove<br/></b> or leave empty<br/>ATE<br/>SCL<br/>M-factors</td>
        <td>Add the resulting Notes without<br/><b>Retain, Add, Modify, or Remove<br/></b> or leave empty</td>
    </tr>
</tbody>
</table>

<p class="Caption">Reason for not proposing harmonised classification and status under consultation</p>
<table>
    <thead>
        <tr>
            <th>Hazard class</th>
            <th>Reason for no classification</th>
            <th>Within the scope of consultation</th>
        </tr>
    </thead>
    <tbody>
        <#list tableDefinition.table_7.columns as columnName>
            <tr>
                <td style="text-align: left;">${columnName}</td>                
                <td style="text-align: left; padding: 0; margin: 0; text-indent: 0; white-space: nowrap;"><#assign fieldList = tableDefinition.table_7.docDefIds["FLEXIBLE_RECORD.Ghs"][columnName]![] />
                <#assign defId = tableDefinition.table_7.docDefIds/>
                <#list defId as key, value>
                        <#assign split = key?split(".") />
                        <#assign docType = split[0] />
                        <#assign docSubType = split[1] />
                        <#assign docsForType = iuclid.getSectionDocumentsForParentKey(_subject.documentKey, docType, docSubType) />
                        <#list docsForType as study>                
                            <#if fieldList?is_sequence>
                                <#list fieldList as fieldEntry>
                                    <#if fieldEntry?is_hash>
                                    <@com.printIf study=study path=fieldEntry["field"]?trim before=fieldEntry["params"].before!"" after=fieldEntry["params"].after!""/>
                                    </#if>
                                </#list>
                            <#else>                          
                            </#if>
                        </#list>
                </#list>
                </td>
                <td>Yes/No</td>
            </tr>
        </#list>
    </tbody>
</table>

</div>