-- This module will transliterate Khinalug language text.
-- Language code: kjj

local export = {}

local tt = {
	["б"]="b", ["п"]="p", ["в"]="w", ["ф"]="f",
	["д"]="d", ["т"]="t", ["ц"]="c", ["з"]="z", ["с"]="s", ["ч"]="č", ["ж"]="ž", ["ш"]="š",
	["г"]="g", ["к"]="k", ["х"]="χ", ["ъ"]="ʔ", ["м"]="m", ["н"]="n", ["р"]="r", ["л"]="l",
	["й"]="j", ["и"]="i", ["е"]="e", ["э"]="e", ["а"]="a", ["о"]="o", ["у"]="u", ["ы"]="ɨ", 
	["Б"]="B", ["П"]="P", ["В"]="W", ["Ф"]="F",
	["Д"]="D", ["Т"]="T", ["Ц"]="C", ["З"]="Z", ["С"]="S", ["Ч"]="Č", ["Ж"]="Ž", ["Ш"]="Š",
	["Г"]="G", ["К"]="K", ["Х"]="Χ", ["Ъ"]="ʔ", ["М"]="M", ["Н"]="N", ["Р"]="R", ["Л"]="L",
	["Й"]="J", ["И"]="I", ["Е"]="E", ["Э"]="E", ["А"]="A", ["О"]="O", ["У"]="U", ["Ы"]="Ɨ"};

local tetraTrigraphs = {
	['къкъ'] = 'qː',
	['кхь'] = 'kx',
	['Къкъ'] = 'Qː',
	['Кхь'] = 'Kx',
}

local digraphs = {
	['пп'] = 'pː',
	['пӏ'] = 'ṗ',
	['вв'] = 'wː',
	['тт'] = 'tː',
	['тӏ'] = 'ṭ',
	['цц'] = 'cː',
	['цӏ'] = 'c̣',
	['дж'] = 'ǯ',
	['чч'] = 'čː',
	['чӏ'] = 'č̣',
	['кк'] = 'kː',
	['кӏ'] = 'ḳ',
	['гг'] = 'ɣ',
	['хь'] = 'x',
	['къ'] = 'qː',
	['хъ'] = 'q',
	['кь'] = 'q̇',
	['гъ'] = 'ʁ',
	['гӏ'] = 'ʕ',
	['хӏ'] = 'ħ',
	['гь'] = 'h',
	['уь'] = 'ü',
	['оь'] = 'ö',
	['аь'] = 'ä',
	['Пп'] = 'Pː',
	['Пӏ'] = 'Ṗ',
	['Вв'] = 'Wː',
	['Тт'] = 'Tː',
	['Тӏ'] = 'Ṭ',
	['Цц'] = 'Cː',
	['Цӏ'] = 'C̣',
	['Дж'] = 'Ǯ',
	['Чч'] = 'Čː',
	['Чӏ'] = 'Č̣',
	['Кк'] = 'Kː',
	['Кӏ'] = 'Ḳ',
	['Гг'] = 'Ɣ',
	['Хь'] = 'X',
	['Къ'] = 'Qː',
	['Хъ'] = 'Q',
	['Кь'] = 'Q̇',
	['Гъ'] = 'ʁ',
	['Гӏ'] = 'ʕ',
	['Хӏ'] = 'Ħ',
	['Гь'] = 'H',
	['Уь'] = 'Ü',
	['Оь'] = 'Ö',
	['Аь'] = 'Ä',
}

function export.tr(text, lang, sc)
	local str_gsub = string.gsub
	local UTF8char = '[%z\1-\127\194-\244][\128-\191]*'
	
	-- Convert uppercase palochka to lowercase. Lowercase is found in tables
	-- above.
	text = str_gsub(text, mw.ustring.char(0x4C0), mw.ustring.char(0x4CF))
	
	for grapheme, replacement in pairs(tetraTrigraphs) do
		text = str_gsub(text, grapheme, replacement)
	end
	
	for digraph, replacement in pairs(digraphs) do
		text = str_gsub(text, digraph, replacement)
	end
	
	text = str_gsub(text, UTF8char, tt)
	
	return text
end

return export