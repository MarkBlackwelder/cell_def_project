#!/usr/bin/env python3.12
"""Validate pred_prey_rules_v2.xml using pyschematron."""

import sys
from pathlib import Path
from lxml import etree
from pyschematron import validate_document

BASE = Path(__file__).parent
XML_PATH = BASE / 'config' / 'pred_prey_rules_v2.xml'
SCH_PATH = BASE / 'config' / 'pred_prey_rules_v2.sch'


def main():
    print(f'Validating: {XML_PATH}')
    print(f'Schema:     {SCH_PATH}\n')

    result = validate_document(XML_PATH, SCH_PATH)
    svrl = result.get_svrl()

    # Collect failed assertions and fired reports from the SVRL output
    ns = 'http://purl.oclc.org/dsdl/svrl'
    failed = svrl.findall(f'{{{ns}}}failed-assert')
    reports = svrl.findall(f'{{{ns}}}successful-report')

    if not failed and not reports:
        print('PASSED: all assertions satisfied.')
    else:
        for fa in failed:
            location = fa.get('location', '')
            text = (fa.findtext(f'{{{ns}}}text') or '').strip()
            print(f'FAILED [{location}]: {text}')
        for sr in reports:
            location = sr.get('location', '')
            text = (sr.findtext(f'{{{ns}}}text') or '').strip()
            print(f'REPORT [{location}]: {text}')
        print(f'\n{len(failed)} failed assertion(s), {len(reports)} report(s).')

    print(f'\nValid: {result.is_valid()}')
    return 0 if result.is_valid() else 1


if __name__ == '__main__':
    sys.exit(main())
