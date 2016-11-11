<?php
/**
 * Основные параметры WordPress.
 *
 * Скрипт для создания wp-config.php использует этот файл в процессе
 * установки. Необязательно использовать веб-интерфейс, можно
 * скопировать файл в "wp-config.php" и заполнить значения вручную.
 *
 * Этот файл содержит следующие параметры:
 *
 * * Настройки MySQL
 * * Секретные ключи
 * * Префикс таблиц базы данных
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** Параметры MySQL: Эту информацию можно получить у вашего хостинг-провайдера ** //
/** Имя базы данных для WordPress */
define('DB_NAME', 'wp_reasanik');

/** Имя пользователя MySQL */
define('DB_USER', 'root');

/** Пароль к базе данных MySQL */
define('DB_PASSWORD', '');

/** Имя сервера MySQL */
define('DB_HOST', 'localhost');

/** Кодировка базы данных для создания таблиц. */
define('DB_CHARSET', 'utf8');

/** Схема сопоставления. Не меняйте, если не уверены. */
define('DB_COLLATE', '');

/**#@+
 * Уникальные ключи и соли для аутентификации.
 *
 * Смените значение каждой константы на уникальную фразу.
 * Можно сгенерировать их с помощью {@link https://api.wordpress.org/secret-key/1.1/salt/ сервиса ключей на WordPress.org}
 * Можно изменить их, чтобы сделать существующие файлы cookies недействительными. Пользователям потребуется авторизоваться снова.
 *
 * @since 2.6.0
 */

define('AUTH_KEY',         'Z.[DGcgc-REgr^=]gBJ-hnx6.GZhM%B$+P+_>F.o[PIdR2|L?ZNOrE)urTw~+`[h');
define('SECURE_AUTH_KEY',  'DBx#r~4H~O(_n:m^m2nGXaS-ZaRh8L~U& rm2V5Inv&&{UBT150zroxt}H*/4 G2');
define('LOGGED_IN_KEY',    'ku^iW68QW6iJyYZX32a@Z+{;/lvaNS}`(CJ[[;OL&32V#vVFulOt-DzJ;ra)iYrw');
define('NONCE_KEY',        'Dn*=ytKF>&+X<a_^Dby*<+KVN9;u?V8~!LBCsTKx|2|+3KzR%?R;=(`l_PO6mP$k');
define('AUTH_SALT',        'uC;Y0i(|}|8,_/L|+q-}3xqgqc1Udz09r<V3Nl!m2Klka-lW|/3rM0.y`{UR`x/,');
define('SECURE_AUTH_SALT', '%?g,xin/g&|/+eW)VJ-qLy=SjLe&{E|D5`YtXn#&g+1>$|X~a,+(XmF1a=pDq0`C');
define('LOGGED_IN_SALT',   'FkBg+P>zkM,XxX<28})Wn3u.dRUqO#;u+xM?Kd|ruK/.pKj|I*!gAG5xl]tTyk17');
define('NONCE_SALT',       '9VV[I$NpB_)`xM6k5ja/StG77)ViYQU1S9BuORl8nRN-+ F#MaF<C;Q=|Udp-:Lq');
/**#@-*/

/**
 * Префикс таблиц в базе данных WordPress.
 *
 * Можно установить несколько сайтов в одну базу данных, если использовать
 * разные префиксы. Пожалуйста, указывайте только цифры, буквы и знак подчеркивания.
 */
$table_prefix  = 'wqkbf_';

/**
 * Для разработчиков: Режим отладки WordPress.
 *
 * Измените это значение на true, чтобы включить отображение уведомлений при разработке.
 * Разработчикам плагинов и тем настоятельно рекомендуется использовать WP_DEBUG
 * в своём рабочем окружении.
 * 
 * Информацию о других отладочных константах можно найти в Кодексе.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
// define('WP_DEBUG', false);

/* Это всё, дальше не редактируем. Успехов! */

/** Абсолютный путь к директории WordPress. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Инициализирует переменные WordPress и подключает файлы. */
require_once(ABSPATH . 'wp-settings.php');
