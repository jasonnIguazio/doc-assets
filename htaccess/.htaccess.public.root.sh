# BEGIN WP Rocket v3.5.4
# Use UTF-8 encoding for anything served text/plain or text/html
AddDefaultCharset UTF-8
# Force UTF-8 for a number of file formats
<IfModule mod_mime.c>
AddCharset UTF-8 .atom .css .js .json .rss .vtt .xml
</IfModule>
# FileETag None is not enough for every server.
<IfModule mod_headers.c>
Header unset ETag
</IfModule>
# Since we’re sending far-future expires, we don’t need ETags for static content.
# developer.yahoo.com/performance/rules.html#etags
FileETag None
<IfModule mod_alias.c>
<FilesMatch "\.(html|htm|rtf|rtx|txt|xsd|xsl|xml)$">
<IfModule mod_headers.c>
Header set X-Powered-By "WP Rocket/3.5.4"
Header unset Pragma
Header append Cache-Control "public"
Header unset Last-Modified
</IfModule>
</FilesMatch>
<FilesMatch "\.(css|htc|js|asf|asx|wax|wmv|wmx|avi|bmp|class|divx|doc|docx|eot|exe|gif|gz|gzip|ico|jpg|jpeg|jpe|json|mdb|mid|midi|mov|qt|mp3|m4a|mp4|m4v|mpeg|mpg|mpe|mpp|otf|odb|odc|odf|odg|odp|ods|odt|ogg|pdf|png|pot|pps|ppt|pptx|ra|ram|svg|svgz|swf|tar|tif|tiff|ttf|ttc|wav|wma|wri|xla|xls|xlsx|xlt|xlw|zip)$">
<IfModule mod_headers.c>
Header unset Pragma
Header append Cache-Control "public"
</IfModule>
</FilesMatch>
</IfModule>
# Expires headers (for better cache control)
<IfModule mod_expires.c>
	ExpiresActive on
	# Perhaps better to whitelist expires rules? Perhaps.
	ExpiresDefault                              "access plus 1 month"
	# cache.appcache needs re-requests in FF 3.6 (thanks Remy ~Introducing HTML5)
	ExpiresByType text/cache-manifest           "access plus 0 seconds"
	# Your document html
	ExpiresByType text/html                     "access plus 0 seconds"
	# Data
	ExpiresByType text/xml                      "access plus 0 seconds"
	ExpiresByType application/xml               "access plus 0 seconds"
	ExpiresByType application/json              "access plus 0 seconds"
	# Feed
	ExpiresByType application/rss+xml           "access plus 1 hour"
	ExpiresByType application/atom+xml          "access plus 1 hour"
	# Favicon (cannot be renamed)
	ExpiresByType image/x-icon                  "access plus 1 week"
	# Media: images, video, audio
	ExpiresByType image/gif                     "access plus 4 months"
	ExpiresByType image/png                     "access plus 4 months"
	ExpiresByType image/jpeg                    "access plus 4 months"
	ExpiresByType image/webp                    "access plus 4 months"
	ExpiresByType video/ogg                     "access plus 1 month"
	ExpiresByType audio/ogg                     "access plus 1 month"
	ExpiresByType video/mp4                     "access plus 1 month"
	ExpiresByType video/webm                    "access plus 1 month"
	# HTC files  (css3pie)
	ExpiresByType text/x-component              "access plus 1 month"
	# Webfonts
	ExpiresByType font/ttf                      "access plus 4 months"
	ExpiresByType font/otf                      "access plus 4 months"
	ExpiresByType font/woff                     "access plus 4 months"
	ExpiresByType font/woff2                    "access plus 4 months"
	ExpiresByType image/svg+xml                 "access plus 1 month"
	ExpiresByType application/vnd.ms-fontobject "access plus 1 month"
	# CSS and JavaScript
	ExpiresByType text/css                      "access plus 1 year"
	ExpiresByType application/javascript        "access plus 1 year"
</IfModule>
# Gzip compression
<IfModule mod_deflate.c>
# Active compression
SetOutputFilter DEFLATE
# Force deflate for mangled headers
<IfModule mod_setenvif.c>
<IfModule mod_headers.c>
SetEnvIfNoCase ^(Accept-EncodXng|X-cept-Encoding|X{15}|~{15}|-{15})$ ^((gzip|deflate)\s*,?\s*)+|[X~-]{4,13}$ HAVE_Accept-Encoding
RequestHeader append Accept-Encoding "gzip,deflate" env=HAVE_Accept-Encoding
# Don’t compress images and other uncompressible content
SetEnvIfNoCase Request_URI \
\.(?:gif|jpe?g|png|rar|zip|exe|flv|mov|wma|mp3|avi|swf|mp?g|mp4|webm|webp|pdf)$ no-gzip dont-vary
</IfModule>
</IfModule>
# Compress all output labeled with one of the following MIME-types
<IfModule mod_filter.c>
AddOutputFilterByType DEFLATE application/atom+xml \
		                          application/javascript \
		                          application/json \
		                          application/rss+xml \
		                          application/vnd.ms-fontobject \
		                          application/x-font-ttf \
		                          application/xhtml+xml \
		                          application/xml \
		                          font/opentype \
		                          image/svg+xml \
		                          image/x-icon \
		                          text/css \
		                          text/html \
		                          text/plain \
		                          text/x-component \
		                          text/xml
</IfModule>
<IfModule mod_headers.c>
Header append Vary: Accept-Encoding
</IfModule>
</IfModule>
# END WP Rocket
# BEGIN WordPress
# The directives (lines) between `BEGIN WordPress` and `END WordPress` are
# dynamically generated, and should only be modified via WordPress filters.
# Any changes to the directives between these markers will be overwritten.
<IfModule mod_rewrite.c>
RewriteEngine On
RewriteBase /
RewriteRule ^index\.php$ - [L]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule . /index.php [L]
</IfModule>

# END WordPress

# Trim extra slashes (/) in the path
RewriteCond %{THE_REQUEST} //
RewriteRule ^.*$ $0 [R=302,L,NE]

####################
## Doc-Site Redirects

## docs-archive/* or techpreview/* > docs/*
# [ci-docs-archive-redirects] [ci-techpreview-redirects]
# [InfraInfo] (Restructured URL versioning and obsolete-pages redirects are
# handled from docs/.htaccess using the new URLs from the following redirect.
RedirectMatch 301 ^/(docs-archive|techpreview)(|/.*)$ https://www.iguazio.com/docs/$2

## Obsolete Temporary Draft-Sites Redirects
## doc-drafts/vm-install/ - V2.10.0 latest-release VM-installation draft site
# (23.11.20) Replaced with public on-prem VM installation docs (doc-site PR
# #2226). TODO: Remove the redirect rule after an adjustment period for
# customers who had used the draft site.
RedirectMatch 301 ^/doc-drafts/vm-install(|/.*)$ https://www.iguazio.com/docs/latest-release/$1

## Docs home (base doc-site URL) > latest-release/ home
RedirectMatch 301 ^/(docs)(/|)$ https://www.iguazio.com/$1/latest-release/

