DECLARE
   v_nls_param   VARCHAR2(20);
   v_sql         VARCHAR2(200);
   v_nls_charset VARCHAR2(200) :='NLS_NCHAR_CHARACTERSET';
BEGIN 
  v_sql := 'SELECT VALUE FROM nls_database_parameters WHERE PARAMETER=:1';
  EXECUTE IMMEDIATE v_sql INTO v_nls_param USING v_nls_charset;
  IF ( v_nls_param in ('AL32UTF8', 'UTF8', 'AL16UTF16') ) THEN
INSERT ALL 
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1, 'ja', UNISTR('\007b\0031\007d\0020\007b\0032\007d\306f\5b58\5728\3057\307e\305b\3093\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (2, 'ja', UNISTR('\007b\0031\007d\0020\007b\0032\007d\306f\3059\3067\306b\5b58\5728\3057\307e\3059\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (3, 'ja', UNISTR('\007b\0032\007d\306b\3088\308a\007b\0031\007d\304c\5931\6557\3057\307e\3057\305f\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (4, 'ja', UNISTR('\7121\52b9\306a\5165\529b\3067\3059\003a\0020\007b\0031\007d\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (5, 'ja', UNISTR('\3053\306e\30ce\30fc\30c9\306e\5165\529b\30bd\30fc\30b9\306b\30c7\30fc\30bf\304c\542b\307e\308c\3066\3044\307e\305b\3093\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (6, 'ja', UNISTR('\30ce\30fc\30c9\3067\7a7a\306e\51fa\529b\7d50\679c\304c\751f\6210\3055\308c\307e\3059\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (7, 'ja', UNISTR('\7121\52b9\306a\30b3\30b9\30c8\30fb\30d9\30cd\30d5\30a3\30c3\30c8\30fb\30de\30c8\30ea\30c3\30af\30b9\3067\3059\003a\0020\007b\0031\007d\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (8, 'ja', UNISTR('\30bf\30fc\30b2\30c3\30c8\007b\0031\007d\306b\500b\5225\5024\304c\0031\3064\3057\304b\542b\307e\308c\3066\3044\307e\305b\3093\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (9, 'ja', UNISTR('\30bf\30fc\30b2\30c3\30c8\007b\0031\007d\306f\500b\5225\5024\306e\6700\5927\6570\3092\8d85\3048\3066\3044\307e\3059\3002\500b\5225\5024\306e\0020\8a31\5bb9\6700\5927\6570\306f\007b\0032\007d\3067\3059\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (10, 'ja', UNISTR('\30bf\30fc\30b2\30c3\30c8\007b\0031\007d\306b\4e00\610f\306e\5024\304c\542b\307e\308c\3066\3044\307e\3059\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (11, 'ja', UNISTR('\30bf\30fc\30b2\30c3\30c8\007b\0031\007d\306b\004e\0055\004c\004c\5024\304c\542b\307e\308c\3066\3044\307e\3059\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (12, 'ja', UNISTR('\30bf\30fc\30b2\30c3\30c8\007b\0031\007d\306b\3059\3079\3066\306e\7a7a\767d\5024\304c\542b\307e\308c\3066\3044\307e\3059\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (13, 'ja', UNISTR('\30bf\30fc\30b2\30c3\30c8\007b\0031\007d\306b\3059\3079\3066\306e\004e\0055\004c\004c\5024\304c\542b\307e\308c\3066\3044\307e\3059\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (14, 'ja', UNISTR('\30c7\30fc\30bf\578b\007b\0032\007d\306e\30bf\30fc\30b2\30c3\30c8\007b\0031\007d\306f\007b\0033\007d\3068\4e92\63db\6027\304c\306a\3044\0020\53ef\80fd\6027\304c\3042\308a\307e\3059\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (15, 'ja', UNISTR('\30bf\30fc\30b2\30c3\30c8\007b\0031\007d\306b\306f\65e2\5b58\306e\30e2\30c7\30eb\3068\4e92\63db\6027\304c\306a\3044\0020\5024\007b\0032\007d\304c\542b\307e\308c\3066\3044\307e\3059\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (16, 'ja', UNISTR('\30bf\30fc\30b2\30c3\30c8\007b\0031\007d\306e\30c7\30fc\30bf\578b\007b\0032\007d\306b\4e92\63db\6027\304c\3042\308a\307e\305b\3093\0028\0056\0041\0052\0043\0048\0041\0052\0032\3001\0020\0043\0048\0041\0052\3001\004e\0055\004d\0042\0045\0052\307e\305f\306f\0046\004c\004f\0041\0054\306e\307f\304c\4f7f\7528\3067\304d\307e\3059\0029\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (17, 'ja', UNISTR('\30b1\30fc\30b9\0049\0044\0020\007b\0031\007d\306b\4e00\610f\306e\5024\304c\542b\307e\308c\3066\3044\307e\305b\3093\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (18, 'ja', UNISTR('\007b\0031\007d\0020\007b\0032\007d\304c\3042\308a\307e\305b\3093\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (19, 'ja', UNISTR('\007b\0031\007d\0020\007b\0032\007d\306b\542b\307e\308c\3066\3044\308b\500b\5225\5024\304c\591a\3059\304e\307e\3059\3002\8a31\53ef\3055\308c\308b\0020\500b\5225\5024\306e\6700\5927\6570\306f\007b\0033\007d\3067\3059') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (20, 'ja', UNISTR('\0047\004c\004d\3067\306f\30d0\30a4\30ca\30ea\30fb\30bf\30fc\30b2\30c3\30c8\6307\5b9a\0028\0032\3064\306e\5024\0029\306e\307f\304c\53d7\3051\5165\308c\0020\3089\308c\307e\3059\3002\9078\629e\3057\305f\30bf\30fc\30b2\30c3\30c8\007b\0031\007d\306b\306f\0033\3064\4ee5\4e0a\306e\5024\304c\542b\307e\308c\3066\0020\3044\307e\3059\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (21, 'ja', UNISTR('\7121\52b9\306a\5c5e\6027\306e\9069\7528\003a\0020\007b\0031\007d\3002\5c5e\6027\306e\30c7\30fc\30bf\578b\306f\0020\007b\0032\007d\3067\3059\304c\3001\30e2\30c7\30eb\007b\0033\007d\306e\4f5c\6210\306b\4f7f\7528\3055\308c\305f\0020\5c5e\6027\306e\30c7\30fc\30bf\578b\306f\007b\0034\007d\3067\3059\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (22, 'ja', UNISTR('\30ef\30fc\30af\30d5\30ed\30fc\306e\5b9f\884c\306f\30e6\30fc\30b6\30fc\306b\3088\3063\3066\53d6\308a\6d88\3055\308c\307e\3057\305f\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (23, 'ja', UNISTR('\30ef\30fc\30af\30d5\30ed\30fc\306f\5b9f\884c\3055\308c\3066\3044\307e\305b\3093\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (24, 'ja', UNISTR('\5217\007b\0031\007d\3067\30c6\30fc\30de\304c\751f\6210\3055\308c\3066\3044\307e\305b\3093\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (25, 'ja', UNISTR('\30e2\30c7\30eb\69cb\7bc9\306e\7814\4fee\30c7\30fc\30bf\306b\4e88\6e2c\5b50\304c\898b\3064\304b\308a\307e\305b\3093\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (26, 'ja', UNISTR('\5165\529b\5217\007b\0031\007d\306e\30c7\30fc\30bf\578b\007b\0032\007d\306b\4e92\63db\6027\304c\3042\308a\307e\305b\3093\0028\0056\0041\0052\0043\0048\0041\0052\0032\3001\0020\0043\0048\0041\0052\3001\004e\0055\004d\0042\0045\0052\307e\305f\306f\0046\004c\004f\0041\0054\306e\307f\304c\4f7f\7528\3067\304d\307e\3059\0029\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (27, 'ja', UNISTR('\5165\529b\5217\007b\0031\007d\306e\30c7\30fc\30bf\578b\007b\0032\007d\306b\4e92\63db\6027\304c\3042\308a\307e\305b\3093\0028\0056\0041\0052\0043\0048\0041\0052\0032\3001\0020\0043\0048\0041\0052\3001\004e\0055\004d\0042\0045\0052\002c\0020\0046\004c\004f\0041\0054\002c\0020\0044\004d\005f\004e\0045\0053\0054\0045\0044\005f\004e\0055\004d\0045\0052\0049\0043\0041\004c\0053\3001\0020\307e\305f\306f\0044\004d\005f\004e\0045\0053\0054\0045\0044\005f\0043\0041\0054\0045\0047\004f\0052\0049\0043\0041\004c\0053\306e\307f\304c\4f7f\7528\3067\304d\307e\3059\0029\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (28, 'ja', UNISTR('\30c6\30ad\30b9\30c8\5909\63db\3067\4f7f\7528\3055\308c\308b\007b\0031\007d\0020\007b\0032\007d\304c\3042\308a\307e\305b\3093\3002\0020\5bfe\5fdc\3059\308b\300c\30c6\30ad\30b9\30c8\306e\69cb\7bc9\300d\30ce\30fc\30c9\3092\5b9f\884c\3057\3066\3001\007b\0031\007d\3092\518d\4f5c\6210\0020\3057\3066\304f\3060\3055\3044\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (29, 'ja', UNISTR('\542b\307e\308c\3066\3044\308b\30ef\30fc\30af\30d5\30ed\30fc\304c\5225\306e\30bb\30c3\30b7\30e7\30f3\3067\4f7f\7528\3055\308c\3066\3044\308b\304b\0020\5b9f\884c\4e2d\3067\3042\308b\305f\3081\3001\30d7\30ed\30b8\30a7\30af\30c8\306e\524a\9664\306b\5931\6557\3057\307e\3057\305f\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (30, 'ja', UNISTR('\73fe\5728\306e\30e6\30fc\30b6\30fc\306b\306f\3001\8868\307e\305f\306f\30d3\30e5\30fc\306f\76f4\63a5\4ed8\4e0e\3055\308c\3066\3044\307e\305b\3093\3002\0020\3053\306e\305f\3081\3001\0044\0061\0074\0061\0020\004d\0069\006e\0065\0072\304c\30d3\30e5\30fc\306e\4f5c\6210\3092\8a66\884c\3059\308b\3068\5931\6557\3057\307e\3059\3002\8868\002f\30d3\30e5\30fc\003a\0020\007b\0031\007d\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (31, 'ja', UNISTR('\6b21\306e\30ce\30fc\30c9\3067\306e\4e88\671f\305b\306c\969c\5bb3\306b\3088\308a\30ef\30fc\30af\30d5\30ed\30fc\304c\5931\6557\3057\305f\305f\3081\3001\751f\6210\3055\308c\305f\30b3\30a2\30fb\30c0\30f3\30d7\304c\3042\308b\304b\3069\3046\304b\3092\8abf\3079\3066\304f\3060\3055\3044\003a\0020\007b\0031\007d\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (32, 'ja', UNISTR('\30bf\30fc\30b2\30c3\30c8\007b\0031\007d\306e\30c7\30fc\30bf\578b\007b\0032\007d\306b\4e92\63db\6027\304c\3042\308a\307e\305b\3093\0028\0056\0041\0052\0043\0048\0041\0052\0032\3001\0043\0048\0041\0052\3001\004e\0055\004d\0042\0045\0052\3001\0046\004c\004f\0041\0054\3001\0042\0049\004e\0041\0052\0059\005f\0044\004f\0055\0042\004c\0045\307e\305f\306f\0042\0049\004e\0041\0052\0059\005f\0046\004c\004f\0041\0054\306e\307f\304c\4f7f\7528\3067\304d\307e\3059\0029\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (33, 'ja', UNISTR('\30bf\30fc\30b2\30c3\30c8\007b\0031\007d\306e\6570\5024\30c7\30fc\30bf\578b\007b\0032\007d\306b\4e92\63db\6027\304c\3042\308a\307e\305b\3093\0028\004e\0055\004d\0042\0045\0052\307e\305f\306f\0046\004c\004f\0041\0054\306e\307f\304c\4f7f\7528\3067\304d\307e\3059\0029\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (34, 'ja', UNISTR('\30bf\30fc\30b2\30c3\30c8\007b\0031\007d\306e\6570\5024\30c7\30fc\30bf\578b\007b\0032\007d\306b\4e92\63db\6027\304c\3042\308a\307e\305b\3093\0028\004e\0055\004d\0042\0045\0052\3001\0046\004c\004f\0041\0054\3001\0042\0049\004e\0041\0052\0059\005f\0044\004f\0055\0042\004c\0045\307e\305f\306f\0042\0049\004e\0041\0052\0059\005f\0046\004c\004f\0041\0054\306e\307f\304c\4f7f\7528\3067\304d\307e\3059\0029\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (35, 'ja', UNISTR('\30a4\30f3\30dd\30fc\30c8\3059\308b\30ef\30fc\30af\30d5\30ed\30fc\30fb\30d0\30fc\30b8\30e7\30f3\007b\0031\007d\306b\3001\30ea\30dd\30b8\30c8\30ea\3068\306e\4e92\63db\6027\304c\3042\308a\307e\305b\3093\3002\30a4\30f3\30dd\30fc\30c8\306f\4e2d\65ad\3055\308c\307e\3057\305f\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (36, 'ja', UNISTR('\5c5e\6027\91cd\8981\5ea6\30bf\30fc\30b2\30c3\30c8\5217\007b\0031\007d\306e\500b\5225\4ef6\6570\007b\0032\007d\304c\3001\007b\0033\007d\30ab\30c3\30c8\30aa\30d5\5024\4ee5\4e0a\3067\3059\3002\0020\3053\306e\305f\3081\3001\30b7\30b9\30c6\30e0\30fb\30ea\30bd\30fc\30b9\304c\5727\8feb\3055\308c\3001\30b7\30b9\30c6\30e0\80fd\529b\306b\3088\3063\3066\306f\554f\5408\305b\304c\5931\6557\3059\308b\53ef\80fd\6027\304c\3042\308a\307e\3059\3002\0020\3053\306e\30ce\30fc\30c9\3092\5b9f\884c\3059\308b\524d\306b\5217\306e\30d3\30cb\30f3\30b0\3092\691c\8a0e\3059\308b\304b\3001\30b5\30f3\30d7\30eb\306e\8a2d\5b9a\3092\30e9\30f3\30c0\30e0\306b\5909\66f4\3057\3066\304f\3060\3055\3044\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (37, 'ja', UNISTR('\5c5e\6027\91cd\8981\5ea6\30bf\30fc\30b2\30c3\30c8\5217\007b\0031\007d\306e\500b\5225\4ef6\6570\007b\0032\007d\304c\3001\007b\0033\007d\30ab\30c3\30c8\30aa\30d5\5024\4ee5\4e0a\3067\3059\3002\0020\3053\306e\305f\3081\3001\30d7\30ed\30bb\30b9\306e\5b9f\884c\6642\9593\304c\9577\304f\306a\308b\53ef\80fd\6027\304c\3042\308a\307e\3059\3002\0020\3053\306e\30ce\30fc\30c9\3092\5b9f\884c\3059\308b\524d\306b\5217\306e\30d3\30cb\30f3\30b0\3092\691c\8a0e\3057\3066\304f\3060\3055\3044\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (38, 'ja', UNISTR('\007b\0031\007d\0020\007b\0032\007d\306e\500b\5225\4ef6\6570\304c\007b\0033\007d\30ab\30c3\30c8\30aa\30d5\5024\3092\8d85\3048\3066\3044\307e\3059\3002\0020\3053\308c\306b\3088\308a\3001\76f8\95a2\30eb\30fc\30eb\30fb\30e2\30c7\30eb\306e\8cea\304c\4f4e\4e0b\3059\308b\53ef\80fd\6027\304c\3042\308a\307e\3059\3002\0020\3053\306e\30ce\30fc\30c9\3092\5b9f\884c\3059\308b\524d\306b\5217\306e\30d3\30cb\30f3\30b0\3092\691c\8a0e\3057\3066\304f\3060\3055\3044\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (39, 'ja', UNISTR('\3053\306e\30ce\30fc\30c9\3078\306e\5165\529b\30bd\30fc\30b9\30fb\30c7\30fc\30bf\69cb\9020\304c\5909\66f4\3055\308c\307e\3057\305f\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (40, 'ja', UNISTR('\004a\0053\004f\004e\69cb\9020\60c5\5831\306e\751f\6210\306b\5931\6557\3057\307e\3057\305f\003a\0020\007b\0031\007d') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (41, 'ja', UNISTR('\004a\0053\004f\004e\30d1\30fc\30b5\30fc\304c\30a4\30f3\30b9\30c8\30fc\30eb\3055\308c\3066\3044\307e\305b\3093\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (42, 'ja', UNISTR('\004a\0053\004f\004e\5217\007b\0031\007d\306b\69cb\9020\3092\5909\66f4\3057\305f\30c7\30fc\30bf\304c\542b\307e\308c\3066\3044\307e\3059\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (43, 'ja', UNISTR('\3059\3067\306b\5b58\5728\3057\306a\3044\30ce\30fc\30c9\7d71\8a08\8868\3092\53c2\7167\3057\3066\3044\307e\3059\3002\30ce\30fc\30c9\3092\518d\5b9f\884c\3057\3066\8868\3092\518d\4f5c\6210\3057\307e\3059\3002\0020') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (44, 'ja', UNISTR('\5217\007b\0031\007d\304c\751f\6210\3055\308c\305f\7d71\8a08\8868\306b\3042\308a\307e\305b\3093\3002\0020') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (45, 'ja', UNISTR('\6b21\306e\30aa\30d6\30b8\30a7\30af\30c8\540d\304c\65e2\5b58\306e\30ef\30fc\30af\30d5\30ed\30fc\003a\0020\007b\0031\007d\3068\7af6\5408\3057\3066\3044\308b\305f\3081\3001\30ef\30fc\30af\30d5\30ed\30fc\306e\30a4\30f3\30dd\30fc\30c8\306b\5931\6557\3057\307e\3057\305f\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (46, 'ja', UNISTR('\540c\6642\007b\0032\007d\30d7\30ed\30bb\30b9\306e\6700\5927\6570\0028\007b\0031\007d\0029\306b\9054\3057\3066\3044\308b\305f\3081\3001\30d7\30ed\30bb\30b9\304c\30a8\30f3\30ad\30e5\30fc\3055\308c\307e\3059\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (47, 'ja', UNISTR('\30d7\30ed\30bb\30b9\304c\5b9f\884c\3092\958b\59cb\3057\307e\3059\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (48, 'ja', UNISTR('\30d7\30ed\30bb\30b9\30fb\30ed\30c3\30af\5f85\6a5f\30bf\30a4\30e0\30a2\30a6\30c8\0028\007b\0031\007d\79d2\0029\3092\8d85\3048\307e\3057\305f\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (49, 'ja', UNISTR('\30c7\30fc\30bf\30fb\30de\30a4\30cb\30f3\30b0\003a\0020\007b\0031\007d\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (50, 'ja', UNISTR('\30c7\30fc\30bf\30fb\30de\30a4\30cb\30f3\30b0\003a\0020\30d1\30fc\30c6\30a3\30b7\30e7\30f3\003a\0020\007b\0031\007d\3001\007b\0032\007d\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (51, 'ja', UNISTR('\30bf\30fc\30b2\30c3\30c8\007b\0031\007d\306e\30c7\30fc\30bf\9577\306f\007b\0032\007d\3067\3001\0034\0030\0030\0030\30d0\30a4\30c8\306e\4e0a\9650\3092\8d85\3048\3066\3044\307e\3059\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1000, 'ja', UNISTR('\30c7\30fc\30bf\30bd\30fc\30b9') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1001, 'ja', UNISTR('\30ef\30fc\30af\30d5\30ed\30fc') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1002, 'ja', UNISTR('\5206\4f4d\30d3\30cb\30f3\30b0') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1003, 'ja', UNISTR('\5217\306e\0031\3064\306b\5341\5206\306a\30c7\30fc\30bf\304c\3042\308a\307e\305b\3093') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1004, 'ja', UNISTR('\30d3\30cb\30f3\30b0\691c\8a3c') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1005, 'ja', UNISTR('\30c7\30fc\30bf\306b\5341\5206\306a\500b\5225\5024\304c\3042\308a\307e\305b\3093') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1006, 'ja', UNISTR('\8868') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1007, 'ja', UNISTR('\691c\8a3c') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1008, 'ja', UNISTR('\6b20\843d\3057\3066\3044\308b\8868\003a') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1009, 'ja', UNISTR('\5c5e\6027') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1010, 'ja', UNISTR('\6b20\843d\3057\3066\3044\308b\5c5e\6027') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1011, 'ja', UNISTR('\96c6\8a08') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1012, 'ja', UNISTR('\8868\306e\66f4\65b0') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1013, 'ja', UNISTR('\5165\529b\5185\5bb9\304c\4e0d\6b63\3067\3059') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1014, 'ja', UNISTR('\30d3\30e5\30fc') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1015, 'ja', UNISTR('\8868\307e\305f\306f\30d3\30e5\30fc\306e\4f5c\6210') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1016, 'ja', UNISTR('\30c7\30fc\30bf\306e\53c2\7167') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1017, 'ja', UNISTR('\30d3\30eb\30c9') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1018, 'ja', UNISTR('\30c6\30b9\30c8') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1019, 'ja', UNISTR('\5165\529b\30c7\30fc\30bf\304c\7a7a\3067\3059') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1020, 'ja', UNISTR('\30bf\30fc\30b2\30c3\30c8') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1021, 'ja', UNISTR('\5c5e\6027') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1022, 'ja', UNISTR('\4e92\63db\6027\306e\306a\3044\5165\529b\002f\30bf\30fc\30b2\30c3\30c8\002f\30b1\30fc\30b9\0049\0044\5c5e\6027') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1023, 'ja', UNISTR('\30e2\30c7\30eb') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1024, 'ja', UNISTR('\6b20\843d\3057\3066\3044\308b\30e2\30c7\30eb') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1025, 'ja', UNISTR('\0047\004c\004d\3067\306f\30d0\30a4\30ca\30ea\30fb\30bf\30fc\30b2\30c3\30c8\6307\5b9a\0028\0032\3064\306e\5024\0029\306e\307f\304c\53d7\3051\5165\308c\3089\308c\307e\3059\3002\9078\629e\3057\305f\30bf\30fc\30b2\30c3\30c8\306b\306f\0033\3064\4ee5\4e0a\306e\5024\304c\542b\307e\308c\3066\3044\307e\3059\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1026, 'ja', UNISTR('\7121\52b9\306a\30a2\30a4\30c6\30e0\5024\5c5e\6027') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1027, 'ja', UNISTR('\6b20\843d\3057\3066\3044\308b\30e2\30c7\30eb') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1028, 'ja', UNISTR('\9069\7528') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1029, 'ja', UNISTR('\691c\8a3c\306f\5b9f\884c\3055\308c\307e\305b\3093\3067\3057\305f') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1030, 'ja', UNISTR('\30e2\30c7\30eb\8a73\7d30') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1031, 'ja', UNISTR('\30c6\30b9\30c8\306e\8a73\7d30') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1032, 'ja', UNISTR('\30d5\30a3\30eb\30bf\306e\8a73\7d30') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1033, 'ja', UNISTR('\6a5f\80fd\8868') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1034, 'ja', UNISTR('\30dd\30ea\30b7\30fc') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1035, 'ja', UNISTR('\30ec\30af\30b5\30fc') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1036, 'ja', UNISTR('\30b9\30c8\30c3\30d7\30ea\30b9\30c8') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1037, 'ja', UNISTR('\4e92\63db\6027\306e\306a\3044\30b1\30fc\30b9\0049\0044\5c5e\6027') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1038, 'ja', UNISTR('\5217') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1039, 'ja', UNISTR('\4e92\63db\6027\306e\306a\3044\5217\5c5e\6027') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1040, 'ja', UNISTR('\7d50\5408') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1041, 'ja', UNISTR('\30c6\30ad\30b9\30c8') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1042, 'ja', UNISTR('\5206\5272') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1043, 'ja', UNISTR('\5217') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1044, 'ja', UNISTR('\30b5\30f3\30d7\30eb') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1045, 'ja', UNISTR('\5217\30d5\30a3\30eb\30bf') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1046, 'ja', UNISTR('\884c\30d5\30a3\30eb\30bf') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1047, 'ja', UNISTR('\5909\63db') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1048, 'ja', UNISTR('\30ef\30fc\30af\30d5\30ed\30fc\306e\4fdd\5b58') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1049, 'ja', UNISTR('\30ef\30fc\30af\30d5\30ed\30fc\306f\30e6\30fc\30b6\30fc\306b\3088\3063\3066\30ed\30c3\30af\3055\308c\307e\305b\3093\3067\3057\305f') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1050, 'ja', UNISTR('\30ef\30fc\30af\30d5\30ed\30fc\5b9f\884c') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1051, 'ja', UNISTR('\30ef\30fc\30af\30d5\30ed\30fc\306f\3059\3067\306b\5b9f\884c\4e2d\3067\3059') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1052, 'ja', UNISTR('\30ef\30fc\30af\30d5\30ed\30fc\304c\5225\306e\30bb\30c3\30b7\30e7\30f3\3067\3059\3067\306b\4f7f\7528\3055\308c\3066\3044\307e\3059') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1053, 'ja', UNISTR('\30ef\30fc\30af\30d5\30ed\30fc\306e\524a\9664') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1054, 'ja', UNISTR('\56de\5e30\69cb\7bc9') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1055, 'ja', UNISTR('\5206\985e\69cb\7bc9') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1056, 'ja', UNISTR('\30c6\30ad\30b9\30c8\306e\69cb\7bc9') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1057, 'ja', UNISTR('\30c6\30ad\30b9\30c8\306e\9069\7528') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1058, 'ja', UNISTR('\30c6\30ad\30b9\30c8\53c2\7167\306e\69cb\7bc9') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1059, 'ja', UNISTR('\30a2\30a4\30c6\30e0\5024') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1060, 'ja', UNISTR('\30d7\30ed\30b8\30a7\30af\30c8') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1061, 'ja', UNISTR('\30ef\30fc\30af\30d5\30ed\30fc\306e\540d\524d\5909\66f4') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1062, 'ja', UNISTR('\30ef\30fc\30af\30d5\30ed\30fc\5b9a\7fa9\304c\7121\52b9\3067\3059') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1063, 'ja', UNISTR('\958b\59cb') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1064, 'ja', UNISTR('\7d42\4e86') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1065, 'ja', UNISTR('\30ef\30fc\30af\30d5\30ed\30fc') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1066, 'ja', UNISTR('\30ce\30fc\30c9') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1067, 'ja', UNISTR('\0053\0075\0062\004e\006f\0064\0065') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1068, 'ja', UNISTR('\691c\8a3c') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1069, 'ja', UNISTR('\30b5\30f3\30d7\30eb') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1070, 'ja', UNISTR('\30ad\30e3\30c3\30b7\30e5') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1071, 'ja', UNISTR('\7d71\8a08') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1072, 'ja', UNISTR('\6a5f\80fd') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1073, 'ja', UNISTR('\30c7\30fc\30bf\6e96\5099') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1074, 'ja', UNISTR('\30d3\30eb\30c9') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1075, 'ja', UNISTR('\30c6\30b9\30c8') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1076, 'ja', UNISTR('\9069\7528') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1077, 'ja', UNISTR('\5909\63db') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1078, 'ja', UNISTR('\30c6\30ad\30b9\30c8') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1079, 'ja', UNISTR('\0042\0075\0069\006c\0064\0054\0065\0078\0074') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1080, 'ja', UNISTR('\0041\0070\0070\006c\0079\0054\0065\0078\0074') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1081, 'ja', UNISTR('\51fa\529b') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1082, 'ja', UNISTR('\30af\30ea\30fc\30f3\30a2\30c3\30d7') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1083, 'ja', UNISTR('\52d5\7684\4e88\6e2c') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1084, 'ja', UNISTR('\52d5\7684\30af\30e9\30b9\30bf') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1085, 'ja', UNISTR('\52d5\7684\6a5f\80fd') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1086, 'ja', UNISTR('\52d5\7684\306a\7570\5e38') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1087, 'ja', UNISTR('\0053\0051\004c\554f\5408\305b') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1088, 'ja', UNISTR('\30b0\30e9\30d5') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1089, 'ja', UNISTR('\7121\52b9\306a\30ce\30fc\30c9') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1090, 'ja', UNISTR('\004a\0053\004f\004e\30c7\30fc\30bf\306f\69cb\9020\304c\5909\66f4\3055\308c\3066\3044\307e\3059\3002') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1091, 'ja', UNISTR('\30d0\30a4\30f3\30c9\306a\3057') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1092, 'ja', UNISTR('\004e\0075\006c\006c\306e\30d3\30f3') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1093, 'ja', UNISTR('\30ef\30fc\30af\30d5\30ed\30fc\306e\30a8\30af\30b9\30dd\30fc\30c8') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1094, 'ja', UNISTR('\305d\306e\4ed6') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1095, 'ja', UNISTR('\30d7\30ed\30b8\30a7\30af\30c8\306e\4f5c\6210') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1096, 'ja', UNISTR('\30d7\30ed\30b8\30a7\30af\30c8\306e\524a\9664') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1097, 'ja', UNISTR('\30d7\30ed\30b8\30a7\30af\30c8\540d\3092\5909\66f4') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1098, 'ja', UNISTR('\30b3\30e1\30f3\30c8\306e\8a2d\5b9a') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1099, 'ja', UNISTR('\30ef\30fc\30af\30d5\30ed\30fc\306e\4f5c\6210') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1100, 'ja', UNISTR('\30ef\30fc\30af\30d5\30ed\30fc\306e\53d6\6d88\3057') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1101, 'ja', UNISTR('\30ef\30fc\30af\30d5\30ed\30fc\306e\30a4\30f3\30dd\30fc\30c8') )
SELECT * FROM DUAL; 
COMMIT; 
  END IF;
END;
/
