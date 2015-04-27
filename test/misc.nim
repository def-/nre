import unittest, nre, strutils, optional_t.nonstrict

suite "Misc tests":
  test "unicode":
    check("".find(re"".opts"8").match == "")
    check("перевірка".replace(re"\w".opts"uW", "") == "")

  test "empty or non-empty match":
    check("abc".findall(re"|.").join(":") == ":a::b::c:")
    check("abc".findall(re".|").join(":") == "a:b:c:")

    check("abc".replace(re"|.", "x") == "xxxxxxx")
    check("abc".replace(re".|", "x") == "xxxx")

    check("abc".split(re"|.").join(":") == ":::::")
    check("abc".split(re".|").join(":") == ":::")
