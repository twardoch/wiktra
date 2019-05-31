-- This module will transliterate text in the Cherokee script. It is used to transliterate Cherokee (chr).

local export = {}
 
local tt = {
	["Ꭰ"]="a", ["ꭰ"]="a",
	["Ꭱ"]="e", ["ꭱ"]="e",
	["Ꭲ"]="i", ["ꭲ"]="i",
	["Ꭳ"]="o", ["ꭳ"]="o",
	["Ꭴ"]="u", ["ꭴ"]="u",
	["Ꭵ"]="v", ["ꭵ"]="v",
	
	["Ꭶ"]="ga", ["ꭶ"]="ga",
	["Ꭷ"]="ka", ["ꭷ"]="ka",
	["Ꭸ"]="ge", ["ꭸ"]="ge",
	["Ꭹ"]="gi", ["ꭹ"]="gi",
	["Ꭺ"]="go", ["ꭺ"]="go",
	["Ꭻ"]="gu", ["ꭻ"]="gu",
	["Ꭼ"]="gv", ["ꭼ"]="gv",
	
	["Ꭽ"]="ha", ["ꭽ"]="ha",
	["Ꭾ"]="he", ["ꭾ"]="he",
	["Ꭿ"]="hi", ["ꭿ"]="hi",
	["Ꮀ"]="ho", ["ꮀ"]="ho",
	["Ꮁ"]="hu", ["ꮁ"]="hu",
	["Ꮂ"]="hv", ["ꮂ"]="hv",
	
	["Ꮃ"]="la", ["ꮃ"]="la",
	["Ꮄ"]="le", ["ꮄ"]="le",
	["Ꮅ"]="li", ["ꮅ"]="li",
	["Ꮆ"]="lo", ["ꮆ"]="lo",
	["Ꮇ"]="lu", ["ꮇ"]="lu",
	["Ꮈ"]="lv", ["ꮈ"]="lv",
	
	["Ꮉ"]="ma", ["ꮉ"]="ma",
	["Ꮊ"]="me", ["ꮊ"]="me",
	["Ꮋ"]="mi", ["ꮋ"]="mi",
	["Ꮌ"]="mo", ["ꮌ"]="mo",
	["Ꮍ"]="mu", ["ꮍ"]="mu",
	["Ᏽ"]="mv", ["ᏽ"]="mv",
	
	["Ꮎ"]="na", ["ꮎ"]="na",
	["Ꮏ"]="hna", ["ꮏ"]="hna",
	["Ꮐ"]="nah", ["ꮐ"]="nah",
	["Ꮑ"]="ne", ["ꮑ"]="ne",
	["Ꮒ"]="ni", ["ꮒ"]="ni",
	["Ꮓ"]="no", ["ꮓ"]="no",
	["Ꮔ"]="nu", ["ꮔ"]="nu",
	["Ꮕ"]="nv", ["ꮕ"]="nv",
	
	["Ꮖ"]="qua", ["ꮖ"]="qua",
	["Ꮗ"]="que", ["ꮗ"]="que",
	["Ꮘ"]="qui", ["ꮘ"]="qui",
	["Ꮙ"]="quo", ["ꮙ"]="quo",
	["Ꮚ"]="quu", ["ꮚ"]="quu",
	["Ꮛ"]="quv", ["ꮛ"]="quv",
	
	["Ꮝ"]="s", ["ꮝ"]="s",
	["Ꮜ"]="sa", ["ꮜ"]="sa",
	["Ꮞ"]="se", ["ꮞ"]="se",
	["Ꮟ"]="si", ["ꮟ"]="si",
	["Ꮠ"]="so", ["ꮠ"]="so",
	["Ꮡ"]="su", ["ꮡ"]="su",
	["Ꮢ"]="sv", ["ꮢ"]="sv",
	
	["Ꮣ"]="da", ["ꮣ"]="da",
	["Ꮤ"]="ta", ["ꮤ"]="ta",
	["Ꮥ"]="de", ["ꮥ"]="de",
	["Ꮦ"]="te", ["ꮦ"]="te",
	["Ꮧ"]="di", ["ꮧ"]="di",
	["Ꮨ"]="ti", ["ꮨ"]="ti",
	["Ꮩ"]="do", ["ꮩ"]="do",
	["Ꮪ"]="du", ["ꮪ"]="du",
	["Ꮫ"]="dv", ["ꮫ"]="dv",
	
	["Ꮬ"]="dla", ["ꮬ"]="dla",
	["Ꮭ"]="tla", ["ꮭ"]="tla",
	["Ꮮ"]="tle", ["ꮮ"]="tle",
	["Ꮯ"]="tli", ["ꮯ"]="tli",
	["Ꮰ"]="tlo", ["ꮰ"]="tlo",
	["Ꮱ"]="tlu", ["ꮱ"]="tlu",
	["Ꮲ"]="tlv", ["ꮲ"]="tlv",
	
	["Ꮳ"]="tsa", ["ꮳ"]="tsa",
	["Ꮴ"]="tse", ["ꮴ"]="tse",
	["Ꮵ"]="tsi", ["ꮵ"]="tsi",
	["Ꮶ"]="tso", ["ꮶ"]="tso",
	["Ꮷ"]="tsu", ["ꮷ"]="tsu",
	["Ꮸ"]="tsv", ["ꮸ"]="tsv",
	
	["Ꮹ"]="wa", ["ꮹ"]="wa",
	["Ꮺ"]="we", ["ꮺ"]="we",
	["Ꮻ"]="wi", ["ꮻ"]="wi",
	["Ꮼ"]="wo", ["ꮼ"]="wo",
	["Ꮽ"]="wu", ["ꮽ"]="wu",
	["Ꮾ"]="wv", ["ꮾ"]="wv",
	
	["Ꮿ"]="ya", ["ꮿ"]="ya",
	["Ᏸ"]="ye", ["ᏸ"]="ye",
	["Ᏹ"]="yi", ["ᏹ"]="yi",
	["Ᏺ"]="yo", ["ᏺ"]="yo",
	["Ᏻ"]="yu", ["ᏻ"]="yu",
	["Ᏼ"]="yv", ["ᏼ"]="yv",
}

function export.tr(text)

	text = mw.ustring.gsub(text, '.', tt)
	
	return text

end

return export

-- All tests passed. (refresh)

-- test_translit_cher:
-- Text	Expected	Actual	Differs at
-- Passed	ᎦᎸᏉᏗᎠᏓᏅᏙ	galvquodiadanvdo	galvquodiadanvdo	
-- Passed	ᎠᎾᎳᏍᎩᏍᎬ	analasgisgv	analasgisgv	
-- Passed	ᎠᎸᏇᏂᏯ	alvqueniya	alvqueniya	
-- -- Unit tests for [[Module:Cher-translit]]. Refresh page to run tests.
-- local tests = require('Module:UnitTests')
-- local cher_translit = require('Module:Cher-translit')

-- function tests:check_translit(cher, roman, xlit)
-- 	self:equals('<span class="Cher mention" lang="chr">[[' .. cher .. '#Cherokee|' .. cher .. ']]</span>', cher_translit.tr(cher, 'chr', 'Cher'), roman)
-- end

-- function tests:test_translit_cher()
-- 	self:iterate(
-- 		{
-- 			{ 'ᎦᎸᏉᏗᎠᏓᏅᏙ', 'galvquodiadanvdo' },	
-- 			{ 'ᎠᎾᎳᏍᎩᏍᎬ', 'analasgisgv' },
-- 			{ 'ᎠᎸᏇᏂᏯ', 'alvqueniya' },
-- 		},
-- 		'check_translit'
-- 	)
-- end
 
-- return tests