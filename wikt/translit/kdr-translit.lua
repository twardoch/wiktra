-- This module will transliterate Karaim language text per WT:KDR TR.

local export = {}
local tab =  
             {["А"] ="A" ,    ["Б"] ="B",   ["В"] ="V",   ["Г"] ="G",   ["Д"] ="D",   ["Е"] ="E",                                           ["Ё"] ="Yo", ["Ж"] ="J" ,    ["З"] ="Z",   ["И"] ="I",   ["Й"] ="Y",
	
     ["К"]="K",  ["Л"]="L", ["М"]="M", ["Н"]="N",  ["Ҥ"]="Ñ", ["О"]="O",  ["Ӧ"]="Ö", ["П"]="P", ["Р"]="R", ["С"]="S",  ["Т"]="T",
["У"]="U",  ["Ӱ"]="Ü", ["Ф"]="F", ["Х"]="KH", ["Һ"]="H", ["Ц"]="Ts",["Ч"]="Ć", ["Ш"]="Ś",     ["Щ"]="Śç", ["Ъ"]="ʺ", ["Ы"]="İ",
["Ь"]="ʹ", ["Э"]="E", ["Ю"]="Yu", ["Я"]="Ya",
['а']='a', ['б']='b', ['в']='v', ['г']='g',  ['д']='d', ['е']='e',  ['ё']='yo', ['ж']='j', ['з']='z', ['и']='i', ['й']='y',
['к']='k', ['л']='l', ['м']='m', ['н']='n',  ['о']='o', ['ӧ']='ö',  ['п']='p',  ['р']='r', ['с']='s', ['т']='t',
['у']='u', ['ӱ']='ü', ['ф']='f', ['х']='kh', ['һ']='h', ['ц']='ts', ['ч']='ć',  ['ш']='ś', ['щ']='śç',['ъ']='ʺ', ['ы']='ı',
['ь']='ʹ', ['э']='e', ['ю']='yu', ['я']='ya',
}
local mapping = { ['дж']= 'c' , ['Дж']= 'C', ['ң']='ñ' ,['Ң']='Ñ' ,
                  ['къ']='q',   ['Къ']='Q' , ['нъ']='ñ',['Нъ']='Ñ'

}
function export.tr(text, lang, sc)
	-- Ё needs converting if is decomposed
	text = text:gsub("ё","ё"):gsub("Ё","Ё")
 
	-- е after a vowel or at the beginning of a text becomes ye
	text = mw.ustring.gsub(text, "([АОӨУҮЫЕЯЁЮИЕЪЬаоөуүыэяёюиеъь%A][\204\129\204\128]?)е","%1yö")
	text = mw.ustring.gsub(text, "^Е","Yö")
	text = mw.ustring.gsub(text, "^е","yö")
	text = mw.ustring.gsub(text, "([^Ѐ-ӿ])Е","%1yö")
	text = mw.ustring.gsub(text, "([^Ѐ-ӿ])е","%1yö")
 
	return (mw.ustring.gsub(text,'.',tab))
end
 
return export