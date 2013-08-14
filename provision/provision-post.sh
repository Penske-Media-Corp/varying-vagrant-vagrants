# COMPASS
if [ ! `which compass` ]; then
    gem update --system &&
    gem install sass --version 3.1.1
    gem install compass --version 0.11.1;
fi;

# Base mobile theme for VIP
if [ ! -d /srv/www/wordpress-trunk/wp-content/themes/pub/wp-mobile ]
then
	printf "\nDownloading wp-mobile theme...\n"
	mkdir /srv/www/wordpress-trunk/wp-content/themes/pub
	svn co https://wpcom-themes.svn.automattic.com/wp-mobile/ /srv/www/wordpress-trunk/wp-content/themes/pub/wp-mobile
else
	printf "\nUpdating wp-mobile theme...\n"
	svn up /srv/www/wordpress-trunk/wp-content/themes/pub/wp-mobile
fi

# VIP directory for VIP plugins and themes
if [ ! -d /srv/www/vip ]
then
	printf "\nCreating and linking VIP directory...\n"
	mkdir /srv/www/vip
	ln -sf /srv/www/vip /srv/www/wordpress-trunk/wp-content/themes/vip
fi

# VIP plugins
if [ ! -d /srv/www/vip/plugins ]
then
	printf "\nDownloading WordPress.com VIP plugins...\n"
	if [ ! -f /home/vagrant/.ssh/id_rsa.pub ]
	then
		printf "\nSkipping this step, SSH key has not been created.\n"
	else
		git clone git@bitbucket.org:penskemediacorp/wordpress-vip-plugins.git /srv/www/vip/plugins
	fi
else
	printf "\nUpdating WordPress.com VIP plugins...\n"
	cd /srv/www/vip/plugins
	git pull --rebase origin master
fi

# pmc-plugins
if [ ! -d /srv/www/vip/pmc-plugins ]
then
	printf "\nDownloading pmc-plugins...\n"
	if [ ! -f /home/vagrant/.ssh/id_rsa.pub ]
	then
		printf "\nSkipping this step, SSH key has not been created.\n"
	else
		git clone git@bitbucket.org:penskemediacorp/pmc-plugins.git /srv/www/vip/pmc-plugins
	fi
else
	printf "\nUpdating pmc-plugins...\n"
	cd /srv/www/vip/pmc-plugins
	git pull --rebase origin master
fi

# pmc-variety theme
if [ ! -d /srv/www/vip/pmc-variety ]
then
	printf "\nDownloading pmc-variety theme...\n"
	if [ ! -f /home/vagrant/.ssh/id_rsa.pub ]
	then
		printf "\nSkipping this step, SSH key has not been created.\n"
	else
		git clone git@bitbucket.org:penskemediacorp/pmc-variety.git /srv/www/vip/pmc-variety
	fi
else
	printf "\nUpdating pmc-variety theme...\n"
	cd /srv/www/vip/pmc-variety
	git pull --rebase origin master
fi

# pmc-tvline theme
if [ ! -d /srv/www/vip/pmc-tvline ]
then
	printf "\nDownloading pmc-tvline theme...\n"
	if [ ! -f /home/vagrant/.ssh/id_rsa.pub ]
	then
		printf "\nSkipping this step, SSH key has not been created.\n"
	else
		git clone git@bitbucket.org:penskemediacorp/pmc-tvline.git /srv/www/vip/pmc-tvline
	fi
else
	printf "\nUpdating pmc-tvline theme...\n"
	cd /srv/www/vip/pmc-tvline
	git pull --rebase origin master
fi

# pmc-411 theme
if [ ! -d /srv/www/vip/pmc-411 ]
then
	printf "\nDownloading pmc-411 theme...\n"
	if [ ! -f /home/vagrant/.ssh/id_rsa.pub ]
	then
		printf "\nSkipping this step, SSH key has not been created.\n"
	else
		git clone git@bitbucket.org:penskemediacorp/pmc-411.git /srv/www/vip/pmc-411
	fi
else
	printf "\nUpdating pmc-411 theme...\n"
	cd /srv/www/vip/pmc-411
	git pull --rebase origin master
fi

# pmc-hollywoodlife theme
if [ ! -d /srv/www/vip/pmc-hollywoodlife ]
then
	printf "\nDownloading pmc-hollywoodlife theme...\n"
	if [ ! -f /home/vagrant/.ssh/id_rsa.pub ]
	then
		printf "\nSkipping this step, SSH key has not been created.\n"
	else
		git clone git@bitbucket.org:penskemediacorp/pmc-hollywoodlife.git /srv/www/vip/pmc-hollywoodlife
	fi
else
	printf "\nUpdating pmc-hollywoodlife theme...\n"
	cd /srv/www/vip/pmc-hollywoodlife
	git pull --rebase origin master
fi

# bgr theme
if [ ! -d /srv/www/vip/bgr ]
then
	printf "\nDownloading bgr theme...\n"
	if [ ! -f /home/vagrant/.ssh/id_rsa.pub ]
	then
		printf "\nSkipping this step, SSH key has not been created.\n"
	else
		git clone git@bitbucket.org:penskemediacorp/bgr.git /srv/www/vip/bgr
	fi
else
	printf "\nUpdating bgr theme...\n"
	cd /srv/www/vip/bgr
	git pull --rebase origin master
fi

# pmc-awardsline theme
if [ ! -d /srv/www/vip/pmc-awardsline ]
then
	printf "\nDownloading pmc-awardsline theme...\n"
	if [ ! -f /home/vagrant/.ssh/id_rsa.pub ]
	then
		printf "\nSkipping this step, SSH key has not been created.\n"
	else
		git clone git@bitbucket.org:penskemediacorp/pmc-awardsline.git /srv/www/vip/pmc-awardsline
	fi
else
	printf "\nUpdating pmc-awardsline theme...\n"
	cd /srv/www/vip/pmc-awardsline
	git pull --rebase origin master
fi

# pmc-deadline theme
if [ ! -d /srv/www/vip/pmc-deadline ]
then
	printf "\nDownloading pmc-deadline theme...\n"
	if [ ! -f /home/vagrant/.ssh/id_rsa.pub ]
	then
		printf "\nSkipping this step, SSH key has not been created.\n"
	else
		git clone git@bitbucket.org:penskemediacorp/pmc-deadline.git /srv/www/vip/pmc-deadline
	fi
else
	printf "\nUpdating pmc-deadline theme...\n"
	cd /srv/www/vip/pmc-deadline
	git pull --rebase origin master
fi

# pmc-tvline-mobile theme
if [ ! -d /srv/www/vip/pmc-tvline-mobile ]
then
	printf "\nDownloading pmc-tvline-mobile theme...\n"
	if [ ! -f /home/vagrant/.ssh/id_rsa.pub ]
	then
		printf "\nSkipping this step, SSH key has not been created.\n"
	else
		git clone git@bitbucket.org:penskemediacorp/pmc-tvline-mobile.git /srv/www/vip/pmc-tvline-mobile
	fi
else
	printf "\nUpdating pmc-tvline-mobile theme...\n"
	cd /srv/www/vip/pmc-tvline-mobile
	git pull --rebase origin master
fi

# pmc-master theme
if [ ! -d /srv/www/vip/pmc-master ]
then
	printf "\nDownloading pmc-master theme...\n"
	if [ ! -f /home/vagrant/.ssh/id_rsa.pub ]
	then
		printf "\nSkipping this step, SSH key has not been created.\n"
	else
		git clone git@bitbucket.org:penskemediacorp/pmc-master.git /srv/www/vip/pmc-master
	fi
else
	printf "\nUpdating pmc-master theme...\n"
	cd /srv/www/vip/pmc-master
	git pull --rebase origin master
fi

# Set up shared plugins directory
if [ ! -d /srv/www/wordpress-plugins ]
then
	printf "\nCreating shared plugins directory\n"
	mkdir /srv/www/wordpress-plugins
	rm -rf /srv/www/wordpress-trunk/wp-content/plugins
	rm -rf /srv/www/wordpress-default/wp-content/plugins
	ln -sf /srv/www/wordpress-plugins /srv/www/wordpress-trunk/wp-content/plugins
	ln -sf /srv/www/wordpress-plugins /srv/www/wordpress-default/wp-content/plugins
	svn up /srv/www/wordpress-trunk/wp-content/plugins
	svn up /srv/www/wordpress-default/wp-content/plugins
fi

# Install req'd plugins
if [ ! -d /srv/www/wordpress-plugins/developer ]
then
	wp --path=/srv/www/wordpress-trunk/ plugin install developer --activate
	wp --path=/srv/www/wordpress-default/ plugin activate developer
fi

if [ ! -d /srv/www/wordpress-plugins/jetpack ]
then
	wp --path=/srv/www/wordpress-trunk/ plugin install jetpack --activate
	wp --path=/srv/www/wordpress-default/ plugin activate jetpack
fi

if [ ! -d /srv/www/wordpress-plugins/debug-bar ]
then
	wp --path=/srv/www/wordpress-trunk/ plugin install debug-bar --activate
	wp --path=/srv/www/wordpress-default/ plugin activate debug-bar
fi

if [ ! -d /srv/www/wordpress-plugins/debug-bar-console ]
then
	wp --path=/srv/www/wordpress-trunk/ plugin install debug-bar-console --activate
	wp --path=/srv/www/wordpress-default/ plugin activate debug-bar-console
fi

if [ ! -d /srv/www/wordpress-plugins/debug-bar-cron ]
then
	wp --path=/srv/www/wordpress-trunk/ plugin install debug-bar-cron --activate
	wp --path=/srv/www/wordpress-default/ plugin activate debug-bar-cron
fi

if [ ! -d /srv/www/wordpress-plugins/debug-bar-extender ]
then
	wp --path=/srv/www/wordpress-trunk/ plugin install debug-bar-extender --activate
	wp --path=/srv/www/wordpress-default/ plugin activate debug-bar-extender
fi

if [ ! -d /srv/www/wordpress-plugins/debug-bar-super-globals ]
then
	wp --path=/srv/www/wordpress-trunk/ plugin install debug-bar-super-globals --activate
	wp --path=/srv/www/wordpress-default/ plugin activate debug-bar-super-globals
fi

if [ ! -d /srv/www/wordpress-plugins/log-deprecated-notices ]
then
	wp --path=/srv/www/wordpress-trunk/ plugin install log-deprecated-notices --activate
	wp --path=/srv/www/wordpress-default/ plugin activate log-deprecated-notices
fi

if [ ! -d /srv/www/wordpress-plugins/log-viewer ]
then
	wp --path=/srv/www/wordpress-trunk/ plugin install log-viewer --activate
	wp --path=/srv/www/wordpress-default/ plugin activate log-viewer
fi

if [ ! -d /srv/www/wordpress-plugins/mp6 ]
then
	wp --path=/srv/www/wordpress-trunk/ plugin install mp6 --activate
	wp --path=/srv/www/wordpress-default/ plugin activate mp6
fi

if [ ! -d /srv/www/wordpress-plugins/polldaddy ]
then
	wp --path=/srv/www/wordpress-trunk/ plugin install polldaddy --activate
	wp --path=/srv/www/wordpress-default/ plugin activate polldaddy
fi

if [ ! -d /srv/www/wordpress-plugins/rewrite-rules-inspector ]
then
	wp --path=/srv/www/wordpress-trunk/ plugin install rewrite-rules-inspector --activate
	wp --path=/srv/www/wordpress-default/ plugin activate rewrite-rules-inspector
fi

if [ ! -d /srv/www/wordpress-plugins/user-switching ]
then
	wp --path=/srv/www/wordpress-trunk/ plugin install user-switching --activate
	wp --path=/srv/www/wordpress-default/ plugin activate user-switching
fi

if [ ! -d /srv/www/wordpress-plugins/vip-scanner ]
then
	wp --path=/srv/www/wordpress-trunk/ plugin install vip-scanner --activate
	wp --path=/srv/www/wordpress-default/ plugin activate vip-scanner
fi

if [ ! -d /srv/www/wordpress-plugins/wordpress-importer ]
then
	wp --path=/srv/www/wordpress-trunk/ plugin install wordpress-importer --activate
	wp --path=/srv/www/wordpress-default/ plugin activate wordpress-importer
fi

if [ ! -d /srv/www/wordpress-plugins/auto-mobile-theme-switcher ]
then
	wp --path=/srv/www/wordpress-trunk/ plugin install auto-mobile-theme-switcher --activate
fi