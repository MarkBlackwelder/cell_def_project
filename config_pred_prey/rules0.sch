<schema xmlns="http://purl.oclc.org/dsdl/schematron">

  <pattern>
    <title>Rules validation</title>
    <rule>
      <assert test="starts-with(@signal, 'c')">
        Test failure
      </assert>
    </rule>
  </pattern>
</schema>
