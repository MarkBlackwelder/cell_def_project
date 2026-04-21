<schema xmlns="http://purl.oclc.org/dsdl/schematron">
  <ns prefix="city" uri="https://www.example.com/chicago"/>

  <pattern>
    <title>Code validation</title>
      <rule context="city:building">
        <assert test="city:condemned = 'true' or city:condemned = 'false'">
          Invalid entry for condemned, not true or false
        </assert>
        <report test="city:condemned = 'true'">
          Unsafe building due to being condemned, not held up to code
        </report>
        <assert test="city:inspection = number(city:inspection) and city:inspection &gt; 0">
          Invalid entry for inspection date, not a non-negative number
        </assert>
        <report test="city:inspection &gt; 1">
          Unsafe building due to not being inspected within a year
        </report>
        <assert test="city:exits = number(city:exits) and (city:exits &gt; 0 and city:exits mod 1 = 0)">
          Invalid entry for number of fire exits, not a positive integer
        </assert>
        <report test="city:exits &lt; 2">
          Unsafe building due to not having enough fire exits
        </report>
      </rule>
  </pattern>
</schema>
