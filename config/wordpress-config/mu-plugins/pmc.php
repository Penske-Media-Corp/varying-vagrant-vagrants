<?php
add_filter( 'plugins_url', function( $url ) {
	$url = str_replace( WP_PLUGIN_DIR, '', $url );
	return str_replace( '/plugins/srv/www/vip/', '/themes/vip/', $url );
} );

add_action( 'muplugins_loaded', function() {
	if ( WP_DEBUG ) {
		error_reporting( E_ALL & ~E_STRICT );
	}
} );

//EOF
