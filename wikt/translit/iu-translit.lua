-- This module will transliterate Inuktitut language text.
-- Language code: iku
--[[
ISO 639-3	iku – inclusive code Inuktitut
Individual codes:
ike – Eastern Canadian Inuktitut
ikt – Inuinnaqtun
]]
local export = {}

function export.tr(text, lang, sc)
	text = require("Module:Cans-translit").tr(text, lang, sc)
	
	local repl = {
		["ī"] = "ii",
		["ō"] = "uu",
		["ā"] = "aa",
		["š"] = "sh",
		["ð"] = "th",
		["e"] = "ai",
		["o"] = "u",
		["y"] = "j",
		["f"] = "v",
		["c"] = "g",
	}
	
	for char, replacement in pairs(repl) do
		text = mw.ustring.gsub(text, char, replacement)
	end
	
	return text
end

return export

-- ᐁᕕᖃ: aiviqa
-- ᐃᐦᐃᑉᕆᐅᖅᑐᖅ: ihipriuqtuq
-- ᐃᐱᕋᐅᑕᖅ: ipirautaq
-- ᐃᑉᐸᒃᓴᖅ: ippaksaq
-- ᐃᒡᓕᖅ: igliq
-- ᐃᒡᓗ: iglu
-- ᐃᒥᖅ: imiq
-- ᐃᒥᖅᑐᖅ: imiqtuq
-- ᐃᒪᖅ: imaq
-- ᐃᒻᒧᒃ: immuk
-- ᐃᒻᒪᖄ: immaqaa
-- ᐃᓄᒃ: inuk
-- ᐃᓄᒃᑎᑐᑦ: inuktitut
-- ᐃᓄᒃᓱᒃ: inuksuk
-- ᐃᓄᖅ: inuq
-- ᐃᓕᔅᓯ: ilissi
-- ᐃᓗ: ilu
-- ᐃᓪᓗ: illu
-- ᐃᓴᕈᖅ: isaruq
-- ᐃᔨ: iji
-- ᐃᕐᒥᐅᑦ: irmiut
-- ᐃᕐᓂᖅ: irniq
-- ᐃᕝᕕᑦ: ivvit
-- ᐃᖃᓗᐃᑦ: iqaluit
-- ᐃᖃᓗᒃ: iqaluk
-- ᐄ: ii
-- ᐅᐃᒃ: uik
-- ᐅᐃᕖᑎᑐᓪᓗ: uiviititullu
-- ᐅᐱᕐᓐᖄᖅ: upirnqaaq
-- ᐅᑭᐅᖅ: ukiuq
-- ᐅᒃᐱᒃ: ukpik
-- ᐅᒥᒃ: umik
-- ᐅᓈᖅ: unaaq
-- ᐅᓐᓄᖅ: unnuq
-- ᐅᓗ: ulu
-- ᐅᓪᓗᒥ: ullumi
-- ᐅᓪᓗᕆᐊᖅ: ulluriaq
-- ᐅᓵᐃᐅ: usaaiu
-- ᐅᕙᒍᑦ: uvagut
-- ᐅᕙᖓ: uvanga
-- ᐅᖃᐅᓯᖅ: uqausiq
-- ᐅᖅᓱᖅ: uqsuq
-- ᐆᒪᔪᖅ: uumajuq
-- ᐆᒻᒪᑎ: uummati
-- ᐊᐅᒃ: auk
-- ᐊᐅᔪᐃᑦᑐᖅ: aujuittuq
-- ᐊᐅᔭ: auja
-- ᐊᐳᑦ: aput
-- ᐊᑎᖅᐳᖅ: atiqpuq
-- ᐊᑖᑕ: ataata
-- ᐊᑭᓯᖅ: akisiq
-- ᐊᒡᒐᒃ: aggak
-- ᐊᒡᓘᒃᑲᖅ: agluukkaq
-- ᐊᒥᐃᐅᓕᐅᕈ: amiiuliuru
-- ᐊᒪᕈᖅ: amaruq
-- ᐊᓄᕆ: anuri
-- ᐊᓇᐅᓪᓚᐅᑦ: anaullaut
-- ᐊᓈᓇ: anaana
-- ᐊᓘᑦ: aluut
-- ᐊᓪᓕᖅ: alliq
-- ᐊᕐᓇᖅ: arnaq
-- ᐊᕐᕕᒃ: arvik
-- ᐊᕕᙵᖅ: avinngaq
-- ᐊᖏᖅᑲᖅᑐᖅ: angiqkaqtuq
-- ᐊᖑᑦ: angut
-- ᐊᖑᓇᓱᒃᑐᖅ: angunasuktuq
-- ᐊᖓᔪᖅ: angajuq
-- ᐋᒃᑲ: aakka
-- ᐯᑉᐹᖅ: paippaaq
-- ᐱ: pi
-- ᐱᓱᒃ: pisuk
-- ᐳᐊᓘᒃ: pualuuk
-- ᐸᓂᖅ: paniq
-- ᑎᑎᕋᐅᑦ: titiraut
-- ᑎᑭᖅ: tikiq
-- ᑎᒥ: timi
-- ᑎᕆᒐᓂᐊᖅ: tiriganiaq
-- ᑎᕆᒐᓐᓂᐊᖅ: tiriganniaq
-- ᑎᖕᒥᐊᖅ: tingmiaq
-- ᑎᖕᒥᓲᖅ: tingmisuuq
-- ᑏ: tii
-- ᑐᐊᐸᑦ: tuapat
-- ᑐᑐ: tutu
-- ᑐᒃᑐ: tuktu
-- ᑐᕙᖅ: tuvaq
-- ᑑᒑᓕᒃ: tuugaalik
-- ᑑᒑᖅ: tuugaaq
-- ᑕᒃᑐᒃ: taktuk
-- ᑕᓪᓗ: tallu
-- ᑕᓯᖅ: tasiq
-- ᑕᕆᐅᖅ: tariuq
-- ᑕᕝᕙ: tavva
-- ᑭᓇ: kina
-- ᑭᖓᖅ: kingaq
-- ᑮᓇᐅᔭᖅ: kiinaujaq
-- ᑮᓇᖅ: kiinaq
-- ᑰᒃ: kuuk
-- ᑲᒥᒃ: kamik
-- ᑲᓇᑕ: kanata
-- ᑳᐱ: kaapi
-- ᑳᒃᑐᖅ: kaaktuq
-- ᒪᐅᔭ: mauja
-- ᒪᒻᒪᓛᑎᒃ: mammalaatik
-- ᓂᐅ: niu
-- ᓂᐅᒃ: niuk
-- ᓂᐊᖁᖅ: niaquq
-- ᓂᐊᖂᔮᖅ: niaquujaaq
-- ᓂᕆᔪᖅ: nirijuq
-- ᓂᕿ: niqi
-- ᓄᑲᖅ: nukaq
-- ᓄᓇ: nuna
-- ᓄᓇᑐᑲᕗᑦ: nunatukavut
-- ᓄᓇᑦᓯᐊᕗᑦ: nunatsiavut
-- ᓄᓇᕕᒃ: nunavik
-- ᓄᓇᕕᒻᒥᐅᑦ: nunavimmiut
-- ᓄᓇᕗᑦ: nunavut
-- ᓄᓇᕗᒻᒥᐅᖅ: nunavummiuq
-- ᓄᓕᐊᖅ: nuliaq
-- ᓄᔭᑦ: nujat
-- ᓇᓂ: nani
-- ᓇᓄᒃ: nanuk
-- ᓇᓄᖅ: nanuq
-- ᓕᐅᓇ: liuna
-- ᓯᐅᑦ: siut
-- ᓯᐱᓂᖅ: sipiniq
-- ᓯᓈ: sinaa
-- ᓯᓚ: sila
-- ᓯᓚᒥ: silami
-- ᓯᕿᓂᖅ: siqiniq
-- ᓱᓇᒐᖅ: sunagaq
-- ᓲᓴᓐ: suusan
-- ᓴᐃᒧ: saimu
-- ᓴᑯ: saku
-- ᓴᕕᒃ: savik
-- ᔪᐊᑕᓐ: juatan
-- ᔭᓐᓄᐊᓕ: jannuali
-- ᕼᐊᓐᑕ: hanta
-- ᕼᐋᑭ: haaki
-- ᕿᒃᑐᕆᐊᖅ: qikturiaq
-- ᕿᒃᑐᕆᐊᖅᑕᐅᓂᖅ: qikturiaqtauniq
-- ᕿᒻᒥᒃ: qimmik
-- ᕿᒻᒧᒃᓯᑦ: qimmuksit
-- ᕿᓚᓗᒐᖅ: qilalugaq
-- ᕿᓯᒃ: qisik
-- ᕿᖓᖅ: qingaq
-- ᖁᑭᐅᑦ: qukiut
-- ᖁᔭᓐᓇᒦᒃ: qujannamiik
-- ᖃᐅᒃᐸᑦ: qaukpat
-- ᖃᐅᓯᖅᑐᖅ: qausiqtuq
-- ᖃᐅᔨᒪᓂᑐᖃᖏᑦ: qaujimanituqangit
-- ᖃᐅᔨᒪᔭᑐᖃᖏᑦ: qaujimajatuqangit
-- ᖃᒧᑏᒃ: qamutiik
-- ᖃᓂᖅ: qaniq
-- ᖃᓪᓗᓈᖅ: qallunaaq
-- ᖃᔭᖅ: qajaq
-- ᖃᖓ: qanga
-- ᖄᓐᕿᔭᐅᑦ: qaanqijaut
-- local export = {}

-- local result = ""

-- local function _add(t)
-- 	return function(text)
-- 		table.insert(t, "* [["..text.."#Inuktitut|"..text.."]]: " .. require("Module:iu-translit").tr(text, "iu", "Cans"))
-- 	end
-- end

-- function export.show()
-- 	local output = {}
-- 	local add = _add(output)
-- 	add("ᐁᕕᖃ")
-- 	add("ᐃᐦᐃᑉᕆᐅᖅᑐᖅ")
-- 	add("ᐃᐱᕋᐅᑕᖅ")
-- 	add("ᐃᑉᐸᒃᓴᖅ")
-- 	add("ᐃᒡᓕᖅ")
-- 	add("ᐃᒡᓗ")
-- 	add("ᐃᒥᖅ")
-- 	add("ᐃᒥᖅᑐᖅ")
-- 	add("ᐃᒪᖅ")
-- 	add("ᐃᒻᒧᒃ")
-- 	add("ᐃᒻᒪᖄ")
-- 	add("ᐃᓄᒃ")
-- 	add("ᐃᓄᒃᑎᑐᑦ")
-- 	add("ᐃᓄᒃᓱᒃ")
-- 	add("ᐃᓄᖅ")
-- 	add("ᐃᓕᔅᓯ")
-- 	add("ᐃᓗ")
-- 	add("ᐃᓪᓗ")
-- 	add("ᐃᓴᕈᖅ")
-- 	add("ᐃᔨ")
-- 	add("ᐃᕐᒥᐅᑦ")
-- 	add("ᐃᕐᓂᖅ")
-- 	add("ᐃᕝᕕᑦ")
-- 	add("ᐃᖃᓗᐃᑦ")
-- 	add("ᐃᖃᓗᒃ")
-- 	add("ᐄ")
-- 	add("ᐅᐃᒃ")
-- 	add("ᐅᐃᕖᑎᑐᓪᓗ")
-- 	add("ᐅᐱᕐᓐᖄᖅ")
-- 	add("ᐅᑭᐅᖅ")
-- 	add("ᐅᒃᐱᒃ")
-- 	add("ᐅᒥᒃ")
-- 	add("ᐅᓈᖅ")
-- 	add("ᐅᓐᓄᖅ")
-- 	add("ᐅᓗ")
-- 	add("ᐅᓪᓗᒥ")
-- 	add("ᐅᓪᓗᕆᐊᖅ")
-- 	add("ᐅᓵᐃᐅ")
-- 	add("ᐅᕙᒍᑦ")
-- 	add("ᐅᕙᖓ")
-- 	add("ᐅᖃᐅᓯᖅ")
-- 	add("ᐅᖅᓱᖅ")
-- 	add("ᐆᒪᔪᖅ")
-- 	add("ᐆᒻᒪᑎ")
-- 	add("ᐊᐅᒃ")
-- 	add("ᐊᐅᔪᐃᑦᑐᖅ")
-- 	add("ᐊᐅᔭ")
-- 	add("ᐊᐳᑦ")
-- 	add("ᐊᑎᖅᐳᖅ")
-- 	add("ᐊᑖᑕ")
-- 	add("ᐊᑭᓯᖅ")
-- 	add("ᐊᒡᒐᒃ")
-- 	add("ᐊᒡᓘᒃᑲᖅ")
-- 	add("ᐊᒥᐃᐅᓕᐅᕈ")
-- 	add("ᐊᒪᕈᖅ")
-- 	add("ᐊᓄᕆ")
-- 	add("ᐊᓇᐅᓪᓚᐅᑦ")
-- 	add("ᐊᓈᓇ")
-- 	add("ᐊᓘᑦ")
-- 	add("ᐊᓪᓕᖅ")
-- 	add("ᐊᕐᓇᖅ")
-- 	add("ᐊᕐᕕᒃ")
-- 	add("ᐊᕕᙵᖅ")
-- 	add("ᐊᖏᖅᑲᖅᑐᖅ")
-- 	add("ᐊᖑᑦ")
-- 	add("ᐊᖑᓇᓱᒃᑐᖅ")
-- 	add("ᐊᖓᔪᖅ")
-- 	add("ᐋᒃᑲ")
-- 	add("ᐯᑉᐹᖅ")
-- 	add("ᐱ")
-- 	add("ᐱᓱᒃ")
-- 	add("ᐳᐊᓘᒃ")
-- 	add("ᐸᓂᖅ")
-- 	add("ᑎᑎᕋᐅᑦ")
-- 	add("ᑎᑭᖅ")
-- 	add("ᑎᒥ")
-- 	add("ᑎᕆᒐᓂᐊᖅ")
-- 	add("ᑎᕆᒐᓐᓂᐊᖅ")
-- 	add("ᑎᖕᒥᐊᖅ")
-- 	add("ᑎᖕᒥᓲᖅ")
-- 	add("ᑏ")
-- 	add("ᑐᐊᐸᑦ")
-- 	add("ᑐᑐ")
-- 	add("ᑐᒃᑐ")
-- 	add("ᑐᕙᖅ")
-- 	add("ᑑᒑᓕᒃ")
-- 	add("ᑑᒑᖅ")
-- 	add("ᑕᒃᑐᒃ")
-- 	add("ᑕᓪᓗ")
-- 	add("ᑕᓯᖅ")
-- 	add("ᑕᕆᐅᖅ")
-- 	add("ᑕᕝᕙ")
-- 	add("ᑭᓇ")
-- 	add("ᑭᖓᖅ")
-- 	add("ᑮᓇᐅᔭᖅ")
-- 	add("ᑮᓇᖅ")
-- 	add("ᑰᒃ")
-- 	add("ᑲᒥᒃ")
-- 	add("ᑲᓇᑕ")
-- 	add("ᑳᐱ")
-- 	add("ᑳᒃᑐᖅ")
-- 	add("ᒪᐅᔭ")
-- 	add("ᒪᒻᒪᓛᑎᒃ")
-- 	add("ᓂᐅ")
-- 	add("ᓂᐅᒃ")
-- 	add("ᓂᐊᖁᖅ")
-- 	add("ᓂᐊᖂᔮᖅ")
-- 	add("ᓂᕆᔪᖅ")
-- 	add("ᓂᕿ")
-- 	add("ᓄᑲᖅ")
-- 	add("ᓄᓇ")
-- 	add("ᓄᓇᑐᑲᕗᑦ")
-- 	add("ᓄᓇᑦᓯᐊᕗᑦ")
-- 	add("ᓄᓇᕕᒃ")
-- 	add("ᓄᓇᕕᒻᒥᐅᑦ")
-- 	add("ᓄᓇᕗᑦ")
-- 	add("ᓄᓇᕗᒻᒥᐅᖅ")
-- 	add("ᓄᓕᐊᖅ")
-- 	add("ᓄᔭᑦ")
-- 	add("ᓇᓂ")
-- 	add("ᓇᓄᒃ")
-- 	add("ᓇᓄᖅ")
-- 	add("ᓕᐅᓇ")
-- 	add("ᓯᐅᑦ")
-- 	add("ᓯᐱᓂᖅ")
-- 	add("ᓯᓈ")
-- 	add("ᓯᓚ")
-- 	add("ᓯᓚᒥ")
-- 	add("ᓯᕿᓂᖅ")
-- 	add("ᓱᓇᒐᖅ")
-- 	add("ᓲᓴᓐ")
-- 	add("ᓴᐃᒧ")
-- 	add("ᓴᑯ")
-- 	add("ᓴᕕᒃ")
-- 	add("ᔪᐊᑕᓐ")
-- 	add("ᔭᓐᓄᐊᓕ")
-- 	add("ᕼᐊᓐᑕ")
-- 	add("ᕼᐋᑭ")
-- 	add("ᕿᒃᑐᕆᐊᖅ")
-- 	add("ᕿᒃᑐᕆᐊᖅᑕᐅᓂᖅ")
-- 	add("ᕿᒻᒥᒃ")
-- 	add("ᕿᒻᒧᒃᓯᑦ")
-- 	add("ᕿᓚᓗᒐᖅ")
-- 	add("ᕿᓯᒃ")
-- 	add("ᕿᖓᖅ")
-- 	add("ᖁᑭᐅᑦ")
-- 	add("ᖁᔭᓐᓇᒦᒃ")
-- 	add("ᖃᐅᒃᐸᑦ")
-- 	add("ᖃᐅᓯᖅᑐᖅ")
-- 	add("ᖃᐅᔨᒪᓂᑐᖃᖏᑦ")
-- 	add("ᖃᐅᔨᒪᔭᑐᖃᖏᑦ")
-- 	add("ᖃᒧᑏᒃ")
-- 	add("ᖃᓂᖅ")
-- 	add("ᖃᓪᓗᓈᖅ")
-- 	add("ᖃᔭᖅ")
-- 	add("ᖃᖓ")
-- 	add("ᖄᓐᕿᔭᐅᑦ")
-- 	return table.concat(output, "\n")
-- end

-- return export