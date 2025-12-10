<schema xmlns="http://purl.oclc.org/dsdl/schematron">
  <ns prefix="cell" uri="https://www.example.com/physicell"/>

  <pattern>
    <title>Rules validation</title>
    <rule context="rule">
      <assert test="starts-with(@signal, '&quot;') and substring(@signal, string-length(@signal)) = '&quot;'">
        Signal must be a string
      </assert>
      <assert test="starts-with(@behavior, '&quot;') and substring(@behavior, string-length(@signal)) = '&quot;'">
        Behavior must be a string
      </assert>
      <assert test="string(number(@maximal_behavior)) = @maximal_behavior">
        Maximal behavior must be a floating point value
      </assert>
      <assert test="@type = 'Hill'">
        Type must be "Hill"
      </assert>
      <assert test="string(number(@half_max)) = @half_max">
        Half max must be a floating point value
      </assert>
      <assert test="string(number(@Hill_power)) = @Hill_power">
        Hill power must be a floating point value
      </assert>
      <assert test="@enabled = 'true' or @enabled = 'false'">
        Enabled must be "true" or "false"
      </assert>
      <assert test="starts-with(@comment, '&quot;') and substring(@comment, string-length(@signal)) = '&quot;'">
        Comment must be a string
      </assert>
    </rule>
  </pattern>
</schema>
