name 'mysql-wrapper'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'All Rights Reserved'
description 'Installs/Configures mysql-wrapper'
long_description 'Installs/Configures mysql-wrapper'
version '0.2.0'
chef_version '>= 12.14' if respond_to?(:chef_version)


depends 'mysql', '8.5.1'
depends 'database', '6.1.1'
depends 'mysql2_chef_gem', '2.1.0'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/mysql-wrapper/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/mysql-wrapper'
