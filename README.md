# CLH Report Templates Repository

Welcome to the directory for the CLH Report templates. This directory contains the necessary templates for creating standardized reports as per the Classification, Labelling and Packaging (CLP) Regulation (EC) No 1272/2008. CLH (Classification and Labelling Harmonisation) reports will be generated in HTML format using the IUCLID v6.8 Software.

## Repository Structure

Within this directory, you'll find the following template files:

- [./00_clh_main.ftl](00_clh_main.ftl) - Contains the base template for CLH reports.
  - imports [common_module_front_page_html.ftl](../../common_modules/html/common_module_front_page_html.ftl)
  - imports [common_module_general_html.ftl](../../common_modules/html/common_module_general_html.ftl)
  - imports [common_module_human_health_hazard_assessment_html.ftl](../../common_modules/html/common_module_human_health_hazard_assessment_html.ftl)
    - includes [common_module_human_health_hazard_assessment_html_deprecated.ftl](../../common_modules/html/common_module_human_health_hazard_assessment_html_deprecated.ftl)
  - imports [macros_common_studies_and_summaries_html.ftl](../../common_modules/html/macros_common_studies_and_summaries_html.ftl)
  - imports [common_module_physical_chemical_summary_properties_html.ftl](../../common_modules/html/common_module_physical_chemical_summary_properties_html.ftl)
  - imports [common_module_standard_table_layout.ftl](../../common_modules/html/common_module_standard_table_layout.ftl)  
  - includes [stylesheet_html.ftl](../../stylesheets/html/stylesheet_html.ftl)
- [./07_clh_phys_chem_properties.ftl](07_clh_phys_chem_properties.ftl) - Contains the template for CLH report Chapter 7.
- [./09_clh_toxicokinetics.ftl](09_clh_toxicokinetics.ftl) - Contains the template for CLH report Chapter 9.
- [./10_clh_healthhazards.ftl](10_clh_healthhazards.ftl) - Contains the template for CLH report Chapter 10.
- [./README.md](README.md) - This readme for documentation and description of template files.

## Using the Templates

To utilize a template, navigate to the [Report generator - IUCLID](https://iuclid6.echa.europa.eu/de/reports). Follow the instructions to complete your report.

Please note: The use of these templates requires IUCLID version 6.8.

## Contribution

Should you make adjustments or improvements to a template that could be beneficial for other users, refer to [/how_to_contribute_to_common_modules.md](/how_to_contribute_to_common_modules.md) in the root of this repository.

## Support

If you have questions or encounter issues with the templates, you can create an issue in the repository, or contact the ECHA IUCLID team directly.
