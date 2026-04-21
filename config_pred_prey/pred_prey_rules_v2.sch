<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron"
        schemaVersion="iso"
        queryBinding="xslt2">

    <title>PhysiCell pred_prey rules v2 validation</title>

    <!-- ================================================================
         Pattern: Root element
         ================================================================ -->
    <pattern id="pa_root">
        <rule context="/">
            <assert test="PhysiCell_settings">
                Root element must be 'PhysiCell_settings'.
            </assert>
        </rule>
        <rule context="PhysiCell_settings">
            <assert test="@version">
                PhysiCell_settings must have a 'version' attribute.
            </assert>
            <assert test="cell_definitions">
                PhysiCell_settings must contain a 'cell_definitions' element.
            </assert>
        </rule>
    </pattern>

    <!-- ================================================================
         Pattern: cell_definition element
         ================================================================ -->
    <pattern id="pa_cell_definition">
        <rule context="cell_definition">
            <assert test="@name">
                Every cell_definition must have a 'name' attribute.
            </assert>
            <assert test="string-length(normalize-space(@name)) > 0">
                The cell_definition 'name' attribute must not be empty.
            </assert>
            <assert test="@ID">
                Every cell_definition must have an 'ID' attribute.
            </assert>
            <assert test="string(number(@ID)) != 'NaN' and number(@ID) >= 0">
                The cell_definition 'ID' must be a non-negative integer (got '<value-of select="@ID"/>').
            </assert>
            <assert test="cell_rules">
                cell_definition '<value-of select="@name"/>' must contain a 'cell_rules' element.
            </assert>
        </rule>

    </pattern>

    <!-- ================================================================
         Pattern: cell_definition uniqueness (checked from parent)
         ================================================================ -->
    <pattern id="pa_cell_definition_unique">
        <rule context="cell_definitions">
            <assert test="count(cell_definition/@ID) = count(distinct-values(cell_definition/@ID))">
                Duplicate cell_definition ID values found: IDs must be unique.
            </assert>
            <assert test="count(cell_definition/@name) = count(distinct-values(cell_definition/@name))">
                Duplicate cell_definition name values found: names must be unique.
            </assert>
        </rule>
    </pattern>

    <!-- ================================================================
         Pattern: cell_rules element
         ================================================================ -->
    <pattern id="pa_cell_rules">
        <rule context="cell_rules">
            <assert test="@standard">
                cell_rules must have a 'standard' attribute.
            </assert>
            <assert test="@version">
                cell_rules must have a 'version' attribute.
            </assert>
            <assert test="rules">
                cell_rules must contain a 'rules' element.
            </assert>
        </rule>

        <rule context="rules">
            <assert test="@enabled = 'true' or @enabled = 'false'">
                The 'rules' element 'enabled' attribute must be 'true' or 'false' (got '<value-of select="@enabled"/>').
            </assert>
        </rule>
    </pattern>

    <!-- ================================================================
         Pattern: individual rule elements
         ================================================================ -->
    <pattern id="pa_rule">
        <rule context="//rules/rule">

            <!-- Required attributes -->
            <assert test="@signal">
                Every rule must have a 'signal' attribute.
            </assert>
            <assert test="string-length(normalize-space(@signal)) > 0">
                The rule 'signal' attribute must not be empty.
            </assert>

            <assert test="@behavior">
                Every rule must have a 'behavior' attribute.
            </assert>
            <assert test="string-length(normalize-space(@behavior)) > 0">
                The rule 'behavior' attribute must not be empty.
            </assert>

            <assert test="@maximal_behavior">
                Every rule must have a 'maximal_behavior' attribute.
            </assert>
            <assert test="string(number(@maximal_behavior)) != 'NaN'">
                'maximal_behavior' must be a number (got '<value-of select="@maximal_behavior"/>').
            </assert>
            <assert test="number(@maximal_behavior) >= 0 and number(@maximal_behavior) &lt;= 1">
                'maximal_behavior' must be between 0 and 1 (got '<value-of select="@maximal_behavior"/>').
            </assert>

            <assert test="@type">
                Every rule must have a 'type' attribute.
            </assert>
            <assert test="@type = 'Hill' or @type = 'linear' or @type = 'constant'">
                Rule 'type' must be 'Hill', 'linear', or 'constant' (got '<value-of select="@type"/>').
            </assert>

            <assert test="@half_max">
                Every rule must have a 'half_max' attribute.
            </assert>
            <assert test="string(number(@half_max)) != 'NaN'">
                'half_max' must be a number (got '<value-of select="@half_max"/>').
            </assert>
            <assert test="number(@half_max) > 0">
                'half_max' must be positive (got '<value-of select="@half_max"/>').
            </assert>

            <assert test="@Hill_power">
                Every rule must have a 'Hill_power' attribute.
            </assert>
            <assert test="string(number(@Hill_power)) != 'NaN'">
                'Hill_power' must be a number (got '<value-of select="@Hill_power"/>').
            </assert>
            <assert test="number(@Hill_power) > 0">
                'Hill_power' must be positive (got '<value-of select="@Hill_power"/>').
            </assert>

            <assert test="@enabled">
                Every rule must have an 'enabled' attribute.
            </assert>
            <assert test="@enabled = 'true' or @enabled = 'false'">
                Rule 'enabled' must be 'true' or 'false' (got '<value-of select="@enabled"/>').
            </assert>

        </rule>
    </pattern>

</schema>
