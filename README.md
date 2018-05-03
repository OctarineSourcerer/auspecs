# Auspecs
A flexible and intuitive system for roleplaying character sheets, that should carry across many kinds of systems. It's engineered for usability, and for the user to gain an intrinsic understanding of their character's build.

## Modifiers and Breakdowns
The way Auspecs works is that each numeric field on a sheet can be modified by entries added to the sheet, and looking deeper into that field will show you a breakdown of all the modifiers that contribute to that final value.

Take a field `AC`, with a base value of `10`. The user may add an entry to the sheet, for example *Full plate armour*. That entry can be given modifiers - in this case, one would be `AC +9`. This would be reflected in the `AC` field, which would now have a value of `19`. More importantly, you would be able to see a breakdown of what contributed to it, something like:
```
AC: 10  +  9  = 19
   Base   Full
          Plate
```