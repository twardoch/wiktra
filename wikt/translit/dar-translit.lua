-- This module will transliterate Dargwa language text per WT:DAR TR.
-- Language code: dar

local export = {}

local mapping1 = {
	["б"]="b", ["п"]="p", ["ф"]="f", ["в"]="v", ["м"]="m",
	["д"]="d", ["т"]="t", ["й"]="j", ["н"]="n", ["з"]="z", ["ц"]="c",
	["с"]="s", ["ж"]="ž", ["ш"]="š", ["щ"]="šč",
	["л"]="l", ["ч"]="č", ["р"]="r", ["г"]="g", ["к"]="k", ["х"]="χ", 
	["ъ"]="ʾ", ["а"]="a", ["е"]="e", ["ы"]="y", ["и"]="i", ["о"]="o", ["у"]="u", 
	["ё"]="ë", ["ь"]="’", ["э"]="e", ["ю"]="ju", ["я"]="ə",
	["Б"]="B", ["П"]="P", ["Ф"]="F", ["В"]="V", ["М"]="M",
	["Д"]="D", ["Т"]="T", ["Й"]="J", ["Н"]="N", ["З"]="Z", ["Ц"]="C",
	["С"]="S", ["Ж"]="Ž", ["Ш"]="Š", ["Щ"]="Šč",
	["Л"]="L", ["Ч"]="Č", ["Р"]="R", ["Г"]="G", ["К"]="K", ["Х"]="Χ", 
	["Ъ"]="ʾ", ["А"]="A", ["Е"]="E", ["Ы"]="Y", ["И"]="I", ["О"]="O", ["У"]="U", 
	["Ё"]="Ë", ["Ь"]="’", ["Э"]="E", ["Ю"]="Ju", ["Я"]="Ə"
}

local mapping2 = {
	['дз'] = 'ʒ', ['Дз'] = 'Ʒ', ['дж'] = 'ǯ', ['Дж'] = 'Ǯ',
	['пӏ'] = 'ṗ', ['Пӏ'] = 'Ṗ', ['цӏ'] = 'c̣', ['тӏ'] = 'ṭ',
	['чӏ'] = 'č̣', ['кь'] = 'q̇', ['кӏ'] = 'ḳ', ['хь'] = 'x',
	['хъ'] = 'q', ['къ'] = 'ɢ', ['гъ'] = 'γ', ['гӏ'] = 'ʿ',
	['хӏ'] = 'ḥ', ['гь'] = 'h', ['Цӏ'] = 'C̣', ['Тӏ'] = 'Ṭ',
	['Сс'] = 'S̄', ['Чӏ'] = 'Č̣', ['Кь'] = 'Q̇', ['Кӏ'] = 'Ḳ',
	['Хь'] = 'X', ['Хъ'] = 'Q', ['Къ'] = 'ɢ', ['Гъ'] = 'Γ',
	['Гӏ'] = 'ʿ', ['Хӏ'] = 'Ḥ', ['Гь'] = 'H',
}

function export.tr(text, lang, sc)
	local str_gsub = string.gsub
	
	-- Convert capital to lowercase palochka. Lowercase is found in tables
	-- above.
	text = str_gsub(text, mw.ustring.char(0x4C0), mw.ustring.char(0x4CF))
	
	for pat, repl in pairs(mapping2) do
		text = str_gsub(text, pat, repl)
	end
	
	-- pattern for non-ASCII UTF-8 characters
	text = str_gsub(text, '[\194-\244][\128-\191]+', mapping1)
	
	return text
end

return export