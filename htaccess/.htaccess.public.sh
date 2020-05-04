########################################
## URL Redirects - root directory of the public doc site (non-versioned)
# [ci-redirect] [InfraInfo] See gulpfile.js in the doc-site repo.

# [InfraInfo] (sharonl) The source URL starts with "/docs" => RedirectMatch
# with a starts-with rule should begin with "^/docs".

#///////////////////////////////////////
# Redirect old versioned sections URLs (<section>/latest-release/* or
# <section>/vX.Y/* > latest-release/)
RedirectMatch 301 ^/(docs/[^/]+)/v[0-9](|/.*)$ https://www.iguazio.com/$1/latest-release/$2

#///////////////////////////////////////
# Redirect obsolete docs-archive URLs
RedirectMatch 301 ^/docs-archive(|/.*)$ https://www.iguazio.com/docs/latest-release/

#///////////////////////////////////////
# Redirect latest-release version-number URLs (/v<X.Y/X.Y.Z (latest release)>/*
# > /latest-release/*)
# [TODO-NEW-VER] Update the hardcoded version number in the source URL.
RedirectMatch 301 ^/(docs)/v2.5(\.[0-9]|)(|/.*)$ https://www.iguazio.com/$1/latest-release/$3

#///////////////////////////////////////
## Relocated-Pages Redirects
# [ci-redirect-from-ver-site] [InfraInfo] See gulpfile.js in the doc-site repo.

#---------------------------------------
## Temporarily Removed Pages
# [c-arch-page-update] See the IntInfo in the architecture.md intro page.
RedirectMatch 301 ^/(docs/[^/]+)/intro/architecture.*$ https://www.iguazio.com/$1

#---------------------------------------
## Pages Removed for v2.5.4 and v2.3.1 Post Publication

# Trial-QS tutorials GS page (consolidated with the tutorial QS index page)
RedirectMatch 301 ^/(docs/[^/]+/tutorials/getting-started/trial-qs/)overview(/|)(.*)$ https://www.iguazio.com/$1$2$3

# Additional-resources" tutorials GS page (moved to an introduction section)
RedirectMatch 301 ^/(docs/[^/]+)/tutorials/getting-started/(additional-resources).*$ https://www.iguazio.com/$1/intro/introduction/#$2
