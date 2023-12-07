import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'zh_Hant'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? zh_HantText = '',
  }) =>
      [enText, zh_HantText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'qv9pw4h6': {
      'en': 'MENS',
      'zh_Hant': '男士',
    },
    'e0ygd041': {
      'en': 'WOMENS',
      'zh_Hant': '女士',
    },
    '5xhp44ge': {
      'en': 'PRE MENS',
      'zh_Hant': 'PRE MENS',
    },
    'hnq05h9s': {
      'en': 'PRE WOMENS',
      'zh_Hant': 'PRE WOMENS',
    },
    'eyf28so1': {
      'en': 'the Shepherd',
      'zh_Hant': 'the Shepherd',
    },
    'oyylzmoz': {
      'en': 'MADSTORE',
      'zh_Hant': 'MADSTORE',
    },
    'c2hihtpz': {
      'en': 'BASIC',
      'zh_Hant': 'BASIC',
    },
    'g4e2whrg': {
      'en': 'SPECIAL',
      'zh_Hant': 'SPECIAL',
    },
    'lunlya0e': {
      'en': 'MEDICOM TOY × UNDERCOVER',
      'zh_Hant': 'MEDICOM TOY × UNDERCOVER',
    },
    'ukq9s18y': {
      'en':
          'KUBRICK by Alfred Hitchcock, the film master of suspense, is now available.\nIt comes in two size set: 100% and 400%.',
      'zh_Hant': '懸疑電影大師阿爾弗雷德希區考克的《庫伯力克》現已上映。\n它有兩種尺寸：100% 和 400%。',
    },
    'qyk4z3oy': {
      'en': 'Each is approx. 70mm / 280mm tall.',
      'zh_Hant': '每個高度約 70 毫米/280 毫米。',
    },
    'g49g9q0f': {
      'en':
          'Alfred Hitchcock and the images of Alfred Hitchcock are trademarks and likeness rights of Alfred Hitchcock LLC. \nCopyright ©︎ 2023. All Rights Reserved.KUBRICK TM & ©︎ 2000-2023 MEDICOM TOY CORPORATION. All rights reserved.',
      'zh_Hant':
          '阿爾弗雷德·希區考克和阿爾弗雷德·希區考克的圖像是阿爾弗雷德·希區考克有限責任公司的商標和肖像權。\n版權所有 ©︎ 2023。保留所有權利。KUBRICK TM & ©︎ 2000-2023 MEDICOM TOY CORPORATION。保留所有權利。',
    },
    '6d1tvvr2': {
      'en': 'UNDERCOVER x FRGMNT',
      'zh_Hant': 'UNDERCOVER x FRGMNT',
    },
    'pitznp48': {
      'en': 'UNDERCOVER x  FRGMNT',
      'zh_Hant': 'UNDERCOVER x  FRGMNT',
    },
    'chcuh7j3': {
      'en':
          'The 2023 - 2024 Autumn/Winter UNDERCOVER x fragment design collaboration will be launched on the 8th of November.\nFor this lineup such items as coats and jackets are covered in bold design which comes from German musician’s Manuel Göttsching album’s “E2-E4” artwork.',
      'zh_Hant':
          '2023 - 2024 秋冬UNDERCOVER xfragmentfragment design聯名將於 11 月 8 日推出。\n該系列的外套和夾克等單品均採用大膽設計，源自德國音樂家 Manuel Göttsching 專輯「E2-E4」的藝術作品。',
    },
    'b5jos516': {
      'en': 'THE NORTH FACE x UNDERCOVER',
      'zh_Hant': 'THE NORTH FACE x UNDERCOVER',
    },
    'v27xmotf': {
      'en': 'THE NORTH FACE x UNDERCOVER',
      'zh_Hant': 'THE NORTH FACE x UNDERCOVER',
    },
    'ueb2iof2': {
      'en':
          'UNDERCOVER is pleased to announce their first collection with THE NORTH FACE, titled “SOUKUU”. This collaboration was born from the balance of calm and chaos, guided by the quiet confidence of nature.\nThe lineup of 2023AW collection includes classic styles such as Nuptse Jacket reimagined with UNDERCOVER ’s unique vision, fused The North Face’s latest outdoor technology all which hail from high-altitude mountaineering gear.',
      'zh_Hant':
          'UNDERCOVER很高興地宣布他們與 THE NORTH FACE 的首個系列，名為“SOUKUU”。這次合作誕生於平靜與混亂的平衡，以自然的安靜自信為指導。\n\n2023AW系列的產品陣容包括經典款式，例如以UNDERCOVER獨特視野重新演繹的Nuptse Jacket，融合了The North Face最新的戶外技術，這些技術均源自高海拔登山裝備。',
    },
    'wtgp35zv': {
      'en': 'ALL SPECIAL',
      'zh_Hant': 'ALL SPECIAL',
    },
    'c96vt4a5': {
      'en': 'MENS NEW ARRIVALS',
      'zh_Hant': '男士新品',
    },
    '0b5ltoge': {
      'en': 'UC2C4912\n￥97,597',
      'zh_Hant': 'UC2C4912\n￥97,597',
    },
    '226cq95r': {
      'en': 'UC2C4912\n￥97,597',
      'zh_Hant': 'UC2C4912\n￥97,597',
    },
    'jgoz5e18': {
      'en': 'UC2C4212\n￥270,270',
      'zh_Hant': 'UC2C4212\n￥270,270',
    },
    'e87xz3m8': {
      'en': 'UC2C4509-2\n￥135,135',
      'zh_Hant': 'UC2C4509-2\n￥135,135',
    },
    'mw6i6iq8': {
      'en': 'UC2C4808\n￥90,090',
      'zh_Hant': 'UC2C4808\n￥90,090',
    },
    'kknitca1': {
      'en': 'UC29208\n￥210,210',
      'zh_Hant': 'UC29208\n￥210,210',
    },
    's5vgwuem': {
      'en': 'ALL NEW ARRIVALS',
      'zh_Hant': 'ALL NEW ARRIVALS',
    },
    'lxb1eaev': {
      'en': 'WOMENS NEW ARRIVALS',
      'zh_Hant': '女裝新品',
    },
    'afgqc716': {
      'en': 'UC2C8301\n￥172,672',
      'zh_Hant': 'UC2C8301\n￥172,672',
    },
    '7ktjksne': {
      'en': 'UC2C8301\n￥172,672',
      'zh_Hant': 'UC2C8301\n￥172,672',
    },
    '5yytb4ox': {
      'en': 'UC2C8202\n￥172,672',
      'zh_Hant': 'UC2C8202\n￥172,672',
    },
    'xee94kcc': {
      'en': 'UC2C8201\n￥67,567',
      'zh_Hant': 'UC2C8201\n￥67,567',
    },
    'iasgxelw': {
      'en': 'UC2C8801\n￥81,081',
      'zh_Hant': 'UC2C8801\n￥81,081',
    },
    'izskvs7q': {
      'en': 'UC2C8201\n￥225,225',
      'zh_Hant': 'UC2C8201\n￥225,225',
    },
    'v5nhpj14': {
      'en': 'ALL NEW ARRIVALS',
      'zh_Hant': 'ALL NEW ARRIVALS',
    },
    'qpwogr2t': {
      'en': 'NEW CUSTOMERS',
      'zh_Hant': 'NEW CUSTOMERS',
    },
    'hd2q7zxi': {
      'en': 'NEWSLETTER',
      'zh_Hant': 'NEWSLETTER',
    },
    'uqdq6xbu': {
      'en': 'MENS',
      'zh_Hant': 'MENS',
    },
    'iyosye9s': {
      'en':
          'NEW ARRIVALS\nOUTWEAR\nSHIRTS\nT-SHIRTS\nSWEATER , CUT&SEW\nPANTS\nOTHER\nKIDS\n',
      'zh_Hant': '新品上架\n外套\n襯衫\nT卹\n毛衣・針織服飾\n褲子\n其他\n童裝',
    },
    'x5fp4e0r': {
      'en': 'WOMENS',
      'zh_Hant': 'WOMENS',
    },
    'gjwwpr2c': {
      'en':
          'NEW ARRIVALS\nOUTWEAR\nSHIRTS\nT-SHIRTS\nSWEATER , CUT&SEW\nPANTS , \nDRESSES\nOTHER\nKIDS\n',
      'zh_Hant': '新品上架\n外套\n襯衫\nT卹\n毛衣・針織服飾\n褲子・裙裝\n連衣裙\n其他\n童裝',
    },
    'k0410y39': {
      'en': 'ACCESSORIES',
      'zh_Hant': 'ACCESSORIES',
    },
    'krtp6bld': {
      'en':
          'BAG , POUCH\nWALLER\nLEATHER GOODS\nCAP , HAT\nJEWELRY\nSHOES\nOTHER\n',
      'zh_Hant': '包/小包\n錢包・\n皮革製品\n帽子・帽子\n珠寶\n鞋履\n其他',
    },
    'tp2kicis': {
      'en': 'SPECIAL',
      'zh_Hant': 'SPECIAL',
    },
    'iymi83bq': {
      'en': 'ALL ITEMS\n',
      'zh_Hant': '所有項目',
    },
    'wzyh4td0': {
      'en': 'ABOUTS US     ',
      'zh_Hant': '關於我們',
    },
    'ryz463d8': {
      'en': 'BRAND STYLE\nPRIVACY POLICY   \nLEGAL\nTERMS OF USE',
      'zh_Hant': 'BRAND SLYTE\n隱私權政策\n法律聲明\n使用條款',
    },
    '0py2vuwo': {
      'en': 'MY PAGE',
      'zh_Hant': '我的頁面',
    },
    'zar2z64b': {
      'en': 'LOG IN\nORDER HISTORY\nWISH LIST\n',
      'zh_Hant': '登錄\n訂單歷史\n願望清單\n',
    },
    'v5he4ws2': {
      'en': 'CUSTOMER SERVICE',
      'zh_Hant': '客戶服務',
    },
    't3jjojy4': {
      'en': 'SHOPPING GUIDE\nCONTACT\n',
      'zh_Hant': '購物指南\n聯繫',
    },
    'mwe63xc2': {
      'en': '© UNDERCOVER',
      'zh_Hant': '© UNDERCOVER',
    },
    'plf6uimi': {
      'en': 'HOME',
      'zh_Hant': '首頁',
    },
    'p40q3eay': {
      'en': 'WISH',
      'zh_Hant': '願望清單',
    },
    'jmnzk9bz': {
      'en': 'SEARCH',
      'zh_Hant': '搜尋',
    },
    '95np5he7': {
      'en': 'MY PAGE',
      'zh_Hant': '我的頁面',
    },
    '1aimq9cd': {
      'en': 'CART',
      'zh_Hant': '購物車',
    },
    'djyhc3cv': {
      'en': 'Home',
      'zh_Hant': '',
    },
  },
  // UNDERCOVERXFRGMT
  {
    'u9accrfw': {
      'en': 'UNDERCOVER    >    SPECIAL     > UNDERCOVER X FRGMNT ',
      'zh_Hant': '',
    },
    '69wqds38': {
      'en': 'HOME',
      'zh_Hant': '',
    },
    '35th6wvt': {
      'en': 'WISH',
      'zh_Hant': '',
    },
    'hphaxqef': {
      'en': 'SEARCH',
      'zh_Hant': '',
    },
    'oof6bp6p': {
      'en': 'MY PAGE',
      'zh_Hant': '',
    },
    '1hll0fju': {
      'en': 'CART',
      'zh_Hant': '',
    },
    'cytxjtus': {
      'en': 'UNDERCVOER X GRGMNT',
      'zh_Hant': '',
    },
    'vyph09xv': {
      'en': '15 ITEMS',
      'zh_Hant': '',
    },
    'wargvxlx': {
      'en': 'CATEGORY',
      'zh_Hant': '',
    },
    'uu3rkzel': {
      'en': 'SORT BY',
      'zh_Hant': '',
    },
    'oe8hgrj2': {
      'en': '1-15 / 15',
      'zh_Hant': '',
    },
    'xpo0i90o': {
      'en': 'UC2C9301-1\n￥240,240',
      'zh_Hant': '',
    },
    'vhj3xt1c': {
      'en': 'UC2C9301-1\n￥240,240',
      'zh_Hant': '',
    },
    '094k20x7': {
      'en': 'UC2C1207-1\n￥195,195',
      'zh_Hant': '',
    },
    '9apm8z19': {
      'en': 'UC2C1207-1\n￥195,195',
      'zh_Hant': '',
    },
    't68k7mh7': {
      'en': 'UC2C4912\n￥97,597',
      'zh_Hant': '',
    },
    'ammy5op7': {
      'en': 'UC2C4912\n￥97,597',
      'zh_Hant': '',
    },
    '8468m5z3': {
      'en': 'UC2C1207-1\n￥195,195',
      'zh_Hant': '',
    },
    'o0v00jcq': {
      'en': 'UC2C1207-1\n￥195,195',
      'zh_Hant': '',
    },
    'fs8kgfem': {
      'en': 'UC2C1306\n￥375,375',
      'zh_Hant': '',
    },
    'zgxzld48': {
      'en': 'UC2C1306\n￥375,375',
      'zh_Hant': '',
    },
    'p5sq0wsw': {
      'en': 'UC2C1201-2\n￥420,420',
      'zh_Hant': '',
    },
    'y9o2ct57': {
      'en': 'UC2C1303-2\n￥540,540',
      'zh_Hant': '',
    },
    'to0lwume': {
      'en': 'UC2C1S02-2\n￥270,270',
      'zh_Hant': '',
    },
    'kdixqo0v': {
      'en': 'UC2C1S02-2\n￥270,270',
      'zh_Hant': '',
    },
    'zhfo6hn4': {
      'en': 'UC2C9812-1\n￥54,054',
      'zh_Hant': '',
    },
    'kowp32w6': {
      'en': 'UC2C9812-1\n￥54,054',
      'zh_Hant': '',
    },
    '80bkumvr': {
      'en': 'UC2C9812-1\n￥54,054',
      'zh_Hant': '',
    },
    '1ragwllw': {
      'en': 'RECENTLY VIEWED',
      'zh_Hant': '',
    },
    '2botvnqx': {
      'en': 'UC2C1301-1\n¥240,240 ',
      'zh_Hant': '',
    },
    'ef2bmrjd': {
      'en': 'UNDERCOVER    >    SPECIAL     > UNDERCOVER X FRGMNT ',
      'zh_Hant': '',
    },
    'eb63y3ic': {
      'en': 'NEW CUSTOMERS',
      'zh_Hant': '',
    },
    'j2ko3qb8': {
      'en': 'NEWSLETTER',
      'zh_Hant': '',
    },
    'vl110dqh': {
      'en': 'MENS',
      'zh_Hant': '',
    },
    '8qvq9haa': {
      'en':
          'NEW ARRIVALS\nOUTWEAR\nSHIRTS\nT-SHIRTS\nSWEATER , CUT&SEW\nPANTS\nOTHER\nKIDS\n',
      'zh_Hant': '',
    },
    'rcy1smsk': {
      'en': 'WOMENS',
      'zh_Hant': '',
    },
    'afvd1aue': {
      'en':
          'NEW ARRIVALS\nOUTWEAR\nSHIRTS\nT-SHIRTS\nSWEATER , CUT&SEW\nPANTS , \nDRESSES\nOTHER\nKIDS\n',
      'zh_Hant': '',
    },
    '2p97xjco': {
      'en': 'ACCESSORIES',
      'zh_Hant': '',
    },
    'iznkpto9': {
      'en':
          'BAG , PORCH\nWALLER\nLEATHER GOODS\nCAP , HAT\nJEWELRY\nSHOES\nOTHER\n',
      'zh_Hant': '',
    },
    '4kivy70w': {
      'en': 'SPECIAL',
      'zh_Hant': '',
    },
    '9ye286bx': {
      'en': 'ALL ITEMS\n',
      'zh_Hant': '',
    },
    'vssp6jtn': {
      'en': 'ABOUTS US     ',
      'zh_Hant': '',
    },
    'l5l2eqkx': {
      'en': 'BRAND STYLE\nPRIVACY POLICY   \nLEGAL\nTERMS OF USE',
      'zh_Hant': '',
    },
    'tm5s7emc': {
      'en': 'MY PAGE',
      'zh_Hant': '',
    },
    'oralcq5s': {
      'en': 'LOG IN\nORDER HISTORY\nWISH LIST\n',
      'zh_Hant': '',
    },
    'i4aeih7r': {
      'en': 'CUSTOMER SERVICE',
      'zh_Hant': '',
    },
    '50l7k2c0': {
      'en': 'SHOPPING GUIDE\nCONTACT\n',
      'zh_Hant': '',
    },
    '5r1caowb': {
      'en': '© UNDERCOVER',
      'zh_Hant': '',
    },
    '71qa470h': {
      'en': 'Home',
      'zh_Hant': '',
    },
  },
  // MYPAGE
  {
    'tupvb8vi': {
      'en': 'HOME',
      'zh_Hant': '',
    },
    'wvnua1j3': {
      'en': 'WISH',
      'zh_Hant': '',
    },
    'vdfrq4to': {
      'en': 'SEARCH',
      'zh_Hant': '',
    },
    '3pauuhu0': {
      'en': 'MY PAGE',
      'zh_Hant': '',
    },
    'nvbghzk8': {
      'en': 'CART',
      'zh_Hant': '',
    },
    'cpl3ftx5': {
      'en': 'NEW CUSTOMERS',
      'zh_Hant': '',
    },
    'k8lz020m': {
      'en':
          'Your shopping experience may become more convenient with a simple registration.\n\nWe will save your address information, birthday, etc., for your next purchase.\n\nWe will also provide you with the latest information and members-only services.\n',
      'zh_Hant': '',
    },
    '1oahk4qk': {
      'en': 'SIGN UP',
      'zh_Hant': '',
    },
    '9uhyf8zu': {
      'en': 'LOG IN',
      'zh_Hant': '',
    },
    'z3r87tb0': {
      'en': 'Email address',
      'zh_Hant': '',
    },
    'wdt6u4u0': {
      'en': 'Password',
      'zh_Hant': '',
    },
    'g3l60lhk': {
      'en': 'Forgot your passsword?',
      'zh_Hant': '',
    },
    'nd5fihk0': {
      'en': 'Stay logged in',
      'zh_Hant': '',
    },
    '5xy55kax': {
      'en': 'LOG IN',
      'zh_Hant': '',
    },
    'o9536t4c': {
      'en': 'NEW CUSTOMERS',
      'zh_Hant': '',
    },
    'rwabsdio': {
      'en': 'NEWSLETTER',
      'zh_Hant': '',
    },
    '57pytt21': {
      'en': 'ABOUTS US     ',
      'zh_Hant': '',
    },
    '0v0cwoyj': {
      'en': 'BRAND STYLE\nPRIVACY POLICY   \nLEGAL\nTERMS OF USE',
      'zh_Hant': '',
    },
    'vewqr2h6': {
      'en': '© UNDERCOVER',
      'zh_Hant': '',
    },
    '9rhw611v': {
      'en': 'Home',
      'zh_Hant': '',
    },
  },
  // SEARCH
  {
    '75jp2t52': {
      'en': 'SEARCH...',
      'zh_Hant': '',
    },
    'q8zoolgs': {
      'en': 'HOME',
      'zh_Hant': '',
    },
    '0j7skgn1': {
      'en': 'WISH',
      'zh_Hant': '',
    },
    'sauhvfh7': {
      'en': 'SEARCH',
      'zh_Hant': '',
    },
    'x70890to': {
      'en': 'MY PAGE',
      'zh_Hant': '',
    },
    'mq93wk6o': {
      'en': 'CART',
      'zh_Hant': '',
    },
    'dzhk6ru3': {
      'en': 'MENS',
      'zh_Hant': '',
    },
    'ktv99ttv': {
      'en': 'WOMENS',
      'zh_Hant': '',
    },
    'ia451ewf': {
      'en': 'ACCESSORIES',
      'zh_Hant': '',
    },
    'dmpdgr9v': {
      'en': 'WORLD OF U',
      'zh_Hant': '',
    },
    'zknfjx7a': {
      'en': 'COLLECTIONS',
      'zh_Hant': '',
    },
    'gcfrgx5y': {
      'en': 'NEWS',
      'zh_Hant': '',
    },
    'bbuk1xgk': {
      'en': 'STORE LIST',
      'zh_Hant': '',
    },
    '96799bk1': {
      'en': 'HISTORY OF U',
      'zh_Hant': '',
    },
    'j4fl6y5g': {
      'en': 'LANGUAGE',
      'zh_Hant': '',
    },
    'u0cg7jly': {
      'en': 'CATEGORY',
      'zh_Hant': '',
    },
    'qggx7im8': {
      'en': 'NEW ARRIVALS',
      'zh_Hant': '',
    },
    'vhgj0nrv': {
      'en': 'OUTWEAR',
      'zh_Hant': '',
    },
    'lkdxco7v': {
      'en': 'SHIRTS',
      'zh_Hant': '',
    },
    'e828yvjv': {
      'en': 'T-SHIRT',
      'zh_Hant': '',
    },
    'kaug7kor': {
      'en': 'SWEATER ,\nCUT &SEW',
      'zh_Hant': '',
    },
    '2mgw9ql2': {
      'en': 'PANTS',
      'zh_Hant': '',
    },
    'bd86dag7': {
      'en': 'OTHER',
      'zh_Hant': '',
    },
    'mj6qlt2h': {
      'en': 'KIDS',
      'zh_Hant': '',
    },
    '6kq2wsfr': {
      'en': 'SPECIAL',
      'zh_Hant': '',
    },
    'p1zff0vt': {
      'en': 'FRGMT X \nUNDERCOVER',
      'zh_Hant': '',
    },
    '44ophjy9': {
      'en': 'THE NORTH FACE x\nUNDERCOER',
      'zh_Hant': '',
    },
    '7wb59e4t': {
      'en': 'nonnative x \nUNDERCOVER',
      'zh_Hant': '',
    },
    'smubrcnf': {
      'en': 'ANARCHY CHAIR',
      'zh_Hant': '',
    },
    '9iokp2tq': {
      'en': 'MEDICOM TOY x\nUNDERCOVER',
      'zh_Hant': '',
    },
    'py4zxfcl': {
      'en': 'Home',
      'zh_Hant': '',
    },
  },
  // CLOTHESDETAIL
  {
    'y10qjtq6': {
      'en': 'UNDERCOVER    >    UNDERCOVER X FRGMNT     >  UC2C1301-1',
      'zh_Hant': '',
    },
    '927l7sod': {
      'en': 'HOME',
      'zh_Hant': '',
    },
    'ojdroinm': {
      'en': 'WISH',
      'zh_Hant': '',
    },
    'wxjihb4l': {
      'en': 'SEARCH',
      'zh_Hant': '',
    },
    '2gjl62o9': {
      'en': 'MY PAGE',
      'zh_Hant': '',
    },
    '62tdv9ft': {
      'en': 'CART',
      'zh_Hant': '',
    },
    'iyt3tjvn': {
      'en': 'UC2C1301-1\n\n¥240,240 ',
      'zh_Hant': '',
    },
    'qttor2gs': {
      'en': '\$ 1,633.63 USD (December 5, 2:03 JST)',
      'zh_Hant': '',
    },
    'utypgtc1': {
      'en': '€ 1,508.71 EUR (December 5, 2:03 JST)',
      'zh_Hant': '',
    },
    'jg4snltw': {
      'en': '¥ 11,658.85 CNY (December 5, 2:03 JST)',
      'zh_Hant': '',
    },
    'uxtmoklb': {
      'en': 'HK\$ 12,768.76 HKD (December 5, 2:03 JST)',
      'zh_Hant': '',
    },
    'c5lcb8kx': {
      'en': 'NT\$ 51,375.32 TWD (December 5, 2:03 JST)',
      'zh_Hant': '',
    },
    's4vals7o': {
      'en': '₩ 2,138,563.63 KRW (December 5, 2:03 JST)',
      'zh_Hant': '',
    },
    'edappdfl': {
      'en': 'LOCAL PRICE',
      'zh_Hant': '',
    },
    '83xlmfh2': {
      'en': 'Search for an item...',
      'zh_Hant': '',
    },
    'ffh5287k': {
      'en': 'RESTOCK MAIL',
      'zh_Hant': '',
    },
    'apls7h69': {
      'en': 'WISH LIST',
      'zh_Hant': '',
    },
    '9znex0ab': {
      'en':
          '-Collaboration item with Fragment Design\n-Manual Göttsching\'s masterpiece \"\"E2-E4\"\" stainless steel coat\n-With a batting\n-Switching collar material\n-Side zipper\n\n©2023 Manuel Göttsching. All rights reserved.\n\n\n\nMATERIAL\n\n\nSIZE GUIDE\n',
      'zh_Hant': '',
    },
    'qdnq3s5s': {
      'en': 'RECENTLY VIEWED',
      'zh_Hant': '',
    },
    'eh08hi51': {
      'en': 'UC2C1301-1\n￥240,240',
      'zh_Hant': '',
    },
    '85zp59ht': {
      'en': 'UNDERCOVER    >    UNDERCOVER X FRGMNT     >  UC2C1301-1',
      'zh_Hant': '',
    },
    'hofnt7dt': {
      'en': 'NEW CUSTOMERS',
      'zh_Hant': '',
    },
    'r5pc82or': {
      'en': 'NEWSLETTER',
      'zh_Hant': '',
    },
    'sr8rr0xj': {
      'en': 'MENS',
      'zh_Hant': '',
    },
    'y8blg3bs': {
      'en':
          'NEW ARRIVALS\nOUTWEAR\nSHIRTS\nT-SHIRTS\nSWEATER , CUT&SEW\nPANTS\nOTHER\nKIDS\n',
      'zh_Hant': '',
    },
    'ocr97sz2': {
      'en': 'WOMENS',
      'zh_Hant': '',
    },
    'gpnrjzt6': {
      'en':
          'NEW ARRIVALS\nOUTWEAR\nSHIRTS\nT-SHIRTS\nSWEATER , CUT&SEW\nPANTS , \nDRESSES\nOTHER\nKIDS\n',
      'zh_Hant': '',
    },
    'tjy77fe2': {
      'en': 'ACCESSORIES',
      'zh_Hant': '',
    },
    'iuhv67we': {
      'en':
          'BAG , PORCH\nWALLER\nLEATHER GOODS\nCAP , HAT\nJEWELRY\nSHOES\nOTHER\n',
      'zh_Hant': '',
    },
    'ol8j34pa': {
      'en': 'SPECIAL',
      'zh_Hant': '',
    },
    '8d8kk9ec': {
      'en': 'ALL ITEMS\n',
      'zh_Hant': '',
    },
    'cfx7q1wm': {
      'en': 'ABOUTS US     ',
      'zh_Hant': '',
    },
    'tk5peumj': {
      'en': 'BRAND STYLE\nPRIVACY POLICY   \nLEGAL\nTERMS OF USE',
      'zh_Hant': '',
    },
    'x6kszgnq': {
      'en': 'MY PAGE',
      'zh_Hant': '',
    },
    '95najyk1': {
      'en': 'LOG IN\nORDER HISTORY\nWISH LIST\n',
      'zh_Hant': '',
    },
    'lxk7yllu': {
      'en': 'CUSTOMER SERVICE',
      'zh_Hant': '',
    },
    'g4peg7ha': {
      'en': 'SHOPPING GUIDE\nCONTACT\n',
      'zh_Hant': '',
    },
    'w8504sgj': {
      'en': '© UNDERCOVER',
      'zh_Hant': '',
    },
    '9dtfz4ne': {
      'en': 'Home',
      'zh_Hant': '',
    },
  },
  // Miscellaneous
  {
    's5qn9kdf': {
      'en': '',
      'zh_Hant': '',
    },
    'ah2qotkg': {
      'en': '',
      'zh_Hant': '',
    },
    'z6qcaabo': {
      'en': '',
      'zh_Hant': '',
    },
    'zrg5ucwt': {
      'en': '',
      'zh_Hant': '',
    },
    '06gz2ygj': {
      'en': '',
      'zh_Hant': '',
    },
    'zsmqixkk': {
      'en': '',
      'zh_Hant': '',
    },
    'afmekbwo': {
      'en': '',
      'zh_Hant': '',
    },
    'k2ea9vx3': {
      'en': '',
      'zh_Hant': '',
    },
    'lhcmnwh7': {
      'en': '',
      'zh_Hant': '',
    },
    'gbktjy3r': {
      'en': '',
      'zh_Hant': '',
    },
    'n72gf9fc': {
      'en': '',
      'zh_Hant': '',
    },
    'l8edwmnq': {
      'en': '',
      'zh_Hant': '',
    },
    'tpc35jc5': {
      'en': '',
      'zh_Hant': '',
    },
    'c14v4gan': {
      'en': '',
      'zh_Hant': '',
    },
    '11rdabjt': {
      'en': '',
      'zh_Hant': '',
    },
    'mxyxz2n5': {
      'en': '',
      'zh_Hant': '',
    },
    'udz9d1kw': {
      'en': '',
      'zh_Hant': '',
    },
    'tcnmb7gq': {
      'en': '',
      'zh_Hant': '',
    },
    'dbbwa9f0': {
      'en': '',
      'zh_Hant': '',
    },
    'ptf04ojt': {
      'en': '',
      'zh_Hant': '',
    },
    '4qzozadw': {
      'en': '',
      'zh_Hant': '',
    },
    'vuzk40a6': {
      'en': '',
      'zh_Hant': '',
    },
    'ifjwunf7': {
      'en': '',
      'zh_Hant': '',
    },
  },
].reduce((a, b) => a..addAll(b));
