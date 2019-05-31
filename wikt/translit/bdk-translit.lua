-- This module will transliterate Budukh language text per WT:BDK TR.
-- Language code: bdk
local export = {}

local tt = {
	["б"]="b", ["п"]="p", ["ф"]="f", ["в"]="v", ["м"]="m",
	["д"]="d", ["т"]="t", ["й"]="j", ["н"]="n", ["з"]="z", ["ц"]="c",
	["с"]="s", ["ж"]="ž", ["ш"]="š", ["л"]="l", ["ч"]="č", ["р"]="r", ["г"]="g", ["к"]="k", ["х"]="χ", 
	["ъ"]="ʔ", ["а"]="a", ["е"]="e", ["ы"]="ɨ", ["и"]="i", ["о"]="o", ["у"]="u", 
	["э"]="e",
	["Б"]="B", ["П"]="P", ["Ф"]="F", ["В"]="V", ["М"]="M",
	["Д"]="D", ["Т"]="T", ["Й"]="J", ["Н"]="N", ["З"]="Z", ["Ц"]="C",
	["С"]="S", ["Ж"]="Ž", ["Ш"]="Š", 
	["Л"]="L", ["Ч"]="Č", ["Р"]="R", ["Г"]="G", ["К"]="K", ["Х"]="Χ", 
	["Ъ"]="ʔ", ["А"]="A", ["Е"]="E", ["Ы"]="Ɨ", ["И"]="I", ["О"]="O", ["У"]="U", 
	["Э"]="E",};

local digraphs = {
	['аь'] = 'ä',
	['Аь'] = 'Ä',
	['гӏ'] = 'ʕ',
	['Гӏ'] = 'ʕ',
	['гъ'] = 'ġ',
	['Гъ'] = 'Ġ',
	['гь'] = 'h',
	['Гь'] = 'H',
	['дж'] = 'ǯ',
	['Дж'] = 'Ǯ',
	['кк'] = 'k̄',
	['кӏ'] = 'ḳ',
	['Кӏ'] = 'Ḳ',
	['къ'] = 'q̄',
	['Къ'] = 'Q̄',
	['кь'] = 'q̇',
	['Кь'] = 'Q̇',
	['оь'] = 'ö',
	['Оь'] = 'Ö',
	['пӏ'] = 'ṗ',
	['Пӏ'] = 'Ṗ',
	['тӏ'] = 'ṭ',
	['Тӏ'] = 'Ṭ',
	['уь'] = 'ü',
	['Уь'] = 'Ü',
	['хӏ'] = 'ħ',
	['Хӏ'] = 'Ħ',
	['хъ'] = 'q',
	['Хъ'] = 'Q',
	['хь'] = 'x',
	['Хь'] = 'X',
	['цӏ'] = 'c̣',
	['Цӏ'] = 'C̣',
	['чӏ'] = 'č̣',
	['Чӏ'] = 'Č̣',
}

function export.tr(text, lang, sc)
	local str_gsub = string.gsub
	local UTF8_char = '[%z\1-\127\194-\244][\128-\191]*'
	
	-- Convert capital to lowercase palochka. Lowercase is found in tables
	-- above.
	text = str_gsub(text, mw.ustring.char(0x4C0), mw.ustring.char(0x4CF))
	
	text = mw.ustring.gsub(text, '[Кк]ъг', 'ɢ')
	
	for letter, translit in pairs(digraphs) do
		text = str_gsub(text, letter, translit)
	end
	
	text = str_gsub(text, UTF8_char, tt)
	
	return text
end

return export