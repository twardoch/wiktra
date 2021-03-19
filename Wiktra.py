import lupa
from lupa import LuaRuntime

lua = LuaRuntime(unpack_returned_tuples=True)
#lua.execute("dir = io.popen'cd':read'*l'")
#lua.execute('package.path = package.path .. ";" .. dir.."\\\?.lua"')
lua.execute("mw = require('wikt.mw')")
lua.execute("mw.text = require('wikt.mw-text')")
lua.execute("mw.ustring = require ('wikt.ustring.ustring')")

lang_map = {
    'inc-mas': ('inc-mas',''),
    'amh' : ('ethi','Ethi'),
    'byn' : ('ethi','Ethi'),
    'sem-cha' : ('ethi','Ethi'),
    'gez' : ('ethi','Ethi'),
    'har' : ('ethi','Ethi'),
    'tig' : ('ethi','Ethi'),
    'tir' : ('ethi','Ethi'),
    'rus' : ('ru', 'Cyrl'),
    'cre' : ('cr', 'Cans'),
    'pka' : ('brah', 'Brah'),
    'kho' : ('brah', 'Brah'),
    'inc-mgd' : ('brah', 'Brah'),
    'pmh' : ('brah', 'Brah'),
    'oty' : ('brah', 'Brah'),
    'inc-psc' : ('brah', 'Brah'),
    'psu' : ('brah', 'Brah'),
    'inc-ash' : ('brah', 'Brah'),
    'xpr' : ('prti', 'Parthian'),
    'ete' : ('cprt', 'Cprt'),
    'ave' : ('avst', 'Avst'),
    'guj' : ('gu', 'Gujr'),
    'vgr' : ('gu', 'Gujr'),
    'kfr' : ('gu', 'Gujr'),
    'ykg' : ('ykg', 'Cyrl'),
    'ady' : ('ady', 'Cyrl'),
    'ava' : ('av', 'Cyrl'),
    'ukr' : ('uk', 'Cyrl'),
    'xal' : ('xal', 'Cyrl'),
    'tib' : ('bo', 'Tibt'),
    'bod' : ('bo', 'Tibt'),
    'heb' : ('he', 'Hebr'),
    'mya' : ('my', 'Mymr'),
    'rue' : ('rue', 'Cyrl'),
    'kdr' : ('kdr', 'Cyrl'),
    'sin' : ('si', 'Sinh'),
    'kum' : ('kum', 'Cyrl'),
    'arm' : ('armn', 'Armn'),
    'bud' : ('bdk', 'Cyrl'),
    'dng' : ('dng', 'Cyrl'),
    'urd' : ('ur', 'ur-Arab'),
    'got' : ('goth', 'Goth'),
    'qwm' : ('qwm', 'Latn'),
    'ben' : ('bn', 'Beng'),
    'lif' : ('lif', 'Limb'),
    'pra' : ('inc-ash', 'Brah'),
    'mas' : ('inc-mas', 'Beng'),
    'tha' : ('th', 'Thai'),
    'lep' : ('lep', 'Lepc'),
    'eng' : ('en', 'Latn'),
    'abq' : ('abq', 'Latn'),
    'bua' : ('bua', 'Cyrl'),
    'lez' : ('lez', 'Cyrl'),
    'mon' : ('mon', 'Cyrl'),
    'uig' : ('ug', 'ug-Arab'),
    'kjj' : ('kjj', 'Cyrl'),
    'chr' : ('cher', 'Cher'),
    'bho' : ('bho', 'Deva'),
    'new' : ('new', 'Deva'),
    'hin' : ('hi', 'Deva'),
    'awa' : ('hi', 'Deva'),
    'bfy' : ('hi', 'Deva'),
    'bhd' : ('hi', 'Deva'),
    'kfs' : ('hi', 'Deva'),
    'bra' : ('hi', 'Deva'),
    'bns' : ('hi', 'Deva'),
    'cdh' : ('hi', 'Deva'),
    'cdj' : ('hi', 'Deva'),
    'doi-d' : ('hi', 'Deva'),
    'gbk' : ('hi', 'Deva'),
    'gbm' : ('hi', 'Deva'),
    'bgc' : ('hi', 'Deva'),
    'xnr' : ('hi', 'Deva'),
    'kfx' : ('hi', 'Deva'),
    'bfz' : ('hi', 'Deva'),
    'mjl' : ('hi', 'Deva'),
    'mwr' : ('hi', 'Deva'),
    'mtr' : ('hi', 'Deva'),
    'unr' : ('hi', 'Deva'),
    'bpx' : ('hi', 'Deva'),
    'pgg' : ('hi', 'Deva'),
    'mal' : ('ml', 'Mlym'),
    'pal-m' : ('mani', 'Mani'),
    'xpr' : ('mani', 'Mani'),
    'sog' : ('mani', 'Mani'),
    'mdf' : ('mdf', 'Cyrl'),
    'sat' : ('sat', 'Olck'),
    'tel' : ('te', 'Telu'),
    'mkd' : ('mk', 'Cyrl'),
    'sjd' : ('sjd', 'Cyrl'),
    'kbd' : ('kbd', 'Cyrl'),
    'abk' : ('ab', 'Cyrl'),
    'kor' : ('ko', 'Kore'),
    'mns' : ('mns', 'Cyrl'),
    'kca' : ('kca', 'Cyrl'),
    'inc-ash-k' : ('inc-ash-k', 'Khar'),
    'pgd-k' : ('pgd-k', 'Khar'),
    'bel' : ('be', 'Cyrl'),
    'koi' : ('kv', 'Cyrl'),
    'kpv' : ('kv', 'Cyrl'),
    'cop' : ('copt', 'Copt'),
    'kmr' : ('kmr', 'Latn'),
    'lbe' : ('lbe', 'Cyrl'),
    'lak' : ('lbe', 'Cyrl'),
    'ita-old' : ('ital', 'Ital'),
    'lao' : ('lo', 'Laoo'),
    'mar' : ('mr', 'Deva'),
    'kok' : ('mr', 'Deva'),
    'udi' : ('udi', 'Cyrl'),
    'eth' : ('ethi', 'Ethi'),
    'gmy' : ('linb', 'Linb'),
    'iku' : ('iu', 'Cans'),
    'myv' : ('myv', 'Cyrl'),
    'kan' : ('kn', 'Knda'),
    'tam' : ('ta', 'Taml'),
    'kaa' : ('kaa', 'Latn'),
    'bul' : ('bg', 'Cyrl'),
    'jav' : ('jv', 'Latn'),
    'oss' : ('os', 'Cyrl'),
    'che' : ('ce', 'Cyrl'),
    'kas' : ('ks', 'ks-Arab'),
    'pal-p' : ('phli', 'Phli'),
    'sah' : ('sah', 'Cyrl'),
    'chm' : ('chm', 'Cyrl'),
    'kaz' : ('kk', 'Cyrl'),
    'kjh' : ('kjh', 'Cyrl'),
    'fas' : ('fa', 'fa-Arab'),
    'iii' : ('ii', 'Yiii'),
    'tgk' : ('tg', 'Cyrl'),
    'wbl' : ('tg', 'Cyrl'),
    'yai' : ('tg', 'Cyrl'),
    'bak' : ('ba', 'Cyrl'),
    'krc' : ('krc', 'Cyrl'),
    'ori' : ('or', 'Orya'),
    'eve' : ('eve', 'Cyrl'),
    'khm' : ('km', 'Khmr'),
    'xbc' : ('xbc', 'Grek'),
    'txh' : ('el', 'Grek'),
    'san' : ('sa', 'Deva'),
    'inc-ohi' : ('sa', 'Deva'),
    'omr' : ('sa', 'Deva'),
    'inc-tak' : ('sa', 'Deva'),
    'inc-vra' : ('sa', 'Deva'),
    'nsk' : ('nsk', 'Cans'),
    'udm' : ('udm', 'Cyrl'),
    'nog' : ('nog', 'Cyrl'),
    'can' : ('cans', 'Cans'),
    'ain' : ('ain', 'Kana'),
    'nep' : ('ne', 'Deva'),
    'dty' : ('ne', 'Deva'),
    'bbl' : ('geor', 'Geor'),
    'geo' : ('geor', 'Geor'),
    'lzz' : ('geor', 'Geor'),
    'xmf' : ('geor', 'Geor'),
    'oge' : ('geor', 'Geor'),
    'geo' : ('geor', 'Geor'),
    'udi' : ('geor', 'Geor'),
    'niv' : ('niv', 'Cyrl'),
    'xlc' : ('lyci', 'Lyci'),
    'xhd' : ('sarb', 'Sarb'),
    'xha' : ('sarb', 'Sarb'),
    'inm' : ('sarb', 'Sarb'),
    'xqt' : ('sarb', 'Sarb'),
    'xsa' : ('sarb', 'Sarb'),
    'chu' : ('cv', 'Cyrl'),
    'peo' : ('peo', 'Xpeo'),
    'chu-old-c' : ('cyrs-glag', 'Cyrs'),
    'chu-old-g' : ('cyrs-glag', 'Glag'),
    'orv' : ('cyrs-glag', 'Cyrs'),
    'zle-ono-c' : ('cyrs-glag', 'Cyrs'),
    'zle-ono-g' : ('cyrs-glag', 'Glag'),
    'dar' : ('dar', 'Cyrl'),
    'pan' : ('guru', 'Guru'),
    'alt' : ('altai', 'Cyrl'),
    'inh' : ('inh', 'Cyrl'),
    'ara' : ('ar', 'Arab'),
    'tyv' : ('tyv', 'Cyrl'),
    'gre' : ('el', 'Grek'),
    'tat' : ('tt', 'Cyrl'),
    'aho' : ('ahom', 'Ahom'),
    'khb' : ('talu', ''),
    'xld' : ('lydi', 'Lydi'),
    'dlg' : ('dlg', 'Cyrl'),
    'kir' : ('ky', 'Cyrl'),
    'asm' : ('as', 'as-Beng'),
    'div' : ('dv', 'Thaa'),
    'ber' : ('ber', 'Tfng'),
    'grc' : ('grc', 'polythonic'),
    'xmk' : ('grc', 'polythonic'),
    'cpg' : ('grc', 'polythonic'),
    'oos' : ('grc', 'polythonic'),
    'ine-pae' : ('grc', 'polythonic'),
    'xpg' : ('grc', 'polythonic'),
    'pnt' : ('grc', 'polythonic'),
    'grc-c' : ('cprt', 'Cprt'),
    'evn' : ('evn', 'Cyrl')
}

def translite(text, lang):
    lang_tup = lang_map[lang.lower()]
    lua_str = 'res = require("wikt.translit.' + lang_tup[0] + '-translit").tr("' + \
              text + '", "' + lang_tup[0] + '", "' + lang_tup[1] + '")'
    lua.execute(lua_str)
    return lua.globals().res
