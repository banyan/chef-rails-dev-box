name              "sqlite"
maintainer        "Opscode, Inc."
maintainer_email  "cookbooks@opscode.com"
license           "Apache 2.0"
description       "Installs sqlite"
version           "1.0.0"

recipe "sqlite", "Installs sqlite"

%w{ubuntu debian centos redhat scientific oracle amazon fedora}.each do |os|
  supports os
end
