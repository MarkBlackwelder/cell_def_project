<schema xmlns="http://purl.oclc.org/dsdl/schematron">
  <ns prefix="lib" uri="http://www.example.com/library"/>

  <pattern>
    <title>Book validation</title>
    <rule context="lib:book">
      <assert test="lib:isbn">Each book must have an ISBN number.</assert>
      <assert test="lib:title">Each book must have a title.</assert>
      <assert test="lib:price &gt; 10 and lib:price &lt; 1000">
        The book's price must be between 10 and 1000.
      </assert>
    </rule>
  </pattern>
</schema>

