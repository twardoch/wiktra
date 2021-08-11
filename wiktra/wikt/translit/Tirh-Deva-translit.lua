local export = {}
local gsub = mw.ustring.gsub
local match = mw.ustring.match

local conv = {

    -- consonants
    ["𑒏"] = "क",
    ["𑒐"] = "ख",
    ["𑒑"] = "ग",
    ["𑒒"] = "घ",
    ["𑒓"] = "ङ",
    ["𑒔"] = "च",
    ["𑒕"] = "छ",
    ["𑒖"] = "ज",
    ["𑒗"] = "झ",
    ["𑒘"] = "ञ",
    ["𑒙"] = "ट",
    ["𑒚"] = "ठ",
    ["𑒛"] = "ड",
    ["𑒜"] = "ढ",
    ["𑒝"] = "ण",
    ["𑒞"] = "त",
    ["𑒟"] = "थ",
    ["𑒠"] = "द",
    ["𑒡"] = "ध",
    ["𑒢"] = "न",
    ["𑒣"] = "प",
    ["𑒤"] = "फ",
    ["𑒥"] = "ब",
    ["𑒦"] = "भ",
    ["𑒧"] = "म",
    ["𑒨"] = "य",
    ["𑒩"] = "र",
    ["𑒪"] = "ल",
    ["𑒫"] = "व",
    ["𑒪𑓃"] = "ळ",
    ["𑒬"] = "श",
    ["𑒭"] = "ष",
    ["𑒮"] = "स",
    ["𑒯"] = "ह",
    ["𑒛𑓃"] = "ड़",
    ["𑒜𑓃"] = "ढ़",
    ["𑓃"] = "़",
    -- vowel diacritics
    ["𑒱"] = "ि",
    ["𑒳"] = "ु",
    ["𑒹"] = "े",
    ["𑒺"] = "ॆ",
    ["𑒼"] = "ो",
    ["𑒽"] = "ॊ",
    ["𑒰"] = "ा",
    ["𑒲"] = "ी",
    ["𑒴"] = "ू",
    ["𑒵"] = "ृ",
    ["𑒶"] = "ॄ",
    ["𑒻"] = "ै",
    ["𑒾"] = "ौ",
    ["𑒷"] = "ॢ",
    ["𑒸"] = "ॣ",
    ["ॏ"] = "ॏ",
    ["ऺ"] = "ऺ",
    ["ॅ"] = "ॅ",
    -- vowels
    ["𑒁"] = "अ",
    ["𑒂"] = "आ",
    ["𑒃"] = "इ",
    ["𑒄"] = "ई",
    ["𑒅"] = "उ",
    ["𑒆"] = "ऊ",
    ["𑒇"] = "ऋ",
    ["𑒈"] = "ॠ",
    ["𑒉"] = "ऌ",
    ["𑒊"] = "ॡ",
    ["𑒋"] = "ए",
    ["𑒌"] = "ऐ",
    ["𑒍"] = "ओ",
    ["𑒎"] = "औ",

    ["ऎ"] = "ऎ",
    ["ऒ"] = "ऒ",
    ["व़"] = "व़",
    ["य़"] = "य़",
    ["ॵ"] = "ॵ",
    ["ॴ"] = "ॴ",
    ["ऍ"] = "ऍ",
    ["इऺ"] = "इऺ",
    ["उऺ"] = "उऺ",
    ["२"] = "’",
    ["ऽ"] = "ऽ",
    -- chandrabindu 
    ["𑒿"] = "ँ",
    -- anusvara
    ["𑓀"] = "ं",
    -- gvang
    ["𑓅"] = "ँ",
    -- visarga
    ["𑓁"] = "ः",
    -- virama
    ["𑓂"] = "्",
    -- om
    ["𑓇"] = "ॐ",
    -- numerals
    ["𑓐"] = "०",
    ["𑓑"] = "१",
    ["𑓒"] = "२",
    ["𑓓"] = "३",
    ["𑓔"] = "४",
    ["𑓕"] = "५",
    ["𑓖"] = "६",
    ["𑓗"] = "७",
    ["𑓘"] = "८",
    ["𑓙"] = "९",
    -- punctuation
    ["।"] = "।", -- danda
    ["॥"] = "॥", -- double danda
    ["+"] = "+", -- compound separator
    -- abbreviation sign
    ["॰"] = "॰"
}
function export.tr(text, lang, sc)
    text = mw.ustring.gsub(text, ".", function(c) return conv[c] end)
    return text
end

return export