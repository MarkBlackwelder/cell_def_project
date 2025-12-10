<schema xmlns="http://purl.oclc.org/dsdl/schematron">
  <ns prefix="city" uri="https://www.example.com/chicago"/>

  <pattern>
    <title>Code validation</title>
      <rule context="city:building">
        <assert test="city:condemned = 'True' or city:condemned = 'False'">
          Invalid entry for condemned, not True or False
        </assert>
        <report test="city:condemned = 'True'">
          Unsafe building due to being condemned, not held up to code
        </report>
        <assert test="city:inspection &gt; 0">
          Invalid entry for inspection date, not a positive number
        </assert>
        <report test="city:inspection &gt; 1">
          Unsafe building due to not being inspected within a year
        </report>
        <assert test="city:exits = string(number(city:exits)) and (city:exits &gt; 0 and city:exits mod 1 = 0)">
          Invalid entry for number of fire exits, not a positive integer
        </assert>
        <report test="city:exits &lt; 2 and city:exits mod 1 = 0">
          Unsafe building due to not having enough fire exits
        </report>
      </rule>
  </pattern>
</schema>
