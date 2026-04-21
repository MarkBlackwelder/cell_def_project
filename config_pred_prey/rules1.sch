<schema xmlns="http://purl.oclc.org/dsdl/schematron">
  <ns prefix="cell" uri="https://www.example.com/physicell"/>

  <pattern>
    <title>Rules validation</title>
    <rule context="rules">
      <assert test="starts-with(@signal, 'c')">
        Test failure
      </assert>
    </rule>
  </pattern>
</schema>
