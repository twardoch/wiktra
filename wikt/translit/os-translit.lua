-- This module will transliterate Ossetian language text per WT:OS TR.
-- Language code: oss

local export = {}

local mapping1 = {
	["ӕ"]="æ" ,['Ӕ']='Æ' , ["т"]="t" ,['Т']='T' , ["р"]="r" ,['Р']='R' , ["ф"]="f",['Ф']='F', ["э"]="è",['Э']='È',
	["ю"]="ju",['Ю']='Ju', ["ш"]="š" ,['Ш']='Š' , ["ь"]="ʹ" ,['Ь']='ʹ' , ["ъ"]="ʺ",['Ъ']='ʺ', ["н"]="n",['Н']='N',
	["п"]="p" ,['П']='P' , ["й"]="j" ,['Й']='J' , ["л"]="l" ,['Л']='L' , ["з"]="z",['З']='Z', ["е"]="e",['Е']='E',
	["г"]="g" ,['Г']='G' , ["б"]="b" ,['Б']='B' , ["у"]="u" ,['У']='U' , ["с"]="s",['С']='S', ["х"]="x",['Х']='X',
	["ч"]="ḱ" ,['Ч']='Ḱ' , ["щ"]="šč",['Щ']='ŠČ', ["я"]="ja",['Я']='Ja', ["ы"]="y",['Ы']='Y', ["э"]="è",['Э']='È',
	["м"]="m" ,['М']='M' , ["о"]="o" ,['О']='O' , ["и"]="i" ,['И']='I' , ["ё"]="ë",['Ё']='Ë', ["ж"]="ž",['Ж']='Ž',
	["к"]="k" ,['К']='K' , ["д"]="d" ,['Д']='D' , ["в"]="v" ,['В']='V' , ["ц"]="c",['Ц']='C', ["а"]="a",['А']='A'
}

local mapping2 = {
	['къ'] = 'k’', ['Къ'] = 'K’', ['пъ'] = 'p’', ['Пъ'] = 'P’',
	['тъ'] = 't’', ['Tъ'] = 'T’', ['цъ'] = 'c’', ['Цъ'] = 'C’',
	['чъ'] = 'ḱ’', ['Чъ'] = 'Ḱ’', ['хъ'] = 'q' , ['Хъ'] = 'Q',
	['гъ'] = 'ǧ' , ['Гъ'] = 'Ǧ' , ['дж'] = 'ǵ' , ['Дж'] = 'Ǵ',
	['дз'] = 'ʒ' , ['Дз'] = 'Ʒ' , ['ау'] = 'aw', ['Ау'] = 'Aw',
	['ӕу'] = 'æw', ['Ӕу'] = 'Æw', ['иу'] = 'iw', ['Иу'] = 'Iw',
	['ыу'] = 'yw', ['Ыу'] = 'Yw', ['еу'] = 'ew', ['Еу'] = 'Ew',
	['уа'] = 'wa', ['Уа'] = 'Wa', ['уӕ'] = 'wæ', ['Уӕ'] = 'Wæ',
	['уи'] = 'wi', ['Уи'] = 'Wi', ['уы'] = 'wy', ['Уы'] = 'Wy',
	['уе'] = 'we', ['Уе'] = 'We',
}

local mapping3 = {
	['гуы'] = 'g°y', ['Гуы'] = 'G°y',
	['куы'] = 'k°y', ['Kуы'] = 'K°y',
	['хуы'] = 'x°y', ['Хуы'] = 'X°y',
}

function export.tr(text, lang, sc)
	-- If the script is given as Geor, then forward the transliteration to that module
	if sc == "Geor" then
		return require("Module:Geor-translit").tr(text, lang, sc)
	end
	text = mw.ustring.gsub(text, 'къуы', 'k’°y')
	text = mw.ustring.gsub(text, 'Kъуы', 'K’°y')
	for pat, repl in pairs(mapping3) do
		text = mw.ustring.gsub(text, pat, repl)
	end
	for pat, repl in pairs(mapping2) do
		text = mw.ustring.gsub(text, pat, repl)
	end
	text = mw.ustring.gsub(text, '.', mapping1)

	return text
end

return export