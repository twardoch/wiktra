-- This module will transliterate text in the Ethiopic script per WT:ETHI TR. 
-- It is used to transliterate Amharic (am), Blin (byn), Ge'ez (gez), Tigrinya (ti) and Tigre (tig).
-- Language code: amh, byn, gez, tir, tig.

local export = {}

local tt = {
	["ሀ"]="hä", ["ሁ"]="hu", ["ሂ"]="hi", ["ሃ"]="ha", ["ሄ"]="he", ["ህ"]="hə", ["ሆ"]="ho", 
	["ለ"]="lä", ["ሉ"]="lu", ["ሊ"]="li", ["ላ"]="la", ["ሌ"]="le", ["ል"]="lə", ["ሎ"]="lo", 
		["ሏ"]="lʷa", 
	["ሐ"]="ḥä", ["ሑ"]="ḥu", ["ሒ"]="ḥi", ["ሓ"]="ḥa", ["ሔ"]="ḥe", ["ሕ"]="ḥə", ["ሖ"]="ḥo", 
		["ሗ"]="ḥʷa", 
	["መ"]="mä", ["ሙ"]="mu", ["ሚ"]="mi", ["ማ"]="ma", ["ሜ"]="me", ["ም"]="mə", ["ሞ"]="mo", 
		["ሟ"]="mʷa", ["ፙ"]="mʲä", 
	["ሠ"]="śä", ["ሡ"]="śu", ["ሢ"]="śi", ["ሣ"]="śa", ["ሤ"]="śe", ["ሥ"]="śə", ["ሦ"]="śo", 
		["ሧ"]="śʷa", 
	["ረ"]="rä", ["ሩ"]="ru", ["ሪ"]="ri", ["ራ"]="ra", ["ሬ"]="re", ["ር"]="rə", ["ሮ"]="ro",
		["ሯ"]="rʷa", ["ፘ"]="rʲä", 
	["ሰ"]="sä", ["ሱ"]="su", ["ሲ"]="si", ["ሳ"]="sa", ["ሴ"]="se", ["ስ"]="sə", ["ሶ"]="so",
		["ሷ"]="sʷa", 
	["ሸ"]="šä", ["ሹ"]="šu", ["ሺ"]="ši", ["ሻ"]="ša", ["ሼ"]="še", ["ሽ"]="šə", ["ሾ"]="šo",
		["ሿ"]="šʷa", 
	["ቀ"]="ḳä", ["ቁ"]="ḳu", ["ቂ"]="ḳi", ["ቃ"]="ḳa", ["ቄ"]="ḳe", ["ቅ"]="ḳə", ["ቆ"]="ḳo",
		["ቈ"]="ḳʷä", ["ቊ"]="ḳʷi", ["ቋ"]="ḳʷa", ["ቌ"]="ḳʷe", ["ቍ"]="ḳʷə", 
	["ቐ"]="ḳʰä", ["ቑ"]="ḳʰu", ["ቒ"]="ḳʰi", ["ቓ"]="ḳʰa", ["ቔ"]="ḳʰe", ["ቕ"]="ḳʰə", ["ቖ"]="ḳʰo",
		["ቘ"]="ḳʰʷä", ["ቚ"]="ḳʰʷi", ["ቛ"]="ḳʰʷa", ["ቜ"]="ḳʰʷe", ["ቝ"]="ḳʰʷə",
	["በ"]="bä", ["ቡ"]="bu", ["ቢ"]="bi", ["ባ"]="ba", ["ቤ"]="be", ["ብ"]="bə", ["ቦ"]="bo", 
		["ቧ"]="bʷa", 
	["ቨ"]="vä", ["ቩ"]="vu", ["ቪ"]="vi", ["ቫ"]="va", ["ቬ"]="ve", ["ቭ"]="və", ["ቮ"]="vo", 
		["ቯ"]="vʷa", 
	["ተ"]="tä", ["ቱ"]="tu", ["ቲ"]="ti", ["ታ"]="ta", ["ቴ"]="te", ["ት"]="tə", ["ቶ"]="to", 
		["ቷ"]="tʷa", 
	["ቸ"]="čä", ["ቹ"]="ču", ["ቺ"]="či", ["ቻ"]="ča", ["ቼ"]="če", ["ች"]="čə", ["ቾ"]="čo", 
		["ቿ"]="čʷa", 
	["ኀ"]="ḫä", ["ኁ"]="ḫu", ["ኂ"]="ḫi", ["ኃ"]="ḫa", ["ኄ"]="ḫe", ["ኅ"]="ḫə", ["ኆ"]="ḫo", 
		["ኈ"]="ḫʷä", ["ኊ"]="ḫʷi", ["ኋ"]="ḫʷa", ["ኌ"]="ḫʷe", ["ኍ"]="ḫʷə", 
	["ነ"]="nä", ["ኑ"]="nu", ["ኒ"]="ni", ["ና"]="na", ["ኔ"]="ne", ["ን"]="nə", ["ኖ"]="no",
		["ኗ"]="nʷa", 
	["ኘ"]="ñä", ["ኙ"]="ñu", ["ኚ"]="ñi", ["ኛ"]="ña", ["ኜ"]="ñe", ["ኝ"]="ñə", ["ኞ"]="ño", 
		["ኟ"]="ñʷa", 
	["አ"]="ʾä", ["ኡ"]="ʾu", ["ኢ"]="ʾi", ["ኣ"]="ʾa", ["ኤ"]="ʾe", ["እ"]="ʾə", ["ኦ"]="ʾo",
		["ኧ"]="ʾʷa", 
	["ከ"]="kä", ["ኩ"]="ku", ["ኪ"]="ki", ["ካ"]="ka", ["ኬ"]="ke", ["ክ"]="kə", ["ኮ"]="ko", 
		["ኰ"]="kʷä", ["ኲ"]="kʷi", ["ኳ"]="kʷa", ["ኴ"]="kʷe", ["ኵ"]="kʷə", 
	["ኸ"]="xä", ["ኹ"]="xu", ["ኺ"]="xi", ["ኻ"]="xa", ["ኼ"]="xe", ["ኽ"]="xə", ["ኾ"]="xo", 
	["ወ"]="wä", ["ዉ"]="wu", ["ዊ"]="wi", ["ዋ"]="wa", ["ዌ"]="we", ["ው"]="wə", ["ዎ"]="wo", 
	["ዐ"]="ʿä", ["ዑ"]="ʿu", ["ዒ"]="ʿi", ["ዓ"]="ʿa", ["ዔ"]="ʿe", ["ዕ"]="ʿə", ["ዖ"]="ʿo", 
	["ዘ"]="zä", ["ዙ"]="zu", ["ዚ"]="zi", ["ዛ"]="za", ["ዜ"]="ze", ["ዝ"]="zə", ["ዞ"]="zo",
		["ዟ"]="zʷa", 
	["ዠ"]="žä", ["ዡ"]="žu", ["ዢ"]="ži", ["ዣ"]="ža", ["ዤ"]="že", ["ዥ"]="žə", ["ዦ"]="žo", 
		["ዧ"]="žʷa", 
	["የ"]="yä", ["ዩ"]="yu", ["ዪ"]="yi", ["ያ"]="ya", ["ዬ"]="ye", ["ይ"]="yə", ["ዮ"]="yo", 
	["ደ"]="dä", ["ዱ"]="du", ["ዲ"]="di", ["ዳ"]="da", ["ዴ"]="de", ["ድ"]="də", ["ዶ"]="do",
		["ዷ"]="dʷa", 
	["ጀ"]="ǧä", ["ጁ"]="ǧu", ["ጂ"]="ǧi", ["ጃ"]="ǧa", ["ጄ"]="ǧe", ["ጅ"]="ǧə", ["ጆ"]="ǧo", 
		["ጇ"]="ǧʷa", 
	["ገ"]="gä", ["ጉ"]="gu", ["ጊ"]="gi", ["ጋ"]="ga", ["ጌ"]="ge", ["ግ"]="gə", ["ጎ"]="go",
		["ጐ"]="gʷä", ["ጒ"]="gʷi", ["ጓ"]="gʷa", ["ጔ"]="gʷe", ["ጕ"]="gʷə", 
	["ጘ"]="ŋä", ["ጙ"]="ŋu", ["ጚ"]="ŋi", ["ጛ"]="ŋa", ["ጜ"]="ŋe", ["ጝ"]="ŋə", ["ጞ"]="ŋo",
		["ⶓ"]="ŋʷä", ["ⶔ"]="ŋʷi", ["ጟ"]="ŋʷa", ["ⶕ"]="ŋʷe", ["ⶖ"]="ŋʷə", 
	["ጠ"]="ṭä", ["ጡ"]="ṭu", ["ጢ"]="ṭi", ["ጣ"]="ṭa", ["ጤ"]="ṭe", ["ጥ"]="ṭə", ["ጦ"]="ṭo", 
		["ጧ"]="ṭʷa", 
	["ጨ"]="č̣ä", ["ጩ"]="č̣u", ["ጪ"]="č̣i", ["ጫ"]="č̣a", ["ጬ"]="č̣e", ["ጭ"]="č̣ə", ["ጮ"]="č̣o",
		["ጯ"]="č̣ʷa", 
	["ጰ"]="p̣ä", ["ጱ"]="p̣u", ["ጲ"]="p̣i", ["ጳ"]="p̣a", ["ጴ"]="p̣e", ["ጵ"]="p̣ə", ["ጶ"]="p̣o",
		["ጷ"]="p̣ʷa",
	["ጸ"]="ṣä", ["ጹ"]="ṣu", ["ጺ"]="ṣi", ["ጻ"]="ṣa", ["ጼ"]="ṣe", ["ጽ"]="ṣə", ["ጾ"]="ṣo", 
		["ጿ"]="ṣʷa", 
	["ፀ"]="ṣ́ä", ["ፁ"]="ṣ́u", ["ፂ"]="ṣ́i", ["ፃ"]="ṣ́a", ["ፄ"]="ṣ́e", ["ፅ"]="ṣ́ə", ["ፆ"]="ṣ́o", 
	["ፈ"]="fä", ["ፉ"]="fu", ["ፊ"]="fi", ["ፋ"]="fa", ["ፌ"]="fe", ["ፍ"]="fə", ["ፎ"]="fo",
		["ፏ"]="fʷa", ["ፚ"]="fʲä", 
	["ፐ"]="pä", ["ፑ"]="pu", ["ፒ"]="pi", ["ፓ"]="pa", ["ፔ"]="pe", ["ፕ"]="pə", ["ፖ"]="po", 
		["ፗ"]="pʷa", 
	--punctuation
	["፠"]="§", ["፡"]="-", ["።"]=".", ["፣"]=",", ["፤"]=";", ["፥"]=":", ["፦"]=":-", ["፧"]="?", ["፨"]="¶",
}

local number = {
	['፩']=1, ['፪']=2, ['፫']=3, ['፬']=4, ['፭']=5, ['፮']=6, ['፯']=7, ['፰']=8, ['፱']=9,
	['፲']=10, ['፳']=20, ['፴']=30, ['፵']=40, ['፶']=50, ['፷']=60, ['፸']=70, ['፹']=80, ['፺']=90
}

-- This works on small numbers. Please improve if you find any problems.
function export.number(geez)

	local val = 0
	if mw.ustring.find(geez, '^[፻፼]') then
		geez = '፩' .. geez -- prepend 1
	end
	local func = mw.text.gsplit(geez, '')
	
	while true do
		local digit = func()
		if (not digit) then break end
		if mw.ustring.find(digit, '[፩-፺]') then
			val = val + number[digit]
		elseif digit == '፻' then
			val = val * 100
		elseif digit == '፼' then
			val = val * 10000
		end
	end
	
	return val

end

function export.tr(text, lang, sc)

	text = (mw.ustring.gsub(text, ".", tt))

	-- remove ə that is not in the first syllable
	text = mw.ustring.gsub(text, "(...)ə", "%1")
	text = mw.ustring.gsub(text, "(...)ə", "%1")
	text = mw.ustring.gsub(text, "[፩-፼]+", export.number)

	return text

end

return export

-- Text	Expected	Actual	Differs at
-- Passed	ስም	səm	səm	
-- Passed	እንሽላሊት	ʾənšlalit	ʾənšlalit	
-- Passed	ፎርማጆ	formaǧo	formaǧo	
-- Passed	ግንደ ቆርቁር	gəndä ḳorḳur	gəndä ḳorḳur	
-- Passed	ኢትዮጵያ	ʾityop̣ya	ʾityop̣ya	
-- Passed	አዲስ አበባ	ʾädis ʾäbäba	ʾädis ʾäbäba	
-- Passed	ዩክሬን	yukren	yukren	
-- Passed	አፍጋኒስታን	ʾäfganistan	ʾäfganistan	
-- Passed	አውራ ዶሮ	ʾäwra doro	ʾäwra doro	
-- Passed	ቢራቢሮ	birabiro	birabiro	
-- -- Unit tests for [[Module:Ethi-translit]]. Refresh page to run tests.
-- local tests = require('Module:UnitTests')
-- local ethi_translit = require('Module:Ethi-translit')

-- --TO DO
-- function tests:do_test_translit(ethi, roman, xlit)
-- 	self:equals('<span class="Ethi" lang="am">[[' .. ethi .. '#Ethi|' .. ethi .. ']]</span>', ethi_translit.tr(ethi, 'am', 'Ethi'), roman)
-- end

-- function tests:test_translit_ethi()
-- 	local examples = {
-- 		{ 'ስም', 'səm' },
-- 		{ 'እንሽላሊት', 'ʾənšlalit' },
-- 		{ 'ፎርማጆ', 'formaǧo' },
-- 		{ 'ግንደ ቆርቁር', 'gəndä ḳorḳur' },
-- 		{ 'ኢትዮጵያ', 'ʾityop̣ya' },
-- 		{ 'አዲስ አበባ', 'ʾädis ʾäbäba' },
-- 		{ 'ዩክሬን', 'yukren' },
-- 		{ 'አፍጋኒስታን', 'ʾäfganistan' },
	
-- 		{ 'አውራ ዶሮ', 'ʾäwra doro' },
-- 		-- it's geminated "birrabirro" but it's not expressed graphically
-- 		{ 'ቢራቢሮ', 'birabiro' },
-- 	}
-- 	self:iterate(examples, 'do_test_translit')
-- end
 
-- return tests