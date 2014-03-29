<?php


/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, WordPress Language, and ABSPATH. You can find more information
 * by visiting {@link http://codex.wordpress.org/Editing_wp-config.php Editing
 * wp-config.php} Codex page. You can get the MySQL settings from your web host.
 * @package WordPress
 */

define( 'AUTOMATIC_UPDATER_DISABLED', true );

// work around for wp cli script document root with symlink
if ( defined('WP_CLI') ) {
	$options = getopt( '', array('path::') );
	if ( !empty( $options['path'] ) ) {
		$path = $options['path'];
	} else {
		$path = $_SERVER['PWD'];
	}
	if ( !empty( $path ) && strpos( $path, '/wordpress' ) !== false ) {
		$_SERVER['DOCUMENT_ROOT'] = str_replace( '/wordpress','', $path );
	}
}


// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
if ( ! isset($_SERVER['HTTP_HOST']) ) {
	$_SERVER['HTTP_HOST'] = 'local.wordpress-trunk.dev';
}

if ( ! defined( 'WP_SITEURL' ) ) {
	// Backwards compatibility for old qa environments, can be removed after Aug 1 2013
	if ( ! file_exists( $_SERVER['DOCUMENT_ROOT'] . '/wordpress' ) ) {
		$wp_siteurl = $_SERVER['HTTP_HOST'];
	} else {
		$wp_siteurl = $_SERVER['HTTP_HOST'] . '/wordpress';
	}
	define( 'WP_SITEURL', 'http://' . $wp_siteurl );
}

define( 'WP_HOME', 'http://' . $_SERVER['HTTP_HOST'] );

if ( ! defined( 'WP_CONTENT_DIR' ) ) {
	define( 'WP_CONTENT_DIR', $_SERVER['DOCUMENT_ROOT'] . '/wp-content' );
}

if ( ! defined( 'WP_CONTENT_URL' ) ) {
	define( 'WP_CONTENT_URL', WP_HOME . '/wp-content' );
}

if ( ! defined( 'WP_PLUGIN_DIR' ) ) {
	define( 'WP_PLUGIN_DIR', '/srv/www/wordpress-plugins' );
}

if ( ! defined( 'WP_PLUGIN_URL' ) ) {
	define( 'WP_PLUGIN_URL', WP_HOME . '/wp-content/plugins' );
}

if ( ! defined( 'WPMU_PLUGIN_DIR' ) ) {
	define( 'WPMU_PLUGIN_DIR', '/srv/config/wordpress-config/mu-plugins' );
}

if ( ! defined( 'WPMU_PLUGIN_URL' ) ) {
	define( 'WPMU_PLUGIN_URL', WP_HOME . '/wp-content/mu-plugins' );
}

if ( in_array( $_SERVER['HTTP_HOST'], array( 'local.wordpress-trunk.dev', 'local.wordpress.dev' ) ) ) {
	$db_name = 'wordpress_trunk';
} else {
	$tokens = preg_split('/\\.|\\-/', $_SERVER['HTTP_HOST'] );
	$i = count($tokens);
	switch ($i)
	{
		case 0:
			break;
		case 1:
		case 2:
			$db_name = $tokens[0];
			break;
		default:
			$db_name = "{$tokens[$i-3]}_{$tokens[$i-2]}";
			break;
	}
	$db_name = "wp_" . $db_name;
}
define( 'DB_NAME', $db_name );

/** MySQL database username */
define('DB_USER', 'wp');

/** MySQL database password */
define('DB_PASSWORD', 'wp');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 */
define('AUTH_KEY',         '$[:W]@+,;8d/:5cw;Iam(NZvxVrt{|yA9Xzv0[Gn0^H;:,fD%7_8Nr;_6Nw>9n)-');
define('SECURE_AUTH_KEY',  'C[M T<$Z*yil2*W)Fe=R2aLq%7H{MV_RM+~$7VgoXw3tdhKNwK6+MTe6&i?jj<<r');
define('LOGGED_IN_KEY',    '?Z<gj9.vTCI`EUV1m5|P&@u3V,6bu8AwFTRM2Q}btUtdq.j|AW(s-^}OgCLc/kh%');
define('NONCE_KEY',        'y&7+d:[(T!@zQ#/3rrK~KX,@f_4g{C&L:ag@*24mR +apN<TJXtHVTE58C$$|tAd');
define('AUTH_SALT',        'ry;*4qC^l%<3%UYrm#qyOx[eaW1d&lytY=xbKXXJeE+.X+O%=.|I yH/bnG+4biM');
define('SECURE_AUTH_SALT', 'nFBT.lv5j8[_wZ6S,X_lj3a/5h|MqV&%s9:Y}+;WU+6D&Z|j|MzW3aF~QhH17P~,');
define('LOGGED_IN_SALT',   'BXD3uEA^|ow^LrD4+}`LjG}=.?tT0|7MzM>-Q*$$/`RF+[)[>>fQ+`m842.+E:[4');
define('NONCE_SALT',       '5$e-JUA@<`J:&f+mU=0wyt4N?x|_y&.Is)f4.htkI%B:;:-j4#5|B-co|.dm@C&E');
/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * WordPress Localized Language, defaults to English.
 *
 * Change this to localize WordPress. A corresponding MO file for the chosen
 * language must be installed to wp-content/languages. For example, install
 * de_DE.mo to wp-content/languages and set WPLANG to 'de_DE' to enable German
 * language support.
 */
define('WPLANG', '');

define( 'WP_DEBUG', true );
define( 'SCRIPT_DEBUG', true );
define( 'JETPACK_DEV_DEBUG', true );
define( 'SAVEQUERIES', true );
define( 'DISABLE_WP_CRON', true );
//define( 'WP_DEBUG_LOG', true);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
