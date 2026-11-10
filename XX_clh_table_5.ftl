<!-- APPENDIX: Information on Test Material -->

<div class="OrientationLandscape RepeatTableHeader">
<table>
<colgroup>    
    <col style="width: 20%"/>
    <col style="width: 15%"/>
    <col style="width: 25%"/>
    <col style="width: 20%"/>
    <col style="width: 20%"/>
</colgroup>
<thead>
    <tr>
        <th>Identification of test substance</th>
        <th>Purity</th>
        <th>Impurities and additives (identity, %, classification if available)</th>
        <th>Other information</th>
        <th>The study(ies) in which the test substance is used</th>
    </tr>
</thead>
<tbody>
    <#list com.removeDocumentDuplicates(studyandsummaryCom.testMaterialInformations) as testMaterial>
    <tr id="${testMaterial.documentKey.uuid!}">
        <td>
        <p><#compress><#lt>
        	<b><@com.text testMaterial.Name/></b><br/>
            <#if testMaterial.Composition.CompositionList?has_content>
            <ul style="margin-top: 0; padding-left: 5px; list-style-position: inside;">
            <#list testMaterial.Composition.CompositionList as blockItem>
            <p><#compress><#lt>
                <#assign refSubst = iuclid.getDocumentForKey(blockItem.ReferenceSubstance) />
			    <#if refSubst?has_content>
                <p><#compress><#lt>                
			    <li style="text-indent:0; padding-left: 0px;">
                    <p>
                    <#compress>
                        IUPAC name: <@com.text refSubst.IupacName/></#compress></p>
                        <p><#compress>Reference substance name:<@com.text refSubst.ReferenceSubstanceName/></#compress></p>
                        <p><#compress>Inventory number: <@com.inventoryECNumber refSubst.Inventory.InventoryEntry/></#compress></p>
                        <p><#compress>CAS number: <@com.text refSubst.Inventory.CASNumber/></#compress></p>
                    
                </li>
                </#compress></p>
			    </#if>
            </#compress></p>
            </#list>
            </ul>
            </#if>
            <p>Test material form: <b><@com.picklist testMaterial.Composition.OtherCharacteristics.TestMaterialForm/></b></p>
        </#compress></p>
        </td>
        <#if testMaterial.Composition.CompositionList?has_content> 
            <td>
                <ul style="margin-top: 0; padding-left: 5px; list-style-position: inside;">
                <#list testMaterial.Composition.CompositionList as blockItem>   
                <#if blockItem.Concentration?has_content>         
                    <li style="text-indent:0; padding-left: 0px;">
                    <p><#compress><#lt>                        
                        <b>Concentration:</b> <@com.range blockItem.Concentration/>                        
                    </#compress></p>
                    </li> 
                </#if>           
                </#list>
                </ul>
            </td>
            <td>
                <ol>
                <#list testMaterial.Composition.CompositionList as blockItem>
                    <li style="text-indent:0; padding-left: 0px;">
                    <p><#compress><#lt>
                    <b>Type:</b> <@com.picklist blockItem.Type/>
                    </#compress></p>
                    </li>
                </#list>
                </ol>
            </td>
        <#else>
            <td></td><td></td>
        </#if>
        <td>
        <#if testMaterial.Composition.OtherCharacteristics.DetailsOnTestMaterial?has_content>
	        <p><#compress><#lt>Details on test material: <@com.text testMaterial.Composition.OtherCharacteristics.DetailsOnTestMaterial/></#compress></p>
	    </#if>
        </td>
        <td>
        <#-- inboundref -->
        <#list com.inboundReferences(testMaterial.documentKey) as inboundReferenceKey>
        
        <#if inboundReferenceKey?has_content>
        <#assign inboundReference = iuclid.getDocumentForKey(inboundReferenceKey) />
            <#if inboundReference?has_content>
                <@studyandsummaryCom.literatureReferenceList inboundReference.DataSource.Reference />
            </#if>
        </#if>
        </#list>

        </td>
    </tr>
    </#list>
</tbody>
</table>
</div>
        

