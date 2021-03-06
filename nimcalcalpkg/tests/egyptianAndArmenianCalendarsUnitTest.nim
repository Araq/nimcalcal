import unittest
import nimcalcal


suite "EgyptianSmokeTestCase":
    setup:
        let testvalue = 710347
        let aDate = egyptian_date(2694, 7, 10)

    test "testConversionFromFixed":
        check egyptian_from_fixed(testvalue) == aDate

    test "testConversionToFixed":
        check testvalue == fixed_from_egyptian(aDate)

suite "ArmenianSmokeTestCase":
    setup:
        let testvalue = 710347
        let aDate = armenian_date(1395, 4, 5)

    test "testConversionFromFixed":
        check armenian_from_fixed(testvalue) == aDate

    test "testConversionToFixed":
        check testvalue == fixed_from_armenian(aDate)

when not defined(js):
    import strutils
    import readTestDataHelper

    suite "FileBasedTests":
        setup:
            let data = readTestData("nimcalcalpkg/tests/dates1.csv")

        test "testArmenian":
            for d in data:
                let fixed = parseInt(d[0])
                let ad = armenian_date(parseInt(d[21]), parseInt(d[22]), parseInt(d[23]))
                check armenian_from_fixed(fixed) == ad
                check fixed_from_armenian(ad) == fixed


        test "testEgyptian":
            for d in data:
                let fixed = parseInt(d[0])
                let ed = egyptian_date(parseInt(d[18]), parseInt(d[19]), parseInt(d[20]))

                check egyptian_from_fixed(fixed) == ed
                check fixed_from_egyptian(ed) == fixed

