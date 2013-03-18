execute "apt_update" do
 command "apt-get update"
 action :run
end

packages = %w(
  curl
  build-essential
  libyaml-dev
  libxml2
  libxml2-dev
  libxslt1-dev
)

packages.each do |p|
  package p do
    action :install
  end
end
