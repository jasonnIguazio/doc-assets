########################################
## URL Redirects - root directory of the docs-dev staging site (non-versioned)
# [ci-redirect] [InfraInfo] See gulpfile.js in the doc-site repo.

# [InfraInfo] (sharonl) The source URL starts with "/docs-dev" => RedirectMatch
# with a starts-with rule should begin with "^/docs-dev/".

#///////////////////////////////////////
# Redirect old versioned sections URLs (<section>/latest-release/* or
# <section>/vX.Y/* > latest-release/)
RedirectMatch 301 ^/(docs-dev/[^/]+)/v[0-9](|/.*)$ https://igzdocsdev.wpengine.com/$1/latest-release/$2

#///////////////////////////////////////
# Redirect obsolete docs-archive URLs
RedirectMatch 301 ^/docs-archive(|/.*)$ https://igzdocsdev.wpengine.com/docs-dev/latest-release/

#///////////////////////////////////////
# Redirect latest-release version-number URLs (/v<X.Y/X.Y.Z (latest release)>/*
# > /latest-release/*)
# [TODO-NEW-VER] Update the hardcoded version number in the source URL.
RedirectMatch 301 ^/(docs-dev)/v2.5(\.[0-9]|)(|/.*)$ https://igzdocsdev.wpengine.com/$1/latest-release/$3

#///////////////////////////////////////
## Relocated-Pages Redirects
# [ci-redirect-from-ver-site] [InfraInfo] See gulpfile.js in the doc-site repo.

#---------------------------------------
## Temporarily Removed Pages
# [c-arch-page-update] See the IntInfo in the architecture.md intro page.
RedirectMatch 301 ^/(docs-dev/[^/]+)/intro/architecture.*$ https://www.igzdocsdev.wpengine.com/$1

#---------------------------------------
## Pages Removed for v2.5.4 and v2.3.1 Post Publication

# Trial-QS tutorials GS page (consolidated with the tutorial QS index page)
RedirectMatch 301 ^/(docs-dev/[^/]+/tutorials/getting-started/trial-qs/)overview(/|)(.*)$ https://igzdocsdev.wpengine.com/$1$2$3

# Additional-resources" tutorials GS page (moved to an introduction section)
RedirectMatch 301 ^/(docs-dev/[^/]+)/tutorials/getting-started/(additional-resources).*$ https://igzdocsdev.wpengine.com/$1/intro/introduction/#$2
